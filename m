Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 133711A2555
	for <llvm@lists.linux.dev>; Thu,  4 Jul 2024 09:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720085498; cv=none; b=dNcvkd8jtwN6jAlyuXZTV/CyzOpRrLHV9pD28uhOmQ3ESDER5iBiuGQdQlWM466cxriS/gbXloFlq+q3tWD/cz7OvJOtf0NSgqDzTVP74tgOAOgGvMSEHEkx1QcDloh/Bmdx41RB5GTm5BRuQ6UuyVSVpwq71ucUTfNo2Ll2zO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720085498; c=relaxed/simple;
	bh=6JvIoGeJYxTilGdyGLvutd4vO5hzpifvREfdh9Tlzy4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gc9J/+pUWgEGVRRMp8wsCPKwn7yRC4m7x9qnLOPrlZw9IHvwz38VgTpCVHSOQhZ2mMK97JIoV08VvSXHTtSbf+TOvp/0+nvhkGdRovl8BkNfQIzO+806mEw4DwkKX0D5d9QeUW/lQnvjec1S7+VT1MIB1oYfE4+OmtLkAs4nxCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74E3ADA7;
	Thu,  4 Jul 2024 02:32:00 -0700 (PDT)
Received: from [10.1.29.168] (XHFQ2J9959.cambridge.arm.com [10.1.29.168])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2FF323F766;
	Thu,  4 Jul 2024 02:31:34 -0700 (PDT)
Message-ID: <92b7375f-7239-4fbd-bedd-b3b8d55bf7a1@arm.com>
Date: Thu, 4 Jul 2024 10:31:32 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] selftests: introduce and use SELFTESTS_CC_IS_CLANG
 instead of LLVM
Content-Language: en-GB
To: John Hubbard <jhubbard@nvidia.com>, Shuah Khan <shuah@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Muhammad Usama Anjum <usama.anjum@collabora.com>,
 linux-kselftest@vger.kernel.org, llvm@lists.linux.dev,
 LKML <linux-kernel@vger.kernel.org>
References: <20240704030452.88793-1-jhubbard@nvidia.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20240704030452.88793-1-jhubbard@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/07/2024 04:04, John Hubbard wrote:
> Current practice in the selftests Makefiles is to use $(LLVM) as a way
> to decide if clang is being used as the compiler (and/or the linker
> front end). Unfortunately, this does not cover all of the use cases:
> 
> 1) CC could have been set within selftests/lib.mk, by inferring it from
> LLVM==1, or
> 
> 2) CC could have been set externally, such as when cross compiling.
> 
> Solution: In order to allow subsystem selftests to more accurately
> control clang-specific behavior, such as compiler options, provide a new
> Makefile variable: SELFTESTS_CC_IS_CLANG. If $(CC) contains an
> invocation of clang in any form, then SELFTESTS_CC_IS_CLANG will be
> non-empty.
> 
> SELFTESTS_CC_IS_CLANG does not specify which linker is being used.
> However, it can still help with linker options, because $(CC) is often
> used to do both the compile and link steps (often in the same step).
> 
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
> 
> Hi,
> 
> If this looks reasonable, I'll break it up into separate patches and
> post it as a non-RFC.

I'm makefile-illiterate so not really qualified to review. But the concept
certainly looks fine to me.

Thanks,
Ryan

> 
> thanks,
> John Hubbard
> 
>  tools/testing/selftests/bpf/Makefile       |  2 +-
>  tools/testing/selftests/fchmodat2/Makefile | 12 +++++++-----
>  tools/testing/selftests/hid/Makefile       |  2 +-
>  tools/testing/selftests/lib.mk             | 15 +++++++++++++++
>  tools/testing/selftests/openat2/Makefile   | 16 +++++++++-------
>  5 files changed, 33 insertions(+), 14 deletions(-)
> 
> diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
> index dd49c1d23a60..6b924297ab71 100644
> --- a/tools/testing/selftests/bpf/Makefile
> +++ b/tools/testing/selftests/bpf/Makefile
> @@ -55,7 +55,7 @@ progs/test_sk_lookup.c-CFLAGS := -fno-strict-aliasing
>  progs/timer_crash.c-CFLAGS := -fno-strict-aliasing
>  progs/test_global_func9.c-CFLAGS := -fno-strict-aliasing
>  
> -ifneq ($(LLVM),)
> +ifeq ($(SELFTESTS_CC_IS_CLANG),)
>  # Silence some warnings when compiled with clang
>  CFLAGS += -Wno-unused-command-line-argument
>  endif
> diff --git a/tools/testing/selftests/fchmodat2/Makefile b/tools/testing/selftests/fchmodat2/Makefile
> index 4373cea79b79..d00b01be5d96 100644
> --- a/tools/testing/selftests/fchmodat2/Makefile
> +++ b/tools/testing/selftests/fchmodat2/Makefile
> @@ -2,14 +2,16 @@
>  
>  CFLAGS += -Wall -O2 -g -fsanitize=address -fsanitize=undefined $(KHDR_INCLUDES)
>  
> +TEST_GEN_PROGS := fchmodat2_test
> +
> +include ../lib.mk
> +
>  # gcc requires -static-libasan in order to ensure that Address Sanitizer's
>  # library is the first one loaded. However, clang already statically links the
>  # Address Sanitizer if -fsanitize is specified. Therefore, simply omit
>  # -static-libasan for clang builds.
> -ifeq ($(LLVM),)
> +# This check must be done after including ../lib.mk, in order to pick up the
> +# correct value of SELFTESTS_CC_IS_CLANG.
> +ifeq ($(SELFTESTS_CC_IS_CLANG),)
>      CFLAGS += -static-libasan
>  endif
> -
> -TEST_GEN_PROGS := fchmodat2_test
> -
> -include ../lib.mk
> diff --git a/tools/testing/selftests/hid/Makefile b/tools/testing/selftests/hid/Makefile
> index 2b5ea18bde38..734a53dc8ad9 100644
> --- a/tools/testing/selftests/hid/Makefile
> +++ b/tools/testing/selftests/hid/Makefile
> @@ -27,7 +27,7 @@ CFLAGS += -I$(OUTPUT)/tools/include
>  LDLIBS += -lelf -lz -lrt -lpthread
>  
>  # Silence some warnings when compiled with clang
> -ifneq ($(LLVM),)
> +ifeq ($(SELFTESTS_CC_IS_CLANG),)
>  CFLAGS += -Wno-unused-command-line-argument
>  endif
>  
> diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
> index 429535816dbd..f321ad5a1d0c 100644
> --- a/tools/testing/selftests/lib.mk
> +++ b/tools/testing/selftests/lib.mk
> @@ -43,6 +43,21 @@ else
>  CC := $(CROSS_COMPILE)gcc
>  endif # LLVM
>  
> +# SELFTESTS_CC_IS_CLANG allows subsystem selftests to more accurately control
> +# clang-specific behavior, such as compiler options. If CC is an invocation of
> +# clang in any form, then SELFTESTS_CC_IS_CLANG will be non-empty. Notes:
> +#
> +# 1) CC could have been set above, by inferring it from LLVM==1, or externally,
> +# from the CC shell environment variable.
> +#
> +# 2) SELFTESTS_CC_IS_CLANG does not specify which linker is being used. However,
> +#    it can still help with linker options, if clang or gcc is used for the
> +#    linker front end.
> +SELFTESTS_CC_IS_CLANG :=
> +ifeq ($(findstring clang,$(CC)),clang)
> +    SELFTESTS_CC_IS_CLANG := 1
> +endif
> +
>  ifeq (0,$(MAKELEVEL))
>      ifeq ($(OUTPUT),)
>  	OUTPUT := $(shell pwd)
> diff --git a/tools/testing/selftests/openat2/Makefile b/tools/testing/selftests/openat2/Makefile
> index 185dc76ebb5f..7acb85a8f2ac 100644
> --- a/tools/testing/selftests/openat2/Makefile
> +++ b/tools/testing/selftests/openat2/Makefile
> @@ -3,16 +3,18 @@
>  CFLAGS += -Wall -O2 -g -fsanitize=address -fsanitize=undefined
>  TEST_GEN_PROGS := openat2_test resolve_test rename_attack_test
>  
> +LOCAL_HDRS += helpers.h
> +
> +include ../lib.mk
> +
> +$(TEST_GEN_PROGS): helpers.c
> +
>  # gcc requires -static-libasan in order to ensure that Address Sanitizer's
>  # library is the first one loaded. However, clang already statically links the
>  # Address Sanitizer if -fsanitize is specified. Therefore, simply omit
>  # -static-libasan for clang builds.
> -ifeq ($(LLVM),)
> +# This check must be done after including ../lib.mk, in order to pick up the
> +# correct value of SELFTESTS_CC_IS_CLANG.
> +ifeq ($(SELFTESTS_CC_IS_CLANG),)
>      CFLAGS += -static-libasan
>  endif
> -
> -LOCAL_HDRS += helpers.h
> -
> -include ../lib.mk
> -
> -$(TEST_GEN_PROGS): helpers.c
> 
> base-commit: 9a5cd459be8a425d70cda1fa1c89af7875a35d17

