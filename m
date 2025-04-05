Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A7F19D8A2
	for <llvm@lists.linux.dev>; Sat,  5 Apr 2025 18:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743879294; cv=none; b=XmGKca1a0KrVZ6exYtd+NJHHsele0Ui4O81qtjkoHOH5GJIuHWWhPR6Kf3CQcbOy4kuQFJQaiY5NdZw4ia/iKmrfIuwj0cnGTHY2RefMXaw/dXwbf503iARCQJJiO10npqw3ID31CHgwkgGQBjGpGo+Wqg7FhSzewp/DTr4VDnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743879294; c=relaxed/simple;
	bh=6Mb2qj22ju/TDAFHM2TV5BLsDIQBt4HcLZIzG4z141A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JmgUG+/OsMaHaA5v91lRnhBcowaS+pbBOtmTrIC3C5e8fJGPlTlP9Y5qAOYyiykbHqsq3k3RJbuMI3FIhOU/69qJvgMbuNV3M1iWS8ot68/uOeMvu3XmphnRIlgpNtsw6DsYV9lYRWUFFJVFWs0bP/zEdRjTrhbucwesloTzvZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZdWy+SoE; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZdWy+SoE"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac2963dc379so502865366b.2
        for <llvm@lists.linux.dev>; Sat, 05 Apr 2025 11:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743879291; x=1744484091; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bzXeIk7ElKBWwVWnXfaB/AJuQSkAU8XCLvd5Y9hQzuE=;
        b=ZdWy+SoEc+ZJaqc3GeREdL0GW8HwB7oIwl+Snggxi55rkza4Ji7jmR/ix6Hue6yZ1v
         NalTDnmqpqUqIw9fikTPbVMgGooDnvJHxqPRCmxxo7xpbfrRhRYuA2gF8BF0ZgTTDpsO
         m5ujbFqY4bMo1HmGG1/4WWcfJcs9YxHnzE6pNOI5EPjz97cP0QqV2lhkDeEephzBQjQI
         DLF+4QbaTMMrUAqRjanlUIguNEri8CLlEZPAPOMKYBW39ed6DeltuOqub/IGm40P+V/q
         1aboxkdqbxtpEwMJSaUGNurpMMYd7OAcbwIGCgnBnnb6DYw3T+yiDUhvI1XAb5bZXWEX
         ZZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743879291; x=1744484091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bzXeIk7ElKBWwVWnXfaB/AJuQSkAU8XCLvd5Y9hQzuE=;
        b=jFIzBUEz4ws2Uyb9rgBb4lPEdmmISJY67cLOBi8OO11kGvkvJxjkrbXhyeI8dvYn9C
         RcUm3AhMZShOuecDeBAHhF/e+NhhN/0Dr+pSVbQ2o4OBG7mbjgErxI+6cMXNKUGYMhi+
         9asMRNeampqAf324T57js/QI20ol1Ff+cd4RUUab1JBKgTdpuzT3aCdy7J0yktEKBx/w
         pYV8ud6vzyeUcESP2pvYEh1vckdqxCIWTQ8ZeQ6NObyBtVP/a8U7T1C/j+c5cbmdy9Ug
         RpQ8vWTM01ucfG4JiocqoOzVu2YGdBbK1olAXw9F8KK7yh/GQ3wqITJ7MnGKBvIUrNgQ
         TsfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQre0HjWoEcgKJ841aetjUJVGDpC9HqWaq9Gx5Ub2sCSsgKfxQc4yXN5dTLyAUVwzwh9GG@lists.linux.dev
X-Gm-Message-State: AOJu0Yxsr1hykB2h+Ephdcpb4FLvI2UzuWagIc72mOVZEkbXuRogffBo
	vbo/AunEu+Jk6+Pp9JZSCdEiRAoNEFkf2kx0kDWNzGTBt2OjseVrXSu7NQUAGFnE87sBMlKMAun
	bR1z3Vi7nkGeN1uvVdF0DSKvBMsU=
X-Gm-Gg: ASbGnctHQOcuUNBxLEXI2JnZo77AG9IyfQl9C41+baNKM6LR1MmE0pbjA6ve5RACJAO
	uSFu7AKxOZMUhOvdFcsd0GQ8VUzZViCBfdG+C+2VWSbEoaqfNHey2EsvzSoFR5FYwNk9RkenJs4
	LHxl+sHjkLLdk6AyWqN/EhSSGwIw==
X-Google-Smtp-Source: AGHT+IGh4QYB9HG8JaGAgqO45pIjnJVznH2U2vpOA2BZJVPQNImXQrlLswvmVbleUqXYD2XgtS7+iaFAHhu3GbyY0Qk=
X-Received: by 2002:a17:906:c153:b0:ac7:c73a:be40 with SMTP id
 a640c23a62f3a-ac7d1751be6mr637457766b.14.1743879290514; Sat, 05 Apr 2025
 11:54:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250404-vsprintf-convert-pragmas-to-__diag-v1-0-5d6c5c55b2bd@kernel.org>
 <20250405101126.7a2627a6@pumpkin> <CAHk-=whC15F9=fQqr-5moPA0SXFc-fAx_15=jzbYELg1TCWsqg@mail.gmail.com>
In-Reply-To: <CAHk-=whC15F9=fQqr-5moPA0SXFc-fAx_15=jzbYELg1TCWsqg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 5 Apr 2025 21:54:14 +0300
X-Gm-Features: ATxdqUEo0hrg8ukK2hpNQ5RM0ZzHx5jt9wGQ5J2fW60Ta7UWxTJouhXn4H-Yuhw
Message-ID: <CAHp75Vd--N0QjGrAW3TJRVCN0-LG31rVeHTGyb0awgO0sc_aXA@mail.gmail.com>
Subject: Re: [PATCH 0/2] vsprintf: Use __diag macros to disable '-Wsuggest-attribute=format'
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: David Laight <david.laight.linux@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 5, 2025 at 8:27=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Sat, 5 Apr 2025 at 02:11, David Laight <david.laight.linux@gmail.com> =
wrote:
> >
> > Perhaps the compilers ought to support __attribute__((format(none)))
> > to disable the warning.
>
> D'oh, that's a good idea.
>
> And gcc already supports it, even if we have to hack it up.
>
> So let's remove this whole horrible garbage entirely, and replace it
> with __printf(1,0) which should do exactly that.
>
> The 1 is for the format string argument number, and we're just *lying*
> about it. But there is not format string argument, and gcc just checks
> for 'is it a char pointer).
>
> The real format string argument is va_fmt->fmt, but there's no way to
> tell gcc that.
>
> And the 0 is is to tell gcc that there's nothing to verify.
>
> Then, if you do that, gcc will say "oh, maybe you need to do the same
> for the 'pointer()' function". That one has a real 'fmt' thing, but
> again nothing to be checked, so we do the same '__printf(1,0)' there
> too.
>
> There it makes more sense, because argument 1 _is_ actually a format
> string, so we're not lying about it.
>
> IOW, something like this:
>
>   --- a/lib/vsprintf.c
>   +++ b/lib/vsprintf.c
>   @@ -1700,9 +1700,10 @@ char *escaped_string(...
>    }
>
>   -#pragma GCC diagnostic push
>   -#ifndef __clang__
>   -#pragma GCC diagnostic ignored "-Wsuggest-attribute=3Dformat"
>   -#endif
>   -static char *va_format(char *buf, char *end, struct va_format *va_fmt,
>   +/*
>   + * The '__printf(1,0)' thing is a hack make gcc not ask us to use a
>   + * a format attribute. 'buf' is *not* the format, 'va_fmt->fmt' is.
>   + */
>   +static __printf(1,0)
>   +char *va_format(char *buf, char *end, struct va_format *va_fmt,
>                        struct printf_spec spec)
>    {
>   @@ -1718,5 +1719,4 @@ static char *va_format(...
>         return buf;
>    }
>   -#pragma GCC diagnostic pop
>
>    static noinline_for_stack
>   @@ -2429,5 +2429,5 @@ early_param(...
>     * See rust/kernel/print.rs for details.
>     */
>   -static noinline_for_stack
>   +static noinline_for_stack __printf(1,0)
>    char *pointer(const char *fmt, char *buf, char *end, void *ptr,
>               struct printf_spec spec)
>
> Does that work for people who see this warning?

This is quite similar to my initial approach [1] which Rasmus was
against (okay, I did the nasty castings on top of the printf() there,
but still). TL;DR: I assume it will work, but let others comment on
this.

[1]: https://lore.kernel.org/lkml/20250320180926.4002817-7-andriy.shevchenk=
o@linux.intel.com/

--=20
With Best Regards,
Andy Shevchenko
