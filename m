Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A8C2F1FEC
	for <llvm@lists.linux.dev>; Wed,  8 Jul 2026 08:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783499123; cv=none; b=IAurN8WoMV5Ixum2FvFjFIDKt+4jiEfwE4x181QOU1W2U3fPlRCJj7k19i1d/uX6kcZuKkmhgsDrYUeP6k+tyduliCnhHoLGxP6hu/iOvXZ4SQJogsexsCGQeoalTOuZmqW3yn8hP6VwttEa1nqh/d/oI2ci+fVNRlTGzIRUI8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783499123; c=relaxed/simple;
	bh=AoiLGkk6ERpoZrsTXdLKlIi8dXjBoc9CmxC7x0DV5pc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WDw3hlTAdxKpOq8DQnZUy0BOF21TsaqLMSByFcY83/3fXrV3a6lyYhGUgjkqqntf1oQPn7TGSRQYvO8I8Tdz7q80jdCA1wEIaAuC2b+l35aP9ZpAiaxL2pGCfjzSV6TpM/DCURg6YLI5syXqdnXAetKkXsa2FLseHs3uLilB87M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jS9LFNsk; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jS9LFNsk"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-847e6f03df8so453153b3a.0
        for <llvm@lists.linux.dev>; Wed, 08 Jul 2026 01:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783499112; x=1784103912; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=unhRE1bbaSsT1YMYJtqH3njUIuLKUE290GOc7N1/y2Y=;
        b=jS9LFNskodiUg011if7i4R0g4SyWrtqOv0bTFEOIUjhZD9yX7fFaghSoMpD0mR7IKR
         vwQ0+aEsTQEvEqJ45offYCWMB+HqYs/ppFnZfwhO4vzcxCJGSrfPzaoA4DmDOR6cWWCD
         lCjnn+DCuPBb6B9Jfsy1LzP/FQgmyqnjmKWWjLI3qpIUniXIGG8JDBiTHI9F5PEE1Iy8
         H1vNUGdsYehLekRn3LEwzTLclvbOjycSlK7a2c4Xk/4EGdgUFssSpEgYUGZchVVWQH7P
         3hXi7tw2Ii9WG6w/0UjDZ9JSeLLZG57c64dgAPUyBkYgf8hQKhH7mGlC7qTCG/ojXoxt
         /8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783499112; x=1784103912;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unhRE1bbaSsT1YMYJtqH3njUIuLKUE290GOc7N1/y2Y=;
        b=EKztTtENwgSioVsZHGxkesf1WY82X53WdaAeBONlrpG5FU5ogmmf1cdQcxTfU5ovt+
         B6+jPgaGOKN1PpTFLCa5Og7Pql4Ex49B+5VchkF/h8QBDlx//70LDIX0Xs83cXsnLyPM
         ul5EMvNgzJn4GPPse6eJ2KiJsPlhB4fCQWz7rQWRUHZCWgaTVxIM8eLI0nnnv8xbhHOH
         IY7gr7iSrQBIu3q1MO+wtSUIzw7OTUaZ2I51qmPegI9QhtSIF0eE3cL5RX0531rU4gpL
         tyCiI77rYj1OEfYg3eaGoHDzDjnPiN2MD9CVD1s/rORSqdHRMqtL3lzPWic81NtJ3n2j
         f02A==
X-Forwarded-Encrypted: i=1; AHgh+RpIr0G6VZTp1tou94Y2eqx73m0n6lcdTGtiIDAEgHQMaKf4/79VhGRSqfhxyq9L8/nNJ9jt@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8IglPnIYoNCzyTuX+/I60MOpjysMQxXylCUFG8LcD/rv1J2zJ
	HRGBnF5WuG1r3NxsSvDBli41TkmURYUkDkCoxkjDNQcwovUSUNYCH1Z3
X-Gm-Gg: AfdE7cnrBxj5aTT9YLB0elyFFRSuJf54vhiMOxol2Hk03/URhzTg71yYSpYYd6mpfly
	rL59xBEEGVjzOdUpV/OMVE/S5by9t0+8GSw47cAv81tvN5KzoELDlWl6QpaJlOgqWUtP8MxMPXS
	RizoEHwEsbSFYc+6Xhf8p7f+1f5cMdr3OBXO8fJ780/kbjvXeE0yl9Zs49s4HLQWQ+Izlr8jXzt
	poNbxWiHvb8qZFJTakpcoaepnEaI6yPzA1/jG8FBvMbr2pzsSStqXcZUDMtRUYAT6paESDG3ypX
	4Qp3w4YkxVUqU270fFwTbp3and40DxbEZfu9zy2V2rTQg9cKoDSTxtP2XwAFwPNMnxvEE60mA3h
	gUSJcGrqrYZoUa/aMDswvvIdknzgCcUHmc3l59TCuUdLVnxRxp3UrCvwFhIbpeYXo0zeXK2itOV
	JEEKtNW9lnRFmDXs9jCIHOwtdBWMzinWNCuBcAOobbrbDwk+IhVWYAOLQvx6CR5UfSzQ==
X-Received: by 2002:a05:6a21:6e93:b0:3bf:7081:934b with SMTP id adf61e73a8af0-3c0bcff3977mr1796917637.26.1783499112244;
        Wed, 08 Jul 2026 01:25:12 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117462f5c7sm19975117eec.0.2026.07.08.01.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 01:25:11 -0700 (PDT)
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
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	fujita.tomonori@gmail.com,
	joelagnelf@nvidia.com,
	gregkh@linuxfoundation.org,
	prafulrai522@gmail.com,
	nsc@kernel.org,
	japo@linux.ibm.com,
	mkchauras@gmail.com,
	lina+kernel@asahilina.net,
	j@jannau.net,
	airlied@gmail.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V17 0/7] Rust Support for powerpc
Date: Wed,  8 Jul 2026 13:54:47 +0530
Message-ID: <20260708082454.1254320-1-mkchauras@gmail.com>
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

Mukesh Kumar Chaurasiya (IBM) (5):
  rust: Fix "multiple candidates for rmeta dependency core" error
  dma-resv: Fix undefined symbol when CONFIG_DMA_SHARED_BUFFER is
    disabled
  powerpc/jump_label: adjust inline asm to be consistent
  rust/powerpc: Set min rustc version for powerpc
  powerpc: Enable Rust for ppc64le

 arch/powerpc/Kconfig                  |  2 +
 arch/powerpc/Makefile                 |  7 ++++
 arch/powerpc/include/asm/jump_label.h | 23 ++++++-----
 rust/Makefile                         | 56 +++++++++++++++++----------
 rust/compiler_builtins.rs             |  6 +++
 rust/helpers/helpers.c                |  2 +
 scripts/min-tool-version.sh           |  2 +
 7 files changed, 68 insertions(+), 30 deletions(-)

-- 
2.55.0

