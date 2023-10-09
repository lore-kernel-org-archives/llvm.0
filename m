Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099C018C20
	for <llvm@lists.linux.dev>; Mon,  9 Oct 2023 18:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NVd28QDv"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-59c0dd156e5so81021197b3.3
        for <llvm@lists.linux.dev>; Mon, 09 Oct 2023 11:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696876789; x=1697481589; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Btc8+OmE4IzA7UOP/eGTa4MmLZMG3XazqMQBeE66ZYs=;
        b=NVd28QDvdvhpqjDpHKTsKRzhYnoGhBl8hJWkxppd0tigHcnWKqfehvKMxbLiEcfOuP
         2TvDVqInn5DngiqhcwaUaRlFxDrHW8TmNhjvmWUZPvLjGXqcHhVUP8WXAM+0W62VQZqJ
         Lq0tl3Q/1mu660FE7qBbbCWz34OeIjsD6QCITYK4P37T3voIWJCHguEWfnBr9u4QZXUT
         wLVG7Jzf2fBFhjp5j73ccKHboCl0Wv2RiN5tyFakE/hoECwfC+xI0V6lxGs0ZHgHrw7Q
         WDw7f4EhB8xyYWoIBk//lDiP3tdetMNL4jbqoeZOaSxJxt6S8DauSLPhNpd4DMNJtONw
         F6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696876789; x=1697481589;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Btc8+OmE4IzA7UOP/eGTa4MmLZMG3XazqMQBeE66ZYs=;
        b=S23goVVlP3UDdc1v7BB0/Uqrk5LDsuzQdzTP1DuFyScFaRSxzbgB9sD2R/kHWF1FUE
         LYpp9w0N5PWGu8lCwIW8m1d+1rgejvqOXTZSVM0pfSRiSPG9hBWhUXZ3mypbBrVNjwzO
         C6Ll78ybcd4GcHEoXmRfe/+/9o1/qHbdDZ2lLMIW/WtLpvr5rs9bvTrlx9uTwyYWyI/8
         +giLmm+swnUxZ/OsivGBPMspAWG0NklJuA/kPpPlPxsPnjdhgFM8ndxz0/DX8jGMrUjr
         TnQO120xPAbo+nvClhXAc4xGupxhw6x66+IPJq1EB7srpH+QPW4IXDt8ty1mCceoJKxa
         UVQQ==
X-Gm-Message-State: AOJu0YzmVIPx+hioiLfMo6mORe67efxRR10beklEyBG6vs8WJ+xwccqk
	M6qluBo5s8AyIneXMZe4bQ3vbzb1zfLk
X-Google-Smtp-Source: AGHT+IEx3Hxc/LpzCERzTEobvjg4svKw6js0XFbWqMEIgj61DG4507hSvRf9frx3x/Ew/SETU4UYqOBaGS51
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:ac4a:9b94:7158:3f4e])
 (user=irogers job=sendgmr) by 2002:a05:690c:70b:b0:565:9bee:22e0 with SMTP id
 bs11-20020a05690c070b00b005659bee22e0mr297980ywb.0.1696876789191; Mon, 09 Oct
 2023 11:39:49 -0700 (PDT)
Date: Mon,  9 Oct 2023 11:39:11 -0700
In-Reply-To: <20231009183920.200859-1-irogers@google.com>
Message-Id: <20231009183920.200859-11-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231009183920.200859-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Subject: [PATCH v3 09/18] perf dlfilter: Be defensive against potential NULL dereference
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

In the unlikely case of having a symbol without a mapping, avoid a
NULL dereference that clang-tidy warns about.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dlfilter.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/dlfilter.c b/tools/perf/util/dlfilter.c
index 1dbf27822ee2..5e54832137a9 100644
--- a/tools/perf/util/dlfilter.c
+++ b/tools/perf/util/dlfilter.c
@@ -52,8 +52,10 @@ static void al_to_d_al(struct addr_location *al, struct perf_dlfilter_al *d_al)
 		d_al->sym_end = sym->end;
 		if (al->addr < sym->end)
 			d_al->symoff = al->addr - sym->start;
-		else
+		else if (al->map)
 			d_al->symoff = al->addr - map__start(al->map) - sym->start;
+		else
+			d_al->symoff = 0;
 		d_al->sym_binding = sym->binding;
 	} else {
 		d_al->sym = NULL;
-- 
2.42.0.609.gbb76f46606-goog

