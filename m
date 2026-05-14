Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A513A7F60
	for <llvm@lists.linux.dev>; Thu, 14 May 2026 09:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778751163; cv=none; b=F//K/SkAiB/n1jZgI3E1d0TiRiYmLhNYIayUXdfbs2vvUXiomUw30nAL31TATEO6FEiPRJbiW7QgWp2nJB4kQjezEtLFBdeW/ybAbwq1W7etwUlCJTs8j0jOKREoqzV2FcCmNVLRNqtIUN9P1Ok0B1PBFOhe2savEpaOr7dnU/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778751163; c=relaxed/simple;
	bh=XYN2OerTukpjvC5uTpCQ4LBfsGgqw8htnZqoFgokKo0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d7dUc1wiSyOmEVSwPWy/Jz60jzcwAmx15cT0q9CqulGDDUZ+xV3SaFn69pkDeh1HfNji0APL2Xz4RiiR/4X0lmWIOF2qsXCuqo2PRoilxvPGNIkQ+KwmQDbLNfWatLyudVTl65jVadJZ0DqrlS8RoYmSq4bF1QnML6e5FiBxpHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zFDifjvc; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zFDifjvc"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-44985f4ab0fso4524845f8f.0
        for <llvm@lists.linux.dev>; Thu, 14 May 2026 02:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778751156; x=1779355956; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BuYOAkPGvNGtocwKIFKK4r5RpQsaxB3pkCmwnF/UVxs=;
        b=zFDifjvcCuWprIFAKff+uuQzi1bpNIPQFeUghhyzfiiY3a7eFeJXHBWhABVvprdgrN
         VDs/kc6T9bSHpSVVt86qZyLw+e/FgJC5POIWc4p63YORCHHvxYn7LMGUwuHOm0DThmgp
         e3b7sVWYlxfYNb8ajW0lA5+9xWn9jGeZS3So0tUqCphBGhuqCEe4wSiGA9kYrimdyBCE
         cPkvhp0jtGkoWqEG/M2jLekOwv1MuWY97S78A6IZd4dXM2e7NGuuk0LppydlwDCzJ1tV
         sKTEWJ3+ZKE8v+6OgTU7QyWfFDQTcOK6QRmuXh9zlLHRc2RMo/O1tHr2rfvyjWfT0E6N
         xhcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778751157; x=1779355957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BuYOAkPGvNGtocwKIFKK4r5RpQsaxB3pkCmwnF/UVxs=;
        b=EeHmgetS+BiXa9cNloZ8lO43qsAJBh0sdL8MrBSIhbcGVrfr85AGC7fdSBQWcvJcD0
         5veWbVwj19wyzW2taG8YIHepdBwOG9ALgM2+BCLaGPoO8tJgdOhr1QAsl2VFw0V6mIkn
         Sp86JEhSrOckCJPmOWvumIkDemtbkULFf+8sW04An5T3J7qpyJ0S7qnui1If/wmMvDK/
         FW3RsK16n0XPvyzeHdMvbBtS2SH0NNijkhJBY6znb7CsQOnHBYTYND5dJ/V8Qau311M7
         rYZ2Yn0FeuZQmd+4cjMS4j74/sD3zMmOtCc6k0kvftW6z3XZ5yz7zbrB4CfGQ9ppniHK
         S0kg==
X-Forwarded-Encrypted: i=1; AFNElJ9z0LH+5L/7v7M69Irqk0+Rm4VdzXYeVr9CG+NjFNl07nlqt/iAUiAfGHScmKgtvTDnM0Tk@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9wn0wspTYEfxgJShRmJT0Ts70Jq/ISQpQ7QTrhKI31LxQZaLl
	KuYE/YiFvyQA2nvVlKK2BOkXjTKlNO0Lx/Z6uj2J+ZaotP8yW4wbmLyYCmFhGakvECg=
X-Gm-Gg: Acq92OFtol+CAYJm60aZqWMEmd10T6PO7J4nLQa2NALmTFTM8vlaCwu8qG+PgyJm7q6
	P4MtkJ3lqvG+pxaEL6tMLAGMDZyBE+GNjrsww+poMTzyopu6tmLUPI8IucDxjdZ31FHbn9K1A+r
	SKRNFnozsLA2pO8SmWQ1/LpwU9UhvO5B8Ur/JhmzJMFFfWiObQ0+IS8S53LgIwikj9VU9bcX/Br
	beSbo8BIoF6r5tXGqDQPpxAcOozy1jnHtOQdDf+IxUIqATe+5pqn0E+wXS+F+OsWknbB4tGv7Ae
	ONcfJmdlebtVw3iCrrqJ67gPFOGqWLMyUGzLQkk7L+gG/pACSY64hj083/9XXJT4ngtP/KtSmeh
	F6SXlaP/XuR4ljy57f+XSrXbECYUtC48DyX6ZKmEMm9cwJI52UFBgjNll4B871dU/HU8RS5k3rA
	6qnAJ+JXmwyk+VtbDQzYGSRgj+vV1CDRcue3g+DP4SSZ8=
X-Received: by 2002:a05:6000:2910:b0:452:2834:c690 with SMTP id ffacd0b85a97d-45c554747bbmr10469740f8f.0.1778751156557;
        Thu, 14 May 2026 02:32:36 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe0fecsm5097164f8f.26.2026.05.14.02.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:32:36 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 14 May 2026 10:32:11 +0100
Subject: [PATCH 4/6] tools/build: Allow versioning LLVM readelf
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-james-perf-llvm-version-v1-4-6cac1a9a4c8d@linaro.org>
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

Documentation/kbuild/llvm.rst mentions that readelf is included in the
LLVM toolchain, but it's not currently included in this block.

Add it so that LLVM=... options also apply to readelf. Users in tools/
were Perf which was hardcoding it, and another was the BPF makefile.
Both already include Makefile.include so convert them to use the new
variable.

It also didn't have the cross compile prefix, so either readelf didn't
mind opening cross binaries, or it wasn't working for cross builds.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/lib/bpf/Makefile         | 8 ++++----
 tools/perf/Makefile.perf       | 1 -
 tools/scripts/Makefile.include | 2 ++
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/tools/lib/bpf/Makefile b/tools/lib/bpf/Makefile
index 168140f8e646..180dca9c57c8 100644
--- a/tools/lib/bpf/Makefile
+++ b/tools/lib/bpf/Makefile
@@ -114,12 +114,12 @@ PC_FILE		:= $(addprefix $(OUTPUT),$(PC_FILE))
 
 TAGS_PROG := $(if $(shell which etags 2>/dev/null),etags,ctags)
 
-GLOBAL_SYM_COUNT = $(shell readelf -s --wide $(BPF_IN_SHARED) | \
+GLOBAL_SYM_COUNT = $(shell $(READELF) -s --wide $(BPF_IN_SHARED) | \
 			   cut -d "@" -f1 | sed 's/_v[0-9]_[0-9]_[0-9].*//' | \
 			   sed 's/\[.*\]//' | \
 			   awk '/GLOBAL/ && /DEFAULT/ && !/UND|ABS/ {print $$NF}' | \
 			   sort -u | wc -l)
-VERSIONED_SYM_COUNT = $(shell readelf --dyn-syms --wide $(OUTPUT)libbpf.so | \
+VERSIONED_SYM_COUNT = $(shell $(READELF) --dyn-syms --wide $(OUTPUT)libbpf.so | \
 			      sed 's/\[.*\]//' | \
 			      awk '/GLOBAL/ && /DEFAULT/ && !/UND|ABS/ {print $$NF}' | \
 			      grep -Eo '[^ ]+@LIBBPF_' | cut -d@ -f1 | sort -u | wc -l)
@@ -182,12 +182,12 @@ check_abi: $(OUTPUT)libbpf.so $(VERSION_SCRIPT)
 		     "versioned symbols in $^ ($(VERSIONED_SYM_COUNT))." \
 		     "Please make sure all LIBBPF_API symbols are"	 \
 		     "versioned in $(VERSION_SCRIPT)." >&2;		 \
-		readelf -s --wide $(BPF_IN_SHARED) |			 \
+		$(READELF) -s --wide $(BPF_IN_SHARED) |			 \
 		    cut -d "@" -f1 | sed 's/_v[0-9]_[0-9]_[0-9].*//' |	 \
 		    sed 's/\[.*\]//' |					 \
 		    awk '/GLOBAL/ && /DEFAULT/ && !/UND/ {print $$NF}'|  \
 		    sort -u > $(OUTPUT)libbpf_global_syms.tmp;		 \
-		readelf --dyn-syms --wide $(OUTPUT)libbpf.so |		 \
+		$(READELF) --dyn-syms --wide $(OUTPUT)libbpf.so |		 \
 		    sed 's/\[.*\]//' |					 \
 		    awk '/GLOBAL/ && /DEFAULT/ && !/UND|ABS/ {print $$NF}'|  \
 		    grep -Eo '[^ ]+@LIBBPF_' | cut -d@ -f1 |		 \
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 0aba14f22a06..63276bf55856 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -215,7 +215,6 @@ FLEX    ?= flex
 BISON   ?= bison
 STRIP   = strip
 AWK     = awk
-READELF ?= readelf
 
 # include Makefile.config by default and rule out
 # non-config cases
diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.include
index e81e5b479c56..380ad84ac51e 100644
--- a/tools/scripts/Makefile.include
+++ b/tools/scripts/Makefile.include
@@ -73,6 +73,7 @@ ifneq ($(LLVM),)
   $(call allow-override,LLC,$(LLVM_PREFIX)llc$(LLVM_SUFFIX))
   $(call allow-override,LLVM_CONFIG,$(LLVM_PREFIX)llvm-config$(LLVM_SUFFIX))
   $(call allow-override,LLVM_OBJCOPY,$(LLVM_PREFIX)llvm-objcopy$(LLVM_SUFFIX))
+  $(call allow-override,READELF,$(LLVM_PREFIX)llvm-readelf$(LLVM_SUFFIX))
 else
   # Allow setting various cross-compile vars or setting CROSS_COMPILE as a prefix.
   $(call allow-override,CC,$(CROSS_COMPILE)gcc)
@@ -80,6 +81,7 @@ else
   $(call allow-override,LD,$(CROSS_COMPILE)ld)
   $(call allow-override,CXX,$(CROSS_COMPILE)g++)
   $(call allow-override,STRIP,$(CROSS_COMPILE)strip)
+  $(call allow-override,READELF,$(CROSS_COMPILE)readelf)
 
   # Host versions aren't prefixed
   $(call allow-override,HOSTAR,ar)

-- 
2.34.1

