Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317787E105
	for <llvm@lists.linux.dev>; Sun, 11 May 2025 18:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746987716; cv=none; b=Jnec2Q3zeLMCV0TfTbeiwKm+gVYNLFrpr5ODGXxhRyF2P+iToexEMOLjERcc+eV03Jgp24BV0lwl0bmp4sGp5r3u5l+vxB0JnTTO5wvAjh0taXLLCrZ/0I8pDPF11aBhkkx1VHDBXOSHmxPJ2gTA395oOADsmEyeetOvnmREeD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746987716; c=relaxed/simple;
	bh=OQU/MiZE+lT78EcpBRSF2Uz+WZgrmhl5vkUnIF/lTd8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WuNPPj55ZVRGjAnlqD6q3BGXXnZ0itHfLTVb2mP4ikeZ6WmzRfKRQHNYAKKgyI+O7ffUTT0d4VxRWhM9C+vU4YRPtnvCP5cX0g1nA/eDy8SPesSWOIHILMA5dRnoLatjWXu0eWrKWb+2dSCR77Gdw5D6iKdPRUEckhLTLVBdTCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dMFM0KcY; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dMFM0KcY"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43ede096d73so25811585e9.2
        for <llvm@lists.linux.dev>; Sun, 11 May 2025 11:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746987712; x=1747592512; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mZ0kQFFRJhlcfHJoNQHTfxXn8KRZzMbJfL2Nt0WYTos=;
        b=dMFM0KcYaZzj6TYcLueS0vdCUuzkdhkXkfemj0I6zMsxpuTqU4OgwN1hjhECpYJfcS
         eYVA2h34xECtJVxdMAwCEnXSQuXIrU1IwodOoqU9JR5fD4Jd/+y6E2QM+6nrX6edTZNM
         v67bmJaJ83LCWNdiLUIVVdIb0aVfkofDMZfi+awKkMP1BVNO4+5x0Tr7t8RoiEmCtx30
         S8F9AElqf5wkk285makIGdSUJ1Ij5tRLf789O6v8/10sFNZ7h8Jqylw8V9yflZ/s5xkk
         sdgqo1vikEoZ1uZvyBwjzIpHTVRo555fAgsfdqxPpiTHUvk57/DVGopbqVhh4bfhXnp4
         m5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746987712; x=1747592512;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mZ0kQFFRJhlcfHJoNQHTfxXn8KRZzMbJfL2Nt0WYTos=;
        b=IcH7++8noxqIL3SJ6ZV+BLxfED8cmWSoNqwQD0YDKGVcSuZdecYnTi/JirG1n9aMq4
         W5k0Z3vLQhDESSbT0wuLvFTYoauTEKeeUyF9LQdwBsNs38ekR5nlT5VbeoSgpGKlzB2N
         9O3FnVrZ9ZfmPkP2A0xKLy2dGgHwsTOZl6xJQSx7p9WPBqfZG7OmL/0+RyqZnWC07Xam
         b4aCoqncBEldy2T2EsSrqI2crhMOe/aimYd8Us5e16qvo3afuEP4d6NbiG0hwpyWnqA0
         y/v1Xa4541ijOVJna+R4cNbBso/M9B3cv/3CQXnrgYPqLgQTnImYFUbr0IG84BxdVJwI
         6Giw==
X-Forwarded-Encrypted: i=1; AJvYcCVLkyY9eWswK0LV1ZaRHvl2cZg6vWFL9rrLe+FQ71EztZdkNyXrQtgJCXEsOEwA0sAjkY4q@lists.linux.dev
X-Gm-Message-State: AOJu0YxTKuzml2rSgdllCSS7S6LHKm2iyjc8kjCOZTpI7NMaMt5ugauI
	qiAuQO+wIfpLrPfOJwg67IATJCRjMyeB2Zx5GL0ydrCrwhuR8HO2
X-Gm-Gg: ASbGncuKYd9j8TV6CZqB28fhszQAZxZVt23AOoRBoFBNUBBWdUT0x/w7xxbW2S8t6YR
	LDLF2r/wBvk+2sDHEMIZU1WQLzdOu4LcwAV2Nue3RY0E9gdwycCN2WJ3Mdkg9+wSfaDhATLzgkH
	ZCtbUCHDlJl1RkiuZL9DWQdv/v33NdkZv2XNziQjc485icpUcNUF1elBVYFXWiwLswmWy/BaClH
	sMl95PsX0b2LZdy3xy0L6jFByXAwaFP5pB6W+nHiAYwCSCF1vIBMaRJR1iCS2gt+ro0NpNvLO39
	Rs49rPc1bq8u5S/7r1YP36Zt70V4RLfdx5gdi78=
X-Google-Smtp-Source: AGHT+IEedUo0JnIyvB+xFL02RSn4lSVKbzxYFR8cCI0p+JgetbwSYY+hM3hU0Kr1wgriVJhQ9olIlg==
X-Received: by 2002:a05:600c:c18:b0:43d:82c:2b11 with SMTP id 5b1f17b1804b1-442d6dc7ce7mr80549435e9.23.1746987712257;
        Sun, 11 May 2025 11:21:52 -0700 (PDT)
Received: from [10.0.1.56] ([2001:871:22a:99c5::1ad1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442d67d5c7bsm100418495e9.4.2025.05.11.11.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 11:21:51 -0700 (PDT)
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Subject: [PATCH v4 0/3] rust: add `UnsafePinned` type
Date: Sun, 11 May 2025 20:21:37 +0200
Message-Id: <20250511-rust_unsafe_pinned-v4-0-a86c32e47e3d@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALHqIGgC/33Q2wrCMAwG4FeRXltperCdV76HiIw2nQXttN2GI
 nt36wEUGV7+CflCciMZU8BMVrMbSTiEHNpYgpzPiN3XsUEaXMmEM66YBENTn7tdH3PtcXcKMaK
 jpgJnkevSdqQMnhL6cHmim23J+5C7Nl2fOwZ4VP9yA1CgVlqtlBFV5c26OdbhsLDtkTy4gX8Rg
 k0SnDLqrVmCrrVkXP4S4kMomCZEIZS2CAqAC199E+PryoTnvnyse586jneD2LxQTwEAAA==
X-Change-ID: 20250418-rust_unsafe_pinned-891dce27418d
To: Sky <sky@sky9.dev>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 =?utf-8?q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 llvm@lists.linux.dev, Christian Schrefl <chrisi.schrefl@gmail.com>, 
 Benno Lossin <lossin@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746987711; l=2125;
 i=chrisi.schrefl@gmail.com; s=20250119; h=from:subject:message-id;
 bh=OQU/MiZE+lT78EcpBRSF2Uz+WZgrmhl5vkUnIF/lTd8=;
 b=nI4QpPmvG+e68Xcuk6TCzr//BZzS8dD3iJ1+NjwZ0fHhMa+3ZLXlhzDpkhzD8kIieZGm7tUg3
 pmCGq3XM31iCx7aLSPTYclz3sA4wPVTL7ug9a2sTHvp1HcP5fGzmhpS
X-Developer-Key: i=chrisi.schrefl@gmail.com; a=ed25519;
 pk=EIyitYCrzxWlybrqoGqiL2jyvO7Vp9X40n0dQ6HE4oU=

This version now only has the kernel implementation without the
config flag for using the upstream version. Additionally now
commits for using `UnsafePinned` in `Opaque` were added.

Checkpatch warns about `rust/kernel/types/unsafe_pinned.rs`
missing a MAINTAINERS entry. This should be fine because it
will be included in the RUST entry.

This patchset is based on the pin-init-next branch.

Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
---
Changes in v4:
- Reworked `UnsafePinned::add` doctest to not use get_mut_unchecked.
- Link to v3: https://lore.kernel.org/r/20250510-rust_unsafe_pinned-v3-0-57ce151123f9@gmail.com

Changes in v3:
- Dropped CONFIG_RUSTC_HAS_UNSAFE_PINNED and feature(unsafe_pinned) (Alice)
- Add comment to `Opaque` reasoning about included `UnsafeCell` (Benno)
- Small changes in commit message of Patch 3 (Benno)
- Removed docs mentioning not included functions (Benno)
- Removed docs mentioning implementation details and added that as
    comment instead (Benno)
- Link to v2: https://lore.kernel.org/r/20250430-rust_unsafe_pinned-v2-0-fc8617a74024@gmail.com

Changes in v2:
- Expanded `UnsafePinned` documentation to describe differences
    with upstream rust implementation.
- Removed config flag for using upstream `UnsafePinned` type.
- Add patch implementing `Wrapper` for `Opaque`
- Add patch for using `UnsafePinned` internally in `Opaque`
- Link to v1: https://lore.kernel.org/r/20250418-rust_unsafe_pinned-v1-1-c4c7558399f8@gmail.com

---
Christian Schrefl (3):
      rust: add UnsafePinned type
      rust: implement `Wrapper<T>` for `Opaque<T>`
      rust: use `UnsafePinned` in the implementation of `Opaque`

 rust/kernel/revocable.rs           |   2 +
 rust/kernel/types.rs               |  45 ++++++++-------
 rust/kernel/types/unsafe_pinned.rs | 111 +++++++++++++++++++++++++++++++++++++
 3 files changed, 138 insertions(+), 20 deletions(-)
---
base-commit: 9de1a293c8ece00d226b21a35751ec178be2a9fa
change-id: 20250418-rust_unsafe_pinned-891dce27418d

Best regards,
-- 
Christian Schrefl <chrisi.schrefl@gmail.com>

