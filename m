Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A1027B4F5;
	Sat,  1 Nov 2025 11:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761996540; cv=none; b=bLoVa+NaPv8VO9A5VA8qUU/kV6vG6axAH4wRSiakoGBSviEiTNxUuJWr4PtUI7iNOf1Dpm2xHG20LSZswNefj3gfwMnJv0OvanPVS/4yF0Doj9q2blJY7SOOUOHY3wYlQy4rgy0CqhMuWnuzZos2Iz9EmBGrrw4Bra05xT9p/7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761996540; c=relaxed/simple;
	bh=bZyZctrlyARlI0CVXxQFWpD9m3c0JwiWscLiyClKf3M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BYGLKAPn+VVfojYWmHHQoT5zkDD0nziKHcBvtSfeh171vnQc1XW0qA46dvUjIb49kxAk/ZDO8KhmLG/6UHQeAjrPtgfMIPAvTyHq/KahVi1Pt5RJ8A9GY61lgoCY4Z3H1kHeYKH2BQ5IQ5JcEZfBbdc1+rNwzGKYSq60imQK4Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EVfboh2c; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EVfboh2c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761996539; x=1793532539;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bZyZctrlyARlI0CVXxQFWpD9m3c0JwiWscLiyClKf3M=;
  b=EVfboh2cIauhANaR1YuDTS4ixCB1Ms8dEAguJVYZWL+ILRKTak5aTjlM
   ScmVuglIeV/+HKPs9I3ntOFPzARbvB7p55TpBtntcGJKbaioj89838gyw
   FSsMM+HMNVzQvpJv5HR5k8lTAjX0HDcXrWSTO/IqMtFWLJbkGwgQFzF8b
   DIIlxwOlaUO6Odp/ENwWcI5pg3lifFxprbZwVZ9lTP6HmkYbZfy7MuULi
   KUp+OzKeO7lumviTTuJNj228OFhhwlmZuLyqoU/0qBfZgwKTvmBGXlnR4
   ZYobkre1PF+pudtwAZfCJ7HURjEfg0UifW3YVqg4N9Mw64KH92RiA6nwp
   A==;
X-CSE-ConnectionGUID: YsG7/RtFSPq8qHJFQHEcoA==
X-CSE-MsgGUID: HcAOE0VPRhaM6wtz+3ly3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="64292773"
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="64292773"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 04:28:59 -0700
X-CSE-ConnectionGUID: 2xP0ti45Qn+pGcLFzm2g4Q==
X-CSE-MsgGUID: x6qkI3VISo63GN/7T2mKnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,272,1754982000"; 
   d="scan'208";a="217095312"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 01 Nov 2025 04:28:57 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vF9mx-000OBs-05;
	Sat, 01 Nov 2025 11:28:55 +0000
Date: Sat, 1 Nov 2025 19:28:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg-ro 10/18] fs/overlayfs/overlayfs.h:242:17: error:
 use of undeclared identifier 'excl'
Message-ID: <202511011954.WIkEz4HB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg-ro
head:   11745d0a0c6d135c474313a710719825fbe81aed
commit: bc283d81b7ed9334c956382e7d234954aac17c03 [10/18] vfs: add struct createdata for passing arguments to vfs_create()
config: s390-randconfig-001-20251101 (https://download.01.org/0day-ci/archive/20251101/202511011954.WIkEz4HB-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511011954.WIkEz4HB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511011954.WIkEz4HB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/overlayfs/namei.c:15:
>> fs/overlayfs/overlayfs.h:242:17: error: use of undeclared identifier 'excl'
     242 |                                     .excl = excl };
         |                                             ^
   1 error generated.


vim +/excl +242 fs/overlayfs/overlayfs.h

   233	
   234	static inline int ovl_do_create(struct ovl_fs *ofs,
   235					struct inode *dir, struct dentry *dentry,
   236					umode_t mode)
   237	{
   238		struct createdata cargs = { .idmap = ovl_upper_mnt_idmap(ofs),
   239					    .dir = dir,
   240					    .dentry = dentry,
   241					    .mode = mode,
 > 242					    .excl = excl };
   243		int err = vfs_create(&cargs);
   244	
   245		pr_debug("create(%pd2, 0%o) = %i\n", dentry, mode, err);
   246		return err;
   247	}
   248	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
