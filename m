Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADB526E38
	for <llvm@lists.linux.dev>; Thu, 14 Sep 2023 21:20:06 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-d8186d705a9so1716749276.3
        for <llvm@lists.linux.dev>; Thu, 14 Sep 2023 14:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694726406; x=1695331206; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qEBLCnDyHWS5IuPY851bB1uYjpvWDCqujKcJXiny/1I=;
        b=YrzSWUnDn8YuOziuo6QiKAg2bxzvPqfvANL3P2YsjrObNC3t9SZVUw3Wg6inLJXSMK
         RnOFnayP96KlBNBfvm+qXTG7Yn5RmPqWt8t0fxgvqjCg/EZ7wI+GEt6kW2tztyC/ognH
         0R0MVwj2YR6Rfzqxk2o3YBkDv/dpj1JB5QBV572GhoynZUZQ0ReqVVpgODSYw4SuxCjs
         kgZLLrTpvAZBhwUINR7roVtHXjqesjm1GVq+F5bMtPSH2Xe2o5o5RsqWzW1GUljIM1f0
         CZYGtH/L5SThisyK/hM7Za9n2x+/UiXkhqtzh6GUtZYBSmsq6heGt3tULKyVNtzwRaVe
         wa7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694726406; x=1695331206;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qEBLCnDyHWS5IuPY851bB1uYjpvWDCqujKcJXiny/1I=;
        b=NQt5ZZDC24AjFcg4RxJpgPwXn5C7L4ThvcxY4v/7Kpi1Yyi/zQQHGBEosaQmtANWlo
         Eha4rothZFkjf/4PKuZKrE9KVDJvBqmi+DAF8EL511c3S9VEE7zkfeJHudVkGGh/wNDe
         RE/ayPx7AoBXnkcZjntp30THYRrmxnFcyXhaEiL3VyV7IJDU6XltmRHAlRM72v8HjqMO
         Y9DZoj4HI4Hvm2UMgbVYfjY1BBVEGvyOBw1RORKF6nfZDF4gXXZFZR0R4Lv2FAaIvg4A
         UJS7MF5ZF1TBzV8FvSyXh5f56E/aoU9aN79aCkYiz/c7nUX3d6nnC3nY2vtv0zXiXLir
         9GMw==
X-Gm-Message-State: AOJu0YxDMhavMmHxbNhMx5fZafx4iPOP3SIcKdjHCbGL6jWalH4rI45B
	GerMzAoUTalTW6cj6/6DSFb81j8E8AAg
X-Google-Smtp-Source: AGHT+IFjNitaNwEgv3EEZ6iXNRaR95WvUU1GpXUYm1fAho7ynBUmSGSSBv8y18SlBKTVkWFYTJLjScNmdKn2
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:5357:1d03:3084:aacb])
 (user=irogers job=sendgmr) by 2002:a5b:bc6:0:b0:d7e:a025:2672 with SMTP id
 c6-20020a5b0bc6000000b00d7ea0252672mr153772ybr.9.1694726405869; Thu, 14 Sep
 2023 14:20:05 -0700 (PDT)
Date: Thu, 14 Sep 2023 14:19:47 -0700
In-Reply-To: <20230914211948.814999-1-irogers@google.com>
Message-Id: <20230914211948.814999-5-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230914211948.814999-1-irogers@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Subject: [PATCH v1 4/5] perf test: Ensure EXTRA_TESTS is covered in build test
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

Add to run variable.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/make | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/perf/tests/make b/tools/perf/tests/make
index a3a0f2a8bba0..d9945ed25bc5 100644
--- a/tools/perf/tests/make
+++ b/tools/perf/tests/make
@@ -138,6 +138,7 @@ endif
 run += make_python_perf_so
 run += make_debug
 run += make_nondistro
+run += make_extra_tests
 run += make_no_bpf_skel
 run += make_gen_vmlinux_h
 run += make_no_libperl
-- 
2.42.0.459.ge4e396fd5e-goog

