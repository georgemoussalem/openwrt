. /lib/functions.sh

RAMFS_COPY_BIN='fw_printenv fw_setenv'
RAMFS_COPY_DATA='/etc/fw_env.config /var/lock/fw_printenv.lock'

platform_do_upgrade() {
	local board=$(board_name)
	case $board in
		linksys,mx2000|\
		linksys,mx5500)
			platform_do_upgrade_linksys "$1"
		;;
		*)
			default_do_upgrade "$1"
			;;
	esac
}
