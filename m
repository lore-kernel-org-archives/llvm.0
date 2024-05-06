Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F52B13D2BC
	for <llvm@lists.linux.dev>; Mon,  6 May 2024 23:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715037057; cv=none; b=PZLyK8FhmtUGVAmpzpICFd5l8nIxMe5b9tNarVR9vqEC0mUQ7JRqXvhLHZMWDdOK8QoYZrBrCaJbe2I4NxX08t53KlFteUGPt2a/5de6CXJmOWg1JW2PXrdLF7Gln1kWVNdwMOoahiATKm4dYEyWSXphMAZhwZgIpsGsIjJa7Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715037057; c=relaxed/simple;
	bh=FCWmkGKtCYFY82UHw0ipUvRiJnRCs/R5WWby7amO1H0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KonaM6OpMuumXCIamyRLGcIovwwFmMUH/XjXh8ouyjf/8nGCrvRSVb3PjskDjXX0tRdjRiIcl6+U1Tn+KkAqCjaSSThZYzF3CUGE8XZURaa+fDy3DAi0UgPE3QiOzqStSQy9Pq7dHDzksWg9AbXkW5gOBp8/Yp3uZq/XQF4gqOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sXdUAqms; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sXdUAqms"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5724736770cso2219a12.1
        for <llvm@lists.linux.dev>; Mon, 06 May 2024 16:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715037054; x=1715641854; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=To7fxBOaNRZwDFrn2W07ozUB1mmlkd6/wYo0eU+RqtA=;
        b=sXdUAqms24hW5u8FZCgyTQXpMaLbb9fH8v74+ovTSwaCJXnY/BGZb6CwPXbqAXI/UN
         kKn7j/DZojjvty3QQsgNlTrBi4908AUXUQX87VO5vthcu6j/xfsrdNZdwIiX+t9moD+7
         yNJoS3aQWcGnkZP6DzEuFHZ2+4phI/3y0yoXulMNwVwFHpuWgx1TPglSu1PuzxP6w+4l
         dkUNHS2IgoZnp8weY49g4E2DGC61OhWiExOwI/BaWJM0JsFVAqwbOU0CfzJnfVabp7VB
         9PPBRkbwE72D5JF2O4V3ImiDO4rDnA75xGYz6xC3BGBJAGDUXHZvSWxtOSZfz9UNpe3t
         zv9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715037054; x=1715641854;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=To7fxBOaNRZwDFrn2W07ozUB1mmlkd6/wYo0eU+RqtA=;
        b=QuSZGcnWgM8AHekeeKJGLKSggx4ejVF6wiarXALzitf7viY/JQdS4pOI/Hg0zLAR2G
         8660OuTeGPwuC1/2kmPOlgd43hul0DRYHExpwkB3f4S3CM+ZrqEg8s+gs/QrWDY/1a94
         DzzPZbYcRa8+GyWbW1NEIW2zafzC8cmSTv109DiCY4841T7N0FX93MHuGjj3kNzkKO4f
         rRpcZoarBPwjYGeybqEsbQhCvPR3p1LoHguolsKuY2PAAIh9oOfNFQrsnE51yonWuN32
         bpf1yVy6g2A/fOArthIoYhv+fkfY25CuFPQyLfcZM8/WxazGB/+3I6yR5PsfaIOiwtue
         66Mw==
X-Forwarded-Encrypted: i=1; AJvYcCX9ipI/IYitlzfI+rmYWKvTde0PoFJgD7D7BSE3P6BPXR6zWTcqlW8qKaxBE1+na0bRX0dtQ6G/i8qlhW+9gukTgn5tkg==
X-Gm-Message-State: AOJu0Yymb8VfdXUyAYwFB8xmp/4v+VIzEzBdA8azEenADXuIy2BcD556
	Wka1cP8Sm2WxDqNJvJP6LuuYHZZqUeG2QoOA8jh5QONbzyt4IaXXNoZK0kXtqJaHPqtR8M3l+4x
	EwE6bg9ZRE+qweSktmxbXJq/LUyD3n5hRUtXC
X-Google-Smtp-Source: AGHT+IHGZfGOFMLPDtfPud/GsrF7tdooNnrZe5MoO9klCGmWbiy/B/k6yjkc3wPHejQWyh/ZbyKrPPcGutS3l9Xw+Rg=
X-Received: by 2002:a05:6402:4304:b0:572:7c06:9c0 with SMTP id
 4fb4d7f45d1cf-57311c1506amr107766a12.0.1715037053475; Mon, 06 May 2024
 16:10:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240501180622.1676340-1-edliaw@google.com> <osgrbhnqlyh5yw4y4x6wjggx56dogsgje5yy3mkpu75ubs3zwg@5tliydzky37k>
 <b55272cb757743548c789aa8c0efa448@AcuMS.aculab.com> <CAFhGd8rAW4Mkctq5VkcfVjw_yr=jVdXaWbYXP-vmeVpw7q4ruQ@mail.gmail.com>
 <CAG4es9WYrN_tOV1Uxi_ytO2qDRRZW5_uN=2p3iCg=P0r3mM3Og@mail.gmail.com> <7332ff979f3440bd8362d37d4d1f34b8@AcuMS.aculab.com>
In-Reply-To: <7332ff979f3440bd8362d37d4d1f34b8@AcuMS.aculab.com>
From: Edward Liaw <edliaw@google.com>
Date: Mon, 6 May 2024 16:10:27 -0700
Message-ID: <CAG4es9Vn2F34UEmyG3upO-frtCZ00DVN8vgK4mRfX2548FKxVw@mail.gmail.com>
Subject: Re: [PATCH v3] selftests/vDSO: Explicit unsigned char conversion for elf_hash
To: David Laight <David.Laight@aculab.com>
Cc: Justin Stitt <justinstitt@google.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Andy Lutomirski <luto@mit.edu>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, 
	"kernel-team@android.com" <kernel-team@android.com>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 12:32=E2=80=AFPM David Laight <David.Laight@aculab.c=
om> wrote:
>
>
> That makes a lot more sense.

I sent v4 https://lore.kernel.org/all/20240506181951.1804451-1-edliaw@googl=
e.com/.
I updated the commit log to reflect the change but I'm not sure if I
did it right for the mailing list.  Should I have added --in-reply-to
this thread?

Edward
