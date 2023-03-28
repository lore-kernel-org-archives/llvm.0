Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AB6AFC1
	for <llvm@lists.linux.dev>; Tue, 28 Mar 2023 23:56:28 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-5458201ab8cso138802227b3.23
        for <llvm@lists.linux.dev>; Tue, 28 Mar 2023 16:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680047787;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+dfoa7PdTPtz3CWTqB9VBABZ1zyUPbRz1qawtN8lLUw=;
        b=JOCvXaIQUwp3GmrZVG0iTKQw3DjbjHg9V4hS3mDV7xL/qOfUvSQd1PP5g7zQoDkf+l
         z6JEMy6cVerZN2lL19u8LIlEWmpbRC+1eyBjpPrzJPkxcQEj/27I+DzbRCXS/08wmZiZ
         YaLBZd5GQdQ4a+8srbC9t9WD/o/57PN2Qwkk7e7gQyQiBVSpsHch1JKtX3lOTQzpdSzh
         X19AuhLhTKEuoJ3N8cc/uL9VPYhX3mTAYT3CRjyUuJz028mqJflerumABKFoZRH0VHoQ
         Wxj2T951BsdXRBBdU0pwg0uUt958Pd1iWideC98cUWcOf8UaWJCI7Tnm39x6KCoQQz9u
         vWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680047787;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+dfoa7PdTPtz3CWTqB9VBABZ1zyUPbRz1qawtN8lLUw=;
        b=0ZGlXForM/dUy/KYcKIMeWuP4a36VPBKuEkY9qjnFDw7218eQE/2Vjx7wVdmJlBPCC
         bOrqD4o9ftG5lh6PWiSOCa1c+sZlpjRrhtZNkZ4ro1h4s7GCRe3zQE24HnZwm2Gi+uM5
         arYkkVWnTRQ3eCPu7WvYSEQZ+dgNc7Rn6Cw4U0z9PqFJB6d5qDE08yQdqce8F4Zw1LML
         uk6ih0hzge64A8TVTJDKwt6XWGOS8A0rH1Vb8oXtBmr1eJG1qCOJInOkmpbX8dOyb4/B
         qTh+Yu5JB4exHsO4Us38Pg2vgFanNCF8g+XTdTsAxt5/8W9UPJPdYryJqMdw61tqMyB8
         xvuQ==
X-Gm-Message-State: AAQBX9eTiNbdfEMeD7aMVFjbGa5hz2YtDlJhRO8aluZbR6IpwfDB+AFu
	LzIy9y0tMNZ0/AAx6s98JGmCLHLxchIQ
X-Google-Smtp-Source: AKy350ahcnG4NmrRAxiaGFjY5GRM39BpBc5DCjPsLOlTLi7MjzLVvZsH6GUuG8LAVOpVD/lrKP4wwY6WtVSw
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:6519:f0d3:9540:5c31])
 (user=irogers job=sendgmr) by 2002:a05:6902:1102:b0:b2f:bdc9:2cdc with SMTP
 id o2-20020a056902110200b00b2fbdc92cdcmr11705564ybu.7.1680047787567; Tue, 28
 Mar 2023 16:56:27 -0700 (PDT)
Date: Tue, 28 Mar 2023 16:55:40 -0700
In-Reply-To: <20230328235543.1082207-1-irogers@google.com>
Message-Id: <20230328235543.1082207-4-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230328235543.1082207-1-irogers@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Subject: [PATCH v1 3/6] perf annotate: Add init/exit to annotation_options
 remove default
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

annotation__default_options was used to initialize
annotation_options. Switch to the init/exit pattern as later changes
will give ownership over strings and this will be necessary to avoid
memory leaks.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-annotate.c |  3 ++-
 tools/perf/builtin-report.c   |  7 ++++---
 tools/perf/builtin-top.c      |  4 +++-
 tools/perf/util/annotate.c    | 25 +++++++++++++++++--------
 tools/perf/util/annotate.h    |  5 +++--
 5 files changed, 29 insertions(+), 15 deletions(-)

diff --git a/tools/perf/builtin-annotate.c b/tools/perf/builtin-annotate.c
index 98d1b6379230..0ceb41f16663 100644
--- a/tools/perf/builtin-annotate.c
+++ b/tools/perf/builtin-annotate.c
@@ -509,7 +509,6 @@ int cmd_annotate(int argc, const char **argv)
 			.ordered_events = true,
 			.ordering_requires_timestamps = true,
 		},
-		.opts = annotation__default_options,
 	};
 	struct perf_data data = {
 		.mode  = PERF_DATA_MODE_READ,
@@ -598,6 +597,7 @@ int cmd_annotate(int argc, const char **argv)
 	set_option_flag(options, 0, "show-total-period", PARSE_OPT_EXCLUSIVE);
 	set_option_flag(options, 0, "show-nr-samples", PARSE_OPT_EXCLUSIVE);
 
+	annotation_options__init(&annotate.opts);
 
 	ret = hists__init();
 	if (ret < 0)
@@ -698,6 +698,7 @@ int cmd_annotate(int argc, const char **argv)
 #ifndef NDEBUG
 	perf_session__delete(annotate.session);
 #endif
+	annotation_options__exit(&annotate.opts);
 
 	return ret;
 }
diff --git a/tools/perf/builtin-report.c b/tools/perf/builtin-report.c
index 500f9d8902e7..b41e1219d153 100644
--- a/tools/perf/builtin-report.c
+++ b/tools/perf/builtin-report.c
@@ -728,8 +728,7 @@ static int hists__resort_cb(struct hist_entry *he, void *arg)
 	if (rep->symbol_ipc && sym && !sym->annotate2) {
 		struct evsel *evsel = hists_to_evsel(he->hists);
 
-		symbol__annotate2(&he->ms, evsel,
-				  &annotation__default_options, NULL);
+		symbol__annotate2(&he->ms, evsel, &rep->annotation_opts, NULL);
 	}
 
 	return 0;
@@ -1223,7 +1222,6 @@ int cmd_report(int argc, const char **argv)
 		.max_stack		 = PERF_MAX_STACK_DEPTH,
 		.pretty_printing_style	 = "normal",
 		.socket_filter		 = -1,
-		.annotation_opts	 = annotation__default_options,
 		.skip_empty		 = true,
 	};
 	char *sort_order_help = sort_help("sort by key(s):");
@@ -1403,6 +1401,8 @@ int cmd_report(int argc, const char **argv)
 	if (ret < 0)
 		goto exit;
 
+	annotation_options__init(&report.annotation_opts);
+
 	ret = perf_config(report__config, &report);
 	if (ret)
 		goto exit;
@@ -1706,6 +1706,7 @@ int cmd_report(int argc, const char **argv)
 	zstd_fini(&(session->zstd_data));
 	perf_session__delete(session);
 exit:
+	annotation_options__exit(&report.annotation_opts);
 	free(sort_order_help);
 	free(field_order_help);
 	return ret;
diff --git a/tools/perf/builtin-top.c b/tools/perf/builtin-top.c
index d4b5b02bab73..592eb827fba9 100644
--- a/tools/perf/builtin-top.c
+++ b/tools/perf/builtin-top.c
@@ -1435,7 +1435,6 @@ int cmd_top(int argc, const char **argv)
 			.sample_time_set = true,
 		},
 		.max_stack	     = sysctl__max_stack(),
-		.annotation_opts     = annotation__default_options,
 		.nr_threads_synthesize = UINT_MAX,
 	};
 	struct record_opts *opts = &top.record_opts;
@@ -1587,6 +1586,8 @@ int cmd_top(int argc, const char **argv)
 	if (status < 0)
 		return status;
 
+	annotation_options__init(&top.annotation_opts);
+
 	top.annotation_opts.min_pcnt = 5;
 	top.annotation_opts.context  = 4;
 
@@ -1783,6 +1784,7 @@ int cmd_top(int argc, const char **argv)
 out_delete_evlist:
 	evlist__delete(top.evlist);
 	perf_session__delete(top.session);
+	annotation_options__exit(&top.annotation_opts);
 
 	return status;
 }
diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
index db475e44f42f..a984bdae7811 100644
--- a/tools/perf/util/annotate.c
+++ b/tools/perf/util/annotate.c
@@ -55,14 +55,6 @@
 
 #include <linux/ctype.h>
 
-struct annotation_options annotation__default_options = {
-	.use_offset     = true,
-	.jump_arrows    = true,
-	.annotate_src	= true,
-	.offset_level	= ANNOTATION__OFFSET_JUMP_TARGETS,
-	.percent_type	= PERCENT_PERIOD_LOCAL,
-};
-
 static regex_t	 file_lineno;
 
 static struct ins_ops *ins__find(struct arch *arch, const char *name);
@@ -3226,6 +3218,23 @@ static int annotation__config(const char *var, const char *value, void *data)
 	return 0;
 }
 
+void annotation_options__init(struct annotation_options *opt)
+{
+	memset(opt, 0, sizeof(*opt));
+
+	/* Default values. */
+	opt->use_offset = true;
+	opt->jump_arrows = true;
+	opt->annotate_src = true;
+	opt->offset_level = ANNOTATION__OFFSET_JUMP_TARGETS;
+	opt->percent_type = PERCENT_PERIOD_LOCAL;
+}
+
+
+void annotation_options__exit(struct annotation_options *opt __maybe_unused)
+{
+}
+
 void annotation_config__init(struct annotation_options *opt)
 {
 	perf_config(annotation__config, opt);
diff --git a/tools/perf/util/annotate.h b/tools/perf/util/annotate.h
index 8934072c39e6..e7238c694465 100644
--- a/tools/perf/util/annotate.h
+++ b/tools/perf/util/annotate.h
@@ -109,8 +109,6 @@ enum {
 
 #define ANNOTATION__MIN_OFFSET_LEVEL ANNOTATION__OFFSET_JUMP_TARGETS
 
-extern struct annotation_options annotation__default_options;
-
 struct annotation;
 
 struct sym_hist_entry {
@@ -418,6 +416,9 @@ static inline int symbol__tui_annotate(struct map_symbol *ms __maybe_unused,
 }
 #endif
 
+void annotation_options__init(struct annotation_options *opt);
+void annotation_options__exit(struct annotation_options *opt);
+
 void annotation_config__init(struct annotation_options *opt);
 
 int annotate_parse_percent_type(const struct option *opt, const char *_str,
-- 
2.40.0.348.gf938b09366-goog

