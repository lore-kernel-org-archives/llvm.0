Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CDA7B
	for <llvm@lists.linux.dev>; Sat, 11 Mar 2023 06:59:20 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id j125-20020a25d283000000b008f257b16d71so8095516ybg.15
        for <llvm@lists.linux.dev>; Fri, 10 Mar 2023 22:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678517959;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UaJIIcBEzyZNOhgIC/lIx2fcWxamKUkNGMgdjyQDc5Y=;
        b=JbwMyb82arUwYsbpp+2CR3MOHnK4Bsgb7d87J6uyhp979D8l8HMxntJlXJ4Ze9lD8o
         iFmBbKwqDAo3XhKpHsyaZSNeXtsidCNlvJm0M4gN9mCD3eta1g0KxeorDAWq9p68P34H
         xeb/mr6jj4e0OdWAZrQOZphdhr2VY3Mdtb3Rj6aM9M/JVn0koMGGTASHDtYSHDlzwTUY
         3IyCYa58D7A0JflpKOIKrnlZTrtELd+rFMGtv4aiKRORbakk4zVXOML7dZQAJ7k3X2Hz
         VdhFBzRYTBm18iPXmY4AhKQIpdedyNTxP6bKwMYmVRtPEFAvg7WLEC32TfF36clrZ4+Z
         U3Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678517959;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UaJIIcBEzyZNOhgIC/lIx2fcWxamKUkNGMgdjyQDc5Y=;
        b=TIoV5HMW1zYMO9V6wheVdwp4EQnEW4mhoAX5HxnEsO7gYcOF3fqiTMMDnxlg3ZQwi9
         ODQaSEAB7+OP0XCWe8rRa5ljEsnvpIsg+XfMKihTv8EFtfVb9dbwEjKjS/+qJt8PpAEw
         OxneeCtt4kMK6ElQ0bbbpbrs/8upor6z8NfXmOHkzdKUkMVkKjJsObBhcAVsYzxVF5do
         J+xmJW8zGq5bkFs3eL85hqItH7rjSweoatUzW9MOS3DnKCyP+YOiG8V3uQmub0dOzx9j
         Lj6iHh9zcMepD1nuQDEktnGs/hM/G/tupHTg+ZR/zGdljTtj+SoLbtApHROJYGJXrSrs
         mBtg==
X-Gm-Message-State: AO0yUKWosQY95aWeoaEIZB5lZ2dchjYyLXvQMjiRbaJVP4Os673VidfB
	GW2hDYjQIUZIL7SKYI7e7NNHlgiECuAN
X-Google-Smtp-Source: AK7set8r7y5C4YRsyVKjA7xb6uMrDtNqf2buJwznbMCVbDT8O9J9H12jt+MiPLw/Ik+0AdXWYz2LqVnm5lPL
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:a11d:a763:a328:f2d6])
 (user=irogers job=sendgmr) by 2002:a81:ac28:0:b0:536:55e5:2eaa with SMTP id
 k40-20020a81ac28000000b0053655e52eaamr18111377ywh.3.1678517959721; Fri, 10
 Mar 2023 22:59:19 -0800 (PST)
Date: Fri, 10 Mar 2023 22:57:50 -0800
In-Reply-To: <20230311065753.3012826-1-irogers@google.com>
Message-Id: <20230311065753.3012826-11-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230311065753.3012826-1-irogers@google.com>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Subject: [PATCH v1 10/13] perf build: Switch libpfm4 to opt-out rather than opt-in
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

If libpfm4 passes the feature test, it would be nice to have it
enabled rather than also requiring the LIBPFM4=1 build flag.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.config | 3 +--
 tools/perf/Makefile.perf   | 2 +-
 tools/perf/tests/make      | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index fdeca45cf15f..9754218bd418 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -1130,7 +1130,7 @@ ifdef LIBCLANGLLVM
   endif
 endif
 
-ifdef LIBPFM4
+ifndef NO_LIBPFM4
   $(call feature_check,libpfm4)
   ifeq ($(feature-libpfm4), 1)
     CFLAGS += -DHAVE_LIBPFM
@@ -1139,7 +1139,6 @@ ifdef LIBPFM4
     $(call detected,CONFIG_LIBPFM4)
   else
     msg := $(warning libpfm4 not found, disables libpfm4 support. Please install libpfm4-dev);
-    NO_LIBPFM4 := 1
   endif
 endif
 
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index a35bc995d5d8..3e06915f6bd0 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -122,7 +122,7 @@ include ../scripts/utilities.mak
 # generated from the kernel .tbl or unistd.h files and use, if available, libaudit
 # for doing the conversions to/from strings/id.
 #
-# Define LIBPFM4 to enable libpfm4 events extension.
+# Define NO_LIBPFM4 to disable libpfm4 events extension.
 #
 # Define NO_LIBDEBUGINFOD if you do not want support debuginfod
 #
diff --git a/tools/perf/tests/make b/tools/perf/tests/make
index c2f74ed43418..47c665659022 100644
--- a/tools/perf/tests/make
+++ b/tools/perf/tests/make
@@ -94,7 +94,7 @@ make_with_coresight := CORESIGHT=1
 make_no_sdt	    := NO_SDT=1
 make_no_syscall_tbl := NO_SYSCALL_TABLE=1
 make_with_clangllvm := LIBCLANGLLVM=1
-make_with_libpfm4   := LIBPFM4=1
+make_no_libpfm4     := NO_LIBPFM4=1
 make_with_gtk2      := GTK2=1
 make_tags           := tags
 make_cscope         := cscope
@@ -161,7 +161,7 @@ run += make_no_syscall_tbl
 run += make_with_babeltrace
 run += make_with_coresight
 run += make_with_clangllvm
-run += make_with_libpfm4
+run += make_no_libpfm4
 run += make_help
 run += make_doc
 run += make_perf_o
-- 
2.40.0.rc1.284.g88254d51c5-goog

