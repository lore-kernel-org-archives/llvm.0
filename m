Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FA8195;
	Thu, 12 Dec 2024 04:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733979193; cv=none; b=I0FRzbMofLj2WWpIliX/z25VYfN+IUZQQ69cbZDFUaej5rmzDqHsbVlcMmDAIxizHoUh1h+PgfykOjxEC3mXyBElA9cDwzlM1KOFu7NKcRHN+PbAWxAFJjsbsmDE/tOiPadTLvwmkBALb+FWqiiYMnr9vVsclH0te1vGMpn3Cs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733979193; c=relaxed/simple;
	bh=Sn2rTke51HuMjyP2NfyLpdqoNyG31WMOGhltFNqVVF4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mlGnxiTyK5NrMogcIbf8Pdl/AFciub/Yi6EguO0IL5aC18PfC6jM396pT4ranUygUE9HSxw7T2d0f0O6PxL1suNbk7tOvtNtYi2n1qbG0KCbJYSxOYmnn/zORl5FYBkokHPXLgDPvcLZ56AMSKPkEGNdua0qcy14V27OMXaL344=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CpeKgP64; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CpeKgP64"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733979191; x=1765515191;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Sn2rTke51HuMjyP2NfyLpdqoNyG31WMOGhltFNqVVF4=;
  b=CpeKgP64JFn0HR7AUhHuiSCIYCgoBcqvxxCqzpvKRzd/bww0YrdbR9f1
   dKBIiWkh+MgegWPTOLkaW3GUO1zmRKSzOQEKnJ9N7fV2pAaKBHwDZEuxN
   yKrLbkru8trWvFAYSK6BUr6Cs/INC5QNbENKhJ75ZT7Ou2Q5cbtg6dAHg
   8YC/GrVTyEytvPm3wdko4vq1t9NwL5Ya3SZC+A0scsTCC1fz6RLdMgCMQ
   UROb/wMkhjx7/eY7uvbYf03W20h5OKqZWXqhUpBWpbMhnV2x3XMPTS6O2
   /Jov72Q80gsn+hPGcTMQvqan23yAZ3Btr4D+cod4rvYQLzwhmArcara0i
   A==;
X-CSE-ConnectionGUID: rYtIxFI7Rj+SVmvcOoeWGg==
X-CSE-MsgGUID: soxUvKRoTomx+tZHUm9DiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="45765782"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="45765782"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 20:53:09 -0800
X-CSE-ConnectionGUID: W/KkfvfQQ8S1+Kv8IMbQOQ==
X-CSE-MsgGUID: WA3uF2YnSP62mID6apOcjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="95947180"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Dec 2024 20:53:09 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLbCD-0007S1-2l;
	Thu, 12 Dec 2024 04:53:05 +0000
Date: Thu, 12 Dec 2024 12:52:54 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/sysfs-const-bin_attr-s390 6/7]
 drivers/s390/cio/chp.c:221:1: error: initializing 'struct bin_attribute **'
 with an expression of type 'const struct bin_attribute *const[5]' discards
 qualifiers in nested pointer types
Message-ID: <202412121231.DvDDVbb9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/sysfs-const-bin_attr-s390
head:   8ae8d30bac9709d7b1824ebe3a28cc6f3017cd79
commit: 269b60415552dd90b391ef9ca088b2ee00497c03 [6/7] s390/cio/chp: Constify 'struct bin_attribute'
config: s390-randconfig-001-20241212 (https://download.01.org/0day-ci/archive/20241212/202412121231.DvDDVbb9-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412121231.DvDDVbb9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412121231.DvDDVbb9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/s390/cio/chp.c:221:1: error: initializing 'struct bin_attribute **' with an expression of type 'const struct bin_attribute *const[5]' discards qualifiers in nested pointer types [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     221 | BIN_ATTRIBUTE_GROUPS(measurement);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:296:15: note: expanded from macro 'BIN_ATTRIBUTE_GROUPS'
     296 |         .bin_attrs = _name##_attrs,                             \
         |                      ^~~~~~~~~~~~~
   <scratch space>:24:1: note: expanded from here
      24 | measurement_attrs
         | ^~~~~~~~~~~~~~~~~
   1 error generated.


vim +221 drivers/s390/cio/chp.c

2dc8903af775ecd Peter Oberparleiter 2024-03-26  213  
269b60415552dd9 Thomas Weiﬂschuh    2024-12-11  214  static const struct bin_attribute *const measurement_attrs[] = {
b4691baaeef07bd Peter Oberparleiter 2024-03-26  215  	&bin_attr_measurement_chars,
2f4b3b83b8c6e79 Peter Oberparleiter 2024-11-07  216  	&bin_attr_measurement_chars_full,
b4691baaeef07bd Peter Oberparleiter 2024-03-26  217  	&bin_attr_measurement,
2dc8903af775ecd Peter Oberparleiter 2024-03-26  218  	&bin_attr_ext_measurement,
b4691baaeef07bd Peter Oberparleiter 2024-03-26  219  	NULL,
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  220  };
b4691baaeef07bd Peter Oberparleiter 2024-03-26 @221  BIN_ATTRIBUTE_GROUPS(measurement);
e6b6e10ac1de116 Peter Oberparleiter 2007-04-27  222  

:::::: The code at line 221 was first introduced by commit
:::::: b4691baaeef07bdc4c3524a0702d7dd6899610b4 s390/cio: simplify measurement attribute registration

:::::: TO: Peter Oberparleiter <oberpar@linux.ibm.com>
:::::: CC: Alexander Gordeev <agordeev@linux.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
