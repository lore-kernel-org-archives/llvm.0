Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFE323957D
	for <llvm@lists.linux.dev>; Thu,  6 Feb 2025 18:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867348; cv=none; b=ajBMCAdkE4JAb1l7+vYGDjG17YfNFt5tm3oyQVw73MYLX392UW0fBTLdfTaF3ARxWCE32e3lXQ/a1QXyoA0AFrecvFafjNP4cPeTM9tD9ch5+TjUpof4vzK3FKdGk0y46Dh61xS6WzS/hzHI+HkOOCV/Ix2nyq0HmLCq62fO+yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867348; c=relaxed/simple;
	bh=om6iglSSCmYujo+zLqAOL9kwNR8XDAzgdlKMsB0ogY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JJycKkjX5eLxH1tT+eGnhF+Iho9QhIGy2hm/Pe08FXpMeE2qM4fjciTwid0ngLyQTyJ2ZWNbGgycBK59U5VJPWt9CTkkjsU9WlzfjjV52HDtNDN80rjl+G7YZ/FxbyGOHHuQpc5ZmMrRwG72R6JbX13QApmvs6FySf9lff7PrKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFOhaikI; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFOhaikI"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso229709866b.1
        for <llvm@lists.linux.dev>; Thu, 06 Feb 2025 10:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738867345; x=1739472145; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=om6iglSSCmYujo+zLqAOL9kwNR8XDAzgdlKMsB0ogY8=;
        b=iFOhaikIOQjBImg6jsvefTlBbtvSIy4mP9jLu2GsXE0plKeJkASPJjOsumHLDcTPAA
         RXg2kiIyc5N0F+tQim2LeMiXrMOjMFACxlQ7fmacwFrCZ+kTV8d3fPaIu8NMaIAjR3bs
         j0X5Ka++i+efXkFcdogvL8E6SDc5KWX/awuy3AXc9EsPSiEBMv+Il+ymnhgiHaEqX1mY
         4gGinkWf/qQr4BjMtbJAkUurRMCZPo1M2AGZbVtmfFiTKhXcn+z8E9ZVNWbSLcQGYG3f
         LQ4SeuYTvLxaLGiO1AMmv7hrKEAZ4Wr2a2xIDlp4bz9ivR4GOVTRQ89kNTezKapiZoyY
         LtZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867345; x=1739472145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=om6iglSSCmYujo+zLqAOL9kwNR8XDAzgdlKMsB0ogY8=;
        b=sOSz5cA/Ww35OptG8xhdMVMoWowrLa9YPXJW9xCaAaLo0uYpBtyV5THFTRa2Sunvft
         sM45agOw9VABplH1yXyqJVzfYUDI59uRrmT+QZrt4uS39X4SapLn6OSx1tVSarS7H8Xn
         R8nzaIQqvae32wHGMFaBg45my12zdZU6/0Mo66FkLbdld2g5zqG1O4/kK698gHKRpj+V
         vyPn4Y7LOjTrd5KwOo2rkETsyufg2++JRalVbp5xks3UedJ0Y1vb5fb8cnNLQ4O1qJGq
         z6JPqJiySI+jaXW0S+OSgM3nkKj/aWQaWNX3LJ545YBgfHa7A4DgqBj5J6aPQzkgUgiR
         Yqeg==
X-Forwarded-Encrypted: i=1; AJvYcCWZm4u9845PyaAe0YbTcjrHT1kF38Glq5u7sG0EKtgC5cngW5vyYqaIR5jXFrQi/nnCq9rm@lists.linux.dev
X-Gm-Message-State: AOJu0Yzz9O2fJEwNsbyGJx4fDiwYq0RD0QFVs9zCzZ+a/bBE3GQGWRoW
	O7MSyXKgAOc62pgGDdek1sfk+g5V9KNbRlqIl8yeUm/nYvqCKqXxB16lcrOGvVP0Mb0NbX0Es7y
	zXAtq1+rUUwtWlzpK3w71oJtep+0=
X-Gm-Gg: ASbGnctuLsf77iKEmp5MH1+kjuOnAyW8oGK+DlLRHn2P3OQs8YEZQ4y8wbUfMAM2Xhr
	I1iz1J+aLSS2Ux9axzXQbsN6WqWXjEuIUZ2jTfzHDpAUlGlXmuMfdMKgaX4RkJIJ0Nd5HHXz/PV
	E=
X-Google-Smtp-Source: AGHT+IEWHEDzohOks69wuoJrRSsoPvIZZnS9MPhUug/tADTjU+Ww4Xu0DLhCT+JLxCQNzWJE9hHQu9Tc8JLSkCEcgLs=
X-Received: by 2002:a17:907:d88:b0:aa6:9176:61ed with SMTP id
 a640c23a62f3a-ab75e33cea1mr942939766b.48.1738867344966; Thu, 06 Feb 2025
 10:42:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250206175216.work.225-kees@kernel.org>
In-Reply-To: <20250206175216.work.225-kees@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 6 Feb 2025 20:41:48 +0200
X-Gm-Features: AWEUYZmXPB_SWD2U7w5yvMEUIeYeTr88ZsFyl2FUP5r5pV6x7la9qV0rWZ1glOw
Message-ID: <CAHp75Vf=84tWvv57Kj5A5bLenQSkC5yDHTHy-u0iK1_U87nvBw@mail.gmail.com>
Subject: Re: [PATCH 0/3] string.h: Use ARRAY_SIZE() for memtostr*()/strtomem*()
To: Kees Cook <kees@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Andy Shevchenko <andy@kernel.org>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Philipp Reisner <philipp.reisner@linbit.com>, Miguel Ojeda <ojeda@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 8:11=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> Work around a Clang 14 bug by switching to ARRAY_SIZE() (with the
> added benefit of explicitly checking for char array arguments) in
> memtostr*/strtomem*().

What's the minimum Clang version we build kernel with? 12?

--=20
With Best Regards,
Andy Shevchenko
