Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDB41A314B
	for <llvm@lists.linux.dev>; Mon, 10 Mar 2025 13:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741612540; cv=none; b=UjyUa3AADZl+qk6VXwjPMVmEGhc6YyyZMSvqU3/Ix8kK5o5rLIS6oA2RcFr1FAj5VxS3GkpbqqiLF8lyos8HmnnSJs75wdAGLCzOS4cIQvXIDb/rZDWiRk0VzxikgV4fTke5AX2emm1Nq97fRhZeIaa34InLiNxBwHIwOVWnhIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741612540; c=relaxed/simple;
	bh=vK5tFz6cAoc3BRInBg6lxuhPY7r7H7slA5Y0fpKWcN0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lb9FYc9q67lbcLW6p/Fz07h1Dud6VXnv6pBCgPBvz0yZ3Bm43mmoZoUj4lqAmHxp61LVJWTJJCRnTGQFX5Vzl2V3mcVRYQlJ4sAcyNyt3p0fbhmzKnfDH5PrRMdfkGlWqFjg1nCRc8j0alCjjrQWiGqFaNtT5JS3U51JRLim0Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3QDJvc3z; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3QDJvc3z"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43947a0919aso35078725e9.0
        for <llvm@lists.linux.dev>; Mon, 10 Mar 2025 06:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741612537; x=1742217337; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+EEsvDIwxD+0/5fzD3wD3Tbua+FVDD1lHgd/aZ/hTzU=;
        b=3QDJvc3zznvBZrp1TstDXAzsN/XMd1qfneI7+kK4N64NtcCRPHctt7aze881LiaqLr
         so7GUPYfavflBsaPq3CtIQTLLRGu8uGkPU5rBnldDKBNpRFzKcQJ2SdtjvQEVgr0m4Fi
         Ll58xKBgyLjfMH58g6pLScUre3F88AEs2RXZNImylsIXNPPTbQwKR/ukgCYVMnpr1d0k
         se+KRKUTpYknC9/bjidJTtUTHhDFxHPykD0bqlkq0l9CI6ppZ7rPnViQvKI9P2OGFVqC
         vt7G0xwNxLt74CeNgnT4C90glPsM04q5kItFNTPh6bCQXOD63Gfv5E43C2MBW7aGCabZ
         OHQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741612537; x=1742217337;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+EEsvDIwxD+0/5fzD3wD3Tbua+FVDD1lHgd/aZ/hTzU=;
        b=YLELTmDopWBcNpxeyKnJxgJAcKEipxC7i/+wgqQs2j8yBQaN1bNYR2ntP7IHbTRRIr
         hAqyT/Ur0MZma7/8WX/j7L5eVPI79P/cLuPmvun0Yr+bemBD0nPJLgAMtmazApQMn6gl
         Ul+A44sWydRMFlw7lJJN3NyM5Wg7du546nU4cWziCfFKbZoxgNafzDMWlwlDyqc4L4lk
         zo9i8+5OwZ8eI0gO0IvNBpgjOHVQoSVwfkpvnKUFGHmwTLjjHkecOKcN8RjnqOPINazY
         hdPLunje8TX/RM9CG10E9DkSw4c1wUUyW1QY1yjKzSP9Y+H0R7N9GPQBcqqqE5IAvmhX
         kzFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqfSIH5gRllfphUzK136YoMjyV0xjgyrCVqD8T9qJI7ZfSJAYltYtP2YTisYmcx25B9c9l@lists.linux.dev
X-Gm-Message-State: AOJu0YyqKRJxYsIzkxqjAKsedhHHDWdCqim1kbvZm3jOhomWsEI9UbTp
	S5ZjjkdsTwIPob4bfuZPbQxwjj70JNNosA0LGtVM2WfPD/pglU1nwAVZZQW64M4mfAp8AZSMUD3
	LZlFy7DGEx45j3w==
X-Google-Smtp-Source: AGHT+IFAKBqCVDoWZNPtAoyGlnefO3AJox8H3Fg09QiDkuEe6afbmhhVGIrGRzga25ARaMG6blRd6xBWUg2R+xw=
X-Received: from wmbhc5.prod.google.com ([2002:a05:600c:8705:b0:43c:fab0:ce54])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fc6:b0:43c:fb95:c752 with SMTP id 5b1f17b1804b1-43cfb95cc79mr20397035e9.3.1741612536744;
 Mon, 10 Mar 2025 06:15:36 -0700 (PDT)
Date: Mon, 10 Mar 2025 13:15:34 +0000
In-Reply-To: <20250309-faux-inline-v1-1-c1b692862433@ethancedwards.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250309-faux-inline-v1-1-c1b692862433@ethancedwards.com>
Message-ID: <Z87l9qENkwuea03Z@google.com>
Subject: Re: [PATCH] rust/kernel/faux: mark Registration methods inline
From: Alice Ryhl <aliceryhl@google.com>
To: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Sun, Mar 09, 2025 at 10:14:36PM -0400, Ethan Carter Edwards wrote:
> When building the kernel on Arch Linux using on x86_64 with tools:
> $ rustc --version
> rustc 1.84.0 (9fc6b4312 2025-01-07)
> $ cargo --version
> cargo 1.84.0 (66221abde 2024-11-19)
> $ clang --version
> clang version 19.1.7
> Target: x86_64-pc-linux-gnu
> 
> The following symbols are generated:
> $ nm vmlinux | rg ' _R' | rustfilt | rg faux
> ffffffff81959ae0 T <kernel::faux::Registration>::new
> ffffffff81959b40 T <kernel::faux::Registration as core::ops::drop::Drop>::drop
> 
> However, these Rust symbols are wrappers around bindings in the C faux
> code. Inlining these functions removes the middle-man wrapper function
> After applying this patch, the above function signatures disappear.
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>

LGTM to me.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
