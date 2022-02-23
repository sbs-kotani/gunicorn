git clone https://github.com/�e����github��/postingprj.git
python3 -m venv env
source env/bin/activate

pip install --upgrade pip
pip install django
pip install django_bootstrap5
pip install pillow
pip install gunicorn

cd postingprj
python manage.py runserver
�@�@���@SQLite�̃G���[

nano ~/.bash_profile
�@�@��ԍŌ�Ɂ@export LD_LIBRARY_PATH="/usr/local/lib"  �����
source ~/.bash_profile

nano postingprj/settings.py
	ALLOWED_HOSTS = [�g*�h]�@�ɕύX
	STATICFILES_DIRS = [os.path.join(BASE_DIR, �estatic�f)]�@���폜���A�ȉ��ɕύX
	STATIC_ROOT = '/usr/share/nginx/html/static�f
	�ȉ���ǉ�
	MEDIA_ROOT = '/usr/share/nginx/html/media'
	
nano postingprj/urls.py
	urlpatterns = [
		path(�esbsN/admin/', admin.site.urls),
		path(�esbsN/', top, name='top'),
		path(�esbsN/postingapp/', include('postingapp.urls')),
	] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT) \
	  + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)

cd ..
sudo cp -r postingprj/media /usr/share/nginx/html
sudo cp -r postingprj/static /usr/share/nginx/html
cd postingprj
gunicorn --bind 127.0.0.1:800N postingprj.wsgi

http://49.212.137.6/sbsN/
	�ŏ��̋N�����̂݃G���[�ƂȂ�̂ňȉ���ǉ�
	http://49.212.137.6/sbsN/postingapp/login/?next=/sbs3/

