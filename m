Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BC2385D84
	for <llvm@lists.linux.dev>; Wed, 15 Jul 2026 14:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784127262; cv=none; b=o9VAl1aqasTQkF6nKz55A9msbn3SNcL84HnoLe1cFpmk3f6kaBIt5AmOW3/PUL4tWkGwhZeFb0VMwpt1IOaYcj5ccWQddnsRj/DFuf2x6buPIsK5PbTklhG87myWza3oOqCFzW1Gh1pcTUHpdsDona0LFsQleBFaG5e8QpAuvKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784127262; c=relaxed/simple;
	bh=B0WPxj3EierW3H0emFrNYAU3ITUd/G+ZN9Cb4xiUUa4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sSYk2Ot6HzX3N/KyPKNGXVB1tm9oEFIZk6ImwYi8hwCpNHsGK2AbxDpN72JHICVK85xu4hvMkkRm2Qsn0Q+8Eq31/0UPI1YrgUEXgftAYw/FFIJnOQuyaBfXQ2nIZxasSwa3RJmX1th5l6tpwJ4p4j5XP92LRZPrBimb8bFJOBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YBHoH5ua; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YBHoH5ua"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47df6a5202bso3598676f8f.0
        for <llvm@lists.linux.dev>; Wed, 15 Jul 2026 07:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784127256; x=1784732056; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NoqWI+ZkKhb51wo8tujVZWJK2s6uymb7bKFku4KV8C8=;
        b=YBHoH5uavNk172zrWoagPRuvjCBQkT/H6eltz3cDqJhJHULF+v/0jLJc8mpgf/hIfL
         gmLKmvngLq1b6nwqwb1clbgFFhL7yljWCyyq7awXqOiT+sJK8h7gTOxhw0z0OpSyMUF1
         urZPz9DeYKkyciba8ezMBOdjLh8a7v5CfAj+2ChchwsqtE+FK7EL0g/8BM0UdQ4QtS2U
         NPgHO+jTE6LfqD3gY6cv4RTDMxw4S0Tmj7fTqhghFfmqIp7uyv7Hhol4jbD9oWyURNrx
         E1NvHXEXgb7WvdVtTqYRd3Y6CrpaEdR/SnfaLl5VfaQ8ULGcF8Um4W0UKLvhsgjvFpp/
         I67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784127256; x=1784732056;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NoqWI+ZkKhb51wo8tujVZWJK2s6uymb7bKFku4KV8C8=;
        b=gPWBDS0sXiEJgHJWOTSUw1oyCp6z9BRFSDHUwXwlD9H7WNgBFJP3aDj1kYzYypYorh
         hHfDgmbhDEOHIaMXaR0dLQC9dybso1UehChWUmrk7RqMyShVDos9D+/9Sbk1nmgISETb
         BhfPSJwvcPQdDaz4Czbzd40HUlqAre2MObXoXp96H8PCYHt3WNHqZyUKgWgTmilWhz0N
         9xr75iO0vF2HjyyaJa6XV+IFzpMnZUMNU8cnfBwMqXJnR1rp6XHwjIYJwSfj6aCqPqp2
         HFP/xTkW1BPInR8MS1kBq51MxIJbDoioSJw6Rc4cpL6iB17eBP0n+J/MZhZbxMffGHHe
         PMLw==
X-Forwarded-Encrypted: i=1; AHgh+RquUhJ7gt+sS0jIhl8SGwLsqSf54BcGiNsqCmGkHYHtUt+Zy7QHd9XNjcDwFTm57Of4FMck@lists.linux.dev
X-Gm-Message-State: AOJu0Yxc28QBvosoKSGVePoDQbJaLmwkUYo7dJi4+gfHXXL7f/fHWPx2
	kvk+phNTcrumzd/KFh9t12W+OMGIyvEayRtVjuNCPeFtQehHJXVxEI6XyTUNsRlh7QE=
X-Gm-Gg: AfdE7cng7mHKvkNyuS9EOIUZjtt3KhCmPvgTwjrrgagiaGGe0M6tJjuWSXSSjivd+hm
	GCkaTZQWUC6iKmstxcFjx+GKoyi/2kno1rFghbVX5nJ1EW1VXmWp2XLV5LJi4awW5quOPGAzRMH
	v5BciNLToCEQ2rvEMklwWilBmV5TV4W4HVSU36ylHiciqUi36imRp/849uXiv9ec1Tm9VJ8Acy9
	s3Dw8H46YcaNL30VzSuFNreqWYyXNI4k1yllCb0tb+HeDWpqnq4SNBwYZwzHwypBTYzGEHgsyra
	XVBhNBmz3hTsDlmSU1xUV/1QPTD3bwJMWSTY26iBLDnAodDc9KQvHhFK54IXCu3Y2g0VO9Tuqjc
	jAajDYdFpzIOGStpoK75b/5kxcTgvegAWtgn+MmDcmxwBfPEuuVihgctuGKg3SJFfZaUJUBhKc3
	JSuSi+12ClXeYpO0QmlDL6xQ==
X-Received: by 2002:a05:600c:3487:b0:493:bacb:1341 with SMTP id 5b1f17b1804b1-4953c144adamr35488965e9.4.1784127256465;
        Wed, 15 Jul 2026 07:54:16 -0700 (PDT)
Received: from e133063.arm.com ([212.187.182.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49510c8e220sm137649275e9.15.2026.07.15.07.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:54:15 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v4 0/4] tools/build: Allow versioning of all LLVM tools
Date: Wed, 15 Jul 2026 15:53:47 +0100
Message-Id: <20260715-james-perf-llvm-version-v4-0-6dfdf984b435@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPueV2oC/3XN0QqCMBTG8VeRXbfwzE1XV71HdDHnmS7MyRajE
 N+9KURFePk/8P3ORAJ6i4Ecs4l4jDZYN6Tgu4zoTg0tUtukJixnZS4A6FXdMNARvaF9H280ol8
 2lBeqBl2LWlcNSevRo7GPVT5fUnc23J1/ro8iLNe3yTfNCDSnpVYa1EFxLZtTbwfl3d75lixoZ
 N+Q3IZYggwwrbnJC2jkH1R8oArENlQkSErBa4NCmQp/oHmeXwJwbDdRAQAA
X-Change-ID: 20260511-james-perf-llvm-version-43ab1cb5bc7d
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, bpf@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.2

I ran into the build issue mentioned in the first commit, because using
an option like LLVM=-15 is a documented way to build [1], but only
some of the LLVM tools defined in tools/ support this.

After fixing that, a lot of other tidyups fell out. I didn't go too far,
for example some selftests include tools/testing/selftests/lib.mk which
reimplements some of the LLVM_SUFFIX stuff, but other selftests include
tools/scripts/Makefile.include and I stopped before touching the former.
Some other non build scripts hard code toolchains and I didn't touch
those either, this change is only focused on things that already
include Makefile.include.

[1]: Documentation/kbuild/llvm.rst

Signed-off-by: James Clark <james.clark@linaro.org>
---
Changes in v4:
- Drop "tools/build: selftests: Allow versioning LLVM lld", clang
  already picks the correct sibling lld version. (Sashiko)
- Link to v3: https://lore.kernel.org/r/20260715-james-perf-llvm-version-v3-0-8854bfe5af7e@linaro.org

Changes in v3:
- Add warning for empty $USE_LD
- Use $HOSTREADELF in bpf Makefile
- Rebase on v7.2-rc3
- Link to v2: https://lore.kernel.org/r/20260518-james-perf-llvm-version-v2-0-f12cc4f031d8@linaro.org

Changes in v2:
- Fix selftests/bpf build. LLD needs to take the full path to be used
  with -fuse-ld=
- Link to v1: https://lore.kernel.org/r/20260514-james-perf-llvm-version-v1-0-6cac1a9a4c8d@linaro.org

---
James Clark (4):
      tools/build: Allow versioning of all LLVM tools defined in Makefile.include
      tools/build: Indent if else blocks
      tools/build: Allow versioning LLVM readelf
      tools/build: selftests: Remove some duplicate toolchain definitions

 tools/bpf/resolve_btfids/Makefile    |  3 --
 tools/lib/api/Makefile               |  4 --
 tools/lib/bpf/Makefile               |  8 ++--
 tools/lib/subcmd/Makefile            |  4 --
 tools/lib/symbol/Makefile            |  4 --
 tools/perf/Makefile.perf             |  7 ----
 tools/scripts/Makefile.include       | 77 ++++++++++++++++++++----------------
 tools/testing/selftests/bpf/Makefile |  1 -
 8 files changed, 46 insertions(+), 62 deletions(-)
---
base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
change-id: 20260511-james-perf-llvm-version-43ab1cb5bc7d

Best regards,
-- 
James Clark <james.clark@linaro.org>

