Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7ED1C3039
	for <llvm@lists.linux.dev>; Wed, 22 Jan 2025 06:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737527155; cv=none; b=Za0NAnvuafe1VHA0/5EuuCQfTfCVweu0gdSZd+q3HVoRiV8cUaTtR3mLERi0r68WUIL63SUgiHKPZFq9snXOASwOhmCAWvR8zniX0YFUw9gpvRe7P5hleh6udSy1Gd+SRl8tHuAEfjtXkbGZoFvUh3SmvWRSKz+5FUjsqh0rjtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737527155; c=relaxed/simple;
	bh=YkWOp6sBnU9ELov42ERsPm7Vngu6X+NP4toNn4LW5Oc=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=Qj1doTh7MPhaQ1Tgh9NEjQPlqGdh+c/9UKZfmvu9rHDdhd6HPoGTzZBQrInfIe4Lfx6v7oXA2COb0irzASAOjhpkdxD0tfoP/GWSLRvlee51J+62aIKyDe+0UbIo7Odrbe8Vf5j0FS1QrtxeSocAZIXESK5P7dhWxkI9TPi+/4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1l7L678E; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1l7L678E"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e549e7072fbso13596537276.2
        for <llvm@lists.linux.dev>; Tue, 21 Jan 2025 22:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737527153; x=1738131953; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M9hPyZ1Eqh7FkhnlmqyYPUb6W8XykQq6Ozx0wTDbMtQ=;
        b=1l7L678EVpZTZcPvt6js/ecf0hWXAeRhZlruuFSti5s/uerQD3r+qmTk7/+21BhUvr
         OhYHo/gk5IRU+IOmKKkj7OZwhI1cyV4QKd9u/tHvTipB9k7zlkz2csVA0+gRw0FIvCsH
         Dy/lhat5xwyXpPcFy9/j8axApttZvda9/sbumfWwXLRk/R9vhmFSgV3J9AHvTwMl+qZV
         atnrt8gEVtj/vG70vR35GG1rOz24NtiXHNBUxErxCrecY0A8fchKp9Xz9Ms2Nb7NPlWc
         NfkRZ/ElRdNfFsAIR0IsbmCKkf2Pnxbq9Pc81RtO9kEbLDH+uoEr7WSs9BcNlNxx6AKA
         na/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737527153; x=1738131953;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M9hPyZ1Eqh7FkhnlmqyYPUb6W8XykQq6Ozx0wTDbMtQ=;
        b=iL03hTzM7UdSvlmbxbrNZLVEHC4yyr74EJwtDbNOgL31myODk8nRm+BEdbXjugc6ew
         1oQsUocAoT53bSc1/9dnGUSyIhOTrnUOT8BWjhx4zLeJUg5aFeGLeo4yB+8daVJSOgxD
         bTtxmF4rEoZHqQ8uQTQabdJla10kGBokIrnPqvYLyEp6LH+e2NeZJn8Bk1v8KQKjKTa/
         cjgVXgpE9tLVr3aPmMa5nMwtkvQsDA86zOw0TqDvuNtUYFXuHP97wumukRC8PPBjSuQ1
         euNbEwA0WPEawi9dNgG5MtAW02qaucYTBfMReE3mS1MfVbG8tniqsbHVkRvLOvbidVp7
         RR1w==
X-Forwarded-Encrypted: i=1; AJvYcCWH1x7pkKUiUw38I26nphqdEGyGoiQ6si3vsaNmYDk9P+FzfV5dUUX72wU5kgeL0v59VphG@lists.linux.dev
X-Gm-Message-State: AOJu0Ywt6len1eDJEdpAw1lyTYq8BzDDG8x8oPuUIQmWe4BK8NBmMzb5
	aS6l9a3mptdoAgkhC0lADx8MbkqGGSlH+yZlh2vdGSto7ETJy+i71Pt313iFI1D1wdAmhNSrTP4
	Zo9K52A==
X-Google-Smtp-Source: AGHT+IENajIP32nGxFM0VFkKXqErBuQpYWc46Ni8szy3vhHn4bDuMStRS5BfINva+xTIFK/Nmc3Oq8aYUx+T
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:807b:be79:d5c3:ee5c])
 (user=irogers job=sendgmr) by 2002:a81:c807:0:b0:6f2:8819:2318 with SMTP id
 00721157ae682-6f6eb93c63emr362427b3.5.1737527153324; Tue, 21 Jan 2025
 22:25:53 -0800 (PST)
Date: Tue, 21 Jan 2025 22:23:30 -0800
In-Reply-To: <20250122062332.577009-1-irogers@google.com>
Message-Id: <20250122062332.577009-16-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250122062332.577009-1-irogers@google.com>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Subject: [PATCH v2 15/17] perf build: Remove unused defines
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
2.48.0.rc2.279.g1de40edade-goog

