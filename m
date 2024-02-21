Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78DF38DDD
	for <llvm@lists.linux.dev>; Wed, 21 Feb 2024 03:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708486928; cv=none; b=stOhoryXFlbW7hfPE0np8GmWv8cXcXNz6LYqyO70QaGirfFlmLo0NbxoCOZJYEIEndetOOxCvIKBs0TkRnegU55zZmdO91Be9udH3IyfjYU4kZSo7W8i+mpJ9mWKwyjXOHxjTyBhTePpww7YbGcNkA5K6xTL6ufL8vziBklgw20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708486928; c=relaxed/simple;
	bh=o/osGCI+hvlD14sD3OCM5ESdLYEEWx1V7jgoXENiCKc=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=M57/eSjcaneLOOf91tI/HDJloplSQ/ZVywikCILKpubAkK6K4AvkgFuh1Z51AbA+6o5w5155ZhF9BlevvWj1B/8/urgfwQ2pdlp1oVpBPBtGrlfGVYm1KKfVT0EY91zHswy5gFKBy+e0azb+2bfykt+bGviRxNhG3OjJee0FiO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WOE57Ayt; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WOE57Ayt"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dcc15b03287so8550946276.3
        for <llvm@lists.linux.dev>; Tue, 20 Feb 2024 19:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708486925; x=1709091725; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uv/9NgKdLz0z52mqtvy0vTSbbBgaPJcb0Vk69+L979Q=;
        b=WOE57AytgbdQKKNjITpWqNwHrnpBbNJNt3vszPAo863GQ/zsX7QYP5BaWcQh8YoKrX
         K928sX82fjZjFhE2fyqj+jFiZSCNvUFNOjaTkeQs7OrwPYMN50ai/uqIFnMCjVxMkrMz
         X/H/vgPe+X6zjFvnwVVN462k6Nx7tRX/7CJWB60KgWz65wwy+a5epoPD5o5m4D821wz8
         yTGGO4Mavz0dKJXcWojec/XnT5Puo+ncd+IGLajR1tKBJKsu03WgeIYLoc2BO7tEIJls
         OF63t1XGjfkki1STvD6/qK2mPt+oiQoFqzSCF7ux8Ty3BK1bxs0ewlSkHf5Y1KzMxYsG
         xIVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708486925; x=1709091725;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uv/9NgKdLz0z52mqtvy0vTSbbBgaPJcb0Vk69+L979Q=;
        b=Obd5OrDtqJHqyp3dAk/b5yti6C39RVZCETy+wdWGhlI4pW+fZ3kB+E6e4olDoq0yBn
         by/3WccFhB+HSC8lMtWy47cMQ1IeiWiweJ/KjFgDd69zwTufi0TMcen7zuJt5k8hitxv
         6dUMwUoFf3Yl/PKoTXZtcczoeWqEHdZSK8S+ru5/ZpgiQGqZphRvej3sevdKZ2jQZcFx
         ssvtPfj1SXHQYQT4AI3OU8THbTRmC+SJlc8SEXuXcHHi7HvoWodx3e/kZRj6sItc14Sf
         z28w5+MQWL7VKgcBabDemLpekWn9x++NMROws6M/3Yu6mG8xiT65EM6P7NlgBWDz16H1
         biXg==
X-Forwarded-Encrypted: i=1; AJvYcCUcT5sjs+ZGO2Fj+SoilalXvCorACxgErl9yXnE82Ifu52jcb+SXc5338EXaFY1BVCxS+brQ4jxHQ7z+BNDDBb77S7oJg==
X-Gm-Message-State: AOJu0Yx/zdAIN8ofDptl7zzGfRcVPC8z3RijJJaZfIAhBxhfb4su0zrM
	XMqUSyF1SGFXOvLnYAty59IrQilW9u922hHkolf7K1/CEWryajaQ4zmKghtaR1c5F4/Qe/1PPI9
	J3ek2OQ==
X-Google-Smtp-Source: AGHT+IGqHOfbFeUMm04fgBII6BGPdq0HLJ7wcSG61rdgw+C9Xjypqm77xVwuEi9AZKTTTzR7Hwymw6gQ+OLN
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:3c02:f882:5876:b7ab])
 (user=irogers job=sendgmr) by 2002:a25:db93:0:b0:dc7:9218:df3b with SMTP id
 g141-20020a25db93000000b00dc79218df3bmr708882ybf.10.1708486924814; Tue, 20
 Feb 2024 19:42:04 -0800 (PST)
Date: Tue, 20 Feb 2024 19:41:48 -0800
In-Reply-To: <20240221034155.1500118-1-irogers@google.com>
Message-Id: <20240221034155.1500118-2-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240221034155.1500118-1-irogers@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Subject: [PATCH v6 1/8] perf thread_map: Skip exited threads when scanning /proc
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Athira Jajeev <atrajeev@linux.vnet.ibm.com>, James Clark <james.clark@arm.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Yang Jihong <yangjihong1@huawei.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Scanning /proc is inherently racy. Scanning /proc/pid/task within that
is also racy as the pid can terminate. Rather than failing in
__thread_map__new_all_cpus, skip pids for such failures.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/thread_map.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/tools/perf/util/thread_map.c b/tools/perf/util/thread_map.c
index ea3b431b9783..b5f12390c355 100644
--- a/tools/perf/util/thread_map.c
+++ b/tools/perf/util/thread_map.c
@@ -109,9 +109,10 @@ static struct perf_thread_map *__thread_map__new_all_cpus(uid_t uid)
 
 		snprintf(path, sizeof(path), "/proc/%d/task", pid);
 		items = scandir(path, &namelist, filter, NULL);
-		if (items <= 0)
-			goto out_free_closedir;
-
+		if (items <= 0) {
+			pr_debug("scandir for %d returned empty, skipping\n", pid);
+			continue;
+		}
 		while (threads->nr + items >= max_threads) {
 			max_threads *= 2;
 			grow = true;
@@ -152,8 +153,6 @@ static struct perf_thread_map *__thread_map__new_all_cpus(uid_t uid)
 	for (i = 0; i < items; i++)
 		zfree(&namelist[i]);
 	free(namelist);
-
-out_free_closedir:
 	zfree(&threads);
 	goto out_closedir;
 }
-- 
2.44.0.rc0.258.g7320e95886-goog

