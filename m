Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514C337170
	for <llvm@lists.linux.dev>; Mon,  9 Oct 2023 18:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zm8m8us7"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-59f8188b718so77598187b3.1
        for <llvm@lists.linux.dev>; Mon, 09 Oct 2023 11:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696876799; x=1697481599; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=niI1DS8q+ZbexmAiDdLr0rnTr4377R73icOoozlTydQ=;
        b=zm8m8us7MpyHpLIJhtt3pJIkYBDCvkP8znto3ytu9K9dqbE2IxvRacWDE3nPT2B9kC
         ItHHsoWsrjBbh4LbkGlPmyvjtVxwCOiuFUIMPegsbcEsf1TCAs5G6gQ5eNMfPBWgDwXr
         rM33ubJFIc18LG96qzgUlyq62so1QghIBMwWI9kst6N6KE/tOEPrWOfCQO8/4N6LB52p
         owTUNSkTb3UZ3gncuGd/BBkQYmGrkEa26fB1220Ad+4oTjXvXNfKZZQnyinwNEps5Ysx
         DhAj7xRNKM8v5kCZajkkyt2x63YzvRBi/5yR6faCaPVAlMmcx6fnb1M1uQ25MHRb7MeK
         dFXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696876799; x=1697481599;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=niI1DS8q+ZbexmAiDdLr0rnTr4377R73icOoozlTydQ=;
        b=OYLTVcOn0KIau95QIWFQyjiD0iRShPzNAaUBjLXhdnSxcdqTC5FSoqXfo12URRE0iZ
         P+JHbSX4mFLP8IkPZ7z9X+j6WYoEKXfjaIJQyQLHe0YcWMs+ejalOOMmvNDVTWbWUajN
         YwWXa2Ns/RiBnxfQxH8NxXQcTPI0q5zWNYdxsGxw+Sm8gQlG3xWwa8/f5DzG1gCoGx6d
         NDuLtLSJt3QKg9A4rkrQpjhtDs2HZEGVkfl+MiMNFiwzFzcbsZhEZtshPE7Ek45wQtU/
         cSgr8Pcco+VHmzyTOwTeVB7/XRbinrdAkN7k35KIEWpweuKrtc6NLzrI/aUgcbvGW37b
         iMcQ==
X-Gm-Message-State: AOJu0YwWM5Bs8wbZshuYdL3zUcj5P0II43/M+oSnOw3RVRiwxUXt9Ps0
	65zT9VuEZotnbMdWJZQhEhAieboM1S6V
X-Google-Smtp-Source: AGHT+IHVauHFJJ6dURYCURIsUyMaH8uHK9E3Vkz92KCp4HMULUMevSk/Te5SUgiu4nvqqGfnHApJa8igvKfI
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:ac4a:9b94:7158:3f4e])
 (user=irogers job=sendgmr) by 2002:a25:bcd:0:b0:d7f:2cb6:7d8c with SMTP id
 196-20020a250bcd000000b00d7f2cb67d8cmr247211ybl.13.1696876799415; Mon, 09 Oct
 2023 11:39:59 -0700 (PDT)
Date: Mon,  9 Oct 2023 11:39:15 -0700
In-Reply-To: <20231009183920.200859-1-irogers@google.com>
Message-Id: <20231009183920.200859-15-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231009183920.200859-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Subject: [PATCH v3 13/18] perf lock: Fix a memory leak on an error path
From: Ian Rogers <irogers@google.com>
To: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Yang Jihong <yangjihong1@huawei.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Ming Wang <wangming01@loongson.cn>, 
	Kan Liang <kan.liang@linux.intel.com>, Ravi Bangoria <ravi.bangoria@amd.com>, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

If a memory allocation fails then the strdup-ed string needs
freeing. Detected by clang-tidy.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-lock.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/perf/builtin-lock.c b/tools/perf/builtin-lock.c
index fa7419978353..a3ff2f4edbaa 100644
--- a/tools/perf/builtin-lock.c
+++ b/tools/perf/builtin-lock.c
@@ -2478,6 +2478,7 @@ static int parse_call_stack(const struct option *opt __maybe_unused, const char
 		entry = malloc(sizeof(*entry) + strlen(tok) + 1);
 		if (entry == NULL) {
 			pr_err("Memory allocation failure\n");
+			free(s);
 			return -1;
 		}
 
-- 
2.42.0.609.gbb76f46606-goog

