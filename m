Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E330221ADDE
	for <llvm@lists.linux.dev>; Wed, 22 Jan 2025 17:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737567828; cv=none; b=AK69RSm0dF/6bpqxVde/zH8S5VO4RX7QNnnJXNKx6AdfmjVTl55m4GY+vislQv5U3KgJiLioapidAFTk6LMVbI1pHm3AfvOqsgpIvTSvR4bXLty74dTKq/Gc9K/a8/zwBJ4/onUIqq3aEj+XXAxY8uFlIHx5lFlIf/o/ZGg0ep8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737567828; c=relaxed/simple;
	bh=9GHPNHyvRxxMxBGIIob8u2neND2k/95QMi/45gOynCo=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=EqtdAwX896Ng5bTxRGIalNwWqy+YW+i3KC7eL9v5ltANqKSe4lJJp/t0gqq3xx0CIlyGEDK+OkdMCreIXFmklhFh+oullndqKHaQpUszUMlgG/gX8PhYgoyBxf9hVbIAW6VkC0KrOTmfd19Cq7gQX/LR9TiixoB45FtyXX6hfkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Qz7MoAu4; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qz7MoAu4"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e48beea5778so17574645276.1
        for <llvm@lists.linux.dev>; Wed, 22 Jan 2025 09:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737567826; x=1738172626; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DKH3yiTdGj08fSShzNsREAUyrrSH2fL/PhPrqngZihY=;
        b=Qz7MoAu4XRGlT24H7K5xDawTLDSo0f/kmpHQFQVc527c2i1C+PIWgZ/L9dO1Pjvsd3
         VLpSnLnOsNGSKw9nTmrv9/kv4n/JJdAdSGgBmm2/8T5dxphJSyMUF51xD4HQiipq0Icv
         AMUQFYkQj0MjHxBjx6hKIi5t0kn6mCwamP+YPrAsAxAOKpy4B/OJ48s7xLT+rW96wGz3
         33G0mQypFDPhTvGnHMVWoHkiWB2BXu9Ak1B/PIgkpkPdHklQilHKU5yJ18Zv1fB0L/sJ
         dglac/OB1ZXm97fRCPuRv/Dz6TNJOLbQLTxAg1iE2N2GJ/+u59vZl28A5vJmndR7Iygo
         WIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737567826; x=1738172626;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DKH3yiTdGj08fSShzNsREAUyrrSH2fL/PhPrqngZihY=;
        b=OXM/fmRu1GX85wixCFsMDqly1GNlCiMqLl51uyk2Zy/Y3lEcH+Oo2zeEgEauCXvQbW
         4p95xkdtdeF5tUQMyhgkDbfjXoqZuWKhR96j/9jr0SIdU4pdmki7pkj6kujUQrlc6wG+
         FXDqeF/PBPiYWjztDQm9mdSaU1q376wQoPIEl2IgteHY3yMV1qc07BiWtiqGBpS/Aw7w
         CKOGqgfaJScogyINseSxxmBNKDGnpGz+/YWM+R/ShpYn1yUaE/uHxcTpQOie/QJP9xsM
         MdykBOoJPfBFzQaUHvogdJh32aEgxyO/ViA+SQA6cV9mYyVOb0HfbrYMPDTNUGNsukqW
         IJ5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVwY0cU+mjmd2Bu57cLGE4lCbuGGOcOnVEBTYjmRgGKCsBKnzgv0HhC5jkpnTNfyhyJGnIc@lists.linux.dev
X-Gm-Message-State: AOJu0YxZqtKlTdh0N7byUA0pHXIz0FpCyUCOsvD56VUVVQAsYEUezPXS
	guI3eG/NiqUTRTTw+39qWAkezP8MtABVgd8Iw9doYW0PglvEscdCqyCz6PKfngyGpV5bn3Wz6AJ
	qLjwErw==
X-Google-Smtp-Source: AGHT+IGkgldheuVJupTzX6Fn2FVkqpNrVggcg4lpMEETVTUUw5th46LrdjZLruG7yN68AX8sRQNCtrYz2Dr0
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:807b:be79:d5c3:ee5c])
 (user=irogers job=sendgmr) by 2002:a05:690c:61c5:b0:6f3:d334:b7e5 with SMTP
 id 00721157ae682-6f6eb92efbfmr570387b3.5.1737567826016; Wed, 22 Jan 2025
 09:43:46 -0800 (PST)
Date: Wed, 22 Jan 2025 09:43:05 -0800
In-Reply-To: <20250122174308.350350-1-irogers@google.com>
Message-Id: <20250122174308.350350-16-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250122174308.350350-1-irogers@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Subject: [PATCH v3 15/18] perf build: Remove unused defines
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Aditya Gupta <adityag@linux.ibm.com>, 
	"Steinar H. Gunderson" <sesse@google.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Changbin Du <changbin.du@huawei.com>, "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, 
	James Clark <james.clark@linaro.org>, Kajol Jain <kjain@linux.ibm.com>, 
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Li Huafei <lihuafei1@huawei.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Andi Kleen <ak@linux.intel.com>, 
	Chaitanya S Prakash <chaitanyas.prakash@arm.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev, 
	Song Liu <song@kernel.org>, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

DISASM_FOUR_ARGS_SIGNATURE and DISASM_INIT_STYLED were used with
libbfd support. Remove now that libbfd support is removed.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.config | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 513dd5cab605..ba60a5b47be7 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -320,9 +320,6 @@ FEATURE_CHECK_LDFLAGS-libpython := $(PYTHON_EMBED_LDOPTS)
 
 FEATURE_CHECK_LDFLAGS-libaio = -lrt
 
-FEATURE_CHECK_LDFLAGS-disassembler-four-args = -lbfd -lopcodes -ldl
-FEATURE_CHECK_LDFLAGS-disassembler-init-styled = -lbfd -lopcodes -ldl
-
 CORE_CFLAGS += -fno-omit-frame-pointer
 CORE_CFLAGS += -Wall
 CORE_CFLAGS += -Wextra
@@ -349,7 +346,7 @@ endif
 
 ifeq ($(FEATURES_DUMP),)
 # We will display at the end of this Makefile.config, using $(call feature_display_entries)
-# As we may retry some feature detection here, see the disassembler-four-args case, for instance
+# As we may retry some feature detection here.
   FEATURE_DISPLAY_DEFERRED := 1
 include $(srctree)/tools/build/Makefile.feature
 else
@@ -1001,14 +998,6 @@ ifdef HAVE_KVM_STAT_SUPPORT
     CFLAGS += -DHAVE_KVM_STAT_SUPPORT
 endif
 
-ifeq ($(feature-disassembler-four-args), 1)
-    CFLAGS += -DDISASM_FOUR_ARGS_SIGNATURE
-endif
-
-ifeq ($(feature-disassembler-init-styled), 1)
-    CFLAGS += -DDISASM_INIT_STYLED
-endif
-
 ifeq (${IS_64_BIT}, 1)
   ifndef NO_PERF_READ_VDSO32
     $(call feature_check,compile-32)
@@ -1286,6 +1275,6 @@ endif
 
 # re-generate FEATURE-DUMP as we may have called feature_check, found out
 # extra libraries to add to LDFLAGS of some other test and then redo those
-# tests, see the block about disassembler-four-args, for instance.
+# tests.
 $(shell rm -f $(FEATURE_DUMP_FILENAME))
 $(foreach feat,$(FEATURE_TESTS),$(shell echo "$(call feature_assign,$(feat))" >> $(FEATURE_DUMP_FILENAME)))
-- 
2.48.1.262.g85cc9f2d1e-goog

