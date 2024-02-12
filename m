Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96914596F
	for <llvm@lists.linux.dev>; Mon, 12 Feb 2024 18:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707764353; cv=none; b=hvvytrfEEIv9S3dgtRlVv8f8jgKvICZLJplesLYNtIYUFK31Dy3NfDYWaEoRXrCmbC9r9OMX6RvRLxPpjJr3oCZU71Mdm/K4YujymUQ61rmTKXAhI8kVTLhQ23CW8jzDz1RBdvzqsFbrDhYuBKywc40H19B/PZEIoaXItYU+t7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707764353; c=relaxed/simple;
	bh=9GvaQ8U/ciyGf0POxeefEusSW20t+DHMSsugj/N6ETY=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=qtoNwdl51tsSncYFrQvNrMuw5TjiAXelSkf3cV3iqM4SFOu+fDHtfA4p7H5UScZvzouRHCXmvcMv5vyDhyuQ6yXfQUxUTo++dd0qS4qv3+ikEF/Hjb8ZtFrIXimoXQymny72K/UNF5B8EY7AvYvxIQOng8cOjUPMvInDG9g72vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fBZ4DP8h; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fBZ4DP8h"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dc743cc50a6so104339276.2
        for <llvm@lists.linux.dev>; Mon, 12 Feb 2024 10:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707764349; x=1708369149; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F6UUwQ6uU0gh1AgBT5LAdlyWuLVQW/eRWP9wNVATd0w=;
        b=fBZ4DP8hv6mUYMEgwWiHGz0+Vbtxx8c73MO8cOlTO7PGqdWKrqCrfwKI3pYDjM4G2w
         uD9Ee7LU7u6Pw9Au7StQapxzxtUp/Uz6t4wmMYKEEyCIyYwDExtM7ijl6k2UZkcchHxB
         M3+Xa2Y5pTT8NnALfzCXh6IAMSfUa/8hiupQl/9T7ZkzxBUkFutYjnOh/4N2dcysrC6P
         fX49OMojT8yXp0lYNo/SrI22ytSqgsckOVjr9C6hJmplHVcbv3EcJrOcir29yHJITIcX
         9tRBxKlgsxK5wNH88iGcTUpThQXMuVfIq3n3J5dRMDcnNpWpweLkPIPhOwB2zTXMFG13
         EARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707764349; x=1708369149;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F6UUwQ6uU0gh1AgBT5LAdlyWuLVQW/eRWP9wNVATd0w=;
        b=gSxoV2cPeFkB6VLjcx7g87IPFtUv5DdHnnZ+JDXFzdg8acW6ttD021dPz5XpNAG5v1
         8etDaP5+gqYoeG5e6uVwDrLmygfivrPpEvbAh0zEnyXUkKDnUFii7MlVLk2vu8LSRE5w
         1Wzw2+9AL0qUxyq/CHi/MD0REJfKWTdnqSDXGoT2Eh4iMkzr1++7F+vVj6XLoOVUzaR1
         x+D82GlZvKthX53zuZ2GX9u7nPwsTQ63vFsO1pZygsmxcmV5ieEXjw7cg958NG5kNEm7
         n6w5i+20pvQVA0yWK9d+9F7yJX070P3SQepw6FGVhZCArBVjVfQmypGm/ytX9HwCynIa
         cJVw==
X-Forwarded-Encrypted: i=1; AJvYcCU95OSJB7QDNlygXC9rwmcSLST+JmszzIIypNc2dpp766w16+nhJ21MzrC6MbLLrZ4sRQjh3biAXIVIrYCsZh+iX8WGOg==
X-Gm-Message-State: AOJu0YxfuZ3xNw27/zhCSuU33MLNkBr8azqsT0R33/Y9Bfv/+Nu9zC1W
	BzQxqsRwf91YsB9ZcsvCj5rKppIRlMqxHJIdw5Ctsywe/Tt5rbdRXIlfIAebNSYLgcBkQQyiqaF
	dKjBEbQ==
X-Google-Smtp-Source: AGHT+IHSN4ECweWB1sjgp7X1buxa09RypuopSmFNaefe0SEaS78M3SDkr3wLQ4m5gAc4tVA7kyQuIFcZ7NsM
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:125c:bcda:4fe2:b6e6])
 (user=irogers job=sendgmr) by 2002:a25:aa2a:0:b0:dcc:41ad:fb3b with SMTP id
 s39-20020a25aa2a000000b00dcc41adfb3bmr6327ybi.10.1707764349685; Mon, 12 Feb
 2024 10:59:09 -0800 (PST)
Date: Mon, 12 Feb 2024 10:58:51 -0800
In-Reply-To: <20240212185858.68189-1-irogers@google.com>
Message-Id: <20240212185858.68189-2-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240212185858.68189-1-irogers@google.com>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Subject: [PATCH v3 1/8] perf thread_map: Skip exited threads when scanning /proc
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	James Clark <james.clark@arm.com>, Athira Jajeev <atrajeev@linux.vnet.ibm.com>, 
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
2.43.0.687.g38aa6559b0-goog

