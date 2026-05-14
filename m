Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9863A783B
	for <llvm@lists.linux.dev>; Thu, 14 May 2026 09:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778751165; cv=none; b=XBbicWsKplh9nqkfpDa6Wfg/4Kaj80l0NrdtHZuge+LEF2+xVYAq192f9+o7xPG2icaAZ1ojU7Eu28ymdynNDUPpV6/2+kzHZyrNaI32lwktK2bdFcjHaghNJrq+kLB6MF5pn7ET2Gt5/OaVleBDOXFzAAUO9By4L5cnul6prTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778751165; c=relaxed/simple;
	bh=rZB6cVP+OB68GQ9mGdUKO+TcRKpuZdabKai7x8UMJI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P4iHFieQucV4QjKn1cnLL6KRylxYLIgENQrGotIbrjIhLGHQJDY1uc2IAKRuOB/+ZS+wxddchNUgrZN+vS0Tp4lByoYrjlFojqRWUOz2XqE2gSzS7FZkC4i83hNWZztwryP5Wswe8RoL4Z+h0tZkdK+QkU6mFN7L0S8h2VIyAaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VVNvHY7s; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VVNvHY7s"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45562c41ec7so3859759f8f.1
        for <llvm@lists.linux.dev>; Thu, 14 May 2026 02:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778751158; x=1779355958; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0xKmC3f9l+RG3PTmyEhaHWpzz2ePbx7CweTWHocme8c=;
        b=VVNvHY7ss66NjmW2TxItsAcfe+UbOdbP9S9Y19+QyXWC8Ja/zz85PgnjaeqAQ4BoLC
         WFXE+hKxAQ0+fperQEkUl2QdNWk220PuT+sBhRpA1G83yKkgEHbLJijmhxti7dfm8ec/
         iV7cXW8QN+womqXy8OqOa1FGGr5EDJR7dz8nlVkfz/hXT4Ri3bkllSpOYCDPUq6lP/E7
         JcI3kl932aXhHTyiJ9CJnMw1bWxTCmStinRWgzeGHW9EkgQNTGwO3/cb8OOA+rjhYMfu
         ZKMdZ/hJFcMeN2wrhnPLIYlJzn73DVwityH1CEth83Lim8sTShlyRRb4XTPC0O3VLjTC
         pkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778751158; x=1779355958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0xKmC3f9l+RG3PTmyEhaHWpzz2ePbx7CweTWHocme8c=;
        b=XY5ARAhgErx89fO6ZdXWauw9vvEZXRyOIqelDhU/GwBELGCLeAexuVQNugVugD2sDE
         qwbT4HMnuLBPcuSdbA2HZZHovwTxwmbZH4rx7Bm4q41BcuEhErULYMgR3Lh+zAr7IEEM
         5X5Ab2wzWuoko/sGAsGSsn39pP+/hO/3s+GJKf5I84y/wEULyIGfkKDsxNxt7eYHGzaz
         CfbYaVnLzFrlO0OCgGe3WqwbOXvwOsRs31HlblyXrlyH/7MwYZE1a35qB8xEmTug93N7
         TqIlgcbGFAbx7NfO/KxhxHBUxXlf5SLY3jenawKsqlJNZmvNO/pyxsmfx1eyzVf9bVpi
         YSbg==
X-Forwarded-Encrypted: i=1; AFNElJ/9Q/MR4igGNx8Zt2F/Z9afhzTe5/7OLRbIvsLWqNgQgW15+4A+rCkJTNSB7VdXf1sCSTTd@lists.linux.dev
X-Gm-Message-State: AOJu0YxfnaFIJQktQ/PojHcTanWuuzKig3EmBY7ZiMf90i1Jn3WarPcP
	g5E8PP9Kl3F0wPmAGmwmzhYbDqh+kT9XUoEDjIEBwDGZL49G/pRMYwB9Xnfl1320RIg=
X-Gm-Gg: Acq92OFBl9qIfqMzq/N19bN93E/JWrdku88stOD+0LeU0uDtGkre9VYZqbFfcx+3Mw0
	eEIRv3bX958mbjjrdf1kw5PCSsIY8BwA3NGFChRjZVtIfppXYU0/fEPzjV8zA6SR68EMwnp0SEJ
	2NItif/W+oIYau8B0NFyfKgQtBt3Df89DNq9wcaV25jsHksJKa3Xa5/2S+jar9U76D6y8F+08lC
	3mwtOVcvM/tANKfjdrIClnoWP8my0HooSNX75OeGF9DaHN0nu+mEUcEAmEohu3RljXyl4sWfyht
	9E3bAoewQ/ueQ6uRyPMeFplU/cCsxxYTMhOHQkY7A3/GGi0T/EvDtltxEkhvGsC/vO+JK3Jape+
	mMjHRbntpXixusBsC0aNAkLhoL5Oz+RkYaVcb8uPtj1dlXJeMLp6ToVQH3v4bwxBuuadkGolHKg
	unlOfehuylRjdEYv3cXqNwUR/+w68Ctbuc
X-Received: by 2002:a05:6000:40da:b0:450:e33b:23de with SMTP id ffacd0b85a97d-45c57dea159mr11278250f8f.2.1778751158215;
        Thu, 14 May 2026 02:32:38 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe0fecsm5097164f8f.26.2026.05.14.02.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:32:37 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 14 May 2026 10:32:12 +0100
Subject: [PATCH 5/6] tools/build: selftests: Allow versioning LLVM lld
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-james-perf-llvm-version-v1-5-6cac1a9a4c8d@linaro.org>
References: <20260514-james-perf-llvm-version-v1-0-6cac1a9a4c8d@linaro.org>
In-Reply-To: <20260514-james-perf-llvm-version-v1-0-6cac1a9a4c8d@linaro.org>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-input@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 bpf@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, leo.yan@arm.com
X-Mailer: b4 0.14.0

Building with LLVM=... could result in a different version of lld being
used than the main toolchain for liburandom_read.so because it's
hardcoded to "lld" in this makefile.

Make it consistent with the rest of the LLVM toolchain by adding an LLD
variable to Makefile.include. Keep the fallback for other architectures
in tools/testing/selftests/bpf/Makefile as it seems like it's something
specific to this make rule and shouldn't be global.

Clang accepts either a full path or "ld.lld-15" style inputs to
-fuse-ld= so this will work with LLD defined the same way as the other
LLVM tools. However, for full paths, we need to use ".../ld.lld" instead
of the generic driver "lld", but I don't think the original use of "lld"
was significant as this is always a linux build.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/scripts/Makefile.include       | 2 ++
 tools/testing/selftests/bpf/Makefile | 8 ++++----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.include
index 380ad84ac51e..5c2d505cba62 100644
--- a/tools/scripts/Makefile.include
+++ b/tools/scripts/Makefile.include
@@ -67,6 +67,7 @@ ifneq ($(LLVM),)
   $(call allow-override,HOSTAR,$(LLVM_PREFIX)llvm-ar$(LLVM_SUFFIX))
   $(call allow-override,LD,$(LLVM_PREFIX)ld.lld$(LLVM_SUFFIX))
   $(call allow-override,HOSTLD,$(LLVM_PREFIX)ld.lld$(LLVM_SUFFIX))
+  $(call allow-override,LLD,$(LLVM_PREFIX)ld.lld$(LLVM_SUFFIX))
   $(call allow-override,CXX,$(LLVM_PREFIX)clang++$(LLVM_SUFFIX))
   $(call allow-override,STRIP,$(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX))
   $(call allow-override,LLVM_STRIP,$(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX))
@@ -91,6 +92,7 @@ else
   # Some tools still require Clang, LLC and/or LLVM utils
   $(call allow-override,CLANG,clang)
   $(call allow-override,LLC,llc)
+  $(call allow-override,LLD,ld.lld)
   $(call allow-override,LLVM_CONFIG,llvm-config)
   $(call allow-override,LLVM_OBJCOPY,llvm-objcopy)
   $(call allow-override,LLVM_STRIP,llvm-strip)
diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 6ef6872adbc3..44ba829e5d4d 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -245,9 +245,9 @@ $(OUTPUT)/%:%.c
 
 # LLVM's ld.lld doesn't support all the architectures, so use it only on x86
 ifeq ($(SRCARCH),$(filter $(SRCARCH),x86 riscv))
-LLD := lld
+USE_LD := $(LLD)
 else
-LLD := $(shell command -v $(LD))
+USE_LD := $(shell command -v $(LD))
 endif
 
 # Filter out -static for liburandom_read.so and its dependent targets so that static builds
@@ -258,7 +258,7 @@ $(OUTPUT)/liburandom_read.so: urandom_read_lib1.c urandom_read_lib2.c liburandom
 		     $(filter-out -static,$(CFLAGS) $(LDFLAGS)) \
 		     $(filter %.c,$^) $(filter-out -static,$(LDLIBS)) \
 		     -Wno-unused-command-line-argument \
-		     -fuse-ld=$(LLD) -Wl,-znoseparate-code -Wl,--build-id=sha1 \
+		     -fuse-ld=$(USE_LD) -Wl,-znoseparate-code -Wl,--build-id=sha1 \
 		     -Wl,--version-script=liburandom_read.map \
 		     -fPIC -shared -o $@
 
@@ -268,7 +268,7 @@ $(OUTPUT)/urandom_read: urandom_read.c urandom_read_aux.c $(OUTPUT)/liburandom_r
 		     $(filter-out -static,$(CFLAGS) $(LDFLAGS)) $(filter %.c,$^) \
 		     -Wno-unused-command-line-argument \
 		     -lurandom_read $(filter-out -static,$(LDLIBS)) -L$(OUTPUT) \
-		     -fuse-ld=$(LLD) -Wl,-znoseparate-code -Wl,--build-id=sha1 \
+		     -fuse-ld=$(USE_LD) -Wl,-znoseparate-code -Wl,--build-id=sha1 \
 		     -Wl,-rpath=. -o $@
 
 $(OUTPUT)/sign-file: ../../../../scripts/sign-file.c

-- 
2.34.1

