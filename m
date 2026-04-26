Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E19726ED45
	for <llvm@lists.linux.dev>; Sun, 26 Apr 2026 08:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777193865; cv=none; b=mJXvukxxkXvv/c9qNNp4fXReUrcF3G6yBIapKKQvxVYwKhhuUf6PlByWnt200nlZYYM7cOOANJumDX3ayKT9tOC1K9C5elOyEKWXIbUrQlpwAFU6J8HPFG9buomLggvziJp78m+pw4ks94+oALATh2fxLzIJICMY0HrcvZYTGrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777193865; c=relaxed/simple;
	bh=g9siYUbQ58cNl0Jrd/fk6s7kG2U4m8FwDlgbsCIlbYg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FzFYX0Yumnext9kIEJJBxXMzkLVq+ndQWEIOs2FyG/DUbA4BeD6KmZGCIP0uyccdBdl41kl9SWmiz9LD3gpKUxQqPUMZSy8NgeO4pjUcfRZ9vZ/NpiPqYtBShvkowoewH8/S+0tTvE7Kya+q0059OoFA7cFtfty3LTwDTR7bZE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LnZx0G75; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LnZx0G75"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35d971fb6f1so7385970a91.0
        for <llvm@lists.linux.dev>; Sun, 26 Apr 2026 01:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777193862; x=1777798662; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1TNDhheCgYQwNZEg4xsaQHtI58WnlBldGT70w7nMF+s=;
        b=LnZx0G75ukxlHr+X1C0x0r+6HJn72TLX4O2g9zgu8CDUfWIxUZqZWVY2QMirtGfb44
         zHsa+tCz0SRqfxers2Vc4GHrDOFdkkpmjBH7CMMU6FmJCGD4LAbFPJS5h81jm1HH/BBR
         Yfgj2Eiu0TcqJcoKYlPZiTuWEQBaODaPUVODxGtfg52ReHxiXpM2zgKScrsvmU+6NuOx
         Nn582A0aPigvJxzW1LE5O4DqdYmNwr9WUg0z463l+0mj6trW6Mx9L34gebTbZU96t4SW
         RXIrUFUHj1HkqN86n4AzwsSPvZ3KOy4PLkKSz4nhooxNPnOxSufLySTQ7SKFI5yvUrOB
         gHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777193862; x=1777798662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1TNDhheCgYQwNZEg4xsaQHtI58WnlBldGT70w7nMF+s=;
        b=KITRwfc/X53Bn1tpd49P2fIulYZR+HXVYsGpdp7DfoKidSMewKKol3/hG4xBDE5Xm4
         v3rSCHEsmE2WuVswjPMZ6gC5qLaqYERvSRyAsaCHvdlp4EwToepzVZ7Z/1TiAeSaLE9R
         BuhSNqxZuSMWwjNHD0OjrAks0M5xk0ghay7bPUr+fM06yU/rDOzMWBEBiHcE9D8+fslz
         TsFPw+MBaTZihgK47rCXo+NUiVUC8Y/GhrufJxgFNXiwMXNdWaN5OsaF+PMHa02w4beW
         iMECDzrfKdMhQSVPw9L8yJk5TdrZYO0yojlTMoIoIsoM0XWTywoj7GLucgnWHK3t/ZJM
         fMDQ==
X-Forwarded-Encrypted: i=1; AFNElJ8E2hw3KMxSat0k9k9kuFWtDI/SHQPVDUpHVz23eLDkk+Bz6gwYz/IY42I6GbCpLCBfyZlb@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0xmGRcDzMT7UxZ6/nzsK2XgnsKjICprf/DUYNI0iHJUT5vzUg
	3KqsG5zr6uHmG2dXbUoXSmvyOkO9GiXkbAzdEkaXNl7faVOcTg/hyhUa
X-Gm-Gg: AeBDievM1CjNi8vY/59f7Hj/ioulWFWD87y93MxZ4x6/jXVkVHa35U0Ao0UTBq8SLK0
	F0RW+31s7DIwCPaqDt5MXbZjki0rWKV5q9uY8o4KGxx//5+EzkWuPEFqinW+JqrB85L8Zjjy/3B
	j6eATm9fGfk+PpRfNSVAj+awY9mJgF8xE5pq97/99lDV7TN6F9T9qeNMw2fcQrMEfew9XNNIR/V
	jpFRDxe0Do4zyYu8txzsoJ8QwpQop/dIftgx9C8Ngcch4Qbaxeu8AHbnPbqJ+FxFe/dUQw6FCO/
	gXOHHNrn3jbky/WGilhMZQ5SaglzDTox8qlXaGzPt8KQDRu1CIqHZQUXZi+TIpbsdAoOOcIOfr4
	k+mq26hZwoWeV2EIa3zaajUprvqaQbG8rhmAd/oVMNteltasdVE27HCXqDePhJxjS9pbhvl8zWn
	DbzVyamvEd1KC1Xpg36gK5BF34/oP8rO756sGII8aoCYjpFdf6gZX4+c6e3YYOMdsnzeoEz2db+
	2YO4nRmMtxp12s=
X-Received: by 2002:a17:90b:5490:b0:35e:594a:5b6b with SMTP id 98e67ed59e1d1-361404992a1mr45071909a91.24.1777193862298;
        Sun, 26 Apr 2026 01:57:42 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36141868906sm27718937a91.3.2026.04.26.01.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 01:57:42 -0700 (PDT)
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
	mkchauras@gmail.com,
	lyude@redhat.com,
	airlied@gmail.com,
	j@jannau.net,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V14 0/7] Rust support for powerpc
Date: Sun, 26 Apr 2026 14:27:18 +0530
Message-ID: <20260426085725.2090827-1-mkchauras@gmail.com>
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

