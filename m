Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098501DA53
	for <llvm@lists.linux.dev>; Wed, 13 Dec 2023 08:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bWxF1WJ2"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-336166b8143so3942877f8f.3
        for <llvm@lists.linux.dev>; Wed, 13 Dec 2023 00:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702456133; x=1703060933; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hr0EkM0AW4NJjEhu011HxfMqaEPMpfdcZOlpEJK/FFw=;
        b=bWxF1WJ21nikJzvJRRInvP8Lv5TS0txNfxZCZZv14LZ7vvOCVaSICNxqsQvA2rCfm4
         iJfLdXJ6GBJxrntGgt205UeMZSA7n1gLEer6K+DrLlgDBei0eun9zHbuxDDKfrCe8xpU
         YPqGoGSlrWmE5ondR+P2iNT1WdqN+7LMF6tbUd1TZ3Azxmiw3foNicUsXwQ/W+ibQ2zz
         l09S8z2Iv5ahPIVYHG8mDp2zMwrczV8jCmnBRq4seKrkLTr9m53HGgyDvhx/x+0AMYE5
         yed53BaE6cV6hvgZqbaq63Y1cqABtlkirSRfq9diM8G9hzdElH23U+tmjcORr2rLxiTp
         Herg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702456133; x=1703060933;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hr0EkM0AW4NJjEhu011HxfMqaEPMpfdcZOlpEJK/FFw=;
        b=AufaFAP3DboQ4wI7DRkheu5R3/Mvw38+uZiIkej4vgguEfM0/1176hBqKguXyv34vb
         92KjwXNNtP2MYQSMMsh9gSuOTZ5n2zEL7Hv6V9rAVNP6PF72+G8RyvTYEORcthZ/h9df
         B1GZ6qoVTFbdc/1CrM0+eWPMupQg+qvVzp8kq/bZ2dDDAa8op3ojOxcG4cMYi/Lb0LwN
         PvncBFrCqjJ4BBGI7ezBtbxsiyfWeHPW5DTxSxTHquCSOObbkIV4jduqGBzQp5RrtGjI
         warxDuCeEGppMSXudu9gx0Fd002TGIrWCUmCL7nd8oFX9c9wsPOQIZB8dwz6VNIsftsg
         fB6w==
X-Gm-Message-State: AOJu0YxvGCz71uO4kHr4HdajyB42BO4m0uUN6KmfrNrg0QCiWwd8ann5
	JnngNH5RJ3tcxg9TLatFpg16QvrLZgSAQdrG3CI=
X-Google-Smtp-Source: AGHT+IF6OU7e61gRhfLt8Ut2SGsCwbw2KIL2DFOd3md2kYPMnnta9DMW0C41gamy9EzjlgT+crWKmWy9dzyoihsdnUM=
X-Received: by 2002:adf:ebc2:0:b0:333:1bd5:b825 with SMTP id
 v2-20020adfebc2000000b003331bd5b825mr3616512wrn.69.1702456132974; Wed, 13 Dec
 2023 00:28:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221219061758.23321-1-ashimida.1990@gmail.com>
In-Reply-To: <20221219061758.23321-1-ashimida.1990@gmail.com>
From: Dan Li <ashimida.1990@gmail.com>
Date: Wed, 13 Dec 2023 16:28:41 +0800
Message-ID: <CAE+Z0PGx02FuQt3J8qzckH-YDbRpMyESCJgM1tRZu6xAS_JciA@mail.gmail.com>
Subject: Re: [RFC/RFT] CFI: Add support for gcc CFI in aarch64
To: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, 
	Nick Desaulniers <ndesaulniers@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Frederic Weisbecker <frederic@kernel.org>, "Eric W. Biederman" <ebiederm@xmission.com>, 
	Dan Li <ashimida.1990@gmail.com>, Marco Elver <elver@google.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Song Liu <song@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Uros Bizjak <ubizjak@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Juergen Gross <jgross@suse.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Borislav Petkov <bp@suse.de>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Aaron Tomlin <atomlin@redhat.com>, 
	Kalesh Singh <kaleshsingh@google.com>, Yuntao Wang <ytcoode@gmail.com>, 
	Changbin Du <changbin.du@intel.com>, wanglikun@lixiang.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I am happy to introduce to you that I have contacted a colleague Likun Wang=
, who
 is willing to continue completing this patch.
This patch has been delayed for a long time. I hope that gcc will
support this feature
in the near future.

Thanks.
Dan.

On Mon, 19 Dec 2022 at 14:18, Dan Li <ashimida.1990@gmail.com> wrote:
>
> Based on Sami's patch[1], this patch makes the corresponding kernel
> configuration of CFI available when compiling the kernel with the gcc[2].
>
> The code after enabling cfi is as follows:
>
> int (*p)(void);
> int func (int)
> {
>         p();
> }
>
> __cfi_func:
>         .4byte 0x439d3502
> func:
>         ......
>         adrp    x0, p
>         add     x0, x0, :lo12:p
>         mov     w1, 23592
>         movk    w1, 0x4601, lsl 16
>         cmp     w0, w1
>         beq     .L2
>         ......
>         bl      cfi_check_failed
> .L2:
>         blr     x19
>         ret
>
> In the compiler part[4], there are some differences from Sami's
> implementation[3], mainly including:
>
> 1. When a typeid mismatch is detected, the cfi_check_failed function
>    will be called instead of the brk instruction. This function needs
>    to be implemented by the compiler user.
>    If there are user mode programs or other systems that want to use
>    this feature, it may be more convenient to use a callback (so this
>    compilation option is set to -fsanitize=3Dcfi instead of kcfi).
>
> 2. A reserved typeid (such as 0x0U on the aarch64 platform) is always
>    inserted in front of functions that should not be called indirectly.
>    Functions that can be called indirectly will not use this hash value,
>    which prevents instructions/data before the function from being used
>    as a typeid by an attacker.
>
> 3. Some bits are ignored in the typeid to avoid conflicts between the
>    typeid and the instruction set of a specific platform, thereby
>    preventing an attacker from bypassing the CFI check by using the
>    instruction as a typeid, such as on the aarch64 platform:
>    * If the following instruction sequence exists:
>           400620:       a9be7bfd        stp     x29, x30, [sp, #-32]!
>           400624:       910003fd        mov     x29, sp
>           400628:       f9000bf3        str     x19, [sp, #16]
>    * If the expected typeid of the indirect call is exactly 0x910003fd,
>      the attacker can jump to the next instruction position of any
>      "mov x29,sp" instruction (such as 0x400628 here).
>
> 4. Insert a symbol __cfi_<function> before each function's typeid,
>    which may be helpful for fine-grained KASLR implementations (or not?).
>
> 5. The current implementation of gcc only supports the aarch64 platform.
>
> This produces the following oops on CFI failure (generated using lkdtm):
>
> /kselftest_install/lkdtm # ./CFI_FORWARD_PROTO.sh
> [   74.856516] lkdtm: Performing direct entry CFI_FORWARD_PROTO
> [   74.856878] lkdtm: Calling matched prototype ...
> [   74.857011] lkdtm: Calling mismatched prototype ...
> [   74.857133] CFI failure at lkdtm_indirect_call+0x30/0x50 (target: lkdt=
m_increment_int+0x0/0x1c; expected type: 0xc59c68f1)
> [   74.858185] Kernel panic - not syncing: Oops - CFI
> [   74.859240] CPU: 0 PID: 129 Comm: cat Not tainted 6.0.0-rc4-00024-g32b=
f7f14f497-dirty #150
> [   74.859481] Hardware name: linux,dummy-virt (DT)
> [   74.859795] Call trace:
> [   74.859959]  dump_backtrace.part.0+0xcc/0xe0
> [   74.860212]  show_stack+0x18/0x5c
> [   74.860327]  dump_stack_lvl+0x64/0x84
> [   74.860398]  dump_stack+0x18/0x38
> [   74.860443]  panic+0x170/0x36c
> [   74.860496]  cfi_check_failed+0x38/0x44
> [   74.860564]  lkdtm_indirect_call+0x30/0x50
> [   74.860614]  lkdtm_CFI_FORWARD_PROTO+0x3c/0x6c
> [   74.860701]  lkdtm_do_action+0x44/0x58
> [   74.860764]  direct_entry+0x148/0x160
> [   74.860814]  full_proxy_write+0x74/0xe0
> [   74.860874]  vfs_write+0xd8/0x2d0
> [   74.860942]  ksys_write+0x70/0x110
> [   74.861000]  __arm64_sys_write+0x1c/0x30
> [   74.861067]  invoke_syscall+0x5c/0x140
> [   74.861117]  el0_svc_common.constprop.0+0x44/0xf0
> [   74.861190]  do_el0_svc+0x2c/0xc0
> [   74.861233]  el0_svc+0x20/0x60
> [   74.861287]  el0t_64_sync_handler+0xf4/0x124
> [   74.861340]  el0t_64_sync+0x160/0x164
> [   74.861782] SMP: stopping secondary CPUs
> [   74.862336] Kernel Offset: disabled
> [   74.862439] CPU features: 0x0000,00075024,699418af
> [   74.862799] Memory Limit: none
> [   74.863373] ---[ end Kernel panic - not syncing: Oops - CFI ]---
>
> The gcc-related patches[4] are based on tag: releases/gcc-12.2.0.
>
> Any suggestion please let me know :).
>
> Thanks, Dan.
>
> [1] https://lore.kernel.org/all/20220908215504.3686827-1-samitolvanen@goo=
gle.com/
> [2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D107048
> [3] https://reviews.llvm.org/D119296
> [4] https://lore.kernel.org/linux-hardening/20221219055431.22596-1-ashimi=
da.1990@gmail.com/
>
> Signed-off-by: Dan Li <ashimida.1990@gmail.com>
> ---
>  Makefile                     |  6 ++++++
>  arch/Kconfig                 | 24 +++++++++++++++++++++++-
>  arch/arm64/Kconfig           |  1 +
>  include/linux/cfi_types.h    | 15 +++++++++++----
>  include/linux/compiler-gcc.h |  4 ++++
>  kernel/Makefile              |  1 +
>  kernel/cfi.c                 | 23 +++++++++++++++++++++++
>  scripts/kallsyms.c           |  4 +++-
>  8 files changed, 72 insertions(+), 6 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 43e08c9f95e9..7c74dac57aa4 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -926,6 +926,12 @@ KBUILD_CFLAGS      +=3D $(CC_FLAGS_CFI)
>  export CC_FLAGS_CFI
>  endif
>
> +ifdef CONFIG_CFI_GCC
> +CC_FLAGS_CFI   :=3D -fsanitize=3Dcfi
> +KBUILD_CFLAGS  +=3D $(CC_FLAGS_CFI)
> +export CC_FLAGS_CFI
> +endif
> +
>  ifdef CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B
>  KBUILD_CFLAGS +=3D -falign-functions=3D64
>  endif
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 1c1eca0c0019..8b43a9fd3b54 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -756,9 +756,31 @@ config CFI_CLANG
>
>             https://clang.llvm.org/docs/ControlFlowIntegrity.html
>
> +config ARCH_SUPPORTS_CFI_GCC
> +       bool
> +       help
> +         An architecture should select this option if it can support GCC=
's
> +         Control-Flow Integrity (CFI) checking.
> +
> +config CFI_GCC
> +       bool "Use GCC's Control Flow Integrity (CFI)"
> +       depends on ARCH_SUPPORTS_CFI_GCC
> +       depends on $(cc-option,-fsanitize=3Dcfi)
> +       help
> +         This option enables GCC=E2=80=99s forward-edge Control Flow Int=
egrity
> +         (CFI) checking, where the compiler injects a runtime check to e=
ach
> +         indirect function call to ensure the target is a valid function=
 with
> +         the correct static type. This restricts possible call targets a=
nd
> +         makes it more difficult for an attacker to exploit bugs that al=
low
> +         the modification of stored function pointers. More information =
can be
> +         found from the compiler's documentation:
> +
> +         - Clang: https://clang.llvm.org/docs/ControlFlowIntegrity.html
> +         - GCC: https://gcc.gnu.org/onlinedocs/gcc/Instrumentation-Optio=
ns.html#Instrumentation-Options
> +
>  config CFI_PERMISSIVE
>         bool "Use CFI in permissive mode"
> -       depends on CFI_CLANG
> +       depends on CFI_CLANG || CFI_GCC
>         help
>           When selected, Control Flow Integrity (CFI) violations result i=
n a
>           warning instead of a kernel panic. This option should only be u=
sed
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 9fb9fff08c94..60fdfb01cecb 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -89,6 +89,7 @@ config ARM64
>         select ARCH_SUPPORTS_LTO_CLANG if CPU_LITTLE_ENDIAN
>         select ARCH_SUPPORTS_LTO_CLANG_THIN
>         select ARCH_SUPPORTS_CFI_CLANG
> +       select ARCH_SUPPORTS_CFI_GCC
>         select ARCH_SUPPORTS_ATOMIC_RMW
>         select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
>         select ARCH_SUPPORTS_NUMA_BALANCING
> diff --git a/include/linux/cfi_types.h b/include/linux/cfi_types.h
> index 6b8713675765..1c3b7ea6a79f 100644
> --- a/include/linux/cfi_types.h
> +++ b/include/linux/cfi_types.h
> @@ -8,18 +8,25 @@
>  #ifdef __ASSEMBLY__
>  #include <linux/linkage.h>
>
> -#ifdef CONFIG_CFI_CLANG
> +#if defined(CONFIG_CFI_CLANG) || defined(CONFIG_CFI_GCC)
>  /*
> - * Use the __kcfi_typeid_<function> type identifier symbol to
> + * Use the __[k]cfi_typeid_<function> type identifier symbol to
>   * annotate indirectly called assembly functions. The compiler emits
>   * these symbols for all address-taken function declarations in C
>   * code.
>   */
>  #ifndef __CFI_TYPE
> +
> +#ifdef CONFIG_CFI_GCC
> +#define __CFI_TYPE(name)                               \
> +       .4byte __cfi_typeid_##name
> +#else
>  #define __CFI_TYPE(name)                               \
>         .4byte __kcfi_typeid_##name
>  #endif
>
> +#endif
> +
>  #define SYM_TYPED_ENTRY(name, linkage, align...)       \
>         linkage(name) ASM_NL                            \
>         align ASM_NL                                    \
> @@ -29,12 +36,12 @@
>  #define SYM_TYPED_START(name, linkage, align...)       \
>         SYM_TYPED_ENTRY(name, linkage, align)
>
> -#else /* CONFIG_CFI_CLANG */
> +#else /* defined(CONFIG_CFI_CLANG) || defined(CONFIG_CFI_GCC) */
>
>  #define SYM_TYPED_START(name, linkage, align...)       \
>         SYM_START(name, linkage, align)
>
> -#endif /* CONFIG_CFI_CLANG */
> +#endif /* defined(CONFIG_CFI_CLANG) || defined(CONFIG_CFI_GCC) */
>
>  #ifndef SYM_TYPED_FUNC_START
>  #define SYM_TYPED_FUNC_START(name)                     \
> diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc.h
> index 9b157b71036f..aec1ce327b1a 100644
> --- a/include/linux/compiler-gcc.h
> +++ b/include/linux/compiler-gcc.h
> @@ -82,6 +82,10 @@
>  #define __noscs __attribute__((__no_sanitize__("shadow-call-stack")))
>  #endif
>
> +#ifdef CONFIG_CFI_GCC
> +#define __nocfi __attribute__((no_sanitize("cfi")))
> +#endif
> +
>  #if __has_attribute(__no_sanitize_address__)
>  #define __no_sanitize_address __attribute__((no_sanitize_address))
>  #else
> diff --git a/kernel/Makefile b/kernel/Makefile
> index 318789c728d3..923d3e060852 100644
> --- a/kernel/Makefile
> +++ b/kernel/Makefile
> @@ -114,6 +114,7 @@ obj-$(CONFIG_SHADOW_CALL_STACK) +=3D scs.o
>  obj-$(CONFIG_HAVE_STATIC_CALL) +=3D static_call.o
>  obj-$(CONFIG_HAVE_STATIC_CALL_INLINE) +=3D static_call_inline.o
>  obj-$(CONFIG_CFI_CLANG) +=3D cfi.o
> +obj-$(CONFIG_CFI_GCC) +=3D cfi.o
>
>  obj-$(CONFIG_PERF_EVENTS) +=3D events/
>
> diff --git a/kernel/cfi.c b/kernel/cfi.c
> index 08caad776717..9bff35736756 100644
> --- a/kernel/cfi.c
> +++ b/kernel/cfi.c
> @@ -25,6 +25,7 @@ enum bug_trap_type report_cfi_failure(struct pt_regs *r=
egs, unsigned long addr,
>         return BUG_TRAP_TYPE_BUG;
>  }
>
> +#ifdef CONFIG_CFI_CLANG
>  #ifdef CONFIG_ARCH_USES_CFI_TRAPS
>  static inline unsigned long trap_address(s32 *p)
>  {
> @@ -99,3 +100,25 @@ bool is_cfi_trap(unsigned long addr)
>         return is_module_cfi_trap(addr);
>  }
>  #endif /* CONFIG_ARCH_USES_CFI_TRAPS */
> +#endif /* CONFIG_CFI_CLANG */
> +
> +
> +#ifdef CONFIG_CFI_GCC
> +void cfi_check_failed(u32 caller_hash, u32 callee_hash, void *callee_add=
r)
> +{
> +       unsigned long pc, target;
> +
> +       pc =3D (unsigned long)__builtin_return_address(0);
> +       target =3D (unsigned long)callee_addr;
> +
> +       switch (report_cfi_failure(NULL, pc, &target, caller_hash)) {
> +       case BUG_TRAP_TYPE_WARN:
> +               break;
> +
> +       default:
> +               panic("Oops - CFI");
> +       }
> +}
> +EXPORT_SYMBOL(cfi_check_failed);
> +
> +#endif /* CONFIG_CFI_GCC */
> diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> index ccdf0c897f31..ed8db513b918 100644
> --- a/scripts/kallsyms.c
> +++ b/scripts/kallsyms.c
> @@ -119,7 +119,9 @@ static bool is_ignored_symbol(const char *name, char =
type)
>                 "__ThumbV7PILongThunk_",
>                 "__LA25Thunk_",         /* mips lld */
>                 "__microLA25Thunk_",
> -               "__kcfi_typeid_",       /* CFI type identifiers */
> +               "__kcfi_typeid_",       /* CFI type identifiers in Clang =
*/
> +               "__cfi_",               /* CFI type identifiers in GCC */
> +               "__pi___cfi",           /* CFI type identifiers in GCC */
>                 NULL
>         };
>
> --
> 2.17.1
>
