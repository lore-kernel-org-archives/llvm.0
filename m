Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00613EBF13;
	Wed, 18 Feb 2026 02:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771382553; cv=none; b=jiBThHucubTRZURBp4JdIY6Vds/opj2tocRRv3ylxc3ZtuNdgd74OZ3RoN5ntrmsPNZIPRG85Mt6nTl1Vhs3BWG2JFFsih4wJQS1Zr2iICOAbyUJneo/sF5Jyio4/7O8QhPyQOZR2lXPK6ysZhvqBgqvAw2MTHl37irZ8J+LEPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771382553; c=relaxed/simple;
	bh=v71Sgt4HRAcMZn3HYIcaILwdCeQIxJOD7PSKE6FG/Ck=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LC6Bmicbrlatijf/Jt4O/lwRYdOmsyBy9WTjETRa7o+NCD2x11yTGzVMSlj+xJdqk/xvNkko2XYwaH8ra9aRHqwTSCHY1LGOnrcOekosvRONnKswqrUSkanawQj610NdtDYcRnLofsTmxLZAzBIJMBnVyYLv+sOmEzzAI6jUvqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RE7h/vUW; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RE7h/vUW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771382552; x=1802918552;
  h=date:from:to:cc:subject:message-id;
  bh=v71Sgt4HRAcMZn3HYIcaILwdCeQIxJOD7PSKE6FG/Ck=;
  b=RE7h/vUWaCll4l8aMk4DPI//lvL1q6oES5AuifChqEaf9N9QXhHSC2Ty
   aTT+0LEIywlb5EyUzcrG8Rn50HLFrcLjHTKsB1Qftmpz9hbr/Rc9t/YOg
   oH7vgkVYT1lIxyuxzLW1Ke/CDwKAYBcAbOSUHem+12vd6L8ZHkVlZkXNq
   gWGhfJeRB7RZAtXhgv7g/Gnk9SujWKPBs30Ro8hW/kYDpI0y3LdwcrC1i
   t5rMcAMfVLtavEjauEcLmsnWujcof4ueiLf2r6FpCuU3DRJq8Om3X6vme
   rwe11LEQhk8fQR2octYvG7VeEBJDAvBLmKTiISItL+VagFnruD5ey+e6E
   w==;
X-CSE-ConnectionGUID: dF47jVahT8ix3jhIpUUEFQ==
X-CSE-MsgGUID: MFJaxcQyQJGNlBpzQOFOkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72361207"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="72361207"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 18:42:32 -0800
X-CSE-ConnectionGUID: yL+Gf/WBRqujiSsh7t/UEQ==
X-CSE-MsgGUID: OSwjqQUmTlqDCwXiDCmOLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="213156037"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Feb 2026 18:42:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsXWF-000000011xJ-1Ker;
	Wed, 18 Feb 2026 02:42:27 +0000
Date: Wed, 18 Feb 2026 10:42:04 +0800
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Elle Rhumsaa <elle@weathered-steel.dev>
Subject: ld.lld: error: undefined symbol:
 rust_helper_pci_alloc_irq_vectors
Message-ID: <202602181005.ri4E7Uj9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2961f841b025fb234860bac26dfb7fa7cb0fb122
commit: d9ea5a41cef80dc8103f4114b072b27364f2e06a rust: sync: Add memory barriers
date:   5 months ago
config: x86_64-randconfig-005-20260217 (https://download.01.org/0day-ci/archive/20260218/202602181005.ri4E7Uj9-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260218/202602181005.ri4E7Uj9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602181005.ri4E7Uj9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: rust_helper_pci_alloc_irq_vectors
   >>> referenced by .vmlinux.export.c
   >>>               .vmlinux.export.o:(___ksymtab_gpl+rust_helper_pci_alloc_irq_vectors+0x0)
--
>> ld.lld: error: undefined symbol: rust_helper_pci_free_irq_vectors
   >>> referenced by .vmlinux.export.c
   >>>               .vmlinux.export.o:(___ksymtab_gpl+rust_helper_pci_free_irq_vectors+0x0)
--
>> ld.lld: error: undefined symbol: rust_helper_pci_irq_vector
   >>> referenced by .vmlinux.export.c
   >>>               .vmlinux.export.o:(___ksymtab_gpl+rust_helper_pci_irq_vector+0x0)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
