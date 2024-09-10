Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510751946B5
	for <llvm@lists.linux.dev>; Tue, 10 Sep 2024 14:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725977077; cv=none; b=BFxXiWGeTZ8dGkGxu+EwIlsa/KJeoJsg4bvwOdF/wC9ZEp+BJ1yJJbfnmocxaTYXdlqjMcf2Bo7W7T40NDqDfqxdRTMMuyYLGYDXCcL71ctYwpYiXIhsXxIzjLwBnast4J0dNPQ0RRxk9fj7B2doki//vE4TJOiUEhfLftHS27M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725977077; c=relaxed/simple;
	bh=F+3xN50Pz9A4k2YYqRQMO8JrNu11JwVeJ1OvaPqgdzI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lsl05qgYXOkUX/Za04wYgsKMVJkE8hej68WatQYkD8Ee8yXyBVRpCq7EBYZLPVrSOP6h1hPcmwWqW70G2+SCC07BEDCmUOpE5isEkytiyGp7cTC/xUpWGCKv7UyXyzGSBzCrBM8l881v8s1fwwhx7kvumrldgH6D0EY6MsnluYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ICCTjgY/; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ICCTjgY/"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42cb60aff1eso23316415e9.0
        for <llvm@lists.linux.dev>; Tue, 10 Sep 2024 07:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725977073; x=1726581873; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uOdt2q5OQQq0fnpsmusq1WiM8KGsMYcRTNlceymvj2c=;
        b=ICCTjgY/qFkLEvgdxxHqIhN39tSn0lmMboyVTjcnKFfkOqYvfZTruUf8BsgP91Ajxb
         5TGYFITS1T8xG4Nk4kjtqk+imEDtoT6rQt7MgF8FFWLtUHfNCIU/NLVG9Wu7NebHvvHf
         c9rQQOTwmdM1KSSwpQGzqMAz2BTla68n70wOtO4pL9YWt/SyS4kRljFxcuQ4NrATfVhN
         XYKivP5LnYC3ehXvFSElV31zIOmIQcokZt+wJwauS4qpS3iIEfptatUfRvl/y3Xs0i1P
         G3oOC9oCScP3S15Tcj7R1vE5GXkRx/B1j/FieYr6yflLSfOnclPSOAIkbpd4tYiNhQST
         z+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725977073; x=1726581873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uOdt2q5OQQq0fnpsmusq1WiM8KGsMYcRTNlceymvj2c=;
        b=AVMXwOvo/R6FW8bSPiW1jiFyvmS3kYKuP1UBleR86rfkQDFI3sH7YCLZeuFCJ9+p2E
         JweWRkm6NxaLqJUH1VsFCEltqE5AUoHGcke3BHeWG5E2GeCOmLglGzUTn37NeFYHpbXM
         Djz9jb/joWd5Kk7RXFLkA6N+irtShV/27Wj/sqEk01UxsqIxxfUl+I6I5BxV0/hK77pn
         UqbOw1u28idnsBnwLlXkSoNaOmTZDBo6XmlSUKOOOxMrDu5NRMLBR2SG6CiEIKYDlCwl
         BFdYPYbQWUbwk0YrgXDmry/G7spR9gcjM3a9E0m6ls2Okj4mOYCWlGDpesHaLLWHM4zy
         EwvA==
X-Forwarded-Encrypted: i=1; AJvYcCWT94cxCsNo8mGVAgOjoWMPcqSCyY93KhcXjtA0TdySQNGaBVkTvxQL7YqrCV2x8Ke9vFB5@lists.linux.dev
X-Gm-Message-State: AOJu0YxtSWy30EOeeibkcjiaxbNPErLDPdLFaDdwut1HsiPcahjfSYyN
	DB7u3wrMV6McOMkW6hWc+9q88fTHbDxz7kbKvI9oGyfQ8rsAxq4+PdkNIi7OI2g=
X-Google-Smtp-Source: AGHT+IGORiGLrEeyYGhgnLQgi79SfNMK6glsR1EtuCJ21m2VIv4liW+ffPNjWEmUhtfxnf1aYaqbQQ==
X-Received: by 2002:a05:600c:1d1b:b0:42c:bf94:f9ad with SMTP id 5b1f17b1804b1-42cbf94fd2bmr21175985e9.34.1725977071885;
        Tue, 10 Sep 2024 07:04:31 -0700 (PDT)
Received: from localhost.localdomain ([89.47.253.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42caeb8b7f1sm114787075e9.48.2024.09.10.07.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 07:04:31 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
To: linux-perf-users@vger.kernel.org,
	sesse@google.com,
	acme@kernel.org
Cc: James Clark <james.clark@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Changbin Du <changbin.du@huawei.com>,
	Guilherme Amadio <amadio@gentoo.org>,
	Leo Yan <leo.yan@arm.com>,
	Manu Bretelle <chantr4@gmail.com>,
	Quentin Monnet <qmo@kernel.org>,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 1/2] perf build: Autodetect minimum required llvm-dev version
Date: Tue, 10 Sep 2024 15:04:00 +0100
Message-Id: <20240910140405.568791-1-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The new LLVM addr2line feature requires a minimum version of 13 to
compile. Add a feature check for the version so that NO_LLVM=1 doesn't
need to be explicitly added. Leave the existing llvm feature check
intact because it's used by tools other than Perf.

This fixes the following compilation error when the llvm-dev version
doesn't match:

  util/llvm-c-helpers.cpp: In function 'char* llvm_name_for_code(dso*, const char*, u64)':
  util/llvm-c-helpers.cpp:178:21: error: 'std::remove_reference_t<llvm::DILineInfo>' {aka 'struct llvm::DILineInfo'} has no member named 'StartAddress'
    178 |   addr, res_or_err->StartAddress ? *res_or_err->StartAddress : 0);

Fixes: c3f8644c21df ("perf report: Support LLVM for addr2line()")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/build/Makefile.feature           |  2 +-
 tools/build/feature/Makefile           |  9 +++++++++
 tools/build/feature/test-llvm-perf.cpp | 14 ++++++++++++++
 tools/perf/Makefile.config             |  6 +++---
 4 files changed, 27 insertions(+), 4 deletions(-)
 create mode 100644 tools/build/feature/test-llvm-perf.cpp

diff --git a/tools/build/Makefile.feature b/tools/build/Makefile.feature
index 0717e96d6a0e..427a9389e26c 100644
--- a/tools/build/Makefile.feature
+++ b/tools/build/Makefile.feature
@@ -136,7 +136,7 @@ FEATURE_DISPLAY ?=              \
          libunwind              \
          libdw-dwarf-unwind     \
          libcapstone            \
-         llvm                   \
+         llvm-perf              \
          zlib                   \
          lzma                   \
          get_cpuid              \
diff --git a/tools/build/feature/Makefile b/tools/build/feature/Makefile
index 12796808f07a..d6a98b3854f8 100644
--- a/tools/build/feature/Makefile
+++ b/tools/build/feature/Makefile
@@ -73,6 +73,7 @@ FILES=                                          \
          test-libopencsd.bin			\
          test-clang.bin				\
          test-llvm.bin				\
+         test-llvm-perf.bin   \
          test-llvm-version.bin			\
          test-libaio.bin			\
          test-libzstd.bin			\
@@ -388,6 +389,14 @@ $(OUTPUT)test-llvm.bin:
 		$(shell $(LLVM_CONFIG) --system-libs)		\
 		> $(@:.bin=.make.output) 2>&1
 
+$(OUTPUT)test-llvm-perf.bin:
+	$(BUILDXX) -std=gnu++17 				\
+		-I$(shell $(LLVM_CONFIG) --includedir) 		\
+		-L$(shell $(LLVM_CONFIG) --libdir)		\
+		$(shell $(LLVM_CONFIG) --libs Core BPF)		\
+		$(shell $(LLVM_CONFIG) --system-libs)		\
+		> $(@:.bin=.make.output) 2>&1
+
 $(OUTPUT)test-llvm-version.bin:
 	$(BUILDXX) -std=gnu++17					\
 		-I$(shell $(LLVM_CONFIG) --includedir)		\
diff --git a/tools/build/feature/test-llvm-perf.cpp b/tools/build/feature/test-llvm-perf.cpp
new file mode 100644
index 000000000000..a8cbb67e335e
--- /dev/null
+++ b/tools/build/feature/test-llvm-perf.cpp
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "llvm/Support/ManagedStatic.h"
+#include "llvm/Support/raw_ostream.h"
+
+#if LLVM_VERSION_MAJOR < 13
+# error "Perf requires llvm-devel/llvm-dev version 13 or greater"
+#endif
+
+int main()
+{
+	llvm::errs() << "Hello World!\n";
+	llvm::llvm_shutdown();
+	return 0;
+}
diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 7888c932b1b4..37e3eee2986e 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -981,8 +981,8 @@ ifdef BUILD_NONDISTRO
 endif
 
 ifndef NO_LIBLLVM
-  $(call feature_check,llvm)
-  ifeq ($(feature-llvm), 1)
+  $(call feature_check,llvm-perf)
+  ifeq ($(feature-llvm-perf), 1)
     CFLAGS += -DHAVE_LIBLLVM_SUPPORT
     CFLAGS += $(shell $(LLVM_CONFIG) --cflags)
     CXXFLAGS += -DHAVE_LIBLLVM_SUPPORT
@@ -992,7 +992,7 @@ ifndef NO_LIBLLVM
     EXTLIBS += -lstdc++
     $(call detected,CONFIG_LIBLLVM)
   else
-    $(warning No libllvm found, slower source file resolution, please install llvm-devel/llvm-dev)
+    $(warning No libllvm 13+ found, slower source file resolution, please install llvm-devel/llvm-dev)
     NO_LIBLLVM := 1
   endif
 endif
-- 
2.34.1

