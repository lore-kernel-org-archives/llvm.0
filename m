Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2470030FC39
	for <llvm@lists.linux.dev>; Tue, 27 Jan 2026 06:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769494990; cv=none; b=ALDn33pdVB0guGV4qwP7WoIxUMXJalcGWG8U8OwatulKywP1kFsSrIkTm13ZagMdXygzXlkgBLc2012R1TSdY0j/ndhqbxOvu0Yznqyf4JgA//n/h9hKfZ+bq3sixiCoYQ8g2TJ4SYZfeUXYEASUm+QSwfu0QnzlZvxLgR+fVks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769494990; c=relaxed/simple;
	bh=pZc+ElkkSn6HHFLg/xY0L3PDrcKaLQAGBeF4qSM5Cms=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=NSzO/28Ix5+5xAwCxlLFxdkE7a850wJ6hFjS/Q8PXaPzyFW81Z1EPX4L8QxvpvxnY2hAXtNLBir9j00KjWrbZT9W81vXACkUyW+Yaw+2OFXzj076/4QeWWFf9CXuz8NeUVEwsDX5Fm+6jnyFpsbyVZ1/YUGRBf3LEjCbdagt4r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PtZqBxu1; arc=none smtp.client-ip=74.125.82.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PtZqBxu1"
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-1233b91de6bso9077755c88.1
        for <llvm@lists.linux.dev>; Mon, 26 Jan 2026 22:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769494987; x=1770099787; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/3zjRpd/oD852r4hqqcJyjh7YP+w7HQihPlakXRRcQI=;
        b=PtZqBxu1yfKgcLM/RZfD4wIuBDEbB0vlmgubaBfC/leHlP+G4H40QgfTspQNA1GEjX
         PThJZHG7bAHq9M9Bfwr/EE2XQKAbyI6ccKSHAU41zHpSJcqq3HKvjwDudwJIToPNF6Ke
         d52b5X2ymfYrMsgqRmoPTeyri6WTOSUnXdCqYCG596fBBpetrS+pob4H0IVn5qiAzAHG
         4n2Vq+U5ZA39hMmOIYDfdTR58rU0Z+I5U3b2WDks9pRB1OPgu6XYHGGnYF45ghg/zrqk
         M2UZmWNH7r3dePEvp60hJ1pMYsQhkOaQryREsqql+NkH16MOo5CTlA/YIchUrf05GNVF
         GJYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769494987; x=1770099787;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/3zjRpd/oD852r4hqqcJyjh7YP+w7HQihPlakXRRcQI=;
        b=rLCR/INQuKS5usaf6GzpmZ9WVviieDgauyXXLYHOW7M003pz2yOp8hnQKOON2kBKrB
         hEsho3j6Rv1WQizlw5ZDmYhVpkI9Cb2i0bRzXORjJ14oXMXRhXlRDMAQteZIufikfCrM
         9TS8onmZ6UiX8vIgEE9UK0nctK+P297QNT6H47NgJFpSzgxH43KqkJ8ZLoW4p/P7VIRO
         QawDUlTsJDWZnsYxie92Am8hH2SrPeu5NogMP83Rif4EkD36AxwvT0n4/5Z6+FUlLnQH
         lev/r0CWpjPOIHQnfHloGh91N7rsH66b2ReBOV3O58wIEnhDM3oZ5sDf/Rt6oAOvgCKM
         SMew==
X-Forwarded-Encrypted: i=1; AJvYcCWKZB4GBa8Fznca/cwKJRJiUGYGCXwCcA0WGxTHrtCKEgMXVh4igL1ANOLRob2bZ034fp0B@lists.linux.dev
X-Gm-Message-State: AOJu0YzGrw7j8GiivMbdOrJfNxrpFVQnvb7uX0dEKjEPpn4thUsacKM1
	/X82X0UIjVFPTPZIytRkV/n7ZknwPNPmMkG7/4U9mI+CCa2H8ipMYEX4zLdnc/cGmOXDWa0wQHy
	xcU+wtl2seA==
X-Received: from dlbrp2.prod.google.com ([2002:a05:7022:1602:b0:121:ac3c:21fe])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:914:b0:11b:b3a1:714a
 with SMTP id a92af1059eb24-124a006ef49mr416144c88.12.1769494987120; Mon, 26
 Jan 2026 22:23:07 -0800 (PST)
Date: Mon, 26 Jan 2026 22:22:59 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260127062302.544809-1-irogers@google.com>
Subject: [PATCH v9 0/3] Capstone/llvm dlopen support
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, James Clark <james.clark@linaro.org>, 
	Collin Funk <collin.funk1@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Cc: Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Linking against libcapstone and libLLVM can be a significant increase
in dependencies and file size if building statically. The dependencies
are also quite cumbersome if bringing perf into a distribution. For
something like `perf record` the disassembler and addr2line
functionality of libcapstone and libLLVM won't be used. These patches
support dynamically loading these libraries using dlopen and then
calling the appropriate functions found using dlsym. Using dlopen
allows libcapstone and libLLVM to be installed separately to perf and
when that's done the performance will improve as separate commands for
objdump and addr2line won't be invoked.

The patch series adds perf_ variants of the capstone/llvm functions
that will either directly call the function or (NO_CAPSTONE=1 and
NO_LIBLLVM=1 cases) use dlopen/dlsym to discover and then call the
function. To support the function signatures when
HAVE_LIBCAPSTONE_SUPPORT and HAVE_LIBLLVM_SUPPORT aren't defined
prototypes generated using pahole are given. This avoids requiring
libcapstone or libLLVM for the sake of the header files. It also
avoids having a build where neither dlopen or dynamic linking against
libcapstone or libLLVM is supported. There are other possibilities in
how to organize this, but the chosen approach was done so for the
simplicity and cleanliness of the code.

The addr2line LLVM functionality is written in C++. To avoid linking
against libLLVM for this, a new LIBLLVM_DYNAMIC option is added where
the C++ code with the libLLVM dependency will be built into a
libperf-llvm.so and that dlsym-ed and called against. Ideally LLVM
would extend their C API to avoid this.

v9: Rebase.
v8: Rebase down to 3 patches. Update commit and cover messages.
v7: Refactor now the first 5 patches, that largely moved code around,
    have landed. Move the dlopen code to the end of the series so that
    the first 8 patches can be picked improving capstone/LLVM support
    without adding the dlopen code. Rename the cover letter and
    disassembler cleanup patches.
v6: Refactor the libbfd along with capstone and LLVM, previous patch
    series had tried to avoid this by just removing the deprecated
    BUILD_NONDISTRO code. Remove the libtracefs removal into its own
    patch.
v5: Rebase and comment typo fix.
v4: Rebase and addition of a patch removing an unused struct variable.
v3: Add srcline addr2line fallback trying LLVM first then forking a
    process. This came up in conversation with Steinar Gunderson
    <sesse@google.com>.
    Tweak the cover letter message to try to address Andi Kleen's
    <ak@linux.intel.com> feedback that the series doesn't really
    achieve anything.
v2: Add mangling of the function names in libperf-llvm.so to avoid
    potential infinite recursion. Add BPF JIT disassembly support to
    LLVM and capstone. Add/rebase the BUILD_NONDISTRO cleanup onto the
    series from:
    https://lore.kernel.org/lkml/20250111202851.1075338-1-irogers@google.com/
    Some other minor additional clean up.

Ian Rogers (3):
  perf capstone: Support for dlopen-ing libcapstone.so
  perf llvm: Support for dlopen-ing libLLVM.so
  perf llvm: Mangle libperf-llvm.so function names

 tools/perf/Makefile.config         |  13 ++
 tools/perf/Makefile.perf           |  24 ++-
 tools/perf/tests/make              |   2 +
 tools/perf/util/Build              |   2 +-
 tools/perf/util/capstone.c         | 285 +++++++++++++++++++++++++----
 tools/perf/util/llvm-c-helpers.cpp | 120 +++++++++++-
 tools/perf/util/llvm-c-helpers.h   |  24 ++-
 tools/perf/util/llvm.c             | 273 ++++++++++++++++++++++++---
 8 files changed, 660 insertions(+), 83 deletions(-)

-- 
2.52.0.457.g6b5491de43-goog

