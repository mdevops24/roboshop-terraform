output "vpc_id" {
    value   = aws_vpc.main.id
}

output  "public_subnet_ids" {
    value   = aws_subnet.public.*.ids
}


output  "app_subnet_ids" {
    value   = aws_subnet.app.*.ids
}


output  "web_subnet_ids" {
    value   = aws_subnet.web.*.ids
}


output  "db_subnet_ids" {
    value   = aws_subnet.db.*.ids
}