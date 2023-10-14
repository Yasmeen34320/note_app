validInput(String val ,int min,int max)
{
  if(val.length==0)
    {
      return "it is required";
    }else if(val.length<min){
    return "its less than $min";
  }else if (val.length>max)
    {
      return "its more than $max";
    }
}