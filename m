Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D997F
	for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 09:17:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9C5CC433D6;
	Tue, 13 Sep 2022 09:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663060641;
	bh=nmqz7sUuMUXE8siVt7fHeWfUzUiXyZ8VH5vhiBlo5nQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KRjThd1AXQ9MiGoHr4l/y1XiO1XZ218iHjc+cLZJjZNzg56km1aeF2w56KzY4JfU3
	 W7sJqFKA3S377HVBQAoQ+hj4imApPX2AmHhKvRwORZ5iiSMzFcEa0Lhs2cPV4E+z6n
	 QYg39BtMd6ZNV9KpYVWSPjLbL2EDpuK8Gw1PZDNQRXorJLH3njSTvrKN/MttyKXjwr
	 LziWRnfCeXehiPSqoe8uVB04dfroa5jZyS36PEvKsa0R4nuJt3jdRdWAGY8E/3ekZL
	 hjz8caTZVEUA5atmdIp6r+jjL0OD7SddRQC66mUGYdO19im3G/t2216f76R9y+jydg
	 jkPv47ywDp0NA==
Date: Tue, 13 Sep 2022 02:17:18 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: peterz@infradead.org, tglx@linutronix.de
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev,
	kernel test robot <lkp@intel.com>
Subject: Re: [peterz-queue:call-depth-tracking 11/59] ld.lld: error:
 arch/x86/built-in.a(kvm.o at 12382) <inline asm>:48:149: expected newline
Message-ID: <YyBKngJE6M11bzrn@dev-arch.thelio-3990X>
References: <202209130503.22IT78Lt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202209130503.22IT78Lt-lkp@intel.com>

+ PeterZ, tglx

On Tue, Sep 13, 2022 at 05:26:43AM +0800, kernel test robot wrote:
> CC: linux-kernel@vger.kernel.org
> TO: Thomas Gleixner <tglx@linutronix.de>
> CC: "Peter Zijlstra (Intel)" <peterz@infradead.org>
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git call-depth-tracking
> head:   3a02739baf0302d9ba295686fc7a48fdd235ad15
> commit: df1de0e0220ea824baf5ff3ef0993bb85fce0c7f [11/59] x86/paravirt: Properly align PV functions
> config: i386-randconfig-a012-20220912
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=df1de0e0220ea824baf5ff3ef0993bb85fce0c7f
>         git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
>         git fetch --no-tags peterz-queue call-depth-tracking
>         git checkout df1de0e0220ea824baf5ff3ef0993bb85fce0c7f
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    error: expected newline
>    .balign 4, 0x90_paravirt_nop:
>    ^
>    error: invalid hexadecimal floating-point constant: expected at least one exponent digit
>    .balign 4, 0x90paravirt_ret0:
>    ^
>    error: expected newline
>    .balign 4, 0x90_paravirt_nop:
>    ^
>    error: invalid hexadecimal floating-point constant: expected at least one exponent digit
>    .balign 4, 0x90paravirt_ret0:
>    ^
> >> ld.lld: error: arch/x86/built-in.a(kvm.o at 12382) <inline asm>:48:149: expected newline
>    .pushsection .text, "ax";.globl __raw_callee_save___kvm_vcpu_is_preempted;.type __raw_callee_save___kvm_vcpu_is_preempted, @function;.balign 4, 0x90__raw_callee_save___kvm_vcpu_is_preempted:push %ebp
>    ^
> --
> >> LLVM ERROR: Size expression must be absolute.
>    PLEASE submit a bug report to https://github.com/llvm/llvm-project/issues/ and include the crash backtrace.

I guess this would be the fix for all cases?

Cheers,
Nathan

diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
index 2851bc2339d5..f307051bfd06 100644
--- a/arch/x86/include/asm/paravirt.h
+++ b/arch/x86/include/asm/paravirt.h
@@ -665,7 +665,7 @@ bool __raw_callee_save___native_vcpu_is_preempted(long cpu);
 	asm(".pushsection " section ", \"ax\";"				\
 	    ".globl " PV_THUNK_NAME(func) ";"				\
 	    ".type " PV_THUNK_NAME(func) ", @function;"			\
-	    ASM_FUNC_ALIGN						\
+	    ASM_FUNC_ALIGN ";"						\
 	    PV_THUNK_NAME(func) ":"					\
 	    ASM_ENDBR							\
 	    FRAME_BEGIN							\
diff --git a/arch/x86/include/asm/qspinlock_paravirt.h b/arch/x86/include/asm/qspinlock_paravirt.h
index 8fd180f049f3..8f595d843bae 100644
--- a/arch/x86/include/asm/qspinlock_paravirt.h
+++ b/arch/x86/include/asm/qspinlock_paravirt.h
@@ -39,7 +39,7 @@ PV_CALLEE_SAVE_REGS_THUNK(__pv_queued_spin_unlock_slowpath);
 asm    (".pushsection .text;"
 	".globl " PV_UNLOCK ";"
 	".type " PV_UNLOCK ", @function;"
-	ASM_FUNC_ALIGN
+	ASM_FUNC_ALIGN ";"
 	PV_UNLOCK ": "
 	ASM_ENDBR
 	FRAME_BEGIN
diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index 95fb85bea111..457460a00e86 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -802,7 +802,7 @@ asm(
 ".pushsection .text;"
 ".global __raw_callee_save___kvm_vcpu_is_preempted;"
 ".type __raw_callee_save___kvm_vcpu_is_preempted, @function;"
-ASM_FUNC_ALIGN
+ASM_FUNC_ALIGN ";"
 "__raw_callee_save___kvm_vcpu_is_preempted:"
 ASM_ENDBR
 "movq	__per_cpu_offset(,%rdi,8), %rax;"
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index e244c49b52d7..6442ef5b0445 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -40,7 +40,7 @@
 extern void _paravirt_nop(void);
 asm (".pushsection .entry.text, \"ax\"\n"
      ".global _paravirt_nop\n"
-     ASM_FUNC_ALIGN
+     ASM_FUNC_ALIGN "\n\t"
      "_paravirt_nop:\n\t"
      ASM_ENDBR
      ASM_RET
@@ -51,7 +51,7 @@ asm (".pushsection .entry.text, \"ax\"\n"
 /* stub always returning 0. */
 asm (".pushsection .entry.text, \"ax\"\n"
      ".global paravirt_ret0\n"
-     ASM_FUNC_ALIGN
+     ASM_FUNC_ALIGN "\n\t"
      "paravirt_ret0:\n\t"
      ASM_ENDBR
      "xor %" _ASM_AX ", %" _ASM_AX ";\n\t"
diff --git a/arch/x86/lib/error-inject.c b/arch/x86/lib/error-inject.c
index b5a6d83106bc..361973898be9 100644
--- a/arch/x86/lib/error-inject.c
+++ b/arch/x86/lib/error-inject.c
@@ -11,7 +11,7 @@ asm(
 	".text\n"
 	".type just_return_func, @function\n"
 	".globl just_return_func\n"
-	ASM_FUNC_ALIGN
+	ASM_FUNC_ALIGN "\n"
 	"just_return_func:\n"
 		ANNOTATE_NOENDBR
 		ASM_RET
