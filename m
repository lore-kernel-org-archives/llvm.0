Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D5F231A23
	for <llvm@lists.linux.dev>; Sun, 27 Sep 2026 13:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790515206; cv=none; b=go7peL2rIXxEINX6avuxW7QEW4vrbuX6bY584uPd8VMVIH48p/d/GlzL76qmLADhIsB0+1l8YfbsFgin8NfDRXIO+YAnwoQBTXFqFlMQl5iFEzxvxIanEuxrt8Klwg3OR4Cvfj3GRUSY2bPWmedYCG0B90JLXQxIr6L3drmGfF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790515206; c=relaxed/simple;
	bh=dyYw3Tm3hTj8DLauIeAGN0ZLDTdgf7122SZJk55EqAw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fi6q0NyMNcIRvNq35MnoT1dh/5B5PVwpQAedTSA08DNhmwJ9E1DBTb6yaX1cvwftcg4Kd/s/GuiPpAnvZAyLwDl67f1Z7K+TS2JrxYRMFHBFYRUbF8TOKHl2e7B3F8G1dWqU0af8aQ80j1D6Fi53yZY7XkjqdPuZKjiCUPwWS04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TU6ETd4+; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TU6ETd4+"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so16198515e9.2
        for <llvm@lists.linux.dev>; Sun, 27 Sep 2026 06:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790515202; x=1791120002; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aGzUbv8x/qChEM/5fcor4kLUFepBVWkPmo87o0g+kKg=;
        b=TU6ETd4+DHunC791wlAyhKvX03yUrqYjj/dLCWK1GFdbSc42u2VczYMYbGKkuM016A
         j0OfoMXskBBoo2lo80Pmd+qZJxBDzNRbBdHxKIo8PSwLnCjFVP1yl1sh2vzJ4S1z7s7G
         TxTMChuSByXWpLRbsx2cJoyYtg56/uXkyfAaHEf6LBwXVQuqpGEu7xutcdQe1wMhqZvM
         rNmgCVQp7hRpdOul9RX5WcbV2ZY4UcbROXy+4MDoAY2n5LIJF3OYCj2bHQjMdV3WML3f
         kaTK4x83WM0sVMz9lbOJlJAGWZ+wp5WOvFTAaHEtjDTCVwQBPBBPLIc0XiGkHhA+ZJ6h
         wwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790515202; x=1791120002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aGzUbv8x/qChEM/5fcor4kLUFepBVWkPmo87o0g+kKg=;
        b=wWR6vZVuy6CdzoPVyCO7K8jTpWwY2nx2piso+NU7Ejo6hXE185lZDXu5e9+nB9ZgG9
         o3OldBFq4CEoHUI6/gO8ASKF+YyvIFQgIzPjmX7SFQu7mqeE5H7bu5qY74hC73U24R7k
         aIbVDWXgSuZdHThnA7ogc8+ArXuCXW90ObsT86REON4KR+C4WT0FSqt8R41PUlh2wOOi
         +ewzhkFqaIsIARcdyXtehgoKZrDmLkACO9w67GjN9wv8C79jGJjmYVajvzwlC1hfS1Wz
         sxIex4p3kUYznF8494cTCnSbAoIT8Or/zB/9uSvj0NokGRdKJ2rFTYYmvPzBFFwjTh4b
         81ZA==
X-Forwarded-Encrypted: i=1; AKwUvByJMsFjOqUVpZpRBzkNWBNGfTbzfIWRqnfd388uQmwPZOTdaNYbZqux+iXwc7LFnrbaSvx+@lists.linux.dev
X-Gm-Message-State: AFuF++m+5eFxS/yZX+dYuwtM5OEevd8CG7+6EegGCFYjjlp2H21KCWgR
	Mrg8rgNZ5RdetHEDWADUre4rDsdmhu5ol1OKbBvwmmm6du4crU7KeNNN
X-Gm-Gg: AYBFou0+4O6wQM+OQt/14FTwAgdiI1TP8rtHFIs6MfVOoba396dT/2k66WVO5yCNraU
	FjlZ9ua/HfzQAFreOvWgsLMU9dgFYGL2e/yr/h60UM6zuzTwzcg1IBKrP+dmR3LDK2kIOk+Um/v
	nG/HCKw0B3axCB2LlRLflPCC9g399pNGNgVNv8xn0+rs6392sOHGe7J6XtpiRfgD3bzogpjVbYZ
	Xu7KqIBfI5Rs8IXGAIgJ6CkSgycQ3SzWdMrPXuSmPn4iIeYjNZmyHVP1BT6G2RQJze4RHk7XHFP
	z3Ej7/fUJX0B9fneUXEnPr3J3shVbvD4tuMHRUWQZMTgmi+AZQHVfNeLvGeZ5Pt0wVmgi7UO+G/
	P1doq0WThe9DQ/G+Xac6QBBM3Yzk4tuPm8dDoPhL0cHC2ELbTzeKFc2UmmN0DTw8Bym9wMkLnuz
	xsvoP2JJ4EK61LlK3zjOrPqxxOcAYVl05TvztJZ1cFk3UDjuFm1DhwxzgzPTCCACoK8XF3Fd0NW
	vcVd2Wyj806RXcnLcUCnWjyEFxgJotnSq/nQks=
X-Received: by 2002:a05:600c:4e53:b0:49f:d58f:1f8b with SMTP id 5b1f17b1804b1-49fe66d807bmr178581125e9.18.1790515202245;
        Sun, 27 Sep 2026 06:20:02 -0700 (PDT)
Received: from lima-dev.. (89-67-112-196.dynamic.play.pl. [89.67.112.196])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0019057cfsm73615905e9.11.2026.09.27.06.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 06:20:01 -0700 (PDT)
From: Demian Shulhan <demyansh@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Demian Shulhan <demyansh@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marco Elver <elver@google.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	David Gow <davidgow@google.com>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kunit-dev@googlegroups.com,
	netdev@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 0/2] arm64: csum: Add fused copy and Internet checksum
Date: Sun, 27 Sep 2026 15:17:56 +0200
Message-ID: <20260927131838.6774-1-demyansh@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

arm64 currently uses the generic csum_partial_copy_nocheck(), which
performs memcpy() followed by a second pass for csum_partial(). This
double pass exerts unnecessary pressure on the L1 cache.

Replace it with a single-pass implementation. The new implementation
provides a general-purpose register path for short buffers and atomic
contexts, and a kernel-mode NEON path for lengths >= 1024 bytes.

Measured in-kernel on an Ampere Altra (Neoverse-N1):
- Scalar path: 1.2x-1.6x faster for lengths < 1024 bytes.
- NEON path: 1.2x faster at 1024 bytes, scaling up to 1.6x-1.8x at
  4096 bytes.
On Apple M-series cores, gains are 1.3-1.7x below 1024 bytes and
1.6-2.4x above. No length or alignment regresses on either
microarchitecture.

Patch 1 implements the fused routines and the dispatcher.
Patch 2 adds KUnit test coverage for the new API and internal paths.

Tested: in-kernel benchmark module on Neoverse-N1 with both
implementations cross-checked (0 mismatches); KUnit suite under QEMU
(with/without KASAN, with PREEMPT_RT), exhaustive and random userspace
testing of both routines against a naive reference with PROT_NONE guard
pages, gcc 13 and clang 18 W=1 builds, checkpatch --strict.

Demian Shulhan (2):
  arm64: csum: Add fused copy and Internet checksum
  lib/tests: checksum: Add KUnit tests for csum_partial_copy_nocheck()

 arch/arm64/include/asm/checksum.h |   3 +
 arch/arm64/lib/Makefile           |   7 +-
 arch/arm64/lib/csum-copy-neon.c   | 168 +++++++++++
 arch/arm64/lib/csum-copy.c        | 108 +++++++
 arch/arm64/lib/csum-copy.h        |  84 ++++++
 arch/arm64/lib/csum.c             |  54 ++++
 lib/Kconfig.debug                 |  10 +
 lib/tests/checksum_kunit.c        | 463 ++++++++++++++++++++++++++++++
 8 files changed, 896 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/lib/csum-copy-neon.c
 create mode 100644 arch/arm64/lib/csum-copy.c
 create mode 100644 arch/arm64/lib/csum-copy.h


base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.43.0

