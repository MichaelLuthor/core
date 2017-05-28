<?php

/**
 * This configuration file is only provided to document the different
 * configuration options and their usage.
 *
 * DO NOT COMPLETELY BASE YOUR CONFIGURATION FILE ON THIS SAMPLE. THIS MAY BREAK
 * YOUR INSTANCE. Instead, manually copy configuration switches that you
 * consider important for your instance to your working ``config.php``, and
 * apply configuration options that are pertinent for your instance.
 *
 * This file is used to generate the configuration documentation.
 * Please consider following requirements of the current parser:
 *  * all comments need to start with `/**` and end with ` *\/` - each on their
 *    own line
 *  * add a `@see CONFIG_INDEX` to copy a previously described config option
 *    also to this line
 *  * everything between the ` *\/` and the next `/**` will be treated as the
 *    config option
 *  * use RST syntax
 */

$CONFIG = array(
'instanceid' => '',
'passwordsalt' => '',
'trusted_domains' =>
  array (
    'demo.example.org',
    'otherdomain.example.org',
  ),
'datadirectory' => '/var/www/owncloud/data',
'version' => '',
'version.hide' => false,
'dbtype' => 'sqlite',
'dbhost' => '',
'dbname' => 'owncloud',
'dbuser' => '',
'dbpassword' => '',
'dbtableprefix' => '',
'installed' => false,
'default_language' => 'en',
'defaultapp' => 'files',
'knowledgebaseenabled' => true,
'enable_avatars' => true,
'allow_user_to_change_display_name' => true,
'remember_login_cookie_lifetime' => 60*60*24*15,
'session_lifetime' => 60 * 60 * 24,
'session_keepalive' => true,
'token_auth_enforced' => false,
'login.alternatives' => [],
'csrf.disabled' => false,
'skeletondirectory' => '/path/to/owncloud/core/skeleton',
'user_backends' => array(
	array(
		'class' => 'OC_User_IMAP',
		'arguments' => array('{imap.gmail.com:993/imap/ssl}INBOX')
	)
),
'lost_password_link' => 'https://example.org/link/to/password/reset',

/**
 * Allow medial search on account properties like display name, user id, email,
 * and other search terms. Allows finding 'Alice' when searching for 'lic'.
 * May slow down user search.
 */
'accounts.enable_medial_search' => false,

/**
 * Mail Parameters
 *
 * These configure the email settings for ownCloud notifications and password
 * resets.
 */

/**
 * The return address that you want to appear on emails sent by the ownCloud
 * server, for example ``oc-admin@example.com``, substituting your own domain,
 * of course.
 */
'mail_domain' => 'example.com',

/**
 * FROM address that overrides the built-in ``sharing-noreply`` and
 * ``lostpassword-noreply`` FROM addresses.
 */
'mail_from_address' => 'owncloud',

/**
 * Enable SMTP class debugging.
 */
'mail_smtpdebug' => false,

/**
 * Which mode to use for sending mail: ``sendmail``, ``smtp``, ``qmail`` or
 * ``php``.
 *
 * If you are using local or remote SMTP, set this to ``smtp``.
 *
 * If you are using PHP mail you must have an installed and working email system
 * on the server. The program used to send email is defined in the ``php.ini``
 * file.
 *
 * For the ``sendmail`` option you need an installed and working email system on
 * the server, with ``/usr/sbin/sendmail`` installed on your Unix system.
 *
 * For ``qmail`` the binary is /var/qmail/bin/sendmail, and it must be installed
 * on your Unix system.
 */
'mail_smtpmode' => 'sendmail',

/**
 * This depends on ``mail_smtpmode``. Specify the IP address of your mail
 * server host. This may contain multiple hosts separated by a semi-colon. If
 * you need to specify the port number append it to the IP address separated by
 * a colon, like this: ``127.0.0.1:24``.
 */
'mail_smtphost' => '127.0.0.1',

/**
 * This depends on ``mail_smtpmode``. Specify the port for sending mail.
 */
'mail_smtpport' => 25,

/**
 * This depends on ``mail_smtpmode``. This sets the SMTP server timeout, in
 * seconds. You may need to increase this if you are running an anti-malware or
 * spam scanner.
 */
'mail_smtptimeout' => 10,

/**
 * This depends on ``mail_smtpmode``. Specify when you are using ``ssl`` or
 * ``tls``, or leave empty for no encryption.
 */
'mail_smtpsecure' => '',

/**
 * This depends on ``mail_smtpmode``. Change this to ``true`` if your mail
 * server requires authentication.
 */
'mail_smtpauth' => false,

/**
 * This depends on ``mail_smtpmode``. If SMTP authentication is required, choose
 * the authentication type as ``LOGIN`` (default) or ``PLAIN``.
 */
'mail_smtpauthtype' => 'LOGIN',

/**
 * This depends on ``mail_smtpauth``. Specify the username for authenticating to
 * the SMTP server.
 */
'mail_smtpname' => '',

/**
 * This depends on ``mail_smtpauth``. Specify the password for authenticating to
 * the SMTP server.
 */
'mail_smtppassword' => '',


/**
 * Proxy Configurations
 */

/**
 * The automatic hostname detection of ownCloud can fail in certain reverse
 * proxy and CLI/cron situations. This option allows you to manually override
 * the automatic detection; for example ``www.example.com``, or specify the port
 * ``www.example.com:8080``.
 */
'overwritehost' => '',

/**
 * When generating URLs, ownCloud attempts to detect whether the server is
 * accessed via ``https`` or ``http``. However, if ownCloud is behind a proxy
 * and the proxy handles the ``https`` calls, ownCloud would not know that
 * ``ssl`` is in use, which would result in incorrect URLs being generated.
 * Valid values are ``http`` and ``https``.
 */
'overwriteprotocol' => '',

/**
 * ownCloud attempts to detect the webroot for generating URLs automatically.
 * For example, if ``www.example.com/owncloud`` is the URL pointing to the
 * ownCloud instance, the webroot is ``/owncloud``. When proxies are in use, it
 * may be difficult for ownCloud to detect this parameter, resulting in invalid
 * URLs.
 */
'overwritewebroot' => '',

/**
 * This option allows you to define a manual override condition as a regular
 * expression for the remote IP address. For example, defining a range of IP
 * addresses starting with ``10.0.0.`` and ending with 1 to 3:
 * ``^10\.0\.0\.[1-3]$``
 */
'overwritecondaddr' => '',

/**
 * Use this configuration parameter to specify the base URL for any URLs which
 * are generated within ownCloud using any kind of command line tools (cron or
 * occ). The value should contain the full base URL:
 * ``https://www.example.com/owncloud``
 */
'overwrite.cli.url' => '',

/**
 * To have clean URLs without `/index.php` this parameter needs to be configured.
 *
 * This parameter will be written as "RewriteBase" on update and installation of
 * ownCloud to your `.htaccess` file. While this value is often simply the URL
 * path of the ownCloud installation it cannot be set automatically properly in
 * every scenario and needs thus some manual configuration.
 *
 * In a standard Apache setup this usually equals the folder that ownCloud is
 * accessible at. So if ownCloud is accessible via "https://mycloud.org/owncloud"
 * the correct value would most likely be "/owncloud". If ownCloud is running
 * under "https://mycloud.org/" then it would be "/".
 *
 * Note that the above rule is not valid in every case, as there are some rare setup
 * cases where this may not apply. However, to avoid any update problems this
 * configuration value is explicitly opt-in.
 *
 * After setting this value run `occ maintenance:update:htaccess`. Now, when the
 * following conditions are met ownCloud URLs won't contain `index.php`:
 *
 * - `mod_rewrite` is installed
 * - `mod_env` is installed
 */
'htaccess.RewriteBase' => '/',

/**
 * The URL of your proxy server, for example ``proxy.example.com:8081``.
 */
'proxy' => '',

/**
 * The optional authentication for the proxy to use to connect to the internet.
 * The format is: ``username:password``.
 */
'proxyuserpwd' => '',


/**
 * Deleted Items (trash bin)
 *
 * These parameters control the Deleted files app.
 */

/**
 * If the trash bin app is enabled (default), this setting defines the policy
 * for when files and folders in the trash bin will be permanently deleted.
 * The app allows for two settings, a minimum time for trash bin retention,
 * and a maximum time for trash bin retention.
 * Minimum time is the number of days a file will be kept, after which it
 * may be deleted. Maximum time is the number of days at which it is guaranteed
 * to be deleted.
 * Both minimum and maximum times can be set together to explicitly define
 * file and folder deletion. For migration purposes, this setting is installed
 * initially set to "auto", which is equivalent to the default setting in
 * ownCloud 8.1 and before.
 *
 * Available values:
 *
 * * ``auto``
 *     default setting. keeps files and folders in the trash bin for 30 days
 *     and automatically deletes anytime after that if space is needed (note:
 *     files may not be deleted if space is not needed).
 * * ``D, auto``
 *     keeps files and folders in the trash bin for D+ days, delete anytime if
 *     space needed (note: files may not be deleted if space is not needed)
 * * ``auto, D``
 *     delete all files in the trash bin that are older than D days
 *     automatically, delete other files anytime if space needed
 * * ``D1, D2``
 *     keep files and folders in the trash bin for at least D1 days and
 *     delete when exceeds D2 days
 * * ``disabled``
 *     trash bin auto clean disabled, files and folders will be kept forever
 */
'trashbin_retention_obligation' => 'auto',


/**
 * File versions
 *
 * These parameters control the Versions app.
 */

/**
 * If the versions app is enabled (default), this setting defines the policy
 * for when versions will be permanently deleted.
 * The app allows for two settings, a minimum time for version retention,
 * and a maximum time for version retention.
 * Minimum time is the number of days a version will be kept, after which it
 * may be deleted. Maximum time is the number of days at which it is guaranteed
 * to be deleted.
 * Both minimum and maximum times can be set together to explicitly define
 * version deletion. For migration purposes, this setting is installed
 * initially set to "auto", which is equivalent to the default setting in
 * ownCloud 8.1 and before.
 *
 * Available values:
 *
 * * ``auto``
 *     default setting. Automatically expire versions according to expire
 *     rules. Please refer to :doc:`../configuration_files/file_versioning` for
 *     more information.
 * * ``D, auto``
 *     keep versions at least for D days, apply expire rules to all versions
 *     that are older than D days
 * * ``auto, D``
 *     delete all versions that are older than D days automatically, delete
 *     other versions according to expire rules
 * * ``D1, D2``
 *     keep versions for at least D1 days and delete when exceeds D2 days
 * * ``disabled``
 *     versions auto clean disabled, versions will be kept forever
 */
'versions_retention_obligation' => 'auto',

/**
 * ownCloud Verifications
 *
 * ownCloud performs several verification checks. There are two options,
 * ``true`` and ``false``.
 */

/**
 * Checks an app before install whether it uses private APIs instead of the
 * proper public APIs. If this is set to true it will only allow to install or
 * enable apps that pass this check.
 */
'appcodechecker' => true,

/**
 * Check if ownCloud is up-to-date and shows a notification if a new version is
 * available.
 */
'updatechecker' => true,

/**
 * URL that ownCloud should use to look for updates
 */
'updater.server.url' => 'https://updates.owncloud.com/server/',

/**
 * Is ownCloud connected to the Internet or running in a closed network?
 */
'has_internet_connection' => true,

/**
 * Allows ownCloud to verify a working WebDAV connection. This is done by
 * attempting to make a WebDAV request from PHP.
 */
'check_for_working_webdav' => true,

/**
 * Allows ownCloud to verify a working .well-known URL redirects. This is done
 * by attempting to make a request from JS to
 * https://your-domain.com/.well-known/caldav/
 */
'check_for_working_wellknown_setup' => true,

/**
 * This is a crucial security check on Apache servers that should always be set
 * to ``true``. This verifies that the ``.htaccess`` file is writable and works.
 * If it is not, then any options controlled by ``.htaccess``, such as large
 * file uploads, will not work. It also runs checks on the ``data/`` directory,
 * which verifies that it can't be accessed directly through the Web server.
 */
'check_for_working_htaccess' => true,

/**
 * In certain environments it is desired to have a read-only configuration file.
 * When this switch is set to ``true`` ownCloud will not verify whether the
 * configuration is writable. However, it will not be possible to configure
 * all options via the Web interface. Furthermore, when updating ownCloud
 * it is required to make the configuration file writable again for the update
 * process.
 */
'config_is_read_only' => false,

/**
 * Logging
 */

/**
 * By default the ownCloud logs are sent to the ``owncloud.log`` file in the
 * default ownCloud data directory.
 * If syslogging is desired, set this parameter to ``syslog``.
 * Setting this parameter to ``errorlog`` will use the PHP error_log function
 * for logging.
 */
'log_type' => 'owncloud',

/**
 * Log file path for the ownCloud logging type.
 * Defaults to ``[datadirectory]/owncloud.log``
 */
'logfile' => '/var/log/owncloud.log',

/**
 * Loglevel to start logging at. Valid values are: 0 = Debug, 1 = Info, 2 =
 * Warning, 3 = Error, and 4 = Fatal. The default value is Warning.
 */
'loglevel' => 2,

/**
 * If you maintain different instances and aggregate the logs, you may want
 * to distinguish between them. ``syslog_tag`` can be set per instance
 * with a unique id. Only available if ``log_type`` is set to ``syslog``.
 * The default value is ``ownCloud``.
 */
'syslog_tag' => 'ownCloud',

/**
 * Log condition for log level increase based on conditions. Once one of these
 * conditions is met, the required log level is set to debug. This allows to
 * debug specific requests, users or apps
 *
 * Supported conditions:
 *  - ``shared_secret``: if a request parameter with the name `log_secret` is set to
 *                this value the condition is met
 *  - ``users``:  if the current request is done by one of the specified users,
 *                this condition is met
 *  - ``apps``:   if the log message is invoked by one of the specified apps,
 *                this condition is met
 *  - ``logfile``: the log message invoked by the specified apps get redirected to
 *		   this logfile, this condition is met
 *		   Note: Not applicable when using syslog.
 *
 * Defaults to an empty array.
 */
'log.conditions' => [
        [
		'shared_secret' => '57b58edb6637fe3059b3595cf9c41b9',
		'users' => ['user1'],
		'apps' => ['files_texteditor'],
		'logfile' => '/tmp/test.log'
        ],
        [
		'shared_secret' => '57b58edb6637fe3059b3595cf9c41b9',
		'users' => ['user1'],
		'apps' => ['gallery'],
		'logfile' => '/tmp/gallery.log'
        ],
],

/**
 * This uses PHP.date formatting; see http://php.net/manual/en/function.date.php
 */
'logdateformat' => 'F d, Y H:i:s',

/**
 * The default timezone for logfiles is UTC. You may change this; see
 * http://php.net/manual/en/timezones.php
 */
'logtimezone' => 'Europe/Berlin',

/**
 * Append all database queries and parameters to the log file. Use this only for
 * debugging, as your logfile will become huge.
 */
'log_query' => false,

/**
 * Log successful cron runs.
 */
'cron_log' => true,

/**
 * Enables log rotation and limits the total size of logfiles. The default is 0,
 * or no rotation. Specify a size in bytes, for example 104857600 (100 megabytes
 * = 100 * 1024 * 1024 bytes). A new logfile is created with a new name when the
 * old logfile reaches your limit. If a rotated log file is already present, it
 * will be overwritten.
 */
'log_rotate_size' => false,


/**
 * Alternate Code Locations
 *
 * Some of the ownCloud code may be stored in alternate locations.
 */

/**
 * This section is for configuring the download links for ownCloud clients, as
 * seen in the first-run wizard and on Personal pages.
 */
'customclient_desktop' =>
	'https://owncloud.org/install/#install-clients',
'customclient_android' =>
	'https://play.google.com/store/apps/details?id=com.owncloud.android',
'customclient_ios' =>
	'https://itunes.apple.com/us/app/owncloud/id543672169?mt=8',

/**
 * Apps
 *
 * Options for the Apps folder, Apps store, and App code checker.
 */

/**
 * When enabled, admins may install apps from the ownCloud app store.
 */
'appstoreenabled' => true,

/**
 * The URL of the appstore to use.
 */
'appstoreurl' => 'https://api.owncloud.com/v1',

/**
 * Whether to show experimental apps in the appstore interface
 *
 * Experimental apps are not checked for security issues and are new or known
 * to be unstable and under heavy development. Installing these can cause data
 * loss or security breaches.
 */
'appstore.experimental.enabled' => false,

/**
 * Use the ``apps_paths`` parameter to set the location of the Apps directory,
 * which should be scanned for available apps, and where user-specific apps
 * should be installed from the Apps store. The ``path`` defines the absolute
 * file system path to the app folder. The key ``url`` defines the HTTP Web path
 * to that folder, starting from the ownCloud webroot. The key ``writable``
 * indicates if a Web server can write files to that folder.
 */
 'apps_paths' =>
   array (
     array (
       'path' => OC::$SERVERROOT.'/apps',
       'url' => '/apps',
       'writable' => true,
     )
   ),

/**
 * @see appcodechecker
 */


/**
 * Previews
 *
 * ownCloud supports previews of image files, the covers of MP3 files, and text
 * files. These options control enabling and disabling previews, and thumbnail
 * size.
 */

/**
 * By default, ownCloud can generate previews for the following filetypes:
 *
 * - Image files
 * - Covers of MP3 files
 * - Text documents
 *
 * Valid values are ``true``, to enable previews, or
 * ``false``, to disable previews
 */
'enable_previews' => true,
/**
 * The maximum width, in pixels, of a preview. A value of ``null`` means there
 * is no limit.
 */
'preview_max_x' => 2048,
/**
 * The maximum height, in pixels, of a preview. A value of ``null`` means there
 * is no limit.
 */
'preview_max_y' => 2048,
/**
 * If a lot of small pictures are stored on the ownCloud instance and the
 * preview system generates blurry previews, you might want to consider setting
 * a maximum scale factor. By default, pictures are upscaled to 10 times the
 * original size. A value of ``1`` or ``null`` disables scaling.
 */
'preview_max_scale_factor' => 10,

/**
 * max file size for generating image previews with imagegd (default behaviour)
 * If the image is bigger, it'll try other preview generators,
 * but will most likely show the default mimetype icon
 *
 * Value represents the maximum filesize in megabytes
 * Default is 50
 * Set to -1 for no limit
 */
'preview_max_filesize_image' => 50,

/**
 * custom path for LibreOffice/OpenOffice binary
 */
'preview_libreoffice_path' => '/usr/bin/libreoffice',
/**
 * Use this if LibreOffice/OpenOffice requires additional arguments.
 */
'preview_office_cl_parameters' =>
	' --headless --nologo --nofirststartwizard --invisible --norestore '.
	'--convert-to pdf --outdir ',

/**
 * Only register providers that have been explicitly enabled
 *
 * The following providers are enabled by default:
 *
 *  - OC\Preview\PNG
 *  - OC\Preview\JPEG
 *  - OC\Preview\GIF
 *  - OC\Preview\BMP
 *  - OC\Preview\XBitmap
 *  - OC\Preview\MarkDown
 *  - OC\Preview\MP3
 *  - OC\Preview\TXT
 *
 * The following providers are disabled by default due to performance or privacy
 * concerns:
 *
 *  - OC\Preview\Illustrator
 *  - OC\Preview\Movie
 *  - OC\Preview\MSOffice2003
 *  - OC\Preview\MSOffice2007
 *  - OC\Preview\MSOfficeDoc
 *  - OC\Preview\OpenDocument
 *  - OC\Preview\PDF
 *  - OC\Preview\Photoshop
 *  - OC\Preview\Postscript
 *  - OC\Preview\StarOffice
 *  - OC\Preview\SVG
 *  - OC\Preview\TIFF
 *  - OC\Preview\Font
 *
 * .. note:: Troubleshooting steps for the MS Word previews are available
 *    at the :doc:`../configuration_files/collaborative_documents_configuration`
 *    section of the Administrators Manual.
 *
 * The following providers are not available in Microsoft Windows:
 *
 *  - OC\Preview\Movie
 *  - OC\Preview\MSOfficeDoc
 *  - OC\Preview\MSOffice2003
 *  - OC\Preview\MSOffice2007
 *  - OC\Preview\OpenDocument
 *  - OC\Preview\StarOffice
 */
'enabledPreviewProviders' => array(
	'OC\Preview\PNG',
	'OC\Preview\JPEG',
	'OC\Preview\GIF',
	'OC\Preview\BMP',
	'OC\Preview\XBitmap',
	'OC\Preview\MP3',
	'OC\Preview\TXT',
	'OC\Preview\MarkDown'
),

/**
 * LDAP
 *
 * Global settings used by LDAP User and Group Backend
 */

/**
 * defines the interval in minutes for the background job that checks user
 * existence and marks them as ready to be cleaned up. The number is always
 * minutes. Setting it to 0 disables the feature.
 * See command line (occ) methods ldap:show-remnants and user:delete
 */
'ldapUserCleanupInterval' => 51,

/**
 * Comments
 *
 * Global settings for the Comments infrastructure
 */

/**
 * Replaces the default Comments Manager Factory. This can be utilized if an
 * own or 3rdParty CommentsManager should be used that – for instance – uses the
 * filesystem instead of the database to keep the comments.
 */
'comments.managerFactory' => '\OC\Comments\ManagerFactory',

/**
 * Replaces the default System Tags Manager Factory. This can be utilized if an
 * own or 3rdParty SystemTagsManager should be used that – for instance – uses the
 * filesystem instead of the database to keep the tags.
 */
'systemtags.managerFactory' => '\OC\SystemTag\ManagerFactory',

/**
 * Maintenance
 *
 * These options are for halting user activity when you are performing server
 * maintenance.
 */

/**
 * Enable maintenance mode to disable ownCloud
 *
 * If you want to prevent users from logging in to ownCloud before you start
 * doing some maintenance work, you need to set the value of the maintenance
 * parameter to true. Please keep in mind that users who are already logged-in
 * are kicked out of ownCloud instantly.
 */
'maintenance' => false,

/**
 * When set to ``true``, the ownCloud instance will be unavailable for all users
 * who are not in the ``admin`` group.
 */
'singleuser' => false,


/**
 * SSL
 */

/**
 * Extra SSL options to be used for configuration.
 */
'openssl' => array(
	'config' => '/absolute/location/of/openssl.cnf',
),

/**
 * Allow the configuration of system wide trusted certificates
 */
'enable_certificate_management' => false,

'memcache.local' => '\OC\Memcache\APCu',
'memcache.distributed' => '\OC\Memcache\Memcached',
'redis' => [
	'host' => 'localhost', // can also be a unix domain socket: '/tmp/redis.sock'
	'port' => 6379,
	'timeout' => 0.0,
	'password' => '', // Optional, if not defined no password will be used.
	'dbindex' => 0, // Optional, if undefined SELECT will not run and will use Redis Server's default DB Index.
],
'redis.cluster' => [
	'seeds' => [ // provide some/all of the cluster servers to bootstrap discovery, port required
		'localhost:7000',
		'localhost:7001'
	],
	'timeout' => 0.0,
	'read_timeout' => 0.0,
	'failover_mode' => \RedisCluster::FAILOVER_DISTRIBUTE
],
'memcached_servers' => array(
	array('localhost', 11211),
),
'memcached_options' => array(
	// Set timeouts to 50ms
	\Memcached::OPT_CONNECT_TIMEOUT => 50,
	\Memcached::OPT_RETRY_TIMEOUT =>   50,
	\Memcached::OPT_SEND_TIMEOUT =>    50,
	\Memcached::OPT_RECV_TIMEOUT =>    50,
	\Memcached::OPT_POLL_TIMEOUT =>    50,
	// Enable compression
	\Memcached::OPT_COMPRESSION =>          true,
	// Turn on consistent hashing
	\Memcached::OPT_LIBKETAMA_COMPATIBLE => true,
	// Enable Binary Protocol
	\Memcached::OPT_BINARY_PROTOCOL =>      true,

	// Binary serializer vill be enabled if the igbinary PECL module is available
	//\Memcached::OPT_SERIALIZER => \Memcached::SERIALIZER_IGBINARY,
),
'cache_path' => '',
'cache_chunk_gc_ttl' => 86400, // 60*60*24 = 1 day
'objectstore' => [
	'class' => 'OC\\Files\\ObjectStore\\Swift',
	'arguments' => [
		// trystack will use your facebook id as the user name
		'username' => 'facebook100000123456789',
		// in the trystack dashboard go to user -> settings -> API Password to
		// generate a password
		'password' => 'Secr3tPaSSWoRdt7',
		// must already exist in the objectstore, name can be different
		'container' => 'owncloud',
		// prefix to prepend to the fileid, default is 'oid:urn:'
		'objectPrefix' => 'oid:urn:',
		// create the container if it does not exist. default is false
		'autocreate' => true,
		// required, dev-/trystack defaults to 'RegionOne'
		'region' => 'RegionOne',
		// The Identity / Keystone endpoint
		'url' => 'http://8.21.28.222:5000/v2.0',
		// required on dev-/trystack
		'tenantName' => 'facebook100000123456789',
		// dev-/trystack uses swift by default, the lib defaults to 'cloudFiles'
		// if omitted
		'serviceName' => 'swift',
		// The Interface / url Type, optional
		'urlType' => 'internal'
	],
],

'sharing.managerFactory' => '\OC\Share20\ProviderFactory',
'dbdriveroptions' => array(
	PDO::MYSQL_ATTR_SSL_CA => '/file/path/to/ca_cert.pem',
	PDO::MYSQL_ATTR_INIT_COMMAND => 'SET wait_timeout = 28800'
),
'sqlite.journal_mode' => 'DELETE',
'mysql.utf8mb4' => false,
'supportedDatabases' => array(
	'sqlite',
	'mysql',
	'pgsql',
	'oci',
),
'tempdirectory' => '/tmp/owncloudtemp',
'hashingCost' => 10,
'blacklisted_files' => array('.htaccess'),
'excluded_directories' =>
	array (
		'.snapshot',
		'~snapshot',
	),
'share_folder' => '/',
'theme' => '',
'cipher' => 'AES-256-CFB',
'minimum.supported.desktop.version' => '2.0.0',
'quota_include_external_storage' => false,
'filesystem_check_changes' => 0,
'part_file_in_storage' => true,
'mount_file' => '/var/www/owncloud/data/mount.json',
'filesystem_cache_readonly' => false,
'secret' => '',
'trusted_proxies' => array('203.0.113.45', '198.51.100.128'),
'forwarded_for_headers' => array('HTTP_X_FORWARDED', 'HTTP_FORWARDED_FOR'),
'max_filesize_animated_gifs_public_sharing' => 10,
'filelocking.enabled' => true,
'filelocking.ttl' => 3600,
'memcache.locking' => '\\OC\\Memcache\\Redis',
'upgrade.disable-web' => false,
'debug' => false,
'data-fingerprint' => '',
'copied_sample_config' => true,
'files_external_allow_create_new_local' => false,

);
