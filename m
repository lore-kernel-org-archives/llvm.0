Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BB5255E2A;
	Fri, 18 Apr 2025 07:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744959660; cv=none; b=dT6vW7Uc/02MS5voB5fUVy+oGvkHE01SNPouXijiyfU6nYkgC2BFuw6MxKpEWgrMf+VKasCBf4rTp5wEX/pcd0SPs1R2LDKXjgZUBf0F+EjHpqP9t/jLgGUPwoJLdoQpzZJbA4+PuNmgd/nHQo5FWiWWtF1oqa8GNMKKoC/l5Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744959660; c=relaxed/simple;
	bh=TCDHWC0s2mttTULYMwOHeCZiwl981v1w0Q648/9avhE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VoRriNxKQ2rtwc7OOshpxnmnY9Ktew0eugWYuNEVaBWM1wjMDhk7IHRRrOTi4J8fCHDBLz4wCUo3JGlTeJSNpvJbSYR8hPu/UNPq2nhHvQLxHCCRtetgz3OUqAPE34S5pS4mSEER4lvpHCkdu3U++tUQd3pMGnLNbc1cGPORSaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nNlhBU0V; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nNlhBU0V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744959658; x=1776495658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TCDHWC0s2mttTULYMwOHeCZiwl981v1w0Q648/9avhE=;
  b=nNlhBU0VGwKOlHq/hwZyRgG/UOvt/RZS8FaXqpOfjJFbO4gvnXCiHVJ+
   cXFRF8SI+Dyhy5uq4yAsrTJpyYkff76e9qduviTUrq6ouWLn+tkJtoTT2
   r0NgPpRfuRL6kfPNYxjf8kw7NAx01tOuXTfwTCtgvCvv9ZRLbagDwU1MI
   ogt9b1YtmZvbDOXhTPxDg8IS+upQEeCcPJlkyyEQa+i+KtFF3rrG/dHm5
   q2N6UNuBh6wN89cGu8YvcsBhCQeNHR6knfzcdLM57/zQunRSudHtDKNul
   NyzoTWiLGYbf/2OgGSBSiq+U1ZYioQ8ZqaN8kcybW3BnsIV8qUKuDOfFQ
   A==;
X-CSE-ConnectionGUID: 2+O4L9YxT2Sj/7Msj5qheA==
X-CSE-MsgGUID: x07jk3iFRUyyl3ZnYP/SPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="50252798"
X-IronPort-AV: E=Sophos;i="6.15,221,1739865600"; 
   d="scan'208";a="50252798"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2025 00:00:58 -0700
X-CSE-ConnectionGUID: LdOhU4kFT6mPeA10xjLhzQ==
X-CSE-MsgGUID: bTI2fuM5QmaLtfNIeTjUYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,221,1739865600"; 
   d="scan'208";a="136145846"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Apr 2025 00:00:55 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5fiX-0002bP-1r;
	Fri, 18 Apr 2025 07:00:53 +0000
Date: Fri, 18 Apr 2025 15:00:16 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:asm-call 30/45] arch/x86/include/asm/mshyperv.h:345:2:
 error: embedding a #include directive within macro arguments is not
 supported
Message-ID: <202504181453.fePiAHCj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git asm-call
head:   36aeabb92668fa6bd293425a7fd6adf7e9c14e05
commit: 30438275ba89236cb6e0e9c9729e4f3ea1195bc2 [30/45] x86/hyperv: Use asm_call() in hypercall functions
config: x86_64-buildonly-randconfig-004-20250418 (https://download.01.org/0day-ci/archive/20250418/202504181453.fePiAHCj-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250418/202504181453.fePiAHCj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504181453.fePiAHCj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/hyperv/ivm.c:18:
>> arch/x86/include/asm/mshyperv.h:345:2: error: embedding a #include directive within macro arguments is not supported
     345 | #include <asm-generic/mshyperv.h>
         |  ^
   arch/x86/include/asm/mshyperv.h:87:2: note: expansion of macro 'asm_call' requested here
      87 |         asm_call("mov %[output_address], %%r8\n"
         |         ^
>> arch/x86/hyperv/ivm.c:19:2: error: embedding a #include directive within macro arguments is not supported
      19 | #include <asm/hypervisor.h>
         |  ^
   arch/x86/include/asm/mshyperv.h:87:2: note: expansion of macro 'asm_call' requested here
      87 |         asm_call("mov %[output_address], %%r8\n"
         |         ^
   arch/x86/hyperv/ivm.c:20:2: error: embedding a #include directive within macro arguments is not supported
      20 | #include <asm/mtrr.h>
         |  ^
   arch/x86/include/asm/mshyperv.h:87:2: note: expansion of macro 'asm_call' requested here
      87 |         asm_call("mov %[output_address], %%r8\n"
         |         ^
   arch/x86/hyperv/ivm.c:21:2: error: embedding a #include directive within macro arguments is not supported
      21 | #include <asm/io_apic.h>
         |  ^
   arch/x86/include/asm/mshyperv.h:87:2: note: expansion of macro 'asm_call' requested here
      87 |         asm_call("mov %[output_address], %%r8\n"
         |         ^
   arch/x86/hyperv/ivm.c:22:2: error: embedding a #include directive within macro arguments is not supported
      22 | #include <asm/realmode.h>
         |  ^
   arch/x86/include/asm/mshyperv.h:87:2: note: expansion of macro 'asm_call' requested here
      87 |         asm_call("mov %[output_address], %%r8\n"
         |         ^
   arch/x86/hyperv/ivm.c:23:2: error: embedding a #include directive within macro arguments is not supported
      23 | #include <asm/e820/api.h>
         |  ^
   arch/x86/include/asm/mshyperv.h:87:2: note: expansion of macro 'asm_call' requested here
      87 |         asm_call("mov %[output_address], %%r8\n"
         |         ^
   arch/x86/hyperv/ivm.c:24:2: error: embedding a #include directive within macro arguments is not supported
      24 | #include <asm/desc.h>
         |  ^
   arch/x86/include/asm/mshyperv.h:87:2: note: expansion of macro 'asm_call' requested here
      87 |         asm_call("mov %[output_address], %%r8\n"
         |         ^
   arch/x86/hyperv/ivm.c:25:2: error: embedding a #include directive within macro arguments is not supported
      25 | #include <uapi/asm/vmx.h>
         |  ^
   arch/x86/include/asm/mshyperv.h:87:2: note: expansion of macro 'asm_call' requested here
      87 |         asm_call("mov %[output_address], %%r8\n"
         |         ^
>> arch/x86/include/asm/mshyperv.h:87:2: error: unterminated function-like macro invocation
      87 |         asm_call("mov %[output_address], %%r8\n"
         |         ^
   arch/x86/include/asm/asm.h:234:9: note: macro 'asm_call' defined here
     234 | #define asm_call(insns, output, input, clobber...)                      \
         |         ^
>> arch/x86/hyperv/ivm.c:712:2: error: expected '}'
     712 | }
         |  ^
   arch/x86/include/asm/mshyperv.h:64:1: note: to match this '{'
      64 | {
         | ^
   10 errors generated.
--
   In file included from arch/x86/hyperv/nested.c:15:
>> arch/x86/include/asm/mshyperv.h:345:2: error: embedding a #include directive within macro arguments is not supported
     345 | #include <asm-generic/mshyperv.h>
         |  ^
   arch/x86/include/asm/mshyperv.h:87:2: note: expansion of macro 'asm_call' requested here
      87 |         asm_call("mov %[output_address], %%r8\n"
         |         ^
>> arch/x86/hyperv/nested.c:16:2: error: embedding a #include directive within macro arguments is not supported
      16 | #include <asm/tlbflush.h>
         |  ^
   arch/x86/include/asm/mshyperv.h:87:2: note: expansion of macro 'asm_call' requested here
      87 |         asm_call("mov %[output_address], %%r8\n"
         |         ^
   arch/x86/hyperv/nested.c:18:2: error: embedding a #include directive within macro arguments is not supported
      18 | #include <asm/trace/hyperv.h>
         |  ^
   arch/x86/include/asm/mshyperv.h:87:2: note: expansion of macro 'asm_call' requested here
      87 |         asm_call("mov %[output_address], %%r8\n"
         |         ^
>> arch/x86/include/asm/mshyperv.h:87:2: error: unterminated function-like macro invocation
      87 |         asm_call("mov %[output_address], %%r8\n"
         |         ^
   arch/x86/include/asm/asm.h:234:9: note: macro 'asm_call' defined here
     234 | #define asm_call(insns, output, input, clobber...)                      \
         |         ^
>> arch/x86/hyperv/nested.c:129:53: error: expected '}'
     129 | EXPORT_SYMBOL_GPL(hyperv_flush_guest_mapping_range);
         |                                                     ^
   arch/x86/include/asm/mshyperv.h:64:1: note: to match this '{'
      64 | {
         | ^
   5 errors generated.
--
   In file included from arch/x86/hyperv/hv_apic.c:29:
>> arch/x86/include/asm/mshyperv.h:345:2: error: embedding a #include directive within macro arguments is not supported
     345 | #include <asm-generic/mshyperv.h>
         |  ^
   arch/x86/include/asm/mshyperv.h:87:2: note: expansion of macro 'asm_call' requested here
      87 |         asm_call("mov %[output_address], %%r8\n"
         |         ^
>> arch/x86/hyperv/hv_apic.c:30:2: error: embedding a #include directive within macro arguments is not supported
      30 | #include <asm/apic.h>
         |  ^
   arch/x86/include/asm/mshyperv.h:87:2: note: expansion of macro 'asm_call' requested here
      87 |         asm_call("mov %[output_address], %%r8\n"
         |         ^
   arch/x86/hyperv/hv_apic.c:32:2: error: embedding a #include directive within macro arguments is not supported
      32 | #include <asm/trace/hyperv.h>
         |  ^
   arch/x86/include/asm/mshyperv.h:87:2: note: expansion of macro 'asm_call' requested here
      87 |         asm_call("mov %[output_address], %%r8\n"
         |         ^
>> arch/x86/include/asm/mshyperv.h:87:2: error: unterminated function-like macro invocation
      87 |         asm_call("mov %[output_address], %%r8\n"
         |         ^
   arch/x86/include/asm/asm.h:234:9: note: macro 'asm_call' defined here
     234 | #define asm_call(insns, output, input, clobber...)                      \
         |         ^
>> arch/x86/hyperv/hv_apic.c:332:2: error: expected '}'
     332 | }
         |  ^
   arch/x86/include/asm/mshyperv.h:64:1: note: to match this '{'
      64 | {
         | ^
   5 errors generated.
--
   In file included from arch/x86/hyperv/hv_init.c:23:
>> arch/x86/include/asm/mshyperv.h:345:2: error: embedding a #include directive within macro arguments is not supported
     345 | #include <asm-generic/mshyperv.h>
         |  ^
   arch/x86/include/asm/mshyperv.h:87:2: note: expansion of macro 'asm_call' requested here
      87 |         asm_call("mov %[output_address], %%r8\n"
         |         ^
>> arch/x86/hyperv/hv_init.c:24:2: error: embedding a #include directive within macro arguments is not supported
      24 | #include <asm/idtentry.h>
         |  ^
   arch/x86/include/asm/mshyperv.h:87:2: note: expansion of macro 'asm_call' requested here
      87 |         asm_call("mov %[output_address], %%r8\n"
         |         ^
   arch/x86/hyperv/hv_init.c:25:2: error: embedding a #include directive within macro arguments is not supported
      25 | #include <asm/set_memory.h>
         |  ^
   arch/x86/include/asm/mshyperv.h:87:2: note: expansion of macro 'asm_call' requested here
      87 |         asm_call("mov %[output_address], %%r8\n"
         |         ^
   arch/x86/hyperv/hv_init.c:26:2: error: embedding a #include directive within macro arguments is not supported
      26 | #include <linux/kexec.h>
         |  ^
   arch/x86/include/asm/mshyperv.h:87:2: note: expansion of macro 'asm_call' requested here
      87 |         asm_call("mov %[output_address], %%r8\n"
         |         ^
   arch/x86/hyperv/hv_init.c:27:2: error: embedding a #include directive within macro arguments is not supported
      27 | #include <linux/version.h>
         |  ^
   arch/x86/include/asm/mshyperv.h:87:2: note: expansion of macro 'asm_call' requested here
      87 |         asm_call("mov %[output_address], %%r8\n"
         |         ^
   arch/x86/hyperv/hv_init.c:28:2: error: embedding a #include directive within macro arguments is not supported
      28 | #include <linux/vmalloc.h>
         |  ^
   arch/x86/include/asm/mshyperv.h:87:2: note: expansion of macro 'asm_call' requested here
      87 |         asm_call("mov %[output_address], %%r8\n"
         |         ^
   arch/x86/hyperv/hv_init.c:29:2: error: embedding a #include directive within macro arguments is not supported
      29 | #include <linux/mm.h>
         |  ^
   arch/x86/include/asm/mshyperv.h:87:2: note: expansion of macro 'asm_call' requested here
      87 |         asm_call("mov %[output_address], %%r8\n"
         |         ^
   arch/x86/hyperv/hv_init.c:30:2: error: embedding a #include directive within macro arguments is not supported
      30 | #include <linux/slab.h>
         |  ^
   arch/x86/include/asm/mshyperv.h:87:2: note: expansion of macro 'asm_call' requested here
      87 |         asm_call("mov %[output_address], %%r8\n"
         |         ^
   arch/x86/hyperv/hv_init.c:31:2: error: embedding a #include directive within macro arguments is not supported
      31 | #include <linux/kernel.h>
         |  ^
   arch/x86/include/asm/mshyperv.h:87:2: note: expansion of macro 'asm_call' requested here
      87 |         asm_call("mov %[output_address], %%r8\n"
         |         ^
   arch/x86/hyperv/hv_init.c:32:2: error: embedding a #include directive within macro arguments is not supported
      32 | #include <linux/cpuhotplug.h>
         |  ^
   arch/x86/include/asm/mshyperv.h:87:2: note: expansion of macro 'asm_call' requested here
      87 |         asm_call("mov %[output_address], %%r8\n"
         |         ^
   arch/x86/hyperv/hv_init.c:33:2: error: embedding a #include directive within macro arguments is not supported
      33 | #include <linux/syscore_ops.h>
         |  ^
   arch/x86/include/asm/mshyperv.h:87:2: note: expansion of macro 'asm_call' requested here
      87 |         asm_call("mov %[output_address], %%r8\n"
         |         ^
   arch/x86/hyperv/hv_init.c:34:2: error: embedding a #include directive within macro arguments is not supported
      34 | #include <clocksource/hyperv_timer.h>
         |  ^
   arch/x86/include/asm/mshyperv.h:87:2: note: expansion of macro 'asm_call' requested here
      87 |         asm_call("mov %[output_address], %%r8\n"
         |         ^
   arch/x86/hyperv/hv_init.c:35:2: error: embedding a #include directive within macro arguments is not supported
      35 | #include <linux/highmem.h>
         |  ^
   arch/x86/include/asm/mshyperv.h:87:2: note: expansion of macro 'asm_call' requested here
      87 |         asm_call("mov %[output_address], %%r8\n"
         |         ^
>> arch/x86/include/asm/mshyperv.h:87:2: error: unterminated function-like macro invocation
      87 |         asm_call("mov %[output_address], %%r8\n"
         |         ^
   arch/x86/include/asm/asm.h:234:9: note: macro 'asm_call' defined here
     234 | #define asm_call(insns, output, input, clobber...)                      \
         |         ^
>> arch/x86/hyperv/hv_init.c:708:45: error: expected '}'
     708 | EXPORT_SYMBOL_GPL(hv_is_hyperv_initialized);
         |                                             ^
   arch/x86/include/asm/mshyperv.h:64:1: note: to match this '{'
      64 | {
         | ^
   15 errors generated.
--
   In file included from arch/x86/hyperv/irqdomain.c:13:
>> arch/x86/include/asm/mshyperv.h:345:2: error: embedding a #include directive within macro arguments is not supported
     345 | #include <asm-generic/mshyperv.h>
         |  ^
   arch/x86/include/asm/mshyperv.h:87:2: note: expansion of macro 'asm_call' requested here
      87 |         asm_call("mov %[output_address], %%r8\n"
         |         ^
>> arch/x86/include/asm/mshyperv.h:87:2: error: unterminated function-like macro invocation
      87 |         asm_call("mov %[output_address], %%r8\n"
         |         ^
   arch/x86/include/asm/asm.h:234:9: note: macro 'asm_call' defined here
     234 | #define asm_call(insns, output, input, clobber...)                      \
         |         ^
>> arch/x86/hyperv/irqdomain.c:364:44: error: expected '}'
     364 | EXPORT_SYMBOL_GPL(hv_map_ioapic_interrupt);
         |                                            ^
   arch/x86/include/asm/mshyperv.h:64:1: note: to match this '{'
      64 | {
         | ^
   3 errors generated.
--
   In file included from arch/x86/hyperv/mmu.c:8:
>> arch/x86/include/asm/mshyperv.h:345:2: error: embedding a #include directive within macro arguments is not supported
     345 | #include <asm-generic/mshyperv.h>
         |  ^
   arch/x86/include/asm/mshyperv.h:87:2: note: expansion of macro 'asm_call' requested here
      87 |         asm_call("mov %[output_address], %%r8\n"
         |         ^
>> arch/x86/hyperv/mmu.c:9:2: error: embedding a #include directive within macro arguments is not supported
       9 | #include <asm/msr.h>
         |  ^
   arch/x86/include/asm/mshyperv.h:87:2: note: expansion of macro 'asm_call' requested here
      87 |         asm_call("mov %[output_address], %%r8\n"
         |         ^
   arch/x86/hyperv/mmu.c:10:2: error: embedding a #include directive within macro arguments is not supported
      10 | #include <asm/tlbflush.h>
         |  ^
   arch/x86/include/asm/mshyperv.h:87:2: note: expansion of macro 'asm_call' requested here
      87 |         asm_call("mov %[output_address], %%r8\n"
         |         ^
   arch/x86/hyperv/mmu.c:11:2: error: embedding a #include directive within macro arguments is not supported
      11 | #include <asm/tlb.h>
         |  ^
   arch/x86/include/asm/mshyperv.h:87:2: note: expansion of macro 'asm_call' requested here
      87 |         asm_call("mov %[output_address], %%r8\n"
         |         ^
   arch/x86/hyperv/mmu.c:14:2: error: embedding a #include directive within macro arguments is not supported
      14 | #include <asm/trace/hyperv.h>
         |  ^
   arch/x86/include/asm/mshyperv.h:87:2: note: expansion of macro 'asm_call' requested here
      87 |         asm_call("mov %[output_address], %%r8\n"
         |         ^
>> arch/x86/include/asm/mshyperv.h:87:2: error: unterminated function-like macro invocation
      87 |         asm_call("mov %[output_address], %%r8\n"
         |         ^
   arch/x86/include/asm/asm.h:234:9: note: macro 'asm_call' defined here
     234 | #define asm_call(insns, output, input, clobber...)                      \
         |         ^
>> arch/x86/hyperv/mmu.c:246:2: error: expected '}'
     246 | }
         |  ^
   arch/x86/include/asm/mshyperv.h:64:1: note: to match this '{'
      64 | {
         | ^
   7 errors generated.
--
   In file included from drivers/clocksource/hyperv_timer.c:27:
>> arch/x86/include/asm/mshyperv.h:345:2: error: embedding a #include directive within macro arguments is not supported
     345 | #include <asm-generic/mshyperv.h>
         |  ^
   arch/x86/include/asm/mshyperv.h:87:2: note: expansion of macro 'asm_call' requested here
      87 |         asm_call("mov %[output_address], %%r8\n"
         |         ^
>> arch/x86/include/asm/mshyperv.h:87:2: error: unterminated function-like macro invocation
      87 |         asm_call("mov %[output_address], %%r8\n"
         |         ^
   arch/x86/include/asm/asm.h:234:9: note: macro 'asm_call' defined here
     234 | #define asm_call(insns, output, input, clobber...)                      \
         |         ^
>> drivers/clocksource/hyperv_timer.c:640:2: error: expected '}'
     640 | }
         |  ^
   arch/x86/include/asm/mshyperv.h:64:1: note: to match this '{'
      64 | {
         | ^
   3 errors generated.
..


vim +345 arch/x86/include/asm/mshyperv.h

3be1bc2fe9d2e4 Saurabh Sengar 2023-04-10  344  
765e33f5211ab6 Michael Kelley 2019-05-30 @345  #include <asm-generic/mshyperv.h>
765e33f5211ab6 Michael Kelley 2019-05-30  346  

:::::: The code at line 345 was first introduced by commit
:::::: 765e33f5211ab620c117ff1ee0c4f38c10f7a973 Drivers: hv: vmbus: Break out ISA independent parts of mshyperv.h

:::::: TO: Michael Kelley <mikelley@microsoft.com>
:::::: CC: Sasha Levin <sashal@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
