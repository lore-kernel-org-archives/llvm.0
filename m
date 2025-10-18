Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8FF26B764
	for <llvm@lists.linux.dev>; Sat, 18 Oct 2025 18:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760810598; cv=none; b=rhnDVTcGVP5oe5uN3AIQN3qhK3zc4bZbg9sjehp7jjflYOunT1yLSwy6h2LCLO7T8ISErtFSI9OBODq83GKFd3vZ+obpcoXSvQ566HCOSwcE59pNuUNyEVg4AbY1QpwSPb6RibR247QyPiBJn1elIrmycv3Np85qzx6jd5YOlbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760810598; c=relaxed/simple;
	bh=hMEnshIBBCwKDA9va+C+vgTZ7D8UBppyjlBh7zEwkCg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HCl+lSi1YA6K5D8+B5GbGWsmls3soCQARklpRBo1hw76+yFO2cXlW276RMyCald+8yrV+5W0OgDtR5b0MQ//qMkngCPOdOil+DKTNVISodfuzuD3tdP9lsaEkDV+/zWYegZbrLpZohBf81jiVo+YWBIdswGCORwM3NvIv/DxehI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GmCH2zWN; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GmCH2zWN"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-46e47d14dceso18091055e9.2
        for <llvm@lists.linux.dev>; Sat, 18 Oct 2025 11:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760810595; x=1761415395; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=P+Xp99Syf6solx7Qtcc9CHjBfbP4dER1f+PiKli4U2c=;
        b=GmCH2zWNjdJSQCTIhOGJ5W0Y8VGSfZo68k8KjiwWyhTVfK0e8QFBPu3hxXhjzdBVSX
         dfDjzVWM4gzB8zXYKr2+Cb14dK/7vKMMRoQjwdVFO3f85RWxVmiUyjkHFkf+vnS9KK4n
         ZHcpUaBTq8uO/zGVxpe8rfWIzZgKe55rLcJIXPOyi8cSQL0UXkuXqllviWT8VGwBj6mw
         9HzDeOfdT39LZqkPqXqciEwxK18Z4ji5aJD9RnpZHiWMyMMnU7FtDG8MeR1jH10P81Wh
         9zb6dzZns6AKBRkG2dK2Fl6moEtxjbcKZHfwRZu39PHYm87kepJabwWFveTmNXkN5LuA
         tSPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760810595; x=1761415395;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P+Xp99Syf6solx7Qtcc9CHjBfbP4dER1f+PiKli4U2c=;
        b=PoqIacYsydcW6/wzTfrheWpGhVCkQeQ9B+NkX+9FKC9OTzk1nK5Dwfol3tzeb7pvOQ
         2u2PgLW4Ke6hA/uiGf5y0ujbf3dDgxxlnVqI6hcuQthNfe5TjHXjmt/oiUQa0EG8LY9g
         8fKZ0RC4DTUrobSOdNTeAh+2d0K7SChW/Uax5+guALjQ/r9EuM+8Axxy6zfNKGjgJsz+
         BRJnHUYf+Yjm/gArN2Mk9zOKQoNAAgqxKMv2MeWczt3X/Phj+oywZlxabN3MCloMfNlK
         hMDNYV1DJGhk8/xnx0N41ycq4+WX/o4qpob0GTHtpDmzL9+Y9e1CrtT517vp+JHPucDU
         QzJg==
X-Forwarded-Encrypted: i=1; AJvYcCXt9OpZrZ8B8c/M0AZ+qLZ9bjhM0QdE0JJKmKXZIYF5G1CybbOqHm8e92fLtX/ataJuoRpR@lists.linux.dev
X-Gm-Message-State: AOJu0YwrYZdyo6xQUlgIDaoUkxJiS2vR7BlzD+CDOmTpydBcEFSoklGu
	1Y3sNNHaTR/vzq0gLbElf0ppm1sFQucO5HUWvAH9DMky4EP0Pd8Mw/gSc1NRzuWYtCT8Wot4EPL
	kNfY/PoQ+xR9PRpvppw==
X-Google-Smtp-Source: AGHT+IFD1cfJ8UvE+arlsN4Q/pztwM830HHKQSYiiR0oQA7gs4M/kyYn5nx3HAt5EUs2SUtbpxbRKJSK1nrxs4c=
X-Received: from wmbz7.prod.google.com ([2002:a05:600c:c087:b0:46f:aa50:d700])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:474a:b0:46f:b42e:e39c with SMTP id 5b1f17b1804b1-4711794902dmr54802325e9.41.1760810594858;
 Sat, 18 Oct 2025 11:03:14 -0700 (PDT)
Date: Sat, 18 Oct 2025 18:03:12 +0000
In-Reply-To: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
X-Mailer: git-send-email 2.51.0.915.g61a8936c21-goog
Message-ID: <20251018180313.3615630-1-aliceryhl@google.com>
Subject: [PATCH v18 13/16] rust: regulator: use `CStr::as_char_ptr`
From: Alice Ryhl <aliceryhl@google.com>
To: tamird@gmail.com
Cc: Liam.Howlett@oracle.com, a.hindborg@kernel.org, airlied@gmail.com, 
	alex.gaynor@gmail.com, aliceryhl@google.com, arve@android.com, 
	axboe@kernel.dk, bhelgaas@google.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, brauner@kernel.org, broonie@kernel.org, 
	cmllamas@google.com, dakr@kernel.org, dri-devel@lists.freedesktop.org, 
	gary@garyguo.net, gregkh@linuxfoundation.org, jack@suse.cz, 
	joelagnelf@nvidia.com, justinstitt@google.com, kwilczynski@kernel.org, 
	leitao@debian.org, lgirdwood@gmail.com, linux-block@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-pm@vger.kernel.org, llvm@lists.linux.dev, longman@redhat.com, 
	lorenzo.stoakes@oracle.com, lossin@kernel.org, maco@android.com, 
	mcgrof@kernel.org, mingo@redhat.com, mmaurer@google.com, morbo@google.com, 
	mturquette@baylibre.com, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, 
	nm@ti.com, ojeda@kernel.org, peterz@infradead.org, rafael@kernel.org, 
	russ.weight@linux.dev, rust-for-linux@vger.kernel.org, sboyd@kernel.org, 
	simona@ffwll.ch, surenb@google.com, tkjos@android.com, tmgross@umich.edu, 
	urezki@gmail.com, vbabka@suse.cz, vireshk@kernel.org, viro@zeniv.linux.org.uk, 
	will@kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Tamir Duberstein <tamird@gmail.com>

Replace the use of `as_ptr` which works through `<CStr as
Deref<Target=&[u8]>::deref()` in preparation for replacing
`kernel::str::CStr` with `core::ffi::CStr` as the latter does not
implement `Deref<Target=&[u8]>`.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/regulator.rs | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/regulator.rs b/rust/kernel/regulator.rs
index b55a201e5029..65a4eb096cae 100644
--- a/rust/kernel/regulator.rs
+++ b/rust/kernel/regulator.rs
@@ -84,7 +84,7 @@ pub struct Error<State: RegulatorState> {
 pub fn devm_enable(dev: &Device<Bound>, name: &CStr) -> Result {
     // SAFETY: `dev` is a valid and bound device, while `name` is a valid C
     // string.
-    to_result(unsafe { bindings::devm_regulator_get_enable(dev.as_raw(), name.as_ptr()) })
+    to_result(unsafe { bindings::devm_regulator_get_enable(dev.as_raw(), name.as_char_ptr()) })
 }
 
 /// Same as [`devm_enable`], but calls `devm_regulator_get_enable_optional`
@@ -102,7 +102,9 @@ pub fn devm_enable(dev: &Device<Bound>, name: &CStr) -> Result {
 pub fn devm_enable_optional(dev: &Device<Bound>, name: &CStr) -> Result {
     // SAFETY: `dev` is a valid and bound device, while `name` is a valid C
     // string.
-    to_result(unsafe { bindings::devm_regulator_get_enable_optional(dev.as_raw(), name.as_ptr()) })
+    to_result(unsafe {
+        bindings::devm_regulator_get_enable_optional(dev.as_raw(), name.as_char_ptr())
+    })
 }
 
 /// A `struct regulator` abstraction.
@@ -268,7 +270,8 @@ pub fn get_voltage(&self) -> Result<Voltage> {
     fn get_internal(dev: &Device, name: &CStr) -> Result<Regulator<T>> {
         // SAFETY: It is safe to call `regulator_get()`, on a device pointer
         // received from the C code.
-        let inner = from_err_ptr(unsafe { bindings::regulator_get(dev.as_raw(), name.as_ptr()) })?;
+        let inner =
+            from_err_ptr(unsafe { bindings::regulator_get(dev.as_raw(), name.as_char_ptr()) })?;
 
         // SAFETY: We can safely trust `inner` to be a pointer to a valid
         // regulator if `ERR_PTR` was not returned.
-- 
2.51.0.915.g61a8936c21-goog

