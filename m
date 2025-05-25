Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72A8189F56;
	Sun, 25 May 2025 06:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748156122; cv=none; b=ozPmG5TkPvoXTiTtkc3PmvqWvY0TTtcErE7TR5JnER75t0/DRNEozOw2DxZ4pKCqf67ovkMXS6/FFZZguhxOhy3/nroDXVJYODiXAQkq1TDHzxRnkrsff1FIbz+E8wg/U8Ew3gnCAXyghzxSSHQUPmW61S5BroCAbgnj3ZS5UpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748156122; c=relaxed/simple;
	bh=KbgDdQ5ZHvrDBcIDzbIxJ6ukrRkeKcS7+8EySjOWy0s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UxSfypbkTtwqmpPJIhXDbH6UgUgzoVeoxHS1r7ym2ExGh1rOeCt82ooOQgN4OJbPxNdovJ5uvX92kgMerGLNMpLpKjZwp8vhdd4xU3/lTCWT9Z7cMNaheiWRISOFc0OR5iWOCrpdYp2DjSi7c5riMy6vTsPQNv31ZpqwmSgMfb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YI4IpUdd; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YI4IpUdd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748156120; x=1779692120;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KbgDdQ5ZHvrDBcIDzbIxJ6ukrRkeKcS7+8EySjOWy0s=;
  b=YI4IpUddekOZ/tfz0V7F3IzfDIQ5vAYUNdZ0HjZzmQYMyUijDRuVKx7y
   /60BdFdekIBQvPejM0P5F+ez7F7sm/SPX3yqQcMrw5NVCfBQmK9mk4c4K
   9Mw281AK8d85kXz7XBm2T+mERorCvPGqJZ5jn6SR6Ktemee+4lkrTrIc3
   CLtwjmblvq5v3sMJHPBk8UxRTda/XsVet6/dCrqSnOVdNaCcvjOX5ZFR4
   HhomLvr2vE4u02QeJUe89aA47zJzh9qy0nhFMpMueTtlAE/WpkT2w7T2b
   aLOWy75tV+4niQCLPEIWKEdvGTqyXaRJHMEQFNYDoXXusPqRnRCQEIz7W
   Q==;
X-CSE-ConnectionGUID: DyUZzFynTM2Njni1rJmu0w==
X-CSE-MsgGUID: LgJ+/Y69T1G1pKA6hEAE5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="67711339"
X-IronPort-AV: E=Sophos;i="6.15,312,1739865600"; 
   d="scan'208";a="67711339"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 23:55:20 -0700
X-CSE-ConnectionGUID: +TwgJoWEQxKhvFIIthOxTg==
X-CSE-MsgGUID: JYpo+NAQS9aRTYEmjTydUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,312,1739865600"; 
   d="scan'208";a="141734794"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 24 May 2025 23:55:19 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJ5GO-000RfE-24;
	Sun, 25 May 2025 06:55:16 +0000
Date: Sun, 25 May 2025 14:54:44 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 289/299]
 fs/bcachefs/xattr.c:539:4: error: cannot jump from this goto statement to
 its label
Message-ID: <202505251435.GQfUiwK2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   38d6d152803440c29cbcc3f7031d5feab5d84c20
commit: 809b2584df1a60e186abbf1666456fa8340aa964 [289/299] bcachefs: convert ei_update_lock to guards
config: arm64-randconfig-004-20250525 (https://download.01.org/0day-ci/archive/20250525/202505251435.GQfUiwK2-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250525/202505251435.GQfUiwK2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505251435.GQfUiwK2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/bcachefs/xattr.c:539:4: error: cannot jump from this goto statement to its label
     539 |                         goto err;
         |                         ^
   fs/bcachefs/xattr.c:565:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     565 |         guard(mutex)(&inode->ei_update_lock);
         |         ^
   include/linux/cleanup.h:319:15: note: expanded from macro 'guard'
     319 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:132:1: note: expanded from here
     132 | __UNIQUE_ID_guard871
         | ^
   fs/bcachefs/xattr.c:535:4: error: cannot jump from this goto statement to its label
     535 |                         goto err;
         |                         ^
   fs/bcachefs/xattr.c:565:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     565 |         guard(mutex)(&inode->ei_update_lock);
         |         ^
   include/linux/cleanup.h:319:15: note: expanded from macro 'guard'
     319 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:132:1: note: expanded from here
     132 | __UNIQUE_ID_guard871
         | ^
   2 errors generated.


vim +539 fs/bcachefs/xattr.c

   496	
   497	static int bch2_xattr_bcachefs_set(const struct xattr_handler *handler,
   498					   struct mnt_idmap *idmap,
   499					   struct dentry *dentry, struct inode *vinode,
   500					   const char *name, const void *value,
   501					   size_t size, int flags)
   502	{
   503		struct bch_inode_info *inode = to_bch_ei(vinode);
   504		struct bch_fs *c = inode->v.i_sb->s_fs_info;
   505		const struct bch_option *opt;
   506		char *buf;
   507		struct inode_opt_set s;
   508		int opt_id, inode_opt_id, ret;
   509	
   510		opt_id = bch2_opt_lookup(name);
   511		if (opt_id < 0)
   512			return -EINVAL;
   513	
   514		opt = bch2_opt_table + opt_id;
   515	
   516		inode_opt_id = opt_to_inode_opt(opt_id);
   517		if (inode_opt_id < 0)
   518			return -EINVAL;
   519	
   520		s.id = inode_opt_id;
   521	
   522		if (value) {
   523			u64 v = 0;
   524	
   525			buf = kmalloc(size + 1, GFP_KERNEL);
   526			if (!buf)
   527				return -ENOMEM;
   528			memcpy(buf, value, size);
   529			buf[size] = '\0';
   530	
   531			ret = bch2_opt_parse(c, opt, buf, &v, NULL);
   532			kfree(buf);
   533	
   534			if (ret < 0)
   535				goto err;
   536	
   537			ret = bch2_opt_hook_pre_set(c, NULL, opt_id, v);
   538			if (ret < 0)
 > 539				goto err;
   540	
   541			s.v = v + 1;
   542			s.defined = true;
   543		} else {
   544			/*
   545			 * Check if this option was set on the parent - if so, switched
   546			 * back to inheriting from the parent:
   547			 *
   548			 * rename() also has to deal with keeping inherited options up
   549			 * to date - see bch2_reinherit_attrs()
   550			 */
   551			spin_lock(&dentry->d_lock);
   552			if (!IS_ROOT(dentry)) {
   553				struct bch_inode_info *dir =
   554					to_bch_ei(d_inode(dentry->d_parent));
   555	
   556				s.v = bch2_inode_opt_get(&dir->ei_inode, inode_opt_id);
   557			} else {
   558				s.v = 0;
   559			}
   560			spin_unlock(&dentry->d_lock);
   561	
   562			s.defined = false;
   563		}
   564	
   565		guard(mutex)(&inode->ei_update_lock);
   566		if (inode_opt_id == Inode_opt_project) {
   567			/*
   568			 * inode fields accessible via the xattr interface are stored
   569			 * with a +1 bias, so that 0 means unset:
   570			 */
   571			ret = bch2_set_projid(c, inode, s.v ? s.v - 1 : 0);
   572			if (ret)
   573				goto err;
   574		}
   575	
   576		ret = bch2_write_inode(c, inode, inode_opt_set_fn, &s, 0);
   577	err:
   578		return bch2_err_class(ret);
   579	}
   580	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
