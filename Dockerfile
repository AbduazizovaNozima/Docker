#Python muhitini import qilamiz
FROM python:3.11-slim

#Docker ichida loyiha ishlashi uchun katalog
WORKDIR /app

#Konteyner ichiga requirementsni import qilamiz
COPY requirements.txt /app/

#Kerakli kurubxonalarni ornatamiz
RUN pip install --no-cache-dir -r requirements.txt

#Django loyihamizni konteynerga o'takazamiz
COPY . /app/

ENV PYTHONUNBUFFERED=1

#Dasturchilar uchun ishora qaysi portda ishlashi togrisida
EXPOSE 8000

#Docker ichida ishga tushirish komandasi
CMD ["bash", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]








