Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D516C472766
	for <llvm@lists.linux.dev>; Tue, 20 Jan 2026 15:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768924246; cv=none; b=BOqFL6/oslbUeTuJ/Mq4/Z0PJa+5aTSD3BI9/sWUzBd934fsNMPynsx2Lt5K0wCiwZYIQWb/mEqlbxL3D33LwJqaMz+0wlj2vf2hyXVS8czzWF8upQ3rtKxPcrarifYnAEhQo1VPvSaLQNZh1KwgZIYY+51r+UzyNQ+//SgoTqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768924246; c=relaxed/simple;
	bh=XpG3bz7R9ediK2WwkkENXDNIEHxL/xrT9HAlIl9whaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DVMHurARrrUWhgN8uk+jXe4wocbgYgl2WPMnZrdxRDzP4YgYw7/M+uEHGmDQEKBKjZ2MxDvwALV9bdtIWdSMW9FB6HvzhTfW0T2hE2d0py823JQbz59UmvJhfpBr7QeJ3vgy0stvvy2SrfWCGTRu1qCNOo8yGkB2iYcKlU7pbCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D2yWLVjS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D2yWLVjS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F3ECC4AF09
	for <llvm@lists.linux.dev>; Tue, 20 Jan 2026 15:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768924246;
	bh=XpG3bz7R9ediK2WwkkENXDNIEHxL/xrT9HAlIl9whaE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=D2yWLVjSmzTjDm8sCdj82rjRC6WYep2mBOgo190kHApCzs2hSee5oCpIe2ZT1ov2d
	 /iTR+KBW/7nuNo1o28BQl8IAIg0XoXNJqRAmS8FGIVeDEX/PTvcuF2z/sd6Wy8YyAy
	 KWIuJIIVEX3Dwxfo8PZe+GhEMwsOClJzrrbkN05MQom9HSMTDQpGC1CA706jAVxxHw
	 05HwAj2SC4O4BaioXBqxixSBGlLSuWmXvgWl6cO6IFL1REkZBFIIhbG91yPMaYVotX
	 hezr7hTqt5U8nfalwzfzo5jOUZLSWfHfjZxv2Undv3SWIL6JvUKZ1ZIjFJ1S1N1jFl
	 W3X2/9RiDrFvQ==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-383122fbc9bso43011531fa.1
        for <llvm@lists.linux.dev>; Tue, 20 Jan 2026 07:50:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXfV2tI6DWlBL0xxTB/WYvaeauOV5dj7atiJLOW/rzFYP/42NSPj6iLFEix5uYYIB1zYHzi@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+32yyFHvJWCpWIhSIRyDscodsI7dfD3MzCZ/BEkez+qdk4/KO
	zZtQtZ0uKYs0lC39INVPwmaI4HYn1S6LUrr8pptu7H1IWhoBgtIqiEbQrbDhT+BjwFAwO8tmriv
	MIkFJ9T/rTh/BWcP3VS8kFBvLgWmSNiI=
X-Received: by 2002:a2e:a905:0:b0:383:20ac:fb60 with SMTP id
 38308e7fff4ca-383842de819mr53698121fa.29.1768924245171; Tue, 20 Jan 2026
 07:50:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260116-printf-kunit-printf-attr-v2-1-3dd7fefc3207@kernel.org> <aW3pgf4FQHFCC9Bm@smile.fi.intel.com>
In-Reply-To: <aW3pgf4FQHFCC9Bm@smile.fi.intel.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 20 Jan 2026 10:50:09 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9kOpAVq=-b2AXp02F2gJEAmJZxKE=UAGa5ypsVE_an3pQ@mail.gmail.com>
X-Gm-Features: AZwV_QhX9drB1hgqJ9klVbFZNHTUIutPHEp3R-rgb5Lnsmq4SJrmmeg7Xe6MtRA
Message-ID: <CAJ-ks9kOpAVq=-b2AXp02F2gJEAmJZxKE=UAGa5ypsVE_an3pQ@mail.gmail.com>
Subject: Re: [PATCH v2] printf: convert test_hashed into macro
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev, 
	llvm@lists.linux.dev, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 3:21=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Jan 16, 2026 at 11:27:03AM -0500, Tamir Duberstein wrote:
> > This allows the compiler to check the arguments against the __printf
>
> __printf() since it takes parameters, OTOH it's an attribute at the end,
> so I have no strong opinion on how to spell it.
>
> > attribute on __test. This produces better diagnostics when incorrect
>
> __test()
>
> *This is reference to a function.
>
> > inputs are passed.
>
> ...
>
> > +/*
> > + * This is a macro so that the compiler can compare its arguments to t=
he
> > + * __printf attribute on __test. This cannot be a function with a __pr=
intf
> > + * attribute because GCC requires __printf functions to be variadic.
>
> As per commit message remarks.
>
> > + */
> > +#define test_hashed(kunittest, fmt, p)                                =
   \
> > +     do {                                                             =
\
> > +             char buf[PLAIN_BUF_SIZE];                                =
\
> > +             plain_hash_to_buffer(kunittest, p, buf, PLAIN_BUF_SIZE); =
\
> > +             test(buf, fmt, p);                                       =
\
> > +     } while (0)
>
> Make sure you used tabs to indent the \:s.
>
> ...
>
> The downside of a macro is a killing of compile-time type checks.

This macro still bottoms out in __test() which is a function, so I
believe it preserves (and enhances, per the commit message)
compile-time checks.

I'll send v3 with the changes you requested above.

>
> --
> With Best Regards,
> Andy Shevchenko
>
>
