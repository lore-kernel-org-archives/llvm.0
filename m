Received: from out.smtpout.orange.fr (out-16.smtpout.orange.fr [193.252.22.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA94B1E492
	for <llvm@lists.linux.dev>; Thu,  5 Dec 2024 19:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733427194; cv=none; b=IQPLf4G0hTwTz0Z0Y9Rjmx7km7iXR2EKM74QEZuQ96AMa6ll2AhrqOItSs7zdPEF1jneVT0kgdoVlj8mJglLaRMLuNqSacGwOSVlm5FF5H25O4SVXO9ao9JRl5Np5sYVsCuq4x5lz0TZuqhrfTHpuhrItRFKeMyaatKIf4D9G4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733427194; c=relaxed/simple;
	bh=l03ckjiHPorjA8gus97LZ3ryPn3/bYJ9+uD0vBgzyho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uTYGaNV0/uOzpJGMLCpwwbq+igLcV3JlwOhsqoqYvSGuCezPhZpYG3FBvi+yr8IJFgRinQWSBiUwPHhVysEbq8FqZkfGaAsMP+rU88VbVOqYj0LNSPvmJs7RzQ8HUBdFI59Y4BeibWekKohP4FY4oaLCj3AwJZoTs2+5D1M5sN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=SaNEtFsa; arc=none smtp.client-ip=193.252.22.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="SaNEtFsa"
Received: from mail-lf1-f44.google.com ([209.85.167.44])
	by smtp.orange.fr with ESMTPSA
	id JHZvtr79J25GjJHZvtPVN1; Thu, 05 Dec 2024 20:32:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1733427120;
	bh=L5clrau1lRtsXlazqJvRaiJm9ebUB3H7RT0weXhH8So=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=SaNEtFsaZEehRMC8knbZs7mNf+vPqbynAxC8+onlfzw5TpsOPnULLAdgBujDXNBAa
	 dhqs3GkRTs7Vu0Gz//eWqu0V3Br2FBKxRHLO5N+KId27fF2eITxw2rX81YNFJ6A2U2
	 vDGk5Q2p/zLKaDv0B8eW+biUqywYJb/ozFX8/wQZixvDRXQ7Myhe6GL/A9onDjx3X/
	 CYfNkp7718NoU95UWksdOezpvzvU02i8Xava+yyvlTOv7AjKczYjYm17oc+WRUZbJC
	 1klfU/ZjOb/HuCIfDipwwxqWrNEStrb+s4hpL0OfBhMfzw9SQYANCLr1JSLftfs8vK
	 eOaOiO86YgAAg==
X-ME-Helo: mail-lf1-f44.google.com
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Thu, 05 Dec 2024 20:32:00 +0100
X-ME-IP: 209.85.167.44
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53e152731d0so2121855e87.0
        for <llvm@lists.linux.dev>; Thu, 05 Dec 2024 11:31:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX115zCkX0yObdbU7wzyFWstgqNZLvjbN2qY5wz3W+vnF1Pd43GwwcByU2gm+hz8umBAVFJ@lists.linux.dev
X-Gm-Message-State: AOJu0YyMP2p2y43KXlHUR8odFvnc/CJdY9YP3li5ertb37HYCXvB3VX2
	a5nW1sZf3yrfTGbvFmFP11rGhPmApjrDSGefViYJPoFP4+GsG9obdNw06rgGkC4vVlo87DeDmO1
	xrQ1PaOagKFIbFpbWMEMAaX6KZCI=
X-Google-Smtp-Source: AGHT+IH7WYy/8Hc8H+vVCwhqalxjzlWUoqcEyoqkjWQBBxloHACrRQF+5k7EKnQaTMOmRJCyI12iNEP09nDvxOtT4aY=
X-Received: by 2002:a05:6402:358f:b0:5d0:fc12:79e3 with SMTP id
 4fb4d7f45d1cf-5d125063c34mr3565576a12.15.1733414047033; Thu, 05 Dec 2024
 07:54:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-6-4e4cbaecc216@wanadoo.fr> <ad4482cc835543578862051431f5174f@AcuMS.aculab.com>
In-Reply-To: <ad4482cc835543578862051431f5174f@AcuMS.aculab.com>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Date: Fri, 6 Dec 2024 00:53:56 +0900
X-Gmail-Original-Message-ID: <CAMZ6RqJMXKaa_xDcyweGwb+FqvANrpvrkRvnjh6_s-J1ApVmaA@mail.gmail.com>
Message-ID: <CAMZ6RqJMXKaa_xDcyweGwb+FqvANrpvrkRvnjh6_s-J1ApVmaA@mail.gmail.com>
Subject: Re: [PATCH 06/10] fortify: replace __is_constexpr() by is_const() in strlen()
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

On Thu. 5 Dec. 2024 at 03:58, David Laight <David.Laight@aculab.com> wrote:
> From: Vincent Mailhol
> > Sent: 02 December 2024 17:33
> >
> > From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> >
> > is_const() is a one to one replacement of __is_constexpr(). Do the
> > replacement so that __is_constexpr() can be removed.
> >
> > Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> > ---
> >  include/linux/fortify-string.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/linux/fortify-string.h b/include/linux/fortify-string.h
> > index 0d99bf11d260a3482bbe46e35c7553c0ccfb8b94..e3f2f772c5439ef71eb4a904b4ce27956bc69743 100644
> > --- a/include/linux/fortify-string.h
> > +++ b/include/linux/fortify-string.h
> > @@ -254,8 +254,8 @@ __FORTIFY_INLINE __kernel_size_t strnlen(const char * const POS p, __kernel_size
> >   * Returns number of characters in @p (NOT including the final NUL).
> >   *
> >   */
> > -#define strlen(p)                                                    \
> > -     __builtin_choose_expr(__is_constexpr(__builtin_strlen(p)),      \
> > +#define strlen(p)                                            \
> > +     __builtin_choose_expr(is_const(__builtin_strlen(p)),    \
> >               __builtin_strlen(p), __fortify_strlen(p))
>
> I'm sure Linus suggested a way of doing that without replicating
> the __builtin_strlen().
>
> Indeed it may be valid to do:
>         len = __builtin_strlen(p);
>         __builtin_constant_p(len) ? len : __fortify_strlen(p);

Then, wouldn't it be better for strlen() to be an inline function
instead of a macro?

  __FORTIFY_INLINE __kernel_size_t strlen(const char *p)
  {
          __kernel_size_t ret = __builtin_strlen(p);

          if (__builtin_constant_p(ret))
                  return ret;
          return __fortify_strlen(p);
  }

I tested it and it worked on an allyesconfig. So if I receive no
objections, strlen() will become an inline function in v2.


Yours sincerely,
Vincent Mailhol
