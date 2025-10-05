Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2EE2BDC14
	for <llvm@lists.linux.dev>; Sun,  5 Oct 2025 21:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759699344; cv=none; b=o7VJ50eNHc9hW+lekb20EicoQh3lHHjTFPaFwB+qswGIDfa3SG0157fSolNa1OzkyJfzdKwFaPvbXS3ITor1IJB8hJK0c6xqcsywdrtPLmWpeeurQXsEaJskjjyl+HpZwm1ym0aeMVocjTNikCjoZNWlgxvXazQ2xuhIgVPy3Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759699344; c=relaxed/simple;
	bh=/luZGaDcmbSsI2ELFDFE/EBkhdco1hXagnVGpUVsYwI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=AbgTi1eWY00dodRMtw7kNE9ot0/8m6cJGwYYf5U++5s6X5sz717+IvA30tSeKrNek7sXFzk8WpAXLHQPPDeUZXNinuPQ3GEoy8zDMmZC7czswyRtF2fdD6/02U9/nfUXyb+f5wnOyXGKNAP21jddmFN6+8zljqo4xg/lpCg+sN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ml0SLKgq; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ml0SLKgq"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b62da7602a0so1724419a12.2
        for <llvm@lists.linux.dev>; Sun, 05 Oct 2025 14:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759699342; x=1760304142; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hHVoU7VdAErJHQsuyUDkFaSuPa656SpDfPesPL1Iw7A=;
        b=Ml0SLKgq+2gUefXliCtonEDUl4Bp/55hxIPhp8bae4e8F/idQcCCYKTo64sCt5NISj
         J/0pFL6V8SnGQHTXpHs9h1N8u5dCGCXtP5VfwTUqAso3+Q6Nk4Xw2UgfLBWMks4N7ZfW
         cdf2X6/dy+oyFLyR6nqNSuEXsbE4dxDgrwAcL43nH72TbEpcKGP4Ke2Vge37wPIoQfmX
         eiRMFCoRhCE4bdIcI8h7cpTPIXZwaB3O87QdrvFCGdIF3Q3CFAadlw5HcOGLpwIB4+MQ
         cRMhWLl55BIY10iA7NoMP/b4n0bQONgdi/H3XpKZ3VP/K/2aXFOwnaZp61X7SMeVl/dq
         kxyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759699342; x=1760304142;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hHVoU7VdAErJHQsuyUDkFaSuPa656SpDfPesPL1Iw7A=;
        b=IayFHBX2KE07NxqDaFKPR5XVRVy+oKenGmUbJjU28T+JK39yIENupFxOUu9tLXXX+X
         Zd6hifrXHfQBsNqXxdZIpF0z7XGYfmmw0Dxzo/fdI8yi6QOlUa0PCMJtFhhP9D5MSOwH
         97NaStgS4nNlvcQl23lY8TVOiJ4frUNdMUO2okvt0DnZJrdhxVE1bNKty1RB8PNtCBsR
         mESUtYBI0QRbB63fBfo5f0jWNkM9kofLWUNAJKc67/3EZuTGzki9tWtbnjGH6gDGC1Jl
         mK2OUGoOm0r6QvqnS/mdXs3OsOu3FHVnZ8BQgMgHGZ3XMU1JTAejVfbeP/kX0TTz74OY
         nmaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGQPW+i9veJX78RsOPj0cRRliGdKPI1ojRV5gdBGFYUrEkD5Hxo/XYVOyYWetWhlxhDFvW@lists.linux.dev
X-Gm-Message-State: AOJu0YxV73WUIW1kLjQykxE74nuCwlWxsgLbdaYcajtzV/0tgpp/vXFW
	Xhumdc4zKICigelY48AEv6EnJp1f/h25oAmwEDDY65xxe2SWtLwYburKSrn34lJaE22ud3H9ToZ
	TV5GJIcZlGw==
X-Google-Smtp-Source: AGHT+IF9xACFD4NCBC8YA4+1DxHgAs4tVBez0mS1xBu199M+awLsaSCkEQ1/ioP2OUdMojXU72RjQE/JWxIn
X-Received: from pjbpf16.prod.google.com ([2002:a17:90b:1d90:b0:330:6c04:207])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:e211:b0:240:1a3a:d7bc
 with SMTP id adf61e73a8af0-32b61dff87emr14700817637.3.1759699342575; Sun, 05
 Oct 2025 14:22:22 -0700 (PDT)
Date: Sun,  5 Oct 2025 14:22:02 -0700
In-Reply-To: <20251005212212.2892175-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251005212212.2892175-1-irogers@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251005212212.2892175-2-irogers@google.com>
Subject: [PATCH v7 01/11] perf check: Add libLLVM feature
From: Ian Rogers <irogers@google.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Eric Biggers <ebiggers@kernel.org>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, James Clark <james.clark@linaro.org>, 
	Collin Funk <collin.funk1@gmail.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Li Huafei <lihuafei1@huawei.com>, Athira Rajeev <atrajeev@linux.ibm.com>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Haibo Xu <haibo1.xu@intel.com>, 
	Andi Kleen <ak@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev, 
	Song Liu <song@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Advertise when perf is built with the HAVE_LIBLLVM_SUPPORT option.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Documentation/perf-check.txt | 1 +
 tools/perf/builtin-check.c              | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tools/perf/Documentation/perf-check.txt b/tools/perf/Documentation/perf-check.txt
index ee92042082f7..4c9ccda6ce91 100644
--- a/tools/perf/Documentation/perf-check.txt
+++ b/tools/perf/Documentation/perf-check.txt
@@ -56,6 +56,7 @@ feature::
                 libcapstone             /  HAVE_LIBCAPSTONE_SUPPORT
                 libdw-dwarf-unwind      /  HAVE_LIBDW_SUPPORT
                 libelf                  /  HAVE_LIBELF_SUPPORT
+                libLLVM                 /  HAVE_LIBLLVM_SUPPORT
                 libnuma                 /  HAVE_LIBNUMA_SUPPORT
                 libopencsd              /  HAVE_CSTRACE_SUPPORT
                 libperl                 /  HAVE_LIBPERL_SUPPORT
diff --git a/tools/perf/builtin-check.c b/tools/perf/builtin-check.c
index 8c0668911fb1..9ce2e71999df 100644
--- a/tools/perf/builtin-check.c
+++ b/tools/perf/builtin-check.c
@@ -48,6 +48,7 @@ struct feature_status supported_features[] = {
 	FEATURE_STATUS("libcapstone", HAVE_LIBCAPSTONE_SUPPORT),
 	FEATURE_STATUS("libdw-dwarf-unwind", HAVE_LIBDW_SUPPORT),
 	FEATURE_STATUS("libelf", HAVE_LIBELF_SUPPORT),
+	FEATURE_STATUS("libLLVM", HAVE_LIBLLVM_SUPPORT),
 	FEATURE_STATUS("libnuma", HAVE_LIBNUMA_SUPPORT),
 	FEATURE_STATUS("libopencsd", HAVE_CSTRACE_SUPPORT),
 	FEATURE_STATUS_TIP("libperl", HAVE_LIBPERL_SUPPORT, "Deprecated, use LIBPERL=1 and install perl-ExtUtils-Embed/libperl-dev to build with it"),
-- 
2.51.0.618.g983fd99d29-goog

