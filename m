Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DEA241693
	for <llvm@lists.linux.dev>; Mon, 17 Mar 2025 15:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742225417; cv=none; b=UXkpVcfKkxZay0aRuxRxczD6I5MVWLo76pfVtI7EU6zYhEFV8RCfDpzpRO1WGt/kUMG99PaGYS/1JYDGV/yAavtHt0GGfo2CiQ5qI7mforuSPZoxKdvr1M5iJ0X2CXQZ3g609fHr8DKIQqP87ljIbvLkWPqGx496G4qkLQLfQzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742225417; c=relaxed/simple;
	bh=RmOfo764WtO4PPZFDYSz67TtQVy6busHNjQ/gySH6kk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AblNPq3xiWwTL62tJINd9fSLpw0U6oLibg1o5WQOB1KjY1f3Lqrzrv33E/mblor8z5E+axvRb2jCDPYn7esR1OiX8L7mVhNXxey2R9LamT7mWJXDijJhs5uzN74j5beB8YtIF5Dvg0PXSPaxAWP6Gihm5qBRgqE5si3dt1d8/Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HHz+bQ97; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HHz+bQ97"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6dd01781b56so60681686d6.0
        for <llvm@lists.linux.dev>; Mon, 17 Mar 2025 08:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742225414; x=1742830214; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5VnHac+67NezyG9Z5kQPIahJscKgGgBzlwii56QtL5I=;
        b=HHz+bQ97WdpR3JtRGM/cDOoFbVP9hRgqdRokKcMyDreW29/NGQmpYiovieFj9A0F0C
         3uXfZYTZ7nYyBncUfFcpzysbMdRkeOl4HRK5AmG7nF8g+sd8pXkx0ukB5d098e4G7NQa
         GIP6dUP07iCCTDeOiLkOPNZLBZSM2SiRqPd5OeqX74VzmF9xK0TVFZxn2AKBfCD/d2d1
         jTVOt/fIHMOAums+/j44pu7YAfQP5/qmX1zR+PULAwj4dx39WngyLf2GgWjFUnsbosQ1
         EKnwnCu7U8KCvvr7xLbjbqYahT1Q9Tfo+/9WnodocCUXcplnTVD2c6oY6wpJXLN9kpIp
         EGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742225414; x=1742830214;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5VnHac+67NezyG9Z5kQPIahJscKgGgBzlwii56QtL5I=;
        b=UqdvAxDXhib3TkvsudIp/ohJj4oYBZFLbKGxvmOoXyZ/pS6f/fQFOg170w7UsEtI5x
         u2VfRHP9K0CDPl2lAUDkFdzah4ummvVindWICHVxpNTjs1JpQUka1TSgmfCqXkdVdTds
         sB2rwa8+tk1hRkKbU1E6PXI+Bd0EbdubJ1wU+/r/Oa6baApw0QpHOFGxQcdiGMHjZgKP
         a8tUU1VqEu5NT4jI3AIMWkC3J5oO/KMhyc2YxbopBckhTDkFQzHoBkF28k9b7iEQ9Gs8
         btCHQMMPRRMatwP9kmhybPU4EVHELjbO+tb4fZaEyRkVInTYlafxhll+ZdxUUkLKKGYQ
         gm8A==
X-Forwarded-Encrypted: i=1; AJvYcCV3yymqUwLOQNh9P6EHWtJrvtgjOV5/irIicmAtF7Sbq994N9lT7/PVR+7XVNt7xr/9pDYM@lists.linux.dev
X-Gm-Message-State: AOJu0YzhBjiczlELyR1x2NEMAhkjeAQkmDbx0HLrrN2X8RYN/hBNfAo+
	Fl/dDm1NG7Irx1sCsTTi6nB47APOdx6XYCVUe8EfiMl2R3rwEq3K
X-Gm-Gg: ASbGncvc2zF0mKXCQPjnoigCKFmFKe4py2g0mDC5bGoJ8FMCCUsKK7/kNlbE1ePpyWI
	PZmpAtKo1QnU5OU84/cZMk1R59cAqqlKKQ/g6wGAQkGTrrfXNa0r9K0nmydfeCAOvoFny2rYao+
	ScoRxxaVf/tNJMdyoKVzkaASeFI8SvNzlnWEj7zPeM2G6Lh1L+KhF1jIIumG4WRfpVtwLKl2lBe
	QcgD35cCnTY/sP5zJLLQUkfyi0PuefDnNFBTpUyrRLDXDGa5qxe4P6tP6u/Cy3tyeamU1Uonak0
	OVHGv5iD14gka9/j5WF9iVq+lcZKMx4EsJZi2q2WXhQvcgdhea1uCp4tN9yRpETwYQOU/YNG1T1
	WT2z1E08rjqmqSgmL
X-Google-Smtp-Source: AGHT+IHNmtB9c12zhL5/E0oWznPUv4bUb/VjSZ9loMwleCwsOPZRUcNYkvDBkshuzLWydzExi8biFQ==
X-Received: by 2002:ad4:5f46:0:b0:6d4:238e:35b0 with SMTP id 6a1803df08f44-6eaea9fac05mr181158406d6.17.1742225414336;
        Mon, 17 Mar 2025 08:30:14 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([2600:4041:5be7:7c00:6895:24c6:e898:e320])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eade34c51fsm55736766d6.109.2025.03.17.08.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 08:30:13 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH v9 0/4] rust: replace kernel::str::CStr w/ core::ffi::CStr
Date: Mon, 17 Mar 2025 11:30:02 -0400
Message-Id: <20250317-cstr-core-v9-0-51d6cc522f62@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPo/2GcC/3WOzWrDMBAGXyXoXAVJtternPIeJQdZP7FobYWVE
 Q3B7x45kGIKPX7szjAPlj1Fn9np8GDkS8wxzXXojwOzo5mvnkdXN1NCdUIJyW1eiNtEnrt20AN
 oqYQNrP7fyIf483J9XuoOlCa+jOTN29AKlFp2DXRwVIii54oX4xKlkr/u5xulJc2Tid9Hm6ZNO
 ca8JLq/6gps4neI2oUU4IJjC9o6cEoHd77+SraQ0v9L9pV0RmI9KdE2+JfEPdnsSaykHZqgwPc
 ICHtyXdcnyCWNaVkBAAA=
X-Change-ID: 20250201-cstr-core-d4b9b69120cf
To: Michal Rostecki <vadorovsky@protonmail.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, 
 Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@google.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, llvm@lists.linux.dev, linux-pci@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

This picks up from Michal Rostecki's work[0]. Per Michal's guidance I
have omitted Co-authored tags, as the end result is quite different.

Link: https://lore.kernel.org/rust-for-linux/20240819153656.28807-2-vadorovsky@protonmail.com/t/#u [0]
Closes: https://github.com/Rust-for-Linux/linux/issues/1075

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
Changes in v9:
- Rebase on rust-next.
- Restore `impl Display for BStr` which exists upstream[1].
- Link: https://doc.rust-lang.org/nightly/std/bstr/struct.ByteStr.html#impl-Display-for-ByteStr [1]
- Link to v8: https://lore.kernel.org/r/20250203-cstr-core-v8-0-cb3f26e78686@gmail.com

Changes in v8:
- Move `{from,as}_char_ptr` back to `CStrExt`. This reduces the diff
  some.
- Restore `from_bytes_with_nul_unchecked_mut`, `to_cstring`.
- Link to v7: https://lore.kernel.org/r/20250202-cstr-core-v7-0-da1802520438@gmail.com

Changes in v7:
- Rebased on mainline.
- Restore functionality added in commit a321f3ad0a5d ("rust: str: add
  {make,to}_{upper,lower}case() to CString").
- Used `diff.algorithm patience` to improve diff readability.
- Link to v6: https://lore.kernel.org/r/20250202-cstr-core-v6-0-8469cd6d29fd@gmail.com

Changes in v6:
- Split the work into several commits for ease of review.
- Restore `{from,as}_char_ptr` to allow building on ARM (see commit
  message).
- Add `CStrExt` to `kernel::prelude`. (Alice Ryhl)
- Remove `CStrExt::from_bytes_with_nul_unchecked_mut` and restore
  `DerefMut for CString`. (Alice Ryhl)
- Rename and hide `kernel::c_str!` to encourage use of C-String
  literals.
- Drop implementation and invocation changes in kunit.rs. (Trevor Gross)
- Drop docs on `Display` impl. (Trevor Gross)
- Rewrite docs in the style of the standard library.
- Restore the `test_cstr_debug` unit tests to demonstrate that the
  implementation has changed.

Changes in v5:
- Keep the `test_cstr_display*` unit tests.

Changes in v4:
- Provide the `CStrExt` trait with `display()` method, which returns a
   `CStrDisplay` wrapper with `Display` implementation. This addresses
   the lack of `Display` implementation for `core::ffi::CStr`.
- Provide `from_bytes_with_nul_unchecked_mut()` method in `CStrExt`,
   which might be useful and is going to prevent manual, unsafe casts.
- Fix a typo (s/preffered/prefered/).

Changes in v3:
- Fix the commit message.
- Remove redundant braces in `use`, when only one item is imported.

Changes in v2:
- Do not remove `c_str` macro. While it's preferred to use C-string
   literals, there are two cases where `c_str` is helpful:
   - When working with macros, which already return a Rust string literal
     (e.g. `stringify!`).
   - When building macros, where we want to take a Rust string literal as an
     argument (for caller's convenience), but still use it as a C-string
     internally.
- Use Rust literals as arguments in macros (`new_mutex`, `new_condvar`,
   `new_mutex`). Use the `c_str` macro to convert these literals to C-string
   literals.
- Use `c_str` in kunit.rs for converting the output of `stringify!` to a
   `CStr`.
- Remove `DerefMut` implementation for `CString`.

---
Tamir Duberstein (4):
      rust: move `CStr`'s `Display` to helper struct
      rust: replace `CStr` with `core::ffi::CStr`
      rust: replace `kernel::c_str!` with C-Strings
      rust: remove core::ffi::CStr reexport

 drivers/gpu/drm/drm_panic_qr.rs      |   6 +-
 drivers/net/phy/ax88796b_rust.rs     |   8 +-
 drivers/net/phy/qt2025.rs            |   6 +-
 rust/kernel/device.rs                |   7 +-
 rust/kernel/devres.rs                |   2 +-
 rust/kernel/driver.rs                |   4 +-
 rust/kernel/error.rs                 |  10 +-
 rust/kernel/faux.rs                  |   5 +-
 rust/kernel/firmware.rs              |   8 +-
 rust/kernel/kunit.rs                 |  18 +-
 rust/kernel/lib.rs                   |   2 +-
 rust/kernel/miscdevice.rs            |   5 +-
 rust/kernel/net/phy.rs               |  12 +-
 rust/kernel/of.rs                    |   5 +-
 rust/kernel/pci.rs                   |   3 +-
 rust/kernel/platform.rs              |   7 +-
 rust/kernel/prelude.rs               |   2 +-
 rust/kernel/seq_file.rs              |   4 +-
 rust/kernel/str.rs                   | 499 +++++++++++++----------------------
 rust/kernel/sync.rs                  |   4 +-
 rust/kernel/sync/condvar.rs          |   3 +-
 rust/kernel/sync/lock.rs             |   4 +-
 rust/kernel/sync/lock/global.rs      |   6 +-
 rust/kernel/sync/poll.rs             |   1 +
 rust/kernel/workqueue.rs             |   1 +
 rust/macros/module.rs                |   2 +-
 samples/rust/rust_driver_faux.rs     |   4 +-
 samples/rust/rust_driver_pci.rs      |   4 +-
 samples/rust/rust_driver_platform.rs |   4 +-
 samples/rust/rust_misc_device.rs     |   3 +-
 30 files changed, 256 insertions(+), 393 deletions(-)
---
base-commit: 433b1bd6e0a98938105c43c0553f24e0747ef52c
change-id: 20250201-cstr-core-d4b9b69120cf

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>

