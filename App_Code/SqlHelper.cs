using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Text;

public class SqlHelper : IDisposable
{
    #region Private Members
    private SqlConnection connection;
    private SqlCommand command;
    #endregion

   

    #region Properties
    public int ConnectionTimeout
    {
        get { return command.CommandTimeout; }
        set { command.CommandTimeout = value; }
    }



    public SqlParameterCollection Parameters
    {
        get { return command.Parameters; }
    }

    public SqlCommand SqlCommand
    {
        get { return command; }
    }
    #endregion

    #region Constructors
   

    public SqlHelper()
    {
        connection = new SqlConnection(ConfigurationManager.ConnectionStrings["myConnectionString"].ToString());
        command = new SqlCommand();
    }
    #endregion

    #region Public Members
    public bool ExecuteNonQuerySQLProc(string procedureName)
    {
        command.CommandText = procedureName;
        command.CommandType = CommandType.StoredProcedure;
        bool returnval = true;
        try
        {
            if (connection.State != ConnectionState.Open)
            {
                connection.Open();
            }

            command.Connection = connection;
            command.ExecuteNonQuery();
        }
        catch
        {
            returnval = false;
        }
        finally
        {
            this.Kill();
        }

        return returnval;
    }

    public bool ExecuteNonQuerySQLText(string sqltext)
    {
        command.CommandText = sqltext;
        command.CommandType = CommandType.Text;
        bool returnval = true;
        try
        {
            if (connection.State != ConnectionState.Open)
            {
                connection.Open();
            }

            command.Connection = connection;
            command.ExecuteNonQuery();
        }
        catch (Exception e)
        {
            returnval = false;
        }
        finally
        {
            this.Kill();
        }

        return returnval;
    }

    public object ExecuteScalarSQLText(string sqltext)
    {
        command.CommandText = sqltext;
        command.CommandType = CommandType.Text;
        object result;
        try
        {
            if (connection.State != ConnectionState.Open)
            {
                connection.Open();
            }

            command.Connection = connection;
            result = command.ExecuteScalar();
        }
        catch (Exception ex)
        {
            this.Kill();
            throw ex;
        }
        finally
        {
            this.Kill();
        }
        return result;
    }

    public object ExecuteScalarSQLProc(string procedureName)
    {
        command.CommandText = procedureName;
        object result;
        try
        {
            if (connection.State != ConnectionState.Open)
            {
                connection.Open();
            }

            command.Connection = connection;
            result = command.ExecuteScalar();
        }
        catch (Exception ex)
        {
            this.Kill();
            throw ex;
        }
        finally
        {
            this.Kill();
        }

        return result;
    }

    public SqlParameterCollection ExecuteStoredProcedure(string procedureName)
    {
        if (command.Parameters.Count < 1)
        {
            //error 
        }

        command.CommandText = procedureName;
        command.CommandType = CommandType.StoredProcedure;
        try
        {
            if (connection.State != ConnectionState.Open)
            {
                connection.Open();
            }

            command.Connection = connection;
            int result = command.ExecuteNonQuery();
            this.Kill();
        }
        catch (Exception ex)
        {
            this.Kill();
            throw ex;
        }

        return command.Parameters;

    }

    public SqlDataReader ReturnDataReaderFromSproc(string procedureName)
    {
        command.CommandText = procedureName;
        SqlDataReader objSqlDataReader;

        try
        {
            if (connection.State != ConnectionState.Open)
            {
                connection.Open();
            }

            command.Connection = connection;
            objSqlDataReader = command.ExecuteReader();
        }
        catch (Exception ex)
        {
            this.Kill();
            throw ex;
        }

        return objSqlDataReader;
    }

    public SqlDataReader ReturnDataReaderFromSQLText(string sqltext)
    {
        command.CommandText = sqltext;
        command.CommandType = CommandType.Text;

        SqlDataReader objSqlDataReader;
        try
        {
            if (connection.State != ConnectionState.Open)
                connection.Open();

            command.Connection = connection;
            objSqlDataReader = command.ExecuteReader();
        }
        catch (Exception ex)
        {
            this.Kill();
            throw ex;
        }
        return objSqlDataReader;
    }

    public DataSet ReturnDataSetFromSproc(string procedureName)
    {
        command.CommandText = procedureName;
        SqlDataAdapter objDataAdapter;
        DataSet objDataSet = new DataSet();

        try
        {
            if (connection.State != ConnectionState.Open)
                connection.Open();
            command.Connection = connection;
            objDataAdapter = new SqlDataAdapter(command);
            objDataAdapter.Fill(objDataSet, "table1");
            this.Kill();
            return objDataSet;
        }

        catch (Exception ex)
        {
            this.Kill();
            throw ex;
        }
    }

    public DataSet ReturnDataSetFromSqlText(string sqlText)
    {
        command.CommandText = sqlText;
        command.CommandType = CommandType.Text;

        SqlDataAdapter objDataAdapter;
        DataSet objDataSet = new DataSet();

        try
        {
            if (connection.State != ConnectionState.Open)
                connection.Open();

            command.Connection = connection;

            objDataAdapter = new SqlDataAdapter(command);
            objDataAdapter.Fill(objDataSet, "table1");
            this.Kill();
            return objDataSet;
        }

        catch (Exception ex)
        {
            this.Kill();
            throw ex;
        }
    }

    public void Kill()
    {
        if (connection.State == ConnectionState.Open)
        {
            connection.Close();
        }
        command.Dispose();
    }

   
    #endregion

    #region IDisposable Members

    void IDisposable.Dispose()
    {
        Kill();
    }

    #endregion
}

