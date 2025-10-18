Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A337261B77
	for <llvm@lists.linux.dev>; Sat, 18 Oct 2025 17:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760809551; cv=none; b=B7Dfl1bOvCvfa2GGS+8wgSTkdzGy0XGptz3N8l4uNSgzEYHP0XhxlNjdpiFgszexnGda+Gz2mYITbfSawFdL72rbpnKBlZrSRqIAv/y+m7JBr7Yq71kr6LwLTNnxKQdZbOPGmgWfxJatVa2YgLaTPF6isJRYArts1ZtboybFkIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760809551; c=relaxed/simple;
	bh=CzY30Cbw7NH9BCqW+7Dm4yyfJiEmTcSRj3QBxiZsJWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o7UpGv1bsHCoKZqK2UvMMayvXRF9PSTPPI4SpZhPxUUomQ/S4/hEwEmWUlAFlkyflyPdv5je6Zs7vgFXsP6nxrH29AKEXFTqaOvDAxVDWaCUvX14mW6Ru9KAmNnAADWTwU2xA2cDrubNWe7zGBXtXhUpkl3Jtq1uo2wke0iwfUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yi3UhD33; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yi3UhD33"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-87c1877b428so54462066d6.1
        for <llvm@lists.linux.dev>; Sat, 18 Oct 2025 10:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760809547; x=1761414347; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lawTNFgWMdwiPfh6WDKLTV6aPOfN+Nzqh2uzIhroikw=;
        b=Yi3UhD33pUrTTmOKAncQlWO3QQnqESv3rWwpQnd9XnnRk9UNLO2cj0o3M+2gFErIQG
         Gzd1SDNo4P0iBrj/C8KmbjIqPjF+ruF+KFkotmankOxHjKcBVW2fNa/HOH98laaduZSg
         gH8ew1izqmCSA+XY6ux5oPJ3fQkgxttKdl8OxtDzcmire4fGPgY1EREPGemhkytpOC58
         OzX55p/XVFTX4iRL5bWknbPoFTcHj9hmFUik3e5DFIR7tviExauSwdXcQ0J8yGu8VvvO
         g/xN5V0WYTe8lAX4u7Vzn55klVbc2uNNf7dJbBOt3ruU0eIWhge+/fnQAiTYoWBTYdmZ
         mOnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760809547; x=1761414347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lawTNFgWMdwiPfh6WDKLTV6aPOfN+Nzqh2uzIhroikw=;
        b=ju0zuW873YzRoQ7yZTes8Q/uviuj4SvfThlnG0IgSRST0e10uYvt58CVG/zZfGyfZP
         0r5z7L7yPsqGQYZ04TSDApaRQ6Mx7DtrD/KB3Ke7ERqoAUh26HQTHulvjaPjPUcCm4AE
         HEMtGeZiTn66a/ax/9g8pg8zTKvQuXyFvkV5uFS4dHC4389fjd2RpV9keuXYFAPVY/Rw
         ZEKHv/lCDvZY2VHiR0vnDFWD8KHpzAs+IZPV7PN+NfwQIBmYGq2SgLMvpqV4uWWQFHI8
         tb98Go+VlK4SV4X8JGH+ZdSZ83tzqedq/0HkXUjHbexWgf8knHEC7cZ1eukdK3XNRWz6
         t4ZA==
X-Forwarded-Encrypted: i=1; AJvYcCW+KyIUoL987ZLsv0Aim6upv+xexT3Da+1WsUw7R9LDn5oVgR77k5Bk4xzgXhc0jIcVb/Xr@lists.linux.dev
X-Gm-Message-State: AOJu0YwwIox2hxYxcPlFKW0K7ilCjKS8nzyC6MxH83VNTxm7fm+ZtQf8
	ZQT+/q4LuK68pwOL5Wp3XW3yDT/4WNqzdmIlOVQWnyDxkdogB1M9Juog
X-Gm-Gg: ASbGncv4H2e2VNuVtONArfC1Ittt8WUgT+B/RDrFdc27pedIkeHnFsbGOwKPS/Kz3fP
	Ky7KqKYlXapKEnUL6ponmX64JwUR1hF8Tz0oENyMYXyQN3g3W82YSnWjK6nCZjkUOThqQr4zkW1
	v8/ePLM9g4WxNei+FN397r4uqXCJIoY0XEaagTt4Wj0svFpMpflkrDD/1dckoKFp8m6kXATngEN
	D1iDVI6DJJ1uDXvQxW2xWJ3AklKWuLrC59AJCpXHtu8nDm48boMwuT995ga0g4dlkoke5XNFwiX
	I9GWQ6X/5RGlVMAF6WnKNc4iMyrSArebRgTMiKicPLCBQqWGlngcESbCHwFut1nMiXVgy25a8R7
	DtlZLVqsBEtXShezj0aRUA8mlot2OZLAPBhjhCkbTMvmQSLaOnZzjmZ/1ghb4VWzwhr/KtheryX
	L8AjMwBOp3lIulv/NIzz9hHW0gBG8upiDRBBweLldbcW0xVIGbNYxv7cl34Rlat5vYfHdCd07JY
	jyRA7oJ4mamxj+ZZ65aE9SGgeQODrc8rF7fBLo9jkvQ7Y7taBo7
X-Google-Smtp-Source: AGHT+IGtoC16cs2IUHy92V+PgbYqI7ItzE0B6P6UQD9FJc874xh/zcTQPxmAHJdRXWEe38KwPk6DJw==
X-Received: by 2002:a05:622a:1350:b0:4e6:ebe3:9403 with SMTP id d75a77b69052e-4e89d3578camr111769721cf.41.1760809546751;
        Sat, 18 Oct 2025 10:45:46 -0700 (PDT)
Received: from 117.1.168.192.in-addr.arpa ([2600:4808:6353:5c00:1948:1052:f1e9:e23a])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e8ab114132sm20445161cf.40.2025.10.18.10.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 10:45:46 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 18 Oct 2025 13:45:15 -0400
Subject: [PATCH v18 04/16] rust_binder: use `core::ffi::CStr` method names
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251018-cstr-core-v18-4-ef3d02760804@gmail.com>
References: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
In-Reply-To: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
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
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1760809526; l=1838;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=CzY30Cbw7NH9BCqW+7Dm4yyfJiEmTcSRj3QBxiZsJWU=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCdjYy/3zPtDG6mLhbi/m87N/OQUz3F9LUrbbVL/SdtvY9mUE4M1GxOy/SM9SDWwBVOLExEXvgS
 qD3AZBhe7nAg=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Prepare for `core::ffi::CStr` taking the place of `kernel::str::CStr` by
avoiding methods that only exist on the latter.

This backslid in commit eafedbc7c050 ("rust_binder: add Rust Binder
driver").

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 drivers/android/binder/stats.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/android/binder/stats.rs b/drivers/android/binder/stats.rs
index a83ec111d2cb..10c43679d5c3 100644
--- a/drivers/android/binder/stats.rs
+++ b/drivers/android/binder/stats.rs
@@ -72,7 +72,7 @@ pub(super) fn command_string(i: usize) -> &'static str {
         // SAFETY: Accessing `binder_command_strings` is always safe.
         let c_str_ptr = unsafe { binder_command_strings[i] };
         // SAFETY: The `binder_command_strings` array only contains nul-terminated strings.
-        let bytes = unsafe { CStr::from_char_ptr(c_str_ptr) }.as_bytes();
+        let bytes = unsafe { CStr::from_char_ptr(c_str_ptr) }.to_bytes();
         // SAFETY: The `binder_command_strings` array only contains strings with ascii-chars.
         unsafe { from_utf8_unchecked(bytes) }
     }
@@ -81,7 +81,7 @@ pub(super) fn return_string(i: usize) -> &'static str {
         // SAFETY: Accessing `binder_return_strings` is always safe.
         let c_str_ptr = unsafe { binder_return_strings[i] };
         // SAFETY: The `binder_command_strings` array only contains nul-terminated strings.
-        let bytes = unsafe { CStr::from_char_ptr(c_str_ptr) }.as_bytes();
+        let bytes = unsafe { CStr::from_char_ptr(c_str_ptr) }.to_bytes();
         // SAFETY: The `binder_command_strings` array only contains strings with ascii-chars.
         unsafe { from_utf8_unchecked(bytes) }
     }

-- 
2.51.1

