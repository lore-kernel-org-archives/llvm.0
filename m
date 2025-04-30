Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DD0296142
	for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 17:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746035526; cv=none; b=mcQGz2uKqcuD/IQKyf16cJYn8f4bpZylVICDg0az0oY7SFNalq8bBZVrLNmeIaGgnIOjxxRF1tDExxV62FR343Zqce3ILyIQI06xgUOk9qSd8axq2ELObedmk69x2IoclBVpLacyMX90/jyJPTvq0jHu5sEInOfG4ROCzcESygo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746035526; c=relaxed/simple;
	bh=NA6JF+5T8PMFE786WZ9is+NQYJJhQbzJSB67SJH2UIM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=thcNSuEeub61GfB2LPJ4V+wFkio2t/I6aR7Iu9DzgXCPQaxh4NDTIFVighIfSowXcWgC8Er2TnRm0ZPpcpBh+RWKQvMUVuZ322UpeLsJDA29lJDCsb4ElTcuQ5C6wKTvD3P6DR1tEzbM1sJqXw9r1juFcIS0MGr4rTC+TYXaTM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FRLcF2Mu; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FRLcF2Mu"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ff8119b436so134144a91.0
        for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 10:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746035524; x=1746640324; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5qLcbceIaYVHwJQzlzAjBxnjnjaX/IxjWID9LpXlzn8=;
        b=FRLcF2MuvweM1KT53DtBaocX4UscsZ1IaPPZfhD8w8NDdllD/HvkWN6aUS/dDeJxr8
         qkwPxFzABnrLl9i0sc6VophYZ7MCareuD7NY9TBWzRQZlB2fhNEXnqH+m8iOEs6XULzM
         mjH58c4od0twosU0hj+JcKlekr5jnfXT/RR3izYPqjkkZvd5/rD9J/P/GQVf29FpiV6V
         +D3qB/2JSsAbl7kTDr85lB1iHneolEIvdBlcZZh3x2VgHGKN+OSVukjKo4zcRsRmbLgh
         kfgaE/I4FFm0egKlt1nGJKxSvS9+mvPZbzK7Y9B7tOA+e7Hs/tne3OoI+N34O67Rptrw
         VUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746035524; x=1746640324;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5qLcbceIaYVHwJQzlzAjBxnjnjaX/IxjWID9LpXlzn8=;
        b=vTNOEJFPRlbpPmaNYjSAmcSysDYGvEJu0hHOsr3Bf3R8rnrNCZBi/dEkuzhC11Cy4j
         LSHMgt+thdG1N3+kO0oGBGjITurO62qjHEjGe0/x+r0c3xqS9RdnJQZGVFxW0fdkXReV
         gASVY1bmOxc4I+0sOun9j84jpRTpYoD62B66dl6VaXC0mRzrR/Mwxw6P+xiO9zudNMLJ
         x8m7F6Kjm6PUqPbmC+/HV2hHCP8/9u0v7mv+tehGDsqlqk/mVHOCY5eaeY+5FWlYeGHn
         Jn7zLjcruI/S99lRablEIuJSFhrKyYueBIf3+NOchbFyQ5kJIW1mt6P9xDS1Gi6uegIU
         V75w==
X-Forwarded-Encrypted: i=1; AJvYcCXYytn8YPIBhp8zoE529UIDpim9U862XPjxnyOxHa6ZbQLov9Ru1ud/IsLG5nN0NNVi6Cpo@lists.linux.dev
X-Gm-Message-State: AOJu0YxyP3rl0bYUKcexutaq4JV0HQl4MUL/b9hKyWjRSqkMXjDqOOU+
	kTdGelh45yw50MrPGfAZ7Qw7yvV9RN9Ya1gtElFTyXAd88fHm6Bu7ShdcP+hN7Ie+jMZbdKTFj8
	+EiGrhw==
X-Google-Smtp-Source: AGHT+IG0fzje+t2hW+hPy3K7I9jJjIAnkr6OhXzLc0jx8cpHraftxXNs9MU4ybMwEqBJuYkZAVaH6/yEYMns
X-Received: from pjbst3.prod.google.com ([2002:a17:90b:1fc3:b0:301:4260:4d23])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2e4d:b0:2ee:b875:6d30
 with SMTP id 98e67ed59e1d1-30a332e9067mr6048776a91.9.1746035524221; Wed, 30
 Apr 2025 10:52:04 -0700 (PDT)
Date: Wed, 30 Apr 2025 10:50:21 -0700
In-Reply-To: <20250430175036.184610-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250430175036.184610-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250430175036.184610-34-irogers@google.com>
Subject: [PATCH v2 33/47] perf bpf_counter: Silence -Wshorten-64-to-32 warnings
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
 tools/perf/util/bpf_counter.c        | 6 +++---
 tools/perf/util/bpf_counter_cgroup.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/perf/util/bpf_counter.c b/tools/perf/util/bpf_counter.c
index 73fcafbffc6a..3b1dbf1f5f66 100644
--- a/tools/perf/util/bpf_counter.c
+++ b/tools/perf/util/bpf_counter.c
@@ -177,7 +177,7 @@ static int bpf_program_profiler__load(struct evsel *evsel, struct target *target
 		return -1;
 
 	while ((tok = strtok_r(bpf_str, ",", &saveptr)) != NULL) {
-		prog_id = strtoul(tok, &p, 10);
+		prog_id = (unsigned int)strtoul(tok, &p, 10);
 		if (prog_id == 0 || prog_id == UINT_MAX ||
 		    (*p != '\0' && *p != ',')) {
 			pr_err("Failed to parse bpf prog ids %s\n",
@@ -418,7 +418,7 @@ static int bperf_reload_leader_program(struct evsel *evsel, int attr_map_fd,
 	link = bpf_program__attach(skel->progs.on_switch);
 	if (IS_ERR(link)) {
 		pr_err("Failed to attach leader program\n");
-		err = PTR_ERR(link);
+		err = (int)PTR_ERR(link);
 		goto out;
 	}
 
@@ -459,7 +459,7 @@ static int bperf_attach_follower_program(struct bperf_follower_bpf *skel,
 	else {
 		link = bpf_program__attach(skel->progs.fexit_XXX);
 		if (IS_ERR(link))
-			err = PTR_ERR(link);
+			err = (int)PTR_ERR(link);
 	}
 
 	return err;
diff --git a/tools/perf/util/bpf_counter_cgroup.c b/tools/perf/util/bpf_counter_cgroup.c
index 6ff42619de12..35d1b950e803 100644
--- a/tools/perf/util/bpf_counter_cgroup.c
+++ b/tools/perf/util/bpf_counter_cgroup.c
@@ -98,7 +98,7 @@ static int bperf_load_program(struct evlist *evlist)
 						      FD(cgrp_switch, i));
 		if (IS_ERR(link)) {
 			pr_err("Failed to attach cgroup program\n");
-			err = PTR_ERR(link);
+			err = (int)PTR_ERR(link);
 			goto out;
 		}
 	}
-- 
2.49.0.906.g1f30a19c02-goog

