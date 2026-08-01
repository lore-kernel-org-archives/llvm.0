Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6562EEE77;
	Sat,  1 Aug 2026 02:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785551177; cv=none; b=G6ARvSM5ESp1/8EhaH/BwC3boibjf0AI29MEkJV8xgqZnZI/NneEYLxA2JWIeH5ACEaPcQl3Y0fc9vxqfW0ISLahNv0me5thKzRXeH+fVT1tT5ATgKFadtja+25vyIBIAKJXVJdmm5/R8rbsRDspdjQ6QzlsKfH2wCz1Ej/2n44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785551177; c=relaxed/simple;
	bh=fG5QvWBSrqUNf/LQCbJA+fBJDng0xodfbhGRsUNNzEM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q/9P1NuV9l3TTKq9hdvDmYIOSiha+zJ7AG38m+agmjRmlxy+XbwWDE7U+mEm6xuu7qSlwi9H8fjzNpCGDaGdV/fU7zhggYrHcn0H+RYma1cjQseQK34y/Mk4E+U6qbNZoSpnKE92R5C6b2JEIcW7e+i+FN6W5Qm+zqcX9sPQbqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V34tGgdj; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V34tGgdj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785551175; x=1817087175;
  h=date:from:to:cc:subject:message-id;
  bh=fG5QvWBSrqUNf/LQCbJA+fBJDng0xodfbhGRsUNNzEM=;
  b=V34tGgdj28BJEDLeQ/XbgKLokyB9LiEeTESgYN9vZ4lafqMNDl4JJ9bx
   3jDnfMPr6eucJYKLJYBPj0OuCZhEjj3BX8SPyrvfEevuwxAStRlZbOKnA
   QHK/ze+XD8ka3jtnhwRWSKTdQ0rX3MX+iNBBhFccpS5ouzuNU3IaXH8q2
   OId2ZNNyji5AsxJw7DxTA3k+MMEZ9yoYF3inbXPr6KFu7NWpfzciXrLEI
   kjdSCzXb5q8JQ9PYMJp63ufAk4ewN/kBYmf4VjXDVitecYql3vPlV6hKf
   Xx9e5howYjs4NWDpmx+Bk2wM1IOhYrZxEiXyRH12VcR/vIsB4g5qxumS2
   Q==;
X-CSE-ConnectionGUID: jxQC2/5BS12zcpGDY+93qw==
X-CSE-MsgGUID: NhEKnXujSgeOeUKjM/t6Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="96837806"
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="96837806"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 19:26:14 -0700
X-CSE-ConnectionGUID: yiqvNRygQBS5qXSy3/MARw==
X-CSE-MsgGUID: 3FchK3U5QiyimeXb5JPZyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="260771589"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 31 Jul 2026 19:26:13 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpzQQ-000000002cX-32k2;
	Sat, 01 Aug 2026 02:26:10 +0000
Date: Sat, 01 Aug 2026 10:26:10 +0800
From: kernel test robot <lkp@intel.com>
To: David Disseldorp <ddiss@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Christian Brauner <brauner@kernel.org>
Subject: [linux-next:master 11199/11507]
 init/initramfs_test.c:580:15: error: call to undeclared function
 '__override_init_fs'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202608010904.q5YsN4ye-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   415606a7be939835db9b0d6b711887586646346d
commit: da46f0e1053c98355c2d7803ff1cc46617ca81bf [11199/11507] initramfs_test: use test init/exit hooks to override init fs
config: arm64-randconfig-001-20260801 (https://download.01.org/0day-ci/archive/20260801/202608010904.q5YsN4ye-lkp@intel.com/config)
compiler: clang version 21.1.8 (https://github.com/llvm/llvm-project 2078da43e25a4623cab2d0d60decddf709aaea28)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260801/202608010904.q5YsN4ye-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608010904.q5YsN4ye-lkp@intel.com/

Note: the linux-next/master HEAD 415606a7be939835db9b0d6b711887586646346d builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> init/initramfs_test.c:580:15: error: call to undeclared function '__override_init_fs'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     580 |         test->priv = __override_init_fs();
         |                      ^
>> init/initramfs_test.c:580:13: error: incompatible integer to pointer conversion assigning to 'void *' from 'int' [-Wint-conversion]
     580 |         test->priv = __override_init_fs();
         |                    ^ ~~~~~~~~~~~~~~~~~~~~
>> init/initramfs_test.c:586:2: error: call to undeclared function '__revert_init_fs'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     586 |         __revert_init_fs(test->priv);
         |         ^
   3 errors generated.


vim +/__override_init_fs +580 init/initramfs_test.c

   576	
   577	/* Tests run in a nullfs kthread; always use the init fs for path resolution. */
   578	static int __init initramfs_test_init(struct kunit *test)
   579	{
 > 580		test->priv = __override_init_fs();
   581		return 0;
   582	}
   583	
   584	static void __init initramfs_test_exit(struct kunit *test)
   585	{
 > 586		__revert_init_fs(test->priv);
   587	}
   588	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
