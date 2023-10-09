Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF32C18E24
	for <llvm@lists.linux.dev>; Mon,  9 Oct 2023 18:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eXa9FNbv"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-5784ef4be4fso4372535a12.1
        for <llvm@lists.linux.dev>; Mon, 09 Oct 2023 11:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696876794; x=1697481594; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uSqAvWdBbUtQxC7pnyJJtR4WVxr7hcg6OVnTaxh+F6M=;
        b=eXa9FNbv/JvmD1pwNQDU1pGEDdsZ6ncTFrobsu1eIWTrvXWpQrrkR1wk5Gr9ulLX4e
         OTzKL7ejfdyBevRbo3+agejAfGvE5C1cumihbI34C8pDCWijnmhyweJFAaImW4lBJ+b3
         9SLj+JBxyYAH7Y8jAO0f4yatakQm9Ec6519xTC65h0Jcx04eqEu09X54neiJJ0LBZgqt
         B/WJVAdOXZjbwFO4hNqjr4CrtQYHKBaXjW96Enc3VGQt9z4HPfX+qzxzeet17h95Hu5i
         DTfpBEWFb+EKTfmJz8Z/9RgfQ0gBwg0mTPDmq9dYk9uvMDsnsUk6t17rbXpvhNt1BGRA
         C1nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696876794; x=1697481594;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uSqAvWdBbUtQxC7pnyJJtR4WVxr7hcg6OVnTaxh+F6M=;
        b=vzSIbnKpQRhrPaKnBIgq/ddTk0xNSbnE6gRSIp19fL1fXD+4jNUsUbbsz3dfQxy/5N
         sMuyDkqYwZPtpVv1xpL8VWs+OjH6zr66oZjq6+yD82w+juRPgS6biBzuBAIrk5QE83NA
         5mWnsVyQEkpi0s6mvniEA4ztWnAJMJoMawp1ioeOyQMjIhFXRNBRGkhGe/4QU0Su70e/
         lfNGkf/dmt70e23aaClWbeUmxqIkhfGb26wEP6g6RkmkTRD9GvqxOuJyplwKNxrF97k2
         UBkgTUD1hGh/xRY9xBDilwtAe/Cz/U3VNFeAta8zmCSk4I7DynDHwdlkZV8EHYRfAsB/
         DN9A==
X-Gm-Message-State: AOJu0YxGeVlyqqFBdtUE9zasPbVIDCCtRJgere8I9YZGN/QrepXNgakG
	z1aObdrtgBvxxmBvcMoVlSZJexYE2kry
X-Google-Smtp-Source: AGHT+IGswY8IBRO4qisurfCsmW1G2owhcv59h934/6N9kUBhkSh8az8mizPfb84iHYV8EZ8p3euRKpw5IRrs
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:ac4a:9b94:7158:3f4e])
 (user=irogers job=sendgmr) by 2002:a17:90a:bc48:b0:277:d8:abd9 with SMTP id
 t8-20020a17090abc4800b0027700d8abd9mr318272pjv.0.1696876794049; Mon, 09 Oct
 2023 11:39:54 -0700 (PDT)
Date: Mon,  9 Oct 2023 11:39:13 -0700
In-Reply-To: <20231009183920.200859-1-irogers@google.com>
Message-Id: <20231009183920.200859-13-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231009183920.200859-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Subject: [PATCH v3 11/18] perf hists browser: Avoid potential NULL dereference
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
2.42.0.609.gbb76f46606-goog

