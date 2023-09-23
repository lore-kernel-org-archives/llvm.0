Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70D31FB0
	for <llvm@lists.linux.dev>; Sat, 23 Sep 2023 05:35:57 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-59c07ca1b44so52167917b3.3
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 22:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695447357; x=1696052157; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0gGdTy/Hpx4ZQLMYPilsnkHUZ9OACUdEplw6hC2pVSI=;
        b=WMEspIRyTsBPz8pqdAnaoTwS/MTpw3qpvdijhoqVcRNzN6XvYUYiKO7tXwGWsLk4rP
         cHrFABLOOT0VqMYWOXOfRI9R6AL20a3NykQPdhry3cnwiV0Y8RDZKRzqqKp5f5RB8nkZ
         kdbkY0hioAOeoEWWVTRG+pST0Ydv94jd+McYLhVlsdReduYDSSnKhdcuPggyZGzgMEiN
         WPXDXv1MwMY/kwjkMongF9PYk2oHLZTh7wzQ+e7S5OTlsmVeRVrSsNApmlB0vVW3VnXo
         sSZGz6qG6qekHCNh0Q/vVl8cuUic1xhMSTfbsL9lLWAtNSSHixJfp4hx7EZpsrFAGsVv
         0pYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695447357; x=1696052157;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0gGdTy/Hpx4ZQLMYPilsnkHUZ9OACUdEplw6hC2pVSI=;
        b=T/NwbAzxudDQCO0MVUx1+iqe71gnUP/vG2pfvPfKzRkg80WP2cAmONLA/2YeC5LjBa
         EtN1jtzVPjFB5nvK1SN4c4NuvC0v1CVMs5g3dFaClkmxK9Q0tpK4Kb3ervOaatlQivov
         gWF/ghfANvG6os6iSCRveVLG2AfDpXiaKGPn+iDFk7WQU0u61dFpv9+ib/BrTJFWLgK7
         nQl3RwIcDjlV5Mb0/qO8WxHT25l0AnxXCVco/+4vpT+Gknm2DyvuxzTMect3rqeUf8dX
         X8Guo970L9n+l/QXOEfyovWv/3zFW83gT82dqFZcNNiY/yj/hoM+Co+2XNWLPdTwhYxO
         vk3w==
X-Gm-Message-State: AOJu0YyH3XNWMCZSYzcuR888wUwaOE/1iVEopE6NPfZKnlM3MJgQIo3S
	EGLroCmQRzbrNWxEyzeB80kP4EQgiO+Z
X-Google-Smtp-Source: AGHT+IHu3H0RgtYZ8l9qpPGoXpBjWqmDv48DSjpHsFtxnOifuDQfmXQ64ydXe7XcESUrtgiyDqPuQqKHNS6T
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:a376:2908:1c75:ff78])
 (user=irogers job=sendgmr) by 2002:a0d:ec52:0:b0:58c:6ddd:d27c with SMTP id
 r18-20020a0dec52000000b0058c6dddd27cmr19945ywn.6.1695447356813; Fri, 22 Sep
 2023 22:35:56 -0700 (PDT)
Date: Fri, 22 Sep 2023 22:35:06 -0700
In-Reply-To: <20230923053515.535607-1-irogers@google.com>
Message-Id: <20230923053515.535607-10-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230923053515.535607-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
Subject: [PATCH v1 09/18] perf mem-events: Avoid uninitialized read
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

pmu should be initialized to NULL before perf_pmus__scan loop. Fix and
shrink the scope of pmu at the same time. Issue detected by clang-tidy.

Fixes: 5752c20f3787 ("perf mem: Scan all PMUs instead of just core ones")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/mem-events.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/mem-events.c b/tools/perf/util/mem-events.c
index 39ffe8ceb380..954b235e12e5 100644
--- a/tools/perf/util/mem-events.c
+++ b/tools/perf/util/mem-events.c
@@ -185,7 +185,6 @@ int perf_mem_events__record_args(const char **rec_argv, int *argv_nr,
 {
 	int i = *argv_nr, k = 0;
 	struct perf_mem_event *e;
-	struct perf_pmu *pmu;
 
 	for (int j = 0; j < PERF_MEM_EVENTS__MAX; j++) {
 		e = perf_mem_events__ptr(j);
@@ -202,6 +201,8 @@ int perf_mem_events__record_args(const char **rec_argv, int *argv_nr,
 			rec_argv[i++] = "-e";
 			rec_argv[i++] = perf_mem_events__name(j, NULL);
 		} else {
+			struct perf_pmu *pmu = NULL;
+
 			if (!e->supported) {
 				perf_mem_events__print_unsupport_hybrid(e, j);
 				return -1;
-- 
2.42.0.515.g380fc7ccd1-goog

