Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB0337F0FF;
	Wed,  4 Feb 2026 06:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770186490; cv=none; b=f9X7NWMGoVuGatle3lOwZcDDDIWb0uAg1EzOVrcM9T298J2RhaEhw7Prk8czCvZ7emRZLYuMlZ6aCQFTFfvSaXYTq7DSxgriWfaySncAw/1CwgmH/ysMXTnUGWK+yVqi/x/0fiDuaxCmT8dao0WsXGkM9j6HKuOJIDjTbV2dAkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770186490; c=relaxed/simple;
	bh=Ss+6SxOMli8ukLp6d2DRkGJDQp+Z7zuvheuLtf4+Dts=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NKNoO9cLjFOWUxIPx2MqdIzF+hfIPILuHtHkbTEzRDb3t1F8eTJxjxbnfM2u2cjIes6KKYdQc1/PXGADDKQ1aOfLCYpyRa/mpxXAX1ulOXAu0ieUa27FyZMjgfLqbM9QW39M0yg/gXyCXfnv8c7xUU1U67j0Jo6r+43qRiMUL5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V3jkK3NG; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V3jkK3NG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770186491; x=1801722491;
  h=date:from:to:cc:subject:message-id;
  bh=Ss+6SxOMli8ukLp6d2DRkGJDQp+Z7zuvheuLtf4+Dts=;
  b=V3jkK3NGc5tUzsewbuvBVCOahIAA6+9Z7XuebXciZ59S2p2jfcaXcFCq
   njrm9S/YCLRNmnymgOT3JBFKm8FbMHM5FsEIuj0oocq0ZqLZbhRIzXn7r
   Pjr0KeTN0ZDrZY/6wRTb0LGwpCFDc2gYnzmLCjqN/eQ2JcB+mZQFKEmfm
   saAjf1WL1F8BquS0oAGGGtwesop8kLkZ/eMg7N1BzxOZjHM49VJ9UtNAK
   v0tnKM+1c77JJfHaX4WPN9PxGt8OPVhU5QcizYJ8bWeEirn+X3ilaJdaZ
   41cmZE+mE5h9XmjpZkIHozAEW7oUMeD9MiAP0QMjuixOzZE+ARH6Ofg4Q
   Q==;
X-CSE-ConnectionGUID: k+treu5MRK2mDBYJ4pvpnw==
X-CSE-MsgGUID: KcUv6vMeQhaeH773FZiY6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71271267"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="71271267"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 22:28:09 -0800
X-CSE-ConnectionGUID: fDO73LqeQaGHaXYJ0CaO9A==
X-CSE-MsgGUID: Znz+mOb/TveITXed645AQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="209367562"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Feb 2026 22:28:08 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnWMv-00000000hVK-1me9;
	Wed, 04 Feb 2026 06:28:05 +0000
Date: Wed, 04 Feb 2026 14:27:11 +0800
From: kernel test robot <lkp@intel.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 ntfs3@lists.linux.dev
Subject: [paragon-software-group-ntfs3:devel 23/23]
 fs/ntfs3/super.c:388:3: warning: unannotated fall-through between switch
 labels
Message-ID: <202602041402.uojBz5QY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/Paragon-Software-Group/linux-ntfs3.git devel
head:   3c6248937fb9fe5cfb29aa8813e18c50095e4db7
commit: 3c6248937fb9fe5cfb29aa8813e18c50095e4db7 [23/23] fs/ntfs3: allow explicit boolean acl/prealloc mount options
config: s390-randconfig-001-20260204 (https://download.01.org/0day-ci/archive/20260204/202602041402.uojBz5QY-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602041402.uojBz5QY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602041402.uojBz5QY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ntfs3/super.c:388:3: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     388 |                 case Opt_acl:
         |                 ^
   fs/ntfs3/super.c:388:3: note: insert '__attribute__((fallthrough));' to silence this warning
     388 |                 case Opt_acl:
         |                 ^
         |                 __attribute__((fallthrough)); 
   fs/ntfs3/super.c:388:3: note: insert 'break;' to avoid fall-through
     388 |                 case Opt_acl:
         |                 ^
         |                 break; 
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=m]
   Selected by [m]:
   - CAN [=m] && NET [=y]
   WARNING: unmet direct dependencies detected for OF_GPIO
   Depends on [n]: GPIOLIB [=y] && OF [=y] && HAS_IOMEM [=n]
   Selected by [y]:
   - REGULATOR_RT5133 [=y] && REGULATOR [=y] && I2C [=y] && GPIOLIB [=y] && OF [=y]


vim +388 fs/ntfs3/super.c

610f8f5a7baf998 Kari Argillander   2021-09-07  323  
610f8f5a7baf998 Kari Argillander   2021-09-07  324  static int ntfs_fs_parse_param(struct fs_context *fc,
610f8f5a7baf998 Kari Argillander   2021-09-07  325  			       struct fs_parameter *param)
610f8f5a7baf998 Kari Argillander   2021-09-07  326  {
610f8f5a7baf998 Kari Argillander   2021-09-07  327  	struct ntfs_mount_options *opts = fc->fs_private;
610f8f5a7baf998 Kari Argillander   2021-09-07  328  	struct fs_parse_result result;
610f8f5a7baf998 Kari Argillander   2021-09-07  329  	int opt;
610f8f5a7baf998 Kari Argillander   2021-09-07  330  
610f8f5a7baf998 Kari Argillander   2021-09-07  331  	opt = fs_parse(fc, ntfs_fs_parameters, param, &result);
610f8f5a7baf998 Kari Argillander   2021-09-07  332  	if (opt < 0)
610f8f5a7baf998 Kari Argillander   2021-09-07  333  		return opt;
610f8f5a7baf998 Kari Argillander   2021-09-07  334  
610f8f5a7baf998 Kari Argillander   2021-09-07  335  	switch (opt) {
82cae269cfa9530 Konstantin Komarov 2021-08-13  336  	case Opt_uid:
c449cb5d1bcedb8 Eric Sandeen       2024-06-27  337  		opts->fs_uid = result.uid;
82cae269cfa9530 Konstantin Komarov 2021-08-13  338  		break;
82cae269cfa9530 Konstantin Komarov 2021-08-13  339  	case Opt_gid:
c449cb5d1bcedb8 Eric Sandeen       2024-06-27  340  		opts->fs_gid = result.gid;
82cae269cfa9530 Konstantin Komarov 2021-08-13  341  		break;
82cae269cfa9530 Konstantin Komarov 2021-08-13  342  	case Opt_umask:
610f8f5a7baf998 Kari Argillander   2021-09-07  343  		if (result.uint_32 & ~07777)
610f8f5a7baf998 Kari Argillander   2021-09-07  344  			return invalf(fc, "ntfs3: Invalid value for umask.");
610f8f5a7baf998 Kari Argillander   2021-09-07  345  		opts->fs_fmask_inv = ~result.uint_32;
610f8f5a7baf998 Kari Argillander   2021-09-07  346  		opts->fs_dmask_inv = ~result.uint_32;
610f8f5a7baf998 Kari Argillander   2021-09-07  347  		opts->fmask = 1;
610f8f5a7baf998 Kari Argillander   2021-09-07  348  		opts->dmask = 1;
82cae269cfa9530 Konstantin Komarov 2021-08-13  349  		break;
82cae269cfa9530 Konstantin Komarov 2021-08-13  350  	case Opt_dmask:
610f8f5a7baf998 Kari Argillander   2021-09-07  351  		if (result.uint_32 & ~07777)
610f8f5a7baf998 Kari Argillander   2021-09-07  352  			return invalf(fc, "ntfs3: Invalid value for dmask.");
610f8f5a7baf998 Kari Argillander   2021-09-07  353  		opts->fs_dmask_inv = ~result.uint_32;
82cae269cfa9530 Konstantin Komarov 2021-08-13  354  		opts->dmask = 1;
82cae269cfa9530 Konstantin Komarov 2021-08-13  355  		break;
82cae269cfa9530 Konstantin Komarov 2021-08-13  356  	case Opt_fmask:
610f8f5a7baf998 Kari Argillander   2021-09-07  357  		if (result.uint_32 & ~07777)
610f8f5a7baf998 Kari Argillander   2021-09-07  358  			return invalf(fc, "ntfs3: Invalid value for fmask.");
610f8f5a7baf998 Kari Argillander   2021-09-07  359  		opts->fs_fmask_inv = ~result.uint_32;
82cae269cfa9530 Konstantin Komarov 2021-08-13  360  		opts->fmask = 1;
82cae269cfa9530 Konstantin Komarov 2021-08-13  361  		break;
610f8f5a7baf998 Kari Argillander   2021-09-07  362  	case Opt_immutable:
568f1140b9ca92d Konstantin Komarov 2024-07-01  363  		opts->sys_immutable = 1;
610f8f5a7baf998 Kari Argillander   2021-09-07  364  		break;
82cae269cfa9530 Konstantin Komarov 2021-08-13  365  	case Opt_discard:
568f1140b9ca92d Konstantin Komarov 2024-07-01  366  		opts->discard = 1;
82cae269cfa9530 Konstantin Komarov 2021-08-13  367  		break;
82cae269cfa9530 Konstantin Komarov 2021-08-13  368  	case Opt_force:
568f1140b9ca92d Konstantin Komarov 2024-07-01  369  		opts->force = 1;
82cae269cfa9530 Konstantin Komarov 2021-08-13  370  		break;
82cae269cfa9530 Konstantin Komarov 2021-08-13  371  	case Opt_sparse:
568f1140b9ca92d Konstantin Komarov 2024-07-01  372  		opts->sparse = 1;
82cae269cfa9530 Konstantin Komarov 2021-08-13  373  		break;
82cae269cfa9530 Konstantin Komarov 2021-08-13  374  	case Opt_nohidden:
568f1140b9ca92d Konstantin Komarov 2024-07-01  375  		opts->nohidden = 1;
82cae269cfa9530 Konstantin Komarov 2021-08-13  376  		break;
098250db5dfcc01 Konstantin Komarov 2022-09-12  377  	case Opt_hide_dot_files:
568f1140b9ca92d Konstantin Komarov 2024-07-01  378  		opts->hide_dot_files = 1;
098250db5dfcc01 Konstantin Komarov 2022-09-12  379  		break;
1d07a9dfa19914a Daniel Pinto       2022-10-10  380  	case Opt_windows_names:
568f1140b9ca92d Konstantin Komarov 2024-07-01  381  		opts->windows_names = 1;
1d07a9dfa19914a Daniel Pinto       2022-10-10  382  		break;
16b3dbfb5d5cdfb Konstantin Komarov 2023-02-15  383  	case Opt_showmeta:
568f1140b9ca92d Konstantin Komarov 2024-07-01  384  		opts->showmeta = 1;
16b3dbfb5d5cdfb Konstantin Komarov 2023-02-15  385  		break;
3c6248937fb9fe5 Konstantin Komarov 2026-01-30  386  	case Opt_acl_bool:
3c6248937fb9fe5 Konstantin Komarov 2026-01-30  387  		if (result.boolean) {
82cae269cfa9530 Konstantin Komarov 2021-08-13 @388  		case Opt_acl:
82cae269cfa9530 Konstantin Komarov 2021-08-13  389  #ifdef CONFIG_NTFS3_FS_POSIX_ACL
610f8f5a7baf998 Kari Argillander   2021-09-07  390  			fc->sb_flags |= SB_POSIXACL;
82cae269cfa9530 Konstantin Komarov 2021-08-13  391  #else
96de65a9413e042 Konstantin Komarov 2023-01-17  392  			return invalf(
96de65a9413e042 Konstantin Komarov 2023-01-17  393  				fc, "ntfs3: Support for ACL not compiled in!");
82cae269cfa9530 Konstantin Komarov 2021-08-13  394  #endif
3c6248937fb9fe5 Konstantin Komarov 2026-01-30  395  		} else
610f8f5a7baf998 Kari Argillander   2021-09-07  396  			fc->sb_flags &= ~SB_POSIXACL;
610f8f5a7baf998 Kari Argillander   2021-09-07  397  		break;
e274cde8c7550ca Kari Argillander   2021-09-07  398  	case Opt_iocharset:
610f8f5a7baf998 Kari Argillander   2021-09-07  399  		kfree(opts->nls_name);
610f8f5a7baf998 Kari Argillander   2021-09-07  400  		opts->nls_name = param->string;
610f8f5a7baf998 Kari Argillander   2021-09-07  401  		param->string = NULL;
82cae269cfa9530 Konstantin Komarov 2021-08-13  402  		break;
82cae269cfa9530 Konstantin Komarov 2021-08-13  403  	case Opt_prealloc:
3c6248937fb9fe5 Konstantin Komarov 2026-01-30  404  		opts->prealloc = 1;
3c6248937fb9fe5 Konstantin Komarov 2026-01-30  405  		break;
3c6248937fb9fe5 Konstantin Komarov 2026-01-30  406  	case Opt_prealloc_bool:
3c6248937fb9fe5 Konstantin Komarov 2026-01-30  407  		opts->prealloc = result.boolean;
82cae269cfa9530 Konstantin Komarov 2021-08-13  408  		break;
a3a956c78efaa20 Konstantin Komarov 2022-09-23  409  	case Opt_nocase:
568f1140b9ca92d Konstantin Komarov 2024-07-01  410  		opts->nocase = 1;
a3a956c78efaa20 Konstantin Komarov 2022-09-23  411  		break;
82cae269cfa9530 Konstantin Komarov 2021-08-13  412  	default:
610f8f5a7baf998 Kari Argillander   2021-09-07  413  		/* Should not be here unless we forget add case. */
82cae269cfa9530 Konstantin Komarov 2021-08-13  414  		return -EINVAL;
82cae269cfa9530 Konstantin Komarov 2021-08-13  415  	}
82cae269cfa9530 Konstantin Komarov 2021-08-13  416  	return 0;
82cae269cfa9530 Konstantin Komarov 2021-08-13  417  }
82cae269cfa9530 Konstantin Komarov 2021-08-13  418  

:::::: The code at line 388 was first introduced by commit
:::::: 82cae269cfa953032fbb8980a7d554d60fb00b17 fs/ntfs3: Add initialization of super block

:::::: TO: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
:::::: CC: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
