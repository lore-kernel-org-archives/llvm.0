Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696B328D83A
	for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 17:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746035513; cv=none; b=uoh65KL6Z/fzGgSjkeVy4ilZ0bFkWinbR0Q4Ldw3yhDoXJvwEa/0Gv7vVHoWZPSDbtkT1hM531f7lRk3PbRO8YJS01Y80CSGeAr6K+Bjzp1X+wSPALTTN6O0I7B8BUt1CLd/WTesHRmmi3OWaLBiKHVJqUdSDrBTFhcMXbI3dM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746035513; c=relaxed/simple;
	bh=cRmg9Uhy/kSRny4v9VxENzuNJ6XDnUaDzdD6WOoauU4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HWMelS77ap8KkD/CDNpheZN4++fv2WjpakMaWyCGo9DYS74ZWlp7LCihp8n0EWLtlvS8ZtrG8NYC2+WmOR1FQkuPqLzFVfxdlZMN1y1HmHkMeQ64f1FT/iR2sLCj7kGbDiHMT64+sF7qg/dSM9JW341WmQ1B90QMzvPv66gEYjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rU/vJMol; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rU/vJMol"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7398d70abbfso193808b3a.2
        for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 10:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746035512; x=1746640312; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eLABi1cAYEw9fAUdNsHNLvlLHNMrUQ32W3A6QzBe7uI=;
        b=rU/vJMoliikBpUQ3U90P7ow8ybrfZ27s0LrJKO5kr/ujFLdyqlU+WY0WX6NZomlB03
         FRB1sSouMK+cqLt/c26eU6YXTNymEznfiH6FQ3QusPmzJBXHR75zCczjCK12aa955iEy
         wJcdtOWYSyH+rYwkIwROKgaun88pENsB8b//N/eJbG8LURst6ikeh/M3HU+CX7vNrV8V
         3C6wLxYTbWi+5DYDrFPBKaguxLuGJMJHmrS0VF3VEIx8ktEStro5urwPuTFOp62dV7CB
         5dlo9g5GNkw9qq8ryU1D+TCZxgwka9FfEy3lh+9/xigTIqFFEszj2lv/evUPmdhPW+Uz
         ReNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746035512; x=1746640312;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eLABi1cAYEw9fAUdNsHNLvlLHNMrUQ32W3A6QzBe7uI=;
        b=Jrv3Z3+WVLkXNPof4aiChWL2V152mMoCPV/UfqXXBS0ec+u5BpglG/s/b/02KVJ4CB
         NMLRNdPjQ9CrZFqaO76WwPJXemMd05AXZeCzLPW0bLO4y7TEyoX+71ZPUJ/7b3wUDGNR
         QmDPPVycSs3f5DABdGzIgFSf1cudH12lS0YmHDt484uyErgHvrCCAcV58Ttw6fa+Hxfr
         MFmsvJtCFo8Lu3lcKCjUcBsucv7BnU7/V5uUV0m7UKu4ZEFa6hAJLpYwj+6iKz9RRbb2
         BiIoK4utIBtydDJ/b1H1NfXRibu33UWjcO/a2cjPxJb5amn6Fz7PZAnhTiHIB/vgDUlC
         n3eA==
X-Forwarded-Encrypted: i=1; AJvYcCVQ47PLg+XPShbh23kOlqH4UZwT9BM099rZnh0UhbkungJc6GbKh6y1H0ME8ZdH9rp28pcR@lists.linux.dev
X-Gm-Message-State: AOJu0YxKIn0ttZQxK47OSwWqgGLe7XnpNPrwUN2Gkt78YVU1eB8jnZCQ
	7hlJz6kX18rQ2G5NrfyxfyDGsntMZm3XPNSWUNExI034sELim7Y76DsgKirNugnLrrDi4evoipR
	FUDvNNQ==
X-Google-Smtp-Source: AGHT+IGIUuzSwqqdo5HW7am+AeE4/a6b6jacfSJCk8vxA7uRt24KCIqbt8SNuwNGgHLKwxFchcrFLUe52XI7
X-Received: from pgam20.prod.google.com ([2002:a05:6a02:2b54:b0:b0b:2c1f:b8b3])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:6f05:b0:1ee:e33d:f477
 with SMTP id adf61e73a8af0-20ba6ff8e7emr145936637.15.1746035511348; Wed, 30
 Apr 2025 10:51:51 -0700 (PDT)
Date: Wed, 30 Apr 2025 10:50:15 -0700
In-Reply-To: <20250430175036.184610-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250430175036.184610-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250430175036.184610-28-irogers@google.com>
Subject: [PATCH v2 27/47] perf kwork: Silence -Wshorten-64-to-32 warnings
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Thomas Gleixner <tglx@linutronix.de>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Yicong Yang <yangyicong@hisilicon.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Kyle Meyer <kyle.meyer@hpe.com>, 
	Ben Gainey <ben.gainey@arm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Kajol Jain <kjain@linux.ibm.com>, Aditya Gupta <adityag@linux.ibm.com>, 
	Eder Zulian <ezulian@redhat.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Kuan-Wei Chiu <visitorckw@gmail.com>, He Zhe <zhe.he@windriver.com>, 
	Dirk Gouders <dirk@gouders.net>, Brian Geffon <bgeffon@google.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Howard Chu <howardchu95@gmail.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Colin Ian King <colin.i.king@gmail.com>, 
	Dominique Martinet <asmadeus@codewreck.org>, Jann Horn <jannh@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Yang Jihong <yangjihong@bytedance.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andi Kleen <ak@linux.intel.com>, Graham Woodward <graham.woodward@arm.com>, 
	Ilkka Koskinen <ilkka@os.amperecomputing.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Zhongqiu Han <quic_zhonhan@quicinc.com>, 
	Hao Ge <gehao@kylinos.cn>, Tengda Wu <wutengda@huaweicloud.com>, 
	Gabriele Monaco <gmonaco@redhat.com>, Chun-Tse Shao <ctshao@google.com>, 
	Casey Chen <cachen@purestorage.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Li Huafei <lihuafei1@huawei.com>, "Steinar H. Gunderson" <sesse@google.com>, 
	Levi Yun <yeoreum.yun@arm.com>, Weilin Wang <weilin.wang@intel.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, Thomas Richter <tmricht@linux.ibm.com>, 
	Andrew Kreimer <algonell@gmail.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Jean-Philippe Romain <jean-philippe.romain@foss.st.com>, Junhao He <hejunhao3@huawei.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Xu Yang <xu.yang_2@nxp.com>, 
	Steve Clevenger <scclevenger@os.amperecomputing.com>, Zixian Cai <fzczx123@gmail.com>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, Yujie Liu <yujie.liu@intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Cc: Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

The clang warning -Wshorten-64-to-32 can be useful to catch
inadvertent truncation. In some instances this truncation can lead to
changing the sign of a result, for example, truncation to return an
int to fit a sort routine. Silence the warning by making the implicit
truncation explicit.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-kwork.c      | 11 +++++------
 tools/perf/util/bpf_kwork_top.c |  2 +-
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/tools/perf/builtin-kwork.c b/tools/perf/builtin-kwork.c
index c41a68d073de..cc5488cb98e4 100644
--- a/tools/perf/builtin-kwork.c
+++ b/tools/perf/builtin-kwork.c
@@ -1574,8 +1574,7 @@ static void top_print_per_cpu_load(struct perf_kwork *kwork)
 		load = stat->cpus_runtime[i].load;
 		if (test_bit(i, stat->all_cpus_bitmap) && total) {
 			load_ratio = load * 10000 / total;
-			load_width = PRINT_CPU_USAGE_HIST_WIDTH *
-				load_ratio / 10000;
+			load_width = (int)(PRINT_CPU_USAGE_HIST_WIDTH * load_ratio / 10000);
 
 			printf("%%Cpu%-*d[%.*s%.*s %*.*f%%]\n",
 			       PRINT_CPU_WIDTH, i,
@@ -1595,7 +1594,7 @@ static void top_print_cpu_usage(struct perf_kwork *kwork)
 	u64 idle_time = stat->cpus_runtime[MAX_NR_CPUS].idle;
 	u64 hardirq_time = stat->cpus_runtime[MAX_NR_CPUS].irq;
 	u64 softirq_time = stat->cpus_runtime[MAX_NR_CPUS].softirq;
-	int cpus_nr = bitmap_weight(stat->all_cpus_bitmap, MAX_NR_CPUS);
+	int cpus_nr = (int)bitmap_weight(stat->all_cpus_bitmap, MAX_NR_CPUS);
 	u64 cpus_total_time = stat->cpus_runtime[MAX_NR_CPUS].total;
 
 	printf("Total  : %*.*f ms, %d cpus\n",
@@ -1801,7 +1800,7 @@ static int perf_kwork__read_events(struct perf_kwork *kwork)
 	session = perf_session__new(&data, &kwork->tool);
 	if (IS_ERR(session)) {
 		pr_debug("Error creating perf session\n");
-		return PTR_ERR(session);
+		return (int)PTR_ERR(session);
 	}
 
 	symbol__init(&session->header.env);
@@ -2088,8 +2087,8 @@ static void top_calc_cpu_usage(struct perf_kwork *kwork)
 
 		top_subtract_irq_runtime(kwork, work);
 
-		work->cpu_usage = work->total_runtime * 10000 /
-			stat->cpus_runtime[work->cpu].total;
+		work->cpu_usage = (u32)(work->total_runtime *
+					10000 / stat->cpus_runtime[work->cpu].total);
 
 		top_calc_idle_time(kwork, work);
 next:
diff --git a/tools/perf/util/bpf_kwork_top.c b/tools/perf/util/bpf_kwork_top.c
index b6f187dd9136..808d0c84d26d 100644
--- a/tools/perf/util/bpf_kwork_top.c
+++ b/tools/perf/util/bpf_kwork_top.c
@@ -219,7 +219,7 @@ static void read_task_info(struct kwork_work *work)
 	int fd;
 	struct task_data data;
 	struct task_key key = {
-		.pid = work->id,
+		.pid = (__u32)work->id,
 		.cpu = work->cpu,
 	};
 
-- 
2.49.0.906.g1f30a19c02-goog

