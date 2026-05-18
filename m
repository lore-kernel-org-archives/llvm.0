Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820163E51D1
	for <llvm@lists.linux.dev>; Mon, 18 May 2026 09:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779095053; cv=none; b=sOOR99FMQpQASnkNpaExKTKW2F0r7qn5an8dclhsfQQc4/OCTfy6MAKKsAGsuuw670izs/bKqATLEj+J3mP5RwpdwXXZo8Ch2AtQgW99KKntDRG2MgtB/AtPYDirw5EPibBzvukaKosqRSJ/PTDkWpp/qV+tsKaSCAciUnQFUuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779095053; c=relaxed/simple;
	bh=Q8GbrG+ClCg94DgU9vxRlD70lv5DVCRruYHFaOZIxRk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qaART8XCca4O9f7HzJVvPs4JSQ2SjXk4pknMugYvMpy4VLCTaL8a08j4ybuphD0BUSZs2cs+3OIAMhWOOa1XklNEH/XxoWLSMwFxl75iyInKoi4ESx0TDyVukarVL0K1RzLD4MzK0LnctIWbhFP39AXAmKaBobblfauCOkY++fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IqngmG3m; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IqngmG3m"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-44a5174670eso990822f8f.1
        for <llvm@lists.linux.dev>; Mon, 18 May 2026 02:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779095049; x=1779699849; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xQsc42ku8RRwWOrN3cIN44IoeSXVQzXA3f6OA5chCWI=;
        b=IqngmG3mCJqocAnZ5a7YliP+H5TMY/jAcQqBNg7M5gcjfemKhmqaHMprBowmdstneg
         Sb3FaBCu5170YzCo9xMDIwOLYiPGK9JwVYtnDg1m+TDEoD+hS+I+r2aYEgdyBppUSRwc
         Tx/+8Jlb8zoLhUUh5iNEsLcU6D0NOisYSwJ4w7TDFMDPMwUw0PJaH2RL57UXYWFpyoeV
         sPBy3i5/9IhfQlk8a01DoR21EM3VTGSRnx/yNkE7nd72aRyXVI1xgEfVrvF/I0gldfUa
         dBRNqzWFd6nQRDrAlyOSlwH3pkCemUINZVw2RLEv+4Ud6Vg4B/MCSlqap1px91h+OtWQ
         5Cjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779095049; x=1779699849;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQsc42ku8RRwWOrN3cIN44IoeSXVQzXA3f6OA5chCWI=;
        b=FoaYmiyUdTByn1V6pTEyFIxXu+9S7KkiXC17hp8JYb1cR1zaQF3aK2qDuzdiP10aM5
         +CmORNJngRgPeeGMROLKt9LH5LyjowsZgUtqkD3deH8wuevCYFhx3f3MbSLJ6UNPTLHX
         EH2pez9S+LBjYKd40aJ5aw4HCuCc9H0hGmi6v88cH8ZE++MolJ7QPO1UOwsRugHsRp7Q
         SKI4NinMlokhNtz6lD7Bu5IyU5zmk5Q591MjyT2eCxCeMaUZKYho3GhtTV/Y2RTbgSVS
         K6KGXgTj5SOCYCWxJ0myvx+TD5u6yQ0m75QnTU7cd0JwAtGrhOUHqIp/HMr15iscsuZW
         FaKg==
X-Forwarded-Encrypted: i=1; AFNElJ8ZduMNBF9J9qMtnlwIJhC5ET3rn+g3YuYJSypudgEom87HqzGWEtQgwwvBoR046A/PXDw3@lists.linux.dev
X-Gm-Message-State: AOJu0YzVh4br9RBu1RJBRWKD7lKaOXDDjM9+c/AseKq0uCviSuUm14Xm
	l5YOfuc6SRO0Hqy2o3mNjp/PhuAp5OZ6Izz7zmkjj2YFAv8hBZelknpIixBOeEO67B/faKVRBTe
	g8HfP7Q8=
X-Gm-Gg: Acq92OHyY+OVrePm0n/NNTJ7NzoTAZM3RNVc72GLe1c2xQyzKy78yMAw8y1tiip0+z1
	sofKQUgzSaPdoEQUnAdDHk2D/Xf/8LKl+AJAKW9t18QD7g0dWX2hWlxFM2Do48xDWeyEFanK925
	phvrNzoPHX8g1HSDDXy8KPx7GjYVXtweZsV8Kf/qzkWp2AQueGrxC4NWk3gIbsHvyy/HnbqSeyz
	Om3PUhyfay8naK8vbrZZPPW2LI4an1iARn47BQbyjrtha0qn/tJ+th+EspUN9BgpeMPXWEqf6Jt
	4XVW8tyU4X1TTh7+R2g4TOjdTX5KA745RdAZPEww6r7rMUUXRVoVeDglDOzY6X9Rldl2Fclxw0i
	9l+smsTFI/BNmGfaB5JqbE2DtpMCODfFllYeQC1yfMqMP3vVTS+LUhrPyQ8TchCL2gA8900GtrJ
	YJv0C/ryiqijcNTPpniMqYdxvZ2amO5T09
X-Received: by 2002:a05:6000:2902:b0:43e:a81d:c475 with SMTP id ffacd0b85a97d-45e5c58fbf9mr21710267f8f.6.1779095048668;
        Mon, 18 May 2026 02:04:08 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768072sm35084436f8f.5.2026.05.18.02.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 02:04:08 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v2 0/6] tools/build: Allow versioning of all LLVM tools
Date: Mon, 18 May 2026 10:03:06 +0100
Message-Id: <20260518-james-perf-llvm-version-v2-0-f12cc4f031d8@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMvVCmoC/3WNSw6CQBAFr0J6bRsGAT8r72FYNEMDbYAhPWaiI
 dzdgcSly3pJ1VvAswp7uCULKAfx4qYI2SEB29PUMUoTGbI0K9PCGHzSyB5n1haHIYwYWDcH8xP
 VxtZFbc8NRHtWbuW9lx9V5F78y+lnPwpmW3/N/G8zGEyxtGQNXSm3l+Y+yETqjk47qNZ1/QLV3
 2IAvwAAAA==
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
Changes in v2:
- Fix selftests/bpf build. LLD needs to take the full path to be used
  with -fuse-ld=
- Link to v1: https://lore.kernel.org/r/20260514-james-perf-llvm-version-v1-0-6cac1a9a4c8d@linaro.org

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

