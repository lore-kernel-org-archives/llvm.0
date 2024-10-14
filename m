Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFA0143722
	for <llvm@lists.linux.dev>; Mon, 14 Oct 2024 22:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728943220; cv=none; b=Fdt5eROPYn1IL/7qjFCpD++VqteaEV1nuAcElE9D9yP50NaAGK1cVCMi4nafrn3FmH7J366/sWcUYvxUU4KHY3GoMdv/Lxl1K7yA7UK2rJpaAdV0EPlnuX2nrMj/yiMGFrNqfa5VxJXvB9DU0uAR51rNXUYKSDrlQL/AKwmv0+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728943220; c=relaxed/simple;
	bh=ainH7vJ99727OdH7V9JJvL8bV9sSTZ7LlUApGjnKJi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ioU443mnLe+MAbivlbPlVYhBiYgaQro55jfcefGsCJU/l49PYci3pyzPAoBGkmYrbkCgxHvaBjD2Z2NDU3yjjWWQVzOV1WeBUZcGQypFhvjCb/z1kfIdCikRRe8N5XJ61TbqXkEiztfcVfjUD8424pJbK1w3UJ0+S1z5103azHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dkKfQ5JT; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dkKfQ5JT"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2e2ee0a47fdso750250a91.2
        for <llvm@lists.linux.dev>; Mon, 14 Oct 2024 15:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728943217; x=1729548017; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ainH7vJ99727OdH7V9JJvL8bV9sSTZ7LlUApGjnKJi0=;
        b=dkKfQ5JTVs9YTKvLUIJpSrd7cvCThjWzqS07+L4NEytLI18VJZOmXuq3MGMOJlbZi7
         lp+bZvO8zKuOvy1l19Gv42fGNIlsf0oqHiNb/6wXR/LDAStuJ+Rl4VjWSSeLf4lDfUBx
         pTUiLTbW7lVsvX5W9ZqGepl2qApvqnDYiJ6Gn+1fGiHePwi+1NVuDXch7hfe+h2KU2sc
         pF3SmG3VD3gw07xG0UJU93pskHDfSurpk7gZ+3AcK1XhVbv65bYJX+NBulGPdL3qZtRW
         w7h10vA+GHBnAeqQpSYCM/QbilsU2+rfPpV5b2PUOnzYff7J8IfE97Sb+dgPdjVbFsgH
         /O+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728943217; x=1729548017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ainH7vJ99727OdH7V9JJvL8bV9sSTZ7LlUApGjnKJi0=;
        b=Bo3M89h5VzYFx7DEHOd5fWwThakV4uq84Fw7/ESAUSA4QkeOh2i1b7FXWASSrEjiaS
         5NjPuEJ9a744f1fWuEqOqai1wuac/mWH5C5uIIokG7HM0sf/lszyVAK3nlcZ6nq2jcva
         AcOXRW6YWyf6pKJ33lIl42U1GuQOAe8Nzq9gCJcbpjkjtPBuUW/zZvxO/O4n/nmqAT/G
         +/cvgiXzRcAf80EPTtq/YQKNGh+hVpXVdsWh3SwvhOfRWHqK3D2HJUHflEArB0cBzFzC
         4Q4pgRKje2S58i5A6jwxqBzTa0HZSiomrY+94liDoQTpdyZZ29piXX3EH21mMEF/8w5L
         wYDw==
X-Forwarded-Encrypted: i=1; AJvYcCXsA2jqyj6a2R6BOBXLCz4u8q3MLPTJvbgFT6aoSTkQhDxSECd1/ntg8jzNXpErHXURrDrV@lists.linux.dev
X-Gm-Message-State: AOJu0YxHDvIsSJ6hUSaAdHrcsdgP3A6XmNggYbjrzQ24Tvn7LDoLfJ+O
	Ktryy71qQg4JBUS8BbkjaWcvLvc3ZwSexIE1ISXEQgMllVMgA/gYixdhupXvOcA8ukcqvsFQYYS
	qF3Ysfaclpx2Wr/c/a+0oA5Bjul4=
X-Google-Smtp-Source: AGHT+IFAD9elRbupL1oE4+4Cv9+VWLhrGVJYAICeZoc3lw2uIcEONh0kUtsCxjjNqEUqwLG+Qa0DjzHGhVQsOeYstZo=
X-Received: by 2002:a17:90b:1056:b0:2e2:c423:8e16 with SMTP id
 98e67ed59e1d1-2e2f0a2fb66mr6635698a91.1.1728943217079; Mon, 14 Oct 2024
 15:00:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK7LNARBXt=CWy5CgtHqdePw5L6EtD15emS2Fvre4QWfm_LjUg@mail.gmail.com>
 <20241011114040.3900487-1-gary@garyguo.net> <CANiq72ne6F1HpoA5gLYu9K0CcNB13JUFK5QgF_Cf4tAyvOm4qQ@mail.gmail.com>
 <20241011130641.4a8419c1@eugeo> <CAK7LNAT99FbYh5nvUoEh9OHoPODYPEhyhaKAkELpi+3K0P8L-A@mail.gmail.com>
In-Reply-To: <CAK7LNAT99FbYh5nvUoEh9OHoPODYPEhyhaKAkELpi+3K0P8L-A@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 15 Oct 2024 00:00:05 +0200
Message-ID: <CANiq72kz6s6Wpm8tw=COO7qAL7oTQivTWxOmchd1WkynhNWjKQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: add `CONFIG_RUSTC_LLVM_VERSION`
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, Tejun Heo <tj@kernel.org>, 
	Yoann Congal <yoann.congal@smile.fr>, Randy Dunlap <rdunlap@infradead.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Jens Axboe <axboe@kernel.dk>, Jann Horn <jannh@google.com>, 
	Mark Rutland <mark.rutland@arm.com>, kees@kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, samitolvanen@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 6:27=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> I tend to agree with Muguel.
> The motivation of having cc-version in scripts/Kconfig.include
> is to check the presence of the supported C compiler, as C compiler
> is mandatory (in contrast, Rust compiler is optional).
>
> If you have a reason to have it in scripts/Kconfig.include
> for your future works, it is OK with me, but I cannot judge it.

Thanks Masahiro -- OK, since it seems Gary needs it, and we already
have the patch here, I will take that one.

Cheers,
Miguel
