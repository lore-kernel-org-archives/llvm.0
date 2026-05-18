Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA48D3E7179
	for <llvm@lists.linux.dev>; Mon, 18 May 2026 09:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779095062; cv=none; b=aonmjk1uUNsx0mDQLzFj3QFMSevhCZ9XmnIDVqL0v5lpg0ex61kidOjMvHDSkaY5N116g91hDlR/dZmeND/MUmj314YdrcdOu4xBLd7YxDG/41DkQmTyRv5kuXfof5yknL+DkVIoOHPJLDI38LPR+k3zpDO98iIHL6eVcHq2fCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779095062; c=relaxed/simple;
	bh=fzYRY6fdwwtc2iRyj9RCOJMDAIdKHmJQQ+6ehPNKfyY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tAnw/4a2HmT0b2qFeb8gvX0m7EXZKDZz2+zW1Sz4iEGWZGG279jwh4wRo1oW+pMNjepR8f39MIbXaQuQ1rcIRd/oxXHK+8g8LdsrOqbtGlAup3y7eYEB6txQ2qOLuStfa06i3V/L/q5hjsiqYubiSuVCmgvmirFFcNixjcX3QZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JgmOnvQV; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JgmOnvQV"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-bd36614d329so298792666b.3
        for <llvm@lists.linux.dev>; Mon, 18 May 2026 02:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779095059; x=1779699859; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0eZhJfDWaDpr1HIAphXElaRatPY/KQEr+aNnKVotSAw=;
        b=JgmOnvQVQPt0Pc33x3ch5hFmUWdaLhX6ST7qhbCTM9xZj/atQJzsX5LVTl86NVzWuM
         zQd89extHYwCXtMh8wgZY1xQ9RSAEX/CBFNABZ3+9BvSAJbVC7NCDa7089XOq3pBA4Gx
         6V/3VwpYv/kRUtYZ0s/4pxMeSTMd7zEwKwJGLxo0kcrIAamMzz5HAVZjkBbNfMD4nJl+
         Z0+kKZi2LzJkvR82Plw9ADHDUjspnp1ceIjfsuC5tb7tNAOibaIIUy+Z8FNBlazTAdjg
         gNZJjNgDgaKqTDiEtbYQZvzBc7dlO46O1xLpl6tYssVa26s597yLVZlFUcuOd7U4F6X3
         RQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779095059; x=1779699859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0eZhJfDWaDpr1HIAphXElaRatPY/KQEr+aNnKVotSAw=;
        b=B3kiN6228lx5QjfPgj8QQZGbkHoqWAE3rjenG4QKmgZyvvYf+JZf9t8FTypjpac2vI
         qreIqlT8t3rHDxz4Zlhmmd4yKlOw2R8tN67zi62qVfhL6OjuYf3Y9JF3sKEDB7Tnhoz+
         OXHGaxK34k7JZJPprhVuKdRrMYoNiZS7Xu/PHX3XeBWtDQgPZFvQiwSaks40QUvPMep6
         bjeYaCoCwRoe9t0sqvICDrpDshEM88harNuZDaZ6fuU8VqKr4+Sm+t0lilgu5gK2bZR/
         6WbtcAZYu/5JlxvG1Ro6PWgJfQyH3BU23pmGg7H/F740y8cTrwsE4W2xDxd4MYgodwqu
         bJAA==
X-Forwarded-Encrypted: i=1; AFNElJ/vj0sSimDmNYkbE5wmQhLAGe9oIwYcaBKXpXvw+OYEfffsVCsq1qzdcX9e4qu38tFjsA/X@lists.linux.dev
X-Gm-Message-State: AOJu0YwzavlcIghfz0fweSWB/Ga6HyhycVo1hUfRRSv37Sxm2Gk4gZl7
	Vddj1CfvY2FQiTCuPysAnlzZw+K2fPny22NzuJDq8mCuj8VMjQgR0dMiEXtyviXCrCU=
X-Gm-Gg: Acq92OELwyPzo6nAWU3xb5/qEengZr+m3Px+18N/92dBe6GoOL63/BGnEOuwPpysEFP
	CWdy+6o/H4GBdV90Tja76njVh+Pcpn2LZpOUmDhDqMC0BoddhjM1/kGs08VA0LCvM7fhMFF7iVX
	o3oFbYmv10fQ3L+ydiOm60O7G1b3mK+ovopr6rtxQ/7ZEnysBlWxdy4CD8OC6l6Bmaaps0O0YWq
	IF1zYu+ldUVNBbiqh3DzRxAZXRzt3i4ZBmD/mxfEduiQLngcm8ZCMCxPAiAD36zhpljxcinVMZX
	9IbNTMAJeV6XRGXFaHJiHf/jesLOoFo3jQtQl+MJ8u8bVAJdV5vk/1+kCHLK/X+kg+D4pxaJFXl
	Sxrl5LH34hJIav+nfQ6ZQT6HlYloiPMhilXXIdcam1FPM/AImrsCXJNKuTRBN5HFgkuNOaIRl8Z
	Vt7Lvs5b7IoY8C9fzSinPpDyFfUT0xm/Sn
X-Received: by 2002:a17:907:c248:b0:ba1:1181:b773 with SMTP id a640c23a62f3a-bd5177ee49dmr801041366b.10.1779095058404;
        Mon, 18 May 2026 02:04:18 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768072sm35084436f8f.5.2026.05.18.02.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 02:04:18 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 18 May 2026 10:03:12 +0100
Subject: [PATCH v2 6/6] tools/build: selftests: Remove some duplicate
 toolchain definitions
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-james-perf-llvm-version-v2-6-f12cc4f031d8@linaro.org>
References: <20260518-james-perf-llvm-version-v2-0-f12cc4f031d8@linaro.org>
In-Reply-To: <20260518-james-perf-llvm-version-v2-0-f12cc4f031d8@linaro.org>
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
 Yonghong Song <yonghong.song@linux.dev>, ihor.solodrai@linux.dev
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-input@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 bpf@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

Try to remove some, but not all duplicate toolchain definitions. In
these instances, their makefiles already include
tools/scripts/Makefile.include which defines these in a consistent way.

STRIP is the only one that was set with an '=', but I don't think it
was significant so that difference can be dropped.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/bpf/resolve_btfids/Makefile    | 3 ---
 tools/lib/api/Makefile               | 4 ----
 tools/lib/subcmd/Makefile            | 4 ----
 tools/lib/symbol/Makefile            | 4 ----
 tools/perf/Makefile.perf             | 6 ------
 tools/testing/selftests/bpf/Makefile | 1 -
 6 files changed, 22 deletions(-)

diff --git a/tools/bpf/resolve_btfids/Makefile b/tools/bpf/resolve_btfids/Makefile
index 7672208f65e4..6fdb6302e0a2 100644
--- a/tools/bpf/resolve_btfids/Makefile
+++ b/tools/bpf/resolve_btfids/Makefile
@@ -20,9 +20,6 @@ HOST_OVERRIDES := AR="$(HOSTAR)" CC="$(HOSTCC)" LD="$(HOSTLD)" ARCH="$(HOSTARCH)
 		  CROSS_COMPILE="" CLANG_CROSS_FLAGS="" EXTRA_CFLAGS="$(HOSTCFLAGS)"
 
 RM      ?= rm
-HOSTCC  ?= gcc
-HOSTLD  ?= ld
-HOSTAR  ?= ar
 HOSTPKG_CONFIG ?= pkg-config
 CROSS_COMPILE =
 
diff --git a/tools/lib/api/Makefile b/tools/lib/api/Makefile
index 8665c799e0fa..a228fdb5adba 100644
--- a/tools/lib/api/Makefile
+++ b/tools/lib/api/Makefile
@@ -9,10 +9,6 @@ srctree := $(patsubst %/,%,$(dir $(srctree)))
 #$(info Determined 'srctree' to be $(srctree))
 endif
 
-CC ?= $(CROSS_COMPILE)gcc
-AR ?= $(CROSS_COMPILE)ar
-LD ?= $(CROSS_COMPILE)ld
-
 MAKEFLAGS += --no-print-directory
 
 INSTALL = install
diff --git a/tools/lib/subcmd/Makefile b/tools/lib/subcmd/Makefile
index 8703ab487b68..9f1ddcf0504d 100644
--- a/tools/lib/subcmd/Makefile
+++ b/tools/lib/subcmd/Makefile
@@ -9,10 +9,6 @@ srctree := $(patsubst %/,%,$(dir $(srctree)))
 #$(info Determined 'srctree' to be $(srctree))
 endif
 
-CC ?= $(CROSS_COMPILE)gcc
-LD ?= $(CROSS_COMPILE)ld
-AR ?= $(CROSS_COMPILE)ar
-
 RM = rm -f
 
 MAKEFLAGS += --no-print-directory
diff --git a/tools/lib/symbol/Makefile b/tools/lib/symbol/Makefile
index 426b845edfac..d692abe8add6 100644
--- a/tools/lib/symbol/Makefile
+++ b/tools/lib/symbol/Makefile
@@ -9,10 +9,6 @@ srctree := $(patsubst %/,%,$(dir $(srctree)))
 #$(info Determined 'srctree' to be $(srctree))
 endif
 
-CC ?= $(CROSS_COMPILE)gcc
-AR ?= $(CROSS_COMPILE)ar
-LD ?= $(CROSS_COMPILE)ld
-
 MAKEFLAGS += --no-print-directory
 
 INSTALL = install
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 63276bf55856..948abfd2ee8d 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -174,11 +174,6 @@ endef
 
 LD += $(EXTRA_LDFLAGS)
 
-HOSTCC  ?= gcc
-HOSTLD  ?= ld
-HOSTAR  ?= ar
-CLANG   ?= clang
-
 # Some distros provide the command $(CROSS_COMPILE)pkg-config for
 # searching packges installed with Multiarch. Use it for cross
 # compilation if it is existed.
@@ -213,7 +208,6 @@ FIND    = find
 INSTALL = install
 FLEX    ?= flex
 BISON   ?= bison
-STRIP   = strip
 AWK     = awk
 
 # include Makefile.config by default and rule out
diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 836e783f0170..f038642b283f 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -3,7 +3,6 @@ include ../../../build/Build.include
 include ../../../scripts/Makefile.arch
 include ../../../scripts/Makefile.include
 
-CXX ?= $(CROSS_COMPILE)g++
 OBJCOPY ?= $(CROSS_COMPILE)objcopy
 
 CURDIR := $(abspath .)

-- 
2.34.1

