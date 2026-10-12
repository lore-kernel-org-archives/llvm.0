Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DD13A543A;
	Mon, 12 Oct 2026 18:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831058; cv=none; b=vEz1CVTLL7Pc6em/kSS2cBdGuXBKfYcHNSHqcDs45sTGgQ1KlHiEeDMQwY9/6l4fUDJei/FcOAf5/WUgORqUrHX33WQWmZ5RWgUoR/XBJSrX/ddL/OeqzcSPSWMS+QuLnvRN0wN3CJXr2orQbR1anWom5aA3lo94gjO0Nh8+4Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831058; c=relaxed/simple;
	bh=XswTEJBaB9wjb1TZEn4D0Wv15ymgz6LEKQZXH21JWL4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YOYlw8BL8ruXmCkzZOtTycaUevOFhow5YCfnRCnHNNH92PxgmKdt1yv6rpqAGtG0vyw9vg9oDp8u2s1KUOrrlI0YagceXYw+HtkSRTijZfnrUSprB6c8iFKVNhcNWq6UyD+muHiQkSdgAd6X6NqZ5CtAy3v3z8DYPPnvn8okpOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d9tIEBVS; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d9tIEBVS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791831057; x=1823367057;
  h=date:from:to:cc:subject:message-id;
  bh=XswTEJBaB9wjb1TZEn4D0Wv15ymgz6LEKQZXH21JWL4=;
  b=d9tIEBVS5vQLwtAhhfUTH0mOhi+6fyqp6U0cKqU5UrYmSX+VNelLuIvN
   xi6cMBmXtIVwwfY7B4Rc4pynSosfv/F/Do0tJ2IXN+koVgMSSbU14D4OY
   TPewIBoXqwjEPKd7PLvHGUxh1KsFpuUKdsWgmFrPKT7xRALIYlrspdhCn
   ZkleWD9rBgIaefmPysYQFVs6b9+DEamnzXfOSZmGjWxjOLWZCD4QEJ30n
   y6wAiZQ/miZutNrOdlwrwm6zIyiPh8DzKXiDIi2nNsFqPe9yxTzmqpWZ6
   9vKiBY3kr36VgAUVUCFQPpjwakcS+Co8CaivU3bv9a4wPD1rnzAVyX1c+
   Q==;
X-CSE-ConnectionGUID: o3qM6d49Qsy7pilIa4KUcw==
X-CSE-MsgGUID: 50DQEsSKRPG1rQpbf9h74w==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="430716"
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="430716"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 11:50:57 -0700
X-CSE-ConnectionGUID: FP7j9GTjT0u9xitgufCesg==
X-CSE-MsgGUID: ACzFs30FTwySrHg6WPAwKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,154,1787036400"; 
   d="scan'208";a="926799"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Oct 2026 11:50:55 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGL6r-00000000Bzw-26Fo;
	Mon, 12 Oct 2026 18:50:53 +0000
Date: Tue, 13 Oct 2026 02:50:19 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 2/2] fs/f2fs/file.c:1104:17: error: cannot
 assign to variable 'attr' with const-qualified type 'const struct iattr *'
Message-ID: <202610130215.eJAMJB4X-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   664d401caf1306ec655f7e729082dfccd36dc5da
commit: 664d401caf1306ec655f7e729082dfccd36dc5da [2/2] f2fs: opt in to multigrain timestamps
config: arm-randconfig-1001-20261012 (https://download.01.org/0day-ci/archive/20261013/202610130215.eJAMJB4X-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6719b9e31d6a93099612c474eec76d9f41d0275a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261013/202610130215.eJAMJB4X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610130215.eJAMJB4X-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/f2fs/file.c:1104:17: error: cannot assign to variable 'attr' with const-qualified type 'const struct iattr *'
    1104 |         attr->ia_valid &= ~ATTR_MODE;
         |         ~~~~~~~~~~~~~~ ^
   fs/f2fs/file.c:1100:48: note: variable 'attr' declared const here
    1100 |                            struct inode *inode, const struct iattr *attr)
         |                                                 ~~~~~~~~~~~~~~~~~~~~^~~~
   fs/f2fs/file.c:1113:18: error: cannot assign to variable 'attr' with const-qualified type 'const struct iattr *'
    1113 |                 attr->ia_valid |= ATTR_MODE;
         |                 ~~~~~~~~~~~~~~ ^
   fs/f2fs/file.c:1100:48: note: variable 'attr' declared const here
    1100 |                            struct inode *inode, const struct iattr *attr)
         |                                                 ~~~~~~~~~~~~~~~~~~~~^~~~
   2 errors generated.


vim +1104 fs/f2fs/file.c

  1097	
  1098	#ifdef CONFIG_F2FS_FS_POSIX_ACL
  1099	static void __setattr_copy(struct mnt_idmap *idmap,
  1100				   struct inode *inode, const struct iattr *attr)
  1101	{
  1102		unsigned int ia_valid = attr->ia_valid;
  1103	
> 1104		attr->ia_valid &= ~ATTR_MODE;
  1105	
  1106		setattr_copy(idmap, inode, attr);
  1107		if (ia_valid & ATTR_MODE) {
  1108			umode_t mode = attr->ia_mode;
  1109	
  1110			if (!in_group_or_capable(idmap, inode, i_gid_into_vfsgid(idmap, inode)))
  1111				mode &= ~S_ISGID;
  1112			set_acl_inode(inode, mode);
  1113			attr->ia_valid |= ATTR_MODE;
  1114		}
  1115	}
  1116	#else
  1117	#define __setattr_copy setattr_copy
  1118	#endif
  1119	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
