Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5A82DCF55
	for <llvm@lists.linux.dev>; Sun, 26 Apr 2026 10:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777201192; cv=none; b=WviJ15QuN9GjuAj2OmqS/fgnRae2vBSaVGOt6e5k9aftWEL3ve1c6E+2KKnwBpOEicyWrnGRTa9tZ/z9ZvqgvHPyRJyb1tiuU70f22q8Y/wzHFJDRErCygwfr+BNJHz3k42rYGfRGLtJnFO3MFC9hkBBisNCueDi3hzwI4OxZDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777201192; c=relaxed/simple;
	bh=AySotw8seCXdyqr/esoayXpvzRueCl69QpjBBeYpSZc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jssOLJC+3bRvqSuczHj7+satOXOLhV7TygdevMHiABN9NPv/p94IeqE+9qd/EOPUQa0Ko5fFFfISnRXw9VKVnoqLZQFik9Y2l9D4fml9+4FeTMks/RAfYbVJiAw6/29JyzyUwg5HWX22gnqJdHpa0E0Sx4ox0R4XpbdXMcZ8UPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oLZeFWU0; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oLZeFWU0"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36146ae9dd4so7643083a91.3
        for <llvm@lists.linux.dev>; Sun, 26 Apr 2026 03:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777201189; x=1777805989; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=U1VDIUYAAbGhNNmqVpBAywUG0DbqRnlLtXCpqzu1q0E=;
        b=oLZeFWU0S81QJpjt7ehpKl36tHd/m6bEE8SLMkH9llgbpxlw4SwlhCoTJ6dc0yobk1
         OCKQdfOJnOb7DSpgF3xVOCCJ/10RgSs8NydwnlfGvnrTWGgpLQy12Ffgkm1l4vG/5akX
         WXfUV74WG0uVB/NGkDgVerLpHBB3E3CiefInsnTT5YsLDax5dr1toN2XAqWk4TtLK9l9
         omdpFRt8kOKIlO/0doGwJTn9zeDtvnmZZMQEJ91Z5yTyUVpzDHEZa2KkFzWUv3+HzNAZ
         kAkn54t8S2j+KK0xS0N1x0CDiW2GuvZ1rme0NAgtmM/22rd1K8xU207UKpv1FRW/6im3
         YLMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777201189; x=1777805989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U1VDIUYAAbGhNNmqVpBAywUG0DbqRnlLtXCpqzu1q0E=;
        b=eVn5sv0c0rk3lISJiLxoV/OFcKEDaXu81/0k8OueIJ0iuT2Bw1eVRCttWZ6ijDUv8x
         Fq42H408nCSQpmcJrKNQylOpIjbl8IWPV92jNVzkd5Yug5G3NE25chKrIYMWzl/ZnjTf
         +YD5CVRN9YY2PewCyNUOxjN3Z9pjry7dumQmGiYWCN+Z8oy4+BrlX8miy6WhprWMcyyt
         Oiy06+UKPMHd+X26KtLDeeih6V+qGH9V4HYl9Az8AXdDItKkVTlIpQ0pvNrr4HzZLvnP
         pYlmDVLB3+3jXwRon+nJwBI6daHHoYdbN/QE7HMQRYBylqrCc4PeU1q6ZDdvWOqadhOx
         KWZw==
X-Forwarded-Encrypted: i=1; AFNElJ/IVi2ip1rxZ5MHk+zQx1PzHTyVu3hMKyI6gcJWSTrqGrB1DmTVbI49ynof9ibCit1mL/lM@lists.linux.dev
X-Gm-Message-State: AOJu0Yxd8fnbYykbLWMiawHp59YnzaOD90HM/T+uTfHPiLUmH6Ih7blC
	2KZ7Y1/6XTIGD0HmitrifGorKJ481FOQtwuju3rowSJlco/p3A3hs0D3
X-Gm-Gg: AeBDieu5nxbL1L9FdeqXk+KRy9tj2ILgk0/J0hCnUgiRUdLqKXexlxHVmy1DbvU5YLe
	osFviSxM1pOFza2sKZkclJ8zhsm3M8pw7Z/shF24i1IC1YZZTuHeqq0Bt3mv5MVw+XpIcGCL3T5
	9qsx77aMhzZQ2b5cKZYAyMyrnh8U4dGo4idl4EOJ2Pk3MWwbmLnmqzZJc2E6pWWuKgtxGwPhe9F
	mg/gC2mEhST3+PHKu/SL5Asf2sFtG+bD+6yQhNyspwSsgGmOEyCJYIuEXgN/0CTf3q3JT5Rtvcf
	SemurXJEUwS9gRDOJXC0WsMx1Y4zaQr/iOT/EGJ6Iro0VAeBdGW/BR3zQXN2+Y6o9LP6DFEQ7Rp
	Qjz9nnFaf9HQjt6GofvrnEUDW9DisHHM4tdiYFgPLzvxEUS09r8HLMV8owObWBmjTIkjYrUWcLY
	zmFW/jpHvV3Tig82yilLb9pMDINX3duRLE7LFOarIW4yZ01hHP/CQaKr8hrTTJr7XB42WyXmFVq
	NHlks5hLTB68sA=
X-Received: by 2002:a17:903:3585:b0:2b2:42f8:1a45 with SMTP id d9443c01a7336-2b5fa013092mr465462375ad.39.1777201189497;
        Sun, 26 Apr 2026 03:59:49 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa2f129sm256667235ad.29.2026.04.26.03.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 03:59:49 -0700 (PDT)
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
	daniel.almeida@collabora.com,
	fujita.tomonori@gmail.com,
	viresh.kumar@linaro.org,
	prafulrai522@gmail.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	tamird@kernel.org,
	mark.rutland@arm.com,
	mkchauras@gmail.com,
	lyude@redhat.com,
	lina+kernel@asahilina.net,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V15 0/7] Rust support for powerpc
Date: Sun, 26 Apr 2026 16:29:25 +0530
Message-ID: <20260426105932.2270364-1-mkchauras@gmail.com>
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
V14 -> V15:
- Fix an issue with rustdoc build on ppc64le
V14: https://lore.kernel.org/all/20260426085725.2090827-1-mkchauras@gmail.com/

V13 -> V14:
- 2nd patch is rewritten (Christian)
- Fixed a small typo in rust/Makefile (Sashiko)
- Fixed commit message in Patch 4 (Sashiko)
V13: https://lore.kernel.org/all/20260424054742.45832-1-mkchauras@gmail.com/

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
V1: https://lore.kernel.org/all/20260204042417.83903-1-mkchauras@gmail.com 

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
 rust/Makefile                         | 52 +++++++++++++++++----------
 rust/compiler_builtins.rs             |  6 ++++
 rust/helpers/helpers.c                |  2 ++
 scripts/min-tool-version.sh           |  6 +++-
 7 files changed, 69 insertions(+), 29 deletions(-)

-- 
2.53.0

