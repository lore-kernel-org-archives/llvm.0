Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2941D23BC
	for <llvm@lists.linux.dev>; Thu,  1 Feb 2024 00:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706746523; cv=none; b=slVR+7TM4OHLZA/NBHScEREyuVu08mN1txjozMPK2WElo1jSCvviFvOoMXAw7+jff27+I/nqdVz0kwUIa5X5pmf8JT3fGY4X+trMnJNIPpe77h0i3dWQjaBhe2RC9t3pFQ06liaojBNTTPMk0BHiupx4hiw10mbGyixxuLja5k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706746523; c=relaxed/simple;
	bh=27wmXzsgBuwC0/tRLzTcix6eSwjml4hF8vNJfLSfj4s=;
	h=Date:Message-Id:Mime-Version:Subject:From:To:Content-Type; b=h46l9i4HCO/yeRUzNr4F+9vC4MmnEJQV5Cp5mwqPwSUzsuiTiX2odq0fZ52k6NQ+sIcB+FISg9LTYQ5kmeFcCXsAUeEufdWMqZ8Jzl8LcimZV2ViSiQ6j6kVhcM0zNClUEKL11fz8BuLrIvdWd5NLIMKZ/lI6+Yhr5gM1AZfbUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YQ4+K88J; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YQ4+K88J"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-604186a5775so5858357b3.1
        for <llvm@lists.linux.dev>; Wed, 31 Jan 2024 16:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706746521; x=1707351321; darn=lists.linux.dev;
        h=to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2F04A0OfF26PLB6g2tCcO6N4OtMZoaSU7mdBY8RaIms=;
        b=YQ4+K88J1rJ1E6/LYl9+GJd/f2BpqcuyPO9h4/HUyvqnmGoo2aMbRez9hD/g8ascYY
         WfjfCs/7Z4NcpmmXPvG7pqUFjktYergrMBzhUCsrb7eRRE6BDOB8EYgwWAdR7niNDyKH
         vRKnOOuOzb1jZOxGm7wlnrP3xuXzyL6Lby0uLzmxkzGAPwLvzoXfDm7EMdZFmFtPsVN6
         IXV8LJTVypCPGJlGDk9+7Js1PD/RmqifMbDWJ54z9/wwWyTqTnAH4os+NUh8LKrAfgGG
         hiD92Xt0q4Ew8f6HPA1sgNVvvBim6DajAiu6h7Y5RgejJixYLl/9ie160UpLfjbndKle
         fwrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706746521; x=1707351321;
        h=to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2F04A0OfF26PLB6g2tCcO6N4OtMZoaSU7mdBY8RaIms=;
        b=WCvJ+mm+vjDV9GgeQHbzOSaC8HTKkIxztB3NWWvy7Fv1j0ODut4wJxZ/qq4/FVboJj
         6aaQWKoywG0PnXgfZ1ND1vQ3LvJBWRC3opD34ctTEErMA2FEM4OZWuxiOQ4AyWHOV3wa
         sbmUUdWarPwhbZDjmiFBWnxkzBKt5sqo5OM1WWhlILEG3jKmyLae4q/8ViMz7xr4H+zw
         daGSguOw+D2/85ccllEtz+7Wumc/RRfacWNE4pMYd2iulIPJkuFPO/gEaVEQGR8cGmHM
         CWk4WR+7FK9SIw0tDGqpx3ML/ai39f5asnUJgeEz7p73+76mHNmc6JyKgzrb2K2pJanE
         LydA==
X-Gm-Message-State: AOJu0YwcI3pTYCusoD/jntetPWb9RD/21zYIoVF/AQcoo5t/akwOuSeD
	Ch3Fi71NZ5h3+JheK9hmsTwR9nkIlRZjJY6e7bJSjDcGzEAdtui3/LHz9aDGT+/k322fPWPdaWG
	vRyLfxA==
X-Google-Smtp-Source: AGHT+IEK8rHCIOvwsV2OYlNOOUXAaJ8tOl4BTM1Fvzt31QXvwhU+AVupSdgj4QJrnxEwKerQdml7nlb2kwFT
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:16c5:1feb:bf99:a5d1])
 (user=irogers job=sendgmr) by 2002:a25:8912:0:b0:dc6:19b9:5b83 with SMTP id
 e18-20020a258912000000b00dc619b95b83mr1132435ybl.6.1706746521125; Wed, 31 Jan
 2024 16:15:21 -0800 (PST)
Date: Wed, 31 Jan 2024 16:14:55 -0800
Message-Id: <20240201001504.1348511-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Subject: [PATCH v2 1/9] perf thread_map: Skip exited threads when scanning /proc
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, James Clark <james.clark@arm.com>, 
	Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
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
index e848579e61a8..18fbc41d09f3 100644
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
2.43.0.429.g432eaa2c6b-goog

