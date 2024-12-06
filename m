Received: from out.smtpout.orange.fr (out-18.smtpout.orange.fr [193.252.22.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6F719ABC6
	for <llvm@lists.linux.dev>; Fri,  6 Dec 2024 23:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733528107; cv=none; b=kIqQiqojh49C36tyEhA13h5PYTc3doOLZZP2sYJAH5sJE0O+kWdpS/B2PZGc7bBR7tduws28h9ClZZZHbxovrRtPLHt2VvEgdgk9CPUg4MH5KJKisHMtsUVo781Vjf66+jFkWtdyMqOrPpyxn5FKVhPQGfc5ZNIEV7x5S6exhFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733528107; c=relaxed/simple;
	bh=gG3hzY7MHlAi9KcZyaLalqsMDvFVa2GEYwMxbrVqTi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kCwUTIwIOkXLmPqcGvHhaoEgPwDvCRtK2VRma4+SaTGOGZ9YnAge2E9SN+FgsVlmsPEVdr6uJ396VhQm3krARzrbQE45dVDYHp/n0BCgO51zLq8u5MRUm6Eu9bastMuORz+2+i1u3f/Zne5zxTa86WeL2pjsN/DBI3qCcDvjvwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=kkOrFMZ0; arc=none smtp.client-ip=193.252.22.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="kkOrFMZ0"
Received: from mail-ej1-f52.google.com ([209.85.218.52])
	by smtp.orange.fr with ESMTPSA
	id JhqatTnBFgyqpJhqatp7lf; Sat, 07 Dec 2024 00:34:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1733528096;
	bh=GBRrBlRLVT7TL533lKb1vFLdI9Y/T44KcDVsiEUWS/k=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=kkOrFMZ0h8WKmP6iomtXXiAjMfOUPrmNf9KUYtwKMyi/fsi4lUAB+SKIcMjmQe+Mm
	 4Uuli+GqC3b+hj5IuBfz8xhes7yfp9z9C+jiRejRkKBWZ5uqaqW6qeY1eLgeoCmZSV
	 mSP0ZZhv7t0j76/A5aZC5Jg9wthzGjy79QB6R7GzP25f27o9CwyzSq3BxaLgWG+WoG
	 RX5sLNKJ4eVd7UiIp5PYVBybargkQTfS15Ot79W90WWIkFGhGFVTZZp1aNxWYZy7CJ
	 VPn7pmzf8LKX15sgKVyNjxHnKZ3VSUatUDrNjde1iqND13MgElp9jicM0fxJYT2K4m
	 u0rjHIu5+/YAw==
X-ME-Helo: mail-ej1-f52.google.com
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Sat, 07 Dec 2024 00:34:56 +0100
X-ME-IP: 209.85.218.52
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aa1e6ecd353so405586166b.1
        for <llvm@lists.linux.dev>; Fri, 06 Dec 2024 15:34:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUdeIv7HaAonNrUFTiUTAJ4e2IUUO/Hgfmic4jH0G/8QVPNA5nfz26t5qWQYwVnrUkdZc/v@lists.linux.dev
X-Gm-Message-State: AOJu0YxCdtFQ85Tc3QsIKEdWPrI7a2ezT3/3eTlPtWvvDzZDKxtYErYb
	5D4mDWkZ8ibqfpznJf3r3RvR5WWCcpAJUxsWa3yavcNsRVoH/GaZfCv6JqPSezamaWrjSbODx5T
	h8IsvulHZf1+W/ea1Y820Or4jsZU=
X-Google-Smtp-Source: AGHT+IFeJU5P21g2+KpTjso/RWJ0896W/J65sLmbtkloH76ZizTy87kZbTnF4kB92tm0ezpnDi5dm2fIynDl5PgBmTs=
X-Received: by 2002:a05:6402:5253:b0:5d1:2377:5af3 with SMTP id
 4fb4d7f45d1cf-5d3be661fc5mr3945565a12.5.1733469604117; Thu, 05 Dec 2024
 23:20:04 -0800 (PST)
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
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Date: Fri, 6 Dec 2024 16:19:52 +0900
X-Gmail-Original-Message-ID: <CAMZ6RqKLrDB-xkm2G242yU7L=tzxCR9NTwca-1yuWSSEHAOrxQ@mail.gmail.com>
Message-ID: <CAMZ6RqKLrDB-xkm2G242yU7L=tzxCR9NTwca-1yuWSSEHAOrxQ@mail.gmail.com>
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

On Fri. 6 Dec. 2024 at 15:14, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Thu, 5 Dec 2024 at 18:26, David Laight <David.Laight@aculab.com> wrote:
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
> "is_const(NULL)" or "is_const(1 == 2)".

But 1 == 2 has already an integer type as proven by:

  #define is_int(x) _Generic(x, int: 1, default: 0)
  static_assert(is_int(1 == 2));

So, it leaves us with the case is_const(pointer). To which I would
question if we really want to support this. By definition, an
expression with a pointer type can not be an *integer* constant
expression. So one part of me tells me that it is a sane thing to
*not* support this case and throw a warning if the user feeds
is_cont() with a pointer.

If we just what to accept pointer arguments but still return false
(because those are not integers), one solution is:

  #define is_const(x) __is_const_zero((long)(x) * 0l)

This would be consistent with __is_constexpr(): it does accept NULL
(i.e. no warnings), but does not recognize it as an integer constant
expression, e.g.:

  is_const(NULL);

returns false with no warnings.

> Side note: I think "(x) == 0" will make sparse unhappy when 'x' is a
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
>
> Or does that trigger some odd case too?

Following a quick test, this seems to work and to return true if given
NULL as an argument (contrary to the current __is_const_expr()). So if
we want to go beyond the C standard and extend the meaning of integer
constant expression in the kernel to also include constant pointers, I
agree that this is the way to go!

Side question, Linus, what do you think about the __is_const_zero()
documentation in

  https://lore.kernel.org/all/20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr/

Do you think I am too verbose as pointed out by David? Some people
(including me and Yuri) like it that way, but if you also think this
is too much, I will make it shorter.

Thanks,


Yours sincerely,
Vincent Mailhol
