Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B7C3B47CA
	for <llvm@lists.linux.dev>; Thu,  3 Sep 2026 20:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788467855; cv=none; b=FV2r5hmaTbY1ATlI19i1FcD9Vpe7asYB3Yy58zoadmGZrVcUU1llIseAx8s8nYyUNrufzDuSThyfDm3l5G3o+D20R+tbnFVfFnZieyVT32/aSg+zG7UsKJT+BbWAo4D2KRMRZb3JUqjsi3ip6A7xYNd/egIgaZ00hehKIu4VYvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788467855; c=relaxed/simple;
	bh=Lp/rpmKZfaRLkZH7ZQedQZ1rtoivwaoM23iRcSg0bAo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pNsnlqjd/ypfvIDUoMsspiaro8CYWvCAw+p96ua9YhfKiRLLb4CU1twADtI8wDVPYsFUgK2A9o/dQ+YHhiPLIYr71a/9LE9T+6FY2+zVrNp0piSjnYzK8q8tn7Sgsn8A4IQ+DMXEEwdo43ddwB0WklOE/0L/DYzjkeLWKrZ0kFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJ4U6dzb; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJ4U6dzb"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f96c5b722so231184f8f.0
        for <llvm@lists.linux.dev>; Thu, 03 Sep 2026 13:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788467849; x=1789072649; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OvK9knuWq5uxHuXSn84mygHm6H7cFKDZ8xVelzi2Vf8=;
        b=GJ4U6dzbXSEomzXqz7jUqt25nwJ+j3LZtbYt6vkvRkM/KfGyfHSHxhDU7N6aOL3WP7
         B7DVUjXa8A7VCbLOW4QCTSBTKgob/kkwdherwddNDkz1LVr/9nDVCPFxHT8wLwxM+kwn
         TLvCHyJfvmTQAVpT6dB8oQZt0f43ElQbioTuq9BQC3TRu3jX248mS8fRg7YyF1JinY3S
         87i8S5tAHQ2XA72oXIrFAAmv3qvewDWHnbgekqc/Mr0L51rnSQ08Wj2DLT+z7cDs8g3V
         HI6ElNBhFZR+CoX7rAw/Hhs+Y5xSM2JAASRlk0fOpqNg18ZDZ1Gsut7Cmzv39na6Sk6r
         N+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788467849; x=1789072649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OvK9knuWq5uxHuXSn84mygHm6H7cFKDZ8xVelzi2Vf8=;
        b=OvKAnimI37j8sLgkyw/SLwHto/1MtdtqUzF9wvrWrwXGwbp1PAHSqbQjSkfO7/dq1L
         F5M6B/a5UzLyJ+KIwRTLIN4NrZugUUuyZiz+NrrptqhX9MwrJQIJrK4anjXLZSAirllr
         MA0nh3xapA4MSFGnVQE9wIpy1aU06WuOQJgihcdkmedRDrK1tu45gRAY1cXYVQ2TffiM
         gCRScFzyG3fNnjLHGCBLBCZlCybN9mreL/1A0656HLQwoF0sB1Z9zUe2ZbslWu63Ol/y
         7b918nlaeUp9k+wU3onGT+TLrcuvjBfgdNrtSiMSf/GKaa9/FwEiWuBCGdNXR1W34SAf
         sBRA==
X-Forwarded-Encrypted: i=1; AKwUvBy/osSik7vEXQvGs1fwEGAiKKvOnMiB4zQJx7OmlmnkZwOnTK5k7cUPtAyRiIYn9lWZ4sgi@lists.linux.dev
X-Gm-Message-State: AFuF++kadY34QQNUIPGkOUyMlmls9eV8fESL6FPrYLCy5DJmRJC9DSIl
	IFA4HtuUYNazt7seene9OZdS1svolf0MJfA8h0xCFl3Tqu853EDUvl4B
X-Gm-Gg: AYBFou0hJDmhDO53ZKWw3KVcpuiqHjKm/siwILWdb8fdEnPX9+3DXIMjoGmMuMADpaT
	Kk94JwqwGuLPrCK8O6ysQLWMed44IhlvZpjB9URXYzvC9cIC2nMuJ/31XOjZRKTvy3clddVGRYM
	8zHMv6zWpCfUL2n3BMfG6SK0bKgc984cIjdgASQ/7BtjtF9s+psE7qD/vm0KtntVQ1AiTf5lRKf
	YPwq6hYSfNS6FNewkep7omKrpeT1XbltKVnOVwlD0jn9XcpcBDXdpR6OMtyw024MxYk3qYgTyn6
	z/FqALPLSJiYJrB8AOafAjXKWjpSF37tZccRTuGGmZwOR8wy56u43Bi2j0ArS96yP7no8KpF2GR
	4qm3Qx5wgTF+Jae8z/FcSTSTWw2qhEaC1M7i1bdQ8maUsVHTTtUCzlkkRfcQBYpLhpahxRsyQ0J
	BIi8q5ROuryC3zxiDdMgKfXxkHOnopGDluEfCGRKZx20XvEbErBXDF8AosuepWoPBymqJFpQk9S
	3OrfIYmT0s4cKGHaPa3qIVVPtX0htmI8YxWahpsSh/WH7iKVFkY8rZV00EcH22n278tomJu59b9
	SeQrpluU5o9TKi7Aakf2+q5BbwQNcDe06t2nzEiDan90l9JetMjnKWCBfG2GShZi/Qp5V/LhO07
	282gL
X-Received: by 2002:a05:6000:26d3:b0:481:5b58:c589 with SMTP id ffacd0b85a97d-485870935eamr2874884f8f.10.1788467848463;
        Thu, 03 Sep 2026 13:37:28 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a979-9501-3df6-d7fa-8a5a-06c5.310.pool.telefonica.de. [2a02:3100:a979:9501:3df6:d7fa:8a5a:6c5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm1005070f8f.8.2026.09.03.13.37.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Sep 2026 13:37:27 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-hardening@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v3 0/5] slab: ZERO_SIZE_PTR alignment and ERR_PTR hardening
Date: Thu,  3 Sep 2026 22:37:15 +0200
Message-Id: <20260903203720.63689-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kmalloc entry points promise ARCH_KMALLOC_MINALIGN alignment but
return (void *)16 for zero-size requests. Patch 1 aligns the sentinel
to that promise.

Patch 2 limits ZERO_OR_NULL_PTR() to NULL and ZERO_SIZE_PTR. Patch 3
handles ERR_PTR explicitly in kfree() and hardened usercopy, without
giving ERR_PTR special meaning to other users such as krealloc(). The
old helper did not match ERR_PTR values either; patch 3 addresses the
adjacent hardening concern raised during review.

If backported, patches 1 and 2 should be taken together.

Patch 4 adds zero-size KUnit coverage; patch 5 adds ERR_PTR KUnit,
LKDTM, and kselftest coverage, which is why Arnd, Greg, Shuah, and
linux-kselftest@vger.kernel.org are newly copied on v3.

Tested on 940de590b839:

  - GCC 15.2 UML slub_test: 10 passed, 2 skipped, including
    test_zero_size_alloc and test_kfree_err_ptr; NULL and ZERO_SIZE_PTR
    produced no warning, and the expected kfree(ERR_PTR) warning was
    suppressed and counted
  - GCC 15.2 matched x86_64 builds immediately before and after patch 3:
    kfree grew by 15 bytes; __check_object_size gained a 13-byte
    comparison on its normal path and a 23-byte cold abort path
  - GCC 15.2 x86_64 defconfig with HARDENED_USERCOPY: build and normal
    QEMU boot passed; the committed LKDTM selftest matched the distinct
    ERR_PTR diagnostic after reaching usercopy_abort()
  - Clang 21.1.8 armv5 UBSAN_ALIGNMENT: no alignment-assumption or
    slab.h report; generated code retains the exact comparison and
    single evaluation
  - GCC 15.2 MIPS64 big-endian noncoherent build passed with
    ARCH_KMALLOC_MINALIGN equal to 128
  - Microchip SAM9X75 hardware (armv5, ARCH_KMALLOC_MINALIGN=32):
    ZERO_SIZE_PTR was 0x20; zero-size allocation, ksize(), and free
    passed with no boot splats
  - Raspberry Pi 400 hardware (arm64, Cortex-A72,
    ARCH_KMALLOC_MINALIGN=8): ZERO_SIZE_PTR remained 0x10; the ERR_PTR
    KUnit and hardened-usercopy rejection paths passed with no boot
    splats; the revised diagnostic was retested under x86_64 QEMU

---
v2 -> v3:

  - document why patch 2's sentinel-derived low-address window in hardened
    usercopy was incidental
  - add new patch 3 to warn and return when kfree() receives an ERR_PTR
    and reject ERR_PTR values in hardened usercopy
  - replace patch 4's pointer-cast static assertion with a run-time KUnit
    expectation
  - add new patch 5 with KUnit and LKDTM coverage for patch 3

v2: https://lore.kernel.org/r/20260811141240.62519-1-kmehltretter@gmail.com
v1: https://lore.kernel.org/r/20260808105622.62026-1-kmehltretter@gmail.com
RFC: https://lore.kernel.org/r/20260712120728.96628-1-kmehltretter@gmail.com

Karl Mehltretter (5):
  slab: align ZERO_SIZE_PTR to ARCH_KMALLOC_MINALIGN
  slab: check for ZERO_SIZE_PTR by exact match
  slab: handle ERR_PTR values in kfree and hardened usercopy
  slab: test zero-size allocations in slub_kunit
  slab: test ERR_PTR handling in kfree and hardened usercopy

 drivers/misc/lkdtm/usercopy.c           | 27 +++++++++++
 include/linux/slab.h                    | 20 ++++++--
 lib/tests/slub_kunit.c                  | 61 +++++++++++++++++++++++++
 mm/slub.c                               |  3 ++
 mm/usercopy.c                           |  3 ++
 tools/testing/selftests/lkdtm/tests.txt |  1 +
 6 files changed, 112 insertions(+), 3 deletions(-)


base-commit: 940de590b839f71d6dc846160534bf202401b8b7
-- 
2.53.0
