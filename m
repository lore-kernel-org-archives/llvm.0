Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE3C18C329;
	Fri,  9 Aug 2024 08:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723193062; cv=none; b=OsYbI5DmG/Qt7SwJMq21A2naYS1tUZje3M4N8/A0ro4djSpnge29fShcfjbieZlwuvYU4FYedSvAPkeECXUw/mvoGsqanVYc2nc6xbcZaF4IrGApUpBPcxpt4Ls4XLSB2MN6iI8VK2tfHQrTKA1iKY5w95YwhQaMkoD/rQuzEzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723193062; c=relaxed/simple;
	bh=zXZM6vQVkfeyzWZK1S38crg2vBR9csdyS1l0JN2KPOE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LGuJUM6VYKQ97Dc+pJxmCtf9ojxujZ3WSeYecEsUL/1X582bgfXb06VsZj8ObkJZLgQ9JoQTcmuLc8XoLsrYkuxx1Vbb/vTYLKj0rVrshtyFS5VARXR1A7kw4RQiHuLos0LgwHGfvR5xXnvvOQNONYPnRkG4fZ/mUXvv7wk0wLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dM2MAgfR; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dM2MAgfR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723193060; x=1754729060;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zXZM6vQVkfeyzWZK1S38crg2vBR9csdyS1l0JN2KPOE=;
  b=dM2MAgfRAkx2iHdvACJFXrry67NrihS4SGS0+A73HIUHZFWo4Msk1nEQ
   BJ4EYejxYovBM3xwwsO1WHJ12/OxRDRE5SjhJ6lMiUT3vogapHjTDJSUg
   FGNLLy9ReMy7GXwTSNkYfcyYcfyaamhh4APSjxrU/nQvr9+70dGOT08lT
   AJSXdy/xBswkWSBWOjuiOMpn/bIlEkJC1294k2vEZgLs6vcJ0X+yKVzGJ
   jKK50Yd4avKHL44FWK/CpwuHbXzCvbVHvsnnGGL/lbVkR4M74NyFJX3x9
   VuSNC9tHkdZU27+bJnqjsyiSZcbBKLYx5xqfD1WxC8rLFQNRnsO7K9Qfe
   Q==;
X-CSE-ConnectionGUID: bRbze2GrQ0O0vZHe5C8nzg==
X-CSE-MsgGUID: GM3jq0SqQIu+4OvpoPWvww==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="20919625"
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; 
   d="scan'208";a="20919625"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 01:44:20 -0700
X-CSE-ConnectionGUID: nwdOvO4sQEOZ+tIFE5fZNA==
X-CSE-MsgGUID: p9XMnBIgR3W8O+RlzJdP/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; 
   d="scan'208";a="57713763"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 09 Aug 2024 01:44:18 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scLEN-0007eu-23;
	Fri, 09 Aug 2024 08:44:15 +0000
Date: Fri, 9 Aug 2024 16:43:18 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Raghav <p.raghav@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Luis Chamberlain <mcgrof@kernel.org>,
	"Darrick J. Wong" <djwong@kernel.org>
Subject: [mcgrof-next:20240808-large-block-misc 15388/15390]
 fs/xfs/xfs_super.c:1655:27: warning: format specifies type 'long' but the
 argument has type 'size_t' (aka 'unsigned int')
Message-ID: <202408091606.cZeaSAvg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git 20240808-large-block-misc
head:   f87d6ccd9d1e95abe5c254c89b52d42e6a99ca81
commit: c85bf06395ffe514c6312414a1ab6a9a5c2e16c1 [15388/15390] xfs: enable block size larger than page size support
config: i386-buildonly-randconfig-002-20240809 (https://download.01.org/0day-ci/archive/20240809/202408091606.cZeaSAvg-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408091606.cZeaSAvg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408091606.cZeaSAvg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/xfs_super.c:1655:27: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
    1654 | "block size (%u bytes) not supported; Only block size (%ld) or less is supported",
         |                                                        ~~~
         |                                                        %zu
    1655 |                         mp->m_sb.sb_blocksize, max_folio_size);
         |                                                ^~~~~~~~~~~~~~
   fs/xfs/xfs_message.h:27:49: note: expanded from macro 'xfs_warn'
      27 |         xfs_printk_index_wrap(KERN_WARNING, mp, fmt, ##__VA_ARGS__)
         |                                                 ~~~    ^~~~~~~~~~~
   fs/xfs/xfs_message.h:16:42: note: expanded from macro 'xfs_printk_index_wrap'
      16 |         xfs_printk_level(kern_level, mp, fmt, ##__VA_ARGS__);   \
         |                                          ~~~    ^~~~~~~~~~~
   1 warning generated.


vim +1655 fs/xfs/xfs_super.c

  1496	
  1497	static int
  1498	xfs_fs_fill_super(
  1499		struct super_block	*sb,
  1500		struct fs_context	*fc)
  1501	{
  1502		struct xfs_mount	*mp = sb->s_fs_info;
  1503		struct inode		*root;
  1504		int			flags = 0, error;
  1505	
  1506		mp->m_super = sb;
  1507	
  1508		/*
  1509		 * Copy VFS mount flags from the context now that all parameter parsing
  1510		 * is guaranteed to have been completed by either the old mount API or
  1511		 * the newer fsopen/fsconfig API.
  1512		 */
  1513		if (fc->sb_flags & SB_RDONLY)
  1514			set_bit(XFS_OPSTATE_READONLY, &mp->m_opstate);
  1515		if (fc->sb_flags & SB_DIRSYNC)
  1516			mp->m_features |= XFS_FEAT_DIRSYNC;
  1517		if (fc->sb_flags & SB_SYNCHRONOUS)
  1518			mp->m_features |= XFS_FEAT_WSYNC;
  1519	
  1520		error = xfs_fs_validate_params(mp);
  1521		if (error)
  1522			return error;
  1523	
  1524		sb_min_blocksize(sb, BBSIZE);
  1525		sb->s_xattr = xfs_xattr_handlers;
  1526		sb->s_export_op = &xfs_export_operations;
  1527	#ifdef CONFIG_XFS_QUOTA
  1528		sb->s_qcop = &xfs_quotactl_operations;
  1529		sb->s_quota_types = QTYPE_MASK_USR | QTYPE_MASK_GRP | QTYPE_MASK_PRJ;
  1530	#endif
  1531		sb->s_op = &xfs_super_operations;
  1532	
  1533		/*
  1534		 * Delay mount work if the debug hook is set. This is debug
  1535		 * instrumention to coordinate simulation of xfs mount failures with
  1536		 * VFS superblock operations
  1537		 */
  1538		if (xfs_globals.mount_delay) {
  1539			xfs_notice(mp, "Delaying mount for %d seconds.",
  1540				xfs_globals.mount_delay);
  1541			msleep(xfs_globals.mount_delay * 1000);
  1542		}
  1543	
  1544		if (fc->sb_flags & SB_SILENT)
  1545			flags |= XFS_MFSI_QUIET;
  1546	
  1547		error = xfs_open_devices(mp);
  1548		if (error)
  1549			return error;
  1550	
  1551		if (xfs_debugfs) {
  1552			mp->m_debugfs = xfs_debugfs_mkdir(mp->m_super->s_id,
  1553							  xfs_debugfs);
  1554		} else {
  1555			mp->m_debugfs = NULL;
  1556		}
  1557	
  1558		error = xfs_init_mount_workqueues(mp);
  1559		if (error)
  1560			goto out_shutdown_devices;
  1561	
  1562		error = xfs_init_percpu_counters(mp);
  1563		if (error)
  1564			goto out_destroy_workqueues;
  1565	
  1566		error = xfs_inodegc_init_percpu(mp);
  1567		if (error)
  1568			goto out_destroy_counters;
  1569	
  1570		/* Allocate stats memory before we do operations that might use it */
  1571		mp->m_stats.xs_stats = alloc_percpu(struct xfsstats);
  1572		if (!mp->m_stats.xs_stats) {
  1573			error = -ENOMEM;
  1574			goto out_destroy_inodegc;
  1575		}
  1576	
  1577		error = xchk_mount_stats_alloc(mp);
  1578		if (error)
  1579			goto out_free_stats;
  1580	
  1581		error = xfs_readsb(mp, flags);
  1582		if (error)
  1583			goto out_free_scrub_stats;
  1584	
  1585		error = xfs_finish_flags(mp);
  1586		if (error)
  1587			goto out_free_sb;
  1588	
  1589		error = xfs_setup_devices(mp);
  1590		if (error)
  1591			goto out_free_sb;
  1592	
  1593		/*
  1594		 * V4 support is undergoing deprecation.
  1595		 *
  1596		 * Note: this has to use an open coded m_features check as xfs_has_crc
  1597		 * always returns false for !CONFIG_XFS_SUPPORT_V4.
  1598		 */
  1599		if (!(mp->m_features & XFS_FEAT_CRC)) {
  1600			if (!IS_ENABLED(CONFIG_XFS_SUPPORT_V4)) {
  1601				xfs_warn(mp,
  1602		"Deprecated V4 format (crc=0) not supported by kernel.");
  1603				error = -EINVAL;
  1604				goto out_free_sb;
  1605			}
  1606			xfs_warn_once(mp,
  1607		"Deprecated V4 format (crc=0) will not be supported after September 2030.");
  1608		}
  1609	
  1610		/* ASCII case insensitivity is undergoing deprecation. */
  1611		if (xfs_has_asciici(mp)) {
  1612	#ifdef CONFIG_XFS_SUPPORT_ASCII_CI
  1613			xfs_warn_once(mp,
  1614		"Deprecated ASCII case-insensitivity feature (ascii-ci=1) will not be supported after September 2030.");
  1615	#else
  1616			xfs_warn(mp,
  1617		"Deprecated ASCII case-insensitivity feature (ascii-ci=1) not supported by kernel.");
  1618			error = -EINVAL;
  1619			goto out_free_sb;
  1620	#endif
  1621		}
  1622	
  1623		/* Filesystem claims it needs repair, so refuse the mount. */
  1624		if (xfs_has_needsrepair(mp)) {
  1625			xfs_warn(mp, "Filesystem needs repair.  Please run xfs_repair.");
  1626			error = -EFSCORRUPTED;
  1627			goto out_free_sb;
  1628		}
  1629	
  1630		/*
  1631		 * Don't touch the filesystem if a user tool thinks it owns the primary
  1632		 * superblock.  mkfs doesn't clear the flag from secondary supers, so
  1633		 * we don't check them at all.
  1634		 */
  1635		if (mp->m_sb.sb_inprogress) {
  1636			xfs_warn(mp, "Offline file system operation in progress!");
  1637			error = -EFSCORRUPTED;
  1638			goto out_free_sb;
  1639		}
  1640	
  1641		if (mp->m_sb.sb_blocksize > PAGE_SIZE) {
  1642			size_t max_folio_size = mapping_max_folio_size_supported();
  1643	
  1644			if (!xfs_has_crc(mp)) {
  1645				xfs_warn(mp,
  1646	"V4 Filesystem with blocksize %d bytes. Only pagesize (%ld) or less is supported.",
  1647					mp->m_sb.sb_blocksize, PAGE_SIZE);
  1648				error = -ENOSYS;
  1649				goto out_free_sb;
  1650			}
  1651	
  1652			if (mp->m_sb.sb_blocksize > max_folio_size) {
  1653				xfs_warn(mp,
  1654	"block size (%u bytes) not supported; Only block size (%ld) or less is supported",
> 1655				mp->m_sb.sb_blocksize, max_folio_size);
  1656				error = -ENOSYS;
  1657				goto out_free_sb;
  1658			}
  1659	
  1660			xfs_warn(mp,
  1661	"EXPERIMENTAL: V5 Filesystem with Large Block Size (%d bytes) enabled.",
  1662				mp->m_sb.sb_blocksize);
  1663		}
  1664	
  1665		/* Ensure this filesystem fits in the page cache limits */
  1666		if (xfs_sb_validate_fsb_count(&mp->m_sb, mp->m_sb.sb_dblocks) ||
  1667		    xfs_sb_validate_fsb_count(&mp->m_sb, mp->m_sb.sb_rblocks)) {
  1668			xfs_warn(mp,
  1669			"file system too large to be mounted on this system.");
  1670			error = -EFBIG;
  1671			goto out_free_sb;
  1672		}
  1673	
  1674		/*
  1675		 * XFS block mappings use 54 bits to store the logical block offset.
  1676		 * This should suffice to handle the maximum file size that the VFS
  1677		 * supports (currently 2^63 bytes on 64-bit and ULONG_MAX << PAGE_SHIFT
  1678		 * bytes on 32-bit), but as XFS and VFS have gotten the s_maxbytes
  1679		 * calculation wrong on 32-bit kernels in the past, we'll add a WARN_ON
  1680		 * to check this assertion.
  1681		 *
  1682		 * Avoid integer overflow by comparing the maximum bmbt offset to the
  1683		 * maximum pagecache offset in units of fs blocks.
  1684		 */
  1685		if (!xfs_verify_fileoff(mp, XFS_B_TO_FSBT(mp, MAX_LFS_FILESIZE))) {
  1686			xfs_warn(mp,
  1687	"MAX_LFS_FILESIZE block offset (%llu) exceeds extent map maximum (%llu)!",
  1688				 XFS_B_TO_FSBT(mp, MAX_LFS_FILESIZE),
  1689				 XFS_MAX_FILEOFF);
  1690			error = -EINVAL;
  1691			goto out_free_sb;
  1692		}
  1693	
  1694		error = xfs_filestream_mount(mp);
  1695		if (error)
  1696			goto out_free_sb;
  1697	
  1698		/*
  1699		 * we must configure the block size in the superblock before we run the
  1700		 * full mount process as the mount process can lookup and cache inodes.
  1701		 */
  1702		sb->s_magic = XFS_SUPER_MAGIC;
  1703		sb->s_blocksize = mp->m_sb.sb_blocksize;
  1704		sb->s_blocksize_bits = ffs(sb->s_blocksize) - 1;
  1705		sb->s_maxbytes = MAX_LFS_FILESIZE;
  1706		sb->s_max_links = XFS_MAXLINK;
  1707		sb->s_time_gran = 1;
  1708		if (xfs_has_bigtime(mp)) {
  1709			sb->s_time_min = xfs_bigtime_to_unix(XFS_BIGTIME_TIME_MIN);
  1710			sb->s_time_max = xfs_bigtime_to_unix(XFS_BIGTIME_TIME_MAX);
  1711		} else {
  1712			sb->s_time_min = XFS_LEGACY_TIME_MIN;
  1713			sb->s_time_max = XFS_LEGACY_TIME_MAX;
  1714		}
  1715		trace_xfs_inode_timestamp_range(mp, sb->s_time_min, sb->s_time_max);
  1716		sb->s_iflags |= SB_I_CGROUPWB;
  1717	
  1718		set_posix_acl_flag(sb);
  1719	
  1720		/* version 5 superblocks support inode version counters. */
  1721		if (xfs_has_crc(mp))
  1722			sb->s_flags |= SB_I_VERSION;
  1723	
  1724		if (xfs_has_dax_always(mp)) {
  1725			error = xfs_setup_dax_always(mp);
  1726			if (error)
  1727				goto out_filestream_unmount;
  1728		}
  1729	
  1730		if (xfs_has_discard(mp) && !bdev_max_discard_sectors(sb->s_bdev)) {
  1731			xfs_warn(mp,
  1732		"mounting with \"discard\" option, but the device does not support discard");
  1733			mp->m_features &= ~XFS_FEAT_DISCARD;
  1734		}
  1735	
  1736		if (xfs_has_reflink(mp)) {
  1737			if (mp->m_sb.sb_rblocks) {
  1738				xfs_alert(mp,
  1739		"reflink not compatible with realtime device!");
  1740				error = -EINVAL;
  1741				goto out_filestream_unmount;
  1742			}
  1743	
  1744			if (xfs_globals.always_cow) {
  1745				xfs_info(mp, "using DEBUG-only always_cow mode.");
  1746				mp->m_always_cow = true;
  1747			}
  1748		}
  1749	
  1750		if (xfs_has_rmapbt(mp) && mp->m_sb.sb_rblocks) {
  1751			xfs_alert(mp,
  1752		"reverse mapping btree not compatible with realtime device!");
  1753			error = -EINVAL;
  1754			goto out_filestream_unmount;
  1755		}
  1756	
  1757		if (xfs_has_exchange_range(mp))
  1758			xfs_warn(mp,
  1759		"EXPERIMENTAL exchange-range feature enabled. Use at your own risk!");
  1760	
  1761		if (xfs_has_parent(mp))
  1762			xfs_warn(mp,
  1763		"EXPERIMENTAL parent pointer feature enabled. Use at your own risk!");
  1764	
  1765		error = xfs_mountfs(mp);
  1766		if (error)
  1767			goto out_filestream_unmount;
  1768	
  1769		root = igrab(VFS_I(mp->m_rootip));
  1770		if (!root) {
  1771			error = -ENOENT;
  1772			goto out_unmount;
  1773		}
  1774		sb->s_root = d_make_root(root);
  1775		if (!sb->s_root) {
  1776			error = -ENOMEM;
  1777			goto out_unmount;
  1778		}
  1779	
  1780		return 0;
  1781	
  1782	 out_filestream_unmount:
  1783		xfs_filestream_unmount(mp);
  1784	 out_free_sb:
  1785		xfs_freesb(mp);
  1786	 out_free_scrub_stats:
  1787		xchk_mount_stats_free(mp);
  1788	 out_free_stats:
  1789		free_percpu(mp->m_stats.xs_stats);
  1790	 out_destroy_inodegc:
  1791		xfs_inodegc_free_percpu(mp);
  1792	 out_destroy_counters:
  1793		xfs_destroy_percpu_counters(mp);
  1794	 out_destroy_workqueues:
  1795		xfs_destroy_mount_workqueues(mp);
  1796	 out_shutdown_devices:
  1797		xfs_shutdown_devices(mp);
  1798		return error;
  1799	
  1800	 out_unmount:
  1801		xfs_filestream_unmount(mp);
  1802		xfs_unmountfs(mp);
  1803		goto out_free_sb;
  1804	}
  1805	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
