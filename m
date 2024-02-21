Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8437D39AFE
	for <llvm@lists.linux.dev>; Wed, 21 Feb 2024 03:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708486932; cv=none; b=gj1qJcMrxxhzVSa4jwJXpuVikmj7ZDnUH36LTgFSbE1m1osazzrEOXCtjYCjIrSfFW4EwjmmNFY87csNc+QQZV7xhDEN4wYyF0EFXsUBO9kFVJdBs/N1HYFuFCfcTqQH+knY3opiriaJJcTNwRfL3zgmuxROknEn8lxD1bahYaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708486932; c=relaxed/simple;
	bh=9QHqj0EQvOX6+a6MNptism09KshtnOJS+VQ0pDYpZf8=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=OGoH5kyoRQmIqt4NeTT9JpJxTf4O1e3Szb4DrnNuz637LzCuFNxvKlrVXfHT0qdjZ0Q4Ap4/KGV+tJ0W36CH8151rlXXn5UOaMCN7KfRtgfGW9LlDvmb1wEw4uZNm8YgU8vBOZ0ko7A6ytSPgV32Hl0B4MOrFI4WHbpyAb2L4Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Vl2nqb+6; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Vl2nqb+6"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dc743cc50a6so8447807276.2
        for <llvm@lists.linux.dev>; Tue, 20 Feb 2024 19:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708486929; x=1709091729; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OwHudnCNl5wfpV2IMol1tp79ctLuVP/i5n4Lz8j3mXY=;
        b=Vl2nqb+6E9lG3UtaYH5qOB+5hZ7mqyXTifa/i2LHIgvGEzxnqcFzrgbOWIkLJgf40T
         8BLu8MshXant8v3nmmighm7U8P1RK8p8pylmXwu6CXCs4WBUxaJ/cysoCAV5+HjMZqdP
         KoXdvBJVWKFpMr+dMDQlo2TMxdZoHdGrleqxOAy4kD6k9jKcIRkXNyRWyUJJUOXIW7uV
         pKYK9uTZbVtfBJDdORIeJEOLo5WVMD9LNHUpwZg7B20cOWLDfjVlPpss1zyD73uO+ngc
         Nr5sWblnEKEZnB1v9C3Ci3NMgqpx3lFBPcllhTImLcL3+JyCHw9LKeBIEyqhZf3V00Nu
         0zKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708486929; x=1709091729;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OwHudnCNl5wfpV2IMol1tp79ctLuVP/i5n4Lz8j3mXY=;
        b=CrAjcjm0n4KaNS+jPon9ia6uQFPb6fH+j0RYkqkJfs/Sj+Z2RXrb3j1BXMYJcCC2HN
         tZZMJCDITLL8RZD0Ax7RbNxQEFvbFS1xi7XrATCzzAvby2/2xIPLxXtNgz+JKQc/Dm9/
         GgHu/x20Z+SlboKq6Sqpk0zsfi7Cnzuk1+pNiDTostRqp/cclsmeywLenoCmyaBMJRgr
         Vlr+Swr0vasLP8HsB+0r6DJPOT+fTux7JOn3TmoPA1BOOb55lhk483vlF7sDR/0YqxD6
         TNx6h709O+2cKz/ULrkijrZ4xbDrovqXsEiigaVK2JEJCcF2lNhCJWH4s66q07+xRO1s
         +77Q==
X-Forwarded-Encrypted: i=1; AJvYcCXKx6aIeRsHee7ZhJMzQLGr+iSUXvFd2Vlfpm4FC4w/3lKYqH0Ddd2s1ie34Xfev6TUY+5RWqil47/cfouuOBlcTVfovg==
X-Gm-Message-State: AOJu0Yxp+YmGZ10qQhNBQ5yxO//ZYhPG1M77kosU+n7sUs073t0r/st3
	5YaosLquTeIxXmFS0xd9IWa10xKZ0F1BEicLwgKObPxm7QBXqcANq0Sgh6UHneBkFtLkuTKYk5N
	3HlqwSA==
X-Google-Smtp-Source: AGHT+IGpVA7if143B0lJXVmaSTTYwpcK6AvkiAGNahJ11h9vd94Ww2nCxr5eJbFyGeAX/DDo5vhoCpkHB36Q
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:3c02:f882:5876:b7ab])
 (user=irogers job=sendgmr) by 2002:a25:a447:0:b0:dcc:41ad:fb3b with SMTP id
 f65-20020a25a447000000b00dcc41adfb3bmr602386ybi.10.1708486929422; Tue, 20 Feb
 2024 19:42:09 -0800 (PST)
Date: Tue, 20 Feb 2024 19:41:50 -0800
In-Reply-To: <20240221034155.1500118-1-irogers@google.com>
Message-Id: <20240221034155.1500118-4-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240221034155.1500118-1-irogers@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Subject: [PATCH v6 3/8] perf tests: Avoid fork in perf_has_symbol test
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Athira Jajeev <atrajeev@linux.vnet.ibm.com>, James Clark <james.clark@arm.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Yang Jihong <yangjihong1@huawei.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

perf test -vv Symbols is used to indentify symbols within the perf
binary. Add the -F flag so that the test command doesn't fork the test
before running. This removes a little overhead.

Acked-by: Adrian Hunter <adrian.hunter@intel.com>
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
2.44.0.rc0.258.g7320e95886-goog

