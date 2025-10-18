Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB61257839
	for <llvm@lists.linux.dev>; Sat, 18 Oct 2025 18:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760810591; cv=none; b=vGlPPrVhBBdxTmCIfog2QZZMWmUTRlkiKocPocmFnFbt+OL0mwyI89y8UxiydpfG3haOMlWiXXbzzay+5MWovUod9Xh9HhCuveQCLsnr73pwIw6GtA2FQrnwtHMgYj+G4x4dqMeUkc+g2EGYe+hhJQnKO2wjTSxEmJ6WoCzqqvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760810591; c=relaxed/simple;
	bh=0GzwcDEeRifVYWOU1Ju17zqBLy5F9ZnkEqm/6SUKvKQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=F7ya5JXv8iWwgS93xJW1fzlNWmi3fGfZWtZQWbgdR7LcMYvu8bV1VzmSHh0jffArdbGqouxu/bIJGz4vm1RcYGfnUAwZoSuT3GpNq9A3yXfqSHHNno+674lFOSC7//qKH3WUCfmrLJsmzWQLUNfpp6cjxijF1eBaICBZi+zMdPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xqjhf+bh; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xqjhf+bh"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47114d373d5so25353505e9.1
        for <llvm@lists.linux.dev>; Sat, 18 Oct 2025 11:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760810588; x=1761415388; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3Jw3+rOqAmz9lI4+2vszjAxIVE8PlKgnkOGLhqwHbOo=;
        b=xqjhf+bhxfnybbBYxuoaKZxFpoWjIIxMEbwxNxUlvCVTMXvmt2cdPQMuh5HSpTiDa2
         5bBiYA8NZZjU9uJNsFR7nwwBIq1je2HIBk5SHeH88ELNMLPRpGr0NPGapefhwnaXr+ft
         S2cyMbQ09/b1jJaM3NUADkfVwfWwWlWhMw3/XktBJ52Orsv0UBBEJD6MT2gc+JJHDgOV
         dhGArY9h1D0PBaj5oI6zsQ9vimco7WIYcwiBmn8O0uiz0+tophmpuxjFRo1sHCss8Bz4
         kpMxyVdnVC66Nz3H60Vf41CKetx43+cEOg8JD7vALwR8sd8OSy7HpzG5i0ZHlhRrh6q6
         u/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760810588; x=1761415388;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Jw3+rOqAmz9lI4+2vszjAxIVE8PlKgnkOGLhqwHbOo=;
        b=h2y/C/WNTVjDKw9LYCAqRPDJAJ14o7TNsVUUHxS0VzlxdZWfevZGKZ8B9ptLYyyZHq
         GskFYUfCBMYqwNI/dKoEwFu6TjqOg+1HRo2gGfLjjlRY7f75ln9FbF7rhkoaAkGcA2uS
         lkxP0Z4qvfYIuZbXeiBeN8a9VZoDoO6mLI4EauyErY3S3yv0Yv6pf1aUSegccvA4MBG+
         tEczbcCegGBRornPdbDMI0sasGbQjsJdzuaUmxkSJ8ECHulOz2Cevzb1vsFCICjnGAub
         gxzTO2RZh3in7pmVuaSJ0+JVozGNCaN4yu0JC1fnTe2yr0pS6s2Gbj3uYnp356GTYHXZ
         vljw==
X-Forwarded-Encrypted: i=1; AJvYcCVerPO9yTESNFyNWD0CfAGR9kS8Ord9dRdr0WRQhJ2/lgbzpwrzTBqg2w3qvUcNMKCGpNlf@lists.linux.dev
X-Gm-Message-State: AOJu0YyWCRDY/HrWxsfFeJpPma5e+ttffEetdAkHoMHcQz8iJIU6LM8W
	GngUFtFGA6VEjZARSf0aZdjh9z9wiY+nMIVVLKQohx3KjuTPI0N1+04vIH5iRsWuPTFsrtJNoBw
	pAd+cjttYFl+CC23Bug==
X-Google-Smtp-Source: AGHT+IEDBiBL9j3PrKHEoPMUCzoRBlvkx4ZL7AxoxVM1NpYJWMzoUQv31Vq5zUARBonVeR76HGoFc6I/2XbrkI8=
X-Received: from wmbh26.prod.google.com ([2002:a05:600c:a11a:b0:46e:6a75:2910])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4715:b0:45b:9a46:69e9 with SMTP id 5b1f17b1804b1-4711791c8c3mr58877225e9.31.1760810587581;
 Sat, 18 Oct 2025 11:03:07 -0700 (PDT)
Date: Sat, 18 Oct 2025 18:03:03 +0000
In-Reply-To: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
X-Mailer: git-send-email 2.51.0.915.g61a8936c21-goog
Message-ID: <20251018180303.3615403-1-aliceryhl@google.com>
Subject: [PATCH v18 12/16] rust: configfs: use `CStr::as_char_ptr`
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
 rust/kernel/configfs.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/configfs.rs b/rust/kernel/configfs.rs
index 10f1547ca9f1..466fb7f40762 100644
--- a/rust/kernel/configfs.rs
+++ b/rust/kernel/configfs.rs
@@ -157,7 +157,7 @@ pub fn new(
                     unsafe {
                         bindings::config_group_init_type_name(
                             &mut (*place.get()).su_group,
-                            name.as_ptr(),
+                            name.as_char_ptr(),
                             item_type.as_ptr(),
                         )
                     };
-- 
2.51.0.915.g61a8936c21-goog

