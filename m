Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513A21119C
	for <llvm@lists.linux.dev>; Wed, 14 Feb 2024 04:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707886480; cv=none; b=LTEeRUbUy7kOBF/aJwft7uWAgFlaAoY2VsM3YKCnaZaUEoTC63ur6P1RZ4dcAjpxRJ0lBs3vvzECphDR6mmrhNQzXwJGYwZEE6hfuplVd3J8VRSPUu88pu+xMvyNd5ozk+UNYlph7JtYEMAWEqMNgN0tvBUlUVFfpDVGIqyi/YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707886480; c=relaxed/simple;
	bh=cEoquvI2Ge+v6/Ow4yXCwb905NVQF3PwLLtFQnXzKG0=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=Mgkrmwt60w1yQC9TgB5T/ma3/W6V5XX52ZS8j8xNc7e+UpnJY7XjUO0Yhu0Or6Vf6IRnNZ/6T7Swr7hL37wYpDz0HttOEWXlDmTUoxCfr3HoZrZDmVjRZHPH3Eg4doRE1nJckdVI3HuFMlWOj7isx/QeSpgXyXA5OPToVCdAhVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Kvl4xmRZ; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kvl4xmRZ"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6047f0741e2so81570207b3.3
        for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 20:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707886478; x=1708491278; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WQsEsQdYL+F7rq54Mfa+75HgoPY/TwxmW9rhD6V78kU=;
        b=Kvl4xmRZ9kqJ2pu3tCuVSQzxNbszkvMqddWFmFTd4dR2HjRrGVHDLUUCftfHVVfhEp
         Ww+X0tAe1NHeaatb9X7rqEu9tOIA/MZpm/19Ni0Y3gP9JlrwkREUBFSvHKtCQm6rAKRg
         yPQyFB1cIWTKcIDRas5vUyZcJk9F5cHHhdRDNkjrHEwRDLkOLprbAKOoln3G6F3Fz7Cu
         XUkRfR0PzlAue77mw6IFIRtt1thfcqrMsNqmc5sFgqwo+DRY1BVoNdSvry7Bex2wVuZD
         hWBKipksoq5HOopRP7uxl0qFDFkmloWqdDrhZu1a0RhrM8bgCthzNRvQsPncH6E93bJ6
         Fjtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707886478; x=1708491278;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WQsEsQdYL+F7rq54Mfa+75HgoPY/TwxmW9rhD6V78kU=;
        b=W28jFNmYRmKBgh/VI0PaUGSU85tKqaq9U9XJG4meVpKy8sKGeEZrLvbbBdGmcX8TZT
         9kHEmN4wmrDVosuJ+Zw1yj+xvEwUZQKnPkIv+SbYbkChB5B1ld7kUyMJ441NrecFeRgB
         fF2zSa9+F+NjxzZUjp3TmC4RrsQT3FQn/Otv1ncoscdilxsjsBN1YkXGOOq+/Yw4Q+Z1
         9dQc9NNZpq+Xp115tjohYnhtymPiKLYMNBdmS2rEDofo8gVaW0hv7eZUvRGWUWso4RHv
         mHYdglmSSer8I3pJ/Hn7WcR6+eN64vx4Q7r1JmY9fnKUjFGOMPNaa00XgkEi4G87CIKa
         scmA==
X-Forwarded-Encrypted: i=1; AJvYcCV6Yskxe/8PQCR0gnrsXWK5fGQDD5V+imRzLLXTkTvPt/7Jgs0v17b1mkej3VzspjM1bcuP7HOMGVh2d2XPz0HXLCT8SA==
X-Gm-Message-State: AOJu0YxyVY2YdlGdi6szrDbX49abl1dJP52tCvatKBQ4i4Vwc04k0L/H
	Hh/gAyhV0Mg52K8eA4zQ0ppWuBJgC4Pi37kr/QV7DhUShMkN639nezqexwwRNpUT2ZdveB3iorj
	F39jnhg==
X-Google-Smtp-Source: AGHT+IEyHbP+pckfFvabgFHrAtPTPFgzZnnrvWiKaPJToQmUliMu4+e+EktFDuhWE7n5StUlVnHejJ0MRW+a
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:6d92:85eb:9adc:66dd])
 (user=irogers job=sendgmr) by 2002:a0d:cb4a:0:b0:607:83bd:bea3 with SMTP id
 n71-20020a0dcb4a000000b0060783bdbea3mr244497ywd.10.1707886478458; Tue, 13 Feb
 2024 20:54:38 -0800 (PST)
Date: Tue, 13 Feb 2024 20:53:51 -0800
In-Reply-To: <20240214045356.748330-1-irogers@google.com>
Message-Id: <20240214045356.748330-4-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240214045356.748330-1-irogers@google.com>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Subject: [PATCH v4 3/8] perf tests: Avoid fork in perf_has_symbol test
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	James Clark <james.clark@arm.com>, Athira Jajeev <atrajeev@linux.vnet.ibm.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Yang Jihong <yangjihong1@huawei.com>, 
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
2.43.0.687.g38aa6559b0-goog

