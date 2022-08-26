Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA8C4401
	for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 16:45:35 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-3328a211611so33561307b3.5
        for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 09:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc;
        bh=taa3AgrUGklZBinkwVt0bQeh1ht8ynjIrx3kuUJRxJw=;
        b=RCSICxAMM6hk3ItMYtco0m9Sf6jGuFwmDEqz3qYYgbJ5Y6hKFjHIWnsaPtK2ZlXWFf
         GPwzXBHgxMvQkOEwxAPDe7t3hFITeGDkOPPmm/iJPxvDVVe1NwUHVvBMg9dJYHkgzuHJ
         gRuZAGzuxm5KQuJgcZ3b0xNoLUy2rDHQ/o767HC22XYfGYRdLMrgNzreWhw88pdnW/sh
         0mhfBarjKntwWqB7xZMoDTvvX7J9uPYAe2mIL+9O7YcLs/JHel+EtttxKzxYoLskXfcZ
         bBpcjMu4Bb/kLPmMIXlYgVvpsYlYdc8It4TMkF27UNF0Tc7IGyTfDZSkXy3KvaZQze2+
         xvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=taa3AgrUGklZBinkwVt0bQeh1ht8ynjIrx3kuUJRxJw=;
        b=2Oyl09wxThmV6mkB6+cdkfXU7ewC6y+wUOREoIKoohYxaTZYqAd+HrFtvWz/yt6fcI
         27fe9h+8qp7MKa0/hLKo42IPJBx7iuPsEBxibamx9tPN4xUDg11NG9cip2x9EiNQdm8R
         DEDR+BwF2/aEEhCpue8akxxIxWN19RsCd/xspaaCKfFPGslSZgyGO6xo6eLY0WBViPmz
         LssrfjZWwgpn1+rrll20s3JntvFC7VTWeORRQ0btgAX8S3tfyR7kzw/YA118/cQAgo+b
         kQy3LRoLp+09EAXxe8LrICRqXHWAKP0IR+p0ngd0f2MdgEUZFI4+fKW4AUA+DoxaMGIM
         47og==
X-Gm-Message-State: ACgBeo3FVvquM0dOPbN0D3WpUA9u1p9hz0BMVsoTfkVg5TyVXKHpWtCo
	Z5jU5WUKqSXhfJxHGk7bHPKW5A9KJPDZ
X-Google-Smtp-Source: AA6agR7ev6SqhADqDt5uLWdJHobeI3O4tugxHnBnZzIqU9aNAwe8a818CmiT0W42Jhsf3qgC2JcEr6Zr1uz9
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:ccb1:c46b:7044:2508])
 (user=irogers job=sendgmr) by 2002:a05:6902:549:b0:696:42fd:60aa with SMTP id
 z9-20020a056902054900b0069642fd60aamr464473ybs.575.1661532335547; Fri, 26 Aug
 2022 09:45:35 -0700 (PDT)
Date: Fri, 26 Aug 2022 09:42:41 -0700
In-Reply-To: <20220826164242.43412-1-irogers@google.com>
Message-Id: <20220826164242.43412-18-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220826164242.43412-1-irogers@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Subject: [PATCH v4 17/18] perf top: Fixes for thread safety analysis
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
index 5af3347eedc1..e89208b4ad4b 100644
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
2.37.2.672.g94769d06f0-goog

