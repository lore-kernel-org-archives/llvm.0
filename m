Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E10A335BB4
	for <llvm@lists.linux.dev>; Mon,  6 Apr 2026 20:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775505725; cv=none; b=VhHdubnrlrhMQc4VBFa3WOGy9uuaCZIeiX4TMYkx8VlO3ilTP+CrseF4NCpQIpDo3h3t9/UBL9jQuGsS4jMNd0gdyW1GrSKD/gUv9I+xAvpDQm2nHClQKV4YlYcJyy6lHuMEuWyCEJRVx1s+EnHD4Sw7RBAw2amCP9/WIY0zv9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775505725; c=relaxed/simple;
	bh=+REJAKdU5+YCJbYdz5FziJBHUtrKgQD+sRosct4p2Go=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fOhlaWCWxhSunNyByqUEI8FqCDHJgLC6mbyNvkvs3JqMXdmafKutv6jJcGcX7nC6CJfjJfQUOFl68L9R7bKaW2cUXJkZlSX7XtC7ftkq294z6oTC2Fn1eBV3dhOBB1dkntx98ABf2RBSbiyZzhM7CuWqG2+Yd7s8oTPKULYE37g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sIOG7rb+; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sIOG7rb+"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c736261ee8dso1323245a12.1
        for <llvm@lists.linux.dev>; Mon, 06 Apr 2026 13:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775505723; x=1776110523; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8aqgt9jJm3l4gnx6c9t2i53dMaxCBMnYxyV14FUwpPQ=;
        b=sIOG7rb+Cyu2o8kHpXYmoxnNSs5Xzu0IUoPxIMTGaE6vuqWlDaB9cPAUPA75H2YAO/
         xVOZVr2KrjANCfxTgmvXNhbp/k5w3pWOx/VF+3z+9Ou0kIcOHT3IhLvpIq8MfAMXOrZd
         KgHE1Wr7mWev8PybVVKGgpu27zbwuknClrgTFZwQAvVZpAdv7AJM9nbFKC81PwjPJs0i
         eCM5dXACqxNotve5pH64R6Nip95eZtzMQhe2BtS0XF4cjHX0L2tjxNLQMPe/t+o1uf7l
         CTmHE9MTnH0QdHv6xSBjEg/x4biO1kD8U+8BXrhDWdAAE8s/ccziHvthp/wRjPTn7EkS
         p8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775505723; x=1776110523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8aqgt9jJm3l4gnx6c9t2i53dMaxCBMnYxyV14FUwpPQ=;
        b=tEMJeqFHPZOdGLLJV6E6O47Uu8YhJJp2rz6bnNxWf9L66AahBjjToytg/jQkqMoD+c
         WB8nAEoDptANL5t1Pcgr2TwJE/w83oXnhGxlf8x2spMcA2JwMd//yJEzH6K/WSl3MP3u
         lazzD2Wkb8y7bX492mKLClr1q0BO8/zwPrrB+nROA+1qP2kBnIEAexiOtgHJk3PnaRun
         vmxLMa/pxc2jfAwaDEGcdSw/cy3WzUPGxaQwzIZpdNO2sLKx5BLEWNPQeaapkWW3mxuI
         VFDG20hJz5gYkCMcAl9cxb1ZuW+ZAgzKjiwk7xL6PmR3TmrWBd6C3alJ65hhY0qLADDF
         i78A==
X-Forwarded-Encrypted: i=1; AJvYcCW1LUwlapIvRnwWzGTMh7rQ/Ac/FDDR6SzFeqGSvNnkNqTrbiT8DblwphAo8yqP5AxNMS2H@lists.linux.dev
X-Gm-Message-State: AOJu0Yz395pycu2C8MnAHeUTyKk3m40eVbxree517LsB8ygQBubb4Zat
	+6icR4ia12+Xgdh5+wBwgv7TIl0l1uPYxdefEYdATYcz4DV5M37DSTZk
X-Gm-Gg: AeBDievvhE6uAi4GJ87MDSVwbeoVaW+FP+FiK/oOXRuf3UsE+eHhGjffWyQ+SwCRupF
	OipKPovJjNx6rCDmze5U6w41iGayAGDgsSEAcuUFkhqQpmTdiv/vKzPmDBkibRJP3fzTLC/tfxP
	njUjFAPB0WlNjtRz4fokrZnk6IqiXss0PrzqHDWg6Us4EO49TBDPK1sFWzBbGVQU89Fu2zYqWlq
	CZSjSDYsOXNkVx2HyypRYpTWJ4Z/vyrhLwO5VjpRT7ceC/1slqUP87RjD6xwZ3BEFWBeddLXhLm
	T3TR2SHourdAq6hnbM60MIAjVeOLg5a7vkYxvEZquE0xbQkG5obats/XO5PJGj9w2QlvwWKF+/7
	vJ04QbtjJePKhZUgGXnkS3Ufni0zM+5qUCqqho1U/NP4e0z925bpBgSQVTrO64iNnKKrlYc22/9
	T9wUlSYqyuZe+0dz/eqy4IqNucrLkvp88EE3k1SfRyKnVdifv5mXGBw3f81JgPySURAMQ7x+EJ6
	Ws=
X-Received: by 2002:a17:902:da92:b0:2b2:5256:9ce7 with SMTP id d9443c01a7336-2b2818e65c4mr147102775ad.36.1775505723315;
        Mon, 06 Apr 2026 13:02:03 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27497af26sm151098205ad.49.2026.04.06.13.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 13:02:02 -0700 (PDT)
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
Subject: [PATCH V10 0/4] Rust support for powerpc
Date: Tue,  7 Apr 2026 01:31:45 +0530
Message-ID: <20260406200149.3727922-1-mkchauras@gmail.com>
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

Link Mauve (1):
  rust: Add PowerPC support

Mukesh Kumar Chaurasiya (IBM) (3):
  rust: Fix "multiple candidates for rmeta dependency core" error
  powerpc/jump_label: adjust inline asm to be consistent
  powerpc: Enable Rust for ppc64le

 arch/powerpc/Kconfig                  |  2 +
 arch/powerpc/Makefile                 |  7 +++
 arch/powerpc/include/asm/jump_label.h | 23 ++++++----
 rust/Makefile                         | 66 ++++++++++++++++-----------
 4 files changed, 61 insertions(+), 37 deletions(-)

-- 
2.53.0

