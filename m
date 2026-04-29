Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BC028850C;
	Wed, 29 Apr 2026 20:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777493066; cv=none; b=bYudOBeI8iu3iW4Sz/e1Tm7/rLT1H5be5X6pTDnpkkg5sSmwwYCVtVVaqkkeMJrRrlHuDTmzEof4MOpJHug5hcf5Qz9Q1JD29PERbTpPKA5BecwBYfqq9DFYMe+b4fR71Bd+Xq+ksYCvG+K9bShgcZgICSPeYGM6ywHSecnL1UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777493066; c=relaxed/simple;
	bh=FfRO7GYgDCNy8O7Cqhu5GNAaI0+Uw2gvgWemDXtgbzE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l7wOPQCvfbMeH8yK11N3jApM9gP03xqA0pcc9WJ/SrxsOlVCkDH8WoeL7h+UVDGSuI67Nhbop+Yl6EIEbjfPPU9xZxaN+zYn5FEzs4vwJwHHlIvULmMbGErAiWu8VmOV/55SMgi6WWYjEz6zx3pQ+yYDsLJ/4+AgOz9BqXwCmzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m76EO7Aq; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m76EO7Aq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777493065; x=1809029065;
  h=date:from:to:cc:subject:message-id;
  bh=FfRO7GYgDCNy8O7Cqhu5GNAaI0+Uw2gvgWemDXtgbzE=;
  b=m76EO7Aq+dHxIs4NkGGl9Uq2khLQ1gBYLBhQiu1QDJYMHMNGZ+AoMa4m
   +J2ntrSAgO0BZiUDpjlzoxQLOKzvOj1RuCofCeJQOufj6gLvu9K7hyaqc
   KxOh+ZVpNfr8REXxN5aP1yr8EjJ7Vm86RLIqaqD4iPaJtS9FnBzsp1/9C
   kPYWPSI30jcZVNVWlhOyGV/VfycNu8r+6u8NZ1lFyBzAH43vKJKgpLN3h
   TLNQNgi4WFdwJ1B6X8Z0yYj2vDdjhcMBqmehFK8fyPfxAQeM2VcSOCKB6
   HX6YGUErsv5RTIxBr7wsCHSoaJvaMVKDZP+lula92kMqatQFg2yq4JLKb
   w==;
X-CSE-ConnectionGUID: HKbesyUpQYm3KNgn+BryTg==
X-CSE-MsgGUID: LeKR01HcRdiD/6GZsNyzdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78421206"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="78421206"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 13:04:25 -0700
X-CSE-ConnectionGUID: ehzqrv20SZCKpFb3hXruCQ==
X-CSE-MsgGUID: g6kIAg1MS3yEz3t+qjON5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="230011887"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 29 Apr 2026 13:04:22 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIB8u-000000004Z7-12yj;
	Wed, 29 Apr 2026 20:04:20 +0000
Date: Wed, 29 Apr 2026 22:03:53 +0200
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 fuse-devel@lists.sourceforge.net
Subject: [mszeredi-fuse:fusex 40/40] fs/fuse/fusex.c:1601:16: error:
 use of undeclared identifier 'FUSE_SUPER_MAGIC'
Message-ID: <202604292109.XXl4iUUX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git fusex
head:   1934d254361977df9fad43102ec1d72e20434a99
commit: 1934d254361977df9fad43102ec1d72e20434a99 [40/40] fuse: add fusex filesystem
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260429/202604292109.XXl4iUUX-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260429/202604292109.XXl4iUUX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604292109.XXl4iUUX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/fuse/fusex.c:1601:16: error: use of undeclared identifier 'FUSE_SUPER_MAGIC'
    1601 |         sb->s_magic = FUSE_SUPER_MAGIC;
         |                       ^
   1 error generated.


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
