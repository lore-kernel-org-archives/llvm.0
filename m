Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E457374730
	for <llvm@lists.linux.dev>; Fri,  3 Apr 2026 14:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228005; cv=none; b=FVhLcEQEixWmIlks4aFQju4l9Bi5OZpENMv+/+Th3Id5F4yBvN6eyWqI0NTh/0iD6cAAyB6AInHpeDW/8p3kQSDrKOCeKtaOZ20UGSoUgVd37oxgssc1cmcG4GMHf8v5jc0UynwLt3acNpd/gAeBy8pt5uZB/akgPeK9dmD4ieA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228005; c=relaxed/simple;
	bh=7RoFm77bOhyk6cQZSK927ydS9/Zgl5MybmrB4ByFItE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KvA9bTtZQZ7woYno6Ue7R7tQw8f06DmPw4PCtSMzgPTHFi5DG/703cC7h/5T23xxOVq0wSr+KW1lMjeRepRLfwkjevMF1frXXlQEjDn78lLxUoLgT2IGdUylQvjHGNHGWjSKA+jMCttYMqHSdEiFhygjwawul6Jy2S6YYBrIG4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DitwgOO6; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DitwgOO6"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82a67ce6969so1459459b3a.1
        for <llvm@lists.linux.dev>; Fri, 03 Apr 2026 07:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775228003; x=1775832803; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y741cUw5/skL529bebHe+2MR3Atn8T2EhTb8n3/Lxrg=;
        b=DitwgOO6eKb4SRjcCqk0TI7breswVqOrM8fSntI9D1ZG0YpfRkFv2YSAD6FTO/2ge8
         C4pEJk257qoh2P5eofP3kC6UwBaZl7Uf7Fz3QdLkhDn92ZZrx/msJG7UVXtzDtwhStJd
         TQYl/mco8ELuzmtVYA0xLowougNjDrg81z+tBarlEpq+LKl4hpKV98ndg6MHe26jMZAD
         YS8CL6sMVWZ48cBFpslhohbl5HIDHaKdrEjhNyW1Bo6mGwawm9beES9yL1lwWrNsa45W
         h94q6UEUxO+iCITGitS1R9Tw6j4jN8teyLpIaX33dWJAaBYYw8tP83+qFqocKS35vRfe
         q1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228003; x=1775832803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y741cUw5/skL529bebHe+2MR3Atn8T2EhTb8n3/Lxrg=;
        b=sPbQ11Gnf8gitBUT6P8Tb7T2rFDIMfpHCuYFwqM6L3p4oyBnjcYQXElQQsG/WB3w++
         Ob6t06Wc5Hklgr5nwtgSn3cB0MeEk8xgsG6j0ctZzNgTVrlpgOV1LDS/BM5vdk8o9TNi
         GJALoK4+64EjDJMGDDXAE9TD/I0F6jNH6zDOWg+lHWTGU/YPrBLQ0RClhfdR4IF93Fiv
         zx4hdza8cPakkcug5CdL8njt1w4BAz7nEICJSLSXhU69sjjsAWR4kBbxagzJh3ypydDp
         P0AVZUqVq0HmowO0SnAxyrmKQrEYn1mZB9keRNoQVqq1YlGeo/y3QurP+u8KdiHt/G5d
         fN5g==
X-Forwarded-Encrypted: i=1; AJvYcCW/WwgHgWkIx78kyA8qy704OddNKZ+DWh7QwtowbuCPSn89bgQ5A94De3XcBv9hQWtqqQuO@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0xdMEB8Kk7cOyIN5LB3Mw/JtlivLfPoPw0k+GqYL+XrJHmcxm
	BeKbx1BgKSYwCVkSVM8lmMnw64+mhbtgLbnzTHyMU1/94T9g9j7XExow
X-Gm-Gg: AeBDieuZ/wZMfRuWOoruh53TdGNIJWcMY6tGq0f1N47nPhQo6E5nzka8CNr4yXTd7Mh
	NNus2cQOBHLqM2LxTmyL64N1gjZ4w5nc88Dtld0n2kNbdyuxN4kG4TncX9LfZls2UQnrSBgYCfS
	SKqfHCzBLpJ5i1+hDDsAlZ9CWVargnvvys9my9dzIebE43Or805pz15O1ZenTeRiDLvNCO8I+6Q
	LC2TX22Xg+CdcaodPfw7JetqnrdyGPyrK0unkn/v8SPkYeLyZMy22dOo7As0pDBytDcw4fYqSqS
	aJYwFoeFYmg2EIFb35EkBrRfa29onX5dnpvaokUaGAiiBdQISTz7Vx4z/OC73o413hZTqe7yDi1
	6H4UT5N/3sFFgKGLizlBZfnx7KmG6N9CQOBiNB7qHijgQ2rC8A4o2hEmxmr8ArCnkbTU8lgfbIq
	n96Nk2dNEfZfZlQuVQAucWrHYvysceIrc6XcdgzVz4JHs4zGqGJQziIiL93fcb39N3eNTPO9z4t
	ZM=
X-Received: by 2002:a05:6a00:2e12:b0:82c:9223:cc95 with SMTP id d2e1a72fcca58-82d0da4e79fmr3167167b3a.1.1775228003145;
        Fri, 03 Apr 2026 07:53:23 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9ca4efesm6301682b3a.61.2026.04.03.07.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:53:22 -0700 (PDT)
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
Subject: [PATCH V8 0/4] Rust support for powerpc
Date: Fri,  3 Apr 2026 20:23:04 +0530
Message-ID: <20260403145308.1042622-1-mkchauras@gmail.com>
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
 arch/powerpc/include/asm/jump_label.h | 23 +++++----
 rust/Makefile                         | 73 ++++++++++++++++++---------
 4 files changed, 71 insertions(+), 34 deletions(-)

-- 
2.53.0

