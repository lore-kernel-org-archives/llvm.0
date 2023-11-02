Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB64A11C91
	for <llvm@lists.linux.dev>; Thu,  2 Nov 2023 09:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TRj3KB0c"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-53d9f001b35so1090920a12.2
        for <llvm@lists.linux.dev>; Thu, 02 Nov 2023 02:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698917401; x=1699522201; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v7/woVjmU2RBJPq+smg6r80XOve4WhdwHN8IQS4+gXE=;
        b=TRj3KB0cqonasDYSAxjECNdfMnh2xkC6bQUIVWZrZiwl/6AK4JxkqgUI5m+JYu4913
         OT2uvMa6ktLlI75jhN2vr+BpqiSEykO8fBflEoAK5rFyvM5Js0PwsRioWDLyN2CGapPl
         TSGzohJjAiVYsB/4pVbcHZYYrlPt7OgFu7fxP63O9c/oziRFU/qc+DJcfCUuE5l+W/Yq
         Xh97mbzu2qKwZaWVPCttnrlVR45OgLFD/xfYGYKi8YefNVhFk6cp8RzN3x+2PUZNQg2U
         mK2d8KJII1pMByt2gB6/QHZ6R1Ktc6Y8WcqlOYZFZ8g1DXRz3KW58E6aN7G959iE+h0d
         9GMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698917401; x=1699522201;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v7/woVjmU2RBJPq+smg6r80XOve4WhdwHN8IQS4+gXE=;
        b=G7duBRtSJU1mVTKVGiZX9e80yskmLIQiim3hAvyhAL4NzE4X3oOwdU6plp2qSTUzTV
         Dx6hO2XYrWZhT47sagojIRZ7g9zIaZhsXFxwHUxGVJR+P55wm7Xvxz2YHv0neukaWiA5
         kUMnnCAw2cAsSHfV4sOo9mlE3PD+Kb/CspAPljkBdKdT80+7W3g+jlDNXjPuoQaBSJOc
         /0eHljU72HSFFBtpCSNUVYZeWzO/bIBzYWG32W4pKWiLfUy6/VHdOVNg+d1JMfhQRvzb
         hcFvorlN2Ma92raU5oSdZr1YRznZRHd8sM0B4Sm1dt3NVpZm7olNQRTMHT4r6Z0amoyh
         OBAQ==
X-Gm-Message-State: AOJu0YycLGDp1gwkcLi4v8j6KbNLZ4kug2m38sE8leecnmVfhkEdbj7s
	FL4J4OnsFElWocn/o5rLTAc=
X-Google-Smtp-Source: AGHT+IHzxzXJreH8ARsObOVNO0E1iGFYPjKZEsSuxYNAATjQOicsHRAcm7e/QPrQfY6dlnivz/aKgQ==
X-Received: by 2002:a17:906:fd89:b0:9ce:24d0:8a01 with SMTP id xa9-20020a170906fd8900b009ce24d08a01mr4280263ejb.60.1698917400807;
        Thu, 02 Nov 2023 02:30:00 -0700 (PDT)
Received: from krava (2001-1ae9-1c2-4c00-726e-c10f-8833-ff22.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:726e:c10f:8833:ff22])
        by smtp.gmail.com with ESMTPSA id qh13-20020a170906ecad00b009b29553b648sm888874ejb.206.2023.11.02.02.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 02:30:00 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 2 Nov 2023 10:29:58 +0100
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, bpf@vger.kernel.org,
	Anders Roxell <anders.roxell@linaro.org>, llvm@lists.linux.dev
Subject: Re: [PATCH] tools/build: Add clang cross-compilation flags to
 feature detection
Message-ID: <ZUNsFkZWxws6c5Vx@krava>
References: <20231102081441.240280-1-bjorn@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231102081441.240280-1-bjorn@kernel.org>

On Thu, Nov 02, 2023 at 09:14:41AM +0100, Björn Töpel wrote:
> From: Björn Töpel <bjorn@rivosinc.com>
> 
> When a tool cross-build has LLVM=1 set, the clang cross-compilation
> flags are not passed to the feature detection build system. This
> results in the host's features are detected instead of the targets.
> 
> E.g, triggering a cross-build of bpftool:
> 
>   cd tools/bpf/bpftool
>   make ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- LLVM=1
> 
> would report the host's, and not the target's features.
> 
> Correct the issue by passing the CLANG_CROSS_FLAGS variable to the
> feature detection makefile.
> 
> Fixes: cebdb7374577 ("tools: Help cross-building with clang")
> Signed-off-by: Björn Töpel <bjorn@rivosinc.com>
> ---
>  tools/build/Makefile.feature | 2 +-
>  tools/build/feature/Makefile | 8 ++++----
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/build/Makefile.feature b/tools/build/Makefile.feature
> index 934e2777a2db..25b009a6c05f 100644
> --- a/tools/build/Makefile.feature
> +++ b/tools/build/Makefile.feature
> @@ -8,7 +8,7 @@ endif
>  
>  feature_check = $(eval $(feature_check_code))
>  define feature_check_code
> -  feature-$(1) := $(shell $(MAKE) OUTPUT=$(OUTPUT_FEATURES) CC="$(CC)" CXX="$(CXX)" CFLAGS="$(EXTRA_CFLAGS) $(FEATURE_CHECK_CFLAGS-$(1))" CXXFLAGS="$(EXTRA_CXXFLAGS) $(FEATURE_CHECK_CXXFLAGS-$(1))" LDFLAGS="$(LDFLAGS) $(FEATURE_CHECK_LDFLAGS-$(1))" -C $(feature_dir) $(OUTPUT_FEATURES)test-$1.bin >/dev/null 2>/dev/null && echo 1 || echo 0)
> +  feature-$(1) := $(shell $(MAKE) OUTPUT=$(OUTPUT_FEATURES) CC="$(CC)" CXX="$(CXX)" CFLAGS="$(EXTRA_CFLAGS) $(FEATURE_CHECK_CFLAGS-$(1))" CXXFLAGS="$(EXTRA_CXXFLAGS) $(FEATURE_CHECK_CXXFLAGS-$(1))" LDFLAGS="$(LDFLAGS) $(FEATURE_CHECK_LDFLAGS-$(1))" CLANG_CROSS_FLAGS="$(CLANG_CROSS_FLAGS)" -C $(feature_dir) $(OUTPUT_FEATURES)test-$1.bin >/dev/null 2>/dev/null && echo 1 || echo 0)
>  endef
>  
>  feature_set = $(eval $(feature_set_code))
> diff --git a/tools/build/feature/Makefile b/tools/build/feature/Makefile
> index dad79ede4e0a..0231a53024c7 100644
> --- a/tools/build/feature/Makefile
> +++ b/tools/build/feature/Makefile
> @@ -84,12 +84,12 @@ PKG_CONFIG ?= $(CROSS_COMPILE)pkg-config
>  
>  all: $(FILES)
>  
> -__BUILD = $(CC) $(CFLAGS) -MD -Wall -Werror -o $@ $(patsubst %.bin,%.c,$(@F)) $(LDFLAGS)
> +__BUILD = $(CC) $(CFLAGS) $(CLANG_CROSS_FLAGS) -MD -Wall -Werror -o $@ $(patsubst %.bin,%.c,$(@F)) $(LDFLAGS)
>    BUILD = $(__BUILD) > $(@:.bin=.make.output) 2>&1
>    BUILD_BFD = $(BUILD) -DPACKAGE='"perf"' -lbfd -ldl
>    BUILD_ALL = $(BUILD) -fstack-protector-all -O2 -D_FORTIFY_SOURCE=2 -ldw -lelf -lnuma -lelf -lslang $(FLAGS_PERL_EMBED) $(FLAGS_PYTHON_EMBED) -DPACKAGE='"perf"' -lbfd -ldl -lz -llzma -lzstd -lcap
>  
> -__BUILDXX = $(CXX) $(CXXFLAGS) -MD -Wall -Werror -o $@ $(patsubst %.bin,%.cpp,$(@F)) $(LDFLAGS)
> +__BUILDXX = $(CXX) $(CXXFLAGS) $(CLANG_CROSS_FLAGS) -MD -Wall -Werror -o $@ $(patsubst %.bin,%.cpp,$(@F)) $(LDFLAGS)
>    BUILDXX = $(__BUILDXX) > $(@:.bin=.make.output) 2>&1
>  
>  ###############################
> @@ -259,10 +259,10 @@ $(OUTPUT)test-reallocarray.bin:
>  	$(BUILD)
>  
>  $(OUTPUT)test-libbfd-liberty.bin:
> -	$(CC) $(CFLAGS) -Wall -Werror -o $@ test-libbfd.c -DPACKAGE='"perf"' $(LDFLAGS) -lbfd -ldl -liberty
> +	$(CC) $(CFLAGS) $(CLANG_CROSS_FLAGS) -Wall -Werror -o $@ test-libbfd.c -DPACKAGE='"perf"' $(LDFLAGS) -lbfd -ldl -liberty
>  
>  $(OUTPUT)test-libbfd-liberty-z.bin:
> -	$(CC) $(CFLAGS) -Wall -Werror -o $@ test-libbfd.c -DPACKAGE='"perf"' $(LDFLAGS) -lbfd -ldl -liberty -lz
> +	$(CC) $(CFLAGS) $(CLANG_CROSS_FLAGS) -Wall -Werror -o $@ test-libbfd.c -DPACKAGE='"perf"' $(LDFLAGS) -lbfd -ldl -liberty -lz

should we add this also to test-compile-32.bin/test-compile-x32.bin
targets?

jirka

>  
>  $(OUTPUT)test-cplus-demangle.bin:
>  	$(BUILD) -liberty
> 
> base-commit: 21e80f3841c01aeaf32d7aee7bbc87b3db1aa0c6
> -- 
> 2.40.1
> 
> 
