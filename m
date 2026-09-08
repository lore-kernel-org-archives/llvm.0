Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA5C1A9F87;
	Tue,  8 Sep 2026 04:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788843597; cv=none; b=Ai5Uh1b58oWxKMlEa+33aJ6SqTDqzg2AknnB6g4xRyHcERM+ka9oVDFrIWkLGBI//vPmTsBPRcNNx1CHTmDLvZsk6mtEcoOTY7vnOC1w5uimW9opUl26gNmnUrtkIwJMdx5qGW/cSSsimEEIp+IAtwD/cCZk8g+crMbXDhOieFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788843597; c=relaxed/simple;
	bh=8dKQ5/kRZcva5wntmhmFglx/2dK1VMmHhVcM0Nf17tA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NONlVFVElGteouTjjq2UddyQ0LNZP8rGqAEfO1GNL+UvzkOt7FZG28wiEdXYkno6WBcrR2VRYuzg7Cq16mNvdqfkp7zr1nO+z2iv6yZ6ZmZNFepHoxIg/taq2ZVfgBmZlUz8DrpCTZrNyqOq3rZSrUgtt78vl88n74b9suT2UiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CIIXwmIp; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CIIXwmIp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788843596; x=1820379596;
  h=date:from:to:cc:subject:message-id;
  bh=8dKQ5/kRZcva5wntmhmFglx/2dK1VMmHhVcM0Nf17tA=;
  b=CIIXwmIp9KooQORuu9HCCwuLdkLAfuH4bUXstZ1E/TbV/eaRo+SeN+4C
   j/c3FRArVUfcSy0VCOaAXu2iWXsuFE/OLHJRIWdDmRuRv4bBr4FYqkhBK
   EehF2CcUcay+//SN9vg7HrsoebgxA2l4wYjRPTwEwyePYyWtgird5dJxk
   rJ/u0RfMsfqhHV9YdizCK8RMD9gB6JRzsedM1HaFCVb+dqJRneK7hqybJ
   605816OkIwe+6Jo6BOzXO8jkpSI/9NUV7Kb44SQnTLDbV/jS/stSNJs4j
   zMdhZhU0tlVDrslFFEjmLeNfcVNAtjKHPRiq4d0bqrbyXLFp+bnj2nNIB
   g==;
X-CSE-ConnectionGUID: IcZSevJETiW4TMjLR9ADkQ==
X-CSE-MsgGUID: Hzf1IMCvT1SQa9SSJ1+caA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="93099717"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="93099717"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 21:59:55 -0700
X-CSE-ConnectionGUID: 156CII+xS5eiXmUdBzXppg==
X-CSE-MsgGUID: xZQ4ds5BR9WiWulahwG97A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="266533288"
Received: from lkp-server01.sh.intel.com (HELO dff15f1b2031) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Sep 2026 21:59:54 -0700
Received: from kbuild by dff15f1b2031 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3nvz-000000001gN-1dEq;
	Tue, 08 Sep 2026 04:59:51 +0000
Date: Tue, 08 Sep 2026 12:58:52 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:efi-libstub-native-utf16 7/9]
 drivers/firmware/efi/libstub/vsprintf.c:251:5: warning: no previous prototype
 for function 'efi_vsnprintf'
Message-ID: <202609081226.euFZ5X8V-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git efi-libstub-native-utf16
head:   c23f326a96b5293512720f389c597f967132c334
commit: b556b4a52f0a9b57d906dbb3bd63cebe6159e3e7 [7/9] efi/libstub: Output UTF-16 directly from vsnprintf()
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260908/202609081226.euFZ5X8V-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 2362eeb5f75560740146975e9eabe84c6bd25a0d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609081226.euFZ5X8V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609081226.euFZ5X8V-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/efi/libstub/vsprintf.c:251:5: warning: no previous prototype for function 'efi_vsnprintf' [-Wmissing-prototypes]
     251 | int efi_vsnprintf(efi_char16_t *buf, size_t size, const char *fmt, va_list ap,
         |     ^
   drivers/firmware/efi/libstub/vsprintf.c:251:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     251 | int efi_vsnprintf(efi_char16_t *buf, size_t size, const char *fmt, va_list ap,
         | ^
         | static 
   1 warning generated.


vim +/efi_vsnprintf +251 drivers/firmware/efi/libstub/vsprintf.c

   250	
 > 251	int efi_vsnprintf(efi_char16_t *buf, size_t size, const char *fmt, va_list ap,

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
