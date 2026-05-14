Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D873A3800
	for <llvm@lists.linux.dev>; Thu, 14 May 2026 09:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778751158; cv=none; b=Mte4IlRm+oajR3RwET7DamQLDG3vJTd4LrRnmuj5FFKQxWTfe91P3V8EjbbLIJaU0SI9T0P9X543GXsW5b5svZJRBpIu67w3B7KAw4a3KnUVcA2ff8MpV3QvH3O0UpHgFE3YcAGDCdRwyJE8i8tT4Z3fD9ScVcYk4EKazEK1gKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778751158; c=relaxed/simple;
	bh=PhCveEiZIdUmcGwyU5spejpP9AhnWoovrQrg6qXZOwg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ODJIE7YRIvcDYG9tJ+WuHVqhjflM4H89SbJ3xeqQPnMBwVKwxmLcTTk4SedajnXFMUF5yXAxrtD5YQUekCkYJgLEzsNbodN67ZH1xAv3orO/QVytf/jMFslAiBk2g5Vve+74YZXKxYDQ2gdPEFP05kMvssB2mKwy5SOYOFacfwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iQxVPZom; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iQxVPZom"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43d7645adbdso4234207f8f.1
        for <llvm@lists.linux.dev>; Thu, 14 May 2026 02:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778751155; x=1779355955; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qi50aH0ofyIVTmJunsbTWM1jEiSwseuTv8Zx+hC3coU=;
        b=iQxVPZoma8owWn2v3Rkk0G/O+beS0KLSKZtoIHjE0YWVBjrrNTtT2wTNCtMQiyLYyi
         l0eRKXw+qOUyNa+ipCemTULLzXlJOREwjiKeSpOb+Y7Lmrv8lFCrB6cDEj9bi/dGQXkJ
         n/oWPigvM/9/1LZ0V0LxJiDTOT8Vm+o4tL8RxgL9ZT+1cECZRYRnbTW4HWLOAha5aPXQ
         lj2CLyA+JuUxNNy2cjaDfTz1nK/9fyN8LdzMMBOZbjPdPfXl1nf7EXPIKuX1HV5iYuCJ
         CJe90WoDxocLDmBfXVHv9hegjN4sf1CUb0zfqGJWC+opDVvEGkS1V4MC1dMHXxLDzYG5
         idJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778751155; x=1779355955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qi50aH0ofyIVTmJunsbTWM1jEiSwseuTv8Zx+hC3coU=;
        b=pFQBH+RVPtgk6+mivQ4+vH/r9ystYNzxLh+SbX5hZc5hHw7tH0ble2lTB4xiP0h0pY
         bU9m4cyQPAYl4Gy+3xJJV5y0GCQvJv3WfG1hK5Aqd+9CyVjv3lf7I+vea5kXiRbe/Shl
         iZUSUGKuBSTRtA9c6uPGTs4CxqnLcarJEi4XGfDX/3xjV3GFPGFLtWo8kyYcjoRHdDOs
         E8uGhfsWJ1Lc/dLKzDRiIk45hFQG7yirAvBdzb6KpIlxZtVUY+/PDxt0m5rZbRNcMF2y
         S16q82dy+ln6dIwyDzVWcMI8KSn7rqVXnhR9tkV1HtFwqcC4v1kH94K57nqMKJexbGEp
         SKfQ==
X-Forwarded-Encrypted: i=1; AFNElJ/CYEke+mCBoZ/wvmZShwlBvtcJ1qn6MYOp1PkPOlkhELbHg27VkjcGRufJRWbX3Csg0do4@lists.linux.dev
X-Gm-Message-State: AOJu0Yzf91THRUdRGW5IWQmM3mxZvo4CJQq659C7Hm3HqiQuQLJRBclk
	81wP6oYPSdoxGtxcY5sBDn8MO68K2Cq5oTahoTcogEUn1u98lTrMCJ6dyr1Oy8mbu6g=
X-Gm-Gg: Acq92OEK6IH9T+RLy5gJCo0rrFWmjfTcuRZzrA74FFmulSHOU+39/a+q1s4U9fnZvl2
	kCixgF2xX2a4wc9KQX13+CxvKEkrMa8elAlqvlYQOOq7uVZnijm0s5Sig9XLmjwKXmVyxi1cTiY
	db3XhG8L/j8UvyTbZWOLN3FTCxJdYty2HemQaBDhSarfpKQohjt1NE6c3rbk3bvGaipUxjx3O0K
	0FE47bttuLCByCM7Wu7fiH+l8EwSSTi8jwvSpkLQ4JfkY8d+NirR4OAXTNzC/u2ct2cgVXL/D9y
	G+VboGILz1LfsWxUZnaVIrBPjyA0MrIvxlOlFG/mD+/Poj5d310pT9t+d0Krwhg7817OHasjShc
	vWK3YhLAVMx/LIUE8TL/iFDHlU/FydhjjLRsnYxcFIv9w1jqTycq1KvATiAgkJrpzKYmy6dYI6Y
	m73KK3s50Y39UaNVcLX0viEGlMNydfxFLm
X-Received: by 2002:a05:6000:2882:b0:43f:ea91:63ff with SMTP id ffacd0b85a97d-45c58a70c1emr11251761f8f.10.1778751154951;
        Thu, 14 May 2026 02:32:34 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe0fecsm5097164f8f.26.2026.05.14.02.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:32:34 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 14 May 2026 10:32:10 +0100
Subject: [PATCH 3/6] selftests: Remove unused LLD variable
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-james-perf-llvm-version-v1-3-6cac1a9a4c8d@linaro.org>
References: <20260514-james-perf-llvm-version-v1-0-6cac1a9a4c8d@linaro.org>
In-Reply-To: <20260514-james-perf-llvm-version-v1-0-6cac1a9a4c8d@linaro.org>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-input@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 bpf@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, leo.yan@arm.com
X-Mailer: b4 0.14.0

This file was mostly copied from selftests/bpf/Makefile, but the LLD
variable is not used here. Also, this copied block didn't get the same
fixes as the original one did later.

Remove it to avoid confusion and so future fixes don't have to be in two
places.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/testing/selftests/hid/Makefile | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/tools/testing/selftests/hid/Makefile b/tools/testing/selftests/hid/Makefile
index 50ec9e0406ab..96071b4800e8 100644
--- a/tools/testing/selftests/hid/Makefile
+++ b/tools/testing/selftests/hid/Makefile
@@ -105,13 +105,6 @@ $(MAKE_DIRS):
 	$(call msg,MKDIR,,$@)
 	$(Q)mkdir -p $@
 
-# LLVM's ld.lld doesn't support all the architectures, so use it only on x86
-ifeq ($(SRCARCH),x86)
-LLD := lld
-else
-LLD := ld
-endif
-
 DEFAULT_BPFTOOL := $(HOST_SCRATCH_DIR)/sbin/bpftool
 
 TEST_GEN_PROGS_EXTENDED += $(DEFAULT_BPFTOOL)

-- 
2.34.1

