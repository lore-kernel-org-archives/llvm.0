Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8883F2F549C;
	Wed,  4 Feb 2026 17:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770225082; cv=none; b=DrqewoBSOQUcIOkgtz5GUQDLXuSM36fnle7Oa1z6kdRF29n1rlNu/3MTn4FjQ3Q47SAKVvJITlT3Il8rTkDqCgWdwfhlQI9k5xEZZJw0VwPrmBf3ROrrIxLGmUevsoIOHxNJUgnUoMpHGj8ceAxw+OnhmY7VJOaj7FmyEAMKfiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770225082; c=relaxed/simple;
	bh=DZr3xv+GzJNH7jtIzuWqZrotOseXwfU3NNhVN3urNoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=tYL0hVDfkamYtXR/nQKrkz6n5yS65DbtNl0hKsU0dKPZPwSuWWVlwkmPkxDfs06K9py4f9R5munXEiL4yEG3Ayu5I+8kA0nN0+Es16Fhkf7BGjPvNle6gCgSMxMJk3Fe8O0UvwEbY7rcvLy7WVRWe++8bdu8uj+Y+Sk/CTHIXH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eua5x8TM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eua5x8TM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0968C116C6;
	Wed,  4 Feb 2026 17:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770225082;
	bh=DZr3xv+GzJNH7jtIzuWqZrotOseXwfU3NNhVN3urNoA=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Eua5x8TMYdeA8rsjLKIAY7KFDuKGSosJKc9WzNWn/H3XEwUroNzMuRL9bkUMMsjrk
	 Y+uHsZgcgMqS6Wm0LrIZ7EcC5qc7O7tXo30ui563EElDWqyapz64W/xhoC7CHc4hIr
	 /rk1iVI/tlG0zPXRBn8X+Ez4BbdLGNJBpswbI+Z9Vg9nwOXpkCa49MjsrEQdum8P5G
	 2tjYO2p9LglFje12n7lVze6IgrPbMDGpgsJ/oeCWI6GNt/KioZncq1PBnQ5NSTIFls
	 J3tz1UpJ1MNxlJ1ENLB/+6dhZSGBhZ/eELez8eNmtKpgFwmFuff5o9YOPrwR67jxdN
	 FFA2w5wr42DXA==
Message-ID: <da26fa6a-5262-45bf-890c-7afbf94d0897@kernel.org>
Date: Wed, 4 Feb 2026 18:11:13 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc: Enable Rust for ppc64le
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com,
 rostedt@goodmis.org, ardb@kernel.org, ojeda@kernel.org,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org,
 nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
 Link Mauve <linkmauve@linkmauve.fr>
References: <20260204042417.83903-1-mkchauras@gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260204042417.83903-1-mkchauras@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Mukesh, hi Link,

Le 04/02/2026 à 05:24, Mukesh Kumar Chaurasiya (IBM) a écrit :
> [Vous ne recevez pas souvent de courriers de mkchauras@gmail.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> Enabling rust support for ppc64 only.

Link Mauve has sent a patch for rust support on PPC32 a few hours before 
you, see 
https://lore.kernel.org/r/20260204030507.8203-1-linkmauve@linkmauve.fr
Could you coordinate together to provide something supporting both PPC32 
and PPC64 ?

I see the following conflicts at the time being. I also have a few 
comments down.

diff --git a/Documentation/rust/arch-support.rst 
b/Documentation/rust/arch-support.rst
index 6e6a515d0899..70b9e192a7a0 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -18,6 +18,7 @@ Architecture   Level of support  Constraints
  ``arm``        Maintained        ARMv7 Little Endian only.
  ``arm64``      Maintained        Little Endian only.
  ``loongarch``  Maintained        \-
+``powerpc``    Maintained        32-bit Big Endian only.
  ``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
  ``um``         Maintained        \-
  ``x86``        Maintained        ``x86_64`` only.
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index b8d36a261009..80b2666fc5af 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -283,8 +283,10 @@ config PPC
  	select HAVE_REGS_AND_STACK_ACCESS_API
  	select HAVE_RELIABLE_STACKTRACE
  	select HAVE_RSEQ
+	select HAVE_RUST			if PPC32
  	select HAVE_SAMPLE_FTRACE_DIRECT	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
  	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI	if 
HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+	select HAVE_RUST			if PPC64
  	select HAVE_SETUP_PER_CPU_AREA		if PPC64
  	select HAVE_SOFTIRQ_ON_OWN_STACK
  	select HAVE_STACKPROTECTOR		if PPC32 && $(cc-option,$(m32-flag) 
-mstack-protector-guard=tls -mstack-protector-guard-reg=r2 
-mstack-protector-guard-offset=0)
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index a58b1029592c..ac6fe8cc4ece 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -61,6 +61,8 @@ else
  KBUILD_LDFLAGS_MODULE += $(objtree)/arch/powerpc/lib/crtsavres.o
  endif

+KBUILD_RUSTFLAGS += --target=powerpc-unknown-linux-gnu
+
  ifdef CONFIG_CPU_LITTLE_ENDIAN
  KBUILD_CPPFLAGS	+= -mlittle-endian
  KBUILD_LDFLAGS	+= -EL
@@ -172,10 +174,11 @@ CFLAGS-y += $(CONFIG_TUNE_CPU)

  asinstr := $(call as-instr,lis 9$(comma)foo@high,-DHAVE_AS_ATHIGH=1)

-KBUILD_CPPFLAGS	+= -I $(srctree)/arch/powerpc $(asinstr)
-KBUILD_AFLAGS	+= $(AFLAGS-y)
-KBUILD_CFLAGS	+= $(CC_FLAGS_NO_FPU)
-KBUILD_CFLAGS	+= $(CFLAGS-y)
+KBUILD_CPPFLAGS		+= -I $(srctree)/arch/powerpc $(asinstr)
+KBUILD_AFLAGS		+= $(AFLAGS-y)
+KBUILD_CFLAGS		+= $(CC_FLAGS_NO_FPU)
+KBUILD_CFLAGS		+= $(CFLAGS-y)
+KBUILD_RUSTFLAGS        += -Ctarget-feature=-mma,-vsx,-hard-float,-altivec

  CHECKFLAGS	+= -m$(BITS) -D__powerpc__ -D__powerpc$(BITS)__
  ifdef CONFIG_CPU_BIG_ENDIAN
diff --git a/arch/powerpc/include/asm/jump_label.h 
b/arch/powerpc/include/asm/jump_label.h
index d4eaba459a0e..d2284c72d21b 100644
--- a/arch/powerpc/include/asm/jump_label.h
+++ b/arch/powerpc/include/asm/jump_label.h
@@ -15,14 +15,35 @@
  #define JUMP_ENTRY_TYPE		stringify_in_c(FTR_ENTRY_LONG)
  #define JUMP_LABEL_NOP_SIZE	4

+<<<<<<< HEAD
+/* This macro is also expanded on the Rust side. */
+#define ARCH_STATIC_BRANCH_ASM(key, label)		\
+	"1:\n\t"					\
+	"nop # arch_static_branch\n\t"			\
+	".pushsection __jump_table,  \"aw\"\n\t"	\
+	".long 1b - ., " label " - .\n\t"		\
+	 JUMP_ENTRY_TYPE key " - .\n\t"			\
+	 ".popsection \n\t"
+
  static __always_inline bool arch_static_branch(struct static_key *key, 
bool branch)
  {
-	asm goto("1:\n\t"
-		 "nop # arch_static_branch\n\t"
-		 ".pushsection __jump_table,  \"aw\"\n\t"
-		 ".long 1b - ., %l[l_yes] - .\n\t"
-		 JUMP_ENTRY_TYPE "%c0 - .\n\t"
-		 ".popsection \n\t"
+	asm goto(ARCH_STATIC_BRANCH_ASM("%c0", "%l[l_yes]")
+=======
+#define JUMP_TABLE_ENTRY(key, label)			\
+	".pushsection __jump_table,  \"aw\"	\n\t"	\
+	".long 1b - ., " label " - .		\n\t"	\
+	JUMP_ENTRY_TYPE key " - .		\n\t"	\
+	".popsection 				\n\t"
+
+#define ARCH_STATIC_BRANCH_ASM(key, label)		\
+	"1:	nop				\n\t"	\
+	JUMP_TABLE_ENTRY(key,label)
+
+static __always_inline bool arch_static_branch(struct static_key *key, 
bool branch)
+{
+	asm goto(
+		 ARCH_STATIC_BRANCH_ASM("%c0", "%l[l_yes]")
+>>>>>>> rust64
  		 : :  "i" (&((char *)key)[branch]) : : l_yes);

  	return false;
@@ -34,10 +55,7 @@ static __always_inline bool 
arch_static_branch_jump(struct static_key *key, bool
  {
  	asm goto("1:\n\t"
  		 "b %l[l_yes] # arch_static_branch_jump\n\t"
-		 ".pushsection __jump_table,  \"aw\"\n\t"
-		 ".long 1b - ., %l[l_yes] - .\n\t"
-		 JUMP_ENTRY_TYPE "%c0 - .\n\t"
-		 ".popsection \n\t"
+		 JUMP_TABLE_ENTRY("%c0", "%l[l_yes]")
  		 : :  "i" (&((char *)key)[branch]) : : l_yes);

  	return false;
diff --git a/rust/Makefile b/rust/Makefile
index 5d357dce1704..9b72c1e96191 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -383,13 +383,19 @@ bindgen_skip_c_flags := -mno-fp-ret-in-387 
-mpreferred-stack-boundary=% \
  	-fno-inline-functions-called-once -fsanitize=bounds-strict \
  	-fstrict-flex-arrays=% -fmin-function-alignment=% \
  	-fzero-init-padding-bits=% -mno-fdpic \
-	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference
+	--param=% --param asan-% -fno-isolate-erroneous-paths-dereference \
+	-ffixed-r2 -mmultiple -mno-readonly-in-sdata

  # Derived from `scripts/Makefile.clang`.
  BINDGEN_TARGET_x86	:= x86_64-linux-gnu
  BINDGEN_TARGET_arm64	:= aarch64-linux-gnu
  BINDGEN_TARGET_arm	:= arm-linux-gnueabi
  BINDGEN_TARGET_loongarch	:= loongarch64-linux-gnusf
+<<<<<<< HEAD
+BINDGEN_TARGET_powerpc	:= powerpc-linux-gnu
+=======
+BINDGEN_TARGET_powerpc	:= powerpc64le-linux-gnu
+>>>>>>> rust64
  BINDGEN_TARGET_um	:= $(BINDGEN_TARGET_$(SUBARCH))
  BINDGEN_TARGET		:= $(BINDGEN_TARGET_$(SRCARCH))

diff --git a/scripts/generate_rust_target.rs 
b/scripts/generate_rust_target.rs
index 38b3416bb979..1860af50b926 100644
--- a/scripts/generate_rust_target.rs
+++ b/scripts/generate_rust_target.rs
@@ -188,6 +188,16 @@ fn main() {
          panic!("arm uses the builtin rustc target");
      } else if cfg.has("ARM64") {
          panic!("arm64 uses the builtin rustc aarch64-unknown-none 
target");
+    } else if cfg.has("PPC32") {
+        ts.push("arch", "powerpc");
+        ts.push("data-layout", "E-m:e-p:32:32-Fn32-i64:64-n32");
+        ts.push("features", "+soft-float");
+        ts.push("llvm-target", "powerpc-unknown-eabi");
+        if cfg.rustc_version_atleast(1, 91, 0) {
+            ts.push("target-pointer-width", 32);
+        } else {
+            ts.push("target-pointer-width", "32");
+        }
      } else if cfg.has("RISCV") {
          if cfg.has("64BIT") {
              panic!("64-bit RISC-V uses the builtin rustc 
riscv64-unknown-none-elf target");
@@ -256,6 +266,30 @@ fn main() {
          }
      } else if cfg.has("LOONGARCH") {
          panic!("loongarch uses the builtin rustc 
loongarch64-unknown-none-softfloat target");
+    } else if cfg.has("PPC64") {
+        ts.push("arch", "powerpc64");
+        ts.push(
+            "data-layout",
+            if cfg.has("CPU_LITTLE_ENDIAN") {
+                "e-m:e-Fn32-i64:64-n32:64-S128-v256:256:256-v512:512:512"
+            } else {
+                "E-m:e-Fn32-i64:64-n32:64-S128-v256:256:256-v512:512:512"
+            },
+        );
+        ts.push("features", "-mma,-altivec,-vsx,-hard-float");
+        ts.push(
+            "llvm-target",
+            if cfg.has("CPU_LITTLE_ENDIAN") {
+                "powerpc64le-linux-gnu"
+            } else {
+                "powerpc64-linux-gnu"
+            },
+        );
+        if cfg.rustc_version_atleast(1, 91, 0) {
+            ts.push("target-pointer-width", 64);
+        } else {
+            ts.push("target-pointer-width", "64");
+        }
      } else {
          panic!("Unsupported architecture");
      }

[...]

> ---
>   arch/powerpc/Kconfig                  |  1 +
>   arch/powerpc/Makefile                 |  9 +++++----
>   arch/powerpc/include/asm/jump_label.h | 23 +++++++++++++----------
>   rust/Makefile                         |  1 +
>   scripts/generate_rust_target.rs       | 24 ++++++++++++++++++++++++
>   5 files changed, 44 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 9537a61ebae0..e9b8d761ed52 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -285,6 +285,7 @@ config PPC
>          select HAVE_RSEQ
>          select HAVE_SAMPLE_FTRACE_DIRECT        if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
>          select HAVE_SAMPLE_FTRACE_DIRECT_MULTI  if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
> +       select HAVE_RUST                        if PPC64

Keep in alphabetic order

>          select HAVE_SETUP_PER_CPU_AREA          if PPC64
>          select HAVE_SOFTIRQ_ON_OWN_STACK
>          select HAVE_STACKPROTECTOR              if PPC32 && $(cc-option,$(m32-flag) -mstack-protector-guard=tls -mstack-protector-guard-reg=r2 -mstack-protector-guard-offset=0)
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index a58b1029592c..7ad28cf0fd35 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -172,10 +172,11 @@ CFLAGS-y += $(CONFIG_TUNE_CPU)
> 
>   asinstr := $(call as-instr,lis 9$(comma)foo@high,-DHAVE_AS_ATHIGH=1)
> 
> -KBUILD_CPPFLAGS        += -I $(srctree)/arch/powerpc $(asinstr)
> -KBUILD_AFLAGS  += $(AFLAGS-y)
> -KBUILD_CFLAGS  += $(CC_FLAGS_NO_FPU)
> -KBUILD_CFLAGS  += $(CFLAGS-y)
> +KBUILD_CPPFLAGS                += -I $(srctree)/arch/powerpc $(asinstr)
> +KBUILD_AFLAGS          += $(AFLAGS-y)
> +KBUILD_CFLAGS          += $(CC_FLAGS_NO_FPU)
> +KBUILD_CFLAGS          += $(CFLAGS-y)
> +KBUILD_RUSTFLAGS        += -Ctarget-feature=-mma,-vsx,-hard-float,-altivec
> 
>   CHECKFLAGS     += -m$(BITS) -D__powerpc__ -D__powerpc$(BITS)__
>   ifdef CONFIG_CPU_BIG_ENDIAN
> diff --git a/arch/powerpc/include/asm/jump_label.h b/arch/powerpc/include/asm/jump_label.h
> index d4eaba459a0e..a6b211502bfe 100644
> --- a/arch/powerpc/include/asm/jump_label.h
> +++ b/arch/powerpc/include/asm/jump_label.h
> @@ -15,14 +15,20 @@
>   #define JUMP_ENTRY_TYPE                stringify_in_c(FTR_ENTRY_LONG)
>   #define JUMP_LABEL_NOP_SIZE    4
> 
> +#define JUMP_TABLE_ENTRY(key, label)                   \
> +       ".pushsection __jump_table,  \"aw\"     \n\t"   \
> +       ".long 1b - ., " label " - .            \n\t"   \
> +       JUMP_ENTRY_TYPE key " - .               \n\t"   \
> +       ".popsection                            \n\t"
> +
> +#define ARCH_STATIC_BRANCH_ASM(key, label)             \
> +       "1:     nop                             \n\t"   \
> +       JUMP_TABLE_ENTRY(key,label)
> +
>   static __always_inline bool arch_static_branch(struct static_key *key, bool branch)
>   {
> -       asm goto("1:\n\t"
> -                "nop # arch_static_branch\n\t"
> -                ".pushsection __jump_table,  \"aw\"\n\t"
> -                ".long 1b - ., %l[l_yes] - .\n\t"
> -                JUMP_ENTRY_TYPE "%c0 - .\n\t"
> -                ".popsection \n\t"
> +       asm goto(
> +                ARCH_STATIC_BRANCH_ASM("%c0", "%l[l_yes]")
>                   : :  "i" (&((char *)key)[branch]) : : l_yes);
> 
>          return false;
> @@ -34,10 +40,7 @@ static __always_inline bool arch_static_branch_jump(struct static_key *key, bool
>   {
>          asm goto("1:\n\t"
>                   "b %l[l_yes] # arch_static_branch_jump\n\t"
> -                ".pushsection __jump_table,  \"aw\"\n\t"
> -                ".long 1b - ., %l[l_yes] - .\n\t"
> -                JUMP_ENTRY_TYPE "%c0 - .\n\t"
> -                ".popsection \n\t"
> +                JUMP_TABLE_ENTRY("%c0", "%l[l_yes]")
>                   : :  "i" (&((char *)key)[branch]) : : l_yes);
> 
>          return false;
> diff --git a/rust/Makefile b/rust/Makefile
> index 5d357dce1704..7a6daa822cbc 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -390,6 +390,7 @@ BINDGEN_TARGET_x86  := x86_64-linux-gnu
>   BINDGEN_TARGET_arm64   := aarch64-linux-gnu
>   BINDGEN_TARGET_arm     := arm-linux-gnueabi
>   BINDGEN_TARGET_loongarch       := loongarch64-linux-gnusf
> +BINDGEN_TARGET_powerpc := powerpc64le-linux-gnu

This needs to depend on CONFIG_PPC64 and CONFIG_CPU_LITTLE_ENDIAN.


>   BINDGEN_TARGET_um      := $(BINDGEN_TARGET_$(SUBARCH))
>   BINDGEN_TARGET         := $(BINDGEN_TARGET_$(SRCARCH))
> 
> diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
> index 38b3416bb979..875579b37424 100644
> --- a/scripts/generate_rust_target.rs
> +++ b/scripts/generate_rust_target.rs
> @@ -256,6 +256,30 @@ fn main() {
>           }
>       } else if cfg.has("LOONGARCH") {
>           panic!("loongarch uses the builtin rustc loongarch64-unknown-none-softfloat target");
> +    } else if cfg.has("PPC64") {

Shouldn't this be done closer to PPC32 ?

> +        ts.push("arch", "powerpc64");
> +        ts.push(
> +            "data-layout",
> +            if cfg.has("CPU_LITTLE_ENDIAN") {
> +                "e-m:e-Fn32-i64:64-n32:64-S128-v256:256:256-v512:512:512"
> +            } else {
> +                "E-m:e-Fn32-i64:64-n32:64-S128-v256:256:256-v512:512:512"
> +            },
> +        );
> +        ts.push("features", "-mma,-altivec,-vsx,-hard-float");
> +        ts.push(
> +            "llvm-target",
> +            if cfg.has("CPU_LITTLE_ENDIAN") {
> +                "powerpc64le-linux-gnu"
> +            } else {
> +                "powerpc64-linux-gnu"
> +            },
> +        );
> +        if cfg.rustc_version_atleast(1, 91, 0) {
> +            ts.push("target-pointer-width", 64);
> +        } else {
> +            ts.push("target-pointer-width", "64");
> +        }
>       } else {
>           panic!("Unsupported architecture");
>       }
> --
> 2.52.0
> 

