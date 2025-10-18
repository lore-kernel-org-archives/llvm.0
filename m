Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8972FC86B
	for <llvm@lists.linux.dev>; Sat, 18 Oct 2025 17:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760809570; cv=none; b=HQ5m1Q/Uksos2eTuA+3F2itKBAmfXDjBABkNgnMdsKRGEJiiO9wbAVlqjam4EOZWIydtzqSl36x1BQybyr2LKbpQ1ah0aCBCHeiZiQkhY9ainficnK24JycbNCfoidrwHLyVhNUbRbm+c9PsKE//jp2ZMRVpvfM2TWhxucONVRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760809570; c=relaxed/simple;
	bh=W0kd+lIKrES9E6f3i/NvYS4ZToF7HAzoNGFG8gcpmao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D5Xo6FhLfzL9HBMQBS9mFBYsIVY3oP8Gy9lLLUBP4/pOM5cBUviFCCFYc3zRpbi9vqpA2owrxsXrvWRGOfpoDn4LJBv0qjGwyc+7NC/iDBpm9TA37+cjhXlR+G2M1sV7YyBNPxDvz4YgTFJoSxBTsrlUzFPaX7OUTKGvs6sHKcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IqGXN4A4; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IqGXN4A4"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-88e525f912fso459759785a.1
        for <llvm@lists.linux.dev>; Sat, 18 Oct 2025 10:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760809567; x=1761414367; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sKB2rh6EiQ7umDMD4HQ+ERdIpZM9C4N3KJVnDXEYlQU=;
        b=IqGXN4A4IrMLB82PkOwEZJ1RA5a2EP1nTFyHv/j1SV5s517G1gEOmiu4UPO97/fQxX
         5TT63eNsYToBUFZ3vd6R+IU4QQj41cY7ou+4Pem3T0BAdtcr2sikDLlHDK0B1WMlB2V9
         q9oXgno/MW5tiExjsNOmKj9X1/9rr3dSnLaRF6huewxOaF86eqGB9PYCcGS3NuRZZjev
         3SFRy3hBI/yn963KNkNFcq9H5EzobqrRCaXAsxKEfWCfQWZBpwTH58+JQsoPq2fupo3A
         BezC2wTKQbCP7VsRci19wJH3hcudC0T/gNKiISsz93e4pWmU5++TAJ06/H1HGu9xs22j
         AIHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760809567; x=1761414367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sKB2rh6EiQ7umDMD4HQ+ERdIpZM9C4N3KJVnDXEYlQU=;
        b=ti4+Wxuk2nmnANbBtSIHora3fOYoI/FqgSkB3x8qY4aAAkaz0cTGtoKV2BFFEdNc5m
         dkiS5lho8ysVtayNEjqfZ6mwnn5mPisyDaPO35+42yDe5TFknNSu6Ri7pii2fsZepemI
         LIZMdRcWnlOydUvx+7AbHgGbF6GfhBalwpVKQcdf4cHc0Jl+CBb6tUolLbhok/bo3rBN
         5GeXFHlKIEWLBK6gsEpZyF/CjgFtUerrn6xspkrhg/tR5gIEhuszxuPCVqcLkR1CHN65
         Mz6qV7lgBnCVBvApZzcW0veHw87i9gizyAfj0GxepDvvmIHTov/t+p31MfYrXfXVlxPq
         GnMw==
X-Forwarded-Encrypted: i=1; AJvYcCVl1e+LjZsGfqUm8NMoeAHuy2Rl4sCqkTFZmQ/89uU1ei7shSQdNDLa9vRc6QM9p8SynEMd@lists.linux.dev
X-Gm-Message-State: AOJu0YyEUD8XpGf2hMBj7LFU27HKTzfVOfhcP6YWmlTgOhs1g8xwsq2Z
	LGm5sH4GRhl1LhD2JBYAnrldp6vtlEz5khpPQa/4fdBUjBf73xGnrX1v
X-Gm-Gg: ASbGncvZjSqA1OUpmeAhb08FgzPQK7GrAqztkOpyq5MJ1j+QoHZYn6nDjXTPkd9k8GI
	OUZUfDBcirHtWeo9eUNQz8bBL79FZaV4Us3625ywRj1y+Um99gNhDxyMgyJgU93BunqAUwaaspV
	Vo+o5P83L6ydJN7L1NByQUJbOLEoLkO23AtQE3A85Fvz2igtj4d1R3P4Bl3D145DmCx3Mj8NISa
	tJJgoUOLcQxDybO71BqT3st2frm4dE7WLT+xLPYdzV1DwZwX1P7671o+Kx1JcUL0HJN5tcARm8u
	zAI8boZTJjYo9RB3XoKcgOAUoStdDAGDRagvibu6iVfJCEjjfzaozw7tUwk+K0tyJsuF42Sa6ZD
	Qeqf9qEB2+N2VyQvkVxxRPDRM0vMiMk+U5SeXFuTiK9pGzT45QG4Ncetb2tWMz9egh6aQMj+Tej
	6UbSXLj9ZQ32P2HHApDrDJS4g4V+xBbUWmt6iH72RatbL9B59GGrfBUdey4CX1eu5ZW5zh+09Pu
	jwj3WAJ0R0PikhQ7QB5FK5hAeVH9ne6xJt2CfyrtDZ8ppI9Qy2lhZKeLRDFPUU=
X-Google-Smtp-Source: AGHT+IEi+T9/sjZ3+qvtuzBCO8Ryg37IjVdgJ7+/CPsrCZub5GHtmSQZv61we6wEcfm1jaszdnCtzA==
X-Received: by 2002:ac8:5908:0:b0:4e8:8e75:1875 with SMTP id d75a77b69052e-4e89d283973mr96538081cf.23.1760809566774;
        Sat, 18 Oct 2025 10:46:06 -0700 (PDT)
Received: from 117.1.168.192.in-addr.arpa ([2600:4808:6353:5c00:1948:1052:f1e9:e23a])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e8ab114132sm20445161cf.40.2025.10.18.10.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 10:46:06 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 18 Oct 2025 13:45:21 -0400
Subject: [PATCH v18 10/16] rust: opp: use `CStr::as_char_ptr`
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251018-cstr-core-v18-10-ef3d02760804@gmail.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1760809527; l=1431;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=W0kd+lIKrES9E6f3i/NvYS4ZToF7HAzoNGFG8gcpmao=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QEAqWyd54iXxQf1W7agZsuXCPqrg/zEyTWXe5pjUlem4d91+xriJLoSF0e5Up8mkLDTG1Mc0sF9
 CNvCQrLokrQ8=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Replace the use of `as_ptr` which works through `<CStr as
Deref<Target=&[u8]>::deref()` in preparation for replacing
`kernel::str::CStr` with `core::ffi::CStr` as the latter does not
implement `Deref<Target=&[u8]>`.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/opp.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/opp.rs b/rust/kernel/opp.rs
index 2c763fa9276d..9d6c58178a6f 100644
--- a/rust/kernel/opp.rs
+++ b/rust/kernel/opp.rs
@@ -13,7 +13,7 @@
     cpumask::{Cpumask, CpumaskVar},
     device::Device,
     error::{code::*, from_err_ptr, from_result, to_result, Result, VTABLE_DEFAULT_ERROR},
-    ffi::c_ulong,
+    ffi::{c_char, c_ulong},
     prelude::*,
     str::CString,
     sync::aref::{ARef, AlwaysRefCounted},
@@ -88,12 +88,12 @@ fn drop(&mut self) {
 use macros::vtable;
 
 /// Creates a null-terminated slice of pointers to [`Cstring`]s.
-fn to_c_str_array(names: &[CString]) -> Result<KVec<*const u8>> {
+fn to_c_str_array(names: &[CString]) -> Result<KVec<*const c_char>> {
     // Allocated a null-terminated vector of pointers.
     let mut list = KVec::with_capacity(names.len() + 1, GFP_KERNEL)?;
 
     for name in names.iter() {
-        list.push(name.as_ptr().cast(), GFP_KERNEL)?;
+        list.push(name.as_char_ptr(), GFP_KERNEL)?;
     }
 
     list.push(ptr::null(), GFP_KERNEL)?;

-- 
2.51.1

