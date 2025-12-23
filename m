Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC1F219313
	for <llvm@lists.linux.dev>; Tue, 23 Dec 2025 17:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766509250; cv=none; b=R3paxBwlZhHE7RvlT8LbHkg09dNafxQ4rkqPfQLQD9HxK1pzC+8+JZVAb3nstSB/wjU36u7yqmwcAVpPPMzz9bX2/VSKT0A273Bhx225o1o6aowRVuxAWJIu8ZWULHU8g+JvnCK1rdv/ZeJQqZiJeUqGbwW2k3DGbmPC7LxHibM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766509250; c=relaxed/simple;
	bh=dTWw788i/aIQDj88gI6b3lkRd/WwANGU3kgKkaq9+sU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OAGcNKV6ciK6wWTj8LoPnxyExKVYG0Ztip6oVbMkKI5olFo2PPGCWOUcSbeRSMOQ/K1DEN3ybXzMTSpWeVyTmUO9XFGsWGeoCT/oGK6CKt8ZrLgaCIK+2hzwdjeyRKoc9xj69QV7G7lHgyGCX3j1arC/C9cW7UAQJUdh+AZcRJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NZfgEV4K; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NZfgEV4K"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42fbc305882so2702942f8f.0
        for <llvm@lists.linux.dev>; Tue, 23 Dec 2025 09:00:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766509247; x=1767114047; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+AMZ134fdqucwFPxdABRgu2JKtvYXYYhxBIYWyA0mN0=;
        b=NZfgEV4K1/FUNfPFSddxXDBBvElAwpUviaR9AdJheQq4sQvVN2ft0wzO93xkmYcmuq
         eGUeF0T15zC64D37rUTJvR5sJVhnQK9RE3bf6oH+6BAGjp74F0OalyMMMuA1kmXa5RWm
         kdhOuPFu8cTJEzhp6dISfdIlTOTYaQ7+g1Q9BGE0KZXuBs126d1bQqIM/2OHw+62zn5q
         55dt3bhGTIjlHOeocdTMpZhDwCttRnf6D8lbFhOkaqN4jOoGxRyqwC+E3lpeqpK7Oywz
         k+tFmlDCvJRTjvGSjz11dWHKbrxtp4A9jKfRsOdulAqdgK8HtrXZLvF9Clkt7WKHgSyh
         rTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766509247; x=1767114047;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+AMZ134fdqucwFPxdABRgu2JKtvYXYYhxBIYWyA0mN0=;
        b=dk7jwwLSrKYsn50li0aKdvqm1n23uZUAXKh1/6BgZcOrMBSH0ub4nPXKE/LvOmpc5H
         /WPekDQLWIMhEB2IGKYyTj0oTy2dj0mW0b4bwqrTlF2npLEIHmLs/7V4RradjXth6kGs
         ec5gvB89cF+7c6UlIPlfN3dxDZXg8TxfKxns/g7I3TKcP+FDrjAiqYAsBmGDW727eK4d
         Q9qO7gbtDJ8gCPcmc4wgKYTva+qkggvVf11VwhGI+UuCjpMV3/GoXmB5gCnPDzsoSZF/
         r0+oRy/aEMzRFq2krPqLAFM4+xRXCVe7tkUbOMoKRSEp2kONiWYEYE0aHADg/kiQrmQl
         2MNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcvLvlddh/dQr07pTZCcxiKTapN4OJ7mITfYVITMKbmcaPalX8msKhtbI2utjvU5bl2BwM@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0aMS5Y7KxqF2XBX5IRs3tIHUPCS2g7MAQ/lxdwRNSgbTrcnhj
	35cm38IKU2TizZboVhTHwdPHGkdsQtIheUKM1yZeRCCX1Tiq3xdk0OhEb9MWJmLsZ2U=
X-Gm-Gg: AY/fxX787W3+OULo9+sZTF3rajgVZIwg+XNMDY6W4PTM+9CK1kAVhqBLXAvl5OKwTxm
	ylfjebJ+/6/butjFtXBHF4GBD1+fLokvOvbLlfZmY6DStis7PJb9dzNNm39kP1ExDzLhgyNR8u0
	L4BvRx4l0Hls5Odj+KKCk7pOz8F4q5UB7C/KVsNgTBiccTEFm/a9apVdocbm9qx3IqLnLaDxPX3
	88riX+/LRWQKRhAYat6B0sEuatpNxXBlMNDgiVO9OXhshsgp8gce5ykyXcJ55kqxLvWDmcwpOE3
	JAmJWBT0E37lMYsRmf/8Zsmqz74d6De2MdYF+OQARfvKQ6ILkUAWDNlo/B4Du5Rnuc7G+2du2uO
	Zw2rnTR7D2Gbq8ujwtGXmG4UrP3WJU0jg0pZM2aO0Fl3S45OgRJGwGtr2e9p5aTqgAYBwb6nCr5
	zmKfWOtsE7Vm2cgU1Cc2yL
X-Google-Smtp-Source: AGHT+IF7/O/FFIayLKZhY9ZSqUb3Qa2CbWoPZO1if/TAVGsvjrw64xIReXR1i4g5vjHNjk3QtbjX2Q==
X-Received: by 2002:a05:6000:186f:b0:430:f879:a0ed with SMTP id ffacd0b85a97d-4324e4bf603mr17523279f8f.13.1766509246553;
        Tue, 23 Dec 2025 09:00:46 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1aef7sm28895137f8f.7.2025.12.23.09.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 09:00:46 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH 0/5] perf build: nondistro build tidyups
Date: Tue, 23 Dec 2025 17:00:23 +0000
Message-Id: <20251223-james-libbfd-feat-check-v1-0-0e901ba32ed9@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKfKSmkC/x3MywrCMBBG4Vcps+5AMuJCX6V0kU7+mFF7ISkil
 L67weW3OOegimKodO8OKvhYtXVp8H1HmsPyAFtsJnFy9SIXfoYZld82TSlyQthZM/TFcBrdLYp
 6eGr1VpDs+z8P43n+AFknJcZpAAAA
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Leo Yan <leo.yan@arm.com>, 
 Justin Stitt <justinstitt@google.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Roberto Sassu <roberto.sassu@huawei.com>, 
 Alexei Starovoitov <ast@kernel.org>, Andres Freund <andres@anarazel.de>, 
 Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Nick Terrell <terrelln@fb.com>, 
 Song Liu <song@kernel.org>, bpf@vger.kernel.org, llvm@lists.linux.dev, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, 
 James Clark <james.clark@linaro.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Quentin Monnet <qmo@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>
X-Mailer: b4 0.14.0

nondistro builds now require a specific version of libbfd, so this adds
an error when doing an explicit BUILD_NONDISTRO build and some other
related tidyups.

I'm not sure if the intention is to skip build-tests if something is
missing, but I see it was done for libbpf versions, so I added the same
for libbfd. This is the main thing that I hit, that build-test all of a
sudden stopped working for me.

The first commit is also a cherry pick of an old commit that seemed to
have been accidentally reverted in the unrelated change linked in the
trailers.

---
James Clark (4):
      perf build: Do all non-distro feature checks in one go
      perf build: Remove unused libbfd-buildid feature test
      perf build: Feature test for libbfd thread safety API
      perf build: Skip nondistro build test if libbfd is old

Roberto Sassu (1):
      perf build: Remove FEATURE_CHECK_LDFLAGS-disassembler-{four-args,init-styled} setting

 tools/build/Makefile.feature                 |  2 +-
 tools/build/feature/Makefile                 |  4 +--
 tools/build/feature/test-libbfd-buildid.c    |  8 -----
 tools/build/feature/test-libbfd-threadsafe.c | 18 ++++++++++
 tools/perf/Makefile.config                   | 54 ++++++++++------------------
 tools/perf/tests/make                        |  5 +++
 6 files changed, 45 insertions(+), 46 deletions(-)
---
base-commit: cbd41c6d4c26c161a2b0e70ad411d3885ff13507
change-id: 20251223-james-libbfd-feat-check-e0cd09d2c1e1

Best regards,
-- 
James Clark <james.clark@linaro.org>

