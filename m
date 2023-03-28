Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D02AFC1
	for <llvm@lists.linux.dev>; Tue, 28 Mar 2023 23:56:20 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-5417f156cb9so137473247b3.8
        for <llvm@lists.linux.dev>; Tue, 28 Mar 2023 16:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680047780;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=csE2VZEcuZtBLgmcXXy647e0uSJ8df6i+003V2C0jUw=;
        b=Yib8I2uNI+WOJsCh1Q4n8uRnhC1tAuAB8JbPeIlcB5nVB46fTnrkZzX4bjrI7UcS16
         VfeA/8cQUrhsK7bK0usQaCWRJSdq9N9a6c3rcix8RFrv70wWXoK3EUVPDzyU6IvQIMmB
         kBTGnjt9VijE3efrsi0D/w/HohhQmU1FbnNKlGXND9/+92cwfNbKh9irTfujj/1fJLoJ
         xjdEZaRcd9mX1MdQRDRM6WEQZj4tF8vGNcBxmsNyWeg0uzmuvmVFgEUxdjRP8xJaEnl5
         In8K528yb79Cz7HetuZlunZq+rSQcDcPTxHJ9GpRt+WSRtGDjvlhVlwbDju0A9up2zjT
         Z/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680047780;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=csE2VZEcuZtBLgmcXXy647e0uSJ8df6i+003V2C0jUw=;
        b=AMAsE0xw1YTnYL5aOMXPZ5RsqT6gdcAFaox+eGIbSXbJttTVFHKdZXic+/PwFYHzg1
         RIvsWffXn8kwEk45B/p1QWsHODi30h/GzdZtKCXh8V+Gj1ac9oqQguAfGzspJqVsUvjk
         K0EjOUFDWe3O4DUIbOpv3wElid9KfmkjVOTzCeRvrk1LhWF/OKhOuaC0ee/9gekhZn9k
         8NUfL6xY1X+UuNbk6C4relRRtvSigV060+hmtaDgLPU3tlsF9hiySwT6zrCRLyBhg6Ha
         Aa4Kl8sdmR+xvA/7iHUHqu4O28I6RJT1bcoX2g33XuWjidNmUKSSDvoa3N58Nne2Wx1G
         IxDg==
X-Gm-Message-State: AAQBX9cWqJh2APbf71RRAf2/RQQOAt5GrIvyzDl1fGYahC49AWS/Gqiu
	8bxpcvon1LRQ7ObSa5f0WMjXl+fVdDXg
X-Google-Smtp-Source: AKy350aL9CY1E8m1J8TjEURID2oBqh5mz3wMQUM24lLONZ4M9DkOnMmP+IHYNgSHJ0dcKtyi2L23qYzmmiUX
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:6519:f0d3:9540:5c31])
 (user=irogers job=sendgmr) by 2002:a25:db91:0:b0:b75:8ac3:d5d9 with SMTP id
 g139-20020a25db91000000b00b758ac3d5d9mr10989074ybf.3.1680047779895; Tue, 28
 Mar 2023 16:56:19 -0700 (PDT)
Date: Tue, 28 Mar 2023 16:55:39 -0700
In-Reply-To: <20230328235543.1082207-1-irogers@google.com>
Message-Id: <20230328235543.1082207-3-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230328235543.1082207-1-irogers@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Subject: [PATCH v1 2/6] perf report: Additional config warnings
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

If the default_sort_order isn't correctly strdup-ed warn and return an
error. Debug warn if no option is matched.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-report.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/perf/builtin-report.c b/tools/perf/builtin-report.c
index 6400615b5e98..500f9d8902e7 100644
--- a/tools/perf/builtin-report.c
+++ b/tools/perf/builtin-report.c
@@ -143,6 +143,10 @@ static int report__config(const char *var, const char *value, void *cb)
 
 	if (!strcmp(var, "report.sort_order")) {
 		default_sort_order = strdup(value);
+		if (!default_sort_order) {
+			pr_err("Not enough memory for report.sort_order\n");
+			return -1;
+		}
 		return 0;
 	}
 
@@ -151,6 +155,7 @@ static int report__config(const char *var, const char *value, void *cb)
 		return 0;
 	}
 
+	pr_debug("%s variable unknown, ignoring...", var);
 	return 0;
 }
 
-- 
2.40.0.348.gf938b09366-goog

