Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3A379C0
	for <llvm@lists.linux.dev>; Wed, 13 Nov 2024 00:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731458089; cv=none; b=CS45/hHiJim8/9J2bxWva590CB5GkOIqmsgj1UtkoNX7oFOh/KPDp1PBhEchZZ4jDkjEcLISk5PptoiDwlb2nh7Pc0Z2jlJQ1EGh5EFmnQZKSqpvRZayJOE3yFlQcYIyIhCi5VSAuhTjVatpq8J/KTSxK8biPaUMqLpmrct2TiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731458089; c=relaxed/simple;
	bh=QiUDwNk4UMES6wGicm1D28MfcRMHLrzXGFWadiGQHAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eTPZ/6fn+zn1bEWm3FCE2a8HVpmOGVKnTk9vXD/f8eLgz5w2b3AWy4oX52WNvsLp5W2sGsbBAvWlJ/w0i/5LPD2NSGrQ+R06IvgBAKFem3A5IH6PYndRXjSG09UKvth6MnD+rZC0Vd4pRnu7mSFoHeGAt6q9SFyQLdW1oSR29Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vmD7Yzq8; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vmD7Yzq8"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ff3232ee75so29506401fa.0
        for <llvm@lists.linux.dev>; Tue, 12 Nov 2024 16:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731458085; x=1732062885; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ogOg66A2FuJAzMUKERxnGXu1VO1CtrKNlAN/1i/CxyE=;
        b=vmD7Yzq8hUZLSvM8gQIRzOMDqvKG+w072WwphCf76PiAPIJnb1SQ/tb+RlT63Ouu9A
         KwWjMPW72l8UOQtEnkKOEvbTMdqgCBAtT9expYyy2kGITErzVavtQf8cQtFuAqUsTZNq
         7VGCWIvAjoHPVxHYFndaP9I34W4v5lcKCApdEbZ5MOs3+IKzuaQcEkv0kZ2qVyuWszSR
         ewuWcpU57NQgfcL+9+kGbFuNrAhcyxpHUIceulVGu5jYQwRzs2hp11BECTFss+z/F+nY
         wO41nOOSNcLSoAlBNPxczHvsXGPuTW5w+yI6LsS/VBCdI5DzTPWOSlRSAbPYQKPEiF0h
         ubrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731458085; x=1732062885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ogOg66A2FuJAzMUKERxnGXu1VO1CtrKNlAN/1i/CxyE=;
        b=qnHaZoaTJAAfWoaQRIA+k70jQUnrv4PtmE1hjE4bqEtk5woZ9YHnmYnDy8tN/Veeds
         nHDnL1atZ5c0a/Qah+48r/6wE0IiEiB8vVLbTXUln9yk4C7PhG3ybmGciZVxa+4AsR97
         AlH5fqu9PlMbIavoAHUPz0ya9ALRG4bweVVKfh/gnMbiGDPOscSG0PK2eHKhJ9jZas3z
         GMajriSwK/3EGMxL+hmFk5/6z7Mc4WXgv3/elYivMDb8EpJnCRspaieKoPL/sEIbGkcB
         //35TOqnke1Mqp3O+ZCqVG8+IjBAAo+D882Bqi6dM6/9vmXomy/+xdqiJS+L3tAtVhK3
         CELQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYDIha6IvkaSBL7dt6+lH8LuYHRkh8NxRh5TUFz3A584j+L1XIrAuaPIqBYzaMS+TiQB03@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9VDVQEZsGN9aY5CC1+TsbVU+1dRVJamVzbiFNevOwBbqaMWXW
	zbEs6KkaBuj485JpBBKUQ0KnKVkhBz/hPCo1KJoKVLshuo2Rdu514mTFrxq06bZ+miKjAo7fiak
	vZRpn5yjB+spU9BOkFvfD4en+ikiOMRaungv1+g==
X-Google-Smtp-Source: AGHT+IFlNvK0Gy6cSkO4IzErgm7ADkSViIPub9WwdcozidP+qaoN6N8pZdtVPNFON2giZ9czwvKjliN3wa7tSJ0bZz0=
X-Received: by 2002:a05:651c:1542:b0:2fb:5038:3eb4 with SMTP id
 38308e7fff4ca-2ff202686a4mr99911001fa.29.1731458085445; Tue, 12 Nov 2024
 16:34:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202411130711.xfVEiMKn-lkp@intel.com>
In-Reply-To: <202411130711.xfVEiMKn-lkp@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 13 Nov 2024 01:34:34 +0100
Message-ID: <CACRpkdYADg4fg2VgRxFBwp1STLbX062zjbZXQ9snOf_p6NvcEA@mail.gmail.com>
Subject: Re: [rmk:for-next 3/7] arch/arm/mm/ioremap.c:130:32: error: call to
 undeclared function 'kasan_mem_to_shadow'; ISO C99 and later do not support
 implicit function declarations
To: kernel test robot <lkp@intel.com>
Cc: Melon Liu <melon1335@163.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 12:11=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:

> >> arch/arm/mm/ioremap.c:130:32: error: call to undeclared function 'kasa=
n_mem_to_shadow'; ISO C99 and later do not support implicit function declar=
ations [-Wimplicit-function-declaration]
>      130 |                 sync_pgds(mm, (unsigned long)kasan_mem_to_shad=
ow(
>          |                                              ^
>    1 warning and 1 error generated.

I mentioned this in a comment to 9429/1 that it supercedes 9427/1 since the
author didn't send a new version to solve this issue. Maybe I should have
mailed some more...

9429/1, 9430/1 and 9431/1 can be applied cleanly in its place.

Sorry for the mess. Tell me if you want me to re-send them!

Yours,
Linus Walleij
