Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41F31803C
	for <llvm@lists.linux.dev>; Mon,  9 Oct 2023 18:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="td0utrDf"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-d86766bba9fso6666544276.1
        for <llvm@lists.linux.dev>; Mon, 09 Oct 2023 11:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696876778; x=1697481578; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i2XqQMJ0GkpZoKYBOeb+AHUkFWOwFAfTNDekNOfqFv8=;
        b=td0utrDf/VFFQofFCbbCYUeChJGUNU4U1xTSWgz7NCXJ82B9f4hZQtvYo6QI0ens2h
         DrB/lTxLHn/rFnOZsH5daicNt4NKZl4jSnnq3QgRoJNZyC3mj8GdITniOMkxhqQtqJcN
         tTeOis8aFFnTjKkafUYHIg5pMlvog+9jVb5LWrRusve+OxRAFKaisaJ410XEaSUboNbG
         w74DI1xjUijHHcVp6RQYhrqttRDJWQaRJYmLlVZYGVl7p7q41bXeUNLLe3wy2MWmeUGY
         admGTfJij0PNuiY2pTfB7Jl6vAcGdHCxQmO6zC5HagW6UoFSr9DctC1TQejyXPwMo7Ol
         aF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696876778; x=1697481578;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i2XqQMJ0GkpZoKYBOeb+AHUkFWOwFAfTNDekNOfqFv8=;
        b=gRd4O1vAnTI47/ac27ZJO1cDN994b+BqgFNJZ/2IIb7SYycr12EQ2g9z+/Ve5ddNX5
         NVSLSX1F/wyWNSP4H6H7jfdR2diBJih0sOCSIOnL/lgnd/y4Q4QBYZwQ4wSUiYq0IFee
         0+XreQo9aWRCGZdKtLj2G4Y8Gs28tCQ33WUgjVwwFVkspJ+KDgMMlrTpUyc0HnOwwuck
         EcXoDzGickwmaVTL7C5whOPkhYyWiQPjbiaw7Yk+lnN2dyasd+o2exni3iysfOo9/IWx
         mdfQu9ictzVMUlIs57Vp5MwZUGBLMYa2FNBFvPfOnYdbB+X+WQaVtYpQGQogGzfIqe3p
         xHLA==
X-Gm-Message-State: AOJu0YxGUNYYGYbZt84DZtt2Z30ENkv4cz+cB32waasXjNowpFvKSvJa
	lnhbshCrShnEP7/ayWL8ZcmIyOUgZN5k
X-Google-Smtp-Source: AGHT+IFVQJ/rmIGeQNoKkkKpAugRtmgnX9tZ+jNylIGNTuhY5/8aroNIOiM/mRV+TG9ICzlWJvJ2+NMEzLcQ
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:ac4a:9b94:7158:3f4e])
 (user=irogers job=sendgmr) by 2002:a25:bec9:0:b0:d9a:5349:4bdd with SMTP id
 k9-20020a25bec9000000b00d9a53494bddmr423ybm.8.1696876777869; Mon, 09 Oct 2023
 11:39:37 -0700 (PDT)
Date: Mon,  9 Oct 2023 11:39:06 -0700
In-Reply-To: <20231009183920.200859-1-irogers@google.com>
Message-Id: <20231009183920.200859-6-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231009183920.200859-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Subject: [PATCH v3 04/18] perf bench uprobe: Fix potential use of memory after free
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

Found by clang-tidy:
```
bench/uprobe.c:98:3: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
                bench_uprobe_bpf__destroy(skel);
```

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/bench/uprobe.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/perf/bench/uprobe.c b/tools/perf/bench/uprobe.c
index 914c0817fe8a..5c71fdc419dd 100644
--- a/tools/perf/bench/uprobe.c
+++ b/tools/perf/bench/uprobe.c
@@ -89,6 +89,7 @@ static int bench_uprobe__setup_bpf_skel(enum bench_uprobe bench)
 	return err;
 cleanup:
 	bench_uprobe_bpf__destroy(skel);
+	skel = NULL;
 	return err;
 }
 
-- 
2.42.0.609.gbb76f46606-goog

