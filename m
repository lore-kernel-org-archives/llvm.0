Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B13033DB;
	Sat, 12 Apr 2025 22:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744497494; cv=none; b=UXxp0/iawRY8PNEDqwmxzCJPjx9YI1NRjfYNQ0TTwxFw6Pw15JruVa5gyKg2mJoOqVJ4i5A2LOYtgdWGMyFtpMncjiWUaYYq78FvLfybpn3yd/Oayy5ej3SGM/MifwzVoMTrO63TDfpE3dRQYmeAf2opc8eolbcRoSw0JXxnpN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744497494; c=relaxed/simple;
	bh=MFJdY5YeCNFXOhppgG525dCEyR/3V3zbq07FhS9Eib0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jfrFB11q5Q0EyUNehqT1/mt02ENTacIavua8CNMvSm6YA0cVW7NmyiAvJFJfFr1wrbzlSMjK6wphndV60DIm1oorm020BhoxubRELqB08JPwIQ+M7WOBKyBc6JNlQscdAA9zrP7SvYDpE2hoW6nT0+9dp0JEmA65LTQl/s8gt1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ndKv/FoJ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ndKv/FoJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744497493; x=1776033493;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MFJdY5YeCNFXOhppgG525dCEyR/3V3zbq07FhS9Eib0=;
  b=ndKv/FoJFu78sMpeT+QEDSuN1JoqVvxbIBnmB+0z50/t3R3hccuTA41/
   xgqwZoY2FQpJsz5vvSEJcl+5TQsWTU5t01FX/GjEAW17c+XPSzvYJR/2g
   5znKZgSpGK8eMFQrW6T7ZTHOz8g4D7pdgtT7UBRJEdPWtXm7Atiia5t35
   xcoF4oTMA7iGBGvGUIH498149+AoowYePA0w1hHGo+ydsxI4t8fOhWuNF
   IMw2q+grRmq7QcytLSzJaTcvG4LdvADMjtNhUwt+/VaRmtuggOszrJaxq
   Yd0/8ZnNy1qAf0wLyNGZiXplQl7bKLLTgaM95CEHMk475i+k2GqRqqkKP
   g==;
X-CSE-ConnectionGUID: Bn1qvMROSEaGwA4Ir97j6A==
X-CSE-MsgGUID: CSB3Oq9bTnOZQZotIFkopg==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="57379333"
X-IronPort-AV: E=Sophos;i="6.15,209,1739865600"; 
   d="scan'208";a="57379333"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 15:38:12 -0700
X-CSE-ConnectionGUID: gEX3VPH+SLy3CE9zzl2aEA==
X-CSE-MsgGUID: SpSNIEtOTpaOJCr5Te45JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,209,1739865600"; 
   d="scan'208";a="160470815"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Apr 2025 15:38:10 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3jUG-000CBi-1j;
	Sat, 12 Apr 2025 22:38:08 +0000
Date: Sun, 13 Apr 2025 06:37:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:netns-debugfs 3/3] net/core/net_namespace.c:1656:5:
 warning: format specifies type 'int' but the argument has type 'long'
Message-ID: <202504130642.HaAQv94V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git netns-debugfs
head:   193510c9521581018efe6f51e0aeddbafc8c103e
commit: 193510c9521581018efe6f51e0aeddbafc8c103e [3/3] net: add debugfs files for showing netns refcount tracking info
config: arm64-randconfig-004-20250413 (https://download.01.org/0day-ci/archive/20250413/202504130642.HaAQv94V-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250413/202504130642.HaAQv94V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504130642.HaAQv94V-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/core/net_namespace.c:1656:5: warning: format specifies type 'int' but the argument has type 'long' [-Wformat]
    1655 |                         pr_warn("net: unable to create ref_tracker/net_ns directory: %d\n",
         |                                                                                      ~~
         |                                                                                      %ld
    1656 |                                 PTR_ERR(ns_ref_tracker_dir));
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:554:37: note: expanded from macro 'pr_warn'
     554 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                    ~~~     ^~~~~~~~~~~
   include/linux/printk.h:501:60: note: expanded from macro 'printk'
     501 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:473:19: note: expanded from macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   1 warning generated.


vim +1656 net/core/net_namespace.c

  1647	
  1648	static int __init ns_debug_init(void)
  1649	{
  1650		int ret;
  1651	
  1652		if (ref_tracker_debug_dir) {
  1653			ns_ref_tracker_dir = debugfs_create_dir("net_ns", ref_tracker_debug_dir);
  1654			if (IS_ERR(ns_ref_tracker_dir)) {
  1655				pr_warn("net: unable to create ref_tracker/net_ns directory: %d\n",
> 1656					PTR_ERR(ns_ref_tracker_dir));

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
