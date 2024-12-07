Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DF2381AF
	for <llvm@lists.linux.dev>; Sat,  7 Dec 2024 07:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733557376; cv=none; b=Fa8e5NGHiBdBRELcNsMzgGZlWwEPLrH5GPo2O+NGhIdicSTd6NMUmR4L6jb5Akf6o0VwzWR8P/xGf5j6dJ8cl09jK/ciaftE6sfIv4ZZlfzKr1woVI9w1F8rRuTZMHliu+uOS19QH0ZTqw+mLUML2U4bdJb8XsVne3uXV4yFssg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733557376; c=relaxed/simple;
	bh=zXC701XlS+Mku5aOxt11GhmVlqiDr7cEZoBagLZyIo4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LMSjvpkQDdOrPtt+vg4ahs/a/iNdrhlbFRjS8RqOuViTSYigrm6z/Rin2RptjqyaQWWRT2NUOY1IZHfZ8cwNmDKHRy+bY88KnORldZW+hR+OlxsyWHx3rKLBcvtcpr4nT8HM6O/TQTH8KLMdghK6BZob7F08N6p+ba0O9z8BzFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XW8IpJOz; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XW8IpJOz"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aa62f1d2b21so325778966b.1
        for <llvm@lists.linux.dev>; Fri, 06 Dec 2024 23:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733557373; x=1734162173; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Hd+JXxg1Trx18tJn2WFf9QCw9lSZFwBnHLKDbtoBF3M=;
        b=XW8IpJOz4ulE/HFY6DzCANwlN5rDVHXdgb4uMbZ7zselksirwaJk/GLUTxeijLlvVE
         cjJflqrmITwn1HrA2eVsue0p3AFDqcWF4wvh3SsKz14rn2UrPJREKZiQXt6phDttX7Xj
         IoZPd3wt948HR2VDbORmidF42XHXBzyaAFDLUVjuQrdNMtgiM2ifxHL7ZAGU7UGRE5g5
         A51XWA3HftvZl38+5pa7fOJ8WRuUC+945dB3HHQhlpLpfazNvaR12ZtktuwkYNJwbOza
         asooZcJV2Vwe51i3ayih3vUnX9gObxbLPJztVaMHdipDxxfjCz2fJpi3WEn+MU4/F8Bc
         XxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733557373; x=1734162173;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hd+JXxg1Trx18tJn2WFf9QCw9lSZFwBnHLKDbtoBF3M=;
        b=GJlaiMU0UKwyYfw30nuNDHoYT5eK7vL9UC0gCMoXqoldcnoQnvklt/YDal48e7m7c0
         FhMIeI53PmGoqHAvh2FDqj7HZsrtVvCLtqKVdWUnXOf1QAofVQSoT1LqadmIGamKYfUE
         GplDRAvNrJKHdqJ4L9Kq+SRIuqlRav+U5JCk5MGBCG5UxDCtvNhqGIFNN1u4BcZVc7if
         n7058cIJSnei1aCSp4FXJTz9eLipdF8bf2xUorX3aTet/Jn6oBUJO60c0A/Q7pN5fqw9
         SUvYk0aMcPu8Rk00/18Sv1jR4q1buXokJQl+7qxmBcid18eXQZ//A3JSXm/L4FBgVM76
         VwDg==
X-Forwarded-Encrypted: i=1; AJvYcCWk6OLrHb6D9g7T/B1W/jSsa+y5l8cG880XSmf+MZZw3rsfx0MpigBjptVbN2/fNeHk2XKn@lists.linux.dev
X-Gm-Message-State: AOJu0YwkBrf1v4ieHhi0FTXLLzV8Vn1Uw3CWcxhR+2jUb66h1A9xXsfh
	DDcfPDXKSZuTVR99AnIvQg7T2yxlc9zQCqa4t1kH1YrDmNW/zYWdbKHXXxLv3hOrYwUrK2lBOQw
	bO0tDTR1Kp4upSi5FJk4Pj5i++14=
X-Gm-Gg: ASbGncuRbB0F4EGwy2NbX2wNkxBqQk8yifbjiPvGwUji32KOo3K+AZhGwQ9uyt50+JE
	9PdvauEROIaf1lkd/4SyuRXJmuCpaSd4=
X-Google-Smtp-Source: AGHT+IFtbq3U+qyH15cm3qJcpaS8xIxfktbIH2S26u2IkmcJ4yPTJg9aqWHgPR/Bx1zVWKXpdweVI0tjzLEF2jmrRv0=
X-Received: by 2002:a17:906:31d1:b0:aa6:62d5:653 with SMTP id
 a640c23a62f3a-aa662d50b73mr25238766b.54.1733557372613; Fri, 06 Dec 2024
 23:42:52 -0800 (PST)
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
In-Reply-To: <e806dd51b1ac4e289131297fbf30fc37@AcuMS.aculab.com>
From: Vincent Mailhol <vincent.mailhol@gmail.com>
Date: Sat, 7 Dec 2024 16:42:41 +0900
Message-ID: <CAMZ6RqLOR3aCRW_js2agV+VFiHdazb4S2+NdT5G4=WbDKNB8bA@mail.gmail.com>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of __is_constexpr()
To: David Laight <David.Laight@aculab.com>, Linus Torvalds <torvalds@linux-foundation.org>, w@1wt.eu
Cc: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
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

On Sat. 7 Dec. 2024 at 05:24, David Laight <David.Laight@aculab.com> wrote:
> > > > #define const_NULL(x) _Generic(0 ? (x) : (char *)0, char *: 1, void *: 0)
> > > > #define const_true(x) const_NULL((x) ? NULL : (void *)1L))
> > > > #define const_expr(x) const_NULL((x) ? NULL : NULL))
> > > > I send this morning.
> > > > Needs 's/char/struct kjkjkjkjui/' applied.
> > >
> > > Oh Christ. You really are taking this whole ugly to another level.
> >
> > I sort of liked that version in a perverse sort of way.
> > It does give you a simple test for NULL (unless you've used 'struct kjkjkjkjui').
>
> Except const_NULL() really doesn't work at all - so you are lucky :-)
>
> So maybe the slightly long lines:
> #define const_true(x) _Generic(0 ? (void *)((x) + 0 ? 0L : 1L) : (char *)0, char *: 1, void *: 0)
> #define const_expr(x) _Generic(0 ? (void *)((x) + 0 ? 0L : 0L) : (char *)0, char *: 1, void *: 0)

This still throws a -Wnull-pointer-arithmetic on clang on const_expr(NULL):

  https://godbolt.org/z/vo5W7efdE

I just do not see a method to silence that one. So three options:

  1. is_const() does not accept pointers and throws a constraint
     violation:

       #define is_const(x) __is_const_zero(0 * (x))

     This is my current patch.

  2. is_const() accept pointers but is_const(NULL) returns false:

       #define is_const(x) __is_const_zero((x) != (x))

     This keeps the current __is_constexpr() behaviour.

  3. is_const() accepts pointers and is_const(NULL) return true:

       #define const_expr(x) _Generic(0 ? (void *)((x) + 0 ? 0L : 0L)
: (char *)0, char *: 1, void *: 0)

     David's latest proposal, it requires to remove the
     -Wnull-pointer-arithmetic clang warning.

I vote for 1. or 2. (with a preference for 1.). IMHO, we are just
adding an unreasonable level of complexity for making the macro treat
NULL as an integer. Would someone find a solution for 3. that does not
yield a warning, then why not. But if we have to remove a compiler
check for a theoretical use case that does not even exist in the
kernel, then it is not worth the trade off.

Concerning is_const(var << 2), the patch I submitted works fine as-is
with all scalars including that (var << 2):

  https://godbolt.org/z/xer4aMees

And can we ignore the case (!(var << 2))? This is not a warning
because of the macro, but because of the caller! If I do any of:

          if (!(var << 2)) {}
          (void)__builtin_constant_p(!(var << 2));

I also got the warning. The point is that the macro should not
generate *new* warnings. If the given argument already raises a
warning, it is the caller's responsibility to fix.


Yours sincerely,
Vincent Mailhol
