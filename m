Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93C42475F7
	for <llvm@lists.linux.dev>; Sat, 18 Oct 2025 17:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760807390; cv=none; b=WP2l+3Ey12FYZ/Kf89PK206rApwonaaDxtcFdleJNM+SjUqCX9SOY4Y2I+v1a7R7M8//yMutHqCsqkO/VNhfWWhg1D7HK84LiDeO9dI71yi8pzv+Y4txZS7LwVKJ3oRhHeHTmRPN83Q5ke2y8RY2Gr/tpM5S5rKojnjA/qk9d7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760807390; c=relaxed/simple;
	bh=odtCe9zBLcd2KigvnEagfj6Hjlz+S098qgy/zAjyk5g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mEH6C6Cg6+744IAMvZB8JLhjMJISua9H15v9KXTnX/qnWddgfYpGn3xJrYJX3GS34Gu5gDxQchXgmwkyAmS9Ol0OZnDbG4nv2kI7mXFYUYJp5rN3g4KchYMJG4xZ01Jlpt4QPd9sUldiQixak/CoS5piqxpeCkCZHOPfi4AaYwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nz5NszoS; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nz5NszoS"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4711899ab0aso20398665e9.2
        for <llvm@lists.linux.dev>; Sat, 18 Oct 2025 10:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760807387; x=1761412187; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8gbgmXbo5t+1RIxOlN8V1tPuxrDnGp84UG4kpKP+4AI=;
        b=nz5NszoSSZSU1Yi0+SLkMgqlRfUbBp2Qqg0V9Ajaa8ZPy5B9Az193qvbvfpG6RdZgL
         lhPbaFuvYSrgkXQwFayofShDPaB0/RZqibQCcrra3SDpAt34F/zQN8GJjpZ85zaeVsJ5
         Fp/982gHCMJrdcTQMPC+rusVPVJsQ56/bV8n0M2G0/jO8MgJC/NqtjIJYXSuyRCpuLSZ
         Y1NNT3IoTskdxw105pxOSP+QPDGlK0fUyJsoffDN7iIHtN6Wk+tk1OMBFcHBFVQA/zj5
         fV/wAMkX9RK9egJ79H7xkVgksh1AK9mqOK47ooa+OiGJZW2ln6GZe/FQRz51FDE7Qaxt
         TbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760807387; x=1761412187;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8gbgmXbo5t+1RIxOlN8V1tPuxrDnGp84UG4kpKP+4AI=;
        b=Xo1s/k2dpz0si4egycRrzZ0/D9aTfAaFaXGrYvQCU4yxe3W2GZF/XNFbXOnbGJWNN9
         AfpRQO03xJ7BXxTAy/Ny77JVMH9e/yLvYkXg61XsNcsRrFj5E2hekKpW5wDI5i2mU7oR
         FwSyEr/UOteqKWRwzui6jh7XSdeTi0zJrDT+PwNqO6i+zAzINIbict8qN2xaagfpQr/J
         NLfm6KC7QaqcNPSatlKzqsw2X/3bbxO9YJVyJvdKziCG0AbRO3Rbddhwf34kJF4wFKo7
         W97zdmnIi6j2QlPuR3TByxMdNDC8gSuuEGXhVKLIXVgdoiuAMykBfYReNwkGjxrMOWfk
         f5fA==
X-Forwarded-Encrypted: i=1; AJvYcCUMt4zj/ozEKTo8goehjaLSr299tWEBFgWApFsESURMYA6UZJi4D8pyAtXSS3xQ/yRzFffh@lists.linux.dev
X-Gm-Message-State: AOJu0YwwimcH4le30Jna5v7DVXrPkVH2LPcvyvQ2dISUrKUO211KmUFn
	osDtAGQCLyS4m8+vRT4ENI09R5BXp0GGxGTWS/QSi+xqe81OC4XT4MUSi9iulD/Nu0CeRxZTFWy
	cdkI3YiflyRhEG+w+ZA==
X-Google-Smtp-Source: AGHT+IE2qIYxI4Vw1+ECgA1gn5ogbwuagPgH2cctNTftSEDiGSn1/+RvZtZON2v3lqv5N/Nfcs1I9R9CXWA7rAA=
X-Received: from wmwg2.prod.google.com ([2002:a05:600d:8242:b0:45d:e2f3:c626])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3512:b0:471:12c2:201f with SMTP id 5b1f17b1804b1-471179134f0mr67710035e9.32.1760807387121;
 Sat, 18 Oct 2025 10:09:47 -0700 (PDT)
Date: Sat, 18 Oct 2025 17:09:46 +0000
In-Reply-To: <aPPIL6dl8aYHZr8B@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251015-cstr-core-v17-0-dc5e7aec870d@gmail.com> <aPPIL6dl8aYHZr8B@google.com>
Message-ID: <aPPJ2qDhxXNh8360@google.com>
Subject: Re: [PATCH v17 00/11] rust: replace kernel::str::CStr w/ core::ffi::CStr
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Russ Weight <russ.weight@linux.dev>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Jens Axboe <axboe@kernel.dk>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	"Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=" <kwilczynski@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-pci@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sat, Oct 18, 2025 at 05:02:39PM +0000, Alice Ryhl wrote:
> On Wed, Oct 15, 2025 at 03:24:30PM -0400, Tamir Duberstein wrote:
> > This picks up from Michal Rostecki's work[0]. Per Michal's guidance I
> > have omitted Co-authored tags, as the end result is quite different.
> > 
> > This series is intended to be taken through rust-next. The final patch
> > in the series requires some other subsystems' `Acked-by`s:
> > - drivers/android/binder/stats.rs: rust_binder. Alice, could you take a
> >   look?
> > - rust/kernel/device.rs: driver-core. Already acked by gregkh.
> > - rust/kernel/firmware.rs: driver-core. Danilo, could you take a look?
> > - rust/kernel/seq_file.rs: vfs. Christian, could you take a look?
> > - rust/kernel/sync/*: locking-core. Boqun, could you take a look?
> > 
> > Link: https://lore.kernel.org/rust-for-linux/20240819153656.28807-2-vadorovsky@protonmail.com/t/#u [0]
> > Closes: https://github.com/Rust-for-Linux/linux/issues/1075
> > 
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> 
> You need a few more changes:

One more:

diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
index 69efbdb4c85a..5489961a62ca 100644
--- a/rust/kernel/drm/ioctl.rs
+++ b/rust/kernel/drm/ioctl.rs
@@ -156,7 +156,7 @@ macro_rules! declare_drm_ioctls {
                         Some($cmd)
                     },
                     flags: $flags,
-                    name: $crate::c_str!(::core::stringify!($cmd)).as_char_ptr(),
+                    name: $crate::str::as_char_ptr_in_const_context($crate::c_str!(::core::stringify!($cmd))),
                 }
             ),*];
             ioctls
