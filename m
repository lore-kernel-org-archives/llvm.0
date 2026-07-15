Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821594657F6
	for <llvm@lists.linux.dev>; Wed, 15 Jul 2026 12:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119190; cv=none; b=pSdtc8QX2v1opQrzxKsXwPLOuXFZVFuoWoOY5SlG81HlwzJlUG82RsE9YrLIAjssDGd0RmzeNj5ECNHCV0Qopsj8csLGrtm071cBpDDDIgbY2ZHpLRCW8hO3h5PeiiXO8RQ2k7Pqth3S8Hio0i0wMcsmCGTjFXEk/t1jXP0kBgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119190; c=relaxed/simple;
	bh=455wlYCUNnMcrIdVi41A5Y7HIm5ipb4kz3mpabm/Y0w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QzxTM9UcDP0UUVj9/epg9rMGkuAzquij/sAHt8iC60nausal4P5tmLJTMzdTpMq1Se1iPM86GT1kt1+kNjxq3vKVw2sGTsr/ve4QfEfibxSy+NhwTngAKk5/jngdser6hnjqVfKQpZajYcYQYg5y23B7ApXjXcrfeK58qqEmhqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HD9+goVy; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HD9+goVy"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493c19bad03so48191675e9.2
        for <llvm@lists.linux.dev>; Wed, 15 Jul 2026 05:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784119186; x=1784723986; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pqmS0wGyyzISZUi2iZDsoqebuB59CdpacRLQw8zIRIw=;
        b=HD9+goVyIJjmrKyt6Y803x4N8m4zewWzwroS/i4vHAFC2VBCcqO/TX7GaAvEeXunkH
         Odm+WjSV0ydctnq1T7jn5Ny2/mO4KpPa2A4xUKRLHQ1UelyMX2ESxWfBS386oeGclKsc
         fmmR4Wui/bv1HQ+hn7ckSJ0I3URbq95axrZ/ilgS9XEh6bOwHzNruxUZs0PHDj26ejkg
         TIFu1F/ngLByfjhtssnU1Gl7v5/RcSPiA1qU3TdelAHZNhAF72tnOAYyj/sX8KrOC0tg
         stxpD5dmtI9pDurGqCgakKc8BLe3pfNJ69TfEtHyGgpVx1o31AliB6XaL1T7HqOdFckQ
         vN3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119186; x=1784723986;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pqmS0wGyyzISZUi2iZDsoqebuB59CdpacRLQw8zIRIw=;
        b=l4Au0NBMpxpE+6uUjql6zraDuDNix4BKpPF2PpIOjdtnc4OKmTmE7R7VH/C/6yf3uH
         PDtw2KKS1F/MlEDa/J66vjP1DT9YuerA2WniVWil9k1EaE6g6HcD1mEadCcXGkByizKU
         cNeLRBDo9gdEzVhl3EK1t1fghgUHvwWl+wfOLm9GLO/lsb2PUceQaQRMkJDkItDSN/5f
         /Uz7BCzBTD2J2h6K2AVipItX35YhbUY7O/zWf6S63rmMl96aWBvaIgPxnTP8BNU9oKxQ
         Vpmcn+gjCCVzbYHCEQiRJ4MkO6E8w4tdXu1raPQujE3Ta8zppxVLUaqu1ijvL0B09DpM
         aLYQ==
X-Forwarded-Encrypted: i=1; AHgh+RpYpQFhrv1szwiCPBOGcq5awbrWc1POO7bRtkzGMIVgeiPdJYqZNMq73n8vWLAJ6nrR7isK@lists.linux.dev
X-Gm-Message-State: AOJu0Yx50I2c7piGwyxlTTK1OLhOF3wzfzW7dfT7N2hoH6g7B8syFode
	3Yhs6cdqktb6oYThMX5cA/PtY6AdUg308DmF6aB6ZVTS5m/aoV5Xa4vXny6INgCdx/g=
X-Gm-Gg: AfdE7cmjcLLgqhuRSt3f8c1MVIo9lWeR8nKZg7hUUHeubtEHdSaZYYXIFyTiCPED/4v
	2JacIie8MLgf5v2WIUqSD81F97YhQlCgnR+lPNEV84dsK3c86XeTwBgfTzhlR3dSrQFSvr+MgXx
	lmEDy4aD2uIQ4gPzOdWe7ViW7DbqEDQNpdij2I+181zO+sHIBTj7pDE21d/wFB64EIxSfCjJxnZ
	MhrFjP6WlZi9ZnLR6txxtQPzzi8eNf+TZj73AQCGyCrcFI8Ml6pvAIhgY4uB2061sI981BiUpMn
	/cGj7dZTFHonz+/spfmYgRtpLsE7aJ39FviW64I09nHbmeTukNuOAEb0ganlklZ2w2kT4D8K+Vg
	5hfqQ7edJQdi1ZXyTp7aXOiGsMqYfhLYtHoMMxkJRT7ZCnuOgcDWGlgu1tZl9LWPFud0jfjNn/T
	qX/eo5/7O6YB33mUQyeQ5467qxOWkp2OSz
X-Received: by 2002:a05:600c:6a0b:b0:493:d2b1:48c8 with SMTP id 5b1f17b1804b1-4953c28b6e7mr23273595e9.33.1784119186462;
        Wed, 15 Jul 2026 05:39:46 -0700 (PDT)
Received: from e133063.arm.com ([212.187.182.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4953c710facsm32360695e9.2.2026.07.15.05.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:39:46 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v3 0/5] tools/build: Allow versioning of all LLVM tools
Date: Wed, 15 Jul 2026 13:39:16 +0100
Message-Id: <20260715-james-perf-llvm-version-v3-0-8854bfe5af7e@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHR/V2oC/3XNQQ6CMBCF4auQrq3plILoynsYF2VaoAYomZpGQ
 7i7hcREFyz/Sd43MwuWnA3sks2MbHTB+TFFfsgYdnpsLXcmNZNClqIA4A892MAnSw3v+zjwaGn
 dcJXrGrAuajwZltYT2ca9Nvl2T9258PT03h5FWK9fU+2aEbjgJWoEfdYKK3Pt3ajJHz21bEWj/
 IWqfUgmqAGJqBqRg6n+oGVZPneZK28IAQAA
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
James Clark (5):
      tools/build: Allow versioning of all LLVM tools defined in Makefile.include
      tools/build: Indent if else blocks
      tools/build: Allow versioning LLVM readelf
      tools/build: selftests: Allow versioning LLVM lld
      tools/build: selftests: Remove some duplicate toolchain definitions

 tools/bpf/resolve_btfids/Makefile    |  3 --
 tools/lib/api/Makefile               |  4 --
 tools/lib/bpf/Makefile               |  8 ++--
 tools/lib/subcmd/Makefile            |  4 --
 tools/lib/symbol/Makefile            |  4 --
 tools/perf/Makefile.perf             |  7 ----
 tools/scripts/Makefile.include       | 79 ++++++++++++++++++++----------------
 tools/testing/selftests/bpf/Makefile | 13 +++---
 8 files changed, 56 insertions(+), 66 deletions(-)
---
base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
change-id: 20260511-james-perf-llvm-version-43ab1cb5bc7d

Best regards,
-- 
James Clark <james.clark@linaro.org>

