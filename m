Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F4921CC59
	for <llvm@lists.linux.dev>; Mon, 17 Mar 2025 10:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742207596; cv=none; b=PBiJi5XiLQqw6OJ6mX1qEkdiu9kSZ1sT/OsnEVP9RZJsGgthqhRhzLtNLhLkRUE8tUfbRIxEtsdGOlMC3pcvHwfukD2uWl4l60EwTm8focxJn3oIhSg1kkv+HpJm2miIvWVOgyfLKXfsNUCH+rKB/n5hxPKkgfeX3hsXqwIZDo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742207596; c=relaxed/simple;
	bh=wxqfJvAeKGlWHNzYJYtMeNgpJTRM7JG0J2iuiWF/RpA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VrP2zizMo2T/EHtuH3ceVnuyt25lhZYANJFjYdrLYLRKUcXF54+c0zHDlcQnTkFpoQh6xiA8xQA5mpXyBukq72BwLzsOEMTijO1TwQOMykS5FkxN1Tfs4DC0nAvjXPfFQCfjMrp7QW/K9CZx2Q2BqM2+NXqG14xuN5+5J64PCGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=od68Gf9t; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="od68Gf9t"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d01024089so16463605e9.1
        for <llvm@lists.linux.dev>; Mon, 17 Mar 2025 03:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742207592; x=1742812392; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IvLoYXAbsczx0XYVJotNCJOKB5QuWZcwFTDWX8BS84g=;
        b=od68Gf9tQzmDIYR2XuVCoSIJ2doCVzvV1y+wdvGuuXNERjx8rnyWnRoZO1hPAvVujZ
         mAQ4mX1sNAg+yQx+Hl23qRfulXnOD8l9U2PXk6nhX36CjvOVg6ODsCnK/vWn8ysxHPe+
         jyCbdIK0poyMNvoiq7IK4udQwP3gRCmYH7Tod7C8t7cBOU6QKvhuQdzj4KalnNhgnKkg
         dv7ekmCTmFeQeSARBYyFqs2mZVTclG4rHpK1/txH0H8vR6o5Z17OxoeJC/rRMT8Wiy6X
         toiZ9kEiQ9w6rnngp8DMgPwO41srgePt7wkNjGmu4PmzDjzN7TiTdPRqCfy4g95Arwdx
         Xp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742207592; x=1742812392;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IvLoYXAbsczx0XYVJotNCJOKB5QuWZcwFTDWX8BS84g=;
        b=r6+nyqVw2O/rvtYf6oEtNltX45DbA5cKvQJ5EYVF2aZF+s/gLRlxT8pEN4KQ/8Can3
         tqcHSpgMF88ii0/a2aXJXg8NXAJdUcza6C7OuzibECGQQw+1/ZQmtanUjWKNk/DUsGSs
         zjfrtxW/csqAXOyzLLlJBUTOzeAd5vyMwOXk1JBLJKHnjixjpnCJy04ZpzwjcAsRh8Qp
         ipUIu6HVsnmSRfE+uEXpNENxIrplqKmX1+ThYJOC6EbBCBgqomxIcTemsns3p2TXZ6aE
         nmvZAcfKO2OkT/85nJQ5pgUZle1Tl3GSspzPHYZWgNDLSo9pSAy+m4hf+eZr1Kh0mfg/
         zttA==
X-Forwarded-Encrypted: i=1; AJvYcCXIdS+vVBTId1uRvIBYDkZ5tuRojUXdJqEp/T8QlLgBA6tJyLEtJvVbQF0LlhOpgH6XFJKH@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3Ko+cMqq7iMLBd5ji1s5ny++t7SFi0fkldI9pIBHGvoKY2P/R
	UE7e0I9slC8aPYBxQQI9hMaBit6wBtrY9g3Dvt90cwsSjjsSR3EnPZb2fCocXWx2xT9bfSuwD4+
	yEaClMhXsusAeBQ==
X-Google-Smtp-Source: AGHT+IHGHyX+6ByhebHTO9V3LY5GS887qbOd27cikxIO2WguSKFpckY3Ttr8Dc4mg9GMsrlGAQAL0Lzpoi+1cFY=
X-Received: from wmbgz10.prod.google.com ([2002:a05:600c:888a:b0:43b:d6ca:6dd3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:35c9:b0:43c:fd72:f039 with SMTP id 5b1f17b1804b1-43d1ec835e8mr138658855e9.11.1742207592764;
 Mon, 17 Mar 2025 03:33:12 -0700 (PDT)
Date: Mon, 17 Mar 2025 10:33:10 +0000
In-Reply-To: <20250317094004.2622640-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250317094004.2622640-1-kunwu.chan@linux.dev>
Message-ID: <Z9f6Zi2_eZFFY0Q7@google.com>
Subject: Re: [PATCH] rust: page:: optimize rust symbol generation for Page
From: Alice Ryhl <aliceryhl@google.com>
To: Kunwu Chan <kunwu.chan@linux.dev>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Kunwu Chan <kunwu.chan@hotmail.com>, 
	Grace Deng <Grace.Deng006@gmail.com>
Content-Type: text/plain; charset="utf-8"

On Mon, Mar 17, 2025 at 05:40:04PM +0800, Kunwu Chan wrote:
> From: Kunwu Chan <kunwu.chan@hotmail.com>
> 
> When build the kernel using the llvm-18.1.3-rust-1.85.0-x86_64
> with ARCH=arm64, the following symbols are generated:
> 
> $nm vmlinux | grep ' _R'.*Page | rustfilt
> ffff8000805b6f98 T <kernel::page::Page>::alloc_page
> ffff8000805b715c T <kernel::page::Page>::fill_zero_raw
> ffff8000805b720c T <kernel::page::Page>::copy_from_user_slice_raw
> ffff8000805b6fb4 T <kernel::page::Page>::read_raw
> ffff8000805b7088 T <kernel::page::Page>::write_raw
> ffff8000805b72fc T <kernel::page::Page as core::ops::drop::Drop>::drop
> 
> These Rust symbols are trivial wrappers around the C functions
> alloc_pages, kunmap_local and __free_pages.
> It doesn't make sense to go through a trivial wrapper for these
> functions, so mark them inline.
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Co-developed-by: Grace Deng <Grace.Deng006@Gmail.com>
> Signed-off-by: Grace Deng <Grace.Deng006@Gmail.com>
> Signed-off-by: Kunwu Chan <kunwu.chan@hotmail.com>

For sure `alloc_page` and `drop` should be inline, but the other methods
are not as simple. It is less clear that they should be inline.

At the very least, the claim that they are a trivial wrapper around
"kunmap_local" is false. They don't just call that method.

Alice
