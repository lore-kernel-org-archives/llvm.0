Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992427B
	for <llvm@lists.linux.dev>; Sat, 11 Mar 2023 06:59:56 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id i11-20020a256d0b000000b0086349255277so8155586ybc.8
        for <llvm@lists.linux.dev>; Fri, 10 Mar 2023 22:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678517995;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=suA+bwgJNWM1ViYRwliFKAa9dMDLpk9Qwp1WJkMdxcc=;
        b=CQZt3tWjAs16t6INtGV8MfbsFPXnxShEd3XQr0Eg2M1Lq8aK2hi5j69UBZR4nZvzQk
         s70YdoH35sqKBKPjWDpSYMFsqUFh0N/2F4nVGpQMSCBVJcFiDIavD87dGD04hX8KnzQO
         872HqHIhAoE6Y39RvB4exu295r38ilJ6XdN22SVd+X4CzDldEZzpLwiDUDuJgFIXo2JB
         DQ0r3g7RnmpHwriEWOT1iX4UDptqU27wyA0chat1UyI4L+vzaMegrBm+fA9mCexnzQb/
         ProMYdMUTJIItTVUbMrA9mEo6o7msjnB11hVk/pqvLYWAGyciPvgRwd37MCBKBNz7Hbl
         l1Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678517995;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=suA+bwgJNWM1ViYRwliFKAa9dMDLpk9Qwp1WJkMdxcc=;
        b=sEbjbNdbn/ztaDBB5H0F/4gm9oQ5s0H2yM/a871HaCXdTQZdtt5kGIgqajZTLy8Xb5
         tQ3vxL6DkjO3INTbXjoyMoPtCm2M5vgyHgDPu9p0LCy/t1wDaZ7fyizO7EG3LgfIBDKn
         VmYZKj4GstKkWWnn7wlLwbYPlv4RetSh+jAQUyDPQz9dfqIwwDIlvT//s8FtxzENnSxa
         0XcUm0c9f/SZz9rj4hDpWeROBmlf8RD80LshvJK65WQ1IR+6A1GIFHI/03IVhvHTArx/
         +bfc8+pljktZRMpzOCLmj58nU4qAwTaD/phu9AGjscBP2tDiiX8fP988kCJtSvxk2JrM
         W0dA==
X-Gm-Message-State: AO0yUKXdUNrqCKrTDdXfkKpXUP+WnLqCaTfSw1MRfkSWctVNFz0t8iW5
	9LpOGj/Py8FORCFkOEOxfQFrdfOdahZA
X-Google-Smtp-Source: AK7set9XTSaarIquORnK+0yBheQDbBcFerJD4i+/DeqYN6jDbj3frYgSC1/aA5aOMWmcLWCqwpOpNALBFmcU
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:a11d:a763:a328:f2d6])
 (user=irogers job=sendgmr) by 2002:a81:a983:0:b0:52e:e095:d840 with SMTP id
 g125-20020a81a983000000b0052ee095d840mr18667452ywh.0.1678517995660; Fri, 10
 Mar 2023 22:59:55 -0800 (PST)
Date: Fri, 10 Mar 2023 22:57:53 -0800
In-Reply-To: <20230311065753.3012826-1-irogers@google.com>
Message-Id: <20230311065753.3012826-14-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230311065753.3012826-1-irogers@google.com>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Subject: [PATCH v1 13/13] perf build: Remove redundant NO_NEWT build option
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Roberto Sassu <roberto.sassu@huawei.com>, Quentin Monnet <quentin@isovalent.com>, 
	Andres Freund <andres@anarazel.de>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Pavithra Gurushankar <gpavithrasha@gmail.com>, Yang Jihong <yangjihong1@huawei.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@linaro.org>, 
	"=?UTF-8?q?Martin=20Li=C5=A1ka?=" <mliska@suse.cz>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev
Cc: Stephane Eranian <eranian@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

The option controlled nothing and no code depends, conditional or
otherwise, on libnewt.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.config | 4 ----
 tools/perf/Makefile.perf   | 2 --
 tools/perf/tests/make      | 6 ++----
 3 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 1b598c5e68eb..b7a9cb4a3526 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -752,10 +752,6 @@ ifndef NO_LIBCRYPTO
   endif
 endif
 
-ifdef NO_NEWT
-  NO_SLANG=1
-endif
-
 ifndef NO_SLANG
   ifneq ($(feature-libslang), 1)
     ifneq ($(feature-libslang-include-subdir), 1)
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 3e06915f6bd0..dc9dda09b076 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -44,8 +44,6 @@ include ../scripts/utilities.mak
 #
 # Define WERROR=0 to disable treating any warnings as errors.
 #
-# Define NO_NEWT if you do not want TUI support. (deprecated)
-#
 # Define NO_SLANG if you do not want TUI support.
 #
 # Define GTK2 if you want GTK+ GUI support.
diff --git a/tools/perf/tests/make b/tools/perf/tests/make
index 47c665659022..a74b4be446c6 100644
--- a/tools/perf/tests/make
+++ b/tools/perf/tests/make
@@ -72,10 +72,9 @@ make_nondistro      := BUILD_NONDISTRO=1
 make_no_libperl     := NO_LIBPERL=1
 make_no_libpython   := NO_LIBPYTHON=1
 make_no_scripts     := NO_LIBPYTHON=1 NO_LIBPERL=1
-make_no_newt        := NO_NEWT=1
 make_no_slang       := NO_SLANG=1
 make_no_gtk2        := NO_GTK2=1
-make_no_ui          := NO_NEWT=1 NO_SLANG=1 NO_GTK2=1
+make_no_ui          := NO_SLANG=1 NO_GTK2=1
 make_no_demangle    := NO_DEMANGLE=1
 make_no_libelf      := NO_LIBELF=1
 make_no_libunwind   := NO_LIBUNWIND=1
@@ -115,7 +114,7 @@ make_install_prefix_slash := install prefix=/tmp/krava/
 make_static         := LDFLAGS=-static NO_PERF_READ_VDSO32=1 NO_PERF_READ_VDSOX32=1 NO_JVMTI=1
 
 # all the NO_* variable combined
-make_minimal        := NO_LIBPERL=1 NO_LIBPYTHON=1 NO_NEWT=1 NO_GTK2=1
+make_minimal        := NO_LIBPERL=1 NO_LIBPYTHON=1 NO_GTK2=1
 make_minimal        += NO_DEMANGLE=1 NO_LIBELF=1 NO_LIBUNWIND=1 NO_BACKTRACE=1
 make_minimal        += NO_LIBNUMA=1 NO_LIBAUDIT=1 NO_LIBBIONIC=1
 make_minimal        += NO_LIBDW_DWARF_UNWIND=1 NO_AUXTRACE=1 NO_LIBBPF=1
@@ -139,7 +138,6 @@ run += make_nondistro
 run += make_no_libperl
 run += make_no_libpython
 run += make_no_scripts
-run += make_no_newt
 run += make_no_slang
 run += make_no_gtk2
 run += make_no_ui
-- 
2.40.0.rc1.284.g88254d51c5-goog

