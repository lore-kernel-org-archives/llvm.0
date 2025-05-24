Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F33275866
	for <llvm@lists.linux.dev>; Sat, 24 May 2025 20:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748118812; cv=none; b=jBxI9C3+qe04FkFcbRvqZFob06BruWULk5d7U8Xp0C8PqMU1WjGb8M65McaT0/N059RRBMn9AE2cwrT18cLP0RnNisYGIyB9W486ZqqPYfodvWguGlN9GW17XqyvbUmxyKXuJ8LON3Zioz+z09CQIJV3MJSuFuVDc4p2zRV7wkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748118812; c=relaxed/simple;
	bh=y/agLfL8cvRLwjOLQ2FmgleRZcO69KtrQd6QQg0+Gcs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DNwVvU6UdOdNu/kEUDYN3eUdj3Oefya3ESccAX8CvM4fnX3xpaAfurQas+Wqx0E/va8NFyyNzYTNLREiObFvTm1KgkFcf5Nu34HHC/xSuwLxatP+LE25HMJabQy/5j1cr35yrJvHK/QqGzJy2bTUMc8pw0+h2QBHjl2gWsFOcB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mehii2Qh; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mehii2Qh"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3dc6dbb3d58so9064805ab.3
        for <llvm@lists.linux.dev>; Sat, 24 May 2025 13:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748118810; x=1748723610; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gDpP7s7cOkPavUulBU3Ba+a6zZqUiVMm4fW37bEOlm0=;
        b=mehii2QhMb/LyLL+Sh1bQeIsy9jnvEkRxCxpiLniIs8/57Lz4oHUZISgiIroMSukcn
         lbvXZDC9KnNttR6fHWr/w0HAE3PA3QGHAtQDlJNtuFSgFBgQWJDlSQ6rIxda3OVg60I7
         6eWN3rmX/DlnytUeeGrk8jUbbod6u+kD4lNyRYdDy+xhtSDuExoVg0Y4RJPL08pqZA3E
         y6dAACN8aIgAuoeXrPqSUW6jhODoqBOonq/aW8WIs71WNAZANmSiofZm5BqJbvCLX9jN
         XKhp54W/Mc4K91B04Z+guOvsULOPDZJf7Sf/0TDS6F0W4RCz4s4GZZblaOGX+nC/L/60
         +qxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748118810; x=1748723610;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gDpP7s7cOkPavUulBU3Ba+a6zZqUiVMm4fW37bEOlm0=;
        b=BpunUKhlmASa/pvw6az+cEkTec8X4VWPp8d/eBsISZ3M1IewDKt/1bGf5AB5HON54l
         dNRRVMNx3KM8u+anU9+N9kRHXMuVrGZv4kEnqb8LlPgDhdYkLzxW7bfZ3aCb0QgAlRgD
         5OsXvVGChRy3PhgQ7GlONjQi2fpKREkjjhShnrZFDq35QEvkYaTiAKBjDCetmzZKIyuY
         BZrizhSkkawimeyGTR5mfJvfq90Fb3TdE9xGW627mxqdSvo3Mqpam+xeN3gdnVKNerCP
         bIBqth3xblukwyxPOrfU7a00YuSOeyP5GfsY9JI+afCUd3Qz2j17wQayyhJCAyWEb7wa
         l6wQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/3KFv9pHeKSoJrx81QfWXo5GiliPYfIAq293/gKXE0ol7Jp2HeoUiqWeFJ8hR0Q6g2FM9@lists.linux.dev
X-Gm-Message-State: AOJu0Yxp9AItHIa7zXxwdNXwf0yGIPEqRMbD9mgxsO9qkCWxkOL1zfGh
	L43FqcoNFWNA5zF636VpfQgSprS/wd3pfNNWjRRkMBfz9O0OwsOEdgIKjRgGYP9szmo=
X-Gm-Gg: ASbGncvBoT4k0y1j42dYr2Xb+HdzS7RDVZ/JQ0grDvzaIlzg36gr2+uwmdixxJwSyE7
	d6j7QV444jVM//40vKCyw938DlCH+RIP1svbdnI0iqb1Fq1fb8pmXglE0STOi8tjDLlCCBIZQkh
	AGIL5GHt2bbE4xE6JaC6iPlYSQtTmauDYaWCrgXMUIkKFbcsljhK09Tm+9DRhcXHbNd91iCcJm1
	DvwJpmMblHDYL8lYlbRgN/HxPYl1oT8REQpYIfUToO0GRv0Wh2naZRSwclNChLBihcHW3wW/d7k
	p03xi6hPhY6FFqiDMD78nzPXYcmdcXdXxHb6ajOoJO60CpOouXNlKosC5xX0X9QwQXeigJsWFRc
	5ee85WiGDLSHz1Vnt4teRnhLlvXyadrjsOqjSn7pirBJ/5cNUHDJPlNvJucy6WR5XnnoQy5aOZB
	iZBAs=
X-Google-Smtp-Source: AGHT+IEY1bus7pYi5JcXesXRddo5ekO8LWT2IX5dDBSF4gjuh1ID95e7jx0zQU9fIvHGHwyslvJU7A==
X-Received: by 2002:a05:620a:44c2:b0:7c3:cd78:df43 with SMTP id af79cd13be357-7ceecc45f6amr602236985a.58.1748118799405;
        Sat, 24 May 2025 13:33:19 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2600:4041:5be7:7c00:8563:e370:791f:7436])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467d7fd1sm1379590085a.29.2025.05.24.13.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 13:33:17 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH v10 0/5] rust: replace kernel::str::CStr w/ core::ffi::CStr
Date: Sat, 24 May 2025 16:33:00 -0400
Message-Id: <20250524-cstr-core-v10-0-6412a94d9d75@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPwsMmgC/3XOy27DIBAF0F+JWJcIxvYAWeU/qi4wjxi1NhFYq
 FHkfy+OlBZF6nIe5+reSXYpuExOhztJroQc4lIHzt4OxEx6uTgabF0QYDAwYJyavCZqYnLU9qM
 aUXFgxpP6f03Oh+9H2PtHnX2KM12n5PQzoWeSKz50OOARpGSCAi3axhRL/rydrymucZl1+DqaO
 O+RU8hrTLdHvYJ78LMINEUKUkZlj8pYtKC8PV9+Q/YiRfwrRZVWc1lPwPpOvkrZyq6Vskozdh7
 QCYkSX6X6kx0XrVRVDtyiMQOAR2jltm0/fH5cIZQBAAA=
X-Change-ID: 20250201-cstr-core-d4b9b69120cf
To: Michal Rostecki <vadorovsky@protonmail.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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
 Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, 
 Jens Axboe <axboe@kernel.dk>, Benno Lossin <lossin@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Benno Lossin <lossin@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, llvm@lists.linux.dev, linux-pci@vger.kernel.org, 
 nouveau@lists.freedesktop.org, linux-block@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

This picks up from Michal Rostecki's work[0]. Per Michal's guidance I
have omitted Co-authored tags, as the end result is quite different.

Link: https://lore.kernel.org/rust-for-linux/20240819153656.28807-2-vadorovsky@protonmail.com/t/#u [0]
Closes: https://github.com/Rust-for-Linux/linux/issues/1075

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
Changes in v10:
- Rebase on cbeaa41dfe26b72639141e87183cb23e00d4b0dd.
- Implement Alice's suggestion to use a proc macro to work around orphan
  rules otherwise preventing `core::ffi::CStr` to be directly printed
  with `{}`.
- Link to v9: https://lore.kernel.org/r/20250317-cstr-core-v9-0-51d6cc522f62@gmail.com

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
Tamir Duberstein (5):
      rust: retitle "Example" section as "Examples"
      rust: support formatting of foreign types
      rust: replace `CStr` with `core::ffi::CStr`
      rust: replace `kernel::c_str!` with C-Strings
      rust: remove core::ffi::CStr reexport

 drivers/block/rnull.rs               |   2 +-
 drivers/gpu/drm/drm_panic_qr.rs      |   5 +-
 drivers/gpu/nova-core/driver.rs      |   2 +-
 drivers/gpu/nova-core/firmware.rs    |   2 +-
 drivers/net/phy/ax88796b_rust.rs     |   8 +-
 drivers/net/phy/qt2025.rs            |   6 +-
 rust/kernel/block/mq.rs              |   2 +-
 rust/kernel/device.rs                |   9 +-
 rust/kernel/devres.rs                |   2 +-
 rust/kernel/driver.rs                |   4 +-
 rust/kernel/error.rs                 |  10 +-
 rust/kernel/faux.rs                  |   5 +-
 rust/kernel/firmware.rs              |  16 +-
 rust/kernel/fmt.rs                   |  77 +++++++
 rust/kernel/kunit.rs                 |  21 +-
 rust/kernel/lib.rs                   |   3 +-
 rust/kernel/miscdevice.rs            |   5 +-
 rust/kernel/net/phy.rs               |  12 +-
 rust/kernel/of.rs                    |   5 +-
 rust/kernel/pci.rs                   |   2 +-
 rust/kernel/platform.rs              |   6 +-
 rust/kernel/prelude.rs               |   5 +-
 rust/kernel/print.rs                 |   4 +-
 rust/kernel/seq_file.rs              |   6 +-
 rust/kernel/str.rs                   | 415 ++++++++++-------------------------
 rust/kernel/sync.rs                  |   7 +-
 rust/kernel/sync/condvar.rs          |   4 +-
 rust/kernel/sync/lock.rs             |   4 +-
 rust/kernel/sync/lock/global.rs      |   6 +-
 rust/kernel/sync/poll.rs             |   1 +
 rust/kernel/workqueue.rs             |   1 +
 rust/macros/fmt.rs                   | 118 ++++++++++
 rust/macros/kunit.rs                 |   6 +-
 rust/macros/lib.rs                   |  21 +-
 rust/macros/module.rs                |   2 +-
 samples/rust/rust_driver_faux.rs     |   4 +-
 samples/rust/rust_driver_pci.rs      |   4 +-
 samples/rust/rust_driver_platform.rs |   4 +-
 samples/rust/rust_misc_device.rs     |   3 +-
 scripts/rustdoc_test_gen.rs          |   2 +-
 40 files changed, 426 insertions(+), 395 deletions(-)
---
base-commit: cbeaa41dfe26b72639141e87183cb23e00d4b0dd
change-id: 20250201-cstr-core-d4b9b69120cf

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>

