Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B939222585
	for <llvm@lists.linux.dev>; Sat,  4 Apr 2026 12:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775304987; cv=none; b=fsQrMQDpbTnFnTO/9Wt82FpnoNTYTEXUF41MnLMhyQSQNDnzJzuzglv5uWGX63a48gQTpsIfJgVphXjqlRE9KVLhXSMz/wipf3nzX6FMjFWR2OL7Nm94HeJC7rGYP5uc1dfA9e8PuTLrqgB0kAkCUvplyB1TE/5zO3MtR/I7teM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775304987; c=relaxed/simple;
	bh=aJuyYRVvwg861oEAylNct0yDDRLu9fTiQbVaoZ7VtZg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GaqeTwHWNQgD2iLU59D4hzkvhGM3Gh+l67sNKL6YBaWyaLJmrsenOoZUj5s9LQDta3xU9mogOrjqgbLAzfgAUWOQ4WHsTXBzcliaUE1NbAE7pmAdyYbOrDMYtA/Uyp+t9WHyD5W2A1p50+8TUh3QEdJtkOdtaKBwk1/N5rEs6GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sUWCLZPT; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sUWCLZPT"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35da9692ec3so2399128a91.1
        for <llvm@lists.linux.dev>; Sat, 04 Apr 2026 05:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775304985; x=1775909785; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I/7o9EiCJhOtnTzDs3PNadMZp0XXQfFToSEBVOVAQ6A=;
        b=sUWCLZPTBngaqeEPeUxiO2szOrqtOo9Gsa3ereft65YV9dFhRGh1iDkWKG8HdGAv3v
         c7mTjNTJ7SrtirWHeX+XngZWjf8fcaKvLDJtzSVLaxKnM9fFSUy/BGt+WSXq9hH893X+
         a7eUt4lMFTeBoHpQ60/KAvCm10ZBWxCdiNcs8gMy7+SjeEtmxW5sqX5FCdaOOBr1TyrA
         g8EfYo27MAOCWX2cMknbdM5hZLEcYrmKBFAm4gwll3cFxYdqhr7UJ7tDlYvzMQxHvR18
         Zs/Re5b8Gh1jh84qt6BjeiMVmPiZH/6UwSadE74FXvCCM0e5dyOntGO83/5x8B/KI0/K
         uGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775304985; x=1775909785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/7o9EiCJhOtnTzDs3PNadMZp0XXQfFToSEBVOVAQ6A=;
        b=BbJwHciPOKn6hC3ahJY2StkR82q95rp+Q7/TE9Ie6WTi9yCpLL1Gz38ZiXA2DpcoQ6
         HyWulU/vCGTdIVHIUsMGSh+YOqseDee8JIjhLz50gR09RzjJiQOrLP3SNI/w7vhBPpSV
         DRlqG9SzxGopQ4qYk+4WVZsiaG5NmP3MBvO/Ku2kz6qtWgZL60oQWsYTTkKal3fWrbgW
         qUqfKzvb+cNC6Qw67VPEGW0m1d084sdLwtUzCIY0RxBC3UfRniuzkjJdqzQ2ZzefBHUN
         D7tEWiyhMTPLbf6dsZxDe9L1FPrqN866dJLGS5A2K8BRitRSSOhVpbZ5NDk2VVt+sc+v
         tsAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXunp2jBlWG4HOBgBWyouytcAvj387zE0+rIJgcMfGlsC8v0mzgpQPQKzYgb6s1prkG+J0s@lists.linux.dev
X-Gm-Message-State: AOJu0YzE/+q7TznVSUmkB59UfVuQ1gM8urrZviOkYmhlIMW5ulKG8xdD
	mmtUx3R5wN3HCDt7rpqm3f/apr8g6f/djl4J8BPZ1RpHy5Ljff1sBypY
X-Gm-Gg: AeBDietA0rmVBqjK3yfQuFdXreFh6HO6mgacnUCSaY2/Mu/IfZ+B+3bMF3tk/MeI0Zi
	AJwTUotKz//giCHh6PMkVEFmHP6y2z6Z3kxxW1frBQgIoRNXi6cYvrSNgO9MR2esLn8lNGPdFgD
	ICWplVL6twcInqxNWPMNG7T15atbmPde/PYLrXkWRedUwlFyBBjANV2Gg/clecFE+4qxCgqzkUV
	qlbEXM5eoKh1s2yczPIfdq0p2D00sRItve7pkrX+99+8t1zM77sy/eoxcAefSFfABd5IivueNWV
	LmA8zQhzZYgNkeZnxLLEoDZ29FaUIrXdXGnbkZbnmpfxjTP5UoWnK2XnfAbFZZ6uylE9Jvrgd63
	mR96nExXptBig0k/jlmOP0IMO0g9s50oKSCSV+V6Un0WH2h/u0wZMaR9nko/0/kYiyE1nVKc7wa
	PJzPDHyZWqvo0KBuPhOtgSIOja6nPYNA/YYZb0pVm9c8+0hlGOVDloBIP1amc7fDzQGVHNpF7AL
	kA=
X-Received: by 2002:a17:90b:3d8a:b0:35b:e4f8:7b2b with SMTP id 98e67ed59e1d1-35de68ebaf3mr6615006a91.18.1775304985367;
        Sat, 04 Apr 2026 05:16:25 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de500c42fsm2702745a91.0.2026.04.04.05.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 05:16:25 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	aliceryhl@google.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: [PATCH V9 0/4] Rust support for powerpc
Date: Sat,  4 Apr 2026 17:46:06 +0530
Message-ID: <20260404121610.1956528-1-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Enable experimental rust support for ppc64le and ppc32be. The patch for
ppc32 has been provided by Link Mauve[1] and ppc64le support[2] has been
merged over it. ppc32 needs some toolchain fixes mentioned in the patch
`rust: Add PowerPC support` and the discussion for that is done here[1].

This has been tested on
- powernv9 hardware
- pseries P11 hardware
- pseries(9, 10) qemu
- powernv(9, 10) qemu
- rustdoc on x86 and powerpc64le
- rusttest on x86 and powerpc64le

We are actively working with our LLVM team to get the target for ppc,
ppc64 and ppc64le in the rust compiler.


[1] https://lore.kernel.org/all/20260204030507.8203-1-linkmauve@linkmauve.fr
[2] https://lore.kernel.org/all/20260204042417.83903-1-mkchauras@gmail.com

Changelog:
V8 -> V9:
- rust/Makefile updated with a directory instead of abspath
V8: https://lore.kernel.org/all/20260403145308.1042622-1-mkchauras@gmail.com/

V7 -> V8:
- rust/Makefile updated to separate host libraries from target
V7: https://lore.kernel.org/all/20260329160254.2592207-1-mkchauras@gmail.com/

Changelog:
V6 -> V7:
- Documentation removed as powerpc is still under development
- Added a fix for race condition in rust/Makefile
V6: https://lore.kernel.org/all/20260210090023.2587534-1-mkchauras@gmail.com

V5 -> V6:
- Added a missing Tested by from Venkat which got missed since V3
- Support is marked as Maintained instead of experimental
V5: https://lore.kernel.org/all/20260210053756.2088302-1-mkchauras@gmail.com

V4 -> V5:
- Removed a nested ifdef from PPC64 for Little endian toolchain
V4: https://lore.kernel.org/all/20260209105456.1551677-1-mkchauras@gmail.com

V3 -> V4:
- Co-developed-by header added in patch 1
V3: https://lore.kernel.org/all/20260205180429.3280657-1-mkchauras@gmail.com

V2 -> V3:
- Splited HAVE_RUST in 2 lines
- BINDGEN_TARGET_powerpc initialized before assigning the same to
  BINDGEN_TARGET
V2: https://lore.kernel.org/all/20260204210125.613350-1-mkchauras@gmail.com

V1 -> V2:
- jump label fix for rust has been moved to a separate patch
- PPC32 support has been taken
- rust support has been marked experimental
- target.json dependency has been removed
- HAVE_RUST now depends on CPU_LITTLE_ENDIAN for PPC64

Link Mauve (1):
  rust: Add PowerPC support

Mukesh Kumar Chaurasiya (IBM) (3):
  rust: Fix "multiple candidates for rmeta dependency core" error
  powerpc/jump_label: adjust inline asm to be consistent
  powerpc: Enable Rust for ppc64le

 arch/powerpc/Kconfig                  |  2 +
 arch/powerpc/Makefile                 |  7 +++
 arch/powerpc/include/asm/jump_label.h | 23 ++++++----
 rust/Makefile                         | 66 +++++++++++++++++----------
 4 files changed, 65 insertions(+), 33 deletions(-)

-- 
2.53.0

