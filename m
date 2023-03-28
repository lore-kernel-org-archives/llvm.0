Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADD8AFC1
	for <llvm@lists.linux.dev>; Tue, 28 Mar 2023 23:56:44 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id g5-20020a25a485000000b009419f64f6afso13625288ybi.2
        for <llvm@lists.linux.dev>; Tue, 28 Mar 2023 16:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680047803;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f8oj4Qh8LkL44qDfc+ww/WDT9C93iT4jvbUsjV4OLZU=;
        b=cRwj07ZHD3+kEgzI1WCsWo0Jn0PxpJhoWIxxnhZ/C7rF6MsGc783MzQ5sULdu71i2j
         jKqKOI5DzMxXW+0BLJuIMAJdE4wDTOIdWyzoqw1ciQFW3HG375hOaFxHwRs5efHw+CEj
         n6N1zd/G2NdnRxpXSB5JhmJicJcrK5cCQ3f14MaCMA1iz1tFMbmhlZVM11nQRilyoiHd
         eNCAeB42smeR++GjJcnlBMEyQc/fOOzn2h/3AV2L0kgNI1Gc9Caw/jCDtScqHcCN2v5z
         S5XlpUy8e5Lsv74mf9wqVeC3LfgRI3+SS0GSAiBq8gagDMTJ8a5CMreaHWT4KTDWCnBE
         mVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680047803;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f8oj4Qh8LkL44qDfc+ww/WDT9C93iT4jvbUsjV4OLZU=;
        b=iybvRodQa3AVVgK9BFbPx6+JPvXCBzOn+c6AhVQj/lwPMhNEWynZN1pBzee4uEe/Ai
         w5+I1pOa/nSYNKS72KOeuds/fw3t4FyJpKNZpsCzUIJRg2bexbzAnL0bJ+gjrTZKXozU
         gLaxi4f572Z+d/vIBUQPZYtgX5Jg7yRofjazPWbFmWts46oOi8PzsFdejyz1Io7fU2ls
         r2AEFrGHa4uFVsXQ1vxWccpCA70YkbXoEWhuoTE8qU6Xac+5wY55voAK7FmGbXi74uHv
         h3Hr2Xqrf/gKS3JwKf78s7fj6o+wfAoC1PgiOFtPq7QC5ReBF+ih1/2djnCZ27Su1l2q
         /QgA==
X-Gm-Message-State: AAQBX9cEhdCumhFSQ1WCgOydpOvGmsPsG6yoJUKWc2wTCvUpK25lDWtH
	4LHsSvzfMbzuSAWtgWAZ/5zH+83saB/4
X-Google-Smtp-Source: AKy350bUp5S6wjQC6cWrYY34EcwAiZTBNWURmSqeR/1rTTGdHd3PnQclyh5VuNn5nGYPWejg8XtVkHfkE2gy
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:6519:f0d3:9540:5c31])
 (user=irogers job=sendgmr) by 2002:a05:6902:18d5:b0:b75:3fd4:1b31 with SMTP
 id ck21-20020a05690218d500b00b753fd41b31mr11717269ybb.1.1680047803319; Tue,
 28 Mar 2023 16:56:43 -0700 (PDT)
Date: Tue, 28 Mar 2023 16:55:42 -0700
In-Reply-To: <20230328235543.1082207-1-irogers@google.com>
Message-Id: <20230328235543.1082207-6-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230328235543.1082207-1-irogers@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Subject: [PATCH v1 5/6] perf annotate: Allow objdump to be set in perfconfig
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	James Clark <james.clark@arm.com>, Andi Kleen <ak@linux.intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, German Gomez <german.gomez@arm.com>, 
	Sandipan Das <sandipan.das@amd.com>, Andres Freund <andres@anarazel.de>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Allow the setting of the objdump command in the perfconfig. Update man
page for this new option.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Documentation/perf-config.txt | 5 ++++-
 tools/perf/util/annotate.c               | 6 ++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/tools/perf/Documentation/perf-config.txt b/tools/perf/Documentation/perf-config.txt
index 39c890ead2dc..697f7f924545 100644
--- a/tools/perf/Documentation/perf-config.txt
+++ b/tools/perf/Documentation/perf-config.txt
@@ -250,7 +250,10 @@ annotate.*::
 	These are in control of addresses, jump function, source code
 	in lines of assembly code from a specific program.
 
-	annotate.disassembler_style:
+	annotate.objdump::
+		objdump binary to use for disassembly and annotations.
+
+	annotate.disassembler_style::
 		Use this to change the default disassembler style to some other value
 		supported by binutils, such as "intel", see the '-M' option help in the
 		'objdump' man page.
diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
index 7338249dfdd9..3eaa9b2df6c4 100644
--- a/tools/perf/util/annotate.c
+++ b/tools/perf/util/annotate.c
@@ -3211,6 +3211,12 @@ static int annotation__config(const char *var, const char *value, void *data)
 			pr_err("Not enough memory for annotate.disassembler_style\n");
 			return -1;
 		}
+	} else if (!strcmp(var, "annotate.objdump")) {
+		opt->objdump_path = strdup(value);
+		if (!opt->objdump_path) {
+			pr_err("Not enough memory for annotate.objdump\n");
+			return -1;
+		}
 	} else if (!strcmp(var, "annotate.demangle")) {
 		symbol_conf.demangle = perf_config_bool("demangle", value);
 	} else if (!strcmp(var, "annotate.demangle_kernel")) {
-- 
2.40.0.348.gf938b09366-goog

