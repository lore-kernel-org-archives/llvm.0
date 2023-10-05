Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F2643AA8
	for <llvm@lists.linux.dev>; Thu,  5 Oct 2023 23:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vviiJkSg"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-d91c3b26c9eso1393828276.0
        for <llvm@lists.linux.dev>; Thu, 05 Oct 2023 16:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696547375; x=1697152175; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oxVOZd3C3ppqYjNmukwrdUncP0WHK7JyRq4ciQhpawI=;
        b=vviiJkSgUefjbrI27bXq7K6S/8jwtDUvW0jSMyouH/Q/+uT//pLvAWu3NG8B8QH8F1
         +aYdF0TSjFuzZYtdTGu0v1KXe0XI43VXRjPSrE+BhaRPLkjZxL9qKWkkoSJWN1WDGHIy
         aMhZfE0JkeQQLb56NOOlPq+M87SkwhhbDy4mX1UtMOZvf40F4KsOt8e251wQAQTLoU83
         4Nsjt5h2+w9d+cth35SWODZvMe7dvkBljw4cINQX6ew1pkO71jg+In+PBDu2xDqJwS7c
         HeO59klei5s6PZKHYmbCqF+EQ22nfuOSv2KNw3wrwQWSU9NprKZZaH6vbJUVciJj0eAZ
         YdMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696547375; x=1697152175;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oxVOZd3C3ppqYjNmukwrdUncP0WHK7JyRq4ciQhpawI=;
        b=YnSqLHAmEhCqtbKMfKVcjs9wCS9YQGeKLpuDNtt6X+EgUWJXSK7lToY7G86XPiwXJp
         X5WmgqSJZOi8dZhwRMi7r74iaF+BaJ9nszW4J0JCZOV7lXjF2YKpUM63oHn6+zH57lEl
         1NIdYG6a6IaIXTd0u64C5iM1TZWw2VoEdL44pwL9bhpc3qrzZUAtORkM/VIcJ/Tuzwle
         AqkdmszJbRz9JCxbLhJz7+eNx+d8+MPSaBX9Ul+MV2GJmv9puyBviZBRpewqCGZtkhwb
         GwNPCTFC32jECSTTF3Wnoc/evJoTlKMnYLLd8J0PquDYHscQU6d5I2d9pNKoYam9tb4n
         sSxA==
X-Gm-Message-State: AOJu0YxSwYc1mlUhPEkBAOkgTeUmeGbSMXt2FTl8fxpiN4Fin1CckKK2
	XOx8jpfxcvK6AKqP0pHNvmVZQ/Cdw9Iu
X-Google-Smtp-Source: AGHT+IGhoEJjFH3ZasD0vN2aSL1BJQWA509hpCLmPH3Yh8OO4E14fhwoU9hhQx/jEj6F0UZsTT+z8Dsn07pZ
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:7449:56a1:2b14:305b])
 (user=irogers job=sendgmr) by 2002:a25:6a04:0:b0:d89:42d7:e72d with SMTP id
 f4-20020a256a04000000b00d8942d7e72dmr57696ybc.3.1696547375084; Thu, 05 Oct
 2023 16:09:35 -0700 (PDT)
Date: Thu,  5 Oct 2023 16:08:49 -0700
In-Reply-To: <20231005230851.3666908-1-irogers@google.com>
Message-Id: <20231005230851.3666908-17-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231005230851.3666908-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Subject: [PATCH v2 16/18] perf trace-event-info: Avoid passing NULL value to closedir
From: Ian Rogers <irogers@google.com>
To: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Yang Jihong <yangjihong1@huawei.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Ming Wang <wangming01@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, Yanteng Si <siyanteng@loongson.cn>, 
	Yuan Can <yuancan@huawei.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	James Clark <james.clark@arm.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

If opendir failed then closedir was passed NULL which is
erroneous. Caught by clang-tidy.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/trace-event-info.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/trace-event-info.c b/tools/perf/util/trace-event-info.c
index 319ccf09a435..c8755679281e 100644
--- a/tools/perf/util/trace-event-info.c
+++ b/tools/perf/util/trace-event-info.c
@@ -313,7 +313,8 @@ static int record_event_files(struct tracepoint_path *tps)
 	}
 	err = 0;
 out:
-	closedir(dir);
+	if (dir)
+		closedir(dir);
 	put_tracing_file(path);
 
 	return err;
-- 
2.42.0.609.gbb76f46606-goog

