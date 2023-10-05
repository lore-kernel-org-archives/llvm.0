Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB7442C0F
	for <llvm@lists.linux.dev>; Thu,  5 Oct 2023 23:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PEOxWN2L"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-59f8040b2ffso22553687b3.3
        for <llvm@lists.linux.dev>; Thu, 05 Oct 2023 16:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696547363; x=1697152163; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a3F7gnNpkmZUAErgbCdtUAHzB9Tx2qchcvlKXuBK3uQ=;
        b=PEOxWN2LVDPbJv+qUXhPdXpziHs6fRlOSb4qEubTAiDBBdP6XxDEbB6WmFTu1xqkqv
         JC4gBCL9ww/Y/Ko9nCxGEjvcQLX/PlPpGPWsqzTTD/3Avi05/G7+yM42XnO9DggHIhk0
         Bbl6vhguZwE7fZGQBBYwZ5P0BT4iXm83h0FBytmLz9S4XBcdFpIWtqggFp+ug/+INOAs
         bpgcNb5KtrEXuG23+DJ9so7oiYT9s93+3fvcAMZuhpRNPBUw2eLJEwAdj36gb8en6IG8
         Pq04OWXlQAnEHQNmbhb2UUiCl6PXJVppuFBFkh/lNihgzqzOKJjTrLrYcshR3svNMB5o
         eA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696547363; x=1697152163;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a3F7gnNpkmZUAErgbCdtUAHzB9Tx2qchcvlKXuBK3uQ=;
        b=T6pOi6piX0UoLynvKQkSnV2MGKSLulY7/XNUdidcGivGLf4iOpG4+WPBVA1AyfZa6w
         /NkggJIRooNKt5Uos1uERGZunPU+1zBD6wOg7eZ/HvqXVMl5jKKDiRHfw+2E1cpAO6Ts
         rZkb9PbShqK+EmCYia6sBxSeevG3ONtp+/+pUib1/HM+w2G3DR6YZtj/++NgvRyrZ9/X
         sqgNhtndfof1+U/zpnYrtFd8XarGpHBL2wiHzGXF0bEToGnWj50FUuNLVCmzGeXJe8PV
         EWxrQKFi90jnjjnW8LTnZekhgLTKeJ2Q3DIl50l6gXVmGxTDtPXfRB/WYrrHj64VMbhd
         kBnw==
X-Gm-Message-State: AOJu0YwB6saLWWx2m8sOPdP7qS34OJQ16uiNMrvNn8exihSwgbMDs92t
	8AiAaAJzxzDaXJIirWI9k0nil0Sp6tiv
X-Google-Smtp-Source: AGHT+IHoFU+z5aCBXXTlJuMvUJucciH7eGrZGAnChgvuI/WO2miJm/u/BOXK9wZuLbh4UH+ko6EzN43c6WUR
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:7449:56a1:2b14:305b])
 (user=irogers job=sendgmr) by 2002:a05:690c:fc9:b0:5a4:f657:5362 with SMTP id
 dg9-20020a05690c0fc900b005a4f6575362mr116930ywb.3.1696547363151; Thu, 05 Oct
 2023 16:09:23 -0700 (PDT)
Date: Thu,  5 Oct 2023 16:08:44 -0700
In-Reply-To: <20231005230851.3666908-1-irogers@google.com>
Message-Id: <20231005230851.3666908-12-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231005230851.3666908-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Subject: [PATCH v2 11/18] perf hists browser: Reorder variables to reduce padding
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
2.42.0.609.gbb76f46606-goog

