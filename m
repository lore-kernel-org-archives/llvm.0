Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EB53CA4AF
	for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 06:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789539207; cv=none; b=mvSh0e4nAaq+O+LMFMHuZa4JohvyqvpeRwPKESGmIupfQY8MZMUj2SLpWfrTlWh50BPMmyJC5J+yRXr4J+idrbpIbEE6lU+yHdrXgIurTv2gj3QUP4CIRMah+Ly1Llou4hRkjslmVSXoLxswuj1r7elUyvhEZcekyFgAMIizdSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789539207; c=relaxed/simple;
	bh=9AQBOX7WHaFtXKrai6q48Xl/HvE+e0N8DcJlpSobYXI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=uWefjo/mORj/9Pynj9WaZogyJU6jaQfbkZtd1JGpGduwhJkdXULwrlcFO02GEiPo140fU4nlBAkDC3nhhjwMFKAar2685hKrTaN0jbKvzrVqCe9ENS8pPcFv+Dw8pn7hVVRo+AQMdNtGww3zTMMVNAnYCX5CLpmquGHy38fZJA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U9V1PE5f; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U9V1PE5f"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2db22383e8fso25820815ad.1
        for <llvm@lists.linux.dev>; Tue, 15 Sep 2026 23:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789539205; x=1790144005; darn=lists.linux.dev;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=icwakIRxoRygxUn8RuGulJXMD/67KQ1hy2QcRu7qTfU=;
        b=U9V1PE5fumKKxnlYMx2Sv8mSHxMka+PjT0oCLdX79meJ/nR/8IS2iJ+Urd7mYxnUUa
         0D9muXjduOInVfICRwwX6zK2xOiD96f7kB387CuMYwzcfYXg5PwAlz9SPSUwJxYNb1ve
         IsTcYbCapzaymCdUF/2lxmMojG3Elz3NVAJqUezqGiMNK43gXcw46ylqIMibh1W2aQv/
         6Rq8ZhuoISUWJMKBjrirnJtprzHZ0E+yKRPYbpRu+z0vnhWqgijZaMFwMfEBv/xniijw
         gGcmwUsXCYu/2AmUzYX5wVmi1k3xRk0ioHHTtsrJcO+e90Ho9+VJBv3+RONGE20OVBpE
         IP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789539205; x=1790144005;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=icwakIRxoRygxUn8RuGulJXMD/67KQ1hy2QcRu7qTfU=;
        b=rqBIV3KYpz8N/J/nxVjNE3vfuwp8LFAzgn/qtUthl8il0MjbIBh6Uot2sFew+FIJV7
         3rgIFk0TfUeMM4H12VbiQ1SmCnS1MpUEBu9uDieDIZkHTK8lStWUcBq4wB4nGV4Cujpr
         P63EPHXCPSTTEMYJbg4NZ+AFihRMzBSSey7Ye1Mb+2a1019FnexqRmjhKT7bBP5TtHtP
         MmMHRMShdMOtZxOeCcCjVBVKVinNVIR8G5coesLY3DCULoa5vBtlJKqWv2sBhMWS99Ow
         FhMBylCIUYYYPGtteiAhZvctjMHz6hnp6MYqbctNemSFgGoHXLCff0KjQtim4l46c6gP
         58uA==
X-Forwarded-Encrypted: i=1; AKwUvBw2ytBe47L9+V+bf1FO1cwOlSZpyfFp/SI0W4GgeYGXxlzNX7HNK177xQR1tkq+h/yYyEDc@lists.linux.dev
X-Gm-Message-State: AFuF++klxO26y2sN+d9h1JPmkNga4LrqHH1RCYnXiuAts232VCgWP1eu
	+2nk5hRxq5WAi0mecgRKS8BUpT2gZJMmp9wXIrp+qXbEw+hkWaMkjUFdW2HDMrEQ63xNkueKHvV
	LfHPoAruM3g==
X-Received: from dyhb21.prod.google.com ([2002:a05:7300:1495:b0:32b:7182:c3b7])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2446:b0:2d8:d4d2:d13a
 with SMTP id d9443c01a7336-2dd7655b5f3mr91909395ad.22.1789539204632; Tue, 15
 Sep 2026 23:13:24 -0700 (PDT)
Date: Tue, 15 Sep 2026 23:12:16 -0700
In-Reply-To: <20260916061218.3061216-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260916061218.3061216-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
Message-ID: <20260916061218.3061216-8-irogers@google.com>
Subject: [PATCH 7/9] perf build: Check the version of the compiler that is used
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Thomas Richter <tmricht@linux.ibm.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

The flex and bison flags are adjusted for clang older than 13.0.0, which
doesn't grok -Wno-unused-but-set-variable. The test is reached because
CC_NO_CLANG says CC is clang, but the version comes from $(CLANG), which
defaults to plain "clang" and needn't be the compiler in use:

  $ make CC=clang-19 CLANG=clang-12
  version from $(CLANG) -> 12.0.0, flag stripped
  version from $(CC)    -> 19.1.7, flag kept

Dropping the flag lets the warnings it suppresses in the generated flex
and bison code through, and those are errors under -Werror.

Ask $(CC) instead, as that is what compiles the code.

Fixes: 878460e8d0ff ("perf build: Remove -Wno-unused-but-set-variable from the flex flags when building with clang < 13.0.0")
Signed-off-by: Ian Rogers <irogers@google.com>
Assisted-by: Antigravity:gemini-3.1-pro
---
 tools/perf/util/Build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index d08f2af7d970..a4618e4e4848 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -339,7 +339,7 @@ bison_flags := -DYYENABLE_NLS=0 -Wno-unused-but-set-variable
 
 # Old clangs don't grok -Wno-unused-but-set-variable, remove it
 ifeq ($(CC_NO_CLANG), 0)
-  CLANG_VERSION := $(shell $(CLANG) --version | head -1 | sed 's/.*clang version \([[:digit:]]\+.[[:digit:]]\+.[[:digit:]]\+\).*/\1/g')
+  CLANG_VERSION := $(shell $(CC) --version | head -1 | sed 's/.*clang version \([[:digit:]]\+.[[:digit:]]\+.[[:digit:]]\+\).*/\1/g')
   ifeq ($(call version-lt3,$(CLANG_VERSION),13.0.0),1)
     bison_flags := $(subst -Wno-unused-but-set-variable,,$(bison_flags))
     flex_flags := $(subst -Wno-unused-but-set-variable,,$(flex_flags))
-- 
2.55.0.1032.g73a4cd73de-goog

