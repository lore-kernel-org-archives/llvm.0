Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A5536728B;
	Thu,  9 Jul 2026 14:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783608650; cv=none; b=gA20TJ/ovJnfXLC7579PtpE06WvI//p4ojhsIsldMwYx2kpqOE90NdYmhm3HfqCSUSOMK2txYZyaOZNK6cl07pUJHqGM+al4iY6kDcSip2X07zb7G1sqXubk924WYMlf5P5h4LsXoou9j0BiS9sEEZ9DmsesXGw9Kk2tfMiTl1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783608650; c=relaxed/simple;
	bh=Fpe/KtLW3pTD7mF0WguHiHX6UjymtZ07lIkhyvHH0Tc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oXgrohCh3KdNsiNTwS6S+W3Tv89M7zOOIci0VbgKRqq6H0nAggm2Y0UeCrofprVshOOa5TWiNbOnpXwz/813/JP1ETGTTXnX7/H4IN9AeZLmrgSQoKbDrDUKZDy62Sdp+N+CssSrT0LY6fB4/q1XQnmM/wg2hYPkJmE/g+QXpd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gNO7ro/J; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gNO7ro/J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783608648; x=1815144648;
  h=date:from:to:cc:subject:message-id;
  bh=Fpe/KtLW3pTD7mF0WguHiHX6UjymtZ07lIkhyvHH0Tc=;
  b=gNO7ro/JCV8GhrygkewTPPXnXWmJlhOI6emLwgvVfIr0ScZZlrblOyot
   XDDKTDrifbacAjDjjJVSJbjrSMx0iPTN9muemNfueIguHH0aGUY47yEdP
   d4Yts9J7xl20w+emHe4XY9PRoS45zQ/qvm5uo0+28i+X8qTocOye/1vmC
   SPQ2BbIeaHLAErf6Zo2F7pqxi42p98UoO7E7lEnp3WOgQRwZLHI9ZNafO
   AL2VVJtPWJxxy3sGj4SXnzFsY3BT2vgZx8gJm98ALLm5K8QvUcniyYoEt
   vfplWrRINDIgInkiXFDB+mT1i9lhExTy+oTLpH3A+iNoWrUI7J8ukUdKI
   Q==;
X-CSE-ConnectionGUID: WVjmnozaQbS8qM6ynszu/w==
X-CSE-MsgGUID: Xnfa14sZTdG0wiDFBUvkwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84344981"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84344981"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 07:50:47 -0700
X-CSE-ConnectionGUID: 0Sp6JcJqQlmU5iEY9XhIAA==
X-CSE-MsgGUID: oSr+F1InTZebXWuYNgd5kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259503907"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 09 Jul 2026 07:50:45 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whq5L-00000000Hlr-0Bfj;
	Thu, 09 Jul 2026 14:50:43 +0000
Date: Thu, 09 Jul 2026 22:50:28 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/qemu_boot 20/69] arch/hexagon/Makefile:83:
 warning: ignoring old recipe for target 'dtbs'
Message-ID: <202607092205.idCtTtO9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/qemu_boot
head:   89efd48e5609f41280973bc49df20ffe80177690
commit: abe97c987224d2686550fd938cd15c284c1132c3 [20/69] hexagon: update build system and Kconfig
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260709/202607092205.idCtTtO9-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c279890c85da307abe34f10333442bbf72a60644)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607092205.idCtTtO9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607092205.idCtTtO9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Makefile:1629: warning: overriding recipe for target 'dtbs'
>> arch/hexagon/Makefile:83: warning: ignoring old recipe for target 'dtbs'
   make[3]: *** [Makefile:2184: .] Error 2
   make[3]: Target 'arch/hexagon/' not remade because of errors.
--
   Makefile:1629: warning: overriding recipe for target 'dtbs'
>> arch/hexagon/Makefile:83: warning: ignoring old recipe for target 'dtbs'
--
   Makefile:1629: warning: overriding recipe for target 'dtbs'
>> arch/hexagon/Makefile:83: warning: ignoring old recipe for target 'dtbs'
--
   /kbuild/src/Makefile:1629: warning: overriding recipe for target 'dtbs'
>> /kbuild/src/arch/hexagon/Makefile:83: warning: ignoring old recipe for target 'dtbs'
   /kbuild/src/scripts/Makefile.clean:12: /kbuild/src/arch/hexagon/platform/sm8150/Makefile: No such file or directory
   make[3]: *** No rule to make target '/kbuild/src/arch/hexagon/platform/sm8150/Makefile'.
   /kbuild/src/scripts/Makefile.clean:12: Failed to remake makefile '/kbuild/src/arch/hexagon/platform/sm8150/Makefile'.
   make[2]: *** [/kbuild/src/Makefile:2189: _clean_arch/hexagon/platform/sm8150] Error 2
   make[2]: Target 'mrproper' not remade because of errors.
   make[1]: *** [/kbuild/src/Makefile:248: __sub-make] Error 2
   make[1]: Target 'mrproper' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'mrproper' not remade because of errors.
--
   Makefile:1629: warning: overriding recipe for target 'dtbs'
>> arch/hexagon/Makefile:83: warning: ignoring old recipe for target 'dtbs'


vim +/dtbs +83 arch/hexagon/Makefile

    80	
    81	PHONY += dtbs
    82	dtbs: scripts
  > 83		$(Q)$(MAKE) $(build)=$(boot)/dts dtbs

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
