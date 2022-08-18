resource "docker_conytainer" "index"{
  name= "index"
  image = "josuercb/proyecto02"
  
  ports{
    internal=80
    external=84
  }
}
