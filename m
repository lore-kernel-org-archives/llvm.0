Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4BD436353;
	Tue, 16 Jun 2026 10:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781604898; cv=none; b=n40Dtn5YwqyWSBqHtTpl03Jtm0DtJbauCUdnIJNwh+VdIOM1SCmFKsqYztrUbrh4J5f1dtSvJftmbD1g+u6AEsvyCFNdYDth4j5mWLgw2m5a71XznHbu9WI4fAx5/MZV9NDJl59LtHUeEsv32iQs4u849XGgedgCgLh02hry+eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781604898; c=relaxed/simple;
	bh=rksqqppltRfps1C0V/kWm9Vp0O/XyQFsfHC+xDFl8Q4=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=C5kEoLX/lPpc0sGyjJyEiblKJdu7uLAL2VZCJeGAHf5Iac8Yk0LJAOeoPvqkLfnXtHszuTeGDnOkQRD9362ULp31lMC8VAzPPghwoY57+cROHNatKbT9PBei6sQ1I6ZemE6UXi0MU3+pWOewJawhRxENl8Y6K19js+/cZYsuGCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WfosOFMM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WfosOFMM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 331BD1F000E9;
	Tue, 16 Jun 2026 10:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781604897;
	bh=exNF4CJYOXCcegYmYdnsWdjTULcn10GZMXgGqPvoL2I=;
	h=Subject:To:Cc:From:Date:In-Reply-To;
	b=WfosOFMMpNL+s02yRqA6UgrtEiMPIOCUQTZpVEyFcQLXem3A7OG6EVEjn7wWTHTw3
	 ugCYl5MhKxv1JlKTGAgRbGmQ6u1Gm2dJIU+3weqKyK48jf7RzgRGa9N8JaZE2dgbJG
	 /Znq0RSuHIWaq0obEqd+eY8Ordhb7EiIJQYE/cZ0=
Subject: Patch "perf build: Remove -Wno-unused-but-set-variable from the flex flags when building with clang < 13.0.0" has been added to the 6.1-stable tree
To: acme@kernel.org,acme@redhat.com,adrian.hunter@intel.com,alexander.shishkin@linux.intel.com,bcm-kernel-feedback-list@broadcom.com,florian.fainelli@broadcom.com,gregkh@linuxfoundation.org,irogers@google.com,jolsa@kernel.org,llvm@lists.linux.dev,mark.rutland@arm.com,mingo@redhat.com,namhyung@kernel.org,nathan@kernel.org,ndesaulniers@google.com,peterz@infradead.org,trix@redhat.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 16 Jun 2026 15:43:44 +0530
In-Reply-To: <20260520163320.3073037-6-florian.fainelli@broadcom.com>
Message-ID: <2026061644-guileless-stunned-7d21@gregkh>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore


This is a note to let you know that I've just added the patch titled

    perf build: Remove -Wno-unused-but-set-variable from the flex flags when building with clang < 13.0.0

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     perf-build-remove-wno-unused-but-set-variable-from-the-flex-flags-when-building-with-clang-13.0.0.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-250209-greg=kroah.com@vger.kernel.org Wed May 20 22:59:29 2026
From: Florian Fainelli <florian.fainelli@broadcom.com>
Date: Wed, 20 May 2026 09:33:20 -0700
Subject: perf build: Remove -Wno-unused-but-set-variable from the flex flags when building with clang < 13.0.0
To: stable@vger.kernel.org
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, Adrian Hunter <adrian.hunter@intel.com>, Ian Rogers <irogers@google.com>, Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, linux-perf-users@vger.kernel.org (open list:PERFORMANCE EVENTS SUBSYSTEM), linux-kernel@vger.kernel.org (open list:PERFORMANCE EVENTS SUBSYSTEM), bpf@vger.kernel.org (open list:BPF [MISC]), llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT), bcm-kernel-feedback-list@broadcom.com
Message-ID: <20260520163320.3073037-6-florian.fainelli@broadcom.com>

From: Arnaldo Carvalho de Melo <acme@redhat.com>

clang < 13.0.0 doesn't grok -Wno-unused-but-set-variable, so just remove
it to avoid:

  error: unknown warning option '-Wno-unused-but-set-variable'; did you mean '-Wno-unused-const-variable'? [-Werror,-Wunknown-warning-option]
  make[4]: *** [/git/perf-6.5.0-rc4/tools/build/Makefile.build:128: /tmp/build/perf/util/pmu-flex.o] Error 1
  make[4]: *** Waiting for unfinished jobs....

Fixes: ddc8e4c966923ad1 ("perf build: Disable fewer bison warnings")
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Ian Rogers <irogers@google.com>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>
Link: https://lore.kernel.org/lkml/ZNUSWr52jUnVaaa%2F@kernel.org/
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 tools/perf/util/Build |   20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -1,3 +1,6 @@
+include $(srctree)/tools/scripts/Makefile.include
+include $(srctree)/tools/scripts/utilities.mak
+
 perf-y += arm64-frame-pointer-unwind-support.o
 perf-y += annotate.o
 perf-y += block-info.o
@@ -265,15 +268,22 @@ ifeq ($(FLEX_GE_26),1)
 else
   flex_flags := -w
 endif
-CFLAGS_parse-events-flex.o  += $(flex_flags)
-CFLAGS_pmu-flex.o           += $(flex_flags)
-CFLAGS_expr-flex.o          += $(flex_flags)
 
 # Some newer clang and gcc version complain about this
 # util/parse-events-bison.c:1317:9: error: variable 'parse_events_nerrs' set but not used [-Werror,-Wunused-but-set-variable]
 #  int yynerrs = 0;
 
 bison_flags := -DYYENABLE_NLS=0 -Wno-unused-but-set-variable
+
+# Old clangs don't grok -Wno-unused-but-set-variable, remove it
+ifeq ($(CC_NO_CLANG), 0)
+  CLANG_VERSION := $(shell $(CLANG) --version | head -1 | sed 's/.*clang version \([[:digit:]]\+.[[:digit:]]\+.[[:digit:]]\+\).*/\1/g')
+  ifeq ($(call version-lt3,$(CLANG_VERSION),13.0.0),1)
+    bison_flags := $(subst -Wno-unused-but-set-variable,,$(bison_flags))
+    flex_flags := $(subst -Wno-unused-but-set-variable,,$(flex_flags))
+  endif
+endif
+
 BISON_GE_382 := $(shell expr $(shell $(BISON) --version | grep bison | sed -e 's/.\+ \([0-9]\+\).\([0-9]\+\).\([0-9]\+\)/\1\2\3/g') \>\= 382)
 ifeq ($(BISON_GE_382),1)
   bison_flags += -Wno-switch-enum
@@ -286,6 +296,10 @@ ifeq ($(BISON_LT_381),1)
   bison_flags += -DYYNOMEM=YYABORT
 endif
 
+CFLAGS_parse-events-flex.o  += $(flex_flags)
+CFLAGS_pmu-flex.o           += $(flex_flags)
+CFLAGS_expr-flex.o          += $(flex_flags)
+
 CFLAGS_parse-events-bison.o += $(bison_flags)
 CFLAGS_pmu-bison.o          += -DYYLTYPE_IS_TRIVIAL=0 $(bison_flags)
 CFLAGS_expr-bison.o         += -DYYLTYPE_IS_TRIVIAL=0 $(bison_flags)


Patches currently in stable-queue which might be from florian.fainelli@broadcom.com are

queue-6.1/perf-build-remove-wno-unused-but-set-variable-from-the-flex-flags-when-building-with-clang-13.0.0.patch
queue-6.1/perf-build-conditionally-define-ndebug.patch
queue-6.1/perf-parse-events-make-yydebug-dependent-on-doing-a-debug-build.patch
queue-6.1/perf-build-disable-fewer-bison-warnings.patch
queue-6.1/tools-build-add-3-component-logical-version-comparators.patch
