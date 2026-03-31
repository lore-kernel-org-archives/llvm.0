Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016DC3B52E0
	for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 23:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775001374; cv=none; b=oefvE8vFCIz+xNhQtycnP45oJ+a8ZgIBKQnqKG5I8AA/qJRoxhq126kWLBpq19jChab3YTMAry0UQhzhIiHs1rp4H56pUyosiRUI9r2e3bquzAHz4jxz8XO4lmZM6pON+f1jhx53SXJsMBMEPVIwaaLXLYHYZyId+jAmHistPMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775001374; c=relaxed/simple;
	bh=hi1MFskNb8DMYSQRnhoouww2qda97qGJwbTEd7MQFUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hGvOx3gsXyEsxNeBFaVqVv0mPagIFniYHfg9r8qRFfIfcx542NtQitkQB9bCP562ZxoH3ruBTQoGyT+OnyyoWpN90ei78GridtTxtInia+JtMc5lMaL4Kka4btrOco8Q6yUDY5LZx8kpsnqmUm4qKBl3GkeGRDQ1UqhR2FOYNI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=frQjxD9q; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="frQjxD9q"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b9382e59c0eso1011242666b.0
        for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 16:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1775001371; x=1775606171; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ap740lhReTUh/Tx7odelrkvzzjajL/UYRtgEhV3gotU=;
        b=frQjxD9q4TuIwA48q3QNItVQ7059bTjWuK7s/LgOfvmpGJEjeBktN8epkFw4Z+Bjn8
         YqMMwZGBubGsCMNMZQdkzz4JIR6DHetviXCbVujfY4qoKcaZQANwdaXtV3P7fylXv262
         E5DeL2lGIm3X9BQT0h5CSa9GFqxGTjNXroH/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775001371; x=1775606171;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ap740lhReTUh/Tx7odelrkvzzjajL/UYRtgEhV3gotU=;
        b=G/W14QxXrIgbY37EFBdupF6MHqMvY2BtSAOzjQEnhWYrJk++kyV+d5b/me/DcvN282
         jgV0EV0+jAZqhsbUe5Bp3RapBD3i5kPBBHuezXO+6/ethv1EowHFOEq1IHnAF4OVuBwb
         s15VakydSgrwhxjJZphTPQdToAi1MX3R3ueUnviMmn7JMms3D4rcRITioI2J0328RBA/
         9fL8JIhpnwGrhaS2DCqpe37TLGJ3Ba0Mc72UrQBIIBkDwm0ndOGHlJ8EOC+VivtvO9Eh
         sLVx8jTlG//hokcmEBLs3YQRHcclkdsYx+XXQbBxN5CFM0MTSDF9Kl9tkEoDDLQThm1A
         WpEw==
X-Forwarded-Encrypted: i=1; AJvYcCV7xTcVS6eanPsDomLV0d20FxgNZGz8nqKwCSdSt1B4vXo5ZLKxf18r2wSmSAlZSAERxvS9@lists.linux.dev
X-Gm-Message-State: AOJu0YxzOq41X9io5c6fyCqnqfaMp8jkMj/Oiti7HML4picVc9fePGtD
	CcfqPpiWqufIrV3FvRjwYKa8GVTbjATsvpHEaHasTifmMmGGxkGJRLIIHR7QGplwxgRudw6wvEV
	s8rOGwH03uQ==
X-Gm-Gg: ATEYQzzgBn808aSq9xHF8R8NnsWx1Opn3JWo7J4lR2PZgWDLmvTeJSJwmbqT1JtEhxZ
	GJlEWO9UmKsEtGzV3HgW2mbb+2dJ2isYrnUmQ/6x1vHAc5IPqh3G3goTdYZAxeMpMYmB29dNNJh
	zMP+leT4QxEZNrOBZIb+k1rC4oWoccEWqdC83YLdAuoEfSG21Ivp5Oex05QTwM5olVExbs87gUc
	pYG4nRUv8/EWsnuaymAqJt1D5GL/NHKQo+U5EiW+AMnkXX500YImDLj4yY12xNC0Z35hna5Vbvq
	EMoYryHlJHH058RPx2lIMp2HKtVS3oege2/pB0AmcACt/zK1ZP3nXyFYLA6/YWYGTwEwB3fvxDg
	M3VertKWk9h6DdHX/fBZqyuFBcDOqehlX9QICjvcBStP4e5GmFLY2rPPvBHcsS2FXYCLkipNZxC
	Pb1Pw0hQxkOIBZgp3ZXf5/tzFDnvmwORukXr+NvKwxRnhBt9UatpqwagLpv8IotgbNsABjhaumj
	0KERTXpE1Q=
X-Received: by 2002:a17:907:84d3:b0:b97:edc1:f9c4 with SMTP id a640c23a62f3a-b9c13789be4mr64782666b.1.1775001371383;
        Tue, 31 Mar 2026 16:56:11 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c0219ed10sm96744966b.41.2026.03.31.16.56.11
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 16:56:11 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b97ed4ad579so988219466b.3
        for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 16:56:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWVZjOOmchSw8rmC91Od2w1CcKOFNYjMvSGgoDILCXfLTVe62lwkrPCzuoFu66ttcjQLhka@lists.linux.dev
X-Received: by 2002:a05:6402:13cd:b0:66b:810f:1c4d with SMTP id
 4fb4d7f45d1cf-66db09f03d1mr893296a12.18.1775001037895; Tue, 31 Mar 2026
 16:50:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-5-kees@kernel.org>
 <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com>
 <202603311253.95C54588E@keescook> <CAHk-=wjSOGaausLeTD13yAqso7qM09EnkDFiN7wF15kH0VWmZQ@mail.gmail.com>
 <202603311321.4EE9FEA@keescook> <CAHk-=wj9pWsgsbrLDOk7ipKnHbz3JvuqsmQ3DhGg-OKgKS9DUA@mail.gmail.com>
 <CAFhGd8rE+ggYghcwUphSRc2ftQMaX7LbKKPwQZzsw43bg9VVmA@mail.gmail.com>
In-Reply-To: <CAFhGd8rE+ggYghcwUphSRc2ftQMaX7LbKKPwQZzsw43bg9VVmA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 31 Mar 2026 16:50:21 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj4j9-=VMdVJZQjn=FEDWpE5JkHtr3CwErQdXVGFfGkXQ@mail.gmail.com>
X-Gm-Features: AQROBzCocASEQv-3sgFpeT7hRsHg1wWGTjTvooh3XWVShxy7lX1Q_VH65yuwsXg
Message-ID: <CAHk-=wj4j9-=VMdVJZQjn=FEDWpE5JkHtr3CwErQdXVGFfGkXQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] types: Add standard __ob_trap and __ob_wrap scalar types
To: Justin Stitt <justinstitt@google.com>
Cc: Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, 
	Mark Rutland <mark.rutland@arm.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, Finn Thain <fthain@linux-m68k.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	llvm@lists.linux.dev, Marco Elver <elver@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Nicolas Schier <nsc@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 31 Mar 2026 at 14:50, Justin Stitt <justinstitt@google.com> wrote:
>
> How do we feel about type-defined labels? We can specify sane default
> handlers where we define the types:
>
>         typedef int __attribute__((overflow_behavior(trap, __handle_me)));
>
> ... and define specialized handlers later on

That sounds like an interesting interface, but I think it ends up
being kind of odd, because normally the type definition would be in
some global scope, while the 'handler' would be a local label name.

I think that in some situations - and certainly other projects - it
would make a lot of sense to have the trap handler be a global
function in that situation (ie "abort"), but with that being
explicitly *not* what the kernel would want, it seems a bit odd to
specify the name of a label that then is used in a totally different
context.

So in your example:

> int func()
> {
>         ...
>         u8 __attribute__((overflow_behavior(trap, __BOOOOM))) product = 5;
>         ...
>         product = a * b; // if store is truncated, goto __overflow
>         ...
>         return product;
>
> __BOOOOM:
>         pr_info("%u\n", product); // shows "5"
>         return -1;
> }

The above makes total sense, but imagine instead the code being
something more like this:

Some header file does this:

  typedef unsigned int __attribute__((overflow_behavior(trap,
__BOOOOM))) u32_overflow_t;

  struct some_random_struct {
        u32_overflow_t usage_count;
        ...
  };

The implementation for looking up those structs then looks something like this:

  struct some_random_struct *get_entry(int hashval)
  {
        struct some_random_struct *n;
        spin_lock(&hashlock);
        n = find_entry(hashval);
        if (n)
                n->usage_count++;
        spin_unlock(&hashlock);
        return n;

  __BOOOOM:
        WARN_ON_ONCE("Entry 'n' overflowed\n", n->name);
        spin_unlock(&hashlock);
        return NULL;
   }

does that still make sense?

Now, I'm not *opposed* to this kind of interface - we'd presumably
just use something like "overflow" for the label name anyway - and it
allows people to use whatever label names make sense for a project so
it's clearly a nice feature.

It just feels a bit odd. But maybe it makes perfect sense at a
compiler level as a "it's just declaring the token to be used for the
exception label".

                Linus
