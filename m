Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F5A3AB5B8
	for <llvm@lists.linux.dev>; Wed,  8 Jul 2026 08:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783498617; cv=none; b=mDIzv7w7v5HCngA2m+IxnEChKrLGOchr6cBAENRDTuLuUy+rjCLK4iMzXB5lvsfhO5RjOoJlFVAcXB9i2Dzn9OO0AFZikuJp/6FGWVEgAdmudF8+PcMTgAZoq2KcmljP6t+NzKTRoTbjEhHdG35CMh/BMSYNGzOOmbfum1i8jnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783498617; c=relaxed/simple;
	bh=Uk3P3cfAEZT1XMtNlKwaeEhZkwpT2gRFnwjQYkAvRiM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NBugADRW55qIFptPCMgBYBmI1GYCmia8lVN9ym0HutkLkFMO8O+nWNk9AHn8CbSXgDNSIFIXPCYlhrYB+QkTi2rbbs9lEIH66OOH55gP+lK0Vrd9Irr9GlxwxBzVFgaE8zFg/932oA5HOvSnvj/oB+c60ek/a2hyx5fZcthDESY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C9N6g06u; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C9N6g06u"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-382a3fe0d28so419871a91.0
        for <llvm@lists.linux.dev>; Wed, 08 Jul 2026 01:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783498613; x=1784103413; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OKHyME7FzZLUkSII5idM6IXVqJSLJz+6sWzTPKllxxk=;
        b=C9N6g06ulDBQmjXFQb4Rv/a85PyTiho8CrRBbiRLkhOmXQfJGsLeGUDHHAYU8d2fFe
         ShOABBvUeZgxX5m8ZuAtHa4MWXj7m5Z3UrzUgcour8TLgtVWkHlTe4fmylimBIP2IrB1
         hwcpc1JHFkF8XV5xvwRsI8tCmH8iNaRcSmK01JX919FIGYmLkEq1Jp4csJN+oqLx5+xy
         X5xgeZAVTRXlDDXhuA5lDQ91mBCFYxVZyeAPH57joFWJ8bq8UrKpeYD2zUM2wHx/aO69
         +vuWXFCZ7cL9iNFK/2PelcJU4o4BKG/Szbk4nibmRCBKKYSLwmmCGnRxFWcg0efptxRz
         nnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783498613; x=1784103413;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OKHyME7FzZLUkSII5idM6IXVqJSLJz+6sWzTPKllxxk=;
        b=R8v9TKdSNok9v3m0cI+d19134hJbviUuHYqMzMIJkagZXnKOfHqBtO8dViEV6HL7Ko
         XqTWU4WB1/+BIjbLzzjhM/JUhF3FjCblYbaFMKOSJw7b7zCOS7A10EjLQ68x3Or6SUAm
         dS+97UxKgl8BxGG6usdL9vE5qxEsKDwCG6+JFA5SFvOFuRnOMTtYo9RIQX+KwWo9yfr/
         1z6eK14Uv9tV6cLjRrHPjzqnViIZq7HRvQJnY/XEjvbD6srTAZm5sHSVWWcpADZWdDy2
         2eOSOq9H7AAeTmgUveOFnOaqqmaH5Qwdy/363edbqZe187vair8wmylMPDXkVnG8Kk2T
         F5MA==
X-Forwarded-Encrypted: i=1; AHgh+RoHH/m+3+neUpBIXtieu9MAgVu4TnCTAPMarr/1MR7461zITERqB507PTT9RxZoGJ0lG3Jc@lists.linux.dev
X-Gm-Message-State: AOJu0YzjhT5+aTfqEjwi95RRyvDovbXfM8tv6Uu8B8ZeUzvRW2ksmDFA
	3GL/PWzr18zHVcZaZb7YnkF3G7kS4LhAFiHIeNvXxUvWLSXA4Y/m32rn
X-Gm-Gg: AfdE7cn/wRop5267SxC6uySe8IBR4kIVcAokRlxREkVS/jK2/VMgRHsjIutJ+Yqzzi6
	tRvKvAXSEO/oUI021HiuuBoUsThw1AWUlCgMW2RTHuU/b3+LnfvlaKNUGoIXRLc0bOJOjnniijd
	SI9kogPTlfXYzhctIQlF2RuiuAmb7HNSsie9m8XGvamQobif6M9IvrVVCuwmfHm5KhqDxu4ahm8
	D26lwTdbi5CZ2XfsBLGltneBSVijxiBxZsgKhii7eCO1zepk3HdmUPARUDsSNwgwc5yeyhL9UA8
	64fykKjd6w6LYoXtqsR8sbh1v+v/EDIxjbnnC+VRfCByvVTtQs2WP8PyhTyVPGWI5OXd7J8eocz
	QmDGF9hypTliuL3kjPt5IXWMCxG+OUb9bFBSxoCQd2AF7L78r2Tb0xsyzdtZB89xmkj8BdQYqa6
	QFhqWw3h6rAwoQgDMOG+8ikFIQ0G/i2zd2CKurMAWzoC3yAaMLSc+l7Bn6apLNmEikpg==
X-Received: by 2002:a17:90b:4b11:b0:381:270c:4dd1 with SMTP id 98e67ed59e1d1-38941201e18mr1717208a91.20.1783498612611;
        Wed, 08 Jul 2026 01:16:52 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117483e0a2sm16346132eec.12.2026.07.08.01.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 01:16:52 -0700 (PDT)
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
	oleg@redhat.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	msuchanek@suse.de,
	mkchauras@gmail.com,
	sshegde@linux.ibm.com,
	mchauras@linux.ibm.com,
	thuth@redhat.com,
	segher@kernel.crashing.org,
	ryan.roberts@arm.com,
	fujita.tomonori@gmail.com,
	joelagnelf@nvidia.com,
	prafulrai522@gmail.com,
	gregkh@linuxfoundation.org,
	nsc@kernel.org,
	japo@linux.ibm.com,
	lyude@redhat.com,
	lina+kernel@asahilina.net,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V17 0/8] Rust Support for powerpc
Date: Wed,  8 Jul 2026 13:46:25 +0530
Message-ID: <20260708081633.1248382-1-mkchauras@gmail.com>
X-Mailer: git-send-email 2.55.0
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
V16 -> V17:
- Rebased to latest v7.2-rc2 

V15 -> V16:
- Rebased to latest v7.1-rc4
V15: https://lore.kernel.org/all/20260426105932.2270364-1-mkchauras@gmail.com/

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

Mukesh Kumar Chaurasiya (IBM) (6):
  powerpc/syscall: Fix syscall skip handling for seccomp and ptrace
  rust: Fix "multiple candidates for rmeta dependency core" error
  dma-resv: Fix undefined symbol when CONFIG_DMA_SHARED_BUFFER is
    disabled
  powerpc/jump_label: adjust inline asm to be consistent
  rust/powerpc: Set min rustc version for powerpc
  powerpc: Enable Rust for ppc64le

 arch/powerpc/Kconfig                   |  2 +
 arch/powerpc/Makefile                  |  7 ++++
 arch/powerpc/include/asm/jump_label.h  | 23 ++++++-----
 arch/powerpc/include/asm/ptrace.h      | 22 +++++++++-
 arch/powerpc/include/asm/syscall.h     |  6 +++
 arch/powerpc/include/uapi/asm/ptrace.h |  6 ++-
 arch/powerpc/kernel/ptrace/ptrace.c    |  2 +
 arch/powerpc/kernel/syscall.c          | 18 +++++++++
 rust/Makefile                          | 56 +++++++++++++++++---------
 rust/compiler_builtins.rs              |  6 +++
 rust/helpers/helpers.c                 |  2 +
 scripts/min-tool-version.sh            |  2 +
 12 files changed, 119 insertions(+), 33 deletions(-)

-- 
2.55.0

