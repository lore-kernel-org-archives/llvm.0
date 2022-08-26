Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41E94401
	for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 16:45:28 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-340a4dcb403so11975897b3.22
        for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 09:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc;
        bh=qVZGUrjNaf+uaIklV22hg50RBgn+7V45ToWO7LHu6z0=;
        b=KHJFy5APhi23hCB5yhBJbIt9QnW9DPxdVtwh9gL5fbHIYRHK3POGYS46+q2HkyOStC
         76K6TkDIM4sJYciYCZapgV+g78ZVpk+J4MwS4SdpMuSUyUj1+4fLMR5afhfyFuWXTpmU
         ZDI89zMH1X54UbxfpgRHoJ8NKFjReW0C17bEAFMiD2YuZo9/MlfTIgj6OoCs0J/6Qs9v
         Pvk6mvDm/iNVPGZ6P+HTAHuE75ABfGTMz4NSGJZyWLpb+bOxLLiomAK2i4UP5IPDIORg
         2nD82jqta63p0XiFw5/8qAyBlH+7+B9IyCPQLmSFDJElrJtkcY+fpxPVGMM09tEFQx7F
         DJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=qVZGUrjNaf+uaIklV22hg50RBgn+7V45ToWO7LHu6z0=;
        b=P2q02ErY7omOGYbtT0djqI0/su91FjcvDhKvmH4155xZbbsdmssAk6ykqd8ug5QcuZ
         8c7oM0qm6NqJrFmG43Wg00EKdzXBDLXr9WUDUcO0bjSTzomd7Gxst32OWUEwWkee2Zb2
         ESUxeRtZxcE1h/iK2iHgk0gGtKtB31YHCXHwDgvnFk2OqCf8MlCSkGkATR2ucBzGIiWh
         HYZ9ZZwkKVLBZIQ9hnHg3gWJYSij+pAyBjWyMKPDpcicht4lWQRhKGqOy40pJIjRZIhk
         Zrp3JEfDfJucqGO5OOSLQS0Ez0XSdw2BvIH7V9qpyOYqUOF1w0UYrkNyLG04I6L6djS3
         1YHg==
X-Gm-Message-State: ACgBeo3xJUFKp4C9qvfapSxhp+zepKRgpwk0s/O4135jHaRws2ZFA5zm
	mRkaaJjC2aYunCscvUeSSc90wTSTzYvz
X-Google-Smtp-Source: AA6agR6J0Hznz0vPOdzwS6MMpPQI4D+kQEceU90qKk0iVhgT86mCXFGZ9ZRvq5vU8WGX7k2j0+P8PXMbYM+2
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:ccb1:c46b:7044:2508])
 (user=irogers job=sendgmr) by 2002:a25:b901:0:b0:682:66a2:f714 with SMTP id
 x1-20020a25b901000000b0068266a2f714mr428844ybj.577.1661532327823; Fri, 26 Aug
 2022 09:45:27 -0700 (PDT)
Date: Fri, 26 Aug 2022 09:42:40 -0700
In-Reply-To: <20220826164242.43412-1-irogers@google.com>
Message-Id: <20220826164242.43412-17-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220826164242.43412-1-irogers@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Subject: [PATCH v4 16/18] perf sched: Fixes for thread safety analysis
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

Add annotations to describe lock behavior. Add unlocks so that mutexes
aren't conditionally held on exit from perf_sched__replay. Add an exit
variable so that thread_func can terminate, rather than leaving the
threads blocked on mutexes.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-sched.c | 46 ++++++++++++++++++++++++--------------
 1 file changed, 29 insertions(+), 17 deletions(-)

diff --git a/tools/perf/builtin-sched.c b/tools/perf/builtin-sched.c
index 7e4006d6b8bc..b483ff0d432e 100644
--- a/tools/perf/builtin-sched.c
+++ b/tools/perf/builtin-sched.c
@@ -246,6 +246,7 @@ struct perf_sched {
 	const char	*time_str;
 	struct perf_time_interval ptime;
 	struct perf_time_interval hist_time;
+	volatile bool   thread_funcs_exit;
 };
 
 /* per thread run time data */
@@ -633,31 +634,34 @@ static void *thread_func(void *ctx)
 	prctl(PR_SET_NAME, comm2);
 	if (fd < 0)
 		return NULL;
-again:
-	ret = sem_post(&this_task->ready_for_work);
-	BUG_ON(ret);
-	mutex_lock(&sched->start_work_mutex);
-	mutex_unlock(&sched->start_work_mutex);
 
-	cpu_usage_0 = get_cpu_usage_nsec_self(fd);
+	while (!sched->thread_funcs_exit) {
+		ret = sem_post(&this_task->ready_for_work);
+		BUG_ON(ret);
+		mutex_lock(&sched->start_work_mutex);
+		mutex_unlock(&sched->start_work_mutex);
 
-	for (i = 0; i < this_task->nr_events; i++) {
-		this_task->curr_event = i;
-		perf_sched__process_event(sched, this_task->atoms[i]);
-	}
+		cpu_usage_0 = get_cpu_usage_nsec_self(fd);
 
-	cpu_usage_1 = get_cpu_usage_nsec_self(fd);
-	this_task->cpu_usage = cpu_usage_1 - cpu_usage_0;
-	ret = sem_post(&this_task->work_done_sem);
-	BUG_ON(ret);
+		for (i = 0; i < this_task->nr_events; i++) {
+			this_task->curr_event = i;
+			perf_sched__process_event(sched, this_task->atoms[i]);
+		}
 
-	mutex_lock(&sched->work_done_wait_mutex);
-	mutex_unlock(&sched->work_done_wait_mutex);
+		cpu_usage_1 = get_cpu_usage_nsec_self(fd);
+		this_task->cpu_usage = cpu_usage_1 - cpu_usage_0;
+		ret = sem_post(&this_task->work_done_sem);
+		BUG_ON(ret);
 
-	goto again;
+		mutex_lock(&sched->work_done_wait_mutex);
+		mutex_unlock(&sched->work_done_wait_mutex);
+	}
+	return NULL;
 }
 
 static void create_tasks(struct perf_sched *sched)
+	EXCLUSIVE_LOCK_FUNCTION(sched->start_work_mutex)
+	EXCLUSIVE_LOCK_FUNCTION(sched->work_done_wait_mutex)
 {
 	struct task_desc *task;
 	pthread_attr_t attr;
@@ -687,6 +691,8 @@ static void create_tasks(struct perf_sched *sched)
 }
 
 static void wait_for_tasks(struct perf_sched *sched)
+	EXCLUSIVE_LOCKS_REQUIRED(sched->work_done_wait_mutex)
+	EXCLUSIVE_LOCKS_REQUIRED(sched->start_work_mutex)
 {
 	u64 cpu_usage_0, cpu_usage_1;
 	struct task_desc *task;
@@ -738,6 +744,8 @@ static void wait_for_tasks(struct perf_sched *sched)
 }
 
 static void run_one_test(struct perf_sched *sched)
+	EXCLUSIVE_LOCKS_REQUIRED(sched->work_done_wait_mutex)
+	EXCLUSIVE_LOCKS_REQUIRED(sched->start_work_mutex)
 {
 	u64 T0, T1, delta, avg_delta, fluct;
 
@@ -3309,11 +3317,15 @@ static int perf_sched__replay(struct perf_sched *sched)
 	print_task_traces(sched);
 	add_cross_task_wakeups(sched);
 
+	sched->thread_funcs_exit = false;
 	create_tasks(sched);
 	printf("------------------------------------------------------------\n");
 	for (i = 0; i < sched->replay_repeat; i++)
 		run_one_test(sched);
 
+	sched->thread_funcs_exit = true;
+	mutex_unlock(&sched->start_work_mutex);
+	mutex_unlock(&sched->work_done_wait_mutex);
 	return 0;
 }
 
-- 
2.37.2.672.g94769d06f0-goog

