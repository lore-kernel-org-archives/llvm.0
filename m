Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC4E30C62E
	for <llvm@lists.linux.dev>; Fri, 17 Apr 2026 15:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776439405; cv=none; b=ZZ3BoM3aPb1sxRQLXSMGTBrqou94CvlYsg2VJKDdSA8fzpxRC/gbSCZ668fl3Kj5qbRrsbjtZ32AdSUC7GfzZaXDci99im8Akk8/ZJMgEltAK83PL+lbRWxdCF4ebUFwRHddoHCalAXfYRSe59Flt4ZolnuIj3R4lWLOsxJB0io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776439405; c=relaxed/simple;
	bh=ibcRw7B4Yx2bCabsi8PMkjt2ss/D1T2TOOq6t1gyS6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=r022TMFxFwXkaHTmjraNevikOVkHoNZU6Hex/dYaq5ytFDwFEKqn4y5iY5FmGAbZ5Ol8HifVamb/9tDSYVQXlhXRvpa5Y0k9ou0p/PJMqJK2ObdAENweqsfmMbOLLgzBT+6k3dfVl7DGnlPih1Vwvf1GimWT6yEeGpLNxD9v4Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OkgDffNr; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OkgDffNr"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c736261ee8dso321994a12.1
        for <llvm@lists.linux.dev>; Fri, 17 Apr 2026 08:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776439403; x=1777044203; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aMmJ/7DZqgJfjSSozz++1zO4MV2X84JpIm5qryS5QKk=;
        b=OkgDffNrdduf53Zh2x7J6Ge91smOfCrFN/F8bX7r6dNu3T1YTMfU8HHtzTdQX7DFjx
         jb59xNNhTWxFRILwKWT5zwotUbzoDuvExEimnB2AIfqXB6XjBWS75V/WGBIYkhvVZ64h
         C0D6MJ43QH9q84T3X8rUAftCmkBabTno0Q8QkJdLWwvE6/bltTrJpyqutincTrDe4Xpb
         qy9kJsjEV74J06KSuCQUnIR2Er2UgfvRYNWTAr+Dd9LmjbNrSauUPMxn2TNrYIBNNV3p
         sdip+zUxVYfSZfoiBJoOh3SdDoQERlQee965Ca8W7uJL93jRzeoE38fqrYmsgm94CxsL
         T2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776439403; x=1777044203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aMmJ/7DZqgJfjSSozz++1zO4MV2X84JpIm5qryS5QKk=;
        b=FkZrHBbWPY++dPKj2mxv8LVxZOTukcDxP/aXM8CmfEQuOjXehW3YKM/FMWl4bbwx7M
         zd4wIeaNIq7auwa0Hh3dMcIKm7j88U+GXTCMzHJwC7BZ5CpixV6HHGwlVSF98GIDsT9N
         IkRWqCDlQapdy0ghAq24iWKBnZomRZeZ5OhkL5T/iWEYlHj7JKlCewmjr8ZU9cj/8zx8
         GrWBmQqKPmjyJb6jC1qn5IoNAT5+WEAsxd3zQxP29I6bVnDKJD/Ag0GGvFhglLHtAYPi
         KbGvVTxRTt1woqZ8ouC4xtBjfYulBt3APfo0tkttPUtW9nIHgnLd2EyUk515uQwSdTFY
         Xklw==
X-Forwarded-Encrypted: i=1; AFNElJ88teItvrCFOkFCZ1BZyLBSX3NY3AvBII3x1UZue1OvIgrL96ABIBHc3qC4HmQMlAApu8Bo@lists.linux.dev
X-Gm-Message-State: AOJu0YzWcWf0kHjcr27M8Ydn4rNGfImW+RS3QMvouxQ3MJgUzezmIbBZ
	iVN3a32xGwAxN2u4ntoNMNVZ88c0xO43odFL2MA3KkknmIMwNahpQVSX
X-Gm-Gg: AeBDieuIXsd+tqkX6f0twiK2oGer5Qb79c7i1BeUuFcGnq8XLRRsgL0lLrfuHhbigZP
	8urWaBNjY5qIgagfUNwcxbJM3J6n1/X2M8DqscEbBUjga6CBarPjqa2XC+Gnajy2LDInxMbNBva
	Zr7E9qBCA8lxt46lX9bYflWWT3TtcZBwk0ySYg//dj1hDoDqptlohjfqU6w6mSnEkt70UB/S2ZF
	Hww/pmpeTqVOAoAmjwVVb9vqDTXuPpvjIgeC1Y6G24EVAe4C5pIx4NCScPDmH/APaQ01g1sTtE2
	gfdp6jFdk/I59nT0VpWO/GGO7NbYIzfNzuKhas2UUV8uyKIO2rtN+05prRNEeCEB05wkbC6rXAK
	LSTx8j5Cel7MDKyajmJvTx4O09H+zKlAArMrFDgUR7gbSfeqHSwG2aEwg07nIDNbY0H03G56BMe
	tkWGjiDK5Fm7saimMr0BIM2h1/0et5nOVPkUO1ycxe3hc473XqAT87yYB02lCnzhhRJjY63Tx3o
	W350F6oNUocnWLHBRPz5zDqOw==
X-Received: by 2002:a05:6300:2788:10b0:39e:f994:f685 with SMTP id adf61e73a8af0-3a08d703732mr2161771637.6.1776439402392;
        Fri, 17 Apr 2026 08:23:22 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebb3829sm2384373b3a.31.2026.04.17.08.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 08:23:22 -0700 (PDT)
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
Subject: [PATCH V11 0/4] Rust support for powerpc
Date: Fri, 17 Apr 2026 20:52:49 +0530
Message-ID: <20260417152253.2312961-1-mkchauras@gmail.com>
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


Link Mauve (1):
  rust: Add PowerPC support

Mukesh Kumar Chaurasiya (IBM) (3):
  rust: Fix "multiple candidates for rmeta dependency core" error
  powerpc/jump_label: adjust inline asm to be consistent
  powerpc: Enable Rust for ppc64le

 arch/powerpc/Kconfig                  |  2 ++
 arch/powerpc/Makefile                 |  7 ++++
 arch/powerpc/include/asm/jump_label.h | 23 +++++++------
 rust/Makefile                         | 48 +++++++++++++++++----------
 4 files changed, 52 insertions(+), 28 deletions(-)

-- 
2.53.0

