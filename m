Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA39C1878
	for <llvm@lists.linux.dev>; Thu,  1 Feb 2024 00:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706746528; cv=none; b=RjSR4zNsw/9j1fr9iHk3wPX0GiSjgwRoL+B/BaBH5+quEqmM7A4Hy1vEtKw8K4t3eICIYmDYe6oJS8zYJp5jqxMouxGEGeI9nMmlYIfx8h5hV60/gl0JZbkUG2MncZVSvbI8UlZZtd4PhPaDvKTfR7MBPF+rAHsiUdzXhDoMAFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706746528; c=relaxed/simple;
	bh=QRpCkX5OhiFVAf9wMaNKpBHKt1xJJ+6SZA8XPyhesEY=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=QyIJIyT/UGwjKqXTGiGVRXYu23JXg4j4TShlPad6Kz09+SOWhRVAmPL1GvqK/jhqFbMLrxId7XAIwaxmmLCwAbbNXmIPypNNZTbyCu6PLIwegjxQnRMpHSBzQNTAssw4qcO6lOnjIbNHijGm4MZWFx+KTRB0VXT8/GNR/5hDpzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FUDTUPE8; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FUDTUPE8"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dc6ade10cb8so753653276.0
        for <llvm@lists.linux.dev>; Wed, 31 Jan 2024 16:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706746526; x=1707351326; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6LQceo5LZaawmvLGjPJXI4UEv1n2dckt3DrjRuadtZ8=;
        b=FUDTUPE8fxgnMZK7TXdgTWwTCRiDxS2M9CNNl3Dy2eCrq57WN5XlY7k0jAZwRD2nVy
         igdxRdhOgXn8ZlhMXqD2kMem7o/FT53mJk//rltFDGweDFLSUzRo98kyyjNBAbsoWj+O
         g6QYDGNXUKDaTATb4+Wxn7hgyR8GHa4B+0KjX+o79onS934P5smp2FXFCjkB9M+5xF56
         dkNF41Po6zd9EqkIEtXi62WwZzV6QGhVEw3Quv6Ikdke5I+Kmu7LrU3oJj0Z3hvfxj8q
         tw8qTesY340gBpL0VBHrl5vIYB1+ZKcGIShiq+LMVr47uafdgZzWQgrbTWOKxKB84zNt
         uwAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706746526; x=1707351326;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6LQceo5LZaawmvLGjPJXI4UEv1n2dckt3DrjRuadtZ8=;
        b=qafbLLqEAkssmh2AMG5Y2VP5v0kqygkDH9F7XwiMricZMTA+0izmKB5vCXe61b2wDN
         gVSs9+p4N3d46J37pYnQnJDM/UMBvDsTry8FyrBy4LESxyTiT5eWJXZ0VhiRH43j512i
         zCLoWgzO9jzsXy6SKugZ2/Oax4FNVKFWwVhCVmhi2l95iaJ0QzQREHpJxDS8xpgB3mVu
         fNGbiI+mWnM7rwRga78vVxdm/S8dCInOyDHAvslIINmlQdXC/6OPQmuWVI61tAbVWoqP
         onEeTbJDWDXb4wkCbycKL9CQWc1DOBVAa1ufV2GqL8CyrD/3qjGtdBGi2hOcUrn9ZUTV
         8xIA==
X-Gm-Message-State: AOJu0YyTkXHnh7PhD7f6ZyfwfqXc3mPxSoGJXOa6Fe232QnZv30/+xeS
	WeFx9hFvClADBrdnBYL4uRF7XJXoPjjSgjpqbdtAf0kkPeDDJTkgPVUQ8SLcE/P1N/NBSdQmR9Y
	yPPc0MQ==
X-Google-Smtp-Source: AGHT+IGkcSdrvh1eVOyXefE7wqxHzsyE+LRzj7VdVg3SWOtaKEzHNjBSiBdZCUHM6S5SRjI90vPm5BkpRox9
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:16c5:1feb:bf99:a5d1])
 (user=irogers job=sendgmr) by 2002:a5b:803:0:b0:dc6:c9e8:8b0d with SMTP id
 x3-20020a5b0803000000b00dc6c9e88b0dmr446549ybp.1.1706746525831; Wed, 31 Jan
 2024 16:15:25 -0800 (PST)
Date: Wed, 31 Jan 2024 16:14:57 -0800
In-Reply-To: <20240201001504.1348511-1-irogers@google.com>
Message-Id: <20240201001504.1348511-3-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240201001504.1348511-1-irogers@google.com>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Subject: [PATCH v2 3/9] perf tests: Avoid fork in perf_has_symbol test
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
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
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
2.43.0.429.g432eaa2c6b-goog

