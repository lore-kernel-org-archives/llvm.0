Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC1543A84
	for <llvm@lists.linux.dev>; Thu,  5 Oct 2023 23:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M34XelFy"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-5a23fed55d7so22028807b3.2
        for <llvm@lists.linux.dev>; Thu, 05 Oct 2023 16:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696547366; x=1697152166; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uSqAvWdBbUtQxC7pnyJJtR4WVxr7hcg6OVnTaxh+F6M=;
        b=M34XelFyaXuDfy0d0jfieqyIfRR8QJfMyN839wY+XJ2x95Uajcr3/yG3+mAK5UWkIf
         2A2nNBfETzYUd6mzduLOHZ4VV7vMrB9yD79MnhnBEk7ObCabRICCLq5bdbuSqn1WG8bN
         p9HuVpNviPsqNIiFXpfsELY21Mvqp7qqk6NSww8QLRSD1IgUSRz+ccZcgfIjfODaK5R7
         oqyZWJuEPi76yplvK0EvTd29zEvewv/6NdIplOKFINViIQr98eZIOUVOwZhU/JK3UXFD
         arAjXQlm5JvkE8ef5IfJUq4yOTZznObcYIHvPZYbHvWmPyU1UPBhiT1wGdbR9pphrTiJ
         AIqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696547366; x=1697152166;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uSqAvWdBbUtQxC7pnyJJtR4WVxr7hcg6OVnTaxh+F6M=;
        b=tFPFejN7ZNJc/exTHzvlZjwyQW1pclA/NKBR7qDw98owPq+FxW7cNRUVe8uF+j84cl
         cfcd/+D/LzHD+JbzMr6pjeoaJfWOE4T0f4ubN0NmYwDhyBXK6OllrpvDdYSxZpW+ABW0
         usgUwu29lYuPKIBpNxFHWAwQl2EIEuXnx4Xp10+Texm9hsIVqRJwS6QbjoO/t45MKXoa
         WUozBr0mziE1PeWtBD61fK+JmvfCZw0UKqGExTamG0Ijh9hF+bPN/fqDPHny6oLoJb4j
         TSlonW7eDgRnPn7JHcPsmg1LK7iXIljWgOoUQsiSOM9tOuCyV0P0HFbbFryoJ86RgAVQ
         NkzQ==
X-Gm-Message-State: AOJu0Yzn1rsV+47dfE+CzWxdv1wNTt8wn8uOVRf5O63ir1m0QqOjpyGt
	SzIaGW50oY9FUPdRazg4WTNNc3ddTvy8
X-Google-Smtp-Source: AGHT+IEYRgFM2NV2BQHADakfTQjBrB/7bt9C3vOnga95X2gYJqpyJ21VOHkHsl8QQL8bn7YhF9HuuYUts//N
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:7449:56a1:2b14:305b])
 (user=irogers job=sendgmr) by 2002:a05:6902:181a:b0:d89:3ed5:6042 with SMTP
 id cf26-20020a056902181a00b00d893ed56042mr106147ybb.11.1696547365955; Thu, 05
 Oct 2023 16:09:25 -0700 (PDT)
Date: Thu,  5 Oct 2023 16:08:45 -0700
In-Reply-To: <20231005230851.3666908-1-irogers@google.com>
Message-Id: <20231005230851.3666908-13-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231005230851.3666908-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Subject: [PATCH v2 12/18] perf hists browser: Avoid potential NULL dereference
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

