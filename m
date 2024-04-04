Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB311DFCE
	for <llvm@lists.linux.dev>; Thu,  4 Apr 2024 18:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712256212; cv=none; b=XiDz+qbQflwkUMviQis3ROydx3gTWNk/4p/KOx9i3vQ8WDKKbbLL4MOvZfl7gFutgfnpnKTeg7F/sbbuhk04QL6fM1ClK/Z4eHgR7+YU6M5NzG3TMCNIeXONuDVtA4Fzl9ls2YX3YM4W+i+15i5/w6wYjeP+BF5kM2nsK7bzCuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712256212; c=relaxed/simple;
	bh=lNeaNNlhbREvV2krr1ClfJeQ8ozUNbsQyuKB+WQvTCE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iQV37vWAQjuYWbK8/35i0Wjp0A4LxIM97fuTU9Sv/TiKmIndDj1EuxE9vJ03Xiot5bMKcWedcQlnVRpY3Eg8kv7g8QWyPol/0aEtsNIG7uKkfDlVrM8EU6sBc7N1qNtLxBpOb2OrY/efQRK9hufG8Vx5HN+smwcFoNhso5cIAsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D8I7t2Px; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D8I7t2Px"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5ca29c131ebso931064a12.0
        for <llvm@lists.linux.dev>; Thu, 04 Apr 2024 11:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712256210; x=1712861010; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNeaNNlhbREvV2krr1ClfJeQ8ozUNbsQyuKB+WQvTCE=;
        b=D8I7t2PxDmpioLb1wSqYXQpft4WbmLkBr7ATJhw0jFwwBSsnR2mdghzVWrh0cHK2ay
         WgQJ6leWw+qkP1CkNF9b1MHOPkxlqV1DipY6IgHpQgxtNREWMVN1GX7c42P6sgnmBRp6
         SMY7NYfMupW3Pd0cBFVzfBd4m7PGSdIYQkEWU0teUFCx1nQ215Q4aW54JWPSRYYvN7nQ
         RlDrCQti3lauIL+t3VAjOP91W1whQoXZEpmyNVu4uIRWYHJjA8wllmFMI5M/JTapkRRU
         +er69puyWmWJt0DvG7NTvrguJWX9MGalWoAlwyRwt2K+EAuhfE58qH2tFno4nj5RteYs
         /1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712256210; x=1712861010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lNeaNNlhbREvV2krr1ClfJeQ8ozUNbsQyuKB+WQvTCE=;
        b=gdWoKGp4Anp5cIFINWZPQwPVChlqfkdoyMmI3tPb9zR3uqfudyEs2GZF3DC9kxiKKz
         VLht8evU/LsOBQmYeXYyha7EN7vmTid/IPwFYU8JsV1vugfbYyUaKyFQqPOBOFIutRVk
         EeVGmrDIR7IBvngyOWM5jKLaIaMMf+P8IKFq/6vJoyruXr2Id2ZOAfA3osnhSdrybPSe
         wRQZFetETf2C0nw0ZdMl+xGu7XBvfQADB6Y+qA+x8uYZP5ByLkXRneFBYQXBcLhPU+a3
         VDxqt5FDjNXVmtvEIktuCZIH9y2PTA5gPRc7KBBSwrxAPogYYqrNdn5Lz8kiVL31G8JL
         fgJQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5/IZ2djkRMvdgVk/exCD3f0TJtL1H3NgaXO095BEqif2zFqCTBFqrfnD87aOeUSF+ffYKJZTXw6r60VMEeVm4kuZ+2A==
X-Gm-Message-State: AOJu0Ywfbj7dCzid+TV0QI/zbdg7A9Y42IpSbzWnF9LMQGILs0/f2uNX
	XVevT6qNvsjgeNrA5DuFSgjEJGK8vcX8OEEitlWSa0F3mk1moT/42rnNLx0J2P1s5jO1yQq/IGf
	0twffotqflzEP7SPZZ3NWqBcGD+g=
X-Google-Smtp-Source: AGHT+IGL/ZuNDW+YAA14KxvITUONfWERjFMqYTVlIMjA2c3NxTdOFX1JFpnSxqA19fMs4gI4skjktyw1RgBSXBjql7I=
X-Received: by 2002:a17:90b:78b:b0:2a2:8a0e:1b81 with SMTP id
 l11-20020a17090b078b00b002a28a0e1b81mr3277609pjz.30.1712256210175; Thu, 04
 Apr 2024 11:43:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240404-providing-emporium-e652e359c711@spud> <20240404153258.GA852748@dev-arch.thelio-3990X>
In-Reply-To: <20240404153258.GA852748@dev-arch.thelio-3990X>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 4 Apr 2024 20:42:48 +0200
Message-ID: <CANiq72kSfC2j07mAaV591i4kDwejWRYcFTvASgQmNnHVe5ZwCw@mail.gmail.com>
Subject: Re: [PATCH v3] rust: make mutually exclusive with CFI_CLANG
To: Nathan Chancellor <nathan@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, stable@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <keescook@chromium.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 4, 2024 at 5:33=E2=80=AFPM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> Acked-by: Nathan Chancellor <nathan@kernel.org>

Thanks!

> It seems like this won't be forgotten about but if there is not already
> an issue open for this somewhere, it would be good to have one, since we
> obviously want this for both C and Rust code.

We track the unstable feature(s) at
https://github.com/Rust-for-Linux/linux/issues/2 (I just moved this
one there since it is close to ready, but it was in #355 previously,
and cleaned things up a bit).

On the Rust side, I think the main one is
https://github.com/rust-lang/rust/issues/89653.

It includes KCFI, but it is missing Matthew's PRs for KCFI etc. I
added a link to get those issues/PRs (or hopefully most of them):
https://github.com/rust-lang/rust/pulls?q=3Dis%3Apr+cfi+label%3APG-exploit-=
mitigations+-label%3Arollup

We could create an explicit/concrete issue for removing the `depends
on !` when Matthew sends the patches, though.

> As a general meta comment not directed at anyone in particualr, I think
> these 'depends on !' should all have some sort of comment or description
> as to why they are disabled. I can infer from most of them but it would
> still be good to be explicit, especially since someone might want to
> work on fixing the ones that are due to missing support and such.

That is definitely a good idea. An alternative could be linking an
issue instead (perhaps concrete ones for that, i.e. your other idea
above) so that we can update the status etc. easily.

Cheers,
Miguel
