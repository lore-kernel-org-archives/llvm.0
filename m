Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82C11FAF
	for <llvm@lists.linux.dev>; Fri, 28 Jul 2023 06:49:45 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-583b256faf5so29870037b3.1
        for <llvm@lists.linux.dev>; Thu, 27 Jul 2023 23:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690526984; x=1691131784;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C14Lkth5YhYGrilJLa3as9gLOwkujqv4yqaGCfXT1cI=;
        b=pTjgM814griVQd95nxRaERmRO4ta0it5y0NikLDzqte4Dxn2OcWCpUMVSOvdBGreHj
         PZJRS4r4rVxhf29d7VG6q96fZkFs1VfPbiGyiQrPDC6Q9vUxd2rIephumHnoDhePDv2s
         dZbeVLCAvL5Q+Mv4ZDP+F2ec55M3eGwo3vCBg8m30lXOcsi/8UbFGTLKyJw4IeRjmbFD
         kTV85zxQ5M5/yBE4/QrnJEK2Mn1TnBXO1PxDUJWAlKuX+PuB0RRx31rFWa82I+LvrfuM
         iww3QIxpJUoNGzIl7w8eydhXRjvGgmD818Sy6noQENKa3nyDJQixl0m0FI6X5wuwbhVr
         Gg0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690526984; x=1691131784;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C14Lkth5YhYGrilJLa3as9gLOwkujqv4yqaGCfXT1cI=;
        b=hMiZ6huyn8NZNH9AJfbCJJtxZ+RIXeJ4BkvpKFVM5ripIqT1bxAF22eHdyaOQpupxp
         1OC4zhUkoQRY2wrPUs5md4hHOsS1iwGgHZ82podeja0CFlRJpv/7JcsSc3e6WZMkMpxC
         czoO8gZeyS8+rAUJDzL5szC3U08izNYrYSXd3qPCKdQsSzfmGuJov5/keTcmMgHdGPCb
         SQ15VfyBfbevqx2nmWPIIyfM2rjUpxuz8YMNO8i2F1mrafKtXWPi2gj0ALT/79g+YYRS
         /X3u2fI9pTrQKHLfqIP9C7mW4BURgkpOOBuUta7UPnXQa//8frfL3UM94cPXo2YtQiUB
         Q5EQ==
X-Gm-Message-State: ABy/qLbt4pFDQuh6tFA/Ew4Il3Pbz7xLRvDUOnH4OI6cfXBw4tQo72w8
	aZ1cvYhpzcTb466UGc0aIGu7CJKIdDqe
X-Google-Smtp-Source: APBJJlHY5OrUkocwZKG462E8XmaFPEseNqQWvhpbV4IL+1aqabtUQ0n/nVuKjAoPgqFX/ErHS1qmqEk8D1gC
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:3d03:ff18:af30:2dad])
 (user=irogers job=sendgmr) by 2002:a81:c509:0:b0:583:9d8d:fb0d with SMTP id
 k9-20020a81c509000000b005839d8dfb0dmr10517ywi.0.1690526984540; Thu, 27 Jul
 2023 23:49:44 -0700 (PDT)
Date: Thu, 27 Jul 2023 23:49:12 -0700
In-Reply-To: <20230728064917.767761-1-irogers@google.com>
Message-Id: <20230728064917.767761-2-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230728064917.767761-1-irogers@google.com>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
Subject: [PATCH v1 1/6] perf bpf-loader: Remove unneeded diagnostic pragma
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Eduard Zingerman <eddyz87@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Gaosheng Cui <cuigaosheng1@huawei.com>, 
	Rob Herring <robh@kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Added during the progress to libbpf 1.0 the deprecated functions are
no longer used and so the pragma can be removed.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/bpf-loader.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tools/perf/util/bpf-loader.c b/tools/perf/util/bpf-loader.c
index 44cde27d6389..8f4c76f2265a 100644
--- a/tools/perf/util/bpf-loader.c
+++ b/tools/perf/util/bpf-loader.c
@@ -32,9 +32,6 @@
 
 #include <internal/xyarray.h>
 
-/* temporarily disable libbpf deprecation warnings */
-#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
-
 static int libbpf_perf_print(enum libbpf_print_level level __attribute__((unused)),
 			      const char *fmt, va_list args)
 {
-- 
2.41.0.487.g6d72f3e995-goog

