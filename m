Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6431422B8
	for <llvm@lists.linux.dev>; Sat,  7 Dec 2024 12:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733574271; cv=none; b=Vwr70pHijNXv5REuw1mdKbMZESR72pTJucMSshCVXynVJnkJc41Zq77du8TTSvhk/bqtk+jW0orzBde/eai1lqjlo40Lib5uQ/TNIrm15IMwSZSzabf+/XC2JvZ3QcjnNIIhHFdRziX52AGIRMAmYweTgTPx/2V/XLlX8K7s8MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733574271; c=relaxed/simple;
	bh=+MXZy6BV+hkBQlU86VrMl6aI35U4V0P2AE+HvRTf7GA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JxcYfjwt4k4XnNBR74DgxeK8fdqLMOpuhdBVTVFSN+8u3wWEPJeOtEgKIlZfHd54R1kaG/jXG2hriWWHOjQ0RdK1YY4jdnrC//o3QtJSm4lfJ23Iifmd5MIkppQncqA730L/MpsYATTVqw0sDOWr0GnH2HCj1ct02yCxZd34f0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A3kBi9ST; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A3kBi9ST"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aa628d7046eso435405566b.3
        for <llvm@lists.linux.dev>; Sat, 07 Dec 2024 04:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733574268; x=1734179068; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nQ4RRhd2E6TY+Bu5fIbqEbAQEz1MRYR2VOuTBXdoN1w=;
        b=A3kBi9STfGUDhMaTWB4W8MxbtkgHLSx/LAFvYQQ50srSXTlVhvfevVS8uEYZh/ZqoT
         a6cpgoAIF3kkGqZE0ET/lqjWG9kTE+zDmAOXGD8GFu40b1O/OJCNkL7l5zhO9NARkFhc
         SyI4Ab8ETHh0mlh9ogiL21RHz5T63lPatLpoNUR6Cbo/H+2rFzKoGAoh9SAIjtiW4jy2
         sIZF91SNtjRmyoK9vk0dU69EpyW3n4VT6i/YMS7dPE/ALowBtWKNjPFNUuKF8a767Z06
         FUV4yN6Ac0zquhcUSNxhOTRCn+SN/r7wGbnh+EcmHtQ8Iba9XmwIyfRswo6XqUMo7oQZ
         ILxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733574268; x=1734179068;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nQ4RRhd2E6TY+Bu5fIbqEbAQEz1MRYR2VOuTBXdoN1w=;
        b=wLcb8rOR9/ursasALXwaAeI9t/sLe9G4hE60zHHMnqaQZQqHpX4GIpBAMV5wH/PDZ5
         o1zTZu43Hvowed+34dqmR1Kztr2hKboerJSQxPsv9jg8SIKYb5eIPOajGu0V/xOiRyIy
         DDZENgalUdWzVA0G/71hR3iOx5GUZ9uGP90UJQjYO3BhK3NAxO4N0CKibKBOq6YkCho+
         SQwbhNNK1VZITTrXQFNNzgcspMJFsRq6lW+3gwT0+T8EWy/jF8DyZw1iGWTJx+9Aitri
         tUduEM1jPaNrpP44yUj74cftw3OnzBt9fDq8K5HsRv4zhRKC91xKVND/CS3IXPfsyAd3
         gCWg==
X-Forwarded-Encrypted: i=1; AJvYcCVZsN2xhkPE4kOSFmeVTruGnWpjRMvu5U3fASkBO9+8PDQlgucKQC+ABzPGHY+PpgBYLq6J@lists.linux.dev
X-Gm-Message-State: AOJu0YxwMao4f68Tc/tz7V+/TdZ57P5Gq3O+giuPyeMGaZ2Xuppm8vbq
	BZLnPPioLmYqkvZm+AbzoWoLmETxMz/0Gl8H9XTvQPCgNQc2RbRINz8Lceom6ml+oJRLS6s5SWW
	GUIQM9kHdKBFsIgxPWQtbnOMAZNA=
X-Gm-Gg: ASbGnctInQ33pp8pZCZRrjcCKxPkQZgSAM8hA33AsQXb7s4cw1aRhxcwN5ZayTcG3MD
	NdrDeaBbq7/EUxNzuds7cIaNMnzQL2KY=
X-Google-Smtp-Source: AGHT+IGR0yviTsv6EI0Cf6ZzGRuPI9Rqzj5opuPmDdPb/4ZfUr5j5Og+KYs8tNZPu+yItNXL45088jAdwI3x7fjsYQI=
X-Received: by 2002:a17:907:1de6:b0:aa6:59ef:ec with SMTP id
 a640c23a62f3a-aa659ef01a8mr99491466b.1.1733574267541; Sat, 07 Dec 2024
 04:24:27 -0800 (PST)
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
 <CAMZ6Rq+SzTA25XcMZnMnOJcrrq1VZpeT1xceinarqbXgDDo8VA@mail.gmail.com>
 <CAHk-=wiP8111QZZJNbcDNsYQ_JC-xvwRKr0qV9UdKn3HKK+-4Q@mail.gmail.com>
 <d23fe8a5dbe84bfeb18097fdef7aa4c4@AcuMS.aculab.com> <CAHk-=win8afdcergvJ6f2=rRrff8giGUW62qmYs9Ae6aw=wcnA@mail.gmail.com>
 <0f5c07b827c3468c8fa3928a93a98bfa@AcuMS.aculab.com> <e806dd51b1ac4e289131297fbf30fc37@AcuMS.aculab.com>
 <CAMZ6RqLOR3aCRW_js2agV+VFiHdazb4S2+NdT5G4=WbDKNB8bA@mail.gmail.com> <b1ff4a65594a4d39b2e9b8b44770214e@AcuMS.aculab.com>
In-Reply-To: <b1ff4a65594a4d39b2e9b8b44770214e@AcuMS.aculab.com>
From: Vincent Mailhol <vincent.mailhol@gmail.com>
Date: Sat, 7 Dec 2024 21:24:16 +0900
Message-ID: <CAMZ6RqJFReLJTd-O8s02oQNeB0SPQh3C-Mg+Nif5vMB9gFtQww@mail.gmail.com>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of __is_constexpr()
To: David Laight <David.Laight@aculab.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, "w@1wt.eu" <w@1wt.eu>, 
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
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"uecker@tugraz.at" <uecker@tugraz.at>
Content-Type: text/plain; charset="UTF-8"

On Sat. 7 Dec. 2024 at 20:19, David Laight <David.Laight@aculab.com> wrote:
> From: Vincent Mailhol
> > Sent: 07 December 2024 07:43
> ...
> > > So maybe the slightly long lines:
> > > #define const_true(x) _Generic(0 ? (void *)((x) + 0 ? 0L : 1L) : (char *)0, char *: 1, void *: 0)
> > > #define const_expr(x) _Generic(0 ? (void *)((x) + 0 ? 0L : 0L) : (char *)0, char *: 1, void *: 0)
>
> Clearly they can be implemented in terms of a common define.
> But I don't see a need for a const_zero() and nested expansions make extra
> work for the compiler.
>
> >
> > This still throws a -Wnull-pointer-arithmetic on clang on const_expr(NULL):
> >   https://godbolt.org/z/vo5W7efdE
>
> I was worried about that one.
>
> > I just do not see a method to silence that one. So three options:
> >
> >   1. is_const() does not accept pointers and throws a constraint violation:
> >        #define is_const(x) __is_const_zero(0 * (x))
> >      This is my current patch.
>
> Is that going to affect things like const_true(x << y)?

No warnings for const_true(x << y). See by yourself:

  https://godbolt.org/z/v79x3dnor

> Disallowing that seems counter-productive.
> (Remember it might be passed into a #define that is then
> checking its argument for being constant.)

I understand how a static inline may use __builtin_constant_p() to
check if its argument is NULL. But I am having a hard time
understanding how this would look like with macros and with
is_const().

Do you know one real life example where you have to pass NULL to a
function like macro which can not be written as a static inline
function?

And if that real life use case does not exist, then disallowing it
looks sane: it will push the developper to do the right thing: write a
static inline with __builting_constant_p().

> >   2. is_const() accept pointers but is_const(NULL) returns false:
> >        #define is_const(x) __is_const_zero((x) != (x))
> >      This keeps the current __is_constexpr() behaviour.
>
> No good - expands everything twice.

And? __is_const_zero() does not evaluate its arguments, so no side effect:

  https://godbolt.org/z/W988P4v9e

Or am I missing something else?

> >   3. is_const() accepts pointers and is_const(NULL) return true:
> >
> >        #define const_expr(x) _Generic(0 ? (void *)((x) + 0 ? 0L : 0L)
> > : (char *)0, char *: 1, void *: 0)
> >
> >      David's latest proposal, it requires to remove the
> >      -Wnull-pointer-arithmetic clang warning.
>
> Only for const_expr(NULL) - and since clang gets that wrong
> maybe the warning is a good thing.
>
> You can just add:
> #define const_NULL(ptr) const_true(!(ptr))
> Probably the only place where you actually want to test for zero.

Which goes back to my first point: if we have to declare const_NULL(),
then we probably do not want is_const() to accept NULL so that the
user sees the mismatch (and I am not acknowledging that we need
const_NULL(): as long as no use case arize, no need for it).

> > I vote for 1. or 2. (with a preference for 1.). IMHO, we are just
> > adding an unreasonable level of complexity for making the macro treat
> > NULL as an integer. Would someone find a solution for 3. that does not
> > yield a warning, then why not. But if we have to remove a compiler
> > check for a theoretical use case that does not even exist in the
> > kernel, then it is not worth the trade off.
> >
> > Concerning is_const(var << 2), the patch I submitted works fine as-is
> > with all scalars including that (var << 2):
> >
> >   https://godbolt.org/z/xer4aMees
> >
> > And can we ignore the case (!(var << 2))? This is not a warning
> > because of the macro, but because of the caller! If I do any of:
> >
> >           if (!(var << 2)) {}
> >           (void)__builtin_constant_p(!(var << 2));
> >
> > I also got the warning. The point is that the macro should not
> > generate *new* warnings. If the given argument already raises a
> > warning, it is the caller's responsibility to fix.
>
> Except it could easily happen way inside some other expansion.
> Perhaps someone optimises frobnicate(x) for constant input.
> Suddenly frobnicate(!(var << 2)) generates a compile error.

Then, that person will see that compile error and will modify
frobnicate() to remove the compile error. End of the story.

My point is simple: if the use case you are mentioning is valid, why
did it never collide with __builtin_constant_p() that we have been
using for many years?

And I am sure that there are hundreds of examples of macro that will
either pass their argument as-is to an if() or to the ternary operator
without accounting for if their input is (!(var << 2)). So why did not
these collide?


Yours sincerely,
Vincent Mailhol
