Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F047A336ED1
	for <llvm@lists.linux.dev>; Tue,  3 Feb 2026 11:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770118469; cv=none; b=iNplwEpknfIXCpeNnJXkiOI3Zl1Y4c6ei+Zpxzeb70ve0xR4gAwKrw7TGv7+ZDZfao5ity1ABr6mQ6lFy2OU5YM2hPbB42gUonkpwx2piKpmfD+BhQIahmHDMJemDwUDenjORaVMeRFnAfRW2asTNR8BXi7NS6tLd/mZTeVQOpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770118469; c=relaxed/simple;
	bh=ArCa741Tr0ZegW0iFyhR+FgMhtwZFXdT5kD1PX345c8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hzUte9uc3vxYjmw/nMa1uBHDr280ZdY+YfSYGuxm4h+MDMdaOmNiLPYar6XC7sp8JUqGZ8lNCvzCH4goPPyEuRKRejLnK4oheD/A8aogOhxXz2nroEvrvteHViYbup+kqllW0wdkdtACoFh6jD91r8u0WHmjEcklqUC2Y4e5QXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UFfVxqiX; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UFfVxqiX"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4806b12ad3fso47148005e9.0
        for <llvm@lists.linux.dev>; Tue, 03 Feb 2026 03:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770118465; x=1770723265; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=44BM+t61qGHb8bSQxUBenNw4K81sfYTOIHgLXsB72RY=;
        b=UFfVxqiXZ4A4mAL06B+p+EJPneR0nGMzmIB0ecVKf+o4KmXfNlkPNiVlBbjBrYTXLI
         AFRzU3VZwwYWcBOG0L79MXKwGJwrKbjTUTx+4858pNhOltbTEl7amlmDsivKIMYyuI8B
         QWefgEzYBWlUvFA4+tu1HmR48Sl+g49DJk7dITDWwi9W4IWV89PLhhpXks40C2Yr9wrH
         829DTkUREi1nGf0/U0aB1Msg70bglJBcZt9fYLj1sm0/jEhE1g9GI4G/W8/kWXWYHx5D
         BHa7VBCNYC+H0NJ1sIGxVKCSOP1Y5Xd4a0uPH1ZcN/JogDWjCX8ln2H1DSEeQNTLu0Qf
         sSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770118465; x=1770723265;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=44BM+t61qGHb8bSQxUBenNw4K81sfYTOIHgLXsB72RY=;
        b=gAt3Z1XUyemwODM3kegCk2RUbTKoBd7LwZT1Zr6uOHPo5TjB+ZW6/UGikGs7xbnUV9
         W5CEUneEZmEfmjfpGiFiKhjRcbFRgPF0MMptcISb6oor6HPnBbqmOtg9ajNfU/Z9tTnX
         /P+XXJLWdwkD33+W4ZhOOdtlwkLEqRsYYRm95s6id6XsYA2zhlnMR3wHSoo9OYHiU1Vu
         7t6RM2hrcsbeh7knGGdjauuhIKOy6mSNR88qi057UhkTsu3XnXJuiZ1FieRxU4+58mkO
         McbGeNWKMwTB9yhmTz78ogW2YcVBAFUWQvdpiEa7kHzGWaxkdjL6pEp7OtOKitC0hBcw
         WqAw==
X-Forwarded-Encrypted: i=1; AJvYcCWQpNOBgE9+s4xtmKWIW+8lyLLCuS0zW11yZnudJyM8d+M56dhyb9Cx9gu6j8jhl9Y5FyGl@lists.linux.dev
X-Gm-Message-State: AOJu0Ywsy/xIwKHr0B/u2YkiHVkE+bH+k/fTQ8X+VHLBJM8y4V3siuEA
	9UwX3VNj2mqItQ3EYOJBfmaHcNmwrN8PGz5g336H83ghP9nZvb5rnBBZXIX6Vc6oFimBFYWuFwN
	gKLlgbLmVPjcRviciig==
X-Received: from wmoo1.prod.google.com ([2002:a05:600d:101:b0:480:6bd0:3fcd])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8115:b0:47e:e2b0:15b8 with SMTP id 5b1f17b1804b1-482db447c40mr231437485e9.4.1770118465517;
 Tue, 03 Feb 2026 03:34:25 -0800 (PST)
Date: Tue, 03 Feb 2026 11:34:09 +0000
In-Reply-To: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3615; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=c8KaIUkKoLbnzKPHztCk8a85+2NFtPPqK1S79zJ3Ew4=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpgd09MDQTJ/taK3Lf49afHdmnGD/aHx2441aqI
 WiSFym9hA2JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaYHdPQAKCRAEWL7uWMY5
 Rmo1EACd7QneqQSnMGd/PSyupu+WC8Qo0Dt5lLlYv+YuBAghZSMC40dNomgCxRecczFi73AtCF1
 xQWsJUbfpi0qSHg5D7b2yhKZgm2z8o97sciV2yYOLmzty/siHbIAK4DzUqZrht3LqWAF1oUQHZh
 DZQWpVnLt372AzmSfnAlngaFeryk+5Kgkrgj8VkmOsZb0f/xK52bAKdefYYqtY0NyMo+C0RtjGU
 R0X1L2Xne/PyIsIUPVchOAKrL8I3Bmwfq81tUDW2u84eHRkQXBYRNFsWIfaOqq+5mddEBNm7Wkm
 6kacZLAWeLreMRtqKFla1B9Y31g119GAB3R9NU8CDupVLiipPz+1zSJ/nYpoZ1T+G5fgYIbmfme
 isbeGXOU8NQF0ehV9rIBnZLk6SuqqYCFi0JuBAcTohsSvO2R7yEZK8mrzo8lyYW8f/WkZyokuXL
 AmxVqO2vl+gLIVAcRgScCC7Ty3xbpRkArdS/tDt+UfL5G36cKcwWR+AloosJ2L0C0AdHIGi+wwe
 T47u6O6NNstj2VJOHi1udvRWBa+KzCZjguMjfUkDTni9AoNss0l8UpkxyJVL6z02jTc8lMszCBx
 1tnhbxOr9prmPAO93SH8qQaU/DGebUpg9wIhTl0mErECRp1F0zHk5b9nINJPIm52x/kIJotfQZa GXngUhbk/tn3KQA==
X-Mailer: b4 0.14.2
Message-ID: <20260203-inline-helpers-v2-2-beb8547a03c9@google.com>
Subject: [PATCH v2 2/3] rust: helpers: #define __rust_helper
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Uladzislau Rezki <urezki@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

From: Gary Guo <gary@garyguo.net>

Because of LLVM inling checks, it's generally not possible to inline a C
helper into Rust code, even with LTO:

* LLVM doesn't want to inline functions compiled with
  `-fno-delete-null-pointer-checks` with code compiled without. The C
  CGUs all have this enabled and Rust CGUs don't. Inlining is okay since
  this is one of the hardening features that does not change the ABI,
  and we shouldn't have null pointer dereferences in these helpers.

* LLVM doesn't want to inline functions with different list of builtins. C
  side has `-fno-builtin-wcslen`; `wcslen` is not a Rust builtin, so
  they should be compatible, but LLVM does not perform inlining due to
  attributes mismatch.

* clang and Rust doesn't have the exact target string. Clang generates
  `+cmov,+cx8,+fxsr` but Rust doesn't enable them (in fact, Rust will
  complain if `-Ctarget-feature=+cmov,+cx8,+fxsr` is used). x86-64
  always enable these features, so they are in fact the same target
  string, but LLVM doesn't understand this and so inlining is inhibited.
  This can be bypassed with `--ignore-tti-inline-compatible`, but this
  is a hidden option.

To fix this, we can add __always_inline on every helper, which skips
these LLVM inlining checks. For this purpose, introduce a new
__rust_helper macro that needs to be added to every helper.

Most helpers already have __rust_helper specified, but there are a few
missing. The only consequence of this is that those specific helpers do
not get inlined.

Signed-off-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/helpers/helpers.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index a3c42e51f00a0990bea81ebce6e99bb397ce7533..e05c6e7e4abb7e6a4c4a3a417e35022dac1d9c58 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -7,7 +7,36 @@
  * Sorted alphabetically.
  */
 
+#include <linux/compiler_types.h>
+
+#ifdef __BINDGEN__
+// Omit `inline` for bindgen as it ignores inline functions.
 #define __rust_helper
+#else
+// The helper functions are all inline functions.
+//
+// We use `__always_inline` here to bypass LLVM inlining checks, in case the
+// helpers are inlined directly into Rust CGUs.
+//
+// The LLVM inlining checks are false positives:
+// * LLVM doesn't want to inline functions compiled with
+//   `-fno-delete-null-pointer-checks` with code compiled without.
+//   The C CGUs all have this enabled and Rust CGUs don't. Inlining is okay
+//   since this is one of the hardening features that does not change the ABI,
+//   and we shouldn't have null pointer dereferences in these helpers.
+// * LLVM doesn't want to inline functions with different list of builtins. C
+//   side has `-fno-builtin-wcslen`; `wcslen` is not a Rust builtin, so they
+//   should be compatible, but LLVM does not perform inlining due to attributes
+//   mismatch.
+// * clang and Rust doesn't have the exact target string. Clang generates
+//   `+cmov,+cx8,+fxsr` but Rust doesn't enable them (in fact, Rust will
+//   complain if `-Ctarget-feature=+cmov,+cx8,+fxsr` is used). x86-64 always
+//   enable these features, so they are in fact the same target string, but
+//   LLVM doesn't understand this and so inlining is inhibited. This can be
+//   bypassed with `--ignore-tti-inline-compatible`, but this is a hidden
+//   option.
+#define __rust_helper __always_inline
+#endif
 
 #include "atomic.c"
 #include "atomic_ext.c"

-- 
2.53.0.rc1.225.gd81095ad13-goog

