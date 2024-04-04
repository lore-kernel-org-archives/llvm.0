Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813046F510
	for <llvm@lists.linux.dev>; Thu,  4 Apr 2024 22:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712270476; cv=none; b=DQMBJzmR6v1s07C3iH6PEHLlA7bxA6nMNUf1+oo2MnR16l2dTw905usvY5L2OxwHl34VZFO5t8PmIfQdfRGychg4ExX5YAs8kUXCJ76XSc8q74L652bnYv9BGLbTEjCnRAoDljP/2FdB6pTmZEMuDh5ADbp3UjKFLPkHN+/6LJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712270476; c=relaxed/simple;
	bh=8A5tKiFBa0lbUbCLGluriwofV6tCs9WRKtzaqV10d5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D4MXG8yfZAImTnvnCFam0SvtpDubiERfxW9j1Gfp5KTOkDjjt/qbLJbUsjghIEQFFrwQbaY/k1b+t6OEdMmQiGK3NwUwQKXwG/bXSbGKkA+kMBcqjt9H3fzhodd4DZGBA48cukqMm9XX13u9W81DYQDKlFb+gS93EZxB13QiSM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=20WY4gfu; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="20WY4gfu"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-4da99a22b18so555862e0c.3
        for <llvm@lists.linux.dev>; Thu, 04 Apr 2024 15:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712270473; x=1712875273; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8A5tKiFBa0lbUbCLGluriwofV6tCs9WRKtzaqV10d5w=;
        b=20WY4gfuIjuyrRIJ90MCm+b2vBIgPiZsjkiDPNPQ0FHqhzdjAvlofpSRhK1FDw/Wm7
         4bH455YyMwLayPGivpv+74Fw17X9MOfuW1saIwmRPNvnYjf+408fPU7oye8EpfvD5mMH
         zz9dwdO301cNA0aywiZSuLcGcq9qRijx71blrgDv+XvGu58aOc8kawmuh0S3apv64BBc
         x/fIh4loiG8L8lMNg7qO0yIruKP0M8wXuMLdrEfGxsH6vfguj3/9rbfcAI+DDwePkyXX
         Q/C9Xksw/Hybxv6V5XSjanfE8wSeOq0dwYIl1MlwdVrosvhTCHsCPQId8MzkwbcNXNQ2
         4U9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712270473; x=1712875273;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8A5tKiFBa0lbUbCLGluriwofV6tCs9WRKtzaqV10d5w=;
        b=aowQ0Umt4qL2i29/GnB3lIn+X807Ez4Y9tijhjsmvmy6tvMDQTj2lL09SNM5H6FaZ8
         t927JpDmQ9w6cFImw9+GFORuI7dhb6OSVhsw9SDKgz8RbfX8Ow8rayaDwabxncO/w8oC
         uc2IWC566pc7b7IHg9EeMXAZ4eoouEwO/ZKJxH1i5TFOYeAnIAjGHxjmRMoidGN3A0bJ
         7LckilbYokrMPo5hGUsiV2SJW6F3eTa/AOVXzflr1lzfCeA5sVsMCfzGIa0WxemenS47
         kUwJ/7nhTEDFB7Pock3nWXeImQqQa0jkaHSxx0esF7UCExf3o08bMlCmxquqCytwroqG
         mNKw==
X-Forwarded-Encrypted: i=1; AJvYcCX62I4D0GRgW1+NUImrnDMxnQGnetKPmm1LYP7n/7bSIJ9RjHC7pCctE/Lfih8eOCocDcefjMax7So7N8wEr++MdK8aJw==
X-Gm-Message-State: AOJu0YytR3SeYZaxtnU6ZPLlkiNp/cDze+CDCQaqj7HRxH0TzMIIuTSK
	50fZA7CyTAZA40zKMUH1M5974Si6j6GkoqcsoHaoHHxitYIF0Xflkw6hhbM9+74qJJXbh73aTA3
	21LrmK8hYrOirXq9q/3ciudNQNFw3OdBFRLmL
X-Google-Smtp-Source: AGHT+IFZOijUz7nc+slBJ8zOHyZ8cj9MgnjzviT3lXApOXO2vYVNI4DlpN571/pk/cWTagxBQ7uu8R14TkT0NKKSOs4=
X-Received: by 2002:ac5:cdf3:0:b0:4d3:3a0f:77ce with SMTP id
 v19-20020ac5cdf3000000b004d33a0f77cemr3746386vkn.13.1712270473349; Thu, 04
 Apr 2024 15:41:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240404-providing-emporium-e652e359c711@spud>
 <20240404153258.GA852748@dev-arch.thelio-3990X> <CANiq72kSfC2j07mAaV591i4kDwejWRYcFTvASgQmNnHVe5ZwCw@mail.gmail.com>
In-Reply-To: <CANiq72kSfC2j07mAaV591i4kDwejWRYcFTvASgQmNnHVe5ZwCw@mail.gmail.com>
From: Ramon de C Valle <rcvalle@google.com>
Date: Fri, 5 Apr 2024 00:41:02 +0200
Message-ID: <CAOcBZOS2kPyH0Dm7Fuh4GC3=v7nZhyzBj_-dKu3PfAnrHZvaxg@mail.gmail.com>
Subject: Re: [PATCH v3] rust: make mutually exclusive with CFI_CLANG
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, stable@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <keescook@chromium.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

>
> We track the unstable feature(s) at
> https://github.com/Rust-for-Linux/linux/issues/2 (I just moved this
> one there since it is close to ready, but it was in #355 previously,
> and cleaned things up a bit).

Sorry about that, I should've done this already. In addition to the
link you added above, here's a tracking issue for KCFI support for
Rust:
https://github.com/rust-lang/rust/issues/123479

There are still a few unresolved questions that I'd like to hear from
you as you experiment with it, which the tl,dr. is: KCFI support for
Rust shares most of its implementation with the CFI support, with some
key differences:

KCFI performs type tests differently and are implemented as different
LLVM passes than CFI to not require LTO.
KCFI has the limitation that a function or method may have one type id
assigned only.

Because of limitation listed above (2), the current KCFI
implementation (not CFI) does reifying of types (i.e., adds
shims/trampolines for indirect calls in these cases) for:

Supporting casting between function items, closures, and Fn trait objects.
Supporting methods being cast as function pointers.

There may be possible costs of these added levels of indirections for
KCFI for cache coherence/locality and performance, possible
introduction of gadgets or KCFI bypasses, and increased
artifact/binary sizes, which haven't been looked at yet, and I'm
honestly not super happy about it (but it's better than the original
proposal of adding shims/trampolines to every virtual call in the Rust
compiler), so I'd be interested in any performance results or
regressions you may have while experimenting with it, more
specifically:

Linux Kernel without KCFI vs Linux Kernel with KCFI vs Linux Kernel
with Rust and KCFI, possibly isolated to the code of a driver that has
an implementation in C vs an alternative implementation in Rust.
