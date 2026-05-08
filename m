Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7636935CB6F;
	Fri,  8 May 2026 23:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778282135; cv=none; b=lz7s+VbOwUuYMM/UHeCXpwD5zRkSfJ9ya3JzYSLyvtApsajXb3dXnOTZfzTYMwjLYajDdR8WT/IfB7Z4jOscVg15JlUOXE+yN3dpDpi05H55DkRr4JC7xZOiqzXtSIBQC17su112vamsPo3v8O1iV51Yd0IoHIeyWmZ3AtvhrWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778282135; c=relaxed/simple;
	bh=U0+B3uHVrkmoYknwZABwHo3BcmeQsnR2QhzaVTzs9uo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SWtdIixG+oibEXsGFj2BzBmukmM/ycm7+MAVHwJw1u+3YSPWYy84+jg6aybYXXXcfkfopUNmO+cNN7szGefReXNrV1tngho6s1jn66MZGmCYFoz0WDEuaHCPzqIr2BD2KD1+2DvvTZmyFr2CdoMn0z5aLUxEPwcpoQURee9u6FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZM4C1nGD; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZM4C1nGD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778282133; x=1809818133;
  h=date:from:to:cc:subject:message-id;
  bh=U0+B3uHVrkmoYknwZABwHo3BcmeQsnR2QhzaVTzs9uo=;
  b=ZM4C1nGDj2eEAlvYfmWo7cotMRhtBUfm1vSeqY51o8uzD6okf97Olti4
   MXx2WXPRtGRyGSx5mWPg9n5Uxaq8DM0P5DGlEpmZhT9el5Awy8ro2GLUh
   WxFBvtTliLOVKHcOGphDzhXMsXyiTTqQfBabD4JevcJ+zmQLL/R75t81e
   ISlI+HNEHHTU3yBbXRP2O4UjALqm2qx3g4iZSfRPL8fkb6a2jn4WadebL
   5Mc3b3ddlD5BD8Pk07eSxwgPoRkYDtT7wDOFT0xflTC8fl0asddAKql/G
   yLHiAGcOJJ1wEp+PIxtkln15h7hbMX9+/rF0y48EzI9xJoxj6rNGiOpDT
   Q==;
X-CSE-ConnectionGUID: l7BJagfMTsSjSawxP6YRsQ==
X-CSE-MsgGUID: B/Yp1ZbHQ8SSngAubs8Z9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="101933331"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="101933331"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 16:15:33 -0700
X-CSE-ConnectionGUID: r2UtRfBbRDiYjs1cPaWOzQ==
X-CSE-MsgGUID: pFKrR6CRTUiv8pwoYx5oqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; 
   d="scan'208";a="238690674"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 May 2026 16:15:31 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLUPp-000000000UL-1FqX;
	Fri, 08 May 2026 23:15:29 +0000
Date: Sat, 09 May 2026 07:14:54 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/kvmclock_vs_tsc 28/39] WARNING: modpost:
 vmlinux: section mismatch in reference: kvm_sched_clock_init+0x3f (section:
 .text.unlikely.) -> __paravirt_set_sched_clock (section: .init.text)
Message-ID: <202605090742.ffwadDjT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Sean,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/sean-jc/linux x86/kvmclock_vs_tsc
head:   7a6c58b9f7997fb7485959a0aabea787d12e3fc3
commit: 4607bcbe328bd73372f72f7537da79a34fdfc777 [28/39] x86/paravirt: Mark __paravirt_set_sched_clock() as __init
config: i386-defconfig (https://download.01.org/0day-ci/archive/20260509/202605090742.ffwadDjT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605090742.ffwadDjT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605090742.ffwadDjT-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: kvm_sched_clock_init+0x3f (section: .text.unlikely.) -> __paravirt_set_sched_clock (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
