`` terraform init `` # kod bloğu oluşturulduktan sonra .tf dosyasının olduğu yerde gerekli plugin ve conf.dosyalarını çeker.

`` terraform plan ``  # kaynaklar oluşmadan önce yapılacak işlemlere gözatmak için kullanılır.(optional dır)(+ oluşturulacak, - silinecek, ~ düzeltilecek anlamına gelir.)

`` terraform apply `` # gerekli kurulumları yapmak için kullanılır ve bu komuttan sonra kaynaklar oluşturulur.

`` terraform apply --auto-approve `` # terraform apply ile aynıdır tek farkı bize soru sormadan hepsini kurmasını sağlar.

`` terraform validate `` # .tf dosyamızda herhangi bir yazım hatası vs. varsa bize gösterir ve did you mean blabla? olarak doğru kaynağı gösterir.

`` terraform fmt `` # .tf dosyasının daha düzgün ve okunaklı olması için gereksiz boşluk vs.leri kaldırır.

`` terraform destroy `` # oluşan kaynakları silmek için bu komutu uyguluyoruz.

`` terraform state list `` # Bu komutla hangi kaynakların oluşturulduğunu özet olarak görebiliriz.

`` terraform show `` # Bu komutla her kaynağın özelliklerini okunaklı bir çıktıyla gösterir.

`` terraform graph `` # Bu komutla oluşan kaynakları görsel olarak izleyebiliriz.komutu çalıştırıp çıktıyı https://dreampuf.github.io/GraphvizOnline adrsninin sol tarafına kopyalıyoruz.

`` terraform console `` # bununla interaktif bir komut satırı açılır ve herhangi bir değer görmek için kullanılır.örn: aws_instance.my_ec2.public_ip

`` terraform destroy -target aws_instance.instance_ismi `` # belirlenen kaynağı silmek için kullanılır.

`` terraform apply -target aws_instance.instance_ismi `` # yine aynı şekilde apply ile belirli kaynağı oluşturabiliriz.

## Variable ##
variables.tf oluşturup içine variable ler atayarak bu değerleri bu dosyadan aşağıdaki gibi kodumuza çekebiliriz.
Variable’lar neden kullanılır? Başlıca sebepleri şunlardır:

+ Gizli olması gereken bilgileri saklamak (AWS credentials gibi).
+ Değişme ihtimali olan bilgileri rahat kullanmak (AMI’ler region’a göre değişiklik gösterir).
+ Hazır variable’ları tekrar ve kolayca kullanmak.
Yaygın kullanım variable blokları halinde farklı bir variable.tf file’ı içinde kullanılabilir.
Aynı klasör içinde farklı bir variable.tf içerisinde değişkenler hazırlayabileceğimiz gibi aynı main.tf içinde de olabilir.Bu kullanımda artık herhangi bir değer değiştirmek istenirse ana dosyaya hiç dokunmamıza gerek kalmayacak. Variable içinde optional olan 2 değer daha eklenebilir. Birincisi type, ikincisi description. Description kullanımı best practice’dir. Type olarak, `` string, number, bool, list, map, object, tuple `` destekler.

+ var.<name>                              variable "instance_type" {
                                               description = "ec2 instance type"
                                               type        = string
                                               default     = "t2.micro"
                                           }
## Output Variables ##
Biz kodumuz daha okunaklı olsun diye output, variable gibi blokları ayrı file’lara yazarız. Demek istediğim ister ana çalıştığınız resource oluşturduğunuz sayfaya ekleyin ister ayrı file yapın farketmez. Ama best-pratice ayrı file olmasıdır. Kullanım şekli aşağıdaki gibidir.

  output "instance_ip_address" {
    value = aws_instance.instancename.public_ip
}


sadece output ları göstermesi için. ``terraform output`` komutunu
