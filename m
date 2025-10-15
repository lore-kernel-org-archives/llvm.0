Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CCE303A08
	for <llvm@lists.linux.dev>; Wed, 15 Oct 2025 19:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760556303; cv=none; b=pwyLnfdt6JOq5GluqUov79gmsJv17yGnLG6mxwzppGgbz/Ts/g2CiiaXVsa0CreOcq7WfEWCa7oJQ+1eEsgbFmmhvuUQrvwaENdUXrgiD2HzC3xA/onkuJKFuD7I99swHEphlI8WjacKm1yh8fzKiCKVso6plpDCjxIW99Am5mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760556303; c=relaxed/simple;
	bh=dsIF3t/nnF2C1bkVy27zCbkLX0XWi/NLecWE562yUuI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jLX7BwxouJT/FFhff7jid/PKjHWW5tjEh98WkoRG4gf8XF+CDMgUI2XZd7Qrpfoa0JDJV8oN7n4RqaDnAJiBjzu++8XwEAp8pzl7sJ1PL/KY7CKbfEKJuKO8CdYz4F1kg4duY8w9zjMzLLNEjscME3SkDL8g5xkRxpfXQQKmOBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B1WOIOLf; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B1WOIOLf"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-88f26db50b4so47516085a.2
        for <llvm@lists.linux.dev>; Wed, 15 Oct 2025 12:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760556299; x=1761161099; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qsqkSof1+GgJ3rfKHvxdreoyI9Vm3blU+Mome4LxMgc=;
        b=B1WOIOLf6DgHG6G6km+jVnbqeoTS/OZTvVc99dobqWoJofInTEyLIdZFA3LFg7qM+F
         3SFnNHTMWwiKy3GsQWAfUbnLvy016s6scFWpGVA8IRQYYl3w8M8EoTut1y7581yR4+nn
         xcjwdp4QZAv3dooMxRQULIWD1DOks39/cZCS7rznFm7v6SvNOM8EbTpc0M3R7XeYahRJ
         ooLSvmwi9HnOm2LziL+yod/gUQaf/eOOVMc/aUJikerXUrYdgZK8fljng6TQYAPTA4RW
         l2kOMIfprw4BTwsI2ijgQA99gV/1YFxDq8BG3gNcJi+xSlaeaAQi31E0Hy7TZL90GjEy
         hRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760556299; x=1761161099;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qsqkSof1+GgJ3rfKHvxdreoyI9Vm3blU+Mome4LxMgc=;
        b=CNEHQi8FpFT8xiGeDYnBXrCEmeJViBfgN1UQg9u40oHLvDEJEEZjUG3TtjemdsnqsG
         Eupg37++KjLLWisglCeyJBGXA8PtXRFT1y+pcso899Za0PN2dR2FHxlgvaGMDy8gBVGf
         urhGrn5zJpuekipQAh/2OmJqxKlF4dcQI60gJ6D76NoJJnD5uIKX4/AKqpXGLgcx/eNv
         7noozLDU7kVOdOy51/yWNGmkphh1ODbpTRA7slROsEd20P5+5wGKzWiZCEGa/kWrjEJL
         vpcfrdvQm0vBZ5aWOnqV9HzaBw7UR2/9urWCTABTQfnFoFUh9IV/DAm4ybaY6OXuBoFB
         KHCg==
X-Forwarded-Encrypted: i=1; AJvYcCXF/YWPnMkXnFzdqX+HykY4NTrr9qYgtOeYLfcolxixxBlkrajW04xAZmOtFstPrp1lNZx1@lists.linux.dev
X-Gm-Message-State: AOJu0Ywp6nmZsSakM8fSSKr8Cqq4RabyrB8Jzff57ai7bb7JKQTibM4H
	cFy1PSLI8xWHWV7QMj3qRBbk+vVq9vXTUwLwd/Cgc0jygXdsIcxOTVHQ
X-Gm-Gg: ASbGncvR03xrZfHh7u6hJX9AQQQjfNxPIV+k/pyHqJGY3ZyaqQGUUSnJpD10xIkX9U3
	XAE9lrJW8x06ic6ldSPR721E+/cIXbFNf2z9J4fqalOPGmMWrtrbXwrCc7f3ZlV6pPGmgsOoiTt
	/qMsMxIgm6MtL3PESm1ONHOB7peEAi6XDKz5IrfcykTkqZ+uGsABS3akIUTgmGHmSF1dyIWn0CX
	P3YOO+QZ9nJHTSsGZV8+hi0meyBHF7gTwQP16usp6HwXPGarxEpjYYdu5XI7jhn6tuPTB2xkuGF
	VvDfrA8ydtOL/X+dKFq2K2eEzMAfbnRQ95V41eWxRXJIgcT8euw+hTDRs8ZNiKUMBst74xGIlLi
	ttYYWLamPPjmFff4BZJ0Cc7jZDjmeF7pSgWiFqMjNzGRhvFV6bm0+JaN2YGv/yXJUX+Ykz4r1EH
	LJ5RmQ5RUfiitMYsr7fi2vSAw/1P4EhgjJUcFki5ok/RI5GIa/swAKl84jrkJl9a8+tgNJLDYqu
	cMl9o0iEVlMIXyDJVD5UqSqA7GK
X-Google-Smtp-Source: AGHT+IFENDCESZIeyXPxXyt4zOHnX3/g8IbwHOjGHEmNqkJneLQxgjyuuUuUXXHHdjz1c1DMClMpIQ==
X-Received: by 2002:a05:622a:1b91:b0:4e8:8d97:ccad with SMTP id d75a77b69052e-4e88d97e80bmr30946781cf.78.1760556298953;
        Wed, 15 Oct 2025 12:24:58 -0700 (PDT)
Received: from 136.1.168.192.in-addr.arpa ([2600:4808:6353:5c00:8573:f4c5:e7a9:9cd9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c012b165asm24076996d6.59.2025.10.15.12.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 12:24:58 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH v17 00/11] rust: replace kernel::str::CStr w/
 core::ffi::CStr
Date: Wed, 15 Oct 2025 15:24:30 -0400
Message-Id: <20251015-cstr-core-v17-0-dc5e7aec870d@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO7072gC/3XTzU7kMAwH8FdBPW+Q7XxzmvdAHFInZardmUBaK
 kZo3p0Ulm071R7T5Of8FbsfzZBKn4bm4e6jKWnqhz6f6wLtr7uGj+H8nEQf64eGgDQQoOBhLIJ
 zSSKq1rfGIwF3TT3/UlLXv38Ve3yq667kkxiPJYWfCgocetTSaHNPzoEVJKYQc8nT8PtyeCl5z
 OdT6P/ccz7NJY/9MOZy+Yo3mbnwTxBaBZmMAOGU8RxNJN/Fw/O/InOQyf5X2ipjQFe3CJR0t9K
 tpVxLVyW3siOTrDPO3Eq/SIl2LX2VGqNh1kSdoVuJsFBNak0RqjUKKXgVfbR6Z3FlJWwszomjZ
 +CWWw/7e2mxBv3G0vzCwJ5tq7QH2Fm5WLuZkrpVbe2KjTK13obdS6FaWdxmVnPmYBNwcMRun1k
 v1uGmQahnayVFTyQ7lXZ2NVCe9MbOE6U51gYrC4k3916/Z72k17f6v4x/B/56/QRuXJsJTQMAA
 A==
X-Change-ID: 20250201-cstr-core-d4b9b69120cf
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Christian Brauner <brauner@kernel.org>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Carlos Llamas <cmllamas@google.com>, 
 Suren Baghdasaryan <surenb@google.com>, Jens Axboe <axboe@kernel.dk>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Uladzislau Rezki <urezki@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1760556294; l=8195;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=dsIF3t/nnF2C1bkVy27zCbkLX0XWi/NLecWE562yUuI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLbq7swEl/niXuoW+wz3Le/PnExng+T5Ufr5D9O8K6KvriHyGINmOEmh8dDVyOUfqjk4uommS1e
 rfnmleVHocgM=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

This picks up from Michal Rostecki's work[0]. Per Michal's guidance I
have omitted Co-authored tags, as the end result is quite different.

This series is intended to be taken through rust-next. The final patch
in the series requires some other subsystems' `Acked-by`s:
- drivers/android/binder/stats.rs: rust_binder. Alice, could you take a
  look?
- rust/kernel/device.rs: driver-core. Already acked by gregkh.
- rust/kernel/firmware.rs: driver-core. Danilo, could you take a look?
- rust/kernel/seq_file.rs: vfs. Christian, could you take a look?
- rust/kernel/sync/*: locking-core. Boqun, could you take a look?

Link: https://lore.kernel.org/rust-for-linux/20240819153656.28807-2-vadorovsky@protonmail.com/t/#u [0]
Closes: https://github.com/Rust-for-Linux/linux/issues/1075

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
Changes in v17:
- Rebase on rust-next and fix backsliding relative to series 2a and 2b.
- Link to v16: https://lore.kernel.org/r/20250925-cstr-core-v16-0-5cdcb3470ec2@gmail.com

Changes in v16:
- Rebase on rust-next.
- Link to v15: https://lore.kernel.org/r/20250813-cstr-core-v15-0-c732d9223f4e@gmail.com

Changes in v15:
- Seal `CStrExt`. (Benno Lossin)
- Add patch to remove trailing commas from
  samples/rust/rust_driver_platform.rs.
- Link to v14: https://lore.kernel.org/r/20250710-cstr-core-v14-0-ca7e0ca82c82@gmail.com

Changes in v14:
- Break the change into multiple series.
- Move `CStr` reexport to `kernel::ffi`. (Alice Ryhl)
- `pub use core::fmt::{....}` in `kernel/fmt.rs`. (Benno Lossin)
- Avoid unnecessary binding to `first_lit` in `fmt!`. (Benno Lossin)
- Add comment to `identifier`-extracting loop. (Benno Lossin)
- Change `quote_spanned!` formatting. (Benno Lossin)
- Link to v13: https://lore.kernel.org/r/20250701-cstr-core-v13-0-29f7d3eb97a6@gmail.com

Changes in v13:
- Rebase on v6.16-rc4.
- Link to v12: https://lore.kernel.org/r/20250619-cstr-core-v12-0-80c9c7b45900@gmail.com

Changes in v12:
- Introduce `kernel::fmt::Display` to allow implementations on foreign
  types.
- Tidy up doc comment on `str_to_cstr`. (Alice Ryhl).
- Link to v11: https://lore.kernel.org/r/20250530-cstr-core-v11-0-cd9c0cbcb902@gmail.com

Changes in v11:
- Use `quote_spanned!` to avoid `use<'a, T>` and generally reduce manual
  token construction.
- Add a commit to simplify `quote_spanned!`.
- Drop first commit in favor of
  https://lore.kernel.org/rust-for-linux/20240906164448.2268368-1-paddymills@proton.me/.
  (Miguel Ojeda)
- Correctly handle expressions such as `pr_info!("{a}", a = a = a)`.
  (Benno Lossin)
- Avoid dealing with `}}` escapes, which is not needed. (Benno Lossin)
- Revert some unnecessary changes. (Benno Lossin)
- Rename `c_str_avoid_literals!` to `str_to_cstr!`. (Benno Lossin &
  Alice Ryhl).
- Link to v10: https://lore.kernel.org/r/20250524-cstr-core-v10-0-6412a94d9d75@gmail.com

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
Tamir Duberstein (11):
      samples: rust: platform: remove trailing commas
      rust_binder: remove trailing comma
      rust_binder: use `kernel::fmt`
      rust_binder: use `core::ffi::CStr` method names
      rnull: use `kernel::fmt`
      rust: alloc: use `kernel::fmt`
      rust: debugfs: use `kernel::fmt`
      rust: pci: use `kernel::fmt`
      rust: remove spurious `use core::fmt::Debug`
      rust: support formatting of foreign types
      rust: replace `CStr` with `core::ffi::CStr`

 drivers/android/binder/error.rs          |   5 +-
 drivers/android/binder/process.rs        |   2 +-
 drivers/android/binder/stats.rs          |   6 +-
 drivers/block/rnull/configfs.rs          |   9 +-
 rust/ffi.rs                              |   2 +
 rust/kernel/alloc/kvec/errors.rs         |  14 +-
 rust/kernel/debugfs.rs                   |   2 +-
 rust/kernel/debugfs/callback_adapters.rs |   7 +-
 rust/kernel/debugfs/file_ops.rs          |   6 +-
 rust/kernel/debugfs/traits.rs            |  10 +-
 rust/kernel/device.rs                    |   1 +
 rust/kernel/error.rs                     |   2 +
 rust/kernel/firmware.rs                  |   9 +-
 rust/kernel/fmt.rs                       |  87 ++++++-
 rust/kernel/pci/id.rs                    |   3 +-
 rust/kernel/prelude.rs                   |   7 +-
 rust/kernel/ptr.rs                       |   1 -
 rust/kernel/seq_file.rs                  |   2 +-
 rust/kernel/str.rs                       | 395 +++++++------------------------
 rust/kernel/sync/condvar.rs              |   2 +-
 rust/kernel/sync/lock.rs                 |   2 +-
 rust/kernel/sync/lock/global.rs          |   2 +-
 rust/macros/fmt.rs                       |  94 ++++++++
 rust/macros/lib.rs                       |  19 ++
 rust/macros/quote.rs                     |   7 +
 samples/rust/rust_driver_platform.rs     |   4 +-
 26 files changed, 350 insertions(+), 350 deletions(-)
---
base-commit: 9b332cece987ee1790b2ed4c989e28162fa47860
change-id: 20250201-cstr-core-d4b9b69120cf

Best regards,
--  
Tamir Duberstein <tamird@gmail.com>

