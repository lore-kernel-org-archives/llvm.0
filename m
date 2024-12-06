Received: from out.smtpout.orange.fr (out-13.smtpout.orange.fr [193.252.22.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF697198E71
	for <llvm@lists.linux.dev>; Fri,  6 Dec 2024 04:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733460199; cv=none; b=U4I3E1xpC81VXuxpBH/h2beCvjF08Bh4A9ECWT1VE71CuKvip+Cii7UcP6TAkciShBhGCLIEAPpUa0a4m1+HOKl9EtuSdjjqUIB+IKk+8Q20J5f+BDULblizvio5ZghDPZ2MKz60ItDSY5FW7Kueim7fhQkRgpoPNgi+NkpeubE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733460199; c=relaxed/simple;
	bh=r7zPRKW+PjxixSGhr3dPnkSnW+fktu4xG/vmEVmcVkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H1rYvt+DI2UFN7tsPjtac9BNnspSgo/0SiSbOpgcoXOaOnm710jZuY18GzRrs/6mjF7cDxNlutZ1yvfOi8eueYj9kfRznsh5+mQQEOdBOVyWjAYamLY3bbY7MwJiCGXCMLN8DgkVdHnaM1+MzGGjqkDOGddaDv7/mdUn8dFV2V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=qsESpQW/; arc=none smtp.client-ip=193.252.22.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="qsESpQW/"
Received: from mail-ej1-f49.google.com ([209.85.218.49])
	by smtp.orange.fr with ESMTPSA
	id JQBHtds6zaI1lJQBHthM0g; Fri, 06 Dec 2024 05:43:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1733460187;
	bh=Q1k59tg7g6ZR0AiJKHkbtvAsnBjYlK49uTsKYbfsQyM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=qsESpQW/LfvsZl411UyRN4YX2iwyLyWgn/Chnpu7qXTzyB6f+ZXNquvFiKvXsnz65
	 fVvLWjbk2jTCTZhgKs8D4pI1IDiHnGwmjHCifH8KBPLzjbO0WHjojFwOUC6KjaYdaj
	 at1tCnZSAX9ngNdBo0I177rheAZNRSN7XWa4GF1DnYChajkHdtgIES/hJEx+MG8dlO
	 NUFodKDVqFCBl/8pzSgKAkTajOk+bToJWXf5QOHeb6amyYUEQScwkuolFDg51hBZX3
	 wO0jrAT6WE+KjMDAndaOKjzqKgKSwB3/6a/H2xFZUkBjYl7zBCErOGbbgbn8mXg/jh
	 maI5KitgaIoaA==
X-ME-Helo: mail-ej1-f49.google.com
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Fri, 06 Dec 2024 05:43:07 +0100
X-ME-IP: 209.85.218.49
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aa6332dde13so142577266b.1
        for <llvm@lists.linux.dev>; Thu, 05 Dec 2024 20:43:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXdoX1SObQzYb4YidlSGuGUFg/ezI1XfmgfoFok/vXEd4c8K49B2Kd4iFA5ug3IrbBWaeC1@lists.linux.dev
X-Gm-Message-State: AOJu0Ywy1+jlkEeCcM+44i+oEQxs80WWJ5T+j9Dji5EBJeY1jvSHqYMi
	r2EovsHXetADNX90ldgoQILt1knvciZ9vgzdc7xFYKDRfNk5cdm0AiK458wct3gMb7stYMZp6p9
	f7PpHQM+nuoTb6DkZDOrH5LTSYvw=
X-Google-Smtp-Source: AGHT+IHLXgFQhA/c3KQxjVrMyKCAmSqwk42Fqpsfdz6EK+jIFFcEtdXEZClHZQiPmD1jBbv/RGy99L+br5F0PLvN22o=
X-Received: by 2002:a17:907:7392:b0:aa5:427d:b101 with SMTP id
 a640c23a62f3a-aa63a1109camr127306566b.36.1733460187056; Thu, 05 Dec 2024
 20:43:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-1-4e4cbaecc216@wanadoo.fr>
 <e115a4245e5342a994a7e596cc6357fa@AcuMS.aculab.com> <CAMZ6Rq+n0vG9zObF-kY-Xo+iP_Y3P8A6_nEfB8F=UhqeQBepRw@mail.gmail.com>
 <b48e2f5dd8d64cbab471629ae03c7511@AcuMS.aculab.com>
In-Reply-To: <b48e2f5dd8d64cbab471629ae03c7511@AcuMS.aculab.com>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Date: Fri, 6 Dec 2024 13:42:56 +0900
X-Gmail-Original-Message-ID: <CAMZ6RqKUH5VGHAuqv+dR_0o1JFTvV_gNV2qUwoMfcWCQUSX2Lg@mail.gmail.com>
Message-ID: <CAMZ6RqKUH5VGHAuqv+dR_0o1JFTvV_gNV2qUwoMfcWCQUSX2Lg@mail.gmail.com>
Subject: Re: [PATCH 01/10] compiler.h: add statically_false()
To: David Laight <David.Laight@aculab.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
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
	Martin Uecker <Martin.Uecker@med.uni-goettingen.de>, 
	"linux-sparse@vger.kernel.org" <linux-sparse@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, 
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, 
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"coresight@lists.linaro.org" <coresight@lists.linaro.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Fri. 6 Dec. 2024 at 12:39, David Laight <David.Laight@aculab.com> wrote:
> From: Vincent Mailhol
> > Sent: 05 December 2024 15:26
> >
> > On Thu. 5 Dec 2024 at 03:30, David Laight <David.Laight@aculab.com> wrote:
> > > From: Vincent Mailhol
> > > > Sent: 02 December 2024 17:33
> > > >
> > > > From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> > > >
> > > > For completion, add statically_false() which is the equivalent of
> > > > statically_true() except that it will return true only if the input is
> > > > known to be false at compile time.
> > >
> > > This is pretty much pointless.
> > > It is just as easy to invert the condition at the call site.
> >
> > To start with, I will argue that:
> >
> >   statically_false(foo)
> >
> > is more pretty than
> >
> >   statically_true(!(foo))
>
> Except that the test is more likely to be:
>         statically_false(x > y)
> and the invert is then
>         statically_true(x <= y)
>
> No different from C itself, there is no 'ifnot (condition) {...}'
> (don't talk to me about perl...)

No need to talk about perl, just staying in C, it has both the #ifdef
and the #ifndef directives (and since C23, it even has the #elifndef).

Regardless, this was just a nitpick. You convinced me, I will remove
both statically_false() and is_const_false() in v2.

> I suspect you need to pretty much remove all the comments that
> cross-refer to statically_true() from the other patches.
>
> So is_const_true() is just 'return true if the expression
> is a 'non-zero constant integer expression'.

No. Linus made it clear in

  https://lore.kernel.org/all/CAHk-=wh5SNYdgx8-X+ggHP+ojbG2F7oyt3TLmMgqejYd5zn0Aw@mail.gmail.com/

that we need an explanation of why statically_true() may not work in
some contexts and I agree with this.

As far as I like using proper nuances between the terms 'integer
constant expression' and 'compile time constant', treating
statically_true() and is_const_true() as completely different things
as you are suggesting is not constructive. At the end, what matters
the most in a comment, is that the final user properly understands how
to use the thing correctly.

Removing the cross reference would increase the risk of people using
is_const_true() in places where it is not needed. I will keep the
cross reference to statically_true().


Yours sincerely,
Vincent Mailhol
