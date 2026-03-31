Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0FC32142B
	for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 17:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774976989; cv=pass; b=azhlFct8GIXH1CDpw+Ri9dp/J/qUokvbuZG0EMCfrN/s/ZLM666D//8c4ODFwlwMtqnfumU3/jAy0zJateZ8DOBgRMHb6xyZhUikG0ivDIfH/Z1lYgiZeFKapYymTLVbhNAyJC8xKvVN+xTt8G4INGEgE2/ILdN/qfZ4pGjnU6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774976989; c=relaxed/simple;
	bh=8EmbocqF6Vdb3h0BM5UKxGb7Zum+nJE7yig8zb0/EBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rMalxtH0XPVTduH+IT//9VS4GTdo2c5+M4EphJoZgoHuF5ujWOUf+18I5Ozdv/V5VHie3PoXG/IBzoSUlhAsM0/9/+5eyvxTtaN8p2RStDEIfc7y5+G2xlSnGFVbrvBFHAIWBxQWOu57VuY76WGxuI0ds2Um4HwpPyFfTiFRjCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SNQIxnKX; arc=pass smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SNQIxnKX"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-60525a93444so873608137.3
        for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 10:09:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774976986; cv=none;
        d=google.com; s=arc-20240605;
        b=CcvI4Ld3CvWTvyDWwIqc8lxaeMxBhN0ZbYkURKYFxRjjtGPAcSo2sFIjHkT5h0UYDM
         pj8f3pzebc3Dbpbk0NsBlcf5Po/hZDqOVoiLY3MjWvl+9FsGNk0LFv35C+Vqg339l+g5
         FcYiZP1eEC00ajXRQMAiCpKDFtiG9QWbAMG59iWH3H1GkBIl/y5Lk2qrjLW95kl2Nmrk
         jUH7np7N49OEIAZAhfuAwsXaXM/UJzKD3uXQb/09rFAnltyRrDIyqN/NkEPmljYq1KXG
         fNCDSZRg3FT+E7ZpFj5Xemp5rkGnM9WRA3oe5Jxe0ld1EkBEsrIGj1LDImmxwKUvOcX/
         i2XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N69dcykYCh53+bqwu3dyzBFgXRPQQLJXWFG4whULut8=;
        fh=Pph0P2uBTlTdBo/a7XNuVL0sSAiKOIzQkFFxK749nFY=;
        b=k2zaqwIINOWEHfRsW3j0B8y4wBQTYWLdRdz5ppiurYn9bggCFhwxYzzYXVl6wORtq+
         7jUwuXOmmC5OFR7nr31GfOnuwyxvywWaV74a/iw9SFp9UxqYf2iuFn5+x4KnlPGJ2rWv
         L0OzTZWx+RT051XafCwrhdzH4mmXDdimjf6FWAXW7xJXQ6vY7oAXdNLyAmuj1/5nAlR+
         114YEk6ObKUKk6EFmzZWnQWEEo6kM8c/1hfxj93cMh9DrD+mLB7VM4fGcq+ISSaMSlC1
         mJLlM75nwwuD5DL11rug3GzaIk1xgAReXC09wXXd9YJjv+9YB3ySVa3CTKUpTbTJ8ZlI
         Yf0Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774976986; x=1775581786; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N69dcykYCh53+bqwu3dyzBFgXRPQQLJXWFG4whULut8=;
        b=SNQIxnKXUTYpr7xsHdf6JEpwfvOdOaAbMLwnyEUeC2T5QJh0UMq5+KKHbkuq66Lk16
         mNR3rOAQByZj0KgwXOrhpIUBhTWO2abTq8fxMw5StXrJp6fvwNlpjNRMBn4x4U6WUQY4
         rovVHqrOgg6wbEA20R+Gp1ZS/rsQvx2Rg9FxTxmAnmErbi6xLdQx63gBXbCNkWarDGJ3
         pzcCPaR8PvxEOFvrrWEZ9om/a5rQ2k+h+9IoZLzUaaGiXVE0m/NEapDJlq2nb8aosSy6
         m1LAbRzqRapAPNFaQUeDWVPx/xRpMcsUdoEdhXYXU5NJ4vzPX+boLZKoej9F6ENzB2v4
         PN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774976986; x=1775581786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N69dcykYCh53+bqwu3dyzBFgXRPQQLJXWFG4whULut8=;
        b=f6FQKrq8NUN3aCp0KNF9/54z8WjXdLoLsaPXSO1PRG0afKlj0TJD6Ka8vXzePnvcQF
         M+8xCd9Gt5Mk8qcT7XD2yxgVgd4F5sRBhwnME9Ccfpqzb8zdRaNZpSYb2bveRQtqLZmK
         BHodZ5dnqO5vkMJepU0Tq08u0xfDfWObpouKdUrBDcVZ1rAu2cIhS9w17nTDAG8mh974
         yYbrggN2D5ZXmzqZOwgopyToamQnhkyrthDUODDBdMN2o8OIisE5jZTr2sAC4L+t1kAp
         H6HgMsvFY+JzWeigL/jrhaqvGecb9JrvQmmXh5ZRbzYHD3U9vpU0WRXP8NUdM9HB7/Ul
         66/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVOGhZeek8vDQCkpubOZmEZaksXSc8noVxfEtqEVAz3ud5rKx++MQmWORjJXhP8IU7xEfnH@lists.linux.dev
X-Gm-Message-State: AOJu0YxBwH9atTt8bQQYKKQVizpx4t8B6SDaVQt4rg/0HsDgkHN+uI6N
	udWVs1rV4YzWDoAwhNw0DOAtZNsXm99PGB+kPzhp+3TaHQAn0kktLJQrsT2UdmoQWpKf2xubkKA
	T3/ZKvqb/sEasAbR326HAZxF+uo3AVFeZ8bRRrxA0
X-Gm-Gg: ATEYQzxzm/0aw7zU7wex2WpbAW4aSpgvTCsdoXuuYiUH0aQ6A29ogfimSGQpRNQWfxy
	9NigeU3+PEFUVxS94bIGB0crwgM/UPKL5/0WyLZgtIO5qT/kg8a+1w0kccilFqlOFYnrgepQqe9
	0w+KQcRrtcyAn8Js2WCyBEEQXgajFekZbLhHhMueaErUQxVHlJFa6c6XMdVS/o/bqenAU4HM5bh
	JQUAnvtacFXBsi6WW/AkOuqExUZfcjpLVjTNCVKsqw5CBqe3aSHDmbQAqscxrPSnDJAxrOHmA4E
	TsX9bpg=
X-Received: by 2002:a05:6102:c92:b0:5db:dd12:3d16 with SMTP id
 ada2fe7eead31-60567cf5e34mr47219137.6.1774976985230; Tue, 31 Mar 2026
 10:09:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-3-kees@kernel.org>
 <CANiq72mK9fz6Spmgt4js3hScqhqvZb2YP2T7tDfR0fHPDFWJ7g@mail.gmail.com>
In-Reply-To: <CANiq72mK9fz6Spmgt4js3hScqhqvZb2YP2T7tDfR0fHPDFWJ7g@mail.gmail.com>
From: Justin Stitt <justinstitt@google.com>
Date: Tue, 31 Mar 2026 10:09:33 -0700
X-Gm-Features: AQROBzCWRSbSGajmdyoAKTTcnG8_jXsUZoBJguhEnhg_UEbHXmjODVo4uOcztkk
Message-ID: <CAFhGd8paijFboDVr8rJDjScob047q+zgYAs038WuVozOG0aYaQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] compiler_attributes: Add overflow_behavior macros
 __ob_trap and __ob_wrap
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, kasan-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev, Linus Torvalds <torvalds@linux-foundation.org>, 
	Nicolas Schier <nsc@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 31, 2026 at 10:02=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Mar 31, 2026 at 6:37=E2=80=AFPM Kees Cook <kees@kernel.org> wrote=
:
> >
> > +/*
> > + * Optional: only supported by Clang with -Xclang -experimental-foverf=
low-behavior-types
> > + * passed via CONFIG_OVERFLOW_BEHAVIOR_TYPES. When not available, defi=
ne empty macros for
> > + * the trap/wrap annotations.
> > + *
> > + * clang: https://clang.llvm.org/docs/OverflowBehaviorTypes.html
> > + */
> > +#if !__has_attribute(overflow_behavior) || !defined(OVERFLOW_BEHAVIOR_=
TYPES)
> > +# define __ob_trap
> > +# define __ob_wrap
> > +#endif
>
> Should that have `CONFIG_*`? i.e.
>
>      !defined(CONFIG_OVERFLOW_BEHAVIOR_TYPES)
>
> In addition, since this depends on a `CONFIG_`, with the current setup
> we would put them elsewhere instead of `compiler_attributes.h` until
> they are promoted to be "unconditional" (i.e. without the compiler
> flag):
>
>      * Any other "attributes" (i.e. those that depend on a configuration =
option,
>      * on a compiler, on an architecture, on plugins, on other attributes=
...)
>      * should be defined elsewhere (e.g. compiler_types.h or compiler-*.h=
).
>      * The intention is to keep this file as simple as possible, as well =
as
>      * compiler- and version-agnostic (e.g. avoiding GCC_VERSION checks).
>
> However, thinking about it, why is the config needed?
>
> i.e. if the compiler is not passed that flag, shouldn't the
> `__has_attribute` simply return false?
>
> Also, I am a bit confused -- does the compiler flag automatically
> recognize the names like `__ob_trap`? i.e. I see the docs mention
> using the attribute,
>
>     typedef unsigned int __attribute__((overflow_behavior(trap))) safe_ui=
nt;
>     typedef unsigned int __attribute__((overflow_behavior(wrap))) wrappin=
g_uint;
>
> But then we don't actually use it?

__ob_trap and __ob_wrap are defined by the compiler.

There are some examples within the documentation additions of this patch.

Kees, is it possible to make it more clear about what we expect of
kernel developers in terms of style? Should they use keyword
spellings? attribute spellings? only use custom types?

>
> Or should this just be like the rest of the attributes, i.e. we
> actually define them here?
>
> Thanks!
>
> Cheers,
> Miguel

Justin
