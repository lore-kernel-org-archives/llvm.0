Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33F54401
	for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 16:43:20 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-336c3b72da5so33372027b3.6
        for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 09:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc;
        bh=piFbI+N6ifodUssf6WWN9myKJ56nTyFL5MKGVcy1SIc=;
        b=oOTDnYkPox9n4dsRhelTrPGHGRLMEt6deTizLhz5ofmR+ooyIHLjFb758aN7XxeLyG
         mHElOGWQf3BuNkN8x3H2oZCTNs1m0D6ZX+FU1E5wVWKdsYEUf2kRi8EjLcXbLirQ4gHK
         Uoc+jySNEJmZFEgzlg0UTdE0K6mfDjJqyRoIoA61S7cXRsPHKutQMrUK1qSYhqfDVO+u
         GLZ4Tju4FfrS8seygSJX/JA23Htiq/BHSZYMK0UF5tZfbRCGBv1YJ8G0ieGtqTsD4PsB
         YsBRKb+kvtauhwZ+C6VHGIRgAdS0MuDIdx85It4XvLwuyCs91J2ETHROY0bsF8xzey5A
         qtUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=piFbI+N6ifodUssf6WWN9myKJ56nTyFL5MKGVcy1SIc=;
        b=8E0zf8sDzYDtZp8vmQNuvReIdhO5RQyL4V+YNNPD/Dngqdr18Px+4UsdCctBfY4DcU
         xAAJEN7SPoJRMcckAXH4HE6Fs2LxQU+MjAxC8nyRGBMBj0NOSTkQZ9UHdJbYwrtmyG6n
         BAxnuGzkcayX/1qBAJcTqp30KyeXMavkCxgr2qhH761T4VCRmpcl5NRa2pa+SwB+kAno
         A/trI8u09oj7JoUjbqI5rtZAGAmE+qtm1Ehpb5erHnITS+ty898frvN2habPdMqq0irw
         +nC2WzhGz4fdpg0toiDju7ccpPue0srNP7hHazMxCuPeFIgtqXHsmUAfUcNczOoJszYq
         CTjA==
X-Gm-Message-State: ACgBeo0DwrUBUOSEx6+Xn6lROYnN5MrMMbJIILltaP3ZMFPTnUIw+YAX
	U52GYvTa/2pMmCJov2lXg1sBPb/IGNex
X-Google-Smtp-Source: AA6agR79l5tuhoTcDP4BLbWyfZ0xNMgzVMVpetYezd/5Wb9TiKNEL9VdQKZl8bhay/NuyiZiUoNpISpBNc4U
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:ccb1:c46b:7044:2508])
 (user=irogers job=sendgmr) by 2002:a81:6103:0:b0:333:67b3:3558 with SMTP id
 v3-20020a816103000000b0033367b33558mr592131ywb.128.1661532199972; Fri, 26 Aug
 2022 09:43:19 -0700 (PDT)
Date: Fri, 26 Aug 2022 09:42:28 -0700
In-Reply-To: <20220826164242.43412-1-irogers@google.com>
Message-Id: <20220826164242.43412-5-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220826164242.43412-1-irogers@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Subject: [PATCH v4 04/18] perf hist: Update use of pthread mutex
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Weiguo Li <liwg06@foxmail.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Thomas Richter <tmricht@linux.ibm.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Dario Petrillo <dario.pk1@gmail.com>, Hewenliang <hewenliang4@huawei.com>, 
	yaowenbin <yaowenbin1@huawei.com>, Wenyu Liu <liuwenyu7@huawei.com>, 
	Song Liu <songliubraving@fb.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Dave Marchevsky <davemarchevsky@fb.com>, Leo Yan <leo.yan@linaro.org>, 
	Kim Phillips <kim.phillips@amd.com>, Pavithra Gurushankar <gpavithrasha@gmail.com>, 
	Alexandre Truong <alexandre.truong@arm.com>, Quentin Monnet <quentin@isovalent.com>, 
	William Cohen <wcohen@redhat.com>, Andres Freund <andres@anarazel.de>, 
	Adrian Hunter <adrian.hunter@intel.com>, "=?UTF-8?q?Martin=20Li=C5=A1ka?=" <mliska@suse.cz>, 
	Colin Ian King <colin.king@intel.com>, James Clark <james.clark@arm.com>, 
	Fangrui Song <maskray@google.com>, Stephane Eranian <eranian@google.com>, 
	Kajol Jain <kjain@linux.ibm.com>, Alexey Bayduraev <alexey.v.bayduraev@linux.intel.com>, 
	Riccardo Mancini <rickyman7@gmail.com>, Andi Kleen <ak@linux.intel.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Zechuan Chen <chenzechuan1@huawei.com>, 
	Jason Wang <wangborong@cdjrlc.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Remi Bernon <rbernon@codeweavers.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev
Cc: Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Switch to the use of mutex wrappers that provide better error checking.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-top.c | 8 ++++----
 tools/perf/util/hist.c   | 6 +++---
 tools/perf/util/hist.h   | 4 ++--
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/tools/perf/builtin-top.c b/tools/perf/builtin-top.c
index fd8fd913c533..14e60f6f219c 100644
--- a/tools/perf/builtin-top.c
+++ b/tools/perf/builtin-top.c
@@ -220,7 +220,7 @@ static void perf_top__record_precise_ip(struct perf_top *top,
 		 * This function is now called with he->hists->lock held.
 		 * Release it before going to sleep.
 		 */
-		pthread_mutex_unlock(&he->hists->lock);
+		mutex_unlock(&he->hists->lock);
 
 		if (err == -ERANGE && !he->ms.map->erange_warned)
 			ui__warn_map_erange(he->ms.map, sym, ip);
@@ -230,7 +230,7 @@ static void perf_top__record_precise_ip(struct perf_top *top,
 			sleep(1);
 		}
 
-		pthread_mutex_lock(&he->hists->lock);
+		mutex_lock(&he->hists->lock);
 	}
 }
 
@@ -836,12 +836,12 @@ static void perf_event__process_sample(struct perf_tool *tool,
 		else
 			iter.ops = &hist_iter_normal;
 
-		pthread_mutex_lock(&hists->lock);
+		mutex_lock(&hists->lock);
 
 		if (hist_entry_iter__add(&iter, &al, top->max_stack, top) < 0)
 			pr_err("Problem incrementing symbol period, skipping event\n");
 
-		pthread_mutex_unlock(&hists->lock);
+		mutex_unlock(&hists->lock);
 	}
 
 	addr_location__put(&al);
diff --git a/tools/perf/util/hist.c b/tools/perf/util/hist.c
index 1c085ab56534..698add038cec 100644
--- a/tools/perf/util/hist.c
+++ b/tools/perf/util/hist.c
@@ -1622,13 +1622,13 @@ struct rb_root_cached *hists__get_rotate_entries_in(struct hists *hists)
 {
 	struct rb_root_cached *root;
 
-	pthread_mutex_lock(&hists->lock);
+	mutex_lock(&hists->lock);
 
 	root = hists->entries_in;
 	if (++hists->entries_in > &hists->entries_in_array[1])
 		hists->entries_in = &hists->entries_in_array[0];
 
-	pthread_mutex_unlock(&hists->lock);
+	mutex_unlock(&hists->lock);
 
 	return root;
 }
@@ -2805,7 +2805,7 @@ int __hists__init(struct hists *hists, struct perf_hpp_list *hpp_list)
 	hists->entries_in = &hists->entries_in_array[0];
 	hists->entries_collapsed = RB_ROOT_CACHED;
 	hists->entries = RB_ROOT_CACHED;
-	pthread_mutex_init(&hists->lock, NULL);
+	mutex_init(&hists->lock);
 	hists->socket_filter = -1;
 	hists->hpp_list = hpp_list;
 	INIT_LIST_HEAD(&hists->hpp_formats);
diff --git a/tools/perf/util/hist.h b/tools/perf/util/hist.h
index 7ed4648d2fc2..508428b2c1b2 100644
--- a/tools/perf/util/hist.h
+++ b/tools/perf/util/hist.h
@@ -4,10 +4,10 @@
 
 #include <linux/rbtree.h>
 #include <linux/types.h>
-#include <pthread.h>
 #include "evsel.h"
 #include "color.h"
 #include "events_stats.h"
+#include "mutex.h"
 
 struct hist_entry;
 struct hist_entry_ops;
@@ -98,7 +98,7 @@ struct hists {
 	const struct dso	*dso_filter;
 	const char		*uid_filter_str;
 	const char		*symbol_filter_str;
-	pthread_mutex_t		lock;
+	struct mutex		lock;
 	struct hists_stats	stats;
 	u64			event_stream;
 	u16			col_len[HISTC_NR_COLS];
-- 
2.37.2.672.g94769d06f0-goog

