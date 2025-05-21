Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F1E1E489
	for <llvm@lists.linux.dev>; Wed, 21 May 2025 22:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747868052; cv=none; b=YFIDg+bZCwsIj5y34Ql9SRgcMBjKH5tEh4oqmKhFoow6yMxoVUvN9ZNTQcHJjafNSuIyROH6l4/Sc4a0e2fC57Kepn1eV8WPSveqeCgKnLvQm7W3xni3I7aTc2dZkywjoTP2/RgOWAz9ttsVdpg+7RDUgNZwFT2dHRcE3OeVzZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747868052; c=relaxed/simple;
	bh=QAggP+lM/j8Yzi2qMtUyogpJwyHr1XRiUmUWlJAfYEw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=Ns8NIiFCCWYQul2ajornoLYM9qIFFiDbWk6+3jwYigMytN3FKHdWUoMK4NUEBTPSbCySmxG++ujIzmzwnCvGDBDtFqVPV3ShSOHo95YsHlVQwda3Ywcxi9RnM4+Hm6DvHGnV5jIXOJbhznULZ8PnMObtCaQFKM429n1zzuhjK+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yuzhuo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gmAXsS9R; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yuzhuo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gmAXsS9R"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7398d70abbfso9935307b3a.2
        for <llvm@lists.linux.dev>; Wed, 21 May 2025 15:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747868050; x=1748472850; darn=lists.linux.dev;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e5xiyzjaDsO3It6y2mmvth2hLq6HIh9F/ymtgdkp/7U=;
        b=gmAXsS9RasJzwLRim59bQ2972HY+8mLv7whWFvx8rtwEqrK6GB7NBiihGV5YpqHmxy
         0AVZptIywNKNA+YBh1IwJlZG4pM9Nhubx6hkIwxIciGVYrOkyKYmdEID8a0Mi8aSTY5J
         3jpDI/zqrkh5ZmFNc2GhnbcBNAXmXLAzDM7Q9xNLwVmww7CbdStqKT1auwSyT5vdeCkM
         1F08XDaUbcOimx+rSxzAMXSIXn9UQ3vucKrgeTpRlQYTVptzKoc42XJweldrmmXPrudB
         7V0d4GHVp6gFd75rEKNRox6IeE7mze1NfXdartSnoemviUfYyR0UsKL3oTB/KOLlGSq2
         zG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747868050; x=1748472850;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e5xiyzjaDsO3It6y2mmvth2hLq6HIh9F/ymtgdkp/7U=;
        b=jAonWmj26SOUAUBSxNp6pchctBPhkW10SIZY4cDbZ//YqL9zTj2dBjrE/dJuoo3ge7
         ZR9qqvZBAXFFMWWiaeONhhZYRMUQ3AhUXsMy8sIxr6pvSjb1gTFypYn11YNptDr9b9tq
         cjqL3qcRnu7kyPenvCcwX+HfUFY1NOXwVGor3gxfLBxFmayZO8fHOFavVycrn1UZZpPN
         aGyXzgrR1Y82BlQqRh631uuR423oDms9xsDWsT8+Q5U3lRgVn/3Un3DZSFkPKT2sHx+h
         17Qjv3GKOEaSy+JDsQJ+MKcryMGfSFMDVlmYlE0gqM4hCOGhFReNT61yX0/PjzUPcqx0
         Loyg==
X-Forwarded-Encrypted: i=1; AJvYcCVjEertgvt5iCIGtssg1vLRtakkWkTSZf40ekF163YbUeRR3xYaBfIMgKT64JJz2QjdQ9cB@lists.linux.dev
X-Gm-Message-State: AOJu0YyKT6W0ggFwDF5m2XsvwZLq+oolEkKaKQJd6dmWliGc1Bw3OtiC
	G+8lx0tCK5hzL1DKsHrt9NTxDLHi/XfGtlaO2QfKFsau4V9lgClq6VK+Wjf0dPN6frUu2QhqtML
	UTWcEOg==
X-Google-Smtp-Source: AGHT+IFFAeeYwZo8g7rnKGgMqq9ef4KSzj7XjVvtF1mrE7Ad+JDdHJD4QWr288U1fWDVQWnorSbC+q7HAbM=
X-Received: from pfux21.prod.google.com ([2002:a05:6a00:bd5:b0:740:b53a:e67f])
 (user=yuzhuo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3a14:b0:740:67ce:1d8b
 with SMTP id d2e1a72fcca58-742a97b7a1bmr31736812b3a.7.1747868050314; Wed, 21
 May 2025 15:54:10 -0700 (PDT)
Date: Wed, 21 May 2025 15:53:03 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1164.gab81da1b16-goog
Message-ID: <20250521225307.743726-1-yuzhuo@google.com>
Subject: [PATCH v1 0/4] perf: Remove libcrypto dependency
From: Yuzhuo Jing <yuzhuo@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Liang Kan <kan.liang@linux.intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, "Steven Rostedt (Google)" <rostedt@goodmis.org>, 
	James Clark <james.clark@linaro.org>, Tomas Glozar <tglozar@redhat.com>, Leo Yan <leo.yan@arm.com>, 
	Guilherme Amadio <amadio@gentoo.org>, Yuzhuo Jing <yuzhuo@google.com>, 
	Yang Jihong <yangjihong@bytedance.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Adhemerval Zanella <adhemerval.zanella@linaro.org>, 
	Wei Yang <richard.weiyang@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Kajol Jain <kjain@linux.ibm.com>, Aditya Gupta <adityag@linux.ibm.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, "Steinar H. Gunderson" <sesse@google.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Currently, genelf.c is the only file in the perf tool that depends on
libcrypto (e.g. openssl), which only uses it to calculate a SHA1/MD5
Build ID.  This patch series pulls in the SHA1 implementation from the
kernel tree, and removes the libcrypto dependency from perf.  This also
switches the default Build ID calculation method from MD5 to the more
commonly used SHA1.

Yuzhuo Jing (4):
  perf utils: Add support functions for sha1 utils
  perf tools: Add sha1 utils
  perf genelf: Remove libcrypto dependency and use sha1 utils
  tools: Remove libcrypto dependency

 tools/build/Makefile.feature            |   2 -
 tools/build/feature/Makefile            |   4 -
 tools/build/feature/test-all.c          |   5 -
 tools/build/feature/test-libcrypto.c    |  25 -----
 tools/include/linux/bitops.h            |  10 ++
 tools/include/linux/compiler.h          |  17 ++++
 tools/include/linux/string.h            |  22 +++++
 tools/perf/Documentation/perf-check.txt |   1 -
 tools/perf/Makefile.config              |  13 ---
 tools/perf/Makefile.perf                |   3 -
 tools/perf/builtin-check.c              |   1 -
 tools/perf/tests/make                   |   4 +-
 tools/perf/util/Build                   |   2 +
 tools/perf/util/genelf.c                |  72 ++------------
 tools/perf/util/sha1.c                  | 122 ++++++++++++++++++++++++
 tools/perf/util/sha1.h                  |  41 ++++++++
 tools/perf/util/sha1_base.h             | 103 ++++++++++++++++++++
 tools/perf/util/sha1_generic.c          |  49 ++++++++++
 18 files changed, 373 insertions(+), 123 deletions(-)
 delete mode 100644 tools/build/feature/test-libcrypto.c
 create mode 100644 tools/perf/util/sha1.c
 create mode 100644 tools/perf/util/sha1.h
 create mode 100644 tools/perf/util/sha1_base.h
 create mode 100644 tools/perf/util/sha1_generic.c

-- 
2.49.0.1164.gab81da1b16-goog

