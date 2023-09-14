Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5696826E3D
	for <llvm@lists.linux.dev>; Thu, 14 Sep 2023 21:20:09 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-594e8207103so19873737b3.2
        for <llvm@lists.linux.dev>; Thu, 14 Sep 2023 14:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694726408; x=1695331208; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YO3ZTyHFm+00gT95r949gZji8+XYvbCsq+dhsmDC+Ok=;
        b=eqWEWjn73YZnZIuaTSXTU4Qz3bz7g0fbwI2Y3jk1v4le+WIgfLOhhk3Yrs6LV2aMF9
         C4V8rZfToK45B72tFIMFVysAT5/QCdSKdnfy8KVASXB2n5950n3E7YcFgeKEtrQvuG43
         Z551iu58I0BcpUQNhhcmHjXNLXP/TM2AXhrvMakqyHvuNQAIFdcGrlaE8aGrjyfzKQO4
         5hN9m6SKs2wkSlAl9ZihYm80XsMe0Uy933tO5jpuLsiytNaaiG0SHNxTa34Cal5ZyAZE
         7CqyjF528utLgwfFEuoPafaM9Az+Ig3s5qKFkJZFAOBQshzfdnbwJVvAZYl2pmzXJUCI
         C8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694726408; x=1695331208;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YO3ZTyHFm+00gT95r949gZji8+XYvbCsq+dhsmDC+Ok=;
        b=Bv4hT74iMbhaqhVyXbjBB+/BY8vP2YGN2KDrypnA+sC+YmoL+w66aK7zwLlETWh+su
         U1xPjN8az49s3a/JXzzrgdVpjk8k2dhlBtRJkFkUcsq9L7UeOiB58fVdDd53/27OTAxB
         tRSZLh5B6uSNJtYPQ14FReuh3hsBbzTzuco+YOQnAYu2YO3SoOtoNzgm2PZsJwYfHb3/
         ZF1uZKLmgSIxQt0XDpBhkq7QNd7xcYtTgS9rLOUvPNiaPwpGaeOTgQjYE13unDKdwqwy
         Pr33d3YuG8AkHKzfAa7OfyV3UG1MVwBhQBzsuRQx2fu+GfRQ7ckzHpz3YBQtL6nRb4TL
         tXNA==
X-Gm-Message-State: AOJu0Yyf4inikYyl7QmvN3UL3N1BO2BOqsYJc1DaGM4KRdHd01o7cI4A
	BA2pV9Br0TVHoWAe1s+R5vxSfR55IwMh
X-Google-Smtp-Source: AGHT+IGCEX/KOyc+NQTtFfPYAWgFXG6kDLqyIKgl2lhi89WqTIgea5kl72TnA6Q8vTJoreHIXz9tXTcmvDM3
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:5357:1d03:3084:aacb])
 (user=irogers job=sendgmr) by 2002:a81:af11:0:b0:589:a5c6:4a8e with SMTP id
 n17-20020a81af11000000b00589a5c64a8emr175716ywh.1.1694726408395; Thu, 14 Sep
 2023 14:20:08 -0700 (PDT)
Date: Thu, 14 Sep 2023 14:19:48 -0700
In-Reply-To: <20230914211948.814999-1-irogers@google.com>
Message-Id: <20230914211948.814999-6-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230914211948.814999-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Subject: [PATCH v1 5/5] perf test: Detect off-cpu support from build options
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nick Terrell <terrelln@fb.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	James Clark <james.clark@arm.com>, Kajol Jain <kjain@linux.ibm.com>, 
	Patrice Duroux <patrice.duroux@gmail.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Use perf version to detect whether BPF skeletons were enabled in a
build rather than a failing perf record.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/shell/record_offcpu.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/tests/shell/record_offcpu.sh b/tools/perf/tests/shell/record_offcpu.sh
index a0d14cd0aa79..a1ef8f0d2b5c 100755
--- a/tools/perf/tests/shell/record_offcpu.sh
+++ b/tools/perf/tests/shell/record_offcpu.sh
@@ -28,7 +28,7 @@ test_offcpu_priv() {
     err=2
     return
   fi
-  if perf record --off-cpu -o /dev/null --quiet true 2>&1 | grep BUILD_BPF_SKEL
+  if perf version --build-options 2>&1 | grep HAVE_BPF_SKEL | grep -q OFF
   then
     echo "off-cpu test [Skipped missing BPF support]"
     err=2
-- 
2.42.0.459.ge4e396fd5e-goog

