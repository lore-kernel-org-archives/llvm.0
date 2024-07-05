Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3729B61FEA;
	Fri,  5 Jul 2024 20:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720210386; cv=none; b=EWjIigFdNBIoTj5YwbDrp1apDyxZd6GIh52h3gm5SPnCwId3I4rFw3OEapNPNOr106+grKwPIVb0NDhz/JLOg+C+tar+cGmN8bv7AzVkzLMHdw9lD7Yfi5mvLG2a0eAqIwU3GstwI7o0Mw3djeZxtnSwPNcY6imWmC/KPWbdk70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720210386; c=relaxed/simple;
	bh=8MYkLFiYINVqXrnjoHJKxAUU1DezBFOg92i7i+6ymhk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I82T56wYHsOwFZtHK66u8EJ7TEwVHsiOwgmdkWpiMJp7zneo02Q4ReC6S/vkdoWTiC2bM6RDpecrfkFGY0wyU64xDvcmxd1octXdA1NxHtv8cbaxu5XYmCm0ZWCP82RtuDemPgPyeeKlxUfkIlVnsiI8T3U+7PvWhcVx9araz3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j5Z9qmzT; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j5Z9qmzT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720210385; x=1751746385;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8MYkLFiYINVqXrnjoHJKxAUU1DezBFOg92i7i+6ymhk=;
  b=j5Z9qmzTo17oYJu5A31PL+tVG8tke1cXpKfzGu8LGR2dNjCys2dsWi3y
   oBeLxlkkY+ddAx7oO2SYKSdcJwzYx/LjtHmTxMIU1mmXRtVW7QHFuTZr4
   Y33EtHj37x1p0f/Rl26FzMEUTGLm2UNVMF551LrGrqZlOQ1a+1CMgL6zH
   +RpIowDGyFdyI/6/jNm6kSx1isiI17S3+XW4GoaAZ41/POt6f6bqqEffq
   vD+3i7vkkErJwiyetWc4NUQIQ8oMWB6ogeZL8DHoE1b6S2oi6s0M++1V2
   Qc+hvfFQdXqcYLASV0hKoIIPVwcxwWaGoTU6ZZjqsK1Zq+Rv8fUMxRYfP
   Q==;
X-CSE-ConnectionGUID: YXHa4ft3R1S0hpsX8qDtFQ==
X-CSE-MsgGUID: nMiOHdZRT1SLpcLY5+ovEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17323100"
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; 
   d="scan'208";a="17323100"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2024 13:13:05 -0700
X-CSE-ConnectionGUID: p7LcnyU8SmuaozgevsBafw==
X-CSE-MsgGUID: FRHSugYxQG2Tn40VA1q60g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; 
   d="scan'208";a="47688481"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Jul 2024 13:13:02 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPpIi-000SoG-06;
	Fri, 05 Jul 2024 20:13:00 +0000
Date: Sat, 6 Jul 2024 04:12:46 +0800
From: kernel test robot <lkp@intel.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Petr Mladek <pmladek@suse.com>
Subject: [rt-devel:linux-6.10.y-rt-rebase 23/119] ld.lld: error: section
 .rodata virtual address range overlaps with __bug_table
Message-ID: <202407060420.Cq1dvptj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.10.y-rt-rebase
head:   32001c971931cb5dda925ee35617c240c2190034
commit: be8468b5e108830e2057b00a3ac27e882fd499d1 [23/119] serial: core: Implement processing in port->lock wrapper
config: riscv-randconfig-001-20240704 (https://download.01.org/0day-ci/archive/20240706/202407060420.Cq1dvptj-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240706/202407060420.Cq1dvptj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407060420.Cq1dvptj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: section .rodata virtual address range overlaps with __bug_table
   >>> .rodata range is [0xFFFFFFFF8213B700, 0xFFFFFFFF826D085A]
   >>> __bug_table range is [0xFFFFFFFF826C88B8, 0xFFFFFFFF8270BEA7]
--
>> ld.lld: error: section __bug_table virtual address range overlaps with .pci_fixup
   >>> __bug_table range is [0xFFFFFFFF826C88B8, 0xFFFFFFFF8270BEA7]
   >>> .pci_fixup range is [0xFFFFFFFF826D0860, 0xFFFFFFFF826D4867]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
