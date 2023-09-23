Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8315F469E
	for <llvm@lists.linux.dev>; Sat, 23 Sep 2023 05:36:02 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-59f4bd6905aso17798347b3.3
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 22:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695447361; x=1696052161; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KS6/0u50No3rQJjH5fZIjyCOWL67f6naMZwh43hSjoQ=;
        b=G+/qjp1dbpo6YEiBZ/i9nIbQ2dVMxamsU8VY7A6fgTZg0Mi9LHwShlvUiA//a7bhp1
         YOm0JsOwXaD+u3cEmc/vakEwAlIUsL6ZjnmQmhzfXegwdMIoIZCmSepd1Q456T6ow+rB
         Iiv3/PD0QF0PXWaZukw+fbnVFHcFPtBBykELaBCKJ8bViP0DcCcK/O8z/nkD8j5Mw0Vg
         QaQ8vGDZoCMFBdUG1J8PWHcPkKwFTJ5c2dfxJA0g0ykZ/VmOvXfm4rao1SUfHQF18s10
         SiZArHJ+7Bctyg/k5LzTf3w59yNEF35XE619gwfQoAC+lxKL8tgl1Eo0jw5ep/K/27/r
         S+aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695447361; x=1696052161;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KS6/0u50No3rQJjH5fZIjyCOWL67f6naMZwh43hSjoQ=;
        b=iDNwQsyKBA7zgRsEqWSdpA4KPJ/CJGyVsyQ7VwPMMfV5+hbX4r8iDULMVGy5PA4d/y
         1XOZFtgFEYdZESaiXJjDtpQBtOx+1BIk5B5N+1SR8BZcGMa7CLo3MOLZAQR1lyuimTw6
         2QX91ZTniCbXek+kYNu5tHWHHniWtz6KWuoxqEJw8NuHeEGKab5CkZA4AtXuXoi8ewOG
         Ye3+e3krGPowMqPWd6EsxSsYua3iqoa69losZ1opNQUSHcqzRcB7vzoxJOtMujN6utl7
         EQJh+WalJVbQnfU8Zi1/s4B0LhrpmVDoGQ4zbk2rIe2DjZsBwiq1eVw27RdN2TK7cb/E
         CZhg==
X-Gm-Message-State: AOJu0YygUceaVB4gi6QCS06s8LhS0fyi2UI08VeytgOz21TRT0koudxV
	Xlb7iCzFTUCHZvQBf8ChVggcoiR8FAFU
X-Google-Smtp-Source: AGHT+IECwTxHbmPoI1K04GORCbxem+8maRhSeJmf/Mja5259t/O6+9DbPUULMmgIJZReDHjnxiFQ+xTHxGuS
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:a376:2908:1c75:ff78])
 (user=irogers job=sendgmr) by 2002:a05:6902:1105:b0:d81:6637:b5b2 with SMTP
 id o5-20020a056902110500b00d816637b5b2mr14388ybu.0.1695447361524; Fri, 22 Sep
 2023 22:36:01 -0700 (PDT)
Date: Fri, 22 Sep 2023 22:35:08 -0700
In-Reply-To: <20230923053515.535607-1-irogers@google.com>
Message-Id: <20230923053515.535607-12-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230923053515.535607-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
Subject: [PATCH v1 11/18] perf hists browser: Reorder variables to reduce padding
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

Address clang-tidy warning:
```
tools/perf/ui/browsers/hists.c:2416:8: warning: Excessive padding in 'struct popup_action' (8 padding bytes, where 0 is optimal).
Optimal fields order:
time,
thread,
evsel,
fn,
ms,
socket,
rstype,
```

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/ui/browsers/hists.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/ui/browsers/hists.c b/tools/perf/ui/browsers/hists.c
index 70db5a717905..f02ee605bbce 100644
--- a/tools/perf/ui/browsers/hists.c
+++ b/tools/perf/ui/browsers/hists.c
@@ -2416,12 +2416,12 @@ static int switch_data_file(void)
 struct popup_action {
 	unsigned long		time;
 	struct thread 		*thread;
+	struct evsel	*evsel;
+	int (*fn)(struct hist_browser *browser, struct popup_action *act);
 	struct map_symbol 	ms;
 	int			socket;
-	struct evsel	*evsel;
 	enum rstype		rstype;
 
-	int (*fn)(struct hist_browser *browser, struct popup_action *act);
 };
 
 static int
-- 
2.42.0.515.g380fc7ccd1-goog

