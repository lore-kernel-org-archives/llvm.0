Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0907A
	for <llvm@lists.linux.dev>; Thu, 10 Mar 2022 06:19:21 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id c192so2604222wma.4
        for <llvm@lists.linux.dev>; Wed, 09 Mar 2022 22:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hK3i648v5ZRE0u4MjHqsn4u0/9AEYQ3KjKpmR6d4Ca0=;
        b=eUg52CM/HBJNtxq0M1QzN9jctEijngYy/DGxazUSwGYjQLaztjTRMRPQ08epOUfXXs
         0mTlYilpJoocy1Wm1VANEm4yUAzCNM9r62S2NjZIdUD9e19QyJPmZonkEusTOUkmAlla
         UDN13lgOoDDH73/fsmalKiVA04Ljf20quSR5dzc8S3XhXi3/BCxaXxJRgW6kunZJYJBT
         sb68giQPubBxPk3wbbV59pos62YZvTKz/Ll3jXqfZl59yxtnF5pjp9fl4M81J61YGUb8
         E3zH4d45lFJvdfneB/WnRH+UtsNDEju6WlkwPaI3oAi6ERxC3SLe+sBYlIsDa21MjK4m
         SegA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hK3i648v5ZRE0u4MjHqsn4u0/9AEYQ3KjKpmR6d4Ca0=;
        b=ouFe3iYW82UB9twCXBqDIB80m6GO3JeciPwrt9Ka+f1nCZTuvYCKKYKP1i8op8Kp6E
         93DySZL2Ny93D1wo2EGUadgif1SqEynnQGCE37bsaSB1OiWGJtSbqZsFS7qSvWZn2K9/
         BKvF+CLLtP3YBYosbyk5ElAGs8OeQZrDA2S7119nnWtJIYynRKHH75P6QdNDalzTyGiq
         NUi1E2rXREfE1wjZhC2BDqbEB8aDuIwoRulQGZvhjmhRFcolfa539QjPAxnjydjF5v6k
         f2taOE3itjU1TzxzOuyqArfH2lWedv3t7fvEXzJa0IZGpSl0iCalMbAYtOsd50B9yOTk
         NQEA==
X-Gm-Message-State: AOAM533ZBQfkfHK1lpvV2bfCNnbisX/CMCVLIeDLlK82UXRI1hzYhaLw
	SQb5FSLh4zT5ozOZl1G83Kg=
X-Google-Smtp-Source: ABdhPJxAhcjgVxeXrz8BV8hZBn7P/icuke3Yd8rG4bfw9T/tQdwR3SThnGaU84eW4VlPqRYtYsfp5Q==
X-Received: by 2002:a05:600c:214a:b0:385:9c42:848 with SMTP id v10-20020a05600c214a00b003859c420848mr2227655wml.176.1646893159959;
        Wed, 09 Mar 2022 22:19:19 -0800 (PST)
Received: from localhost.localdomain ([2a02:3035:40a:e40c:8335:59f7:b7d4:4936])
        by smtp.gmail.com with ESMTPSA id l10-20020a056000022a00b001f017dfb5cdsm4415885wrz.90.2022.03.09.22.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 22:19:19 -0800 (PST)
From: Sedat Dilek <sedat.dilek@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Ian Rogers <irogers@google.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Fangrui Song <maskray@google.com>,
	Jiri Olsa <jolsa@redhat.com>,
	Michael Petlan <mpetlan@redhat.com>,
	Leo Yan <leo.yan@linaro.org>,
	John Keeping <john@metanate.com>,
	Sedat Dilek <sedat.dilek@gmail.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Jiri Olsa <olsajiri@gmail.com>,
	Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
Subject: [PATCH] tools: feature/test-libperl.c: Sync PERL_EMBED_CCOPTS with perf
Date: Thu, 10 Mar 2022 07:19:09 +0100
Message-Id: <20220310061909.20166-1-sedat.dilek@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When trying to build perf with a LLVM/Clang toolchain people see errors
when testing for libperl feature.

Jiri reports:

> I'm getting some other lto related error:
>
>         $ cat test-libperl.make.output
>         clang-13: error: optimization flag '-ffat-lto-objects' is not supported [-Werror,-Wignored-optimization-argument]
>

The reason is PERL_EMBED_CCOPTS is defined in two places:

tools/build/feature/Makefile
tools/perf/Makefile.config

As an result FLAGS_PERL_EMBED is set differently.

For building perf '-ffat-lto-objects' is filtered-out:

$ git grep ffat-lto-objects tools/perf/
tools/perf/Makefile.config:  PERL_EMBED_CCOPTS := $(filter-out -flto=auto -ffat-lto-objects, $(PERL_EMBED_CCOPTS))

Sync PERL_EMBED_CCOPTS in tools/build/feature/Makefile to fix this.

For a minimal fix for Linux v5.17 this here was preferred by Arnaldo.

Link: https://marc.info/?t=164646683300002&r=1&w=2
Reported-by: Jiri Olsa <olsajiri@gmail.com>
Reported-by: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
Tested-by: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
Suggested-by: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
Signed-off-by: Sedat Dilek <sedat.dilek@gmail.com>
---
 tools/build/feature/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/build/feature/Makefile b/tools/build/feature/Makefile
index 1480910c792e..869073cf8449 100644
--- a/tools/build/feature/Makefile
+++ b/tools/build/feature/Makefile
@@ -218,6 +218,7 @@ PERL_EMBED_LDOPTS = $(shell perl -MExtUtils::Embed -e ldopts 2>/dev/null)
 PERL_EMBED_LDFLAGS = $(call strip-libs,$(PERL_EMBED_LDOPTS))
 PERL_EMBED_LIBADD = $(call grep-libs,$(PERL_EMBED_LDOPTS))
 PERL_EMBED_CCOPTS = `perl -MExtUtils::Embed -e ccopts 2>/dev/null`
+PERL_EMBED_CCOPTS := $(filter-out -ffat-lto-objects, $(PERL_EMBED_CCOPTS))
 FLAGS_PERL_EMBED=$(PERL_EMBED_CCOPTS) $(PERL_EMBED_LDOPTS)
 
 $(OUTPUT)test-libperl.bin:
-- 
2.35.1

