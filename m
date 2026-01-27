Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB7B2264CF;
	Tue, 27 Jan 2026 11:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769512586; cv=none; b=YnSu5lvHQIVeZxmBOG/R1jJWHNpcS5lie26m4hIVCzKHygcuVaqECOnVIdDKdqc6ohXmfp+F59Dzq8PMcsKlZljQcbCMLrWEVkrKsIK7wcmzz00N5CjgcYDN3Y/jxej4xBwrlMF0eHyBpJ0MLczyd7bpS3UVE8tlGdY1nUNXtEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769512586; c=relaxed/simple;
	bh=kXdqZUFNkdCbWe6HAwmbwZxmmGmA4e7bx0gcA+X//Qk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ANSUk6gEB3mnhD6PZhmes47PX6f5Bek+vvtGuWxxk9CO0wZRu76KuXG4+psaIbaICMRfUp+7lIB+gVC0Y8w4DJO1l0xQG2nj/15YFAKqDtEf5MebPqgQZrP/A4NJdzlxcX/J0+/d+zYsSCzMx92grrN5YGjM7LipF1BIOK3HYno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CFcWTah1; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CFcWTah1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769512586; x=1801048586;
  h=date:from:to:cc:subject:message-id;
  bh=kXdqZUFNkdCbWe6HAwmbwZxmmGmA4e7bx0gcA+X//Qk=;
  b=CFcWTah1IPoG8uQ65NJbKR2xMggzDLNfDHl37yBe1i0shwvdaDYA3a7+
   9PiQzSFsJlvAAQU56xOw5ynFLGZtz0JJ6MZ5trLE3XzTf7au8yV8FKO4s
   sUnlOBoUmLgjvD+z2QABwmruY+7H79BmiDZz0sVaJOSORCezYGe9ZUb/Y
   GCPaUT2CHmuhBJ9PRdQBLBbq5XRNi12hmJytSVWMajTG1I333spHe5tA3
   Z5nIFdIkZ5oeUuQtB2HGMfk3Q9wwAD9R8CsvW3q25EH14n10e06Ovgjxg
   lEmVs0bsEjZELR3h29/N5elePCN7sFya/bkdcbYvens1sLvfjBL8fRnk+
   w==;
X-CSE-ConnectionGUID: WpB7JHTjSHCF3xutQWC2IQ==
X-CSE-MsgGUID: 46kBFEBTS8OcsdpEGsAcJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="58278289"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="58278289"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 03:16:25 -0800
X-CSE-ConnectionGUID: Q5IZzBgTSCaJ+GrvFlZ0lg==
X-CSE-MsgGUID: sT1yiXeSR7iTQCWmuqAa8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="212924015"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 Jan 2026 03:16:22 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkh3T-00000000YOy-3dUF;
	Tue, 27 Jan 2026 11:16:19 +0000
Date: Tue, 27 Jan 2026 19:15:23 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/boot_qemu 20/38] make[4]: *** No rule to make
 target 'arch/hexagon/boot/dts/comet.dtb', needed by
 'arch/hexagon/boot/dts/comet.dtb.S'.
Message-ID: <202601271950.ZDodTlN0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   6dd00eeb9163d38cdab8b12c40702a711f04a9ab
commit: 78951630122eae2f9915fda71077ecd729f34ff0 [20/38] hexagon: update build system and Kconfig
config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20260127/202601271950.ZDodTlN0-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601271950.ZDodTlN0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601271950.ZDodTlN0-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> Makefile:1519: warning: overriding recipe for target 'dtbs'
>> arch/hexagon/Makefile:81: warning: ignoring old recipe for target 'dtbs'
   make[2]: *** [Makefile:2054: .] Error 2
   make[2]: Target './' not remade because of errors.
--
>> make[4]: *** No rule to make target 'arch/hexagon/boot/dts/comet.dtb', needed by 'arch/hexagon/boot/dts/comet.dtb.S'.
   make[4]: Target 'arch/hexagon/boot/dts/' not remade because of errors.
--
>> Makefile:1519: warning: overriding recipe for target 'dtbs'
>> arch/hexagon/Makefile:81: warning: ignoring old recipe for target 'dtbs'
--
>> /kbuild/src/consumer/Makefile:1519: warning: overriding recipe for target 'dtbs'
>> /kbuild/src/consumer/arch/hexagon/Makefile:81: warning: ignoring old recipe for target 'dtbs'
   /kbuild/src/consumer/scripts/Makefile.clean:12: /kbuild/src/consumer/arch/hexagon/platform/sm8150/Makefile: No such file or directory
   make[3]: *** No rule to make target '/kbuild/src/consumer/arch/hexagon/platform/sm8150/Makefile'.
   /kbuild/src/consumer/scripts/Makefile.clean:12: Failed to remake makefile '/kbuild/src/consumer/arch/hexagon/platform/sm8150/Makefile'.
   make[2]: *** [/kbuild/src/consumer/Makefile:2059: _clean_arch/hexagon/platform/sm8150] Error 2
   make[2]: Target 'mrproper' not remade because of errors.
   make[1]: *** [/kbuild/src/consumer/Makefile:248: __sub-make] Error 2
   make[1]: Target 'mrproper' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'mrproper' not remade because of errors.
--
>> Makefile:1519: warning: overriding recipe for target 'dtbs'
>> arch/hexagon/Makefile:81: warning: ignoring old recipe for target 'dtbs'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
