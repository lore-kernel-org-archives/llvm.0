Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FB614001
	for <llvm@lists.linux.dev>; Thu,  5 Oct 2023 23:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="03LAQllx"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-5a507eb61a6so21366457b3.1
        for <llvm@lists.linux.dev>; Thu, 05 Oct 2023 16:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696547349; x=1697152149; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i2XqQMJ0GkpZoKYBOeb+AHUkFWOwFAfTNDekNOfqFv8=;
        b=03LAQllxPrwuM/pplAU13NoF0ksb6v/CWQT9d5ylOxs3tYA1IMgamE1DsIBt994cjJ
         WKlzBrZYthaS/REgg0pH2W16/0CS8X93wzMkBg2ve9PW/6eRMVl5kExuNQStBMG06kIm
         EBnttWJFiGUYZM/pD6jgJreBbxRA9Jj9MFFzNh4pbFCgG1F95oOTPv2dMRZnqfPmRG2M
         mcKNFkwOdmsopc1ODQTIMa/KLxCUbexIJrvWK6rBXmBXI7P2zugORAty7FwDemaZzqyx
         caZD9XibWgZdUsfCVOjFV/owwspTxtaj2zxH39iAbhGMtyFD2Vy5f14z7Y6iNLmbbbyT
         WjWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696547349; x=1697152149;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i2XqQMJ0GkpZoKYBOeb+AHUkFWOwFAfTNDekNOfqFv8=;
        b=tb9MYFlhB3wXLIT7RUiC1nuTEM3dsnxMpR6MHdHDBhalytRQYvl4xrYdrE5dpbdpuY
         Hdmk9CmW3DAzT656xT/zn8u75sOCE+VXlnnmYBY1J5wAtiZHQuxBcMrSU8YnW/2qG/jV
         7Je+yye1bfULEEuZWBN0RgKJXsdzrNkQl6pGRSiIbpdkfYTnmg9cDDrAjPpGT/EnUcMN
         aAPqBuQBDUHlRhuUBjH4RUMcQsuZ2zse2mjMQiUkShzm/v4j/Vcuj0RqwTuNAGrDwakJ
         7bZFsYbnbdpq08GWvlRRanBvijP3aHYFb1bII+xp1b4NGe6QB6NgbWynoI5CMQ71Gofp
         lySA==
X-Gm-Message-State: AOJu0YxiIB46yaxM2ST7PRBLH7lDI5vUmmXymTjjzC6hvQTgLpxMuehy
	v/cg9pKqiHDZV48Krue4+7Oq2gALIGxV
X-Google-Smtp-Source: AGHT+IGfGlEcR5cafu/s4l0RQy8FE4MK3zRFkQ6Zp8BoRNaDEtxn5kvn9B3Xn4doaEJk2RCpa1Y7G/TCwC7Y
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:7449:56a1:2b14:305b])
 (user=irogers job=sendgmr) by 2002:a81:a9c4:0:b0:59b:eace:d467 with SMTP id
 g187-20020a81a9c4000000b0059beaced467mr116956ywh.3.1696547348754; Thu, 05 Oct
 2023 16:09:08 -0700 (PDT)
Date: Thu,  5 Oct 2023 16:08:38 -0700
In-Reply-To: <20231005230851.3666908-1-irogers@google.com>
Message-Id: <20231005230851.3666908-6-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231005230851.3666908-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Subject: [PATCH v2 05/18] perf bench uprobe: Fix potential use of memory after free
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

