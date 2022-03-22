git clone https://github.com/各自のgithub名/postingprj.git  
python3 -m venv env  
source env/bin/activate  

pip install --upgrade pip  
pip install django  
pip install django_bootstrap5  
pip install pillow  
pip install gunicorn  

cd postingprj  
python manage.py runserver  
　　→　SQLiteのエラー  

nano ~/.bash_profile  
　　一番最後に　export LD_LIBRARY_PATH="/usr/local/lib"  を入力  
source ~/.bash_profile  

nano postingprj/settings.py  
	ALLOWED_HOSTS = [“*”]　に変更  
	STATICFILES_DIRS = [os.path.join(BASE_DIR, ‘static’)]　を削除し、以下に変更  
	STATIC_ROOT = '/usr/share/nginx/html/static'  
	以下を追加  
	MEDIA_ROOT = '/usr/share/nginx/html/media'  
	
nano postingprj/urls.py
	urlpatterns = [
		path(‘sbsN/admin/', admin.site.urls),
		path(‘sbsN/', top, name='top'),
		path(‘sbsN/postingapp/', include('postingapp.urls')),
	] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT) \
	  + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)

cd ..
sudo cp -r postingprj/media /usr/share/nginx/html
sudo cp -r postingprj/static /usr/share/nginx/html
cd postingprj
gunicorn --bind 127.0.0.1:800N postingprj.wsgi

http://49.212.137.6/sbsN/
	最初の起動時のみエラーとなるので以下を追加
	http://49.212.137.6/sbsN/postingapp/login/?next=/sbs3/


