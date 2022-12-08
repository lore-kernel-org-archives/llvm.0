Received: from condef-10.nifty.com (condef-10.nifty.com [202.248.20.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62656621
	for <llvm@lists.linux.dev>; Thu,  8 Dec 2022 01:49:20 +0000 (UTC)
Received: from conssluserg-01.nifty.com ([10.126.8.80])by condef-10.nifty.com with ESMTP id 2B81hZAD017173
	for <llvm@lists.linux.dev>; Thu, 8 Dec 2022 10:43:35 +0900
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44]) (authenticated)
	by conssluserg-01.nifty.com with ESMTP id 2B81hOI7017420
	for <llvm@lists.linux.dev>; Thu, 8 Dec 2022 10:43:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 2B81hOI7017420
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1670463805;
	bh=k3I8on4gq36IvbTZWeLET12jxubwa9OOg1ZKsIOl2ss=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mtOo8T0cq1jDd6kIRWnpp0UdEGEL2YahHo5hb57KLXkHKlw8MIhG/J1CiPCd6uPFd
	 KKpT1X4bdoAnRLZXhc9q8WChe3TyVckcHUCuiN/uu+KE4MPcRKvWhMrzjkaYjf+6s8
	 IWkC8+NobGSN3dDvY4HESmxF7kgvUZJRCtoKi0bzL35t6jeGAn3CTMqAV14BCNeiFX
	 JNGvjTlqlXbxWxIGWZS7Hh9kGRDaKqmhczCH/0m0lPLHW/ugIrYX0aQV/k6EkxJtwA
	 FI03uKGiOTh7uoplKlf7YGo8xaMqTiCt06gFAxnztMsh5U5dF7v3xWrHV2JPTW6jvw
	 ol6jaKsi8Yu7w==
X-Nifty-SrcIP: [209.85.210.44]
Received: by mail-ot1-f44.google.com with SMTP id db10-20020a0568306b0a00b0066d43e80118so90097otb.1
        for <llvm@lists.linux.dev>; Wed, 07 Dec 2022 17:43:25 -0800 (PST)
X-Gm-Message-State: ANoB5pldsNY0cPaF0kRoNIQIM6i8lBaxqKQ5CEIIgPf8Kjm5N8oH4q0F
	Lvm62ETO0RffuP+n7yf/+V5FwfSXyATHpH+uQKA=
X-Google-Smtp-Source: AA0mqf5rlckUeBOxtlV5cmoxR9u+G4SHU30UtcO5gXpDSCqFhD98tHV3D02NMhFgMRT7jBugEMm4fqq68XFQrqTt1ME=
X-Received: by 2002:a9d:282:0:b0:66c:794e:f8c6 with SMTP id
 2-20020a9d0282000000b0066c794ef8c6mr47413478otl.343.1670463804040; Wed, 07
 Dec 2022 17:43:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221123151828.509565-1-masahiroy@kernel.org>
In-Reply-To: <20221123151828.509565-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 8 Dec 2022 10:42:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNATBBHJR_46HUvZ61zTgt_U4t3BmwTTyHwKjgz8JkFquYg@mail.gmail.com>
Message-ID: <CAK7LNATBBHJR_46HUvZ61zTgt_U4t3BmwTTyHwKjgz8JkFquYg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] kbuild: add test-{le,ge,lt,gt} macros
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Thomas Gleixner <tglx@linutronix.de>, Tom Rix <trix@redhat.com>,
        linux-riscv@lists.infradead.org, llvm@lists.linux.dev, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 24, 2022 at 12:19 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Because GNU Make is only able to handle strings, it is very hard to
> perform arighmetic in Makefiles.





I terribly missed that GNU Make 4.4
introduced the $(intcmp ...) function.

https://www.gnu.org/software/make/manual/make.html#Conditional-Functions


I am thinking if we can do better by using it.















>
> When we compare two integers, we invokes shell. One example is in the
> top Makefile:
>
>   ifeq ($(shell test $(CONFIG_LLD_VERSION) -lt 130000; echo $$?),0)
>
> This is more expensive than using built-in functions since it forks a
> process.
>
> If we know the two have the same number of digits, we can do better.
>
> This commit adds four macros, test-le, test-ge, test-lt, test-gt.
>
> $(call test-lt, A, B) is evaluated to 'y' if A is less than B, or
> empty otherwise. This will replace $(call shell test A -lt B).
>
> Again, the limitation is that A and B must have the same number of
> digits because these macros are based on $(sort ) function.
>
>   $(call test-lt, 1, 9)    -->  y        (Works!)
>   $(call test-lt, 10, 9)   -->  y        (Not work...)
>
> To make the latter work, you need to add '0' prefix to align the number
> of digits:
>
>   $(call test-lt, 10, 09)  -->  empty    (Works!)
>
> Actually, we can live with this limitation in many places. As for the
> example above, we know $(CONFIG_LLD_VERSION) is 6-digits because the
> minimal supported version of LLVM is 11.0.0.
>
> So, the shell invocation can be replaced with more efficient code:
>
>   ifeq ($(call test-lt, $(CONFIG_LLD_VERSION), 130000),y)
>
> Of course, this assumption will break when LLVM 100 is released, but it
> will be far in the future.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> (no changes since v1)
>
>  Makefile               |  2 +-
>  arch/riscv/Makefile    |  2 +-
>  arch/x86/Makefile      |  2 +-
>  scripts/Kbuild.include | 10 ++++++++++
>  4 files changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 6f846b1f2618..eb80332f7b51 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -986,7 +986,7 @@ KBUILD_LDFLAGS += -mllvm -import-instr-limit=5
>  # Check for frame size exceeding threshold during prolog/epilog insertion
>  # when using lld < 13.0.0.
>  ifneq ($(CONFIG_FRAME_WARN),0)
> -ifeq ($(shell test $(CONFIG_LLD_VERSION) -lt 130000; echo $$?),0)
> +ifeq ($(call test-lt, $(CONFIG_LLD_VERSION), 130000),y)
>  KBUILD_LDFLAGS += -plugin-opt=-warn-stack-size=$(CONFIG_FRAME_WARN)
>  endif
>  endif
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 0d13b597cb55..faf2c2177094 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -37,7 +37,7 @@ else
>  endif
>
>  ifeq ($(CONFIG_LD_IS_LLD),y)
> -ifeq ($(shell test $(CONFIG_LLD_VERSION) -lt 150000; echo $$?),0)
> +ifeq ($(call test-lt, $(CONFIG_LLD_VERSION), 150000),y)
>         KBUILD_CFLAGS += -mno-relax
>         KBUILD_AFLAGS += -mno-relax
>  ifndef CONFIG_AS_IS_LLVM
> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> index 415a5d138de4..e72c7a49cd59 100644
> --- a/arch/x86/Makefile
> +++ b/arch/x86/Makefile
> @@ -211,7 +211,7 @@ endif
>  KBUILD_LDFLAGS += -m elf_$(UTS_MACHINE)
>
>  ifdef CONFIG_LTO_CLANG
> -ifeq ($(shell test $(CONFIG_LLD_VERSION) -lt 130000; echo $$?),0)
> +ifeq ($(call test-lt, $(CONFIG_LLD_VERSION), 130000),y)
>  KBUILD_LDFLAGS += -plugin-opt=-stack-alignment=$(if $(CONFIG_X86_32),4,8)
>  endif
>  endif
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index cbe28744637b..9996f34327cb 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -11,6 +11,16 @@ space   := $(empty) $(empty)
>  space_escape := _-_SPACE_-_
>  pound := \#
>
> +###
> +# Comparison macros.
> +# Usage: $(call test-le, A, B)
> +# works like shell's "test A -le B", but A and B must have the same number of
> +# digits since it is just ASCII sort.
> +test-le = $(if $(filter $1, $(firstword $(sort $1 $2))),y)
> +test-ge = $(call test-le, $2, $1)
> +test-lt = $(if $(filter-out $2, $(firstword $(sort $1 $2))),y)
> +test-gt = $(call test-lt, $2, $1)
> +
>  ###
>  # Name of target with a '.' as filename prefix. foo/bar.o => foo/.bar.o
>  dot-target = $(dir $@).$(notdir $@)
> --
> 2.34.1
>


-- 
Best Regards
Masahiro Yamada
