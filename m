Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B387339A077
	for <llvm@lists.linux.dev>; Thu, 14 May 2026 09:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778751153; cv=none; b=pi6FpFDf5/PNMLCZNv9ZzKWU80rB9wWgUcsZo57q1h0wAnSc3NVrLCqRl9Lf3P/CRp5r/oQVusda0xqQXZerTkiowDDE2oegMbVGSBUZzI03Q+TMYriQOAs8m3A4SmLjzi8/RpixJ5F5IfOY3vMiLaNc+BZImHTuIKzaTZZrhdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778751153; c=relaxed/simple;
	bh=g4qN1qiOL6eoyFGTvuGJsgsnQ0jH3lElMo1cnFmnA00=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Bs18LKxQ5SIqvrfNagxSJE/YCWSdtKo46oku2niXToGMkGiuH8ovycT9ysErdOZjMm+V4XJczEWrDsy5Rj1erTKxe5SRVpCe7XV77AlRrT5rzD7/PO8dbLybQQTMAHPnnEIlaX1Z26zWN8zAlyvB5LPwfcWzLLy7UBykxmy7liA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oeNPJn+U; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oeNPJn+U"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-44a14580111so5671879f8f.0
        for <llvm@lists.linux.dev>; Thu, 14 May 2026 02:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778751150; x=1779355950; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jIhsStlSAZdSG6VxaddFdlwdDOVd+4VLWmlrEpic5HY=;
        b=oeNPJn+UudbRhw1RzZBWJ9VOktt4qunwgVN3oxZ0bjaGxH8J3CtEZEu5VQF3pTSLL5
         YT8hnmFLifd7H9cTc0RaHstRXPSZXztDxqMABujqEDPH6tah50nT5A5ftKb4uHKgImx0
         sa9dTwfUj9MP2Wy4Vmw73fSVY39cI1OI/bgQCNk6eBpROJOpV9NRnsmr6kPgBJr6AHLE
         sTq3/zWnu2P3CJckXakdcLnMU1KtZ4FZiXB/W6AirNCzRoyQGskYwGvj0a4diWvtrLQh
         /SCZbZ5b/XlZQETRNTHYmKDu3fkcsOaZelk/TKDiWSx6vUcZd3rmHxtOhCdf5JkeLs+o
         EHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778751150; x=1779355950;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jIhsStlSAZdSG6VxaddFdlwdDOVd+4VLWmlrEpic5HY=;
        b=Z5SrpXjptBVgwiCTyGTpZwkiWm1gj1QI2V4Qmf/V9+lUIX83+IGbjyPhh9NkKOdU8j
         gDWMGYMfeSEUVPuoQoJNpWScKMLxejQy+17NsHoOE5G6os7ms8Q1jeDLEVIIl84wMZkV
         AAu48v4it6AuELHRYMiJneDfq9PKLPFFCOJVFY6OsV0BR5iIPviCo+0rEymxkSYWwiDV
         /n/p2LAgvUibfv4rfkQRE3MFhjyLl4287G5GdQltAEGyFr8MvFtMBMN82jSppaZzOcR2
         3xgglO9XGpyM7pjlGlUjuqrK2gH90DDIdO4Nyyj3QgfHmCk7Qgq1W/5yeA2ELcR2I8bF
         0I5A==
X-Forwarded-Encrypted: i=1; AFNElJ+T5vvMWKQKyQm3va+uUiRpZQd25nTFIeBcI2fodBkyTEw82riemiI27aS3fgaP1ZjoWhQp@lists.linux.dev
X-Gm-Message-State: AOJu0Yync0oc4mV/D8MBDMAjb7kdShdWhpJa4M6VptjfxNnP24y4av4i
	IrX/Muvy1/AoyCtDAJYvw01PiSTkOXjdOOnEh78i/iF4SC2eTxP2L99GcHg+HnIJ1iw=
X-Gm-Gg: Acq92OHpaxhqRhUfyJKXp3Jsndw3bP8SaIEbq91STlImNQRNWJCZSP52dHohkixgb6H
	+BlWAehHMEyl5qnOzTaCFa1aSsCTRU3O6CFfVbERKpuuAVrWD2YCrdXNS2SMKdIhE9E8HaRgoIS
	oIEk7BLNa9AAWm2wwpFlvoOiqvYJ3pBN0Gm1PbjpKvAPfBXeg3EMnmQ+w7a6r7TX49rVh1BbiYz
	+FbBCb6z55HnlhwOdxJTVlqXm4RV3lFM1BXKI/LKOIQ38cjym67WnbVcIAfcnTq4jQaKNGOVifz
	jNOBLNXSKCi7oGPQolqytLg7vk7IDT68H679AvANpJjtMYjZ56I4GT9Gh6PKjC/hWHbSXDjKb38
	QochYmFZsEbh0HYsuDUfJf9XArKUiQZk6HOaihAU8JQCumBR2TdI0uO4FYNBu4JJIAmU9Bk7xac
	tK8ZhZP/JiafGjgOdZXV7QJueyxvJcWkmZ
X-Received: by 2002:a05:6000:2401:b0:43f:e721:76b8 with SMTP id ffacd0b85a97d-45c7a7dc644mr10324893f8f.37.1778751150103;
        Thu, 14 May 2026 02:32:30 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe0fecsm5097164f8f.26.2026.05.14.02.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 02:32:29 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH 0/6] tools/build: Allow versioning of all LLVM tools
Date: Thu, 14 May 2026 10:32:07 +0100
Message-Id: <20260514-james-perf-llvm-version-v1-0-6cac1a9a4c8d@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJeWBWoC/x3MSwqAMAwA0atI1gasWgWvIi7ammrEHykUQby71
 eUs3twQSJgCdNkNQpEDH3sKlWfgZrNPhDymhrIom0IrhYvZKOBJ4nFd44aR5DNYV8YqZ7V17Qh
 Jn0Ker//cD8/zAm21c3VpAAAA
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
James Clark (6):
      tools/build: Allow versioning of all LLVM tools defined in Makefile.include
      tools/build: Indent if else blocks
      selftests: Remove unused LLD variable
      tools/build: Allow versioning LLVM readelf
      tools/build: selftests: Allow versioning LLVM lld
      tools/build: selftests: Remove some duplicate toolchain definitions

 tools/bpf/resolve_btfids/Makefile    |  3 --
 tools/lib/api/Makefile               |  4 --
 tools/lib/bpf/Makefile               |  8 ++--
 tools/lib/subcmd/Makefile            |  4 --
 tools/lib/symbol/Makefile            |  4 --
 tools/perf/Makefile.perf             |  7 ----
 tools/scripts/Makefile.include       | 77 ++++++++++++++++++++----------------
 tools/testing/selftests/bpf/Makefile |  9 ++---
 tools/testing/selftests/hid/Makefile |  7 ----
 9 files changed, 50 insertions(+), 73 deletions(-)
---
base-commit: 09d355618f7ccc27ffc7fc668b2e232872962079
change-id: 20260511-james-perf-llvm-version-43ab1cb5bc7d

Best regards,
-- 
James Clark <james.clark@linaro.org>

