Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0951547F2;
	Fri, 25 Apr 2025 02:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745548540; cv=none; b=c41OXoAKZ7cLTeKwJFVMMz7HnbSXuCNKFPsPhjAlduZwYaGZ32oZ9zf/IwPqJdilyvD5NerclZrsr86LhtwYy8TzRqB9AFY8JKiBnxbgHlFsuoAw18u/1+TfI7oXKRZsdEI8tO/Y9vH8ExgIgCCw41HdMRD1XJT0hqRAvsw+KrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745548540; c=relaxed/simple;
	bh=ubLxeSAbvKuHpQpSwjpAj/bw+qHmp8nYgPeDwoFVxF0=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kXnfvMb858iWCIJQBSaLYGlfaBsbJBOf9MLMpg6mPvpxxlXg1w+F4pMIdHzfpx4x4Q149Manq3FpU5tzVSMZ4hbXRg2ZX4zJu4MBwtJSVcmoH2WK75+CrKRF6olKwCedb1yrqAbuw9y1CICKBI4mxiada70Dc+GIh8G2M9lCgZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q8Axg3QO; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q8Axg3QO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745548538; x=1777084538;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ubLxeSAbvKuHpQpSwjpAj/bw+qHmp8nYgPeDwoFVxF0=;
  b=Q8Axg3QOh/zjP2Mpj0o69OeE7yq/qKer6hwD1ceP2gvHyShAPo+kiHcn
   0Zogf51HzLxEujuC4G4TR3PjJWRwwGRZtxA0nEfLBMcP7NxEj8ufaufcr
   frmRGrXnJIAMOuzsOnIwrMVX9qz2/shbzoyKqhOUphn7RHT+57CbRKm3w
   0+lDTve7XYHCO/Xa5sQjlOCh8Y8VDit7aibOTC1lwc3ucw07Er3vHxbJs
   2GX56yAIrKI1a8UYd5sUqkbT0zqFqRxdVcfJN4ydqFdD8LlJqDvrS+nuA
   F3caJQpzJQ4lDNe6ABgLoKw/nmgB/U1K7d1uOIg4Ss+kCaJleQrdK0/hK
   A==;
X-CSE-ConnectionGUID: dMlwpTOBT6GaLyClBR7WXg==
X-CSE-MsgGUID: OfSb5tOqS+6UgSk2UrKUkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="64732495"
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="64732495"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 19:35:25 -0700
X-CSE-ConnectionGUID: l9BpQeMgT6i9uSo7mmCEeA==
X-CSE-MsgGUID: 5/8u3rK8QKOzjKBmwrq8lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="137943767"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Apr 2025 19:35:21 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u88uL-0004jv-36;
	Fri, 25 Apr 2025 02:35:17 +0000
Date: Fri, 25 Apr 2025 10:34:59 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: ld.lld: error: vmlinux.a(kernel/panic.o):(function panic:
 .text.unlikely.+0x24): relocation R_RISCV_HI20 out of range: 531805 is not
 in [-524288, 524287]; references 'panic_on_warn'
Message-ID: <202504251010.EMcDUvkH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Steven Rostedt <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   02ddfb981de88a2c15621115dd7be2431252c568
commit: 4808595a9922e89726ec5611d7749b63966b7fa8 tracing: Hide get_vm_area() from MMUless builds
date:   2 weeks ago
config: riscv-randconfig-002-20250425 (https://download.01.org/0day-ci/archive/20250425/202504251010.EMcDUvkH-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504251010.EMcDUvkH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504251010.EMcDUvkH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(kernel/panic.o):(function panic: .text.unlikely.+0x24): relocation R_RISCV_HI20 out of range: 531805 is not in [-524288, 524287]; references 'panic_on_warn'
   >>> referenced by panic.c:296 (kernel/panic.c:296)
   >>> defined in vmlinux.a(kernel/panic.o)
--
>> ld.lld: error: vmlinux.a(kernel/panic.o):(function panic: .text.unlikely.+0x32): relocation R_RISCV_HI20 out of range: 531805 is not in [-524288, 524287]; references 'crash_kexec_post_notifiers'
   >>> referenced by panic.c:296 (kernel/panic.c:296)
   >>> defined in vmlinux.a(kernel/panic.o)
--
>> ld.lld: error: vmlinux.a(kernel/panic.o):(function panic: .text.unlikely.+0x16e): relocation R_RISCV_HI20 out of range: 531805 is not in [-524288, 524287]; references 'panic_print'
   >>> referenced by panic.c:290 (kernel/panic.c:290)
   >>> defined in vmlinux.a(kernel/panic.o)
--
>> ld.lld: error: vmlinux.a(kernel/panic.o):(function panic: .text.unlikely.+0x182): relocation R_RISCV_HI20 out of range: 531805 is not in [-524288, 524287]; references 'panic_blink'
   >>> referenced by panic.c:290 (kernel/panic.c:290)
   >>> defined in vmlinux.a(kernel/panic.o)
--
>> ld.lld: error: vmlinux.a(kernel/panic.o):(function panic: .text.unlikely.+0x18c): relocation R_RISCV_HI20 out of range: 524315 is not in [-524288, 524287]; references 'no_blink'
   >>> referenced by irqflags.h:27 (arch/riscv/include/asm/irqflags.h:27)
   >>> defined in vmlinux.a(kernel/panic.o)
--
>> ld.lld: error: vmlinux.a(kernel/panic.o):(function panic: .text.unlikely.+0x198): relocation R_RISCV_HI20 out of range: 531805 is not in [-524288, 524287]; references 'panic_timeout'
   >>> referenced by irqflags.h:27 (arch/riscv/include/asm/irqflags.h:27)
   >>> defined in vmlinux.a(kernel/panic.o)
--
>> ld.lld: error: vmlinux.a(kernel/panic.o):(function panic: .text.unlikely.+0x1a4): relocation R_RISCV_HI20 out of range: 529975 is not in [-524288, 524287]; references '.L.str.5'
   >>> referenced by irqflags.h:27 (arch/riscv/include/asm/irqflags.h:27)
   >>> defined in vmlinux.a(kernel/panic.o)
--
>> ld.lld: error: vmlinux.a(kernel/panic.o):(function panic: .text.unlikely.+0x56): relocation R_RISCV_HI20 out of range: 531800 is not in [-524288, 524287]; references 'panic_cpu'
   >>> referenced by panic.c:294 (kernel/panic.c:294)
   >>> defined in vmlinux.a(kernel/panic.o)
--
>> ld.lld: error: vmlinux.a(kernel/panic.o):(function panic: .text.unlikely.+0x90): relocation R_RISCV_HI20 out of range: 531810 is not in [-524288, 524287]; references 'panic.buf'
   >>> referenced by panic.c:296 (kernel/panic.c:296)
   >>> defined in vmlinux.a(kernel/panic.o)
--
>> ld.lld: error: vmlinux.a(kernel/panic.o):(function panic: .text.unlikely.+0xd2): relocation R_RISCV_HI20 out of range: 531805 is not in [-524288, 524287]; references 'tainted_mask'
   >>> referenced by panic.c:303 (kernel/panic.c:303)
   >>> defined in vmlinux.a(kernel/panic.o)
--
>> ld.lld: error: vmlinux.a(kernel/panic.o):(function panic: .text.unlikely.+0xe0): relocation R_RISCV_HI20 out of range: 531805 is not in [-524288, 524287]; references 'oops_in_progress'
   >>> referenced by panic.c:303 (kernel/panic.c:303)
   >>> defined in vmlinux.a(kernel/printk/printk.o)
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
