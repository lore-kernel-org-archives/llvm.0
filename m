Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EAA2C859
	for <llvm@lists.linux.dev>; Fri, 24 Apr 2026 05:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777009681; cv=none; b=TxfRluNLen2iBCJZICtqoBkyXTfNnssrXmRXt83RnsABzMnUzv9WAi1OEsIjBlWPpW1FQUBH2sIJkQhpA5jN5aRghoSYbU3UTjmrhpei4Eda9YK7dcU/Ct9yZf+91i00fgLX/+s+AptOYibCR0xMc9gg8uPyLeSOfBMnkCq6WJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777009681; c=relaxed/simple;
	bh=Wbj58W73Rvn11UjYWl9yYv7iLUdHME6E7yi35WzUH1g=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GC0Hpd1e7hqcXl9VDFUrYAMMwlEq2zTEsnYlzKRJ5KbDVTTQwzYPYaTodO5o8+x6yASd3ZtKjyrbofqLnzpjvxoHUQjqeOKEKscmHyn6Jub+EcQjQD1ph95KttLRirIxgFerC2L/aLRxY1/dTrE9MK1uwcHzKEGswP/R5ZOLxMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m92cpLDy; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m92cpLDy"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-35da1af3e10so6995430a91.3
        for <llvm@lists.linux.dev>; Thu, 23 Apr 2026 22:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777009679; x=1777614479; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7M2fwY604nxmRG1YIO02Z14fgzwwg1Pa67qHupVFxk=;
        b=m92cpLDytJzxchvz2n6kORvtoW+OkUkH0pTV3hTNOdSOqtpHw6o7F/Wxc9tZW8b4Jj
         517789udqbzQKRDOqBqnDXwBP/1+NhRUGBLMtzfRpZN3hKX6osRW47vTsx18fDvA2r9s
         IfeLd+jGGjEMEyE425e48fowtjdgZMWWYjkIymzVVtcWImxCKxueFRq++c8RCul2Hz9f
         omvYiGZe1GdkaRZLfEhHTBxVTF8paqWMHl8Kdk1ybHbJfDd7rxbd2vSv5NdFFc/XdF9h
         zvENIZrruGfW4mWMwnN9Jfd/FuajWFSB1J46x3jJJVn/JEDKgaFRRCuzbORZ3eoE+4zF
         lyHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777009679; x=1777614479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q7M2fwY604nxmRG1YIO02Z14fgzwwg1Pa67qHupVFxk=;
        b=EaDvnOkBzQXhXccCW0OqG8iicxYrBzefc7ZxFX+Xzc9SMh7aE+hda/6OxXjREfvwaH
         AKCALx487XS8SbTrN8mlzjKbyT6d2vPtMq82tCSmBYmplIi1ukY4yJ6g23oLlDz5Fhnq
         tqvIwh0kh2RNLlA3d0Y0scPlgZQLWRA/JPJhKE0u77WjOkR3UvayVVJ6VWla5X9mRApe
         I+gFSvlC7eJwD++3Y68wlHeDP3666EziWfz6nsGKhqos9/WCoD+0iS4IKBqb2COQkk8q
         xjZmoI5oDNnuWY53FUeBicrg2KeVYakYsypJUvtdsbfATDnjXIL3vOrVq+f9V1m9brzO
         ZuNg==
X-Forwarded-Encrypted: i=1; AFNElJ+OiFvw8El2alKyf1CHXgkLIjjtJaY05+VNHig6MIl0Z3mhGQ2Q6smkfcH3chVsbNU4pRyB@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/AkAFwqSv3sfdxnO3OJnhW8fDZGymqYMi/JAGFdt4AJfAQYT0
	ct3KXQqDKC9ZlPhD+Bv4Jttq5ADXfQcbuFeMRv3fSyXAviFU40lck554
X-Gm-Gg: AeBDiev65uYEhWLPiiu3nMDKqA1ct5c6gVvBKhjQFdij2Ot1OaQ0gBiKjIdfKR8ysAZ
	5gHbAHPCbvE2a9LjLm44FzQRcpChgSc+V767FmY9uk1rQGJshGJVFF8Yko6e+jfW//kcKTc/nKq
	KQhPC60FwNyG84l5Caf5VKw/wUYGE/8byvF5jMl963w+INoFoptXjzBhNN8nrTaQialTwsaGwDR
	b/aZ5h53EYEAJ/Zit97k4pv8lbaFXL8Uvp9TMw9k3BP0n5fbBT6Zow75UyDwNCLEN93o03zLr1i
	0DKAE3CojCvJUM7mU7cfSREk8iow7XG83H0NvAZAWO2rZYcb2ufm7KJhBPh/N7ZoMWYTlU/ZQ5e
	txBMmGGaeAJaZL1Sw1WJoi5Nm8vnAS19NbXGDwXsA5bemO16Q7G9t3xSAPWwElN71W6Uu9UfMBp
	9EvSe2el1Wm84AHEVEB4XotcCd1UrzFLCu+0WkWcFWSfbRmeq2qwyMPCoMIBBD+3i5/kBEtTbS8
	bv1O+0dvA7n3rQ=
X-Received: by 2002:a17:903:28e:b0:2b0:7531:b61e with SMTP id d9443c01a7336-2b5f9f9f125mr305572665ad.41.1777009679150;
        Thu, 23 Apr 2026 22:47:59 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.bl1-in.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa176e9sm208778245ad.20.2026.04.23.22.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 22:47:58 -0700 (PDT)
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
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
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
	tamird@kernel.org,
	arnd@arndb.de,
	nsc@kernel.org,
	mkchauras@gmail.com,
	simona.vetter@ffwll.ch,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V13 0/7] Rust support for powerpc
Date: Fri, 24 Apr 2026 11:17:35 +0530
Message-ID: <20260424054742.45832-1-mkchauras@gmail.com>
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
V12 -> V13:
- Added a patch for fixing build issue on ppc32 by Link Mauve
- Added another patch to fix a build issue in dma-buf
- Added another patch to enforce minimum `rustc` version for powerpc
V12: https://lore.kernel.org/all/20260421120958.190430-1-mkchauras@gmail.com/

V11 -> V12:
- Rebased to mainline (rust/Makefile conflict resolved)
V11: https://lore.kernel.org/all/20260417152253.2312961-1-mkchauras@gmail.com/

V10 -> V11:
- Updated `rust/Makefile`
- Not all libraries are move to `rust/host` directory now. Only
  proc_macro2, quote and syn are moved
- Special handling for pin init is added. Details in commit
- Removed mkdir for `rust/host`, this is now handled by toolchain.
V10: https://lore.kernel.org/all/20260406200149.3727922-1-mkchauras@gmail.com/

V9 -> V10:
- rust/Makefile updated with review comments from Miguel
- Patch 1/4 updated with commit message and subject
V9: https://lore.kernel.org/all/20260404121610.1956528-1-mkchauras@gmail.com/

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

Link Mauve (2):
  rust: Make __udivdi3() and __umoddi3() panic
  rust: Add PowerPC support

Mukesh Kumar Chaurasiya (IBM) (5):
  rust: Fix "multiple candidates for rmeta dependency core" error
  dma-resv: Fix undefined symbol when CONFIG_DMA_SHARED_BUFFER is
    disabled
  powerpc/jump_label: adjust inline asm to be consistent
  rust/powerpc: Set min rustc version for powerpc
  powerpc: Enable Rust for ppc64le

 arch/powerpc/Kconfig                  |  2 ++
 arch/powerpc/Makefile                 |  7 ++++
 arch/powerpc/include/asm/jump_label.h | 23 ++++++------
 include/linux/dma-resv.h              |  2 +-
 rust/Makefile                         | 52 +++++++++++++++++----------
 rust/compiler_builtins.rs             |  6 ++++
 scripts/min-tool-version.sh           |  6 +++-
 7 files changed, 68 insertions(+), 30 deletions(-)

-- 
2.53.0

