Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E857CA5D
	for <llvm@lists.linux.dev>; Sat, 23 Sep 2023 05:36:04 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-59c2ca3bcf9so52539517b3.3
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 22:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695447364; x=1696052164; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a5vqIfXNWliDocU8tzStcp+r+OU5EjvAXvx9gVnGgcs=;
        b=ot8IY3I/znxRkxpFg8IGqaEQepiILSuAbuH1SuXDUMTnKryNpz0eJZJvaPeWrw3IxQ
         ay4QUYkCvYB/lUeU4BN3FL3slXKf0iCY3jO6pexX4kYsqnY9GIjFJz9HB0kR26nGQyOd
         hBCMoh2s3NTJ/RAwueourzx5mDw99/+lAplnwze0H6pQd/3iWEQFHo2p+bLYQydCwzYc
         BClPzOKbpGP5m4b/UfJ9Fo6mvPl4AbjCaqhZ37Fx9TDgav+zOy09AwFhbzvgF6QaP7e6
         W8cPwXg99TDvs7C3oCfy85U3oZt/WBhsuuDHRiYDMq2tOauC7PdaiIvv+QI6odBMUzBo
         hhkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695447364; x=1696052164;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a5vqIfXNWliDocU8tzStcp+r+OU5EjvAXvx9gVnGgcs=;
        b=tRUpQok0JtzNt8AAUBzR4neJ+K215fTcVutjc9KBtqDoVRy37kFVK2bon4hyQuT5As
         f7KUa2957AE4XNHR3YscVrQz3ajC2Ty2EAYhUH5pB/ZnKhKK449mqs3DC4kKmPe9veKQ
         AIHIcT3lMfLe7wQzlkwxl+C9Qp3NnTAkBGCe4lWRG2YiUvs9EyTFgyYcpCRaNQUiLfDP
         6Kw+A0Nz4A10vDqfjJiCPiSNiEgwQyKcLphmdKVuh7yBCG65UbvzoJ7CH4VdEC6vPxIg
         +M8ZLPl2hTt5Mg5lE5EsbaUhZFHwR9viPPD+2qtzkcwVq8FVWcny3JC0ifXxtiPiMHTv
         9UUA==
X-Gm-Message-State: AOJu0YwS/Y6u3fbIDBycUvMpmdFmARJMPHf9TPo6PZr+AQDss8f0okXu
	7D8ajMvCcoz4UJOh35fPQx+8RdbcU77k
X-Google-Smtp-Source: AGHT+IEsgOcl2A0UL8zGlp3FXRaWIZMQmNaQRl2Uoy/Z9jK5/KtmB2FVYeGP9zN3vSGo3xTtN8wODP+0jzxj
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:a376:2908:1c75:ff78])
 (user=irogers job=sendgmr) by 2002:a25:264b:0:b0:d7f:8e0a:4b3f with SMTP id
 m72-20020a25264b000000b00d7f8e0a4b3fmr12822ybm.3.1695447363914; Fri, 22 Sep
 2023 22:36:03 -0700 (PDT)
Date: Fri, 22 Sep 2023 22:35:09 -0700
In-Reply-To: <20230923053515.535607-1-irogers@google.com>
Message-Id: <20230923053515.535607-13-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230923053515.535607-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
Subject: [PATCH v1 12/18] perf hists browser: Avoid potential NULL dereference
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
	James Clark <james.clark@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On other code paths browser->he_selection is NULL checked, add a
missing case reported by clang-tidy.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/ui/browsers/hists.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/ui/browsers/hists.c b/tools/perf/ui/browsers/hists.c
index f02ee605bbce..f4812b226818 100644
--- a/tools/perf/ui/browsers/hists.c
+++ b/tools/perf/ui/browsers/hists.c
@@ -3302,7 +3302,7 @@ static int evsel__hists_browse(struct evsel *evsel, int nr_events, const char *h
 							&options[nr_options],
 							&bi->to.ms,
 							bi->to.al_addr);
-		} else {
+		} else if (browser->he_selection) {
 			nr_options += add_annotate_opt(browser,
 						       &actions[nr_options],
 						       &options[nr_options],
-- 
2.42.0.515.g380fc7ccd1-goog

