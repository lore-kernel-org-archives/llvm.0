Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F103BF660;
	Sun, 27 Sep 2026 07:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790494982; cv=none; b=dKKm9MjSq/aNwEBIUa9zCeNkV0Xc3mHi9El3AW3EmPTzosRo6eE5AbXIHAFaEdqN0TMhYPgRi+giKJ1hQU3kQP2oo2KOLVqHk1L23JVS6143EBnBghJmKnoKNezvsWIfytYmTQErf45zR/ra+lfppGB2RBsw6xDNNK0vbx/77D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790494982; c=relaxed/simple;
	bh=sgOyQlJde9r8X0NQBblRnxqGZHzoTEkhrbI5En5bo2U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O3n5ChD8jl2uojI74X6/VulAdXD+Lx12CG5bE1kyN7LsTLdD3c1LLJrT59AalZriB5I9XJsi+2zFoKdjzvIEzSyVyfcfXr3Il6oRBuCO9Ogw+UaUVNKSUEjTVF6V+oVnv3xuB3zahZxboxQJ22J/ATZZcEFuyQWQ2iycurz3xoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XnQTTu6D; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XnQTTu6D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790494968; x=1822030968;
  h=date:from:to:cc:subject:message-id;
  bh=sgOyQlJde9r8X0NQBblRnxqGZHzoTEkhrbI5En5bo2U=;
  b=XnQTTu6DNERCJRUuhDAD0FU/XZflk6jePfnpzapmkiAx8vPUoy/lC/jG
   CIVn5AlLJxT+wE6sQpGNecWOkUbDqZAHRlRrfPj+QkMeOiQX9CFf4N34M
   g9BP8/IQL+lSOzLh4uaCgCui+kS4Cs85FDMwoDPkyk+5rb0KujzzNLaK0
   np/7zPdi3XlHqC0tn9S5bG+xPEbIaQlEMvj6YFgQCvESq9GsVn72v7lR8
   zS0IvSBSnSrMpwYFsKQbmXYuJkAqcKW28SGJQqjWUcz3JxkBTGKWhPlcg
   3JtMFo+/W2G3a/EkITbhqTAbBLuMz4Mqe5AA+WvlANIgfv6FRq2PG9LxO
   Q==;
X-CSE-ConnectionGUID: gqjlIT9OShC5BoPg5FhkbQ==
X-CSE-MsgGUID: D/S7dZ+wQLarM3hOme2EnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="100554764"
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="100554764"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 00:42:43 -0700
X-CSE-ConnectionGUID: cseWJ318Q8SUMweybCgbMw==
X-CSE-MsgGUID: n5XtiZMMR9isn7srnBW3Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="302695423"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Sep 2026 00:42:41 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAjWw-00000000MeT-3kWM;
	Sun, 27 Sep 2026 07:42:38 +0000
Date: Sun, 27 Sep 2026 15:42:18 +0800
From: kernel test robot <lkp@intel.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Subject: [linuxppc:next-test 3/13] ld.lld: error: undefined symbol:
 irq_proc_emit_counts
Message-ID: <202609271531.8kf2NTjK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/linuxppc/linux next-test
head:   12d238d584ba485a99e02e033746100fc7099184
commit: fbb22ceaaf8f9c6786e6ff5da1962fe6ac0fc904 [3/13] powerpc/irq: Make irqstats array based
config: powerpc64-randconfig-1001-20260927 (https://download.01.org/0day-ci/archive/20260927/202609271531.8kf2NTjK-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260927/202609271531.8kf2NTjK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609271531.8kf2NTjK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: irq_proc_emit_counts
   >>> referenced by irq.c:116 (arch/powerpc/kernel/irq.c:116)
   >>>               arch/powerpc/kernel/irq.o:(arch_show_interrupts) in archive vmlinux.a
   >>> referenced by irq.c:116 (arch/powerpc/kernel/irq.c:116)
   >>>               arch/powerpc/kernel/irq.o:(arch_show_interrupts) in archive vmlinux.a
   >>> referenced by irq.c:116 (arch/powerpc/kernel/irq.c:116)
   >>>               arch/powerpc/kernel/irq.o:(arch_show_interrupts) in archive vmlinux.a
   >>> referenced 5 more times

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
