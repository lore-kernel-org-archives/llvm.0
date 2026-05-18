Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453B73E5A05
	for <llvm@lists.linux.dev>; Mon, 18 May 2026 09:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779095057; cv=none; b=F9X17O6l6OqY0eWpo72PYN2UOJK+2JLasYL/OPHuElfGWiwsoRPe2vciu0xleahWiQLzgRwHFRpRfO/dgjT+g0kOY5++FcF5dcAYlUFihAm8v2OzbvAHGcCQb1ZTDwCzVEzS1wI3vV6AiaWGbojuYMZFH8BPOKxWVuhr1ihgyzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779095057; c=relaxed/simple;
	bh=PhCveEiZIdUmcGwyU5spejpP9AhnWoovrQrg6qXZOwg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KaSorf9XwmlTs7uJ8UdhytCeANJp31nV5iFdAWp15CQHAVj8KPllbKXkYBJB3NrCiTFLiFF1/qp6IL1THYmAS6+5uW0OcKnDV6s/mMcxq8GyuseC/ySuUdEWYw0Yuzs1iu2FH6XjRp1d5dzdpeED4h9dh2RaN3hPR3p9VfYe+Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nHS3e4sT; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nHS3e4sT"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso13103775e9.2
        for <llvm@lists.linux.dev>; Mon, 18 May 2026 02:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779095054; x=1779699854; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qi50aH0ofyIVTmJunsbTWM1jEiSwseuTv8Zx+hC3coU=;
        b=nHS3e4sTqLGu3BwZg2OytUy09PUsGNnh0oHdCM2GMRRTPURUhgSiI6IHDBpIJB48DZ
         +K6IXqE8QjOgaXAzQSMBYz2+iSlvsEVEueQmGKxaROi60DZJtyrhuYkGnyU+1mpcx7eP
         SdnrB1VJgQK6saSE1BTQF+zv7xNvXkjYJz6a11EPnupl6dwvl0UqGddQwIn8tVG7OBNB
         97JbNaZ9HMSfFyjvEPsq0mGSwpu6QnltjjKdfDYhe7PXI24tgWrkuRlWhsS/AVBydjit
         Dca3g77cjsaLC/bdlLTZUBLvoHaM+LhAP1lO0St9Y3fk+EEyjvE1sVLT7FCT6XpMqD5U
         3Xrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779095054; x=1779699854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qi50aH0ofyIVTmJunsbTWM1jEiSwseuTv8Zx+hC3coU=;
        b=c1Q3O/NJvGjI8MtlQDKacrSrbSawPSRfX93yWBzVKW61lzpt4/qPsZ0VbPtfaTH5wI
         DDz6POvjeesSxHilxmyJhv1Ray5NZfIQjAEZI+pK6a270lJq16353Sb8TprODVB0iPI4
         Xrs4ZJFYPhqjMJbkV8b4k4f3wt4H7CUGsBPHFMbK5bVd/m4ebiMWp7cNgvu2T7bOaXdm
         TZZ/lcyOSi//RcaUIuSkoDM4YnkaU8FKblviOOd55LPrTXs3VTAbYYhhovIcS+KIkxWx
         attcYXN5GU9oKVJSrObblDlDSkSsbkQ8vMny0bbwbWslEX55SUY0XNjaaJQjA4+88eRa
         8AnA==
X-Forwarded-Encrypted: i=1; AFNElJ+mgN5O06QR96S3oHz2L06J0oS7i4TAikNPUunohdIw00BFgduzKB8nXKa6NYwv3H0qvwFy@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4+VUzHGAYmfAFt9IzX4xbQx/j4+DZCJxtotHQ0tMnGd7jqjb3
	OclY69Qv92IeWTNSbbh3MvqwiBW6HFm1lL2qhKa+W27fLiizta+g2jyvTYk6TUP+DUo=
X-Gm-Gg: Acq92OFszetgrJJH86Yzk08Ha2UPwjfjLBPbXLMYzkFyVLe3KUzDa0HOwhJbPW3N9Wc
	MF/AO5xV+oh2iV9fhIDKtNu7rxn66+IBJJUlgT9P6E1GdLH96wF++gnPC8KrUKlAhhJzW1gEOsD
	LJzB/5C7Hf/NoXN0NzH+1pN7/aGVmlTsH4LFa8r2dXbxKpXcTpDUFS2KRvYy0YvefAQzYXfJycH
	bZaDR3QgEeRPrVOXYrIiHfe05u/81zZf4VcnWmMHPstxVR6wDBLyp+oBUjOrBlpFD4O3Twf9175
	9kGyB2uh2lI8zu+3Q2N+RyuQ1xBFQY042YkqxuZhhdO1dtmswlWJj+6M4ic97nw1RIVPz6pjoKJ
	Tneeh1TZN1pvXzolHNplM49pWKMAME/2nmdHuwPLVSixdvTOU9G2+cnssW7xrp8R0w2SrJ1O9yO
	0zxoeUy7Eg/jn7jUwLbjgKPQMl6YzlqFRe
X-Received: by 2002:a05:600c:8715:b0:490:b07:5f27 with SMTP id 5b1f17b1804b1-4900b07600fmr72330915e9.24.1779095053446;
        Mon, 18 May 2026 02:04:13 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768072sm35084436f8f.5.2026.05.18.02.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 02:04:13 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 18 May 2026 10:03:09 +0100
Subject: [PATCH v2 3/6] selftests: Remove unused LLD variable
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-james-perf-llvm-version-v2-3-f12cc4f031d8@linaro.org>
References: <20260518-james-perf-llvm-version-v2-0-f12cc4f031d8@linaro.org>
In-Reply-To: <20260518-james-perf-llvm-version-v2-0-f12cc4f031d8@linaro.org>
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
 Yonghong Song <yonghong.song@linux.dev>, ihor.solodrai@linux.dev
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-input@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 bpf@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
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

