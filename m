Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B1E7E
	for <llvm@lists.linux.dev>; Fri, 11 Mar 2022 05:45:19 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id v130-20020a1cac88000000b00389d0a5c511so424669wme.5
        for <llvm@lists.linux.dev>; Thu, 10 Mar 2022 21:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=11FvPvpUVotQ9jY+zQvOHGZO2byI0bkimo/rEQnPxJE=;
        b=ekozbChKbpW8GZL9kUFBEDUxX05BOSH5K9gUF2d9I0XZ4OI7yg7wjlBL75B3Uxqbn1
         mmUTiRDhPalAbzG0/H2FxM2m+IBTS8Lt7RSuU9vYAwovoN7/bgwvWzgkJJT2q7dhA+s7
         dKiIo2z7yyBCoUqIgknT1iN5tDFgheAanLnZRPY3RCn/HrCN+x3RoGItWYnFeea2gXRA
         XQ9qzYAmAO6ow9mtiMMoiOrjs2F9SVxruHVkOb/2szt3vmwML8Ld73jiDkqPVaxRDSPR
         rpVacc7gtvg+4Eq23IILSLyKfcXj/j9xzWHGabYlbZFSngIX1SD1J1vxdgsRq9K+m+X+
         cRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=11FvPvpUVotQ9jY+zQvOHGZO2byI0bkimo/rEQnPxJE=;
        b=BZ8BKPwa+A6Sj1cZPz3YyJvttt9OU1S9bIXUUilWNTwN8CE/fHFS+SgVwtLUYyhHZR
         NyU2qd6PMHvRo4pSmRP9XbyXX9mtl2BErhbVUZBmubQwyg+NnYw5XrgjX/DpKACs4i1h
         v8HMyz4BuJapBzeftgrCNm4uDFTv1toy0rgkUw7Es8uc5W6yYnZ1EF4XfjcIoYCBHvfj
         4tkxxaKPJyy1Dq5TIqxp/V8Dtr8L/PGVO8I8yU6Js9awBlY0yPfI0K9NregqLivJDeLo
         oShcDYUuEnA0tKDrqqoB9umPNP4mQqQ+pkNlHt5DqAQxNunCth83l3DjcPh3sluV80nM
         WMyg==
X-Gm-Message-State: AOAM531WiafCQXyWYZ8GVSyuPdW8EZvBRci4nEbECrLdCc1ql9SxjUst
	v5tU9xHiYHIPeDA8Wd54Rkw=
X-Google-Smtp-Source: ABdhPJxvBwFmzse2Kx1hsyFAMg8k8RWVvVr0RzVZVok/Ojk1rmfowT0jWel05bJdkcDXj2WeQlwdDQ==
X-Received: by 2002:a7b:c150:0:b0:389:95ee:4a20 with SMTP id z16-20020a7bc150000000b0038995ee4a20mr6220285wmi.145.1646977518091;
        Thu, 10 Mar 2022 21:45:18 -0800 (PST)
Received: from localhost.localdomain ([2a02:3035:40f:58f5:e8dd:8a44:b12a:d7ed])
        by smtp.gmail.com with ESMTPSA id f15-20020a0560001a8f00b0020397ea11d2sm352593wry.20.2022.03.10.21.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 21:45:17 -0800 (PST)
From: Sedat Dilek <sedat.dilek@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Ian Rogers <irogers@google.com>,
	Sedat Dilek <sedat.dilek@gmail.com>,
	Leo Yan <leo.yan@linaro.org>,
	John Keeping <john@metanate.com>,
	Michael Petlan <mpetlan@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Jiri Olsa <olsajiri@gmail.com>,
	Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
Subject: [PATCH 5.17] tools: feature/test-libperl.c: Sync PERL_EMBED_CCOPTS with perf
Date: Fri, 11 Mar 2022 06:44:55 +0100
Message-Id: <20220311054455.5911-1-sedat.dilek@gmail.com>
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

As a result FLAGS_PERL_EMBED is set differently.

For building perf '-ffat-lto-objects' is filtered out:

$ git grep ffat-lto-objects tools/perf/
tools/perf/Makefile.config:  PERL_EMBED_CCOPTS := $(filter-out -flto=auto -ffat-lto-objects, $(PERL_EMBED_CCOPTS))

Sync PERL_EMBED_CCOPTS in tools/build/feature/Makefile to fix this.

For a minimal fix for Linux v5.17 this here was preferred by Arnaldo.

Link: https://lore.kernel.org/lkml/CA+icZUWHd4VTKNwBtuxt9-fHoiYV+Q7tQ809Cn83k8sbQ_uNHw@mail.gmail.com/
Reported-by: Jiri Olsa <olsajiri@gmail.com>
Reported-by: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
Tested-by: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
Suggested-by: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Sedat Dilek <sedat.dilek@gmail.com>
---
Changes v1->v2:
- Fix some typos and use lore link as requested by Nick
- Add credits for Nick

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

