Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67EE1420B8
	for <llvm@lists.linux.dev>; Fri, 16 Feb 2024 23:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708127723; cv=none; b=AknKaKRrYfdU1qBFnYLd9otL/jy7m0QZDROPkYfldobppYHlkPMhV/FOorx3PXqP9A1s4kPvCta6C6O2kmIqVP8r5CDJ2SWTYwf9b9n0VDfOZ/Q+g/RWNgmnd1mrivBwcTIwyQC2P86JoPt814/QWSTd9IuGZujnDF3+M64bf7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708127723; c=relaxed/simple;
	bh=9QHqj0EQvOX6+a6MNptism09KshtnOJS+VQ0pDYpZf8=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=oJ7dMYdEKgfXd2p98uQlOi2MGw0/bSDqADJGKCdsxzTrVwbcJwVlzSPFv9gBHLfK/wghNG7oMTcsWFSGXBbAX7WfrsYSFz/1fNfM1bOauoa4EERP/FPNu8wPgBEykQuj9lUR5IUQr/8QGhOiKobF0Patubq6lRg0Mn1cvGaYyj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lDyQ7cSg; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lDyQ7cSg"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-607c2dd9a15so41956217b3.0
        for <llvm@lists.linux.dev>; Fri, 16 Feb 2024 15:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708127719; x=1708732519; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OwHudnCNl5wfpV2IMol1tp79ctLuVP/i5n4Lz8j3mXY=;
        b=lDyQ7cSgiAUrqa7hVZ5XIPn1+nJlCeChEhM8WYS8gfiz3jUIH/mEZkufHzQlrn+v43
         A6CTyhPFahvsuE9eMzMrtRV26FcwtyvO5AmuSNRfzcfdEHOaGcRmTFjhjqMHzYqZgJS0
         T36VWyW5h6xBudmx46X3WLBjQjSL2Rzib6v5FSPmkjNM6laRakz0llxrZeSWhPuCqhdO
         biRW1zyDQUHDVA/RjGianQOTYUe8JSeKkBzv1DO9gUA7NQ/SeNWn5ZOnKOoRsjtB554Y
         +Zx/VhBpNEBR48ZAqDSYx+fpHa5x4KUcdBlEVnUMQ7vCBn508OzCCQNP6O1GaNgPa/WM
         5Z/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708127719; x=1708732519;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OwHudnCNl5wfpV2IMol1tp79ctLuVP/i5n4Lz8j3mXY=;
        b=jq3xHYLsNTN+ufHf4xNJlt5TZT6GZmskoZk7QGqtIBkR2iqwVg0Fp3ctCbvGxHu53F
         CzNeynNdswMYmZotC0/wWEZ4GfDMQ/vJaJZl27Qyx7B92ZXNqsOs1A+vHVi/OwiToVHK
         Gjl0z6dZdL0XgBO+wuZ1FjWWLGELNhRupP8lHrGP+3D52Mk92gPZpVYbxCj4Hv6I4HCK
         Cfqw55lHvzPBzkYVECQO/A1jYIicSvhtgXBh3798Su+VThXUd+Y9LWM6B1H9NCwNLakg
         l4j/ooOLPaX57uaZB7z2EWBoLQf0kIKFYuT74eKpNkYj29kCUQH3dlUPZEz570h6KJaf
         3cug==
X-Forwarded-Encrypted: i=1; AJvYcCUo0Fo9Dv3KQx8/4huVsEoP2I2r23yqLtv4BLVudJkw+TWXzleJIhXaPgGe3hnsADjYCTu/Z6Af9/Q4JvoVfYoIeykNQA==
X-Gm-Message-State: AOJu0Ywtne/HAV+BM7Q3xyk8gdfZdaxL5hSRAOStFculQhq9G6vhAV3k
	+vpG4zzVIfFhjwRr8y7YenhaQr7C/Asrd8eYrZQS7C+Bo0bCdYyHcWESeQGerT8GGD5bXXXdHV1
	QYlvo0A==
X-Google-Smtp-Source: AGHT+IG8QRb2Q7jBDqZB4i9cqOAXtHSKaGeMrSsEOLiLdKXk40XnzjXZ0NQyadsz7ftlgTYp32osL3I2Y+06
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:4b5c:352:4272:e34e])
 (user=irogers job=sendgmr) by 2002:a05:6902:729:b0:dc2:5273:53f9 with SMTP id
 l9-20020a056902072900b00dc2527353f9mr224067ybt.1.1708127719606; Fri, 16 Feb
 2024 15:55:19 -0800 (PST)
Date: Fri, 16 Feb 2024 15:51:57 -0800
In-Reply-To: <20240216235203.229256-1-irogers@google.com>
Message-Id: <20240216235203.229256-4-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240216235203.229256-1-irogers@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Subject: [PATCH v5 3/8] perf tests: Avoid fork in perf_has_symbol test
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

