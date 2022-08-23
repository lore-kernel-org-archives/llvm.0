Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256255C91
	for <llvm@lists.linux.dev>; Tue, 23 Aug 2022 22:11:18 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-334ab1f0247so259194687b3.7
        for <llvm@lists.linux.dev>; Tue, 23 Aug 2022 15:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc;
        bh=K4oRiNn+G2rdtJsE6L2b3oylFpgb/KpBFNxvRzPUh68=;
        b=mPAPh3cEvyWdIZIF7pmnVaWOxwkdb/agfVPZLOISUSLKAOcBm6GD0GO984MB0BbI3h
         nLeod1OUEJerQDtGS66iqteAj4Zm/QF4FHJoo6k5jCF7oa7npVly5Z+afdgkK7DojHeE
         K8XhJDLxpv6UuKYEhvh3OXaCnHSBd81MS4q6MwEPHtSUGiZMhjf9hc0OnS34FCadQuwz
         1SoHhjdmqixqY3VKmSmcDFXYPCR4Nxk+7nq3/U2G43pCTfjljlWU06JiNxt6XIhCpDPk
         pZzBl3Mm1ZUgjxzQpUOIwQluQR+T8AvcaJs7Oz2ymxKbM2XVkwRHeMA2lI1ymtHkqfVg
         Lvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=K4oRiNn+G2rdtJsE6L2b3oylFpgb/KpBFNxvRzPUh68=;
        b=GVEr1g2U+CKiolHdTKNlkN/HfIJdOfpaO2yFWRSZ/WlMULWzy1PgEkGd1kNFxYz2uh
         VLWsEkZ0Oxfe2LB2KozphDiBgPZmkeXC59I+10lPixxpvIP71mbL6BvsN970NQIAZ1JV
         u9Od0I0Hequ7rOA7z0hRnmv5MvLczeDeqcmLa4WTQ0Hq78ZVIfXA/oImucLnXM6QyHku
         SK6ttFOCgmiJAuvYsvSZlS3wmLI4FPpx/TLQXHv+aIPn68Cv2Y7Y6Igg5oXcx1h/f/OF
         eOJ4+W6PlmdVcy57gHwEG35YFHfVrMHE3/btzT4sTBnWm5ov/O1lrOzNeqAhN7CjyUMt
         JqGA==
X-Gm-Message-State: ACgBeo29lxcmQ0hAvbNMSBuGA3o5uFZvrE2YNv446BpJtE1eY9eENHLf
	DplCQ8JTZh35mfnE6DJdy66dnWa+FnP8
X-Google-Smtp-Source: AA6agR7GhAN18bhNP7OEUGzMVoWqbLNjvwo0Kz5W4Z6P+DPRLh4sVcdbaQ0WjCi4/p46vI8Uk3tw7Xot0K2W
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:7dbd:c08f:de81:c2a3])
 (user=irogers job=sendgmr) by 2002:a81:124c:0:b0:334:d633:f3c9 with SMTP id
 73-20020a81124c000000b00334d633f3c9mr28335053yws.437.1661292677181; Tue, 23
 Aug 2022 15:11:17 -0700 (PDT)
Date: Tue, 23 Aug 2022 15:09:21 -0700
In-Reply-To: <20220823220922.256001-1-irogers@google.com>
Message-Id: <20220823220922.256001-18-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220823220922.256001-1-irogers@google.com>
X-Mailer: git-send-email 2.37.2.609.g9ff673ca1a-goog
Subject: [PATCH v2 17/18] perf top: Fixes for thread safety analysis
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

Add annotations to describe lock behavior.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-top.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/perf/builtin-top.c b/tools/perf/builtin-top.c
index 3757292bfe86..e832f04e3076 100644
--- a/tools/perf/builtin-top.c
+++ b/tools/perf/builtin-top.c
@@ -196,6 +196,7 @@ static void perf_top__record_precise_ip(struct perf_top *top,
 					struct hist_entry *he,
 					struct perf_sample *sample,
 					struct evsel *evsel, u64 ip)
+	EXCLUSIVE_LOCKS_REQUIRED(he->hists->lock)
 {
 	struct annotation *notes;
 	struct symbol *sym = he->ms.sym;
@@ -724,13 +725,13 @@ static void *display_thread(void *arg)
 static int hist_iter__top_callback(struct hist_entry_iter *iter,
 				   struct addr_location *al, bool single,
 				   void *arg)
+	EXCLUSIVE_LOCKS_REQUIRED(iter->he->hists->lock)
 {
 	struct perf_top *top = arg;
-	struct hist_entry *he = iter->he;
 	struct evsel *evsel = iter->evsel;
 
 	if (perf_hpp_list.sym && single)
-		perf_top__record_precise_ip(top, he, iter->sample, evsel, al->addr);
+		perf_top__record_precise_ip(top, iter->he, iter->sample, evsel, al->addr);
 
 	hist__account_cycles(iter->sample->branch_stack, al, iter->sample,
 		     !(top->record_opts.branch_stack & PERF_SAMPLE_BRANCH_ANY),
-- 
2.37.2.609.g9ff673ca1a-goog

