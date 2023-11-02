Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C7F18E17
	for <llvm@lists.linux.dev>; Thu,  2 Nov 2023 12:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ENsA1eyN"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40839807e82so5594695e9.0
        for <llvm@lists.linux.dev>; Thu, 02 Nov 2023 05:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698928244; x=1699533044; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8ZqG4eXApU2XHK/8xC8VON8f1IHU1prc7SAhVA2sCKE=;
        b=ENsA1eyNMAye7LPW2SA0ty3CdSJhWp3F/vFteH+SDFFdyINFawQsfpl6OYN2aAqIOQ
         c+dCX1e8z5BjdlKXs45LTpGS889yFtZae1IcuOIoBqUmLci/A56VTWuufmzEMcvdwVC+
         ReEtvb1J+QlxZ6O+W0N8RFH3zF+9uOTF3oXG00Ard7p7/MtmjP2ltg2mGFHsBCYc477s
         zrlFMQFYppZs2XIUCOqD583ol0DwWeClm2oo27UVA8gbFWE/x8XDJCNA9UddfWjNSKHI
         YMafQLVq7sUx8rE/+/QXLC7p6BMcoc7wMDa5y89++jOHrIKcNl2Wz3PXGzkK14H9I+Nj
         qUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698928244; x=1699533044;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8ZqG4eXApU2XHK/8xC8VON8f1IHU1prc7SAhVA2sCKE=;
        b=EyhiurQbFOo6GGHX3/udjwv9QXdq0/tw1FeUXA9iil7ZkeV465zz3Ih39cjatBgkHw
         Vo76yv4ob54odmIU4VCJ6EYTRyNER2leiBZByFwljjOhi4JxAj6fseI/cfijUy2uW7Q3
         wiOLBAusa0LTlC83Gf445FBBq/P0xOnzImxSPeeww3MErziJgNe9cqqtID86gwH18fv1
         Gjl5f2eLCZ21Xt6YT7Y+F9E4YkYLU0c+B81JsE2d6CXdLfEHH8deGV6WQA/SShFlQ5cc
         yCQnsaKBvi+wUlihl8+bqDqrflFyPiYldj90DsH0cC6RHBxEWStElhNFoHb2Yo8N4to6
         b6gA==
X-Gm-Message-State: AOJu0Yxb3veiKKox1NNldPEmFz/CihV2JjhaEAz7AfFjW84RR5zwnzyx
	KKUdnvDkRu2eOAz/bMWSh4Q=
X-Google-Smtp-Source: AGHT+IF1JMuTcXHQV9/CxVeYbs66Idurde2ayMH9TFHtm2fwrzB74rfAHR3+dnuRM7ZrKFmvRxuQ3w==
X-Received: by 2002:a05:600c:2214:b0:408:33ba:569a with SMTP id z20-20020a05600c221400b0040833ba569amr6627963wml.8.1698928243923;
        Thu, 02 Nov 2023 05:30:43 -0700 (PDT)
Received: from krava (2001-1ae9-1c2-4c00-726e-c10f-8833-ff22.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:726e:c10f:8833:ff22])
        by smtp.gmail.com with ESMTPSA id fm15-20020a05600c0c0f00b003fee6e170f9sm2768435wmb.45.2023.11.02.05.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 05:30:43 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 2 Nov 2023 13:30:41 +0100
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, bpf@vger.kernel.org,
	Anders Roxell <anders.roxell@linaro.org>, llvm@lists.linux.dev,
	Jiri Olsa <olsajiri@gmail.com>
Subject: Re: [PATCH v2] tools/build: Add clang cross-compilation flags to
 feature detection
Message-ID: <ZUOWcXDpCOzxbFW0@krava>
References: <20231102103252.247147-1-bjorn@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231102103252.247147-1-bjorn@kernel.org>

On Thu, Nov 02, 2023 at 11:32:52AM +0100, Björn Töpel wrote:
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

Acked-by: Jiri Olsa <jolsa@kernel.org>

jirka

> ---
>  tools/build/Makefile.feature |  2 +-
>  tools/build/feature/Makefile | 12 ++++++------
>  2 files changed, 7 insertions(+), 7 deletions(-)
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
> index dad79ede4e0a..c4458345e564 100644
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
>  
>  $(OUTPUT)test-cplus-demangle.bin:
>  	$(BUILD) -liberty
> @@ -283,10 +283,10 @@ $(OUTPUT)test-libbabeltrace.bin:
>  	$(BUILD) # -lbabeltrace provided by $(FEATURE_CHECK_LDFLAGS-libbabeltrace)
>  
>  $(OUTPUT)test-compile-32.bin:
> -	$(CC) -m32 -o $@ test-compile.c
> +	$(CC) $(CLANG_CROSS_FLAGS) -m32 -o $@ test-compile.c
>  
>  $(OUTPUT)test-compile-x32.bin:
> -	$(CC) -mx32 -o $@ test-compile.c
> +	$(CC) $(CLANG_CROSS_FLAGS) -mx32 -o $@ test-compile.c
>  
>  $(OUTPUT)test-zlib.bin:
>  	$(BUILD) -lz
> 
> base-commit: 21e80f3841c01aeaf32d7aee7bbc87b3db1aa0c6
> -- 
> 2.40.1
> 
