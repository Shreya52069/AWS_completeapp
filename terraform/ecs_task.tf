resource "aws_ecs_task_definition" "ecs_task_definition" {
 family             = "my-ecs-task"
 network_mode       = "awsvpc"
 execution_role_arn = "arn:aws:iam::069855211811:role/ecsTaskExecutionRole"
 cpu                = 512
 runtime_platform {
   operating_system_family = "LINUX"
   cpu_architecture        = "X86_64"
 }
 container_definitions = jsonencode([
   {
     name      = "dockergs"
     image     = "069855211811.dkr.ecr.ap-south-1.amazonaws.com/testrepo"
     cpu       = 0
     memory    = 512
     essential = true
     portMappings = [
       {
         containerPort = 8080
         hostPort      = 8080
         protocol      = "tcp"
         appProtocol   = "http"
       }
     ]
   }
 ])
}