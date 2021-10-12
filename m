Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFFE2C80
	for <llvm@lists.linux.dev>; Tue, 12 Oct 2021 02:13:27 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id p8-20020a056902114800b005bad2571fbeso14117291ybu.23
        for <llvm@lists.linux.dev>; Mon, 11 Oct 2021 19:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=KXLwmwE4TrX9P6IfHZohm8oMSZRK5w3cuXTwrGX29F8=;
        b=s6h5WrvxdhfH8nPtVCEp6yhLe6ki5NJkW+X0HSOkzIm7FaG/nM7ZNv4StjZs3cN8qx
         FYoTKqfmeGy1MOSKo4Q3i6O/q+MKGpflPvh5SsGZAiM04or+oe6FezB+360Ra+pE1ixN
         JaTWixNi5478C09QmtT0KvRY0s8sVz7n6uvkw0q0Izaa5TRFMr6Ffoi6p2mTBsI3dpmh
         EW2qhP9uhfo1hM+x2ZIwOofiN5n6fennQEE+QzRa4olAEQlrPOhBqZX4WRVDHlIyX823
         Kn1FtbQ7jgS08c37hYUeN5p8Mg5YoDME/EROZCWDuFw96pXQoEgVtBMmQUBxVITKn78/
         DWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=KXLwmwE4TrX9P6IfHZohm8oMSZRK5w3cuXTwrGX29F8=;
        b=6geZrpX4YRYLHr/LihqGfgjDvx+8047I6tKH/Zdso7l+NDQOxmsAtATJVM60a7K6zx
         P6/syxA5LlTVfU3IUdv1XMyrqzPU3cymGBHhh0glHy5XMX12hz2nQt8h5kYnilnX0gtQ
         Paco8XEjcD2dePkjy7tPvcIpE0ng7SEiQenRAae90aHpqLICzOo+bUc6ct3tY7V0i4QC
         rxzn1CSSAAfgvS4b7JlUtLZhUScuJgYvWlbmnc9853sXyJYgbI+iiKUag5YootvB8cFF
         o8g1ilhz6ZjOhjVPoKjNzu9+hFaOR/TvHzfqLPONXmISNm8cNhh9jn4EZcZL1l6CEjOr
         G2Hw==
X-Gm-Message-State: AOAM5320IkftI4GLSA1b80VIza4UVxRdnI+NFRPvqr3ZrGW2n7kPUL+l
	QRRvhSX09tCJHC7GJ4ZWDfQEJNE/Cdv6
X-Google-Smtp-Source: ABdhPJxfuUu/Fl1OhTq4pm+CzhQzuD9E4KsYwVBblC10vTGer3AmqY3riet4zRq0i5pEY9PK3+keIiba7UVd
X-Received: from irogers.svl.corp.google.com ([2620:15c:2cd:202:2ad2:cb91:6fbd:a6f2])
 (user=irogers job=sendgmr) by 2002:a25:cc4a:: with SMTP id
 l71mr24630825ybf.41.1634004806327; Mon, 11 Oct 2021 19:13:26 -0700 (PDT)
Date: Mon, 11 Oct 2021 19:13:20 -0700
Message-Id: <20211012021321.291635-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 1/2] tools: Bump minimum LLVM C++ std to GNU++14
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, 
	Namhyung Kim <namhyung@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Leo Yan <leo.yan@linaro.org>, Michael Petlan <mpetlan@redhat.com>, 
	Sedat Dilek <sedat.dilek@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev, 
	Fangrui Song <maskray@google.com>
Cc: Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

LLVM 9 (current release is LLVM 13) moved the minimum C++ version to
GNU++14. Bump the version numbers in the feature test and perf build.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/build/feature/Makefile | 6 +++---
 tools/perf/Makefile.config   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/build/feature/Makefile b/tools/build/feature/Makefile
index d024b5204ba0..19f145a35a43 100644
--- a/tools/build/feature/Makefile
+++ b/tools/build/feature/Makefile
@@ -300,7 +300,7 @@ $(OUTPUT)test-jvmti-cmlr.bin:
 	$(BUILD)
 
 $(OUTPUT)test-llvm.bin:
-	$(BUILDXX) -std=gnu++11 				\
+	$(BUILDXX) -std=gnu++14 				\
 		-I$(shell $(LLVM_CONFIG) --includedir) 		\
 		-L$(shell $(LLVM_CONFIG) --libdir)		\
 		$(shell $(LLVM_CONFIG) --libs Core BPF)		\
@@ -308,12 +308,12 @@ $(OUTPUT)test-llvm.bin:
 		> $(@:.bin=.make.output) 2>&1
 
 $(OUTPUT)test-llvm-version.bin:
-	$(BUILDXX) -std=gnu++11 				\
+	$(BUILDXX) -std=gnu++14					\
 		-I$(shell $(LLVM_CONFIG) --includedir)		\
 		> $(@:.bin=.make.output) 2>&1
 
 $(OUTPUT)test-clang.bin:
-	$(BUILDXX) -std=gnu++11 				\
+	$(BUILDXX) -std=gnu++14					\
 		-I$(shell $(LLVM_CONFIG) --includedir) 		\
 		-L$(shell $(LLVM_CONFIG) --libdir)		\
 		-Wl,--start-group -lclangBasic -lclangDriver	\
diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 0ae2e3d8b832..86be3f6ec018 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -285,7 +285,7 @@ CORE_CFLAGS += -Wall
 CORE_CFLAGS += -Wextra
 CORE_CFLAGS += -std=gnu99
 
-CXXFLAGS += -std=gnu++11 -fno-exceptions -fno-rtti
+CXXFLAGS += -std=gnu++14 -fno-exceptions -fno-rtti
 CXXFLAGS += -Wall
 CXXFLAGS += -fno-omit-frame-pointer
 CXXFLAGS += -ggdb3
-- 
2.33.0.882.g93a45727a2-goog

