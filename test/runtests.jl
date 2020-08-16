println("CameoParquet.jl run tests!")
using CameoParquet

function test_read_parquet()
    str_url="http://storage.googleapis.com/cameo_aqi/data/table"*
        "%3A%E5%9C%8B%E5%AE%B6%E6%A8%99%E6%BA%96%E7%AB%99_%E6%AF%8F%E6%97%A5_%E5%B0%8F%E6%99%82%E5%80%BC/"*
        "table%3A%E5%9C%8B%E5%AE%B6%E6%A8%99%E6%BA%96%E7%AB%99_%E6%AF%8F%E6%97%A5_%E5%B0%8F%E6%99%82%E5%80%BC%2Cday%3A2020-08-15.parquet"
    df=read_parquet(str_url)
end
test_read_parquet()
println("Life is great!")
