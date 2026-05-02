Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1886B231A21;
	Sat,  2 May 2026 11:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777720187; cv=none; b=Sl66p1LGyyGAlexpI4q/yanhta8IiP9gWAifwv6DruiIFCZWTEQyDmE0LjSN24W+Y4ZB5LqEX+SojHzh62YswMeSwrbZNeXniUjVhMOjqzM3PWi63zVMmGULs64ipuAF/JHSTjt0ZsGruVaYdRg6MBs2q+4h5MtmijAZHeALwCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777720187; c=relaxed/simple;
	bh=3DSa5aKXlscgn8Si/AbQ9D7izrFBAEnEPhWJuP19/5E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bFf1FfKr5WW6HatJeAOul2jakdzzUTiiIeQ0YAdGvjSJWcpfoGhHzfbJ+zaI85a75ZAwb9DFIB17JBStyv0eJkSwghWRPPsI5Jxk8rqid3BOVT4RMfi/1i62X+C+AxZ5b0NPJuU5TPh7dFD9EYqNiqDwbYHBN/QOhjDBYdYtVOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aJE/9M2a; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aJE/9M2a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777720186; x=1809256186;
  h=date:from:to:cc:subject:message-id;
  bh=3DSa5aKXlscgn8Si/AbQ9D7izrFBAEnEPhWJuP19/5E=;
  b=aJE/9M2aZ9rXNXqtGFJbKHy29uGVZxEomfP0eqZfh1rDq1+g1bladKB+
   MYTsXBJzibm3v2AsOKUUh5UKrU32EVTpeLE0lQD5yCnXmkjDPSKsz2+IL
   RixdUKMKnX5Djht9O8PW1fQMycD5TYD+m9XVL2PFBx/Zv2d5lSCDPFYO9
   hiJsz844LaZI5NJC7o/cNDQd0zyETgpMgHKpYI/VliTucU7YtIXrhE8Mg
   c89resmQKX/pLzGO9lsmdJS1GfF0+LElELjs3EGdqfXMaJH25tegQeT8G
   tShzuTooq2xONCYDWE3ZVuyrlvGZLccj05eDrE2TTYHjbCrdC76clnFv5
   w==;
X-CSE-ConnectionGUID: rEzdJ5HKSIKjpDmSMA/kng==
X-CSE-MsgGUID: ZoGL8NJWTn2FFMuDC6tmdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="78589163"
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="78589163"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 04:09:46 -0700
X-CSE-ConnectionGUID: x9ELS1AORduqCSSFGaED+A==
X-CSE-MsgGUID: bZJS6TjXTxuQjonxTL4C1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="234055251"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 02 May 2026 04:09:44 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJ8E9-000000001LV-1tuP;
	Sat, 02 May 2026 11:09:41 +0000
Date: Sat, 02 May 2026 19:08:59 +0800
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 fuse-devel@lists.sourceforge.net
Subject: [mszeredi-fuse:fusex 40/40] fs/fuse/fusex.c:1601:16: error:
 use of undeclared identifier 'FUSE_SUPER_MAGIC'
Message-ID: <202605021906.FIqlVWd9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git fusex
head:   1934d254361977df9fad43102ec1d72e20434a99
commit: 1934d254361977df9fad43102ec1d72e20434a99 [40/40] fuse: add fusex filesystem
config: hexagon-randconfig-002-20260502 (https://download.01.org/0day-ci/archive/20260502/202605021906.FIqlVWd9-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260502/202605021906.FIqlVWd9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605021906.FIqlVWd9-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> fs/fuse/fusex.c:1065:2: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
    1065 |         struct fuse_inode *fi = get_fuse_inode(inode);
         |         ^
>> fs/fuse/fusex.c:1601:16: error: use of undeclared identifier 'FUSE_SUPER_MAGIC'
    1601 |         sb->s_magic = FUSE_SUPER_MAGIC;
         |                       ^~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +/FUSE_SUPER_MAGIC +1601 fs/fuse/fusex.c

  1574	
  1575	static int fusex_fill_super(struct super_block *sb, struct fs_context *fsc)
  1576	{
  1577		struct fuse_mount *fm = get_fuse_mount_super(sb);
  1578		struct fuse_conn *fc = fm->fc;
  1579		struct inode *inode;
  1580		struct fusex_id id;
  1581		struct fuse_statx_out statx;
  1582		struct fuse_chan_param cp;
  1583		int err;
  1584	
  1585		/* Dropped in fuse_mount_destroy() */
  1586		fuse_conn_get(fc);
  1587		fm->sb = sb;
  1588		fc->dev = sb->s_dev;
  1589	
  1590		scoped_guard(mutex, &fuse_mutex) {
  1591			list_add_tail(&fc->entry, &fuse_conn_list);
  1592			err = fuse_ctl_add_conn(fc);
  1593			if (err)
  1594				return err;
  1595		}
  1596	
  1597		err = super_setup_bdi(sb);
  1598		if (err)
  1599			return err;
  1600	
> 1601		sb->s_magic = FUSE_SUPER_MAGIC;
  1602		sb->s_op = &fusex_super_operations;
  1603		sb->s_xattr = fusex_xattr_handlers;
  1604		sb->s_maxbytes = MAX_LFS_FILESIZE;
  1605		sb->s_time_gran = 1;
  1606		sb->s_iflags |= SB_I_IMA_UNVERIFIABLE_SIGNATURE;
  1607		if (sb->s_user_ns != &init_user_ns)
  1608			sb->s_iflags |= SB_I_UNTRUSTED_MOUNTER;
  1609		sb->s_blocksize = PAGE_SIZE;
  1610		sb->s_blocksize_bits = PAGE_SHIFT;
  1611		sb->s_flags &= SB_RDONLY;
  1612		sb->s_flags |= SB_POSIXACL;
  1613	
  1614		err = fusex_send_init(fm, &id, &statx);
  1615		if (err)
  1616			return err;
  1617	
  1618		inode = fusex_iget(sb, &id);
  1619		if (inode) {
  1620			WARN_ON(!(inode_state_read_once(inode) & I_NEW));
  1621			fusex_set_attr(inode, &statx.stat);
  1622			fusex_init_inode(inode);
  1623			unlock_new_inode(inode);
  1624		}
  1625		sb->s_root = d_make_root(inode);
  1626		if (!sb->s_root)
  1627			return -ENOMEM;
  1628	
  1629		fc->parallel_dirops = true;
  1630		fc->destroy = true;
  1631	
  1632		cp.minor = fc->minor;
  1633		cp.max_write = fc->max_write;
  1634		cp.max_pages = fc->max_pages;
  1635		fuse_chan_set_initialized(fc->chan, &cp);
  1636	
  1637		return 0;
  1638	}
  1639	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
