module CameoParquet

export greet, read_parquet, to_parquet, to_datetime!, to_string!

greet() = print("Hello World! 21:26")

using PyCall,DataFrames
import Pandas,Dates

function read_parquet(str_filename,ary_columns=nothing)
    pd=PyCall.pyimport("pandas")
    df_pandas=pd.read_parquet(str_filename,columns=ary_columns)
    df_julia=DataFrames.DataFrame()
    i=0;while i<=length(df_pandas.columns)
        str_column=df_pandas.columns[i]
        df_julia[Symbol(str_column)]=df_pandas[str_column].values
    i+=1;end
    return df_julia
end

function to_parquet(str_filename,df_julia,str_compression="gzip")
    pd.DataFrame(Pandas.DataFrame(df_julia)).to_parquet(str_filename,compression=str_compression)
end

function to_datetime!(df_julia,str_column)
    #convert numpy datetime64 to julia datetime
    df_julia[Symbol(str_column)]=Dates.unix2datetime.(convert.(Int64,df_julia[Symbol("time")])./1000000000)
    return df_julia
end

function to_string!(df_julia,str_column)
    #convert PyObject to julia String
    df_julia[Symbol(str_column)]=convert.(String,df_julia[Symbol(str_column)])
    return df_julia
end

end # module
