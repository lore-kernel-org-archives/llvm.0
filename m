Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCAC1EA80;
	Thu, 22 May 2025 13:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747921745; cv=none; b=C5ED5mZCUWZTpN+lhtcL39W2MzJkUmmKQ3uCfmiTho4KSiY81vGJ3rakNUhZeBwjZA1YG3j80N6wdYBCbPttQFcZeXPyfvsebYIkJE27cZ9jOOH3WUuOGBHDJv2VzKo/uunVDERQYyJfdaS0T4Umj4TYxpwvubRav0LYbltAJdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747921745; c=relaxed/simple;
	bh=seTFlfjq6NSrzxnC63mhUew9n0vw2LOFO1OLNic6qCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IBTs7x9Ysa7cMv2aWeq7W45UeeNnCas9j20ysRR0Q+/blfNamEYP/J1Ax74iDrbJXGLzTGpFaLMtB+kcV8iXOAWczD/HLzfqdhw3vqPCsGj3hAI7w2Y6aOWPgl+n16/r+IqzywtwQ51Cn7yTqAeEMqMlDHGS234sy61jwC+SAqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CklrqvYm; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CklrqvYm"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-af5499ca131so800898a12.3;
        Thu, 22 May 2025 06:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747921744; x=1748526544; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=seTFlfjq6NSrzxnC63mhUew9n0vw2LOFO1OLNic6qCI=;
        b=CklrqvYmkrBNxj/UW3WEqhTv/sYkVZCxlR7ZfFSMd8na1O7MTXhWOFFqWvxzaBewNx
         5Ho9QtVRrXq265DcEjJ5THQkmpZNlNYBx81vc/CUBg45peBxY5ak/AGDCndgPLWbY4AU
         z7ybZc9UQookQ9d7wpZn08vcS9x+bq2+aaGoQK0kEP+RjJ/Qy0FYgyl5vliQSTaxoTiS
         X/yTAubI6rxDnIphRHozyyXvSjFoJIwO/jmCw5fWp0H457jAB3EKhM9lgqeh+3vlvZzE
         QLTPy8Dr6cY8YgAukOL2RANiFqnKhW8C6mR1sQ1BTNBQDRZ0tA9NioUGwnYzIPDZvgRh
         zxgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747921744; x=1748526544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=seTFlfjq6NSrzxnC63mhUew9n0vw2LOFO1OLNic6qCI=;
        b=b3ya0CrvKbIhDGQp9kmIjyKgg3JZYzwzndRDnrTCxgEO1x3cWsAYZffrh22R30TsNh
         JTWZbsmWuMmZ0w5PLWDTR6KV/e74niXSYdqNwQnV4vLupRJEWXBK0N/IY9q1NIQ4j1UP
         BiCRIUI2Up+WcQ/kQI2FnBydmmXpESDjlJzgS0eiixXBH3DBN/VCF0n5cH8d2N6ejiZa
         dlkdM7h16UOdRtR9fs5UztXOB/0jhKKx38C7roUMiIubDl7qLF8OulLaBwRfY4r+R72t
         xFhOWzNkFo9MWBGQmzvQuuspQsLJ6E012LyQbggXIVC1kRpWSyyuw+vHVz78ay7mViaZ
         5R+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWD73pxuYyIoWWieIh1uK0wBzxpNKle/943DAhFJTxFyP3NPMe7zi0C/iXngyv5vShEKU7wOGEZe92M9cg=@lists.linux.dev, AJvYcCXVxch5UNIzAjjU4WDjtWBZEvBrwL6zaTtuqiFxiXtSeMwGBM0GCl95JxOh2MCvFKdczim0@lists.linux.dev
X-Gm-Message-State: AOJu0YwlewWxY1ES+dZajEXrIQ6owt1/WvHl6jTl0tNCpE4z6Hx4NJX6
	DNoYLmEZPQCfcMJJMnnJS0PLCDkElZC7eKv2/8JRp7OQYU3ndEQ2LUyIYvyFPFdeNdNCG6reuEQ
	cTnvClyQq+baielGtBycNyhqqiDztYVCfQHt0TzjWeg==
X-Gm-Gg: ASbGnctNGg2AuywscvKE+AxKUp6Z19SutMBqrYK938zkUjXsSWX3dHfTkW2u73DxnZA
	2Yko/5t3QGsx6qanc6+wltNMvySEoSD8Rrr42eGP/Wyspc9FqibFm3yJ7cnEn9OiRwIvGOlUc3S
	bOa0pBC+o/SVExp7C8gJRbxCWFjQ8modMJ
X-Google-Smtp-Source: AGHT+IHmxBM4ElYPl0Cgle+X1a1N9BYizs0g64Q+6AGqDWvHtYhE0YZ6Ro+0RmtEXcsihYLu9rT/e9fiJZd+nt7gyiY=
X-Received: by 2002:a17:902:ea0a:b0:224:c46:d164 with SMTP id
 d9443c01a7336-231d43891f9mr119531835ad.2.1747921743759; Thu, 22 May 2025
 06:49:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250522-rust-mno-fdpic-arm-fix-v2-1-a6f691d9c198@gmail.com>
 <CANiq72mh1h8d-EWrZef=BPPtadZyHG0B+tg9GgA_RnWiETWMkA@mail.gmail.com> <db93019f-0a57-4b1d-95a6-ed5a6ab9a989@gmail.com>
In-Reply-To: <db93019f-0a57-4b1d-95a6-ed5a6ab9a989@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 22 May 2025 15:48:50 +0200
X-Gm-Features: AX0GCFu-gY2Uaiye5G1giuS4p4mScik6sBBHkTTkGYR5OKRXRPGKMWWtMoHevFE
Message-ID: <CANiq72n3UzgG4BTcZXd9aJK_9+BwodRkbzewPtipi4-iCqdeqA@mail.gmail.com>
Subject: Re: [PATCH v2] arm: Fix rustgcc unknown argument '-mno-fdpic'
To: Rudraksha Gupta <guptarud@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	torvalds@linux-foundation.org, Ben Wolsieffer <ben.wolsieffer@hefring.com>, 
	Naresh Kamboju <naresh.kamboju@linaro.org>, Christian Schrrefl <chrisi.schrefl@gmail.com>, 
	Russell King <rmk+kernel@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>, anders.roxell@linaro.org, 
	arnd@arndb.de, dan.carpenter@linaro.org, laura.nao@collabora.com, 
	lkft-triage@lists.linaro.org, regressions@lists.linux.dev, 
	Nick Clifton <nickc@redhat.com>, Richard Earnshaw <richard.earnshaw@arm.com>, 
	Ramana Radhakrishnan <ramanara@nvidia.com>, Linux Kernel Functional Testing <lkft@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 3:27=E2=80=AFPM Rudraksha Gupta <guptarud@gmail.com=
> wrote:
>
> Thanks! :D Happy to send in a v3 if needed

No worries, I will apply this one :)

I will remove the tag, unless you want it there for some reason (e.g.
because you want to point out some extra testing that goes beyond what
would normally be done).

Thanks!

Cheers,
Miguel
