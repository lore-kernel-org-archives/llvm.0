Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3A51E8853
	for <llvm@lists.linux.dev>; Wed, 30 Oct 2024 13:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730295672; cv=none; b=BDShAApjq6xNE2EMAXn99gbCE+FKuu6MzAE5ghdSPq8UUqa5B6uwvU1JBI5S84Ijegx2yF/kLrJXkJdqQ8uqSmopJytw0lXWhuLmtIXrR8LCcLPHYi5Az4oFWA4Zq776EZxndfSIZjDPFoUl1NS4vMvxmJriRjYnikYbzKCIOz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730295672; c=relaxed/simple;
	bh=4TcP5RobiXr2DcxYkoWURTLQh2mLkq/s7RGmwBrfTv0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=AGmlS+v18Zjkk50a1HGfSItrDPeyuB42q73OwON/WhTGRSryR1zig2FzHo05a1CN/TXe5nAyIS5XVdDM/+TvsXGd8u3f/N5pIefN1qyEUplfEjK+P+DVlmF98gfOEXFI/oH7/Ede/PKS/vCdyQvGqetryw0BhEiHyoNbjltVnQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WsMSKbJ6; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WsMSKbJ6"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e293150c2c6so14015185276.1
        for <llvm@lists.linux.dev>; Wed, 30 Oct 2024 06:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730295670; x=1730900470; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZnlfbBmZO5geh/KK/4QX/wlajnJlukkheUAeVySVGiY=;
        b=WsMSKbJ6XZsRthGQ6ORH0wCay+b/ILtmQ2bdZcdXoH3wd6ywL9QsO9la+E8XBL/UUx
         GNplmSB6A/0KnURpjyfoMmjtPNV2QGY4ohwiqXYiHrfStIxptZfMsQGIT41aVzh+CHoK
         nYmN2AignVotcYob6o9m096E+wrpAQC3V7k3GlXDvB2/5U4sfdFWRom/nHG13vBv5qoz
         oOwkBp6rQtwLVMT/ybzrlfsHdSibcJBFsVNco0es+jJIlknh/TaYjg5AQ/X9uJ5vvAsS
         5KrgJgWCz4G3bkPb4/wc3x5Wq2WJlz9Dbu3tGCJ4H3x8nTz8B/uOqYvpbJyJ9ijDGXVX
         3UNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730295670; x=1730900470;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZnlfbBmZO5geh/KK/4QX/wlajnJlukkheUAeVySVGiY=;
        b=MIru3UXPSSa6g1kvr03VXmCJGDVRROYK5yF3Ruzl1OYfSg530z690441O87mMouULH
         r+NBk8B4FT8SvdB5mVTanqzYrUmICEgJUqCawv1nvrhW6b45ynB62J2UW+DlWfZFwYDI
         ixLLKPv7leZNyon5NBLhyr3ZtX9GIIPkOJU0JfK8WHR8uzbA0kibY9W1fz2ponjUF474
         +OXYxQ9VKVGGk8AxodTfIEMHweM+3aUgHIKZ9m7d9Op/3Q9MzHaaWkdbhQa9pU/3bsq0
         Sg9dwuuh8JsmSeWTFQ01KwPzivlVjh+9toQX//Yk+HDr4ozvG9q5DuY9rUQx1CJGo0EL
         UB2w==
X-Forwarded-Encrypted: i=1; AJvYcCWteleCUKP7Nmri8+w2Y2BkfSamYrJ+hWHGFD7gZjvZywze56T52RT0wEBDRNZWnOjNKEyt@lists.linux.dev
X-Gm-Message-State: AOJu0YwFA6ESv+BSzgRDyGosw7z/fxNvVet2fMfwHBg7q2QYSwdEBmd9
	V1C0zbXo5Mor4SyxxKqVTUtXjpsx90kKiqST0E6/6tEh3T60UwyEtH5dwiTU0b328b7ei1F9XaV
	6zSMuYAzolCKiAg==
X-Google-Smtp-Source: AGHT+IHinEnSBKjGIvFyvFHxDv3LvQXdI65dpVh6rvDdkIDUnjlR6rNwc4+MlGkUrUIIo8bHk+SanKh7PJylJvY=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a25:a562:0:b0:e30:c43a:d36b with SMTP id
 3f1490d57ef6-e30c43ad423mr3794276.10.1730295669665; Wed, 30 Oct 2024 06:41:09
 -0700 (PDT)
Date: Wed, 30 Oct 2024 13:40:55 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGY3ImcC/x2MWwqAIBAArxL73YJlD+oq0YfaaguxhUIF0d2TP
 gdm5oFEkSnBWDwQ6eTEu2SoygLcaiQQ8pIZalU3ldIKLcsSSHBj67Ys4GWioCPrh56MblUHuT0 ieb7/7zS/7wdYmh0XZwAAAA==
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2455; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=4TcP5RobiXr2DcxYkoWURTLQh2mLkq/s7RGmwBrfTv0=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnIjdwMyJDfPWJwQS2tSSwnep0neZlzfm5nIIuf
 97o8jpmioKJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZyI3cAAKCRAEWL7uWMY5
 RvdMD/9hG7LVutgKti3KMkRZDZy9QG4Cs/By8fe2jNZ+rTNNpPzOcMRTd0nny2hxsIHnAPp/hhK
 BG3NqaX5pjSvibufuLe57cN5w8yRCZyzpA3gjVmTdSRG67e80W1IfJ/5vfhPSqE2IhzqucQk0Ka
 ovfj0Xa+Fx3ikAl8ohOd8spIPgWnEUriZaMGRhxMuZlRSOUy76NmFL8KQh5/MK8aw7KuYUvzgRZ
 /gp0gtd7vrQxnBDAqhSONMX0s3g6KgY8QcKkSTbLj90Os4+uPly8eMlNY3xpCCanBzpBnNiC9rt
 oky4srlFyocsyFpYmXGwA6IeDmakwuiCoNtSHGQLFfMylQuc4IXoibx5r3pYP2IDiGTIzU0UyCA
 5+MEH0coyJ8qy4cnyOJw7/+8kqZT6G7EXCVRJq9MMBye0/nLeSvticm89JoCjs2+sG/6OHzKKaL
 nk0IqZWlknpWh6gz06CpnBBn2T4H1FOTO0l5zivV0amo60uj9w0oLKITAs1KHXes76qsCz2c7o+
 3qtq+UcCEMtoYhTKJ489EmpTHv9KYD3TCQ7mIOPZbHDy7hOd3pEuAN/54ZYqLxZw8dde6ylHI4Y
 m4Kwho/n3k2d4XtcgsQiEPyY4yJppABx+sJvxrFAD8Vhl3fqfl9+NThSmvegv4CbZ+Y5FdyIi4W uthUD+x2oLsc38g==
X-Mailer: b4 0.13.0
Message-ID: <20241030-bindgen-libclang-warn-v1-1-3a7ba9fedcfe@google.com>
Subject: [PATCH] rust: warn when using libclang >=19.1 with bindgen <0.70
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

When testing a clang upgrade with Rust Binder, I encountered a build
failure caused by bindgen not translating some symbols related to
tracepoints. This was caused by commit 2e770edd8ce1 ("[libclang] Compute
the right spelling location") changing the behavior of a function
exposed by libclang. Bindgen fixed the regression in commit 600f63895f73
("Use clang_getFileLocation instead of clang_getSpellingLocation").

However, the regression fix is only available in bindgen versions 0.70.0
or later. This means that when older bindgen versions are used with new
versions of libclang, bindgen may do the wrong thing, which could lead
to a build failure.

I encountered the bug with some header files related to tracepoints, but
it could also cause build failures in other circumstances. Thus, always
emit a warning when using an old bindgen with a new libclang so that
other people do not have to spend time chasing down the same bug as me.

If you encounter this warning, it is recommended that you upgrade
bindgen to 0.70 or later.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 scripts/rust_is_available.sh | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/scripts/rust_is_available.sh b/scripts/rust_is_available.sh
index 5262c56dd674..30695612a0d7 100755
--- a/scripts/rust_is_available.sh
+++ b/scripts/rust_is_available.sh
@@ -225,6 +225,18 @@ if [ "$bindgen_libclang_cversion" -lt "$bindgen_libclang_min_cversion" ]; then
 	exit 1
 fi
 
+if [ "$bindgen_libclang_cversion" -ge 190100 ] && [ "$rust_bindings_generator_cversion" -lt 7000 ]; then
+	echo >&2 "***"
+	echo >&2 "*** You're using libclang version 19.1+ together with a version of the"
+	echo >&2 "*** Rust bindings generator '$BINDGEN' from before version 0.70. This"
+	echo >&2 "*** combination has a known bug that may lead to build failures."
+	echo >&2 "*** (https://github.com/rust-lang/rust-bindgen/pull/2824)"
+	echo >&2 "***   Your bindgen version:  $rust_bindings_generator_version"
+	echo >&2 "***   Your libclang version: $bindgen_libclang_version"
+	echo >&2 "***"
+	warning=1
+fi
+
 # If the C compiler is Clang, then we can also check whether its version
 # matches the `libclang` version used by the Rust bindings generator.
 #

---
base-commit: 81983758430957d9a5cb3333fe324fd70cf63e7e
change-id: 20241030-bindgen-libclang-warn-cebf97ea3506

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

