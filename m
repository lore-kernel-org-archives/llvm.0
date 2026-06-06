Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4559D15A864;
	Sat,  6 Jun 2026 02:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780711405; cv=none; b=OBrsdhxxDkOByqmZlbr/1xyXaV5RiQ97T2vAh5ADp+udpAdi/13z6iVAuNeRIXNlRtsNRrVeVNJ5btuErM64qFtTH0lr5/z/NIpo4m6SESL8gjKJQgLCeWklUu9LZkTyez/TEM7Ii1dgyXcBxeCFY0r5JjAFXecw6e8PYgKmPTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780711405; c=relaxed/simple;
	bh=hrVYxpDzJv2BTI5IkLYvEPDVhsevcSiUxi+z4+cv+K0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IJF/AF6ZLfdTG+F/WDAwaE7/EM59AbHt8M6UAZvE2DEltC4JiYMeZQ4TnHD0RHFfBbrSNfBh5LZHzSMggVld1qxCZEJrWtub1MZ40FzATB7Iw9qg8C+WqIfXQrkV2s8AqJS3l6GRc3R8aWvqecy/6y4B6b+n5MtzeFp9xC7xHG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NVxFjjRn; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NVxFjjRn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780711404; x=1812247404;
  h=date:from:to:cc:subject:message-id;
  bh=hrVYxpDzJv2BTI5IkLYvEPDVhsevcSiUxi+z4+cv+K0=;
  b=NVxFjjRnUXLJ7xMNrt5AebQ/AYHmpXznj7xkEdvhcOTEAScls2qRCy6o
   yS82Z8g5d1oZFJVGP+0SkLvxpJ/3GUhq/hjdTMrO3x2Rpm7ECL8J6KTVg
   usIdw5bw/Jp6oSwdlzYPVpls82e/CZ2LXwWVl7HNuQX7OynKRWlmF60qC
   ZpnAzHOssfIg6VHbXJyHsu30KI0kfyu9QR+b4m0APpzjCIwKYlStiH1AC
   aPcyYe75+PSRwMHALH6DcB54Ls468tu/092MbHCfIem4Mp0Ed0s9me4lB
   Cje19WXl3aW+2u1cbKG0dNaDPoVV8Z9K7yi7FmuZemiqVR8RRFEjXXKR+
   Q==;
X-CSE-ConnectionGUID: R52/7ppwS+6+0WNFep/yyQ==
X-CSE-MsgGUID: vrJTdzAfSQaQKW9AMLxDYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="106984307"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="106984307"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 19:03:24 -0700
X-CSE-ConnectionGUID: clE+jba9TCqr8sE3p3UAPg==
X-CSE-MsgGUID: 5LW2V3OZSmeIR2jZZsfeQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="275210387"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Jun 2026 19:03:22 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVgNb-00000000Geo-16Pn;
	Sat, 06 Jun 2026 02:03:19 +0000
Date: Sat, 06 Jun 2026 10:02:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jack Allister <jalliste@amazon.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 David Woodhouse <dwmw@amazon.co.uk>, Paul Durrant <paul@xen.org>
Subject: [dwmw2:kvmclock5 3/33] include/uapi/linux/types.h:10:2:
 warning: "Attempt to use kernel headers from user space, see
 https://kernelnewbies.org/KernelHeaders"
Message-ID: <202606060902.1Qe53P3P-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux kvmclock5
head:   716ce60a27514a682ba3db1e6df30ff7f28a019b
commit: e4fcb42667379f20341feafcbff11e57f46ff203 [3/33] UAPI: x86: Move pvclock-abi to UAPI for x86 platforms
config: x86_64-buildonly-randconfig-002-20260606 (https://download.01.org/0day-ci/archive/20260606/202606060902.1Qe53P3P-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260606/202606060902.1Qe53P3P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606060902.1Qe53P3P-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:1:
   In file included from include/xen/interface/xen.h:13:
   In file included from arch/x86/include/asm/xen/interface.h:197:
   In file included from arch/x86/include/uapi/asm/pvclock-abi.h:5:
   In file included from include/linux/types.h:5:
>> include/uapi/linux/types.h:10:2: warning: "Attempt to use kernel headers from user space, see https://kernelnewbies.org/KernelHeaders" [-W#warnings]
      10 | #warning "Attempt to use kernel headers from user space, see https://kernelnewbies.org/KernelHeaders"
         |  ^
   1 warning generated.
   In file included from <built-in>:1:
   In file included from include/xen/interface/xenpmu.h:5:
   In file included from include/xen/interface/xen.h:13:
   In file included from arch/x86/include/asm/xen/interface.h:197:
   In file included from arch/x86/include/uapi/asm/pvclock-abi.h:5:
   In file included from include/linux/types.h:5:
>> include/uapi/linux/types.h:10:2: warning: "Attempt to use kernel headers from user space, see https://kernelnewbies.org/KernelHeaders" [-W#warnings]
      10 | #warning "Attempt to use kernel headers from user space, see https://kernelnewbies.org/KernelHeaders"
         |  ^
   1 warning generated.


vim +10 include/uapi/linux/types.h

607ca46e97a1b6 David Howells       2012-10-13   6  
607ca46e97a1b6 David Howells       2012-10-13   7  #ifndef __ASSEMBLY__
607ca46e97a1b6 David Howells       2012-10-13   8  #ifndef	__KERNEL__
607ca46e97a1b6 David Howells       2012-10-13   9  #ifndef __EXPORTED_HEADERS__
7f317d34906c10 Alexander A. Klimov 2020-08-11 @10  #warning "Attempt to use kernel headers from user space, see https://kernelnewbies.org/KernelHeaders"
607ca46e97a1b6 David Howells       2012-10-13  11  #endif /* __EXPORTED_HEADERS__ */
607ca46e97a1b6 David Howells       2012-10-13  12  #endif
607ca46e97a1b6 David Howells       2012-10-13  13  

:::::: The code at line 10 was first introduced by commit
:::::: 7f317d34906c1033f0752fc137dda04e43979bb8 include/: replace HTTP links with HTTPS ones

:::::: TO: Alexander A. Klimov <grandmaster@al2klimov.de>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
