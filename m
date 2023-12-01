Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5243F8FC
	for <llvm@lists.linux.dev>; Fri,  1 Dec 2023 23:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YTevSK11"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-5c87663a873so39464827b3.2
        for <llvm@lists.linux.dev>; Fri, 01 Dec 2023 15:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701474644; x=1702079444; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1mumLSgmv33VvcRWr1T4zCbxKl06nV2/FpT8+bbjZvo=;
        b=YTevSK11l6xP/PvJqSNXT8renFWiqZJ0GCWUHZHb1wkR+dM8qS/f98gI/rLmfK9OQU
         yZb4CRi0SfGX+sFUKjQPWwWZtYyJL40OXHVEm+yYgyUwDcTKNrOjPvly5LVuYmiK4a6i
         uuTMPCkXzWsNkUeNxq4ScPAE3OmEisWhgTmxiqYcYit9p5YnPKQ4ii4SQlygM535nqhU
         aO3QyFbd6W9HZaBEl+LsaialB4OpLvl44VUluQ6+JW2gfY/HAHUK+31SvxRDyy4FNWp4
         EX+HGvUAPDcKK6rs4ndFaenJxuETZ0SOn7DP0npqqpzh4uaroAVQ0IDRlvzl85/8Yrb0
         eo2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701474644; x=1702079444;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1mumLSgmv33VvcRWr1T4zCbxKl06nV2/FpT8+bbjZvo=;
        b=J5pMEei5pW2Qxs4c/Hi6lJ1Zt0GiHlkMPJBLFuu+DXId9Cu7s6F4cc6uNnOWg2l1dk
         tlQgaA//7jVWmqrEvZhyFp1ZvVa4dMYdqA6/aXKfrtZ8OWybRP1sk1AXXmRdT8Nxw8If
         xu5NW0E50re6F3D/6hHkSDKrvwJOOApT+7CZdU1MBhLkt2CPHAZ4qYvubcQvSfl1w0zJ
         3vRH+NjLbLKr9N5+ESHKH1Y5w6RN6h/5YZDquqeOQkb/yrsWJxNQJHFdQt/dHm0tMTyn
         3WbNRhmM+p6LHoAgfjNhNkkjJAACnC9Z6vX2D+HaqrcO0qxIvLIWNM018s04aELcNkbt
         843A==
X-Gm-Message-State: AOJu0YxTEvNf25KmyDCf5zdwNpPScCJ7q3JW3NKBQI7hj5qwXm+uvLBH
	tKnBcog27qlutF2Hdkam3OvDqsxvMEoM
X-Google-Smtp-Source: AGHT+IGWRlInLywjlQJmaHodIvzIlFUD3Gt7blh1cNR88fx8scsrg22BeeHPNTZ+X7DF2opsxPQDN/rgdj2g
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:df3:224b:7b7f:efc5])
 (user=irogers job=sendgmr) by 2002:a05:690c:2849:b0:5d4:1b2d:f43f with SMTP
 id ed9-20020a05690c284900b005d41b2df43fmr125134ywb.6.1701474644325; Fri, 01
 Dec 2023 15:50:44 -0800 (PST)
Date: Fri,  1 Dec 2023 15:50:25 -0800
In-Reply-To: <20231201235031.475293-1-irogers@google.com>
Message-Id: <20231201235031.475293-3-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231201235031.475293-1-irogers@google.com>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Subject: [PATCH v1 3/9] perf tests: Avoid fork in perf_has_symbol test
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, James Clark <james.clark@arm.com>, 
	Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

perf test -vv Symbols is used to indentify symbols within the perf
binary. Add the -F flag so that the test command doesn't fork the test
before running. This removes a little overhead.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/shell/lib/perf_has_symbol.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/tests/shell/lib/perf_has_symbol.sh b/tools/perf/tests/shell/lib/perf_has_symbol.sh
index 5d59c32ae3e7..561c93b75d77 100644
--- a/tools/perf/tests/shell/lib/perf_has_symbol.sh
+++ b/tools/perf/tests/shell/lib/perf_has_symbol.sh
@@ -3,7 +3,7 @@
 
 perf_has_symbol()
 {
-	if perf test -vv "Symbols" 2>&1 | grep "[[:space:]]$1$"; then
+	if perf test -vv -F "Symbols" 2>&1 | grep "[[:space:]]$1$"; then
 		echo "perf does have symbol '$1'"
 		return 0
 	fi
-- 
2.43.0.rc2.451.g8631bc7472-goog

