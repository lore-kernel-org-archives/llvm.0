Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C1A62E9756
	for <llvm@lists.linux.dev>; Thu, 25 Sep 2025 10:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758795999; cv=none; b=iuJaGOveoQc1kwgZ/sGGlxdUCqHzvLtp0Id0dtoXMJm6rpShudg7FcpY3THAhI5Xh0yhOH9y7CVtQkea0JdoZyKFRmAD9iyqnK4wjS0PzqioymErjGm81Mk7x0ZMiTP0heqQoxZFmUGORfVNDdhzTz83YgS/7fDrvxwWOeUa+NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758795999; c=relaxed/simple;
	bh=XU+JsDm+NACkjK6KgkBIoEW0aBxNnr3czBMcHn+kAFw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=osx6aEwxNCSO4nFdayykN2d6es31xJVyEaqf4/V6x+059sO1rkShErxfeMTFGUQCgJEdQRqeu2omlJ6p55AyRJUlihBOPk7C7o7kjjrzyjMnJJ1kD7CKGC+53vd0B6W1vu01Gq4kA9iZAqvLlwQz2pAMxzzF0Duob7P1ljwogj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38F8F1692;
	Thu, 25 Sep 2025 03:26:27 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C61A93F694;
	Thu, 25 Sep 2025 03:26:31 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH 0/8] perf build: Support building with Clang
Date: Thu, 25 Sep 2025 11:26:24 +0100
Message-Id: <20250925-perf_build_android_ndk-v1-0-8b35aadde3dc@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANAY1WgC/x3MQQqEMAxA0atI1lOoSkC9yjCU1kQNDlVSFKF4d
 4vLt/g/Q2IVTjBUGZRPSbLFgvpTwbj4OLMRKobGNmj7Gs3OOrlwyJ+cj6SbkIu0GrQ2YBvYdz1
 CiXflSa53/P3d9wOY32O2aAAAAA==
X-Change-ID: 20250915-perf_build_android_ndk-500b53bea895
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Quentin Monnet <qmo@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
 James Clark <james.clark@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 llvm@lists.linux.dev, bpf@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758795991; l=2161;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=XU+JsDm+NACkjK6KgkBIoEW0aBxNnr3czBMcHn+kAFw=;
 b=VaDG4JssfwIwKfVis2IGMb3HXC/byRBlxX87NQBY9L6PLPT9dhDxgMh51YLs9KIYrXvqTwL3n
 FKBnLR7EDZ2BFkIHJi1P+0LLnQTCwKIVweN//eHuFHJ/ocslDjdWEVh
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=

This series adds support for building perf with Clang, following the
discussion in [1]. Because the Android NDK uses Clang by default,
enabling Clang builds naturally covers Android as well.

The series is organized as follows:

  - Patches 1–2: Fix two bugs found with Clang.
  - Patches 3–6: Address Clang build warnings. Because these warnings
    do not break the build, no Fixes tag is added to avoid backporting.
  - Patches 7–8: Enable Clang in the Makefile and update the
    documentation.

Testing:

  - Clang 15.0.7 on Ubuntu 22.04.5: native and cross-compiling (aarch64)
  - Clang 18.1.3 on Ubuntu 24.04.2: native and cross-compiling (aarch64)
  - Android NDK r27d (latest LTS): cross-compiling (aarch64)

[1] https://lore.kernel.org/linux-perf-users/20240715143342.52236-1-leo.yan@arm.com/

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
Leo Yan (8):
      tools build: Align warning options with perf
      perf python: split Clang options when invoking Popen
      bpftool: Conditionally add -Wformat-signedness flag
      perf test coresight: Dismiss clang warning for memcpy thread
      perf test coresight: Dismiss clang warning for thread loop
      perf test coresight: Dismiss clang warning for unroll loop thread
      perf build: Support build with clang
      perf docs: Document building with Clang

 tools/bpf/bpftool/Makefile                         | 12 +++-
 tools/build/feature/Makefile                       |  4 +-
 tools/perf/Documentation/Build.txt                 | 18 +++++
 tools/perf/Documentation/android.txt               | 82 +++-------------------
 tools/perf/Makefile.config                         | 32 ++++++++-
 .../shell/coresight/memcpy_thread/memcpy_thread.c  |  2 +
 .../shell/coresight/thread_loop/thread_loop.c      |  4 +-
 .../unroll_loop_thread/unroll_loop_thread.c        |  4 +-
 tools/perf/util/setup.py                           |  5 +-
 9 files changed, 81 insertions(+), 82 deletions(-)
---
base-commit: c17dda8013495d8132c976cbf349be9949d0fbd1
change-id: 20250915-perf_build_android_ndk-500b53bea895

Best regards,
-- 
Leo Yan <leo.yan@arm.com>

