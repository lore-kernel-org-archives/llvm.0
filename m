Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B711D6194;
	Sun, 11 Jan 2026 01:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768095881; cv=none; b=n17hOfElEWIvr7nqfEzxKk8SDP3b4s2fbUdncszCDsEqZeSGDDOSAFAomDdfy/lNV12XassyffI0i3lGnM3pYzbh8Iaix72ghapuOwBqnbrVwgh9W8QgL7shl1QLtjp40mgd96p2DRh4vm8t5IRE1yEDQrEur7WdqVlg1R2Hwdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768095881; c=relaxed/simple;
	bh=D0r7SfGfWO6MjtMcgOmSM7RlknpUXEIOiE2FtND/0Ik=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bXBLXo6nLpGX6bzvVKriJ0FBrnwkdWtrCwqVANLvQnlRBjQaqdJl5k55Htw3c0yDzNyO0TFQjRNeBwSIOf7Uc2bOgGxHqkaEWjox/OXQYey9THuInQKBzSv65V95QWml2MyY9JMLio6WQpdovd/PGINR+Rst9sptpvJzIwqcAIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hZiSu/Hv; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hZiSu/Hv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768095880; x=1799631880;
  h=date:from:to:cc:subject:message-id;
  bh=D0r7SfGfWO6MjtMcgOmSM7RlknpUXEIOiE2FtND/0Ik=;
  b=hZiSu/HvXfgTi/ms2e6DnRBFvLMHMpMWrNCrbh2rLlB79ROgOvR6Dt0J
   v5TJKj7cIHjNR00GqcJ2TXbBzagwiHxby5nl2dLrIXB6TRNISDSHWsIgh
   ZanVGnnqIq1vVt9H6Z/gCjnRe/dFR7QuIc1D5u94rUW8St2JxQOZfH9J/
   Xc2w7yl3ehD+PxoP8AanAZhtNLjJMkvvxVGP0Y5U4hkD1TwLorWX1luV/
   ItdfzbHnq2+7PK+IuqfyykZcAXQu3Wit7IrZ2piLwg0AMT0Qq8/bd0KPi
   CW8IOye1suCpW3MwZi0E80TJLm/gsK97Wu82DgiMJ5RkM7ZuE7IlM9hhi
   g==;
X-CSE-ConnectionGUID: I9QMPc1FTEuk6pkojOEM6A==
X-CSE-MsgGUID: NGlEIAg9Ryu9B9NxcNe3tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="80061364"
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
   d="scan'208";a="80061364"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 17:44:37 -0800
X-CSE-ConnectionGUID: q4jbM9ocS2GUxOZWGUirkw==
X-CSE-MsgGUID: BYZ7i5JyQvGf51FercOmAA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Jan 2026 17:44:36 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vekVO-000000009RQ-0CwG;
	Sun, 11 Jan 2026 01:44:34 +0000
Date: Sun, 11 Jan 2026 09:44:03 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v3+i386 8/19] vmlinux.o: warning: objtool:
 x86_pmu_aux_output_match+0x1c: no-cfi indirect call!
Message-ID: <202601110959.4qlKzeGJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v3+i386
head:   18caf3c0711e493cd12d61138bb0c7cb0b98e72e
commit: c25feb76bcb9eef1db49b4793195808b5b268bdd [8/19] x86: Use PIE codegen for the relocatable 64-bit kernel
config: x86_64-randconfig-004-20260110 (https://download.01.org/0day-ci/archive/20260111/202601110959.4qlKzeGJ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260111/202601110959.4qlKzeGJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601110959.4qlKzeGJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: x86_pmu_aux_output_match+0x1c: no-cfi indirect call!
>> vmlinux.o: warning: objtool: perf_check_microcode+0x13: no-cfi indirect call!
>> vmlinux.o: warning: objtool: acpi_unregister_gsi+0x13: no-cfi indirect call!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
