Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9211A21A425
	for <llvm@lists.linux.dev>; Sat, 23 Aug 2025 00:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755909184; cv=none; b=BIZdDZ4Ea/pUzriE9K+v69wSFaRWwPvGguhXbPepqkAuHBTGQw5TU2xJhOVvdK3jVMiB1wH7tI74WxThMkx004rN/3aiaEMlBQjA52MyaenHj9fKn2NdH+hr9UU74n8jeiv15+qyhfyjM09kNQULr4kRz+qlw6ztUsm/P9aM6MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755909184; c=relaxed/simple;
	bh=8kyU+3N5rFa4jxI23fv/JBL+QDC2pprcydJkxdbk81k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=lMNTL+OQo4BOriCh/SKehv3ECbcnBtrT9ly18EKGXR5BgHJCBFhz+iWWS8XfgFv+j40S436ni8mSFKcVKprC77iv3KISs0+NhpmEBUc8+8p4b3Tz7lHxCQNo/pADES+N5PXchiQbim+czDtQS6ppzFe5+h3RejArEmOdyVwgcDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dlZLiBLD; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dlZLiBLD"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-71ff15cdbbcso6508817b3.2
        for <llvm@lists.linux.dev>; Fri, 22 Aug 2025 17:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755909181; x=1756513981; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Us6z2TKlP+S3hY+Lrnn4T4iR89YiftOtm9vFr92wiA=;
        b=dlZLiBLDkJHTp8LdPnayiXhDm2cKO0LKrWW5T10qs7eGaaFZzyr1wb9xxofN9WuPbw
         E48SuCpSZA8CdP8Wz3Ifr/EWNXKgbiD5JL2C1vroK4Q6fiAQ7oeBEpOzK7Y90BPwHR54
         IWx0eaNvmRxEZpdLiC+BLMxf50jNFq24XBOtuPV+npExKjLpTlRhD67hJFuDEu9Dl7lE
         YzPtHFweF55LSpUfrfy++q1tmTjEcbdEka5WJQhrmrcKE+xW1WHhkATGCRxMxsceRTkz
         RG27EqTdt4RV87KyQnQwz/1lj8UAKhDAM49Sk1WvpCncObbQL+M5/NtZ4vDfvpRvj1U3
         m50g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755909181; x=1756513981;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Us6z2TKlP+S3hY+Lrnn4T4iR89YiftOtm9vFr92wiA=;
        b=C90aPQ5Cv6LQzK8BWwU6+3FjFArXnfZY8g0gZbGthDS2qPxjMnZkSHzAVayGZ5fvRM
         UfO+vJiB9fkjdIID+xqMljC92NpfKpBxpgryXKhht9GiiSFnKKdbctIOFaEO0/XNP/gk
         cIwrItjwNVzn8erN6ONQQJoGsmkfskBK56s5YWTnpZ94dtkdNfE/fo8yFnMd9VsU5kyV
         ZUlVV1GEAMzqO2fn9a4rmjl42PhWqHQKfbZRw85Ap0vI3Ul0Dghb5FB3kban1NnLNf7i
         WvmJzsd3DesEtbTAmCQfZKDYkF1DqQk/8p+ZcgJTCNadl+Mn9eWSAXVQ9qX27bkq2mzN
         OvMg==
X-Forwarded-Encrypted: i=1; AJvYcCXo/nO2Ah2pjYiOZ7NefAuVK8EHLQTeWXc+xxI6ZJw8xSO9wMv9XmpbZDMWESfWk/SZO3YZ@lists.linux.dev
X-Gm-Message-State: AOJu0YzhuQfgmQZ/wvdGNZ1ui/g3kcRjQ7zX9GzsblQDUQSHYCBWQBAf
	MWnlxZY/mevSYZg+51UrXbO7ZCO8c8DAQAkdhkMvkfwr7AX16YdmjL9h3HVtI61CT9NPmz0x82q
	eO3B5AWJQeA==
X-Google-Smtp-Source: AGHT+IGpxx6kQIV32JN8263+0yzcwCWq6SBuLlQ67pYy5mvtapsVA7DULVOD5wjGf4B8dA4bilIhjdNDayJw
X-Received: from ywbjb12.prod.google.com ([2002:a05:690c:6e0c:b0:71f:c8f3:536e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:690c:3507:b0:719:f7ed:3211
 with SMTP id 00721157ae682-71fdc2b0312mr51727347b3.7.1755909181497; Fri, 22
 Aug 2025 17:33:01 -0700 (PDT)
Date: Fri, 22 Aug 2025 17:32:11 -0700
In-Reply-To: <20250823003216.733941-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250823003216.733941-1-irogers@google.com>
X-Mailer: git-send-email 2.51.0.rc2.233.g662b1ed5c5-goog
Message-ID: <20250823003216.733941-16-irogers@google.com>
Subject: [PATCH v5 15/19] perf build: Remove unused defines
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
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
index 7bc9985264a7..d39297bd404a 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -323,9 +323,6 @@ FEATURE_CHECK_LDFLAGS-libpython := $(PYTHON_EMBED_LDOPTS)
 
 FEATURE_CHECK_LDFLAGS-libaio = -lrt
 
-FEATURE_CHECK_LDFLAGS-disassembler-four-args = -lbfd -lopcodes -ldl
-FEATURE_CHECK_LDFLAGS-disassembler-init-styled = -lbfd -lopcodes -ldl
-
 CORE_CFLAGS += -fno-omit-frame-pointer
 CORE_CFLAGS += -Wall
 CORE_CFLAGS += -Wextra
@@ -352,7 +349,7 @@ endif
 
 ifeq ($(FEATURES_DUMP),)
 # We will display at the end of this Makefile.config, using $(call feature_display_entries)
-# As we may retry some feature detection here, see the disassembler-four-args case, for instance
+# As we may retry some feature detection here.
   FEATURE_DISPLAY_DEFERRED := 1
 include $(srctree)/tools/build/Makefile.feature
 else
@@ -1006,14 +1003,6 @@ ifdef HAVE_KVM_STAT_SUPPORT
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
@@ -1288,6 +1277,6 @@ endif
 
 # re-generate FEATURE-DUMP as we may have called feature_check, found out
 # extra libraries to add to LDFLAGS of some other test and then redo those
-# tests, see the block about disassembler-four-args, for instance.
+# tests.
 $(shell rm -f $(FEATURE_DUMP_FILENAME))
 $(foreach feat,$(FEATURE_TESTS),$(shell echo "$(call feature_assign,$(feat))" >> $(FEATURE_DUMP_FILENAME)))
-- 
2.51.0.rc2.233.g662b1ed5c5-goog

