Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DF63ADBAD;
	Wed,  3 Jun 2026 11:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780484868; cv=none; b=GgDULaPF2HdATiKMBtUJLQ6ZilVCZvvTcNIZL4RNrwWSYl2Shj+0dRtdIRT/47tNQAEK5Le40LEjQwZ5wPmdDxOuaGsy3bfmy6oR4IDv78qGobV4b0TrdzXuWRSJ8zrqHDEBnJOCCyRk1UB+UUCdL7UBMcsjhOrfpAMLxN7igWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780484868; c=relaxed/simple;
	bh=lIEtwJJh9UEdPmIswm6wyDa2NFYzJHGxZAtnNg8GLgE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VJ+QOmUYf128NMpM+4mpxOPc9yumUVc65hgpRtXVa6FetTVR7DXcbMBGXSSUhTbZjg5hQAfuf3MylrpqWo4amzBUfYaZ/EspWDP6+CGYpCokh5wWNbXo/K2P9JtzuaG3Ns/Cc9ckQbmViBo6M58bzdwpZ+KpaOkpqwFzB+MZOAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SiyvaCUG; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SiyvaCUG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780484867; x=1812020867;
  h=date:from:to:cc:subject:message-id;
  bh=lIEtwJJh9UEdPmIswm6wyDa2NFYzJHGxZAtnNg8GLgE=;
  b=SiyvaCUGJgssBBhQpB+2CDUJZHIiGoKFdqZ9LHCNiZ7v4HrQ5KJSlYfI
   FcUNWR5cLH2hM9IgIvt++VJYOfAMNk4mkIMCZ+jphen6hmjn13Tt9O0FA
   xmTJwPEUIRb6zhJYKoa4aEK7yAMBXoFDQkag6REE45xQebaw8m53iiwvT
   uQccT74ttGX+BOMUGVb4Rhjr13KgZEpIhmXozWzDEX9C3oTo14OBNS4JL
   GOuj48EyCVKYz2c30zqF5kqf3ucQh9rXwxScRh8GDNR1hXaPlVGBb/mfn
   AWHbUeiGlCyl8vbA+44y8SWx+1f+CGHJ4I6o3zDSJJHFA+ziAULst8tJv
   A==;
X-CSE-ConnectionGUID: t7tpsR8sTv+Uu0zs+EKRBQ==
X-CSE-MsgGUID: Tp1v5OgBRwS3PQEcWLfzAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="92771524"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="92771524"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 04:07:46 -0700
X-CSE-ConnectionGUID: EJfw8Vk2Q7KCddp3Uanv0g==
X-CSE-MsgGUID: 9i2cc1WmR2SLijVXasZ07A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="243139435"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 03 Jun 2026 04:07:43 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUjRl-00000000DKo-0bKn;
	Wed, 03 Jun 2026 11:07:41 +0000
Date: Wed, 03 Jun 2026 19:07:26 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/boot_qemu 20/46] arch/hexagon/Makefile:83:
 warning: ignoring old recipe for target 'dtbs'
Message-ID: <202606031900.uPvtpRXU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   d99deb935033fad4dc63395a63498a77613df72a
commit: 9ed7172993b8e76f687f481352d61a880dbc3084 [20/46] hexagon: update build system and Kconfig
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260603/202606031900.uPvtpRXU-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260603/202606031900.uPvtpRXU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606031900.uPvtpRXU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Makefile:1599: warning: overriding recipe for target 'dtbs'
>> arch/hexagon/Makefile:83: warning: ignoring old recipe for target 'dtbs'
   make[3]: *** [Makefile:2143: .] Error 2
   make[3]: Target 'arch/hexagon/' not remade because of errors.
--
>> Makefile:1599: warning: overriding recipe for target 'dtbs'
>> arch/hexagon/Makefile:83: warning: ignoring old recipe for target 'dtbs'
--
>> Makefile:1599: warning: overriding recipe for target 'dtbs'
>> arch/hexagon/Makefile:83: warning: ignoring old recipe for target 'dtbs'
--
>> /kbuild/src/Makefile:1599: warning: overriding recipe for target 'dtbs'
>> /kbuild/src/arch/hexagon/Makefile:83: warning: ignoring old recipe for target 'dtbs'
   /kbuild/src/scripts/Makefile.clean:12: /kbuild/src/arch/hexagon/platform/sm8150/Makefile: No such file or directory
   make[3]: *** No rule to make target '/kbuild/src/arch/hexagon/platform/sm8150/Makefile'.
   /kbuild/src/scripts/Makefile.clean:12: Failed to remake makefile '/kbuild/src/arch/hexagon/platform/sm8150/Makefile'.
   make[2]: *** [/kbuild/src/Makefile:2148: _clean_arch/hexagon/platform/sm8150] Error 2
   make[2]: Target 'mrproper' not remade because of errors.
   make[1]: *** [/kbuild/src/Makefile:248: __sub-make] Error 2
   make[1]: Target 'mrproper' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'mrproper' not remade because of errors.
--
>> Makefile:1599: warning: overriding recipe for target 'dtbs'
>> arch/hexagon/Makefile:83: warning: ignoring old recipe for target 'dtbs'


vim +/dtbs +83 arch/hexagon/Makefile

    80	
    81	PHONY += dtbs
    82	dtbs: scripts
  > 83		$(Q)$(MAKE) $(build)=$(boot)/dts dtbs

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
