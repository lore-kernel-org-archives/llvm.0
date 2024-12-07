Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B1622C6C5
	for <llvm@lists.linux.dev>; Sat,  7 Dec 2024 15:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733585020; cv=none; b=p2IJDeWkr2EiYtw8gxFE/DiQtX5KgL4DkTNIJeUpS8WZTrvjcS7pDt/ZCSY3lNrzFW/gWGBNi8QePvNYRhvqK5zhlLk/PMFMRv5XL38yOJ4+9SrjCCsQg0PwaESuzJEBnjrqEszaWuAAcxzAGgDppKOH2IiETKuTpusmnfN8hOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733585020; c=relaxed/simple;
	bh=9klYLk4gCiLWbKle7o/IVMAyL0lAMD7YRZgQqgDPYE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fY/9qdi0xOK7AGKPCvROYwjtGTZSWhUDp/k/5bzcEC3EFAXYC30ANnN4y8D0I6EQrlLfVJHB0ct8fBs5/YoMJdIg4ZWmgLmGztiuO5DOSAN8QX7WRKL+Mhj0UC2S6fUJiuZ9EtDtLyrcr6Qss7pSu5sEu1N69N0UPBSbLHcorBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iwh0D8tc; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iwh0D8tc"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5cf6f367f97so4368352a12.0
        for <llvm@lists.linux.dev>; Sat, 07 Dec 2024 07:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733585016; x=1734189816; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZXHUUtMJhw42ifbhB350SCKKtNQKr7a+mjsEg0ARJVE=;
        b=Iwh0D8tcDIX6o8QYfto8zLOAzRBeLR4ZHnTqzK0KzU6yCnW0vkHbbK1pE+Viy2edbi
         SicDlhdq5er5uaN6tepnvTkt1gDRTxt14lrnVrzM2uxgXkhJCq4kvmUQba7pxgmxorNi
         59k8oOxNBOpCFPFigm5k2XHkPVYf6/y/0c7EASBlR1XCcSlFiOi4bGWCTTMH0MK+aIjP
         Gcs6ohVBWqx2NrOcNFRp//9wptIIggMmRRORqOHnSP6kTejEcQ6Nefm427Iv9s45oXX/
         fs+CYD2Vy8Y/iW6UvDfEDDZQ/Dg1I4H8mZ5OII5W0lh4ASSe4aKlnFnGW9DP8ShQwkOV
         ENNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733585016; x=1734189816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZXHUUtMJhw42ifbhB350SCKKtNQKr7a+mjsEg0ARJVE=;
        b=fNMUcu3oQUem2EnDPRbxif8y6uFe5yMRpmHMfFWE72abSH9CwRqFOuq4WQck2CwkX+
         6vDRfCHOGddpAwSS+hgtHfvDkvMoaMQt96W9oE6ZY8NoE1M7dyZnDfUzsDCT/guU7Zgf
         F4i2ejbSfoitSdb9PfghqTmcV78ROzNhHaiQZmn3AkuYL+3ylX0PLR+tjlWZmGUqMk58
         rR9giwG6ZGdaY49viUS6Cvs0Mf4VbCce9CiOuwr6p9ItnENYUgRHJ2wz++ueryjZTQic
         7twVuugx4m0YXuEYa4Bs0UpTWqRGQaQaApeFers6Cdbbb0uaIZAVTZoEyHUrcp8pTk2+
         7ung==
X-Forwarded-Encrypted: i=1; AJvYcCXAJNM5bP82sL0CR4miIEdEgWoXOO5QlW7ZdH8ptZqZU2vfkJJ5cl+giqYV+YwTVlSIR25Q@lists.linux.dev
X-Gm-Message-State: AOJu0YwfEg7e4w8hniMhalOXwoALk5JfYYHMzPG9q+npqh1aaNzheBPB
	pfNbrXFUWwUeAfc4fzdZXeunStKl1jNKzE3y2oJ0FVIKKXxSpVgwpkfU4ZsUuxKnF1Rgn1j/OXb
	z810pNCuqspOzBpU9WX82Y9VeGVk=
X-Gm-Gg: ASbGncv9quaehNj4q20xEOsvn4JLgq3YHx7/z0sFxxVmGd621i9zzBuJ5Cjjo4V2XkF
	uTS+HkwDE/cowKhEMdEP1xUvMkXJXEnE=
X-Google-Smtp-Source: AGHT+IFjxVVDHtb5XUqKlxwjzwTutKQUzN2zumRBPx3EfKj4t3Mn5Sq/gwwPwX7tapi/bTH5lmwV1+4Ni4olRczdgm4=
X-Received: by 2002:a17:906:b3a6:b0:aa5:1661:1949 with SMTP id
 a640c23a62f3a-aa63a21bf7emr624479066b.40.1733585016096; Sat, 07 Dec 2024
 07:23:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com> <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com> <abdd7862f136aa676b2d2c324369f4a43ff9909c.camel@gwdg.de>
 <CAMZ6RqKzGiRNMeLsQKRNrxvW_bXB-kEi11udQ82kKX6tGCrqcg@mail.gmail.com>
 <9607300dfca5d71ca9570b1e1de0864e524f356b.camel@gwdg.de> <CAMZ6RqJGqBqvgxzp5yPFY1pk0WkkwEMM34qU-dZ3kXfsnKaqEg@mail.gmail.com>
 <429e7c6713ecc94494d9107e5f5a1f0c8e854f23.camel@gwdg.de> <CAMZ6RqL+iS6GVsY20=O6GdQakRpp7XdewZJsUbmE5OCsKaHR6Q@mail.gmail.com>
 <b3bd6d4ef485dbb5db4c784f4e42f76adce502dc.camel@gwdg.de>
In-Reply-To: <b3bd6d4ef485dbb5db4c784f4e42f76adce502dc.camel@gwdg.de>
From: Vincent Mailhol <vincent.mailhol@gmail.com>
Date: Sun, 8 Dec 2024 00:23:24 +0900
Message-ID: <CAMZ6RqJrAVVLDAJtNTA2U=UFVUJp1samoat+yfBmSpO-dCVcaw@mail.gmail.com>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of __is_constexpr()
To: Martin Uecker <muecker@gwdg.de>
Cc: David Laight <David.Laight@aculab.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Rikard Falkeborn <rikard.falkeborn@gmail.com>, 
	"linux-sparse@vger.kernel.org" <linux-sparse@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, 
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, 
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"coresight@lists.linaro.org" <coresight@lists.linaro.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun. 8 Dec. 2024 at 00:10, Martin Uecker <muecker@gwdg.de> wrote:
> Am Samstag, dem 07.12.2024 um 22:50 +0900 schrieb Vincent Mailhol:
> > On Sat. 7 Dec. 2024 =C3=A0 22:19, Martin Uecker <muecker@gwdg.de> wrote=
:
> > >
> ...
>
> >
> > I was invited to WG14 this September. For now, I am only lurking. The
> > thing I have in mind right now is to write a paper to allow the use of
> > static_assert() in expressions (i.e. make it return 0 on success).
> > That should be a relatively small change, but would bring a nice
> > quality of life improvement.
> >
> > For context, look at this:
> >
> >   https://lore.kernel.org/all/CAHk-=3DwjLSEcZ5LdW+3C+9rtjvNPHZT6zdk0POj=
67T5k2ZpDbgA@mail.gmail.com/T/#m1ba33a804b4041154b72a1d0333f90ec7204c461
>
> What one can do is put it into a structure.
>
> #define const_assert(x) \
>     (sizeof(struct { _Static_assert(x, ""); }))
>
> but yeah, also a hack to work around a limitation of the standard
> feature.

If you scroll down a couple more messages, you can see that Linus came
up with that exact same hack :-)

It is now upstreamed in:

  https://git.kernel.org/torvalds/c/d7a516c6eeae

And yes, this solves the problem for the kernel, but I would still
like to change the standard to solve it for everyone else.


Yours sincerely,
Vincent Mailhol
