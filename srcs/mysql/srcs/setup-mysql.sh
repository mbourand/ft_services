until mysql
do
	echo -n "" > /dev/null
done

echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password && \
echo "CREATE USER 'wordpress_user'@'%' IDENTIFIED BY 'password';" | mysql -u root --skip-password && \
echo "GRANT ALL ON wordpress.* TO 'wordpress_user'@'%' IDENTIFIED BY 'password';" | mysql -u root --skip-password && \
echo "CREATE DATABASE phpmyadmin" | mysql -u root --skip-password && \
echo "CREATE USER 'pma'@'%' IDENTIFIED BY 'pmapass';" | mysql -u root --skip-password && \
echo "GRANT ALL ON phpmyadmin.* TO 'pma'@'%' IDENTIFIED BY 'password';" | mysql -u root --skip-password && \
echo "GRANT ALL ON wordpress.* TO 'pma'@'%' IDENTIFIED BY 'password';" | mysql -u root --skip-password && \
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
