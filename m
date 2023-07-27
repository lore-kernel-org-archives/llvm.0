Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF6C7C;
	Thu, 27 Jul 2023 00:57:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63548C433C8;
	Thu, 27 Jul 2023 00:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690419458;
	bh=hgXVQpN9jRdLIHYFC9Mr8PXTXRFiDg1FIEkp8t6nMws=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IkhFn3ofhntGmxlcWKsa2cpsblpLnrBqLgnipjuZ3vMgTgrbNnxylw39ohXRNRliK
	 M4TY7W8JsGFXLmr1kqWY+IQFYtWr9jnVUpvHEXQGCfKnfTTM47/dAQmu/miCE47Rde
	 NC7wSqLbIdC0VKTNTNSQr0jYI8/O/+s9GEKrWDIW1wLSX2D4QKwiyHxrXoc29uS5t6
	 8aLxKlqL3ZSelUpVPKpfEhUss60qOhTYhEqvTK3Rl2136/KL6p8fs9ypLRvleWXn3Q
	 7G16sQm0eFvdybYIVmg+ZcSLSuB2jqYsa8XR0pPbzbkSOWp/V7w0pTij8AtqQab6LN
	 dZkTLKZ/5VdDQ==
Date: Thu, 27 Jul 2023 09:57:34 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, Peter Zijlstra
 <peterz@infradead.org>
Subject: Re: [peterz-queue:x86/core 2/6]
 arch/x86/kernel/kprobes/core.c:326:7: error: call to undeclared function
 'is_cfi_trap'; ISO C99 and later do not support implicit function
 declarations
Message-Id: <20230727095734.238eef33f6f813c8361c1b19@kernel.org>
In-Reply-To: <202307262307.LETETZsF-lkp@intel.com>
References: <202307262307.LETETZsF-lkp@intel.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 26 Jul 2023 23:11:12 +0800
kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/core
> head:   1e68adb59894117251d942316d32514d45bd23ef
> commit: 9289e7bef6851d3b50619eab6b28d4d9ff69a12a [2/6] x86/kprobes: Prohibit probing on compiler generated CFI checking code
> config: x86_64-randconfig-x002-20230726 (https://download.01.org/0day-ci/archive/20230726/202307262307.LETETZsF-lkp@intel.com/config)
> compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
> reproduce: (https://download.01.org/0day-ci/archive/20230726/202307262307.LETETZsF-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307262307.LETETZsF-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> arch/x86/kernel/kprobes/core.c:326:7: error: call to undeclared function 'is_cfi_trap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>                    if (is_cfi_trap(addr + offset))
>                        ^
>    1 error generated.

Oops, this is because kprobes/core.c includes <asm/cfi.h> instead of <linux/cfi.h>.

diff --git a/arch/x86/kernel/kprobes/core.c b/arch/x86/kernel/kprobes/core.c
index fa8c2b41cbaf..e8babebad7b8 100644
--- a/arch/x86/kernel/kprobes/core.c
+++ b/arch/x86/kernel/kprobes/core.c
@@ -45,6 +45,7 @@
 #include <linux/vmalloc.h>
 #include <linux/pgtable.h>
 #include <linux/set_memory.h>
+#include <linux/cfi.h>
 
 #include <asm/text-patching.h>
 #include <asm/cacheflush.h>
@@ -54,7 +55,6 @@
 #include <asm/insn.h>
 #include <asm/debugreg.h>
 #include <asm/ibt.h>
-#include <asm/cfi.h>
 
 #include "common.h"
 

Thanks, 

> 
> 
> vim +/is_cfi_trap +326 arch/x86/kernel/kprobes/core.c
> 
>    254	
>    255	/* Check if paddr is at an instruction boundary */
>    256	static int can_probe(unsigned long paddr)
>    257	{
>    258		unsigned long addr, __addr, offset = 0;
>    259		struct insn insn;
>    260		kprobe_opcode_t buf[MAX_INSN_SIZE];
>    261	
>    262		if (!kallsyms_lookup_size_offset(paddr, NULL, &offset))
>    263			return 0;
>    264	
>    265		/* Decode instructions */
>    266		addr = paddr - offset;
>    267		while (addr < paddr) {
>    268			int ret;
>    269	
>    270			/*
>    271			 * Check if the instruction has been modified by another
>    272			 * kprobe, in which case we replace the breakpoint by the
>    273			 * original instruction in our buffer.
>    274			 * Also, jump optimization will change the breakpoint to
>    275			 * relative-jump. Since the relative-jump itself is
>    276			 * normally used, we just go through if there is no kprobe.
>    277			 */
>    278			__addr = recover_probed_instruction(buf, addr);
>    279			if (!__addr)
>    280				return 0;
>    281	
>    282			ret = insn_decode_kernel(&insn, (void *)__addr);
>    283			if (ret < 0)
>    284				return 0;
>    285	
>    286	#ifdef CONFIG_KGDB
>    287			/*
>    288			 * If there is a dynamically installed kgdb sw breakpoint,
>    289			 * this function should not be probed.
>    290			 */
>    291			if (insn.opcode.bytes[0] == INT3_INSN_OPCODE &&
>    292			    kgdb_has_hit_break(addr))
>    293				return 0;
>    294	#endif
>    295			addr += insn.length;
>    296		}
>    297		if (IS_ENABLED(CONFIG_CFI_CLANG)) {
>    298			/*
>    299			 * The compiler generates the following instruction sequence
>    300			 * for indirect call checks and cfi.c decodes this;
>    301			 *
>    302			 *   movl    -<id>, %r10d       ; 6 bytes
>    303			 *   addl    -4(%reg), %r10d    ; 4 bytes
>    304			 *   je      .Ltmp1             ; 2 bytes
>    305			 *   ud2                        ; <- regs->ip
>    306			 *   .Ltmp1:
>    307			 *
>    308			 * Also, these movl and addl are used for showing expected
>    309			 * type. So those must not be touched.
>    310			 */
>    311			__addr = recover_probed_instruction(buf, addr);
>    312			if (!__addr)
>    313				return 0;
>    314	
>    315			if (insn_decode_kernel(&insn, (void *)__addr) < 0)
>    316				return 0;
>    317	
>    318			if (insn.opcode.value == 0xBA)
>    319				offset = 12;
>    320			else if (insn.opcode.value == 0x3)
>    321				offset = 6;
>    322			else
>    323				goto out;
>    324	
>    325			/* This movl/addl is used for decoding CFI. */
>  > 326			if (is_cfi_trap(addr + offset))
>    327				return 0;
>    328		}
>    329	
>    330	out:
>    331		return (addr == paddr);
>    332	}
>    333	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
