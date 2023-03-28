Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DBFAFC1
	for <llvm@lists.linux.dev>; Tue, 28 Mar 2023 23:56:10 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-544781e30easo135418297b3.1
        for <llvm@lists.linux.dev>; Tue, 28 Mar 2023 16:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680047769;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QwhWDPXvx6cfkb5reLksh9jCAury04O7LzcSvRbB8Zs=;
        b=Ltgu8Ff4auNliuT5UliaEkAuq9i2Tzu+5U2BQzip1AZokzyNRdwHBLrr0A1q1TCteh
         6HA8rQWn2amyDpZCOcWkijg0aV3wa7oBLO7ki4rM6Xzr9cqFtUVrftkblee0rzPjMb+L
         wJ4eW8t3SAEsbCXRcXZGpnQH05BULFCsjjs0PkcoeeHAo5P4f+L0tmwiyGtOxdqtUqwk
         lRhAg5051knYmNhbu0rixPc04ElVILRM6fmL1sequabHkJhfYFow2m9eE4OC/NNGI7D5
         M1zB/Iu+BE5dCWofkvweIXTenU0zYzPftguEROrDBdX8QE4rvu1TaHyUsk4TFKeXBN50
         OHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680047769;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QwhWDPXvx6cfkb5reLksh9jCAury04O7LzcSvRbB8Zs=;
        b=3IM/nKILwjE+qoFymiLOUGJImdyWRnn54lGKVLY6vgHw1dFeM2YrAWTjsJjb1cEulG
         CRd/Rhb9S0lqrykSmT4tUgHWbc/GOWAvzIiwj8Wsrm7JyGSd+8vHRY+PLck4YWipb+ra
         i1/qgC7R5CSDHHGSWlNC8HASMmmv9MCoAZo8MwEoLpvco3hsy/5WmUYX9r8oh/S6AWc/
         CMfxyKEBZCGqcn87tzDcFmgYH7bX2U5HbRRvs++h9kgxURIlj1OtbK1irOf6QwSomIhj
         0z2uUVOnDWe8d3umgK3MRdjJkWJueIshcvTl6NFZ/clpv8o+7rciTP99dp63gbZqce/K
         4LPQ==
X-Gm-Message-State: AAQBX9cy3JNHSwNIrPVEfWspnUP1Ravq3JDGb/4xcKm55eT3qzO7z7EC
	9pfdaU3IFAZ/RqPgLkLC1PKtW7DE5Lly
X-Google-Smtp-Source: AKy350bPHWqR7CBnjrbpMPu6sWr+4djUlu6CbJ9r9CJVXCNAz4PB6GrJeq1BsxI9gq7g43uy2Tw/VjdqKiJY
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:6519:f0d3:9540:5c31])
 (user=irogers job=sendgmr) by 2002:a05:6902:1003:b0:b1d:5061:98e3 with SMTP
 id w3-20020a056902100300b00b1d506198e3mr11705976ybt.6.1680047769358; Tue, 28
 Mar 2023 16:56:09 -0700 (PDT)
Date: Tue, 28 Mar 2023 16:55:38 -0700
In-Reply-To: <20230328235543.1082207-1-irogers@google.com>
Message-Id: <20230328235543.1082207-2-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230328235543.1082207-1-irogers@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Subject: [PATCH v1 1/6] perf annotate: Delete session for debug builds
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

Use the debug build indicator as the guide to free the session. This
implements a behavior described in a comment, which is consequentially
removed.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-annotate.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/tools/perf/builtin-annotate.c b/tools/perf/builtin-annotate.c
index 4750fac7bf93..98d1b6379230 100644
--- a/tools/perf/builtin-annotate.c
+++ b/tools/perf/builtin-annotate.c
@@ -692,16 +692,12 @@ int cmd_annotate(int argc, const char **argv)
 
 out_delete:
 	/*
-	 * Speed up the exit process, for large files this can
-	 * take quite a while.
-	 *
-	 * XXX Enable this when using valgrind or if we ever
-	 * librarize this command.
-	 *
-	 * Also experiment with obstacks to see how much speed
-	 * up we'll get here.
-	 *
-	 * perf_session__delete(session);
+	 * Speed up the exit process by only deleting for debug builds. For
+	 * large files this can save time.
 	 */
+#ifndef NDEBUG
+	perf_session__delete(annotate.session);
+#endif
+
 	return ret;
 }
-- 
2.40.0.348.gf938b09366-goog

