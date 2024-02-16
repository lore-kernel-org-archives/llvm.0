Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D47149018
	for <llvm@lists.linux.dev>; Fri, 16 Feb 2024 23:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708127717; cv=none; b=DXe4Sn9Fb81ouhxzfaaJQdy8ekm91D28C7UuY3V+j7ZdkT1SlxHPvgt9jv69it03Mmthe39bICXVECetLJcw1LkJEPyFH5SkKbWRZJTKSThw1g+Hso6WhN4TWchOG0jzoLqkepX6WujyJzmo6h/W4LM6OrhrsizjIzv3XGKhIqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708127717; c=relaxed/simple;
	bh=o/osGCI+hvlD14sD3OCM5ESdLYEEWx1V7jgoXENiCKc=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=BSZZeNj+PRjdQD3dA8LgZimFAnGtc9BMncbAFmpcatatFodj3H/rLtkfVOf69A+jVSnGC79BsY81RFYyB4f+pvuLSx4sBua/Uj8F0Wk1HMd7Ld1GOTTa0ykTmubriK6/bgnk1qAkmQmNgLAo3GOL7FlEU12KcBHD0DgDgsilqA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KrkYjWC6; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KrkYjWC6"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-607a628209eso48003707b3.3
        for <llvm@lists.linux.dev>; Fri, 16 Feb 2024 15:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708127715; x=1708732515; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uv/9NgKdLz0z52mqtvy0vTSbbBgaPJcb0Vk69+L979Q=;
        b=KrkYjWC69DvJ9dHxWlpAFHS0p+rHTU6Ad11QF3A6PNDmy6Dwn2BdOS12I29s4pbS6/
         zI2vXok34WsMvSWXAQlmXuSlu5X3WkKWdMSVMBos0IgcioWkglTk0vkQivqu+vHf06/0
         JH8cMP9W3N7aAVjrJKV9WcVYkd05LrJLw53WOfhqvqSH6XC2BgDkC5c+gejQCyqO7zo+
         WAJVeHJi0w636eK4Wh3wpAAuJ5bByssAiNgMj/7aQzM7+Dkwi28J0mpAASceeIdaFayd
         FkkFlTbAXr9VmDjN/2XfedJH6WwYRqBu5mgab7fxqQn7XVgwQbGmTHeCT7D2y4hDopBA
         MC8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708127715; x=1708732515;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uv/9NgKdLz0z52mqtvy0vTSbbBgaPJcb0Vk69+L979Q=;
        b=ARmKRUAIBxJ7dshl48nUBejk/pduDU/MVqHh97A1krQBPhzRkjTdnkHw1h14keLIn0
         UMY3Inc9uQZR4wlVmrklCIgeNTUXuvIpR8j2pCm2jqPhDN2mryhQq9qyrdWB1Am/DR0L
         Tl0zeBINNz1E7ZDAAEc70mtuYDuXrvKh6QvcG3uPbwzbOL3OBvzYnbusG5FLZw2Uw391
         KIcZp/Qi5YtPcrr11kFkLWNfZxri5EqnpCbXsqrgEB0cIL6yo/wCSidzOE1EYMMooUyP
         q9U27BNpXJSV7Ruzjp5ugbbM03IxJHlZ1dB47WjAD5VimPCpYEEIU9uSHLuUhWbhLLQ7
         UNfg==
X-Forwarded-Encrypted: i=1; AJvYcCX5/vd0r1SIDJPZpK52kEKtRoC3tGQhUPOGfQmWTACsnifnqt/tqSFxG4hXYGRQu+ADxW7F+k5uQjDf5NF7X7+1g9ky/w==
X-Gm-Message-State: AOJu0YzjfSc5EkW7VsYqkXKgeSMzxesSMqRIxGSvUAdmcJs4i8UoEiTg
	layrlQLhP24+Ld/U5fL/CynOckLcfPhIfIw6jgqC6ZdKeUtt5j80heDeYbfebiHJ5iLoh/p3UWL
	yMC2mUw==
X-Google-Smtp-Source: AGHT+IERcPUTXLeXd+X0w/UprKWv3njT8nQrdxv6I7DrnPojgAHIii49rIGcmln6wuSiMpr/VD0k58X1CbHj
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:4b5c:352:4272:e34e])
 (user=irogers job=sendgmr) by 2002:a81:4ec7:0:b0:608:cc1:f66f with SMTP id
 c190-20020a814ec7000000b006080cc1f66fmr155163ywb.6.1708127714785; Fri, 16 Feb
 2024 15:55:14 -0800 (PST)
Date: Fri, 16 Feb 2024 15:51:55 -0800
In-Reply-To: <20240216235203.229256-1-irogers@google.com>
Message-Id: <20240216235203.229256-2-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240216235203.229256-1-irogers@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Subject: [PATCH v5 1/8] perf thread_map: Skip exited threads when scanning /proc
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

