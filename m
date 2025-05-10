Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC2D1EA7FF
	for <llvm@lists.linux.dev>; Sat, 10 May 2025 09:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746869588; cv=none; b=gliIL4St0lCppQRPeexkc/kKo2DZyegSQEAjov+at5HUFRFvyYf1TaUYRu5Ey30qQ2dG9cukQoUFao5Bqmhw6FegME4NSOBvly/Vt2yHqfBfctomSfR/KpCGHhJKXJePE76rVc8cL0i0pnsnoJ/RMg99pHzNnn4s/qvAb6tMhWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746869588; c=relaxed/simple;
	bh=d/Q2dqkM3hGIa7pRJKatBlt0uQwkDzQUldsLHN8FByw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FsLcDsu1IKejTw2xEVPQ5uLDPJ+FU9bAT5Nh5UvUaArMvClZcemj53rep3NbOLm6GyjcMe5lLdkDUThefuq/hYJ7vAqafB/dLgp/G/9rsweo3gQDUcrkLHPwtHztMvLd223Z72f4zziVU261zLfhVB+eQsKpkjYKSvQfKTIM8LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JzHy6HXD; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JzHy6HXD"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a0ba0b6b76so1902615f8f.1
        for <llvm@lists.linux.dev>; Sat, 10 May 2025 02:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746869585; x=1747474385; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0zBTUK9ila/Am76tfftf45UmHXE5OHX/2meSQDmacZw=;
        b=JzHy6HXDctrA3GV+7cqQ2sazFHNXSkoj0kCBDXbRkseoQYrYY4jOLKxjd3N25V6apc
         VertPXY1l2xK3ND+aFOTvrHfKLjtQJrTb1G3A5NlNn4KsKyDW24AJ2YrsxMNQDp/6ntP
         tFvQMwLU/kR+JeMKLi73r7uUvCDeOnT6fyL+H94UBcKFRgN+STtq+NTYwogopkBQilqB
         k1EMS6n6tsUjbe99q/r3I0Ca83s06sQ1pNutgQfMn5Vk4WgsgjnKVgTRUWdy2B7Zryin
         UCGWd5dMKaVMMwnBhWJypXrhQ6q5/8KxFF05tw8KhNNGrdU2aW8xB6LDgTq00rJJ/mRQ
         gPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746869585; x=1747474385;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0zBTUK9ila/Am76tfftf45UmHXE5OHX/2meSQDmacZw=;
        b=BbFbkYWuouVasxgTpTvKF9/w113MpbnR+N89Dj/eTMPf1RBF0sD9OTjU59qk4cr9so
         Ui+47NzF6nNG2M5m2TASPslEST82NaALCZaHrLt0vq8iVj0ndieynDKKVjTxYC63vjm9
         IFfuZIYCMaVze5AQ8uAP+npdGy9LCYWCUUkWxU0U02SdS9iN1aW0o/h+F+LZ6UrlBGgK
         DpoUt2bEA0JLpKvBSErLSpD9IY8tYU+e1IBewMndzre4GSDXnE6d5M1DCmTgOxWQbjRr
         PkjubGO2ezJneZLgPLoET1u60Oelf10967D4XUwYn8iEqOoWaT4R9nLvl1g/7TMLkiE1
         epTg==
X-Forwarded-Encrypted: i=1; AJvYcCX4j4XYkiLTCfFPiB9tu2caVKmSwyV68B1G1MIRLiog3vru3P2Kw4FUCVTsMjxRAtf8WtU2@lists.linux.dev
X-Gm-Message-State: AOJu0YwuDIfjgK/xd+y5EaLBhx2OHYzJx1183FNDFMyiQU8bejrzvafe
	PhLQd5I0rell7x7+YICPpC8RyIZp9ejbxttB3RaOf2Az4g+pRPp/
X-Gm-Gg: ASbGncv9OptAo/usSaaPmlOkpiWj9KIO3X1e7L4NTpp6smynKdaYt8x05VjTxQoxC9q
	m6q7G9dUrNDjy8VPGn6GgY/QKJ6oSNEYqW+ENUU89umfSzjbaX1+SFpY5W1+td0+VAW2NzfnSP+
	fzI1ON/mTWriLhfyptcyxr5qSRkOsZV1CB/OqcSM7uPvhHM0d++Vjz9Kf1uYbn6H3UvvvWTzezl
	yxXoXICTdIr/hKYHdg4L8x+ffgUY7IHW2Ax72AwCZ/PUQ2CxGakCh+KTTHRS5jd734XcIi0JUOQ
	BzFo1asmeMgxoWe7TDRMbvN0LU6M9qe9u0n2hWg=
X-Google-Smtp-Source: AGHT+IHnyP/lG7e9Gb+RWekvJAvxRIKIlVbkfvcf+0TPVjM7e8MKuRrz5aPODf9+w4RcEhWogWlIhA==
X-Received: by 2002:a05:6000:2502:b0:3a0:aed9:e39 with SMTP id ffacd0b85a97d-3a1f646c6e3mr5519558f8f.28.1746869585084;
        Sat, 10 May 2025 02:33:05 -0700 (PDT)
Received: from [10.0.1.56] ([2001:871:22a:99c5::1ad1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddde0sm5981485f8f.14.2025.05.10.02.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 02:33:04 -0700 (PDT)
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Subject: [PATCH v3 0/3] rust: add `UnsafePinned` type
Date: Sat, 10 May 2025 11:32:25 +0200
Message-Id: <20250510-rust_unsafe_pinned-v3-0-57ce151123f9@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACkdH2gC/32PQQ6DIBBFr2JYlwYQK3bVezSNITAoSUULStoY7
 160Xbhounwz+W/+zCiAtxDQOZuRh2iD7V2C/JAh1UrXALY6MWKEFYRTgf0UxnpyQRqoB+scaCw
 qqhWwMq01SsHBg7HPTXq9JW5tGHv/2m5Euk7/6iLFFCuuyqIQeVUZcWk6ae9H1Xdo1UW2U+Tkp
 4Jhgo0SJ1rKkhPG94rlU9HDY0rvjt+ey/IGjbyv7gwBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746869583; l=1940;
 i=chrisi.schrefl@gmail.com; s=20250119; h=from:subject:message-id;
 bh=d/Q2dqkM3hGIa7pRJKatBlt0uQwkDzQUldsLHN8FByw=;
 b=fNIBzCK2rGyd0yhyM0HMpRMGdhkLEIhOldzeweIjdz3SN+t28c+wI5mzpIAbYaJpghqDYUfAh
 R7+Mt6jIIYDCc7DYjz6ZSlOkGo3rZKoTob44KU4i16mJdT30+95EDrq
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
 rust/kernel/types/unsafe_pinned.rs | 113 +++++++++++++++++++++++++++++++++++++
 3 files changed, 140 insertions(+), 20 deletions(-)
---
base-commit: 9de1a293c8ece00d226b21a35751ec178be2a9fa
change-id: 20250418-rust_unsafe_pinned-891dce27418d

Best regards,
-- 
Christian Schrefl <chrisi.schrefl@gmail.com>

