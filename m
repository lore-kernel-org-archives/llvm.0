Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95317C2D5
	for <llvm@lists.linux.dev>; Fri, 28 Jul 2023 06:49:57 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-5847479b559so11634797b3.1
        for <llvm@lists.linux.dev>; Thu, 27 Jul 2023 23:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690526996; x=1691131796;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qCTbKLxJE0e0fl2gNVl7kq0Lz7zE9dDnQokd98Af9Ns=;
        b=X3zNA1RyzLTULsNbdzaguab4z5QUbvoNMUV1EWAEh8ykQMS+N/lSrXKHrjXCDjAIW0
         b8fAsPrrPrZUyGp2r2JOgYtx0Iyu2JRCxWsXHm0VA9DEhKb90ArH81bKpFGytwmaegL/
         ahLqi1dWB0gpwXhL71JAr4ayzjdZNvmRpaOg3DNpfus2x79fe2cK/zPF8M4yzx8dle8/
         lgYRqJGe5+65cNJgMBcb6mUsE4h8lwi7sFbN5W2Ys+inxantP8VFhm0mjMLMGq0MIX+3
         Q2qJAkJzldydQMadbHTKbjY/T5QuIThGF37ugL0IfZXuyIkE+c2o8kYT/YKIo3X65Ptf
         4j5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690526996; x=1691131796;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qCTbKLxJE0e0fl2gNVl7kq0Lz7zE9dDnQokd98Af9Ns=;
        b=lZPyJeqRC5E8TM3uOyi9ecplQcwJOEXBAOVUYt4wu+egFs3SerY+KWtqwfswPV38ob
         2P4ohEczEO9P/HDubgf4MgwtyhMH8hyoCHvbEip4ymdtFxfX4gNvfnL/jaH519rOrhRV
         NWINzp13l1LH3QE3ZaRsUdxnw6LXlI5ohTns1FP7/sbA8ecrDcYXf/TfailqMIZP31iC
         O+GprQqBW+hgdCPv20CUIT8C7T+vGsGoCl1eDiiysd90IecwZhc+iyLd3jxl896NjRS2
         XVLHGI/3L1496F+/S0SRTjN32Q5EXRqGXFC6zO+Bv/VQztf27kD4DjEvn9aIEmtQdWXJ
         9/+g==
X-Gm-Message-State: ABy/qLZzhwVS9JidOLbB40ZrSRWtDjmtRMUCR+XMwO3N55UB7sW02ZK8
	ZcJmhEtT/hQmULhItT70OLe9yFfwkZkc
X-Google-Smtp-Source: APBJJlF1VBO/nA6o0F1Sw4iDyXLL+nD10wzaY2iHSF0gHcJmj7AOkP0CJ29sQFCewflEsjHmJprWtoE0EOv5
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:3d03:ff18:af30:2dad])
 (user=irogers job=sendgmr) by 2002:a25:7392:0:b0:d1e:721b:469d with SMTP id
 o140-20020a257392000000b00d1e721b469dmr4543ybc.7.1690526996428; Thu, 27 Jul
 2023 23:49:56 -0700 (PDT)
Date: Thu, 27 Jul 2023 23:49:17 -0700
In-Reply-To: <20230728064917.767761-1-irogers@google.com>
Message-Id: <20230728064917.767761-7-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230728064917.767761-1-irogers@google.com>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
Subject: [PATCH v1 6/6] perf build: Remove -Wno-redundant-decls in 2 cases
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

Properly fix a warning and remove the -Wno-redundant-decls C flag.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/Build          | 2 --
 tools/perf/util/parse-events.c | 1 -
 2 files changed, 3 deletions(-)

diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index 20aa8545b127..b8f1e9ba8c6f 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -312,8 +312,6 @@ CFLAGS_find_bit.o      += -Wno-unused-parameter -DETC_PERFCONFIG="BUILD_STR($(ET
 CFLAGS_rbtree.o        += -Wno-unused-parameter -DETC_PERFCONFIG="BUILD_STR($(ETC_PERFCONFIG_SQ))"
 CFLAGS_libstring.o     += -Wno-unused-parameter -DETC_PERFCONFIG="BUILD_STR($(ETC_PERFCONFIG_SQ))"
 CFLAGS_hweight.o       += -Wno-unused-parameter -DETC_PERFCONFIG="BUILD_STR($(ETC_PERFCONFIG_SQ))"
-CFLAGS_parse-events.o  += -Wno-redundant-decls
-CFLAGS_expr.o          += -Wno-redundant-decls
 CFLAGS_header.o        += -include $(OUTPUT)PERF-VERSION-FILE
 CFLAGS_arm-spe.o       += -I$(srctree)/tools/arch/arm64/include/
 
diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
index 926d3ac97324..ac315e1be2bc 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -35,7 +35,6 @@
 #ifdef PARSER_DEBUG
 extern int parse_events_debug;
 #endif
-int parse_events_parse(void *parse_state, void *scanner);
 static int get_config_terms(struct list_head *head_config,
 			    struct list_head *head_terms __maybe_unused);
 
-- 
2.41.0.487.g6d72f3e995-goog

