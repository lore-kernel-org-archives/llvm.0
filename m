Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D7D399036
	for <llvm@lists.linux.dev>; Wed, 15 Jul 2026 14:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784127264; cv=none; b=pw21m7zUxwohOf+OWcGBLCBuR/XRj3YAFwj4tCF+Oxh731hbRk3YDFv1o1vcahJm4JhOAySzt+yWbFxeFVx6UJ9mho+SgAY6IIKP9bG93aKV1zuFOrT+fAKYuv+o0naV00empaL7waPIBR9E16Coo8SdWdi9QWwwk1/S6SMlSQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784127264; c=relaxed/simple;
	bh=6unCx+x2NPgOEvMqAsB5BwetJseNsn7+XOk6L5xpusA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UAEN4IvPy1m32yGWOZ1V8FI5yLUzQ11o5bHmnNBAdLJIm5m0Xxap/sZFYVGFzaf2vfDlLfyuhr33aBg2ckEyZFOGlSsG8XvdaNsqUWt+/rwyFmh5dH0VDavuFPMoN53ygQKJJ3qq19Bz1vutR+4telRo6mDq9WrFYU1KnxjvyRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VjLUDYmb; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VjLUDYmb"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47dec32798aso5758991f8f.1
        for <llvm@lists.linux.dev>; Wed, 15 Jul 2026 07:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784127258; x=1784732058; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L41MYl3HjuzLNuK2qp3MB7sFO80z4n0DLrf9pnL8oBE=;
        b=VjLUDYmbNq2oRB3f1huMnT7Mb8iodZbCnhtcDT0dsFfRhLg9RUgLk7KPW2AOzvemoj
         IWfYpxMSwawbc3t9KSWp2YujS+XoTduWd3vEazvK1+x916QCgz56BHIk4v7umIn4zsIu
         jc0vzrkH19tecnuUS0/CArxbAxmBNSk/6pnfJ4wlindIAvH4EPWvoLaNuLcFsjtL7yx5
         u+T2P8o0kCjJ9/buN8xo5WuEsEWmh/zjUC9ADYX0I6Mb01JHUntqkMh8WT4Tf3CxyIF8
         rpGLUrMZ2nHmFpNI9wHxOxXPQvGayGPWNkke8Y/Jxt86SR/CNqREnP3G/brPndh4rSA0
         LJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784127258; x=1784732058;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L41MYl3HjuzLNuK2qp3MB7sFO80z4n0DLrf9pnL8oBE=;
        b=i1PBElDsBWKjU9GhIMBRgwDNKpmIINSxVu/qprIlaIzVsMGQ7dzkmDcEQVBzqnPEZ7
         +QYtfbsh5jJ7GzWeJnMLqymOPOLKjT/B8vhnDh1Tzp/EHmy1kR8qbchgloXP6qv0Mra7
         Q/AmZwTH7Fj/CBgggfmTKtWHMYaEbiXfXiHm80tWhu/JVBgVZw7zn7vsxUQDmnsMMdWR
         wNKNFsMATZibb7MJz/DwtolTzC+8bBK17j7H+CW054e2mb+uqLZ6yY06Ur7SrZDnd9c2
         Obyis/jL7bixhmLL1ikBKR5Oml+N1JFZ9rvtGbKgmwV4Ocw8xgPUpConF3TWwxCc0YN8
         98YQ==
X-Forwarded-Encrypted: i=1; AHgh+RrMet+2V46FeBB/xITQuDeH1K0v5xTWCtuD4q92Hk8c1/S5t6+/99kYRAOuog14zBziRKqa@lists.linux.dev
X-Gm-Message-State: AOJu0YwyzLTRomNfhOVI7s0rPU5a7iXKJSxWgAL+1sI1kxkPcPKhwNi+
	HHHWAvN69cPupsVkOgdcKJQPAR7tkd0MrUyra+VeNUsdVxdisnivxErqaa0kYZO85/g=
X-Gm-Gg: AfdE7cm2Cl9EYEUjojxmNfRIkVOWT2uCpWjftsaSzxN8B5ZULwePLQ6HaTWj+TEX7q9
	zFD14OatUs3iIABzAqPcq1ZPHDB+AhbJ5UBv3206Ff6n1oyzLCmT6JCJjvBaQiuABLNxtXIGvWR
	maOKYUDy5zIUYYPWT88uBGEGDfRA7vqcJTzOBhsrgMqO0fZCXZk+g7tMYqFfzIek8Cmb0tdI+tr
	Z8aHDdH7zd/lxOO6tF/FHUuTlSlVciaEikJmIpXzIwHv+963Z62Gk3/SqKHVIja1n+kiXQBboRJ
	CP1/PSXGo8x326Zp8bqRBU3tGhDd+eqFoH4KFKoNiQ8dwLDE0nD1GU7Gx3wTyPgWBWVXFK6kuVX
	TpwAIk7cFFSDUQOftIjVkN3ffelVHrFcmRbjiVav3y4Qgei2izVicsydtCkAA2rkDOWigtkZZei
	vMZL1BgdHIJpzTXmkpegT0Nzra0XjKSU+Q
X-Received: by 2002:a05:600c:8487:b0:495:3a56:bd3 with SMTP id 5b1f17b1804b1-4953a560c74mr55833245e9.20.1784127257756;
        Wed, 15 Jul 2026 07:54:17 -0700 (PDT)
Received: from e133063.arm.com ([212.187.182.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49510c8e220sm137649275e9.15.2026.07.15.07.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:54:17 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Wed, 15 Jul 2026 15:53:48 +0100
Subject: [PATCH v4 1/4] tools/build: Allow versioning of all LLVM tools
 defined in Makefile.include
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-james-perf-llvm-version-v4-1-6dfdf984b435@linaro.org>
References: <20260715-james-perf-llvm-version-v4-0-6dfdf984b435@linaro.org>
In-Reply-To: <20260715-james-perf-llvm-version-v4-0-6dfdf984b435@linaro.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, bpf@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.2

The version of LLVM tools can be given on the build command with
LLVM=-15, but this isn't applied to all tools. For example $(CC) gets
versioned, but $(CLANG) doesn't. This causes a Perf build with LTO=1 to
fail with an error about mixed clang versions:

 ld.lld: error: libperf/core.o: Unknown attribute kind (86)
   (Producer: 'LLVM18.1.8' Reader: 'LLVM 15.0.7')

This file has two "ifneq ($(LLVM),)" blocks adjacent to each other, so
merge these blocks making it obvious that all tools should be versioned
consistently and there is nothing special about each block.

This also reveals that ?= and "allow-override" are used inconsistently
between the blocks. "allow-override" is technically only required for
builtin variables, but isn't only used on them, and doesn't do any harm
if used on a non-builtin. Make them all "allow-override" for
consistency. The only functional difference this will cause is if there
is a file level definition of one of the variables followed by an
"#include of Makefile.include" which will now overwrite. But this isn't
done and in a later commit some of the duplicate definitions will be
removed for good measure.

There are also some other LLVM tools that are not defined here and will
be moved in a later commit.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/scripts/Makefile.include | 37 ++++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.include
index 41971a68972dda218714d6b95b1d9d92349285c3..7022e78208a236604a681d45b1ff4f2128f412e5 100644
--- a/tools/scripts/Makefile.include
+++ b/tools/scripts/Makefile.include
@@ -61,10 +61,18 @@ $(error Invalid value for LLVM, see Documentation/kbuild/llvm.rst)
 endif
 
 $(call allow-override,CC,$(LLVM_PREFIX)clang$(LLVM_SUFFIX))
+$(call allow-override,CLANG,$(LLVM_PREFIX)clang$(LLVM_SUFFIX))
+$(call allow-override,HOSTCC,$(LLVM_PREFIX)clang$(LLVM_SUFFIX))
 $(call allow-override,AR,$(LLVM_PREFIX)llvm-ar$(LLVM_SUFFIX))
+$(call allow-override,HOSTAR,$(LLVM_PREFIX)llvm-ar$(LLVM_SUFFIX))
 $(call allow-override,LD,$(LLVM_PREFIX)ld.lld$(LLVM_SUFFIX))
+$(call allow-override,HOSTLD,$(LLVM_PREFIX)ld.lld$(LLVM_SUFFIX))
 $(call allow-override,CXX,$(LLVM_PREFIX)clang++$(LLVM_SUFFIX))
 $(call allow-override,STRIP,$(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX))
+$(call allow-override,LLVM_STRIP,$(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX))
+$(call allow-override,LLC,$(LLVM_PREFIX)llc$(LLVM_SUFFIX))
+$(call allow-override,LLVM_CONFIG,$(LLVM_PREFIX)llvm-config$(LLVM_SUFFIX))
+$(call allow-override,LLVM_OBJCOPY,$(LLVM_PREFIX)llvm-objcopy$(LLVM_SUFFIX))
 else
 # Allow setting various cross-compile vars or setting CROSS_COMPILE as a prefix.
 $(call allow-override,CC,$(CROSS_COMPILE)gcc)
@@ -72,26 +80,21 @@ $(call allow-override,AR,$(CROSS_COMPILE)ar)
 $(call allow-override,LD,$(CROSS_COMPILE)ld)
 $(call allow-override,CXX,$(CROSS_COMPILE)g++)
 $(call allow-override,STRIP,$(CROSS_COMPILE)strip)
-endif
-
-CC_NO_CLANG := $(shell $(CC) -dM -E -x c /dev/null | grep -Fq "__clang__"; echo $$?)
 
-ifneq ($(LLVM),)
-HOSTAR  ?= $(LLVM_PREFIX)llvm-ar$(LLVM_SUFFIX)
-HOSTCC  ?= $(LLVM_PREFIX)clang$(LLVM_SUFFIX)
-HOSTLD  ?= $(LLVM_PREFIX)ld.lld$(LLVM_SUFFIX)
-else
-HOSTAR  ?= ar
-HOSTCC  ?= gcc
-HOSTLD  ?= ld
+# Host versions aren't prefixed
+$(call allow-override,HOSTAR,ar)
+$(call allow-override,HOSTCC,gcc)
+$(call allow-override,HOSTLD,ld)
+
+# Some tools still require Clang, LLC and/or LLVM utils
+$(call allow-override,CLANG,clang)
+$(call allow-override,LLC,llc)
+$(call allow-override,LLVM_CONFIG,llvm-config)
+$(call allow-override,LLVM_OBJCOPY,llvm-objcopy)
+$(call allow-override,LLVM_STRIP,llvm-strip)
 endif
 
-# Some tools require Clang, LLC and/or LLVM utils
-CLANG		?= clang
-LLC		?= llc
-LLVM_CONFIG	?= llvm-config
-LLVM_OBJCOPY	?= llvm-objcopy
-LLVM_STRIP	?= llvm-strip
+CC_NO_CLANG := $(shell $(CC) -dM -E -x c /dev/null | grep -Fq "__clang__"; echo $$?)
 
 # Some tools require bpftool
 SYSTEM_BPFTOOL	?= bpftool

-- 
2.34.1

