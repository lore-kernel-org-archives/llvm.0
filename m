Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901B03EDACC;
	Thu,  9 Jul 2026 09:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783588278; cv=none; b=SDd/qIOmXmeMvPsKpTnWrnZreg7e7PN5ogv/cFM0yCtXkbXbxE23Bu2tuf1gYRMUoJDj31uhKNrNZnfQR/L5ais8nYVKVXcKTDcTbBS9ZwWS3NR5Ppjk1+pHHR12wGVAXEncIn6qv3aiqsc3WFMeIk4I0PwE2/OBCnGUz+46Cw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783588278; c=relaxed/simple;
	bh=qImldtwQcmZ9mUR0zxQV4DvRCcGx0tCto0V4v5TyQ24=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BE6D80s2e7DXDIACmIBRLj8xp9UHNKOgCuiIioYj+0mlXtifk3fAXw+L79s1/jlLPdhv5JX5tspQvhfSdpp/ozrB5JRGvAEjQENQX4NNu7mwXehrfiSr2ZhC+eK4fFmiZccc1Ub0MOymDxFUqCiHTY5gnZO9qEoP3HLpxvzvlE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hjf2C9Vk; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hjf2C9Vk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783588277; x=1815124277;
  h=date:from:to:cc:subject:message-id;
  bh=qImldtwQcmZ9mUR0zxQV4DvRCcGx0tCto0V4v5TyQ24=;
  b=Hjf2C9VkqBbJDlyYf7h8z4iSKzJpqcpPsaE1mcmAV4aT//EeCkMthru5
   3uaWELnx04QbeGL73PIWjHU7Ps9eDTqXuBn8eyZeWDKy2h4XQ4P6PScKo
   4qSgbfsI11yn2/cSfOO/anQjMJUxMd2pVkpKnwPLm3r04m0fMVSQFQcfG
   cW/WdH/vv5Kj4uM14AgOQVkcoKIm9iee3zDiH/GmEFGly0/ICf6731/hB
   PvQpCEQOOFFNavpQcwUUXit5JL5N5gx84pU2Q6Ma0c0FY/VQUJAFTa2ut
   git27gKW6tx4EQWdM3cdyaJxGM/FDC2bYi/UYpcoNs7QroHQ282kXwBG5
   g==;
X-CSE-ConnectionGUID: XwpqdJ/HRzmmF2MZ65AbSw==
X-CSE-MsgGUID: RmtbrfQHS1+cZv0xKBTEXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84141515"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84141515"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 02:11:16 -0700
X-CSE-ConnectionGUID: c9uD7gtTRYODHIZaYGuAtw==
X-CSE-MsgGUID: O4hMbCS5QeKK41luCJSbWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="292722922"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 09 Jul 2026 02:11:14 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whkmi-00000000HUh-2e5G;
	Thu, 09 Jul 2026 09:11:09 +0000
Date: Thu, 09 Jul 2026 17:10:17 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/qemu_boot 20/69] Makefile:1629: warning:
 overriding recipe for target 'dtbs'
Message-ID: <202607091634.UXr9Ddde-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/qemu_boot
head:   89efd48e5609f41280973bc49df20ffe80177690
commit: abe97c987224d2686550fd938cd15c284c1132c3 [20/69] hexagon: update build system and Kconfig
config: hexagon-randconfig-001 (https://download.01.org/0day-ci/archive/20260709/202607091634.UXr9Ddde-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607091634.UXr9Ddde-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607091634.UXr9Ddde-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Makefile:1629: warning: overriding recipe for target 'dtbs'
   arch/hexagon/Makefile:83: warning: ignoring old recipe for target 'dtbs'
   make[2]: *** [Makefile:2184: .] Error 2 shuffle=2075589911
   make[2]: Target '__all' not remade because of errors.
--
>> Makefile:1629: warning: overriding recipe for target 'dtbs'
   arch/hexagon/Makefile:83: warning: ignoring old recipe for target 'dtbs'
   scripts/Makefile.clean:12: arch/hexagon/platform/sm8150/Makefile: No such file or directory
   make[3]: *** No rule to make target 'arch/hexagon/platform/sm8150/Makefile'.
   scripts/Makefile.clean:12: Failed to remake makefile 'arch/hexagon/platform/sm8150/Makefile'.
   make[2]: *** [Makefile:2189: _clean_arch/hexagon/platform/sm8150] Error 2 shuffle=2075589911
   make[2]: Target 'distclean' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=2075589911
   make[1]: Target 'distclean' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=2075589911
   make: Target 'distclean' not remade because of errors.
--
>> Makefile:1629: warning: overriding recipe for target 'dtbs'
   arch/hexagon/Makefile:83: warning: ignoring old recipe for target 'dtbs'
--
>> Makefile:1629: warning: overriding recipe for target 'dtbs'
   arch/hexagon/Makefile:83: warning: ignoring old recipe for target 'dtbs'
--
>> /kbuild/src/Makefile:1629: warning: overriding recipe for target 'dtbs'
   /kbuild/src/arch/hexagon/Makefile:83: warning: ignoring old recipe for target 'dtbs'
   /kbuild/src/scripts/Makefile.clean:12: /kbuild/src/arch/hexagon/platform/sm8150/Makefile: No such file or directory
   make[3]: *** No rule to make target '/kbuild/src/arch/hexagon/platform/sm8150/Makefile'.
   /kbuild/src/scripts/Makefile.clean:12: Failed to remake makefile '/kbuild/src/arch/hexagon/platform/sm8150/Makefile'.
   make[2]: *** [/kbuild/src/Makefile:2189: _clean_arch/hexagon/platform/sm8150] Error 2 shuffle=2075589911
   make[2]: Target 'mrproper' not remade because of errors.
   make[1]: *** [/kbuild/src/Makefile:248: __sub-make] Error 2 shuffle=2075589911
   make[1]: Target 'mrproper' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=2075589911
   make: Target 'mrproper' not remade because of errors.
--
>> Makefile:1629: warning: overriding recipe for target 'dtbs'
   arch/hexagon/Makefile:83: warning: ignoring old recipe for target 'dtbs'


vim +/dtbs +1629 Makefile

37c8a5fafa3bb7 Rob Herring     2018-01-10  1620  
ee47620367d5b5 Masahiro Yamada 2022-07-24  1621  %.dtb: dtbs_prepare
75e895343d5a2f Rob Herring     2021-12-08  1622  	$(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
37c8a5fafa3bb7 Rob Herring     2018-01-10  1623  
ee47620367d5b5 Masahiro Yamada 2022-07-24  1624  %.dtbo: dtbs_prepare
75e895343d5a2f Rob Herring     2021-12-08  1625  	$(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
ce88c9c79455fb Viresh Kumar    2021-01-29  1626  
ee47620367d5b5 Masahiro Yamada 2022-07-24  1627  PHONY += dtbs dtbs_prepare dtbs_install dtbs_check
ee47620367d5b5 Masahiro Yamada 2022-07-24  1628  dtbs: dtbs_prepare
24507871c3c6ae Masahiro Yamada 2024-01-09 @1629  	$(Q)$(MAKE) $(build)=$(dtstree) need-dtbslist=1
37c8a5fafa3bb7 Rob Herring     2018-01-10  1630  

:::::: The code at line 1629 was first introduced by commit
:::::: 24507871c3c6ae4f6b460b016da7ff434cd34149 kbuild: create a list of all built DTB files

:::::: TO: Masahiro Yamada <masahiroy@kernel.org>
:::::: CC: Masahiro Yamada <masahiroy@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
