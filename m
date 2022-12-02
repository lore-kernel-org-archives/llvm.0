Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2EA4C9E
	for <llvm@lists.linux.dev>; Fri,  2 Dec 2022 17:56:55 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id q71so4960471pgq.8
        for <llvm@lists.linux.dev>; Fri, 02 Dec 2022 09:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fScTfgURmwWT7H6zKPrxCgIY6rjNdptOvR99AIwlkJg=;
        b=qb6MUvwgM++qnYXsfWIMcG9mXhaGG+7+W1fGbdBit0a6xA/KVfOeb0AjU4ykvOVMiE
         F/4LeYBBOxx7tr90Hg3fFY+tVhWWKzQfFcgnR9USKBMhG6/HeAwJYgGBzpFscpdhRoxy
         eLI7faRS9qoVUi6eRfdJ9Ip/4/x6Gb9giuxyuyAapHWfIQAsfoAoikO/quYMHq94fzgj
         HFY+5Il1GRVaAUWc+k+Ev8DXlXAXTOS0xSgGiq7k1yhVeYkNct8C6uOB97oG1XKnL8dQ
         U9D3yFpqWxlmwu332bMtPAFiStjDXK/9KHKn7pC5k5PQdlXGZiYHAOAWTMX+D+VBJy4D
         MOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fScTfgURmwWT7H6zKPrxCgIY6rjNdptOvR99AIwlkJg=;
        b=AbiDVNHzIBbQTJo07U860NEoaSKXwXUwXv9uHH4KyHtEVyI7btUyF3WXJP4tsnWJaI
         ma5O6jlthdOPH7YzRZ5mFTXrNm47rhF/0LPChRzppxcrWGr9xJA82T0uRugOhgb3w2qb
         +SA46XfQ6DxDpvhuXkm4elwL1MnJJkL3YXs4JFEkZBwLdvu+IyoI6A4cPy13tr5aADWQ
         JSuTGtHtyBloa4I1UV28wUDS8CbADPtPOBfX4NbqhmDQI3C6z6BizmeJCYKn3jef2bpY
         YES9U+bxJbrd+QnwFz3Qgj7/SxcmomirpXnK5cRpjYTcTKs3lrI4mYE2SdQ/KK0XnVq1
         2itg==
X-Gm-Message-State: ANoB5pm0QwmdlvR10+KAqHq5jTISSzJ5DKMYOxSmajo/x6sZHy8BhxzS
	kipeuE99R3LME8APcDcoBaknoQ==
X-Google-Smtp-Source: AA0mqf7BpcQXuIBwLb9SatLFLu0m0DKBXhr2dsQifXx6G9te8219mc7G41HgJyuAzCPt6gBvjrti9A==
X-Received: by 2002:a63:d356:0:b0:477:1a2:390e with SMTP id u22-20020a63d356000000b0047701a2390emr64563485pgi.83.1670003814551;
        Fri, 02 Dec 2022 09:56:54 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id mt12-20020a17090b230c00b002135e8074b1sm6920965pjb.55.2022.12.02.09.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 09:56:54 -0800 (PST)
Date: Fri, 02 Dec 2022 09:56:54 -0800 (PST)
X-Google-Original-Date: Fri, 02 Dec 2022 09:56:41 PST (-0800)
Subject:     Re: [PATCH v2 1/5] kbuild: add test-{le,ge,lt,gt} macros
In-Reply-To: <20221123151828.509565-1-masahiroy@kernel.org>
CC: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, masahiroy@kernel.org,
  aou@eecs.berkeley.edu, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, mingo@redhat.com,
  nathan@kernel.org, ndesaulniers@google.com, nicolas@fjasle.eu,
  Paul Walmsley <paul.walmsley@sifive.com>, tglx@linutronix.de, trix@redhat.com, linux-riscv@lists.infradead.org,
  llvm@lists.linux.dev, x86@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: masahiroy@kernel.org
Message-ID: <mhng-0ed46e51-0907-46b5-9dc8-90a3fd3762c6@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Wed, 23 Nov 2022 07:18:24 PST (-0800), masahiroy@kernel.org wrote:
> Because GNU Make is only able to handle strings, it is very hard to
> perform arighmetic in Makefiles.
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
>  KBUILD_LDFLAGS	+= -plugin-opt=-warn-stack-size=$(CONFIG_FRAME_WARN)
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
>  	KBUILD_CFLAGS += -mno-relax
>  	KBUILD_AFLAGS += -mno-relax
>  ifndef CONFIG_AS_IS_LLVM

Acked-by: Palmer Dabbelt <palmer@rivosinc.com> # RISC-V

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
>  KBUILD_LDFLAGS	+= -plugin-opt=-stack-alignment=$(if $(CONFIG_X86_32),4,8)
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
