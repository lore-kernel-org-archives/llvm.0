Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832D97B
	for <llvm@lists.linux.dev>; Sat, 11 Mar 2023 06:59:05 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-5411f21f849so17355317b3.16
        for <llvm@lists.linux.dev>; Fri, 10 Mar 2023 22:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678517945;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TeLjpZEBElZPq770pHQ3cqTtDu48PrMd6iajkLxZXoU=;
        b=Ua++G/pPd+SVDJwvl19ZJsDG1Or/TZ/BFSKNdrAmYWdlWCZ/iFomFaBUwI0T5lTgOm
         xWfKU5/Bwli59xtjTjo+LvLnIbOmWR8cgnp7hb1NjIlSzo+khMAZRqdJ7g6wNgAZ//6K
         oZdtIP7+Kdy3nvqTB6B04pijjfOeie0Hf1QccsJhVwceP78G/J1wbT+FQNpjgHIfl+OH
         FWBtsQo9zfspq9m+CreQOdsqyBGbr0Q2nNsJRtvkSqrHutbXWoGADqwcJbESnMQDEnv1
         oiiRTPBevzcT/2RXis5IoSDZyeRElEE8Uf3/yhtx94aYTkUDApVo7blkQ5nkkY/NTzAm
         cpBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678517945;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TeLjpZEBElZPq770pHQ3cqTtDu48PrMd6iajkLxZXoU=;
        b=oMM0jQZ2Mph0HNrCWs6DcL76XsCW+uUyMgh+oCR4GxlJxdhDGukBDwlJWTqDumE2H6
         ChEmUAyrfZZyerEDCm461poyrHM8C9Euv7Tr7pd790MqQn2xsQhvM1bTQ0mwAy5/d21r
         U1dL9eTTjExa4DAi8qw2LTeVynkfB/Dp4p5w8rDMoogGOe+WxMoBoxeuaPZo9kWJGgZJ
         OY9LLtSSZq7rMAL4rOdeAOyXNThkznpQbFK0AmD7yDrbJCS1CoPxt2urHP8Zu7NkWoUq
         brPMymQgG6eUpQI/Yyr2Gk7COuYD8offCUD1ogo4rkJQmphixnxU5eam77v0lpHWSw7M
         QO1A==
X-Gm-Message-State: AO0yUKUF5T8tFyPhpAk4k8wGi/mTKYcORPJ1mv964oRVYKQoSBHSUoCS
	AyaqGoVNGMBJpV/dA7OeKnhhc1zYEqOk
X-Google-Smtp-Source: AK7set/6+p+yFgDiDQyRYorbvgodf9XCwu4OA2mDN8JFQ4h3Y3vVuSxNelxVt3B5EzESzr56CUvMk0R6m5mw
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:a11d:a763:a328:f2d6])
 (user=irogers job=sendgmr) by 2002:a81:4328:0:b0:541:642f:709c with SMTP id
 q40-20020a814328000000b00541642f709cmr2ywa.388.1678517944974; Fri, 10 Mar
 2023 22:59:04 -0800 (PST)
Date: Fri, 10 Mar 2023 22:57:48 -0800
In-Reply-To: <20230311065753.3012826-1-irogers@google.com>
Message-Id: <20230311065753.3012826-9-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230311065753.3012826-1-irogers@google.com>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Subject: [PATCH v1 08/13] tools build: Add feature test for abi::__cxa_demangle
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

cxxabi.h is part of libsdtc++ and LLVM's libcxx, providing
abi::__cxa_demangle a portable C++ demangler. Add a feature test to
detect that the function is available.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/build/Makefile.feature              |  1 +
 tools/build/feature/Makefile              |  4 ++++
 tools/build/feature/test-cxa-demangle.cpp | 17 +++++++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100644 tools/build/feature/test-cxa-demangle.cpp

diff --git a/tools/build/Makefile.feature b/tools/build/Makefile.feature
index 38f8851bd7cb..214622d7537c 100644
--- a/tools/build/Makefile.feature
+++ b/tools/build/Makefile.feature
@@ -80,6 +80,7 @@ FEATURE_TESTS_EXTRA :=                  \
          compile-32                     \
          compile-x32                    \
          cplus-demangle                 \
+         cxa-demangle                   \
          gtk2                           \
          gtk2-infobar                   \
          hello                          \
diff --git a/tools/build/feature/Makefile b/tools/build/feature/Makefile
index dc9323e01e42..0a3b9281f8b0 100644
--- a/tools/build/feature/Makefile
+++ b/tools/build/feature/Makefile
@@ -23,6 +23,7 @@ FILES=                                          \
          test-libbfd-liberty.bin                \
          test-libbfd-liberty-z.bin              \
          test-cplus-demangle.bin                \
+         test-cxa-demangle.bin                  \
          test-libcap.bin			\
          test-libelf.bin                        \
          test-libelf-getphdrnum.bin             \
@@ -262,6 +263,9 @@ $(OUTPUT)test-libbfd-liberty-z.bin:
 $(OUTPUT)test-cplus-demangle.bin:
 	$(BUILD) -liberty
 
+$(OUTPUT)test-cxa-demangle.bin:
+	$(BUILDXX)
+
 $(OUTPUT)test-backtrace.bin:
 	$(BUILD)
 
diff --git a/tools/build/feature/test-cxa-demangle.cpp b/tools/build/feature/test-cxa-demangle.cpp
new file mode 100644
index 000000000000..a3e712f65c37
--- /dev/null
+++ b/tools/build/feature/test-cxa-demangle.cpp
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <stdio.h>
+#include <stdlib.h>
+#include <cxxabi.h>
+
+int main(void)
+{
+  size_t len = 256;
+  char *output = (char*)malloc(len);
+        int status;
+
+        output = abi::__cxa_demangle("FieldName__9ClassNameFd", output, &len, &status);
+
+        printf("demangled symbol: {%s}\n", output);
+
+        return 0;
+}
-- 
2.40.0.rc1.284.g88254d51c5-goog

