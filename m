Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795244335;
	b=feukfSCNjMK/RVDe00SlhAzqq1pI1k7aWB4d9GMvukU9IEc/oGL1aDcXhAJ/IFgRnOBs
	 tARuGGlUTThzgOUJ+gAYcruZR7e+VmxdPx0grLDbT5vieFeBblNXo/l7CkJ9W+7yEtCrr
	 O3dqdc2Sz1ThAACVDw+D+2/BNaOZsHXUm+6YoSkq6nqb5u2Wps+j/pFYQGvi1oOqMsTVr
	 NpNITTWJN1wBh9J4bvxhj3979IBznFE46s2eGyB2xm6e+1P9OM3YPBt31Stkbjv8QQB7/
	 HH8y9TVHoVySyiyWUMg3cM1CV84RA6TCkGCfi90qAi2OiNT/WQ201mpG5z+QH7jV/tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=fuvtSLQkw2xn+flfUo7lSRyM8NUUkLIzaxviYb0ux+A=;
	b=rQcScKBxyuu7aZn5PfbAe5o9lakSoWrPdzMAlb/++2SImvGoSi6QydnnoMn8wBbCCCoo
	 waIaGG55hXoTFMAbMmeqzItfrb4UzN+OTCUzPoU+AE+2CrkZjyUPjgGoeHXCqbdgPTPj/
	 W+gj2XX3b5Caz27p7grAiZ9HSbvA27Vp1A/R0pgLiRcRX5iVBY+2fo8SPLwfpFJc0CFWl
	 ADAI6IZIHQMfVJMsnhg/FPZkedQ/uNb7O//9kl1XnnAiJPBW5uCgiYa6tOIOt2eqn4VWq
	 FkKvxj7GWOSoSOboUrSWh20O3WHUEbAwj5NFOX7CuzfZENRlkW19CVnuZuBCtp3wwBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XQOQ+R4J;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D12606A330
	for <llvm@lists.linux.dev>; Sat, 21 Nov 2026 06:58:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49D12606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XQOQ+R4J
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b3b4208826so1151766a91.1
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 22:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795244334; x=1795849134; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fuvtSLQkw2xn+flfUo7lSRyM8NUUkLIzaxviYb0ux+A=;
        b=XQOQ+R4Jn2MtMy7PnxOyCOy1YINXxtAD2Lngrc1fZ6DQM2g8xJAoxp95Ir+8I1T/t+
         wQXvuAzujCWcLD1XlQmGZ+r2mghLgfOfFsSN9mbJHZ3ntdzRE9WECP/2yfYwhtl1fsUi
         N8HyHMLaobpG/kX/ivzX3nXLy2Rp6LmN7W4hakLJ3ZQXEBKRNDUp0m9asflpaw23qdrP
         m+9QsdcQaOQGC6EbFtszoNNyG9ls899BITYzt6pxi+ismEpSrwpZd0MlV3EIOBgYM+xL
         LB1fc6N30Kdnuy8HJ93lCF95zXfauUOhs8Yj9QDWtl7tb/FWBtalEcsjVUdoVOPKTjGC
         wHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795244334; x=1795849134;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fuvtSLQkw2xn+flfUo7lSRyM8NUUkLIzaxviYb0ux+A=;
        b=bWONmT+A7w8Z2gqS36Q8yfErI4BbIE3AMWVqEBEIzDEj9KN3YYbHJwcF1lclG1OFHD
         BS0a4aP5VzaPmr+DgHSSfHgM6RGtI4e3Z5Q4euSWem0ogtS7LtJmvMGEBbx66UfK7f1V
         wA0cdNnTa1lkvZWIEG5hFsqo9D6d0Sy6CmglI3G/x5Ucr46862daUOP3pSIfHSCYrTxE
         t2dn13cEtJlWqTJ0UKm80pIsyF2fXJALm8BwY8BTekSrnFjoCiE28LrMm6En4p3T/WNZ
         kQZGruJXO9+kQBwFaL21ajSIf/4GHS016uBhzV53CcvbGF1vMXFX4t62OBdxD518fdQI
         9GIQ==
X-Forwarded-Encrypted: i=1; AL+hErHuyd4MmxBgeaQcnvZIdRvHqQQYU5T+pxlNvx36nTyiqTBIhXXnNFLFGirLwagg6q0GuMlJ@lists.linux.dev
X-Gm-Message-State: APuU4Z+71LKtzl020w+gwWfvEld11U043OoG9T1ofJ9jwIrwMAQ4/QQS
	0pZxJSkkYKe9vkYPExoonqtdv2yL48Kw+yxNB9dXqJBbv9uiyzvYAbN1UEwsMRh9vyreL1+rZY2
	vE3PWwLzr4w==
X-Received: from plgw12.prod.google.com ([2002:a17:902:e88c:b0:2ed:4e53:853d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:164d:b0:3b3:a575:846a
 with SMTP id 98e67ed59e1d1-3b40a5de1bcmr4960690a91.22.1795244334321; Fri, 20
 Nov 2026 22:58:54 -0800 (PST)
Date: Fri, 20 Nov 2026 22:57:54 -0800
In-Reply-To: <20261121065813.4143649-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261121065813.4143649-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261121065813.4143649-6-irogers@google.com>
Subject: [PATCH v15 05/23] perf build: Enable context analysis and Clang
 thread-safety flags
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Weilin Wang <weilin.wang@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Define -DWARN_CONTEXT_ANALYSIS for Clang builds so the context analysis
attributes in linux/compiler-context-analysis.h expand to Clang's
thread-safety attributes rather than no-ops, matching the kernel's
scripts/Makefile.context-analysis.

Also include tools/build/Build.include (updating TMPOUT to place
temporary probe directories under $(OUTPUT) when set) and use cc-option
to enable -Wthread-safety-pointer, -Wthread-safety-beta, and
-fexperimental-late-parse-attributes when supported by Clang.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/build/Build.include  | 4 ++--
 tools/perf/Makefile.config | 9 +++++++--
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/tools/build/Build.include b/tools/build/Build.include
index cd0baa7a168d..cce5e4673ba6 100644
--- a/tools/build/Build.include
+++ b/tools/build/Build.include
@@ -113,7 +113,7 @@ rust_flags   = $(filter-out $(RUST_FLAGS_REMOVE_$(obj)), $(rust_flags_2))
 host_c_flags = -Wp,-MD,$(depfile) -Wp,-MT,$@ $(HOSTCFLAGS) -D"BUILD_STR(s)=\#s" $(HOSTCFLAGS_$(basetarget).o) $(HOSTCFLAGS_$(obj))
 
 # output directory for tests below
-TMPOUT = .tmp_$$$$
+TMPOUT = $(if $(OUTPUT),$(OUTPUT)/,).tmp_$$$$
 
 # try-run
 # Usage: option = $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwise)
@@ -121,8 +121,8 @@ TMPOUT = .tmp_$$$$
 # automatically cleaned up.
 try-run = $(shell set -e;		\
 	TMP=$(TMPOUT)/tmp;		\
-	mkdir -p $(TMPOUT);		\
 	trap "rm -rf $(TMPOUT)" EXIT;	\
+	mkdir -p $(TMPOUT);		\
 	if ($(1)) >/dev/null 2>&1;	\
 	then echo "$(2)";		\
 	else echo "$(3)";		\
diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 1cee80c531ab..aed2e952c8f3 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -12,6 +12,8 @@ ifneq ($(obj-perf),)
 obj-perf := $(abspath $(obj-perf))/
 endif
 
+include $(srctree)/tools/build/Build.include
+
 $(shell printf "" > $(OUTPUT).config-detected)
 detected     = $(shell echo "$(1)=y"       >> $(OUTPUT).config-detected)
 detected_var = $(shell echo "$(1)=$($(1))" >> $(OUTPUT).config-detected)
@@ -63,8 +65,11 @@ ifeq ($(CC_NO_CLANG), 0)
     CXX := $(CXX) $(CLANG_FLAGS) -fintegrated-as
   endif
 
-  # Enabled Wthread-safety analysis for clang builds.
-  CFLAGS += -Wthread-safety
+  # Enable context analysis (linux/compiler-context-analysis.h gates its Clang
+  # attributes behind WARN_CONTEXT_ANALYSIS) and Clang thread-safety checks.
+  CFLAGS += -DWARN_CONTEXT_ANALYSIS -Wthread-safety
+  CFLAGS += $(call cc-option,-Wthread-safety-pointer -Wthread-safety-beta)
+  CFLAGS += $(call cc-option,-fexperimental-late-parse-attributes)
 endif
 
 include $(srctree)/tools/scripts/Makefile.arch
-- 
2.56.1.750.gf70dc682cf-goog

