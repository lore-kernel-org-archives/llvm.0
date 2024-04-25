Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAB92B9C9;
	Thu, 25 Apr 2024 08:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714034335; cv=none; b=bfcNWaANioLD2RCpLbOJynlDMaekrqbj14h0+89GEFF1LfP5ou+vVoYE8hq6DluoHD8GcElkzd5oAvAzzTCrg7V58l/GjoQMe+sjkFDtXSz7UEqGZ/a6aoAGSylC1eCeqyO0lXL/Ga3P9AJhJwVuEttLPMunHY1kgqR18EiV/Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714034335; c=relaxed/simple;
	bh=4cWhHC2K69/LyOIng4tyPRBTHJ73ToydNnzrJV/cHNM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mcjMyduxvhaKG+Qc48OrrkfsVmbnm0YzYVEdVC7TFOjZMmvUL02WQ4zVDwbADkpykmMRcDd/67VS8BalIqbHGKR71ALSZ0Dyei8r/wIM7upQvWivnd3DCfHSJ+p9ehlo4fN8YqOGe/FF3WZSnpw2anEaIrkukDjA42GV0GqgYq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ht3ugEbL; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ht3ugEbL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714034333; x=1745570333;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4cWhHC2K69/LyOIng4tyPRBTHJ73ToydNnzrJV/cHNM=;
  b=ht3ugEbL83+2HUGoGDNvPdTb3vqRN8PIUHxqSQsRqwJGKX8W05Pz6NR8
   RVnctkESnefsuzHLNr8V62Ji5nhINPNGAH8ElsXsvMh18AMIICurOvs5T
   GTSPPueeSR8nb/U4DKck3D1MlMWKfuoy5CkCOLs8qZZhFIQfTEeAHTYfs
   pMRlOpX4MpomEmqVXF3atPW/DpykUktmFSCQAQNp9p3wATlnjJfEcDTy0
   N7RhjZhpl3Qxyn5Wq6i0P9nTJClMz843TaTfTVnG/la72mrbWfXdGI79h
   TuZsDJ+yBV+D+9iXZIu2ye8KVrGBRNzYSGfBvJTnm2qBGBm0RDwQiEkan
   w==;
X-CSE-ConnectionGUID: YqoDYFJvQEym6RcKp2jntA==
X-CSE-MsgGUID: tMLxxd5ZSpKqfr3XFU6kUw==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9818110"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="9818110"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 01:38:52 -0700
X-CSE-ConnectionGUID: ipPeaRSXSFSqArlGn/E90w==
X-CSE-MsgGUID: AXCehVXGSLu/J6rhULyo4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="24993872"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 25 Apr 2024 01:38:50 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzucx-0002Ay-2F;
	Thu, 25 Apr 2024 08:38:47 +0000
Date: Thu, 25 Apr 2024 16:38:07 +0800
From: kernel test robot <lkp@intel.com>
To: Gary Guo <gary@garyguo.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [nbdd0121:thin-lto 1/1] clang: warning: argument unused during
 compilation: '-MMD'
Message-ID: <202404251623.5URkQEYy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nbdd0121/linux thin-lto
head:   b0a98f58bf741dea8f63918b49d7284a8813529a
commit: b0a98f58bf741dea8f63918b49d7284a8813529a [1/1] WIP
config: x86_64-buildonly-randconfig-001-20240425 (https://download.01.org/0day-ci/archive/20240425/202404251623.5URkQEYy-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240425/202404251623.5URkQEYy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404251623.5URkQEYy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> clang: warning: argument unused during compilation: '-MMD' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-MF rust/.bindings.o.d' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I arch/x86/include' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I ./arch/x86/include/generated' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I include' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I ./include' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I arch/x86/include/uapi' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I ./arch/x86/include/generated/uapi' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I include/uapi' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I ./include/generated/uapi' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-include include/linux/compiler-version.h' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-include include/linux/kconfig.h' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-include include/linux/compiler_types.h' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-fmacro-prefix-map==' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I rust' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I ./rust' [-Wunused-command-line-argument]
--
>> clang: warning: argument unused during compilation: '-MMD' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-MF rust/.kernel.o.d' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I arch/x86/include' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I ./arch/x86/include/generated' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I include' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I ./include' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I arch/x86/include/uapi' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I ./arch/x86/include/generated/uapi' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I include/uapi' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I ./include/generated/uapi' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-include include/linux/compiler-version.h' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-include include/linux/kconfig.h' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-include include/linux/compiler_types.h' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-fmacro-prefix-map==' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I rust' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I ./rust' [-Wunused-command-line-argument]
--
>> clang: warning: argument unused during compilation: '-MMD' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-MF rust/.doctests_kernel_generated.o.d' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I arch/x86/include' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I ./arch/x86/include/generated' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I include' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I ./include' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I arch/x86/include/uapi' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I ./arch/x86/include/generated/uapi' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I include/uapi' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I ./include/generated/uapi' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-include include/linux/compiler-version.h' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-include include/linux/kconfig.h' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-include include/linux/compiler_types.h' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-fmacro-prefix-map==' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I rust' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I ./rust' [-Wunused-command-line-argument]
--
>> clang: warning: argument unused during compilation: '-MMD' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-MF samples/rust/.rust_print.o.d' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I arch/x86/include' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I ./arch/x86/include/generated' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I include' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I ./include' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I arch/x86/include/uapi' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I ./arch/x86/include/generated/uapi' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I include/uapi' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I ./include/generated/uapi' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-include include/linux/compiler-version.h' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-include include/linux/kconfig.h' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-include include/linux/compiler_types.h' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-fmacro-prefix-map==' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I samples/rust' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I ./samples/rust' [-Wunused-command-line-argument]
--
>> clang: warning: argument unused during compilation: '-MMD' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-MF samples/rust/.rust_minimal.o.d' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I arch/x86/include' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I ./arch/x86/include/generated' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I include' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I ./include' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I arch/x86/include/uapi' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I ./arch/x86/include/generated/uapi' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I include/uapi' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I ./include/generated/uapi' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-include include/linux/compiler-version.h' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-include include/linux/kconfig.h' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-include include/linux/compiler_types.h' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-fmacro-prefix-map==' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I samples/rust' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I ./samples/rust' [-Wunused-command-line-argument]
--
>> clang: warning: argument unused during compilation: '-MMD' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-MF rust/.bindings.o.d' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I arch/x86/include' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I ./arch/x86/include/generated' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I include' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I ./include' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I arch/x86/include/uapi' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I ./arch/x86/include/generated/uapi' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I include/uapi' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I ./include/generated/uapi' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-include include/linux/compiler-version.h' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-include include/linux/kconfig.h' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-include include/linux/compiler_types.h' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-fmacro-prefix-map==' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I rust' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I ./rust' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-MMD' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-MF rust/.kernel.o.d' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I arch/x86/include' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I ./arch/x86/include/generated' [-Wunused-command-line-argument]
>> clang: warning: argument unused during compilation: '-I include' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I ./include' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I arch/x86/include/uapi' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I ./arch/x86/include/generated/uapi' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I include/uapi' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I ./include/generated/uapi' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-include include/linux/compiler-version.h' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-include include/linux/kconfig.h' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-include include/linux/compiler_types.h' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-fmacro-prefix-map==' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I rust' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I ./rust' [-Wunused-command-line-argument]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
