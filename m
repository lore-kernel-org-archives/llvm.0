Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FD32F360A;
	Tue, 28 Apr 2026 14:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777388289; cv=none; b=X+QLxQDLcp1hGdJnigyk5BsiBjkgNGFT9/qiK2khGO2j4fL3C/dxckptc7Re2idPtptkP36E5PaC1E2SrGEt+6bEXhjImtRBcpF9vt0rvvf4lyR8C5YJimmNjw08ntzX0tczYrmEa7zMYbLfyHjHngnTA9hFfGCMt9pAX0yvwCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777388289; c=relaxed/simple;
	bh=4OHR80aTjp1InEXdOb3F7kyD5SV7n5YzXN+ek0NV2Ko=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GDU31w3IYpOdSTznAHJrqTNO2uv9RHZc7s4ZqayjrCAcN5RyfHtiQ7yDwaBItXpPfyEFJyYyUACs5HJPGIg8ax3kpX0yzfVHUyRKYgJvNF0bzNfya1Qewl0RP9qNTpQ4yJGN1b+ehWLrG3G4vx3XZh21VVPkb0hjv5oMAlc1rM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HlSLQ90t; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HlSLQ90t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777388288; x=1808924288;
  h=date:from:to:cc:subject:message-id;
  bh=4OHR80aTjp1InEXdOb3F7kyD5SV7n5YzXN+ek0NV2Ko=;
  b=HlSLQ90tHO31t9/f15CvqA7JW8Z1OlZemZFwSPJFj7YSnBHicatW74Ly
   PR9Pm3d9I7bvBMKUmXtP2Sj4Bv9nrQCsuaEmod1jvpSoy6xQIUfaRECHF
   4auW1MjZGaG5NNXdxMVdtHrvTlgLtxf1GrYYgJfdZo7ukfUQSLJcBCf2f
   nKbjwNztHjwr7C3qRFkEqGc5Wl0RK6Oma7K30kP4H3UrD0uo9USYZjCzC
   db+a2DNwwNIQPN/YcwtsWJ+RDFhI/kaEsbzGDbDYI8VgXBH39lYr6ZHSO
   0pvT04Lgxpwl8VMWKyc+aQu/kue20gi42o1jDh42pEXP7dIMBXJ42iNRD
   A==;
X-CSE-ConnectionGUID: dzV7nWbGQGCQjNIFmZEXAQ==
X-CSE-MsgGUID: JIF8PBlTQam5l6Xar8BwCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="78282600"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="78282600"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 07:58:08 -0700
X-CSE-ConnectionGUID: CbTVtVgOSSmdcyl1qzmWkw==
X-CSE-MsgGUID: 4Rio9jjlRJilPt8thgL1NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="229618855"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Apr 2026 07:58:03 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHjsu-000000009to-2mme;
	Tue, 28 Apr 2026 14:58:00 +0000
Date: Tue, 28 Apr 2026 22:57:37 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/hmx 20/66] make[4]: *** No rule to make target
 'arch/hexagon/boot/dts/comet.dtb', needed by
 'arch/hexagon/boot/dts/comet.dtb.S'.
Message-ID: <202604282240.C72EeMpO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/hmx
head:   1d0fb0b4cf1764f00775cff1c17c2b3494b6b94e
commit: c6e6540ae87898e9116e2748f9afd56a5f0cf7e2 [20/66] hexagon: update build system and Kconfig
config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20260428/202604282240.C72EeMpO-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260428/202604282240.C72EeMpO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604282240.C72EeMpO-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> Makefile:1557: warning: overriding recipe for target 'dtbs'
>> arch/hexagon/Makefile:81: warning: ignoring old recipe for target 'dtbs'
   make[2]: *** [Makefile:2101: .] Error 2
   make[2]: Target './' not remade because of errors.
--
>> make[4]: *** No rule to make target 'arch/hexagon/boot/dts/comet.dtb', needed by 'arch/hexagon/boot/dts/comet.dtb.S'.
   make[4]: Target 'arch/hexagon/boot/dts/' not remade because of errors.
--
>> Makefile:1557: warning: overriding recipe for target 'dtbs'
>> arch/hexagon/Makefile:81: warning: ignoring old recipe for target 'dtbs'
--
>> /kbuild/src/Makefile:1557: warning: overriding recipe for target 'dtbs'
>> /kbuild/src/arch/hexagon/Makefile:81: warning: ignoring old recipe for target 'dtbs'
   /kbuild/src/scripts/Makefile.clean:12: /kbuild/src/arch/hexagon/platform/sm8150/Makefile: No such file or directory
   make[3]: *** No rule to make target '/kbuild/src/arch/hexagon/platform/sm8150/Makefile'.
   /kbuild/src/scripts/Makefile.clean:12: Failed to remake makefile '/kbuild/src/arch/hexagon/platform/sm8150/Makefile'.
   make[2]: *** [/kbuild/src/Makefile:2106: _clean_arch/hexagon/platform/sm8150] Error 2
   make[2]: Target 'mrproper' not remade because of errors.
   make[1]: *** [/kbuild/src/Makefile:248: __sub-make] Error 2
   make[1]: Target 'mrproper' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'mrproper' not remade because of errors.
--
>> Makefile:1557: warning: overriding recipe for target 'dtbs'
>> arch/hexagon/Makefile:81: warning: ignoring old recipe for target 'dtbs'
   scripts/mod/modpost.c:59:13: warning: variable 'extra_warn' set but not used [-Wunused-but-set-global]
      59 | static bool extra_warn;
         |             ^
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
