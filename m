Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB294C92;
	Sat, 13 Dec 2025 20:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765656260; cv=none; b=kLhc4D4YM6kMW+tmxGRZRv63iwf/PipuMw8mdl7T8H2ct7pehpYJJwV+S22PF23mZLBeb1ADFSvU9nBq6owNbaQp7vesYOkBB//fIXyLv3QQbAgoLcmA1eQfDEd67oUdp1XE9Y/jbJqAd1QaV37GFY+8SR6wvS6rZSs6jlgBMN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765656260; c=relaxed/simple;
	bh=yPvLwSgozYXKA9vJyCGldBeZm+Kl49mQZc9jy4XP0h4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AHVpNOtK2HFXKwPMO1Y4sQnxNlnorakEcouP5S4vhUbV38WrqxnJcUvWPYxrzkoI8X1qXDO074+AzXEmryhPiMf90IpKibOiCk8hNUIbAAlUzmX8LajKfuz3pDAajMpgRxCm3uhLneTJU+xy79q7pLbFfbqHD8SXwBgfGf7/q/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MSmSQiiN; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MSmSQiiN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765656258; x=1797192258;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yPvLwSgozYXKA9vJyCGldBeZm+Kl49mQZc9jy4XP0h4=;
  b=MSmSQiiNAHWGRtksaV487YSwo35WvwvXWv61FaYHxeSI7DOypfJ6CeIC
   0KqQGrioiG0J6nN6kzVKMn7uIozwaBG5OMY06GkeZOISI1zpXiv2gqNWE
   2KSVzC4VZrSKOovZgQhiY1uzeTBZIxS5LcRBEniS07He99E9rL3mmVthG
   8Pt1SCbq3eExPpH9hdxfCb9BsygG/V8HMAmKpWSg70jtkDeLODKw2D+gr
   UQADHJGU0ziDHOy/6Fiapvt084SZCNsL75p6Ggj6/0U4U/UrRGY1PtCO0
   vvTZ0XfeG7C9IWXrItctrq8ajsxwtRF7nArz+Zx65yyRGBYyHRZKIcgYK
   Q==;
X-CSE-ConnectionGUID: +roFF6P+QVCsKZU6Lhb9yQ==
X-CSE-MsgGUID: Mct70cNPQhq7Xsrku4Ty2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="71249805"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="71249805"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 12:04:18 -0800
X-CSE-ConnectionGUID: 7P6OexwlT26iOcy9vKxC4g==
X-CSE-MsgGUID: FF/+Jx3TTcOJ0+bwMjATkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="197361732"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Dec 2025 12:04:17 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUVqg-0000000089F-25dC;
	Sat, 13 Dec 2025 20:04:14 +0000
Date: Sun, 14 Dec 2025 04:03:18 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/uapi-nostdinc 6/6]
 usr/include/linux/vbox_vmmdev_types.h:239:4: error: field u within 'struct
 vmmdev_hgcm_function_parameter32' is less aligned than 'union (unnamed union
 at usr/include/linux/vbox_vmmdev_types.h:223:2)' and is usually due to
 'struct vmmdev_hgcm_function_par...
Message-ID: <202512140314.DzDxpIVn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/uapi-nostdinc
head:   59806b92f66b989adcbbac78ab7222ca3db172e6
commit: 59806b92f66b989adcbbac78ab7222ca3db172e6 [6/6] kbuild: uapi: drop dependency on CC_CAN_LINK
config: arm-randconfig-001-20251214 (https://download.01.org/0day-ci/archive/20251214/202512140314.DzDxpIVn-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140314.DzDxpIVn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140314.DzDxpIVn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
   In file included from ./usr/include/linux/vboxguest.h:14:
>> usr/include/linux/vbox_vmmdev_types.h:239:4: error: field u within 'struct vmmdev_hgcm_function_parameter32' is less aligned than 'union (unnamed union at usr/include/linux/vbox_vmmdev_types.h:223:2)' and is usually due to 'struct vmmdev_hgcm_function_parameter32' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]
     239 |         } u;
         |           ^
>> usr/include/linux/vbox_vmmdev_types.h:254:6: error: field u within 'struct vmmdev_hgcm_function_parameter64::(anonymous union)::(unnamed at usr/include/linux/vbox_vmmdev_types.h:249:3)' is less aligned than 'union (unnamed union at usr/include/linux/vbox_vmmdev_types.h:251:4)' and is usually due to 'struct vmmdev_hgcm_function_parameter64::(anonymous union)::(unnamed at usr/include/linux/vbox_vmmdev_types.h:249:3)' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]
     254 |                         } u;
         |                           ^
   2 errors generated.
--
   In file included from <built-in>:1:
>> ./usr/include/linux/hyperv.h:361:2: error: field  within 'struct hv_kvp_exchg_msg_value' is less aligned than 'union hv_kvp_exchg_msg_value::(anonymous at ./usr/include/linux/hyperv.h:361:2)' and is usually due to 'struct hv_kvp_exchg_msg_value' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]
     361 |         union {
         |         ^
   1 error generated.
--
   In file included from <built-in>:1:
>> ./usr/include/linux/vbox_vmmdev_types.h:239:4: error: field u within 'struct vmmdev_hgcm_function_parameter32' is less aligned than 'union (unnamed union at ./usr/include/linux/vbox_vmmdev_types.h:223:2)' and is usually due to 'struct vmmdev_hgcm_function_parameter32' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]
     239 |         } u;
         |           ^
>> ./usr/include/linux/vbox_vmmdev_types.h:254:6: error: field u within 'struct vmmdev_hgcm_function_parameter64::(anonymous union)::(unnamed at ./usr/include/linux/vbox_vmmdev_types.h:249:3)' is less aligned than 'union (unnamed union at ./usr/include/linux/vbox_vmmdev_types.h:251:4)' and is usually due to 'struct vmmdev_hgcm_function_parameter64::(anonymous union)::(unnamed at ./usr/include/linux/vbox_vmmdev_types.h:249:3)' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]
     254 |                         } u;
         |                           ^
   2 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
