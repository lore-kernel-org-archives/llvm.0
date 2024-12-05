Received: from out.smtpout.orange.fr (out-14.smtpout.orange.fr [193.252.22.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97F51E492
	for <llvm@lists.linux.dev>; Thu,  5 Dec 2024 19:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733427135; cv=none; b=cgzztu6IbYQpQBamQXcYcqK2Q6K2ZxbQdmn3OQTKHioPNnbtcl2Rc5Pe/5tpzqlT9GErapzZGbE8bY00ZL9T2GfQYOuBriDK5rC+zSOgOf2chaTLCc8RUxM0oipBUVgG43ZM6MCcxlHSqUffzLcLFS/DhXCykepR9y2UpVEQkdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733427135; c=relaxed/simple;
	bh=SqA1jjBHk63XFY9uhyM2rQ0mOc7qaMSdPBDp2d0vQWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QfNm8yokpkfdHoeZNxfIfTSNtdhki/lrtIVTlTURB6uv2qFNHdNT8HK738aEHPx4Js9/YekyB1od5ERWD19hbEJynkc6+2nW/g0RVmjyuPvN6oY8HSkN9Dcjm++SAdO+tgGKa99jd4tFZ7WWpUjn1eVgoCTsFOR6Yg8EH1bxzxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=LnxZ5uUL; arc=none smtp.client-ip=193.252.22.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="LnxZ5uUL"
Received: from mail-wr1-f44.google.com ([209.85.221.44])
	by smtp.orange.fr with ESMTPSA
	id JHZxtDamerVFvJHZxtiART; Thu, 05 Dec 2024 20:32:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1733427122;
	bh=gOoooPhx/l7HLxvA2brAhQv1Lnc9qpuTdTl2b6/0YwM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=LnxZ5uULgpeCn4bLl596NWBgzELl9RQyvFVyObznmI630KRfkBp7jKfVQ/uFMBgl5
	 IrjMa5MEn6CjWX/tGr3fzwI2PTpkyKsCQTLYOLWgxC6CIUrRysgec7cDqyL+869e1J
	 Elc0xwm654zb+vS+vOp/VE9UjzfT5Arr6ab0H+j258GETmKL0CjW70Dd49hVhj8Rim
	 FS+29HAOc8vZVUFm9kdzSbKk23O2PHd4ZeE2tTCPb8V6/hJTbeMFkmUr9+KvWBw9ff
	 LaO3+tOWJph1l2SFU1Up5qJsW0FYLbkXLCWgabPX+kQhwbrXZ0cXsKGZRN/dNP1FyP
	 QIVPuvJrOKIVw==
X-ME-Helo: mail-wr1-f44.google.com
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Thu, 05 Dec 2024 20:32:02 +0100
X-ME-IP: 209.85.221.44
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385ea29eee1so976002f8f.3
        for <llvm@lists.linux.dev>; Thu, 05 Dec 2024 11:32:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV3To5TB0eyXwokzk3TuTESuwm8uPS1BNit4JvFxWHZhIQrHM6PJSwUEt6KeSLU+DJh5cau@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/mVF/efVjwWTksRS42tFvaGXaz+HNQ0EqD1Rh4aNnHN+G1KxK
	35VfJhk2fkreYrfAeWsTBniTRvcjqRYzulp/cpvI7kmbOnFbOoIPmKz+zP5TBJGd2uwzfeOHA/k
	XMslWjxFHs18MOWHWVMtsMnupMBI=
X-Google-Smtp-Source: AGHT+IFEdpgbM9v1hEJyP58q1rp9/ynE8X6JLZXjVWzmdZJjAWTc9kp//N1g8Aq1Xn7w0wSLoLE1A73y8EJUIxU21wE=
X-Received: by 2002:a17:906:319a:b0:aa5:f288:e7e3 with SMTP id
 a640c23a62f3a-aa5f7d15684mr942250466b.15.1733412700594; Thu, 05 Dec 2024
 07:31:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr> <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com>
In-Reply-To: <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Date: Fri, 6 Dec 2024 00:31:29 +0900
X-Gmail-Original-Message-ID: <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
Message-ID: <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of __is_constexpr()
To: David Laight <David.Laight@aculab.com>, Martin Uecker <muecker@gwdg.de>
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

-CC: Martin Uecker <Martin.Uecker@med.uni-goettingen.de>
+CC: Martin Uecker <muecker@gwdg.de>
(seems that Martin changed his address)

On Thu. 5 Dec. 2024 at 03:39, David Laight <David.Laight@aculab.com> wrote:
> > Sent: 02 December 2024 17:33
> >
> > From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> >
> > __is_constexpr(), while being one of the most glorious one liner hack
> > ever witnessed by mankind, is overly complex. Following the adoption
> > of C11 in the kernel, this macro can be simplified through the use of
> > a _Generic() selection.
>
> You should give credit to some of the earlier patches that do the same.
> I'm sure there were some related ones from Linus - not applied yet.

ACK. Would adding a suggested--by Linus tag solve your concern?

> > First, split the macro in two:
> >
> >   - __is_const_zero(x): an helper macro; tells whether x is the
> >     integer constant expression 0 or something else.
> >
> >   - is_const(x): replacement of __is_constexpr(); tells whether x is a
> >     integer constant expression.
> >
> > The split serves two purposes: first make it easier to understand;
> > second, __is_const_zero() will be reused as a building block for other
> > is_const_*() macros that will be introduced later on.
> >
> > The core principle of __is_constexpr() to abuse the return type of the
> > ternary operator remains, but all the surrounding sizeof() hack
> > disappear.
> >
> > On a side note, while not relevant to the kernel, __is_constexpr()
> > relied on the GNU extension that sizeof(void) is 1. const_expr() does
> > not use any GNU extensions, making it ISO C compliant.
> >
> > __is_constexpr() is temporarily kept and will be removed once all its
> > users get migrated to is_const() (or one of its friend).
> >
> > Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> > ---
> >  include/linux/compiler.h | 41 ++++++++++++++++++++++++++++++++++++++++=
+
> >  1 file changed, 41 insertions(+)
> >
> > diff --git a/include/linux/compiler.h b/include/linux/compiler.h
> > index a2a56a50dd85227a4fdc62236a2710ca37c5ba52..30ce06df4153cfdc0fad9bc=
7bffab9097f8b0450 100644
> > --- a/include/linux/compiler.h
> > +++ b/include/linux/compiler.h
> > @@ -316,6 +316,47 @@ static inline void *offset_to_ptr(const int *off)
> >  #define statically_true(x) (__builtin_constant_p(x) && (x))
> >  #define statically_false(x) (__builtin_constant_p(x) && (x) =3D=3D 0)
> >
> > +/*
> > + * Whether x is the integer constant expression 0 or something else.
> > + *
> > + * Details:
> > + *   - The C11 standard defines in =C2=A76.3.2.3.3
> > + *       (void *)<integer constant expression with the value 0>
> > + *     as a null pointer constant (c.f. the NULL macro).
> > + *   - If x evaluates to the integer constant expression 0,
> > + *       (void *)(x)
> > + *     is a null pointer constant. Else, it is a void * expression.
> > + *   - In a ternary expression:
> > + *       condition ? operand1 : operand2
> > + *     if one of the two operands is of type void * and the other one
> > + *     some other pointer type, the C11 standard defines in =C2=A76.5.=
15.6
> > + *     the resulting type as below:
> > + *       if one operand is a null pointer constant, the result has the
> > + *       type of the other operand; otherwise [...] the result type is
> > + *       a pointer to an appropriately qualified version of void.
> > + *   - As such, in
> > + *       0 ? (void *)(x) : (char *)0
> > + *     if x is the integer constant expression 0, operand1 is a null
> > + *     pointer constant and the resulting type is that of operand2:
> > + *     char *. If x is anything else, the type is void *.
> > + *   - The (long) cast silences a compiler warning for when x is not 0=
.
> > + *   - Finally, the _Generic() dispatches the resulting type into a
> > + *     Boolean.
>
> The comment is absolutely excessive.
> I'm sure I managed about 2 lines in one of the patches I did.

I think that Linus made it  clear in:

  https://lore.kernel.org/all/CAHk-=3DwgfpLdt7SFFGcByTfHdkvv7AEa3MDu_s_W1kf=
OxQs49pw@mail.gmail.com/

that this deserves a detailed comment.

The details block in the current __is_constexpr() is 37 lines long,
the details block in __is_const_zero() takes 22 lines. So I would
argue that I made things better.

Unless more people share your concern, I am planning to keep this comment a=
s-is.

> > + *
> > + * Glory to Martin Uecker <Martin.Uecker@med.uni-goettingen.de>
>
> IIRC Martin has agreed in the past that the accreditation can
> be removed - especially since it refers to the 'sizeof (void)' trick.

I tried to look for such message:

  https://lore.kernel.org/all/?q=3Df%3A%22martin+uecker%22+__is_constexpr

but couldn't find it. Do you have the link?

@Martin, do you agree that I remove the accreditation?

> > + */
> > +#define __is_const_zero(x) \
> > +     _Generic(0 ? (void *)(long)(x) : (char *)0, char *: 1, void *: 0)
> > +
> > +/*
> > + * Returns a constant expression while determining if its argument is =
a
> > + * constant expression, most importantly without evaluating the argume=
nt.
>
> You need to differentiate between a 'constant integer expression'
> and a 'compile time constant'.

OK. This one was just copied from the previous __is_constexpr(). I will app=
ly
"s/constant expression/constant integer expression/g" in v2.

> > + *
> > + * If getting a constant expression is not relevant to you, use the mo=
re
> > + * powerful __builtin_constant_p() instead.
>
> __builtin_constant_p() is not 'more powerful' it is testing for
> something different.

I meant to say that __builtin_constant_p() is more powerful at
constant folding. But I agree that the comment is not clear.

What about this?

  If getting a constant integer expression is not relevant to you, use
  __builtin_constant_p() which not only returns true if the argument
  is an integer constant expression, but also if it is a compile time
  constant.


Yours sincerely,
Vincent Mailhol
