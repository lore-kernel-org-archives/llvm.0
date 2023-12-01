Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F941619D2
	for <llvm@lists.linux.dev>; Fri,  1 Dec 2023 23:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="re9JmNZX"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-db7d201be93so872007276.2
        for <llvm@lists.linux.dev>; Fri, 01 Dec 2023 15:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701474639; x=1702079439; darn=lists.linux.dev;
        h=to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PMWeTAylF3bUIvrApUeKD5Af/l0nzPxNAdOfQ8ZWtyk=;
        b=re9JmNZXkr8o/aNGSRX72XSo6oMbAvP2VwLNFW6gGwiDRVJVLBpFLbd4ia5qUB9SwO
         kefIszXCkVGFltSoZbkmdKXhefjr9BWWULgGSEQLKeJwGWNhOtecQ1z7m2palVOZQQsD
         HXbQ1QvUyV4DA+Ff7kJcaV2QbtIjbcroilfHgfWsGNI65LtSHOa1mnELMUDXeeVO0BsD
         h8vXLFP0OmJ+WXT4AxckxzodIv17Rt3rZFgK1tg5bj8QsqmOhvkAFrlNpCpJgUNQlvPR
         28jnNPKAQUD6BlxZqC+U8IXtFuEzlJsuU5TKShesZMC2FI6/U3HPYyuh37nzXS6ifkx4
         Ue1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701474639; x=1702079439;
        h=to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PMWeTAylF3bUIvrApUeKD5Af/l0nzPxNAdOfQ8ZWtyk=;
        b=lXqbLFVTm6Mc8b6uWiMbglujs0iR6UH7/kz4Cq+lJM0/n9t2AmxuN/9kzSsQA7/bvi
         n7WAzNSozU5DYvuVfHMyvEoaNCHAfuXz0NLvaG6kdoM7m6BJ9+dmgyHxNh5/uIv+VKu2
         GTAgOl3shNDFdYsCZOSEuVQVMtnLEtZu/7o8R1e2bqGUmbabrl0Hw37p3Srblq1UwSa8
         ToFI5cucrRI0sQhd98MeCxWMv5fIpRRpR73k5hl8hODxe/BZvDdOB2xH6+gzIzAbmxcq
         176hG5wG5E4BqKcSYMWffpWoSvtg4o1DlhtXCVyhiOF5DjNsbwvnEpzNHXD1bj9ubtTK
         yw2w==
X-Gm-Message-State: AOJu0YyO3dnHg5w8v0DR5MUf9o58vQGDATITRcs66nHgUKitmFjEFXAR
	/c/ulmH/eQPgFSdAVtL9B3MVGhPuhccK
X-Google-Smtp-Source: AGHT+IFNARd7MyKjCR2gLvJy45/OB20UrZiZukoWo3tgtMA/0nbQdgyhR+LI1WVbM0lMkdiPHvakkjNz/pMc
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:df3:224b:7b7f:efc5])
 (user=irogers job=sendgmr) by 2002:a25:dad3:0:b0:db5:3d61:8e63 with SMTP id
 n202-20020a25dad3000000b00db53d618e63mr241281ybf.13.1701474639430; Fri, 01
 Dec 2023 15:50:39 -0800 (PST)
Date: Fri,  1 Dec 2023 15:50:23 -0800
Message-Id: <20231201235031.475293-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Subject: [PATCH v1 1/9] perf thread_map: Skip exited threads when scanning /proc
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
2.43.0.rc2.451.g8631bc7472-goog

