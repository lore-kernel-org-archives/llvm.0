Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FADB219E4
	for <llvm@lists.linux.dev>; Mon, 12 May 2025 13:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747057657; cv=none; b=KoEgBSamxJ2TZ/l9GuRdXEm7i7GSr31ABqUqj3tFOYL6seQtlN4dY/hUQ928+0OUXjRJnoXxmQldUS+TUKFxojq+4rrbK9qyB0Y5bkmL7PjUDSQcNy7X/l1lurljyRE1FVickLQUOrNEVD/SuvCNPlfJDVGO4l+LN5BFRWMa3u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747057657; c=relaxed/simple;
	bh=ff/BkoK0UAKrKgoa/SVlnryGs4F19dLoJj5SVwSUo4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ddrXT1ReUPcEaSW7+EGfnACSjpXLqcI/acdpSGgJWjqwaAtrXpabcScg6QASBqT6u9/y1KXJma/A7yQ+2j2JfNQ89UETQvMqXVHX4T0rjziVSRrLj9IGfiKRhyb1YX4bBPItvgaQx/HjGecF7lil6lKNPsPRqRq2u4lqJihu7QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lp2xWcU/; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lp2xWcU/"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b1faa09bae7so650739a12.1
        for <llvm@lists.linux.dev>; Mon, 12 May 2025 06:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747057655; x=1747662455; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nSSN0QVCB0auKOlByp57Ot7u5PowxUCeUXro48vkcbw=;
        b=Lp2xWcU/KhsCGhZ6/in3lLUiO4tjYvHOBaPJawEC9l/GebndbMXgMRCJKDNK8mYC2J
         rc1WhC3xWkn6RawHyP0DOZdipruR3VGXiWI860D7KqG+TE1sc+n/6GAIbdlrOLjpd9jP
         7N7ino8Tlb8of1TmT1quX5bNscnAu0HpYOCaI9F45UGxHY/JIeid0nPfYGG8aBJaqGsx
         3gfCY1saYDEZ1hqdTuRdnAaiNsp+jPrhuBpLpFKnYYn4L2spjnx0sJklxUSb9QfmA5aU
         /zdtGbpo5xLAiUtHjMNVb5NOcDEvsU3JB9vhVEMVlLHCCQfdFWBRjClgmhDoNeqmJUnZ
         Hgmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747057655; x=1747662455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nSSN0QVCB0auKOlByp57Ot7u5PowxUCeUXro48vkcbw=;
        b=FEJzYEMIRR/FdDsmFFSDJK+ujndMfn83S9hQdFWmxQWadxL8nVYSOl8/EG5WVfu/Zi
         EQpUkpNpfcA2ma9QJlwoturYFypIvENrDXd7DjhlHOXVqSt3NUfCxA5EjdRKYuJmKs/v
         qR6SNcBmmC05I3njpxP7vRi6rwuqCTE8YY4LsGCDeGDdfUSFKEuWeWd8XX/ku+9r0CZP
         WsKdH+XMbY0FldzSXFIOJjbMhQOyomwarI5SyYUFfpFRBh9wvKyzX9FLvMNSf2FEpGwT
         oxXdemwihKoXb+UPfgRj1URtfSWM8TX/wgaRKgj4g5lwlVm8WDMrDUxT53FwK1Zzu0t+
         dsXA==
X-Forwarded-Encrypted: i=1; AJvYcCXv3h4tJydZB9vnJCuObgiVrmWXGn6Z/4l5l+8GV6OtV6jfZ1KatXca2C9hpMXmAXITFMkf@lists.linux.dev
X-Gm-Message-State: AOJu0YwsBaKp84VmsQZIRGoTbRSSGu/bLc42KtnaSwWzgPTmBYDxDcnd
	vtdQ2C14s5pa2WB0oDznTWlaW+FfBjcAhdcqAYN/NB8Y/j1edlpAlncKgbNuLOwERBf6pcSBnKK
	B1MFLE4RGHFT5CbhevwNw5D7iMY8=
X-Gm-Gg: ASbGncs157krIRg1vL3ywokvlJ/rC4ZusNicCvmHVcU9022kGb4Jv2WeUReoGNC7d0J
	oCD2BDETFeQerXfIxpGZvSBQ1vLwe/5qv6wRxFR5/vdyYHljhdbHR1G2pAjobRMpBErOyBhZQ4g
	pa5dKGXzBhhWvDjF751veZWOeN95SF5YwK
X-Google-Smtp-Source: AGHT+IHicxSAY2ahCa82NqPdRsKS2nLtw4K9WryM+tvkR9Vd6fIZ0xjbPPFQnJMiW6iVED0G6oSwMwOYHzh4pwOBru8=
X-Received: by 2002:a17:903:2984:b0:22e:62c3:8c5d with SMTP id
 d9443c01a7336-22fc8c8c1bcmr74033075ad.8.1747057655140; Mon, 12 May 2025
 06:47:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250321080124.484647-1-kunwu.chan@linux.dev>
In-Reply-To: <20250321080124.484647-1-kunwu.chan@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 May 2025 15:47:23 +0200
X-Gm-Features: AX0GCFtjrAQIZQvRJ49eTgAfdFwyQYEsuDLwSVRff4tQTTKSn5Eq48N-yLr6Y1U
Message-ID: <CANiq72nQuRr0+U9QkAx_d01hymgwsor3SQKQFNt0Y3SStFOfDw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: page:: optimize rust symbol generation for Page
To: Kunwu Chan <kunwu.chan@linux.dev>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, 
	morbo@google.com, justinstitt@google.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Kunwu Chan <kunwu.chan@hotmail.com>, Grace Deng <Grace.Deng006@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 9:02=E2=80=AFAM Kunwu Chan <kunwu.chan@linux.dev> w=
rote:
>
> When build the kernel using the llvm-18.1.3-rust-1.85.0-x86_64
> with ARCH=3Darm64, the following symbols are generated:
>
> $nm vmlinux | grep ' _R'.*Page | rustfilt
> ffff8000805b6f98 T <kernel::page::Page>::alloc_page
> ffff8000805b715c T <kernel::page::Page>::fill_zero_raw
> ffff8000805b720c T <kernel::page::Page>::copy_from_user_slice_raw
> ffff8000805b6fb4 T <kernel::page::Page>::read_raw
> ffff8000805b7088 T <kernel::page::Page>::write_raw
> ffff8000805b72fc T <kernel::page::Page as core::ops::drop::Drop>::drop
>
> These Rust symbols(alloc_page and drop) are trivial wrappers around the C
> functions alloc_pages and __free_pages. It doesn't make sense to go
> through a trivial wrapper for these functions, so mark them inline.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Co-developed-by: Grace Deng <Grace.Deng006@Gmail.com>
> Signed-off-by: Grace Deng <Grace.Deng006@Gmail.com>
> Signed-off-by: Kunwu Chan <kunwu.chan@hotmail.com>

Applied to `rust-next` -- thanks!

    [ Removed spurious colon in title. - Miguel ]

Cheers,
Miguel
