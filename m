Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479CA72
	for <llvm@lists.linux.dev>; Mon, 11 Oct 2021 23:24:52 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id z2-20020a254c02000000b005b68ef4fe24so25133008yba.11
        for <llvm@lists.linux.dev>; Mon, 11 Oct 2021 16:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=KXLwmwE4TrX9P6IfHZohm8oMSZRK5w3cuXTwrGX29F8=;
        b=et1Sxb65m9+vwLlfkIKKA7Y1J6IaM8BqdoCZ7ieLpPXx6cJfvUiCeZkiBmh3fDhCE2
         np7gIlRc/QDO3MpZCagM2OjOh8EGp7rct8ERiMkv806ee/7oCPXhMwoLzYzPo3QLc5XL
         1ZG+E8DRnnw1a1yldfTyyUMG0mHug4CgkcgENBj5AUtd+dnpaGb/Q6m6SUmuLAe2I0ip
         EnSwNmalP1m+kNGqj6b0tlZk4yMV80Eje2YbJpZcD869A8SvSgim5wCrcqPvo3dIhAnD
         MOQv/+qxBHp7R+ZI1c/ECvewReMmJapvzey8kPxNEu3AR5AUp32a97D+OO22O0lBidKd
         binA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=KXLwmwE4TrX9P6IfHZohm8oMSZRK5w3cuXTwrGX29F8=;
        b=C+rS8qp85G4Jc4kQIBbWTpM8o53roynSZXTDbl4qw+rjn1BlScYZZST/cOrxeyrPj9
         YNRNJ+rgazmq9TcNCLqwYLU6vd/sRJ0EiRBPzsVR/l7vefXF5E/TjpYyNMxo7Hq/wD7i
         TG+wVI8dfueY45mHF/6bDdhbZQUDCJWL/ZRCENsEEeZcPFOgtFHEe/4GYCpodmLD9da3
         AuW2ML62bINvFLfWuhV7T+KAuv5AaN/0hbkzP8wtD1oNxq0LfBT7h3fGV4QjurqydJ9y
         oPE6xdSmHAozX0kJkkOGHflfca8Y7x0pPJOLN/g56JdVXdGh02lBtsmk8ZuXj5Z3IbYT
         iajw==
X-Gm-Message-State: AOAM530Dt6fGEUvMlb6GcPB80HsT4HJE/Sp98A7z6nEQ3qVzxvVCMCV2
	d7i53i6l7yl04/P1CryYkZOoxbUnkOxa
X-Google-Smtp-Source: ABdhPJxjpmIG7Z9kRVv+wVHGTX+Bu5icxM6x4AUwcyjgIx3vrUdMnA5hCS/M6pFKkLWPh6kJO3qktAImSvTJ
X-Received: from irogers.svl.corp.google.com ([2620:15c:2cd:202:2ad2:cb91:6fbd:a6f2])
 (user=irogers job=sendgmr) by 2002:a25:1ec6:: with SMTP id
 e189mr25691573ybe.150.1633994691230; Mon, 11 Oct 2021 16:24:51 -0700 (PDT)
Date: Mon, 11 Oct 2021 16:24:45 -0700
Message-Id: <20211011232446.250195-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH 1/2] tools: Bump minimum LLVM C++ std to GNU++14
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, 
	Namhyung Kim <namhyung@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Leo Yan <leo.yan@linaro.org>, Michael Petlan <mpetlan@redhat.com>, 
	Sedat Dilek <sedat.dilek@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev
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

