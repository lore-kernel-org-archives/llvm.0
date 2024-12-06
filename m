Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B42B17A5BD
	for <llvm@lists.linux.dev>; Fri,  6 Dec 2024 18:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733509873; cv=none; b=h5CUzRBqO2noSYu/c6Xiju33mejbqxY0asDRMMQmr9qRo7S2j4+FUoRVDAmHBSkhwW+tw8fSBAgMShklnQIEeZFsfTS8Pj287VDJPYvuc2otbsKBPVl5TiElW31VYswJZbjRbCEH/InkSC9fz08Dhqo2Wz3t+yis5HIVBnqucvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733509873; c=relaxed/simple;
	bh=+2N0lSYv+NBz4Y6vr/lNiuvfJV7RX8RYoJK6s9GX4gY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nu8oF91OAvlUVOqUTvN9aUit8B7i/nuiDtuWdMXDO8AFtgMFal7GSSlbRaE+mgsUTD9jSMYc+pfRkoku105tHAmiYki3DxYVhXSjqv1jcX0iWphx+OvovhWMPE7GSGq6iK0HGB3cJ/kt2sINtwa0xRYpWz1lYIaFXro+JDtzsQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iQFdwB1z; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iQFdwB1z"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5d3d2a30afcso900193a12.3
        for <llvm@lists.linux.dev>; Fri, 06 Dec 2024 10:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733509870; x=1734114670; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7buzdn3/PR+OZ7E9SojfZrudu0PKQFtLTRAFouRbM0=;
        b=iQFdwB1zwrJlc2rMPQho9fB8me1/3BHnh2EbDSiZgBU9CHNbXnUMxCAsWmNl0skztq
         mKiSwC7zyGwe5ByDbACtRFTd6C0AD2v0KQelj+TMOfIOirq8PPepOSm9OIwNsZ6aqjOB
         Gdy+0LkCIL4CApPECcAKi7iwraKk0Qm3D+/CHsk31Z8uF2MmiD3YSIUjdZ8amSIuKGNP
         5vXX4pCBieOZ33jhosi5CuTRUiR5DuKouUgtqUfBOPMK9Sw3HhjvdScDDQVXCkhVe32U
         WVE1ysi4zQR6TeOZXq8sLXU1k43iq/JL4XdnWaAVIuQvGDul+WVMkokLDk1Uu+nKJJAS
         Npxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733509870; x=1734114670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g7buzdn3/PR+OZ7E9SojfZrudu0PKQFtLTRAFouRbM0=;
        b=RfqGeEqkLg8ZWG3Lqrwp0MDGZgYX8Voh4EAIOi6U2w6MXlIV6CtO5KDLRJoVngNY0H
         CQ2RyY0t2ctRuAwOKpIjSAuj9icFyeMlrsgNIINcA9qqiA4RJSW/tl85XBRAJ7x7ESEY
         jjq9Dogms5oxFnAZyhR+LhJWt+XmTDzAO/mtL8iWaAMIelUfSovjcMx+XfHoTOtTYnLY
         m2CtzA7L7HdORyFzj2xQtxHFssWbK52l6KFsVEFDuwHkuyKJ1UENBRnU8Nt33ckzJ0HP
         Hc1UT+mlIsqUmWA1sOE7yANa2UbH+tCa7K1FLJ7eRLvYxjbXMgJ3O8uZI5ykzpSh0unc
         wmdA==
X-Forwarded-Encrypted: i=1; AJvYcCW1Z3jjAZXQQvzUHkFhE6StP/75F0SIbQjSEMqtppsoIADskOfYZx0GaBNg8CsH9SsjQ/RP@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9X6dyKk1BhYpOCN75LJtubuWSMMipsEzAiVPBnP2uqCm7bCGl
	zErCz4TBItRuVCDY0MT7LNjlGYpOtfbTu5kImCkSijzyKSgb7CBqD0IE8Pu8Rh02ReJiIS1T/ro
	QvWFbMqPvoSjyxhxCjWrEqYjodnE=
X-Gm-Gg: ASbGnctFSE2LhlqX9F7ciB5RggSnG86VedthFIKILZHhkD5k5jz6OADVXToOcOQV1d4
	fgwxskRWEBDUwmjkUwdlh9f9UtXC3Lm0=
X-Google-Smtp-Source: AGHT+IFnd7xj5Pq9akTxmspxJbkFJbmmIA03mUFW2B6h+sDDSyh+/NdbCh8gBxT6LtqsX9b+RXGKw/QASht5Itx+9Lw=
X-Received: by 2002:a17:907:7703:b0:aa5:46d3:4d88 with SMTP id
 a640c23a62f3a-aa639febbbfmr329138866b.15.1733509869483; Fri, 06 Dec 2024
 10:31:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com> <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com> <CAHk-=wjmeU6ahyuwAymqkSpxX-gCNa3Qc70UXjgnxNiC8eiyOw@mail.gmail.com>
In-Reply-To: <CAHk-=wjmeU6ahyuwAymqkSpxX-gCNa3Qc70UXjgnxNiC8eiyOw@mail.gmail.com>
From: Vincent Mailhol <vincent.mailhol@gmail.com>
Date: Sat, 7 Dec 2024 03:30:57 +0900
Message-ID: <CAMZ6Rq+SzTA25XcMZnMnOJcrrq1VZpeT1xceinarqbXgDDo8VA@mail.gmail.com>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of __is_constexpr()
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: David Laight <David.Laight@aculab.com>, 
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
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, uecker@tugraz.at
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Grrr, I just realized that my emails are bouncing=E2=80=A6 Didn't happen
before, I guess this is because my smtp server is unhappy with the
many people in CC.

Resending using another address (and, while at it, redacted two
messages to combine them in one and added more details).

My deep apologies for that, really sorry. Also, maybe the bouncing
messages will finally find their way out? In that case, please just
ignore them, and sorry for the noise.

On Fri. 6 Dec. 2024 at 15:14, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Thu, 5 Dec 2024 at 18:26, David Laight <David.Laight@aculab.com> wrote=
:
> >
> > From: Vincent Mailhol
> > > ACK. Would adding a suggested--by Linus tag solve your concern?
>
> I'm genberally the one person who doesn't need any more credit ;)
>
> > I actually suspect the first patches to change __is_constexpr() to
> > use _Generic were from myself.
>
> Yes. And David was also I think the one who suggested something else
> than "!!" originally too.

Ack. Then, I will add a suggested-by tag to credit David!

> I may have liked "!!" for being very idiomatic and traditional C, but
> there were those pesky compilers that warn about "integer in bool
> context" or whatever the annoying warning was when then doing the
> "multiply by zero" to turn a constant expression into a constant zero
> expression.
>
> So that
>
>   #define is_const(x) __is_const_zero(0 * (x))
>
> causes issues when 'x' is not an integer expression (think
> "is_const(NULL)" or "is_const(1 =3D=3D 2)".

But 1 =3D=3D 2 already has an integer type as proven by:

  #define is_int(x) _Generic(x, int: 1, default: 0)
  static_assert(is_int(1 =3D=3D 2));

And regardless, __is_const_zero() performs a (long) cast, so
__is_const_zero() works for any other scalar types. Even the u128
works because after the (0 * (x)) multiplication, you are left with
zero, preventing any loss of precision when casting to (long).

Here are some tests to prove my claims:

  https://godbolt.org/z/beGs841sz

So, it leaves us with the is_const(pointer) case. To which I would
question if we really want to support this. By definition, an
expression with a pointer type can not be an *integer* constant
expression. So one part of me tells me that it is a sane thing to
*not* support this case and throw a warning if the user feeds
is_const() with a pointer.

By the way, currently, __is_constexpr(NULL) returns false:

  https://godbolt.org/z/f5P9oP9n5

and the reason this went unnotified in the kernel is because no one is
using it that way. So instead of complicating the macro for a use case
which currently does not exist (and which goes against the definition
of an ICE in the C standard), why not say instead that this is not
supported by just leaving the constraint violation in is_const()?

> Side note: I think "(x) =3D=3D 0" will make sparse unhappy when 'x' is a
> pointer, because it results that horrid "use integer zero as NULL
> without a cast" thing when the plain zero gets implicitly cast to a
> pointer. Which is a really nasty and broken C pattern and should never
> have been silent.
>
> I think David suggested using ((x)?0:0) at some point. Silly
> nonsensical and complex expression, but maybe that finally gets rid of
> all the warnings:
>
>      #define is_const(x) __is_const_zero((x)?0:0)
>
> might work regardless of the type of 'x'.

If we *really* want to go beyond the C standard and extend the meaning
of integer constant expressions in the kernel to also include constant
pointers, then what about:

  #define is_const(x) __is_const_zero((x) !=3D (x))

As established above, comparaisons return an int, thus making this
pass all tests:

  https://godbolt.org/z/f5zrzf44h

And it is slightly more pretty than the ((x)?0:0).

(...)

Side question, Linus, what do you think about the __is_const_zero()
documentation:

  https://lore.kernel.org/all/20241203-is_constexpr-refactor-v1-2-4e4cbaecc=
216@wanadoo.fr/

Do you think I am too verbose as pointed out by David? Some people
(including me and Yuri) like it that way. But if you also think this
is too much, I will make it shorter.

Thanks,


Yours sincerely,
Vincent Mailhol
