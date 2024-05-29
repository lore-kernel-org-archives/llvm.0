Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7F99474;
	Wed, 29 May 2024 10:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716980238; cv=none; b=lXrPZnN7miBaDjtC5Zhtb11I1HLGR74jAJgqHWU3XFNnYqiJHLrfKXLBvD53i9SOsn1gkpE1ups27ufMbLxcvdHr+Q1uI6U0AMThYdlZ6jncOcRB1Xp+LT+vkviV919Do4A8XxeagF7lGywcesuD0Y+enLXpKvGvXHVAsaG39sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716980238; c=relaxed/simple;
	bh=ctD49qVERR2dHv1J4v4UmR3i9jG/YE+pVf0bMo3bCKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sSRf4Ga7Ytw+R9rjeGoWse40KZXlm04heLn2WpQr4jZ6YZW7KHGSQGP9bvwv104PrMEUeSeHa0IVdp6Lh/UxMAesuNj9H7Mxhz2CMOFX2wUHa9zG4ScpPVILPXDtRLBm77rCe4tfNHcRxiof5FO/rmU7wfN1NTbw2Au16/IgZ5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P1IHeRAz; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P1IHeRAz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716980236; x=1748516236;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ctD49qVERR2dHv1J4v4UmR3i9jG/YE+pVf0bMo3bCKQ=;
  b=P1IHeRAzx9MqPMvfggL4mvDfMusGSi0j/594FzhzXqmcMCCTiO6ixpDS
   6/zh4Xt1U3k/xypDlhK5aVP6bZ7sK34W31twl0fViKf0KQ4P543Gv12xD
   jO16YZVQvmPrv8TzG0u9ueKReYE+EQFTFAeoEOWWqIX4UIi7zjvQGZy5y
   5o7fTb2e++gerBZuO5wdDx3GNMMO96PdrgpLXoGVy9FHZGuuuR6MJ+NNf
   m8sHM2sOkNCOe9XcdyTISckgHtyQbhRuLC/ET74moAhk6hp/hXRJq85fT
   0/5j3e/98XeBJcYAfW+WWPsTPn00H4U9IkxFSLhWXVLYNMCGb9yaSswI5
   g==;
X-CSE-ConnectionGUID: Jd/XJWUSSxaQk27hP5X+DQ==
X-CSE-MsgGUID: BH0DMw29QsKwOZD/ZQjiyg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13249912"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="13249912"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 03:57:15 -0700
X-CSE-ConnectionGUID: 3lgZ/CTcRFCU7r6ApjApTQ==
X-CSE-MsgGUID: HoHlOsDHRDGuIo+007P5cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="35346963"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 29 May 2024 03:57:14 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCGzX-000DXf-1k;
	Wed, 29 May 2024 10:57:11 +0000
Date: Wed, 29 May 2024 18:57:10 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Bertschinger <tahbertschinger@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:master 53/77] fs/bcachefs/fs.c:1723:7: warning: variable
 'ret' is used uninitialized whenever 'if' condition is true
Message-ID: <202405291826.785pVN5c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   f1229fe4c8f0262d814eae41e4c55627818205fe
commit: 6223304fab6387f4fdefd0681dd88a76b06f960f [53/77] bcachefs: use new mount API
config: i386-buildonly-randconfig-001-20240529 (https://download.01.org/0day-ci/archive/20240529/202405291826.785pVN5c-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240529/202405291826.785pVN5c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405291826.785pVN5c-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/fs.c:1723:7: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1723 |                 if (opts.read_only) {
         |                     ^~~~~~~~~~~~~~
   fs/bcachefs/fs.c:1747:24: note: uninitialized use occurs here
    1747 |         return bch2_err_class(ret);
         |                               ^~~
   fs/bcachefs/fs.c:1723:3: note: remove the 'if' if its condition is always false
    1723 |                 if (opts.read_only) {
         |                 ^~~~~~~~~~~~~~~~~~~~~
    1724 |                         bch2_fs_read_only(c);
         |                         ~~~~~~~~~~~~~~~~~~~~~
    1725 | 
    1726 |                         sb->s_flags |= SB_RDONLY;
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~
    1727 |                 } else {
         |                 ~~~~~~
>> fs/bcachefs/fs.c:1720:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    1720 |         if (opts.read_only != c->opts.read_only) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/fs.c:1747:24: note: uninitialized use occurs here
    1747 |         return bch2_err_class(ret);
         |                               ^~~
   fs/bcachefs/fs.c:1720:2: note: remove the 'if' if its condition is always true
    1720 |         if (opts.read_only != c->opts.read_only) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/fs.c:1716:9: note: initialize the variable 'ret' to silence this warning
    1716 |         int ret;
         |                ^
         |                 = 0
   2 warnings generated.


vim +1723 fs/bcachefs/fs.c

1c6fdbd8f2465d Kent Overstreet     2017-03-16  1711  
6223304fab6387 Thomas Bertschinger 2024-05-27  1712  static int bch2_remount(struct super_block *sb, int *flags,
6223304fab6387 Thomas Bertschinger 2024-05-27  1713  			struct bch_opts opts)
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1714  {
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1715  	struct bch_fs *c = sb->s_fs_info;
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1716  	int ret;
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1717  
62719cf33c3ad6 Kent Overstreet     2023-12-23  1718  	opt_set(opts, read_only, (*flags & SB_RDONLY) != 0);
62719cf33c3ad6 Kent Overstreet     2023-12-23  1719  
1c6fdbd8f2465d Kent Overstreet     2017-03-16 @1720  	if (opts.read_only != c->opts.read_only) {
1ada160618d66b Kent Overstreet     2020-06-15  1721  		down_write(&c->state_lock);
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1722  
1c6fdbd8f2465d Kent Overstreet     2017-03-16 @1723  		if (opts.read_only) {
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1724  			bch2_fs_read_only(c);
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1725  
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1726  			sb->s_flags |= SB_RDONLY;
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1727  		} else {
134915f3d38d83 Kent Overstreet     2019-03-21  1728  			ret = bch2_fs_read_write(c);
134915f3d38d83 Kent Overstreet     2019-03-21  1729  			if (ret) {
134915f3d38d83 Kent Overstreet     2019-03-21  1730  				bch_err(c, "error going rw: %i", ret);
1ada160618d66b Kent Overstreet     2020-06-15  1731  				up_write(&c->state_lock);
5c1ef830f67860 Kent Overstreet     2022-09-18  1732  				ret = -EINVAL;
5c1ef830f67860 Kent Overstreet     2022-09-18  1733  				goto err;
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1734  			}
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1735  
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1736  			sb->s_flags &= ~SB_RDONLY;
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1737  		}
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1738  
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1739  		c->opts.read_only = opts.read_only;
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1740  
1ada160618d66b Kent Overstreet     2020-06-15  1741  		up_write(&c->state_lock);
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1742  	}
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1743  
96dea3d599dbc3 Kent Overstreet     2023-09-12  1744  	if (opt_defined(opts, errors))
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1745  		c->opts.errors = opts.errors;
5c1ef830f67860 Kent Overstreet     2022-09-18  1746  err:
5c1ef830f67860 Kent Overstreet     2022-09-18  1747  	return bch2_err_class(ret);
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1748  }
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1749  

:::::: The code at line 1723 was first introduced by commit
:::::: 1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a bcachefs: Initial commit

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
