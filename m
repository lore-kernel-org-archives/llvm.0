Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A1523BCEE
	for <llvm@lists.linux.dev>; Mon, 24 Nov 2025 01:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763948440; cv=none; b=Ufekk0eFqDjFgM9N35sIWgLpK1ZfgjfNPI+aC5BOoAZAimjRQvJ+2WE5BCg5YDPIWTrypFxGA8Aa2uYKFCbpiNEl5ZBJKZxfnX44xSeZzIohq+OEqIP8maLGsHL4cidYoJpezIXBBWTZxesAZQ9dzGR0FRwLaLgIZSvUr9PUvfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763948440; c=relaxed/simple;
	bh=U0mWAOFY/KvS1IDb78vj1ueFROS6qmeAjXM0xlP2rT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=If0HHnaIvKoWIb8XKQ7x6vDhqoab2ScZW5W2fclxVbVdIoqcJKFI3evpbmhzrktk1W47i7t6B+t9DTRJ9s7ZVoDHZ8kXccBEGqbUVpQ91VBPBn1FIKCP7bZ3vd47SwdXmzHR2KHQaYu43qlyixmeuEOFNzXVOJsH4pwzKbHkemY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XkZ040yw; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XkZ040yw"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5957befc880so512879e87.0
        for <llvm@lists.linux.dev>; Sun, 23 Nov 2025 17:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763948437; x=1764553237; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0mWAOFY/KvS1IDb78vj1ueFROS6qmeAjXM0xlP2rT0=;
        b=XkZ040ywbULUV1EyNWiYjktQIrBi5PM8huB68IgM0stzHUlYSe0l4srqDuneh2zy4H
         sowhDaNH3cXZOcrIzlh/NqsU1QksxaZARE8pVE1atBk37+o8irRfKtY5/R19pacFWrbR
         C1tK8atFRBPXrPkfyS1Dwi8bE3qWtAskpTN14CkKo95om+waW2V4FAmFeRj0SZPTXmKM
         SHuTz//Yqvxko6lSIB4CPfenD7bNRmwyzADOEtiVjhP4kM54lJmf8ffLaBbMloBeXoeb
         Jx86cU6DDAw7d+mRkcJVGkcTtrqe+Ws+iVZMhIxxmQ/+WabPe2p5e6/msadLgH9h+OQu
         Q5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763948437; x=1764553237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U0mWAOFY/KvS1IDb78vj1ueFROS6qmeAjXM0xlP2rT0=;
        b=omf5HxW4/kT0Rv+cproRS+rMMNw782U1VY4DxNyYePaK9vb/KZttdp47e1zWRS4MhP
         uhyrZBqCwRD8LLzpwzLXPxBgnd7xWB7K8a8Ad6CGq1itaWWY7a4oqeBwGj5g8WnB+BSe
         F8LCchL3nXZVK3BlfoFuyUITRVdbubqZRqnONZXcta0jlOTCDWVSU9IbMsQoDzVEuPn3
         EeJG0TkSdyudG2RfI+7/NmPamPjFl9/rDuHdGie+nMvpxMyGx2ferVKFjs0XcRC5T79J
         AUz7lShetdhiCD7pv1prFk03Lj0G7O+oCjMu0mJbel+BgvCNl2aOs+i+NRA5/UWtVynt
         ds7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWpbG52r3NxbTNpI1Xy8V5NlITt8kqmYcTxBkbkWqMyeKd9gSUj+1tgoEbpFod7kLoqc+Uj@lists.linux.dev
X-Gm-Message-State: AOJu0YwJiLR2UvvOdAMbiWJOJVEEUsj3IcggLP7+eUGRTzGJX5eDkOi/
	HHh05R2GOIsNDINK1PbI6C8b6b7pPuwRlakxFkI7Z0ixx9sptSd82NA1q/mZN5bhx55qph+gwAj
	QOl3+eK1WCcFtKsMFRAviPqsM8sg/IY4=
X-Gm-Gg: ASbGncu6ZZVe5Me3e+m5GiMGd5dmRppmlaTjJMWeGo3a0tCUbODqsYpzwQ09mnZG9Mj
	MjUP443Ug29tlzYNS6VPWIW0KvNZsukSwUK+g1WayzRo/C6OnqfhQ6gT383jd0oobUaCD8aqOLA
	JASzeSEm5eSQ0KSWddllSwoFjevutONMwO8dzLrStKrecz9WjAW4YKHT07gpULApuI26VirLgu7
	oeTOfquSbgMEdYzouQIAyAqB8r4SvGKGvDLlborGxnOqoqDmwvNMSgf7oW9ahztUOsE6JBFXQP8
	AhHyQqGttrjO39VlqCvEkXj75rMrowWnlsxKqw4P/o7VKX9rtYfNP/nofBw6EyTvCWxkZUCYI6k
	TA1iu+bZ/eAfTnQ==
X-Google-Smtp-Source: AGHT+IGJ0/QqoFdh3XscVl74AmQLSg+MmbSCdBIAO+xihAcbKpwhdVEc+6URPzsvr/D4O5MVqOIaGXgotk7kl+mskSI=
X-Received: by 2002:a05:6512:4028:b0:594:33db:2836 with SMTP id
 2adb3069b0e04-596a52f41famr1664493e87.6.1763948436852; Sun, 23 Nov 2025
 17:40:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com> <20251124-gcc-rust-v4-v4-1-4e06e07421ae@gmail.com>
In-Reply-To: <20251124-gcc-rust-v4-v4-1-4e06e07421ae@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Nov 2025 02:40:22 +0100
X-Gm-Features: AWmQ_bkux8gOmOA5I7Y1blTc1OP02EBuH81WNeWf8pohbW3LHlgv9oWzHxyvbW4
Message-ID: <CANiq72=QFL9-b7P0UBFT9VCCOQ9BKS4WUR0Q7wWioG7nAijr9w@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] rust: export BINDGEN_TARGET from a separate Makefile
To: Asuna Yang <spriteovo@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <wangruikang@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, 
	Jason Montleon <jmontleo@redhat.com>, Conor Dooley <conor@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 1:23=E2=80=AFAM Asuna Yang <spriteovo@gmail.com> wr=
ote:
>
> A subsequent commit will add a new function `rust-bindgen-option` to
> `scripts/Kconfig.include`. The bindgen backend requires the `--target`
> option for cross compiling, but variable `BINDGEN_TARGET` in
> `rust/Makefile` cannot be exported to `scripts/Kconfig.include`.

Please end with another paragraph saying what the commit does, e.g.
"Thus move the variable to a new `Makefile` that can then be imported
from the main `Makefile`" or similar.

Also, I am not sure if this should be called `Makefile.bindgen`, but I
guess it is fine as it is -- with the current name, the new file
should be covered by the `F: scripts/*rust*` rule in `MAINTAINERS`
already, so this looks OK, but please double-check it is the case.

Finally, is it possible to put this under `need-compiler` like
`Makefile.compiler`? I don't think we need to evaluate those options
for things like `make help`, but perhaps I am missing something.
Please see commit 805b2e1d427a ("kbuild: include Makefile.compiler
only when compiler is needed").

Thanks!

Cheers,
Miguel
