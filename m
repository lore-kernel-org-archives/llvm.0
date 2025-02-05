Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B640B1519BA;
	Wed,  5 Feb 2025 16:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738772286; cv=none; b=l2L7JxEP2c6jHDfZYc6+BqAAjC20fWyipnmW8spVqOtp81RjWq05uwuBreZTYS09SCALxE3brtS/zXKeGNCXSOlmelZVXmPG+Teo/9AH9vUGC3JBfylSdeUMtw6DitqFLy1c2E5CRHsTcVdsLcJ3ElmOS7w3HMXh/woxqezAUTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738772286; c=relaxed/simple;
	bh=iGZBK7ZrvUDCbG9R9aejJ1P3OnGZxfZITVVVBjkZBSE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rzyaS0EsYUlHNgVcwFBgxL4W9oBRmoRRiGEfw11PkWwlBG5xk3ul6jLi4TbOq8MrQ2/7fF1uGTlHSbOF/YcRebMtOcOOVrhiospb4Rd05laq1reJKZLUW+6Vhtph+L7aReSHIJsxzlpy2e0TmhkTwAwB6Yjmov6Jkw1ZGkGQkC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XQSkmfWu; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XQSkmfWu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738772285; x=1770308285;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iGZBK7ZrvUDCbG9R9aejJ1P3OnGZxfZITVVVBjkZBSE=;
  b=XQSkmfWuOKMFdg2463WJxOVQ0IIX/D41H35mGbgjFAO5aKD7kG21Gp5h
   YfNbDbuqVllE54zjWrb+WyJhUWbn6HlJn11PjLq65UWQuj7ff4Ds3Zvg+
   Kp5UQMMcGrA3XWWFOmbt5Zuj/f230/SdUhCVQDx0wareXebWOND7+gGwY
   XQRJ6/NfK+TuVM99wIkpI8KHym+27xAOVP4XMosyIUARaiHxoh0ZGpiI2
   oWdBjZUCasylkwxP1MH5QrwUqGHzKSmjWeIeyEVkyf1O3Vt7Q5D+qy5o+
   MBA393jULKoFS8bkDpN3denQbAX+vq2/XjQDalZ54QCwoCvaId4ltoLak
   A==;
X-CSE-ConnectionGUID: 0i/3l9cFRrqcQEqmYH4Mmw==
X-CSE-MsgGUID: DxhLTU6/STmFpv5lDO2FaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50735739"
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="50735739"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 08:17:10 -0800
X-CSE-ConnectionGUID: UIsIFtS1Q66l1r9iSSMlkw==
X-CSE-MsgGUID: EaclNrySR3Cu4fksrs4/eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="141820920"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Feb 2025 08:17:08 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfi5J-000vl7-2R;
	Wed, 05 Feb 2025 16:17:05 +0000
Date: Thu, 6 Feb 2025 00:16:27 +0800
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>
Subject: [brauner-vfs:vfs.all 11/48]
 fs/notify/fanotify/fanotify_user.c:2004:13: warning: variable 'obj' is used
 uninitialized whenever 'if' condition is false
Message-ID: <202502060049.cygRkOiu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
head:   b7601b2abc4dbae86d85da3939ce185eac2ed4ff
commit: 21c1471c81dc7fd8de1f47d74cef9efc91356971 [11/48] fanotify: notify on mount attach and detach
config: i386-buildonly-randconfig-005-20250205 (https://download.01.org/0day-ci/archive/20250206/202502060049.cygRkOiu-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502060049.cygRkOiu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502060049.cygRkOiu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/notify/fanotify/fanotify_user.c:2004:13: warning: variable 'obj' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    2004 |         } else if (obj_type == FSNOTIFY_OBJ_TYPE_MNTNS) {
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/notify/fanotify/fanotify_user.c:2009:7: note: uninitialized use occurs here
    2009 |         if (!obj)
         |              ^~~
   fs/notify/fanotify/fanotify_user.c:2004:9: note: remove the 'if' if its condition is always true
    2004 |         } else if (obj_type == FSNOTIFY_OBJ_TYPE_MNTNS) {
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/notify/fanotify/fanotify_user.c:1819:11: note: initialize the variable 'obj' to silence this warning
    1819 |         void *obj;
         |                  ^
         |                   = NULL
   1 warning generated.


vim +2004 fs/notify/fanotify/fanotify_user.c

  1806	
  1807	static int do_fanotify_mark(int fanotify_fd, unsigned int flags, __u64 mask,
  1808				    int dfd, const char  __user *pathname)
  1809	{
  1810		struct inode *inode = NULL;
  1811		struct fsnotify_group *group;
  1812		struct path path;
  1813		struct fan_fsid __fsid, *fsid = NULL;
  1814		u32 valid_mask = FANOTIFY_EVENTS | FANOTIFY_EVENT_FLAGS;
  1815		unsigned int mark_type = flags & FANOTIFY_MARK_TYPE_BITS;
  1816		unsigned int mark_cmd = flags & FANOTIFY_MARK_CMD_BITS;
  1817		unsigned int ignore = flags & FANOTIFY_MARK_IGNORE_BITS;
  1818		unsigned int obj_type, fid_mode;
  1819		void *obj;
  1820		u32 umask = 0;
  1821		int ret;
  1822	
  1823		pr_debug("%s: fanotify_fd=%d flags=%x dfd=%d pathname=%p mask=%llx\n",
  1824			 __func__, fanotify_fd, flags, dfd, pathname, mask);
  1825	
  1826		/* we only use the lower 32 bits as of right now. */
  1827		if (upper_32_bits(mask))
  1828			return -EINVAL;
  1829	
  1830		if (flags & ~FANOTIFY_MARK_FLAGS)
  1831			return -EINVAL;
  1832	
  1833		switch (mark_type) {
  1834		case FAN_MARK_INODE:
  1835			obj_type = FSNOTIFY_OBJ_TYPE_INODE;
  1836			break;
  1837		case FAN_MARK_MOUNT:
  1838			obj_type = FSNOTIFY_OBJ_TYPE_VFSMOUNT;
  1839			break;
  1840		case FAN_MARK_FILESYSTEM:
  1841			obj_type = FSNOTIFY_OBJ_TYPE_SB;
  1842			break;
  1843		case FAN_MARK_MNTNS:
  1844			obj_type = FSNOTIFY_OBJ_TYPE_MNTNS;
  1845			break;
  1846		default:
  1847			return -EINVAL;
  1848		}
  1849	
  1850		switch (mark_cmd) {
  1851		case FAN_MARK_ADD:
  1852		case FAN_MARK_REMOVE:
  1853			if (!mask)
  1854				return -EINVAL;
  1855			break;
  1856		case FAN_MARK_FLUSH:
  1857			if (flags & ~(FANOTIFY_MARK_TYPE_BITS | FAN_MARK_FLUSH))
  1858				return -EINVAL;
  1859			break;
  1860		default:
  1861			return -EINVAL;
  1862		}
  1863	
  1864		if (IS_ENABLED(CONFIG_FANOTIFY_ACCESS_PERMISSIONS))
  1865			valid_mask |= FANOTIFY_PERM_EVENTS;
  1866	
  1867		if (mask & ~valid_mask)
  1868			return -EINVAL;
  1869	
  1870	
  1871		/* We don't allow FAN_MARK_IGNORE & FAN_MARK_IGNORED_MASK together */
  1872		if (ignore == (FAN_MARK_IGNORE | FAN_MARK_IGNORED_MASK))
  1873			return -EINVAL;
  1874	
  1875		/*
  1876		 * Event flags (FAN_ONDIR, FAN_EVENT_ON_CHILD) have no effect with
  1877		 * FAN_MARK_IGNORED_MASK.
  1878		 */
  1879		if (ignore == FAN_MARK_IGNORED_MASK) {
  1880			mask &= ~FANOTIFY_EVENT_FLAGS;
  1881			umask = FANOTIFY_EVENT_FLAGS;
  1882		}
  1883	
  1884		CLASS(fd, f)(fanotify_fd);
  1885		if (fd_empty(f))
  1886			return -EBADF;
  1887	
  1888		/* verify that this is indeed an fanotify instance */
  1889		if (unlikely(fd_file(f)->f_op != &fanotify_fops))
  1890			return -EINVAL;
  1891		group = fd_file(f)->private_data;
  1892	
  1893		/* Only report mount events on mnt namespace */
  1894		if (FAN_GROUP_FLAG(group, FAN_REPORT_MNT)) {
  1895			if (mask & ~FANOTIFY_MOUNT_EVENTS)
  1896				return -EINVAL;
  1897			if (mark_type != FAN_MARK_MNTNS)
  1898				return -EINVAL;
  1899		} else {
  1900			if (mask & FANOTIFY_MOUNT_EVENTS)
  1901				return -EINVAL;
  1902			if (mark_type == FAN_MARK_MNTNS)
  1903				return -EINVAL;
  1904		}
  1905	
  1906		/*
  1907		 * An unprivileged user is not allowed to setup mount nor filesystem
  1908		 * marks.  This also includes setting up such marks by a group that
  1909		 * was initialized by an unprivileged user.
  1910		 */
  1911		if ((!capable(CAP_SYS_ADMIN) ||
  1912		     FAN_GROUP_FLAG(group, FANOTIFY_UNPRIV)) &&
  1913		    mark_type != FAN_MARK_INODE)
  1914			return -EPERM;
  1915	
  1916		/*
  1917		 * Permission events are not allowed for FAN_CLASS_NOTIF.
  1918		 * Pre-content permission events are not allowed for FAN_CLASS_CONTENT.
  1919		 */
  1920		if (mask & FANOTIFY_PERM_EVENTS &&
  1921		    group->priority == FSNOTIFY_PRIO_NORMAL)
  1922			return -EINVAL;
  1923		else if (mask & FANOTIFY_PRE_CONTENT_EVENTS &&
  1924			 group->priority == FSNOTIFY_PRIO_CONTENT)
  1925			return -EINVAL;
  1926	
  1927		if (mask & FAN_FS_ERROR &&
  1928		    mark_type != FAN_MARK_FILESYSTEM)
  1929			return -EINVAL;
  1930	
  1931		/*
  1932		 * Evictable is only relevant for inode marks, because only inode object
  1933		 * can be evicted on memory pressure.
  1934		 */
  1935		if (flags & FAN_MARK_EVICTABLE &&
  1936		     mark_type != FAN_MARK_INODE)
  1937			return -EINVAL;
  1938	
  1939		/*
  1940		 * Events that do not carry enough information to report
  1941		 * event->fd require a group that supports reporting fid.  Those
  1942		 * events are not supported on a mount mark, because they do not
  1943		 * carry enough information (i.e. path) to be filtered by mount
  1944		 * point.
  1945		 */
  1946		fid_mode = FAN_GROUP_FLAG(group, FANOTIFY_FID_BITS);
  1947		if (mask & ~(FANOTIFY_FD_EVENTS|FANOTIFY_MOUNT_EVENTS|FANOTIFY_EVENT_FLAGS) &&
  1948		    (!fid_mode || mark_type == FAN_MARK_MOUNT))
  1949			return -EINVAL;
  1950	
  1951		/*
  1952		 * FAN_RENAME uses special info type records to report the old and
  1953		 * new parent+name.  Reporting only old and new parent id is less
  1954		 * useful and was not implemented.
  1955		 */
  1956		if (mask & FAN_RENAME && !(fid_mode & FAN_REPORT_NAME))
  1957			return -EINVAL;
  1958	
  1959		/* Pre-content events are not currently generated for directories. */
  1960		if (mask & FANOTIFY_PRE_CONTENT_EVENTS && mask & FAN_ONDIR)
  1961			return -EINVAL;
  1962	
  1963		if (mark_cmd == FAN_MARK_FLUSH) {
  1964			if (mark_type == FAN_MARK_MOUNT)
  1965				fsnotify_clear_vfsmount_marks_by_group(group);
  1966			else if (mark_type == FAN_MARK_FILESYSTEM)
  1967				fsnotify_clear_sb_marks_by_group(group);
  1968			else
  1969				fsnotify_clear_inode_marks_by_group(group);
  1970			return 0;
  1971		}
  1972	
  1973		ret = fanotify_find_path(dfd, pathname, &path, flags,
  1974				(mask & ALL_FSNOTIFY_EVENTS), obj_type);
  1975		if (ret)
  1976			return ret;
  1977	
  1978		if (mark_cmd == FAN_MARK_ADD) {
  1979			ret = fanotify_events_supported(group, &path, mask, flags);
  1980			if (ret)
  1981				goto path_put_and_out;
  1982		}
  1983	
  1984		if (fid_mode) {
  1985			ret = fanotify_test_fsid(path.dentry, flags, &__fsid);
  1986			if (ret)
  1987				goto path_put_and_out;
  1988	
  1989			ret = fanotify_test_fid(path.dentry, flags);
  1990			if (ret)
  1991				goto path_put_and_out;
  1992	
  1993			fsid = &__fsid;
  1994		}
  1995	
  1996		/* inode held in place by reference to path; group by fget on fd */
  1997		if (obj_type == FSNOTIFY_OBJ_TYPE_INODE) {
  1998			inode = path.dentry->d_inode;
  1999			obj = inode;
  2000		} else if (obj_type == FSNOTIFY_OBJ_TYPE_VFSMOUNT) {
  2001			obj = path.mnt;
  2002		} else if (obj_type == FSNOTIFY_OBJ_TYPE_SB) {
  2003			obj = path.mnt->mnt_sb;
> 2004		} else if (obj_type == FSNOTIFY_OBJ_TYPE_MNTNS) {
  2005			obj = mnt_ns_from_dentry(path.dentry);
  2006		}
  2007	
  2008		ret = -EINVAL;
  2009		if (!obj)
  2010			goto path_put_and_out;
  2011	
  2012		/*
  2013		 * If some other task has this inode open for write we should not add
  2014		 * an ignore mask, unless that ignore mask is supposed to survive
  2015		 * modification changes anyway.
  2016		 */
  2017		if (mark_cmd == FAN_MARK_ADD && (flags & FANOTIFY_MARK_IGNORE_BITS) &&
  2018		    !(flags & FAN_MARK_IGNORED_SURV_MODIFY)) {
  2019			ret = !inode ? -EINVAL : -EISDIR;
  2020			/* FAN_MARK_IGNORE requires SURV_MODIFY for sb/mount/dir marks */
  2021			if (ignore == FAN_MARK_IGNORE &&
  2022			    (!inode || S_ISDIR(inode->i_mode)))
  2023				goto path_put_and_out;
  2024	
  2025			ret = 0;
  2026			if (inode && inode_is_open_for_write(inode))
  2027				goto path_put_and_out;
  2028		}
  2029	
  2030		/* Mask out FAN_EVENT_ON_CHILD flag for sb/mount/non-dir marks */
  2031		if (!inode || !S_ISDIR(inode->i_mode)) {
  2032			mask &= ~FAN_EVENT_ON_CHILD;
  2033			umask = FAN_EVENT_ON_CHILD;
  2034			/*
  2035			 * If group needs to report parent fid, register for getting
  2036			 * events with parent/name info for non-directory.
  2037			 */
  2038			if ((fid_mode & FAN_REPORT_DIR_FID) &&
  2039			    (flags & FAN_MARK_ADD) && !ignore)
  2040				mask |= FAN_EVENT_ON_CHILD;
  2041		}
  2042	
  2043		/* create/update an inode mark */
  2044		switch (mark_cmd) {
  2045		case FAN_MARK_ADD:
  2046			ret = fanotify_add_mark(group, obj, obj_type, mask, flags,
  2047						fsid);
  2048			break;
  2049		case FAN_MARK_REMOVE:
  2050			ret = fanotify_remove_mark(group, obj, obj_type, mask, flags,
  2051						   umask);
  2052			break;
  2053		default:
  2054			ret = -EINVAL;
  2055		}
  2056	
  2057	path_put_and_out:
  2058		path_put(&path);
  2059		return ret;
  2060	}
  2061	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
