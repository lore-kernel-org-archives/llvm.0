Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042BB20F8
	for <llvm@lists.linux.dev>; Sat, 23 Sep 2023 05:36:00 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-59beb3a8291so52251607b3.1
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 22:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695447359; x=1696052159; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pCtwtK8xajC9XBojO6y6JASy5d+HVvOMNbjwUuJaLFE=;
        b=1NPTfUrkeS7AvXLIgK3pPYg3hMvpEsgHOceqQKZbJ8zqhnYhzA0NT2RhXurI3Yv+xp
         DZdyiZhw7Oq3JpGNMitU0vRun2bOown1gga1MoJGrOl6mRih1yFoNpfOIiEUTMcLxUdQ
         0+cC8aDhx18ggQIPcYDCzwbQ3r5H4B1wXp+1qPqcmsHN9+EmFzYmeGgvcv6aDfeT4SwD
         upEJI+KoDOpjynuYI+V7ixHXqruGjSckDSMr5QZSwQCkqy2L9ja/XElQX0ZWuHvTDR0Y
         0RD+07CrPjt2Uj+6Xdovu+F6zsgjOXxEIB5wTKOXZsInWd691cc1qTICGMAU5bgfgGlr
         fNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695447359; x=1696052159;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pCtwtK8xajC9XBojO6y6JASy5d+HVvOMNbjwUuJaLFE=;
        b=i7pOl9hr4sIg16wrTRuMJl1GRAiDEmuaZlixlKw9qZuQtIOEPAsrZ+8pQUttndZ9md
         njs+EBWo9c74dicgayKFMO5BVZVTqmbKDFkvB/4gbVOB/bA4X1yXileIJ2llpa2+hKIK
         Am/ioCYWbfGv9PRo97mI7c0kOf338LnR5frZdc0AwQyujN4WSaFSzBMVP31a2P3i9VEX
         MbIpHbhX+4aHm40Kc8pezEPxZLzLxUJQoM0DSMc91Ni4E/9052UvB1WDpTfK03/nx7i3
         K1cFs/vSc5R4lSTHANEQ/C2pC5pYVQhFC1ZmY3RiSLzhOkiXLWDPBufJQsgeQ+IPS2PP
         SHuQ==
X-Gm-Message-State: AOJu0YwoBP5hKzYtmRowDvU/1pld/ySzT7mHZo9zcKIh8RLIWckA2xrX
	59kdEcKNtW4FzeCTMV71S0HT2ATtuj+I
X-Google-Smtp-Source: AGHT+IFb+mlhJVRkd55x1iEq/qHM5aF05s6yk09PvbU0fJIXBSHtgAy824hVDau+Ns2A4L4kX9JpuxpfL/T9
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:a376:2908:1c75:ff78])
 (user=irogers job=sendgmr) by 2002:a25:d251:0:b0:d62:7f3f:621d with SMTP id
 j78-20020a25d251000000b00d627f3f621dmr13487ybg.11.1695447359056; Fri, 22 Sep
 2023 22:35:59 -0700 (PDT)
Date: Fri, 22 Sep 2023 22:35:07 -0700
In-Reply-To: <20230923053515.535607-1-irogers@google.com>
Message-Id: <20230923053515.535607-11-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230923053515.535607-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
Subject: [PATCH v1 10/18] perf dlfilter: Be defensive against potential NULL dereference
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
2.42.0.515.g380fc7ccd1-goog

