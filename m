Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784C922371C
	for <llvm@lists.linux.dev>; Thu, 17 Apr 2025 23:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744931307; cv=none; b=qYYQBFqhbcjfRzHYxiMbnpUspDbngGzaQoaqAd6G0wuCjhqf0/5jiEKSqOM0n8XrJwQquQdoQlu3B4BLieK1WfYusWf5mOAq2iWzuXdH++SI2XWwupPaTpy08yjDTLAM9Ue6ejHOQUjfH/rYyQFSNujorddcjwriKr7oSdZ33WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744931307; c=relaxed/simple;
	bh=foSoET0IF18/f5J0V+ZIUsKXop/FvoFoqTKnlWhCxVc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=XVj7lsq/iQpJvzIBI1tGYAXFdCbCI2QEbnE42jr/t0ckwArmf9hVUxWGEMuv27nfgyQGPdhF+LsSUpYXZ4NURYyvR5eYUjH3FFvBav8lxW5X+StTP3ro+1SlU00zKTNeJiuA4ae0IkHiBlJVdIzXl4Q8IBSpHNuBCs1egSxEJyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LL6fzsGm; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LL6fzsGm"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-22647ff3cf5so12031075ad.0
        for <llvm@lists.linux.dev>; Thu, 17 Apr 2025 16:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744931306; x=1745536106; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y8ztzt+tF3nTRYCrcDqKNMajzSGAzjCJLiKGSSFxPrQ=;
        b=LL6fzsGm52LUDPNyq4wVCXdK24xYYPpSbwcQWdGKR4QJhv5mNk83jCMBRKHyZKwn3K
         h3QgQ4tJYUQ2yeL45wDTSnWLthtIBmdryncAFgFQ2V5OCFNV0sPnq/O1kKpSbGd4TLMf
         vaevAL5rkNZW/Lvm0b3f+8oBmQ9G1ktl6249n8ZoPR9ktLsZ4pe+RsuZN/HMaRGJ6K3k
         Dc1oQkBFy1yBpuqiORPEo5mKRmPIoQBn3ZIQ/oS+h/X4vqObZJ4Bmp43sZRm5DpS4Bkp
         pNdDt48fZuqI6Hcz1XIhGPbchW+uSxhN6iD5Oqgk6UBbYUN6BNuY++xxSOlNibTxy/mf
         chuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744931306; x=1745536106;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y8ztzt+tF3nTRYCrcDqKNMajzSGAzjCJLiKGSSFxPrQ=;
        b=KvbJ7reY1fw1bb1VaFVvSBKAMYqE3XRI8JH4U6c6xecD/Avg73GtdkfiIMyGGmEEVw
         EVfCLmol00dITYToHehGQI9y6AN7CXcuszhkOXEygcAKUXlzORDb26rmgJgsp1Bt3NFh
         rr38wZV5k55fCH4p++6jUvZlns1XCR6ivWZCqFkZFiUV9sLgt+PFHBOjJPeL5tEbZpWn
         EwqvSfsOAdc3bnhMapOWtggS1biW/cefpeqH1BDcpfYzDja2k+oDwl74hBFAWz52VGWW
         vBMaWHKfzxUXWSdjDGN5qGpYmjNe6C+Uq5Ab2c8HdIOhAWD3/qQM4EafYNdKhSxUe5Pz
         w5kQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxy6sg981gB35G5FJqrCWCwYN8X+znV2UCmDqlx5PMk1eOQv/rgi4QBXgSmVy8fHTp4kYf@lists.linux.dev
X-Gm-Message-State: AOJu0YxB5freWOMJKOvsSuqdoUNrsQnVy/T0HvYrz308IzEmQ/navipo
	BicaxTUXzVgauelldNVVIdr5ktVLfbCvkekxaI0GauM7ri0Ku5P8VporYrTK4XlWckjBId2vObv
	lCtZi4Q==
X-Google-Smtp-Source: AGHT+IEWSA4fDbg0ibRFGPSZKCMBCSJeYgY5UAGASEYAWSOWOvfZ2A76/t8FmAXO8wa38rFjn6xU2QPybjdA
X-Received: from pfod7.prod.google.com ([2002:aa7:8687:0:b0:736:38af:afeb])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1744:b0:224:249f:9723
 with SMTP id d9443c01a7336-22c536204c8mr9101135ad.51.1744931305689; Thu, 17
 Apr 2025 16:08:25 -0700 (PDT)
Date: Thu, 17 Apr 2025 16:07:36 -0700
In-Reply-To: <20250417230740.86048-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250417230740.86048-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250417230740.86048-16-irogers@google.com>
Subject: [PATCH v4 15/19] perf build: Remove unused defines
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
index 3ed047ffb4f5..bb4d31b1e1df 100644
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
2.49.0.805.g082f7c87e0-goog

