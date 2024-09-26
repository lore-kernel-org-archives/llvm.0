Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EDE188CAE;
	Thu, 26 Sep 2024 21:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727387783; cv=none; b=DMuLC9o4TCF+14UwVRw+wP8gq3gqwW0GplgycHLdTpaWFwDE5OTBAVR2zKezcAq7csE13YY8jjBaReaLZZYNSsLWhFLEqdXcO+gp37XmPI3pDu1nDTfgk/YMkBvB2Bw7SaDPpAK3LCf7OMx3Fq1f66P1STfgICZda6heym3L4Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727387783; c=relaxed/simple;
	bh=ezFoP7R2uJ0sajdZSA/6raNM26HoWOTGBTP99jykClI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BgX7JXBUARJjbNupxPAX+idhZPPNBzA+OPzeWyNEDC7Az1NCGGUpOlgXdwRArBwsLPeccGIBXpVOf54/g+9wipyTIYKMmN5Or+oevI582N4eDROSoM24z+MwRAfgsHGZD0u0XkfAdUYj7SeSntNNqEAiC2fBkoYd05jOSToFCiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SoMltUmc; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SoMltUmc"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2e07d87adc2so259013a91.3;
        Thu, 26 Sep 2024 14:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727387781; x=1727992581; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ezFoP7R2uJ0sajdZSA/6raNM26HoWOTGBTP99jykClI=;
        b=SoMltUmcHm1FRuxhGWjPr4j48FRMXsTwUOaOdYYZQiVTd+G19dU3uSWM1Sd55Pp8NG
         7z81uUqd6IEQTKhKDsxTzDUFW3aJlkE9//AtOVQovzi+mGuM0godgWJ0mDG0Az3cFIIm
         jlVzs4M+T9bPM4hj0jOc3Pu5+r+LFEvJK5zvKkVbZ4I2YdaEe0KQnPUtYygXJMUhfQbF
         qJUcps9KfsQ9vQLBa549RZ9VT+WaobhuWNNRxHmzCb8wKhEgXzUBV46s+mBNYQHo5hyu
         td0uVElsBCUgEnnwEYNrlhjyTiMX42JeMbpoxfiArQvb2RLSKcrgHpmo/VSPDvm9Gbsv
         OmpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727387781; x=1727992581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ezFoP7R2uJ0sajdZSA/6raNM26HoWOTGBTP99jykClI=;
        b=l6gCrMo5NE2Cn/1RMUk/cmu0EZBZ7kWv7cTyI85FH5j6GWZg2DVrcRicjGkW2Q9bQ7
         sUkuW3YGjOxVfNaZYd55svXaPSySJXcIRuCqHppGRtCZFrqvJL0FWnS/jyIPUf8i6qxk
         I1iP1jGKLTdeTIaF5xgiuWai3hXqpnzrRX51vCY5Gew8gsL6U+sfW1VXQemLUB91HYTL
         g7NXwKDFwy/86CZJOaQds8krhT6lstGhAmACN1+RdsORabCYHWNWTbxRAEnbIk06JVD0
         IXn+3ba/ehLjb9o4qu5jrJufctHzCYzO8JTDjLBTMWiruz9RrG3fLexYM0+bLeN2YeR3
         xYkQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4We0DX7ZIr+ZhTEH7xGREwVzQ3UEqvZhpOJOcwgltEyw4qZ+Ap8mbQpTQRv5roIEff7eS@lists.linux.dev, AJvYcCW3Sku84PCGFMyJ1Y5WnjqtCNufQjA7kH843sfsWQlRyFED7q2vV04UaA3ybcPzzBYRTYsqiYkEuwUEyfDF6A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxSsAxH59N6ib/cKNLJS/9WwJhGansTgdPS2VxayPN90bYVnXCd
	jGmOGNui3ehB6urxEZyUDvXw3vAXLZkPAH1BEXjtxevPW2jDuzTUsmGxAxL1gvxpr0j+tZylEpp
	b8ncA6i2iPLfbzcmEYagY7b1OJSw=
X-Google-Smtp-Source: AGHT+IHsmcvC46PFz028lt0ZLIxr1vgttBNAU5FX0Km4jEuOfHa6nXZGlkeqfS4I94ENr/SIPuehLkJubOHtVpdax8o=
X-Received: by 2002:a17:90a:e392:b0:2e0:a931:cb16 with SMTP id
 98e67ed59e1d1-2e0b863229dmr560137a91.2.1727387781203; Thu, 26 Sep 2024
 14:56:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240925205244.873020-2-benno.lossin@proton.me>
 <202409270303.kUIAmOmY-lkp@intel.com> <42d17306-1ac6-4fc7-ab1b-69ef045039ac@proton.me>
In-Reply-To: <42d17306-1ac6-4fc7-ab1b-69ef045039ac@proton.me>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Sep 2024 23:56:08 +0200
Message-ID: <CANiq72kXGNyLg0Ooo3Ne=KmZWBnSO9HE2tcfP=gf+WGFqnjDEg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: add untrusted data abstraction
To: Benno Lossin <benno.lossin@proton.me>
Cc: kernel test robot <lkp@intel.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Greg KH <greg@kroah.com>, Simona Vetter <simona.vetter@ffwll.ch>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 11:40=E2=80=AFPM Benno Lossin <benno.lossin@proton.=
me> wrote:
>
> I would like to use `#[cfg("rust version <=3D 1.82")]`, but I don't know
> how to do that. Do we already have support for checking the version in a
> cfg? The alternative would be `#[allow(unreachable_patterns)]`, but I
> would like to avoid that.

We can do it, but it requires adding a Kconfig symbol, sadly, since
`cfg` does not support numerical comparisons there.

See commit 93dc3be19450 ("docs: rust: include other expressions in
conditional compilation section") where I explained it.

So depending on how often we think we will hit this, we may want to
pay the "cost" of the extra Kconfig symbol. Otherwise, we can just
`allow` it as you say.

(There are discussions in Rust about `cfg(version(...))`, but that is
for the future -- I have some links at
https://github.com/Rust-for-Linux/linux/issues/354)

Cheers,
Miguel
