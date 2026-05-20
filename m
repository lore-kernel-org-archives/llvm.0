Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377D82F8EB8
	for <llvm@lists.linux.dev>; Wed, 20 May 2026 06:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779259611; cv=none; b=sOnr09g4GbDXjH8mwyqiSO++Ia7G9WMqS1OFkqZlaEOHr3K3lL8uxDgJzHDjb+qA0HFC5OqOQIL3vBzT5CGgsKvB72CleOHldkxxA8h+58vmzlNOT5RvJR+38+C0YdOrWnC47b8+IHxiF48Gz7LjzyCTbM9/Dhw9ZBssYnGz2Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779259611; c=relaxed/simple;
	bh=B2/F0vhSfzR11C22X79ZPAvy7Q08RGzr4S7B3Mp/HgY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FHaAW/6FOahxeVv87z0SRgL2VuGo6vLZOTpIpnSk8U0D6DeaB8m1VoPIpfZ/riL9MbHlhNPB23Iw/kg4YCxcb2EIqImLKXWnAk7njcPtl5o7dTS6zE2blczrU6+PvLH+ttFHq0kNZTl1fewfOxkYj77IaQsDnu++qapbKiODTec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F0L5gw5l; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F0L5gw5l"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3665b67ed66so2809959a91.1
        for <llvm@lists.linux.dev>; Tue, 19 May 2026 23:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779259609; x=1779864409; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NDx5HOJPuqRAyZ1SBpaIcm1vCWOl9Riz0JdHBJ7QyUM=;
        b=F0L5gw5lCpXx1/4M+Lyd78/82pve1tAvAWqQD5Yk67wu6I+JK9TOaezM7+Ao5KXroW
         4MA6/aRPOBLi0E4lxgoqsoUmk1dunpUVUdDddauDk/iWClefqEIfNy0mzaRKXKFcpiE9
         Cth9aziWEAw3L2+ALOhyiel2mN+rQmRGQXBXbzMrsS/RMXSPwmGb/jsjZDGhAp6aA3VM
         AYQMvq6vdnlxTB1Ja6hJtcOoQ3EBjnD+RQODCezfOD2gv25+/AGYQBBWPyCMfb9uckM+
         4SUuOJHzYyv9BSyRQHJvJuQK8RyO0177sja6LuuIAfNTVB4dDRyERKzqclMWw4267NCk
         ZLRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779259609; x=1779864409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NDx5HOJPuqRAyZ1SBpaIcm1vCWOl9Riz0JdHBJ7QyUM=;
        b=r+1cs2iyMeyyK9cmHXetquPCO+hRe1nMA8D2kE7Q2DnBYO73X3ljbJ62L33JzhlS/8
         Ib5XOLzclDCEaAJpBSTMcRfoALALmmElY43KNrCTKiSNKX/1P0hwhM/9Pga9r+0iuphr
         Hlb7sx2aw/lBbwhiiOA2tJSkJcTYVA6kQmg44XDmPd6GZIfkBKViPgxTp4kHfv2acfAQ
         ubtiO9t7EL0q0P4vLokMFcTQWmk1RbfECdrEqujcraeZE6hBz35IJTn5M3Y8Yinb/ZQa
         QzXg8AKA+NqMwWSMFTYbsQvn8EBmdFdrHONQ3rM4Pm+RF3xjvnd43454PMaqEUeJR6Oo
         6BNg==
X-Forwarded-Encrypted: i=1; AFNElJ9xG52Q+7F2wLKw78B4C7nYs3bXdsPIJxX/zAR4WLQrsZeiWF97RPQguJd2RCBOcFv6sxsd@lists.linux.dev
X-Gm-Message-State: AOJu0YwovLzPRmEza9VQtfHgJFJ7lx6UjKa1/7J0fOnCOTZ+3Q1c2Qax
	LT05meZBsOvfhkKBFdU5uyZAMxgirj5NnxzeoMce+5SMoCL32rO7GY/5
X-Gm-Gg: Acq92OEBaz5phhuuK8DkwbWbVRC/cRx4/gv8i4IUJbCaJqoBWQPfu27ckkKtFSJ8ndC
	Bhk/yeG/xjNqRlwgfNsNfR+y6sx6aiS+WZwNtsfEaBbG6ENYkq4RiWWmKOb5obxSDs4tbRPm9vL
	f8oIvwnYctb1LbtR8A0e6B7JUXPPHPhyUKfcr1j3lyvPNvSRYHYPMBPpof++hc9MXp3hUr2JWRl
	Nvt2wJGw/IF8dzqo95qwa73Lzqf1SjA15qBM/oy7zaK5KOkMz8FIvujiqdbMgOr3/U58AkcXXra
	UsJUkrwyQEbs8GFUkwHBWRRnbYguIRlBQei0Y8L9r7drnoW/EtE7Bu/la1+yqsaxzVmZvHDTevB
	fwTP7a7vZiqE3cNRAiX6AeJrypwWxCGsq5btHdOMdzcvQ2y8D97coKo1sCiNEINFzIgF1RpubAq
	mLjkPJbpSBe5MfbMfnUT9JXMO641JsDwRGlaaQ+w0DRwe5/Tb7H7UntQ7KZiBrogD4QhQpo/F7O
	2yQZRw+93wRLN8=
X-Received: by 2002:a17:90b:1810:b0:35c:cba:3453 with SMTP id 98e67ed59e1d1-36951ca602amr23738159a91.22.1779259609374;
        Tue, 19 May 2026 23:46:49 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695a0e93e0sm6069970a91.10.2026.05.19.23.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 23:46:49 -0700 (PDT)
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
	acourbot@nvidia.com,
	fujita.tomonori@gmail.com,
	gregkh@linuxfoundation.org,
	prafulrai522@gmail.com,
	tamird@kernel.org,
	kees@kernel.org,
	mkchauras@gmail.com,
	lyude@redhat.com,
	airlied@gmail.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V16 0/7] Rust Support for powerpc
Date: Wed, 20 May 2026 12:16:22 +0530
Message-ID: <20260520064630.1785283-1-mkchauras@gmail.com>
X-Mailer: git-send-email 2.54.0
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
2.54.0

