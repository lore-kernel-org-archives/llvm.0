Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F9A1474CC
	for <llvm@lists.linux.dev>; Sat,  5 Apr 2025 17:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743874037; cv=none; b=UT+Y/bjDRU3aDU+SlXjh7nE8xipBBooNXnqkkEiHJOlxwktjzeLa2H+618TyL9XrmG8bbqW80jPP7DjhlmcJUQSvF6OPQoAeSIOH8xHJeUqUuQ2bIvRQN96uNPtbK5RQAnis9wTaVnxbokaX7gaEtN2fQlqK9jxZZ+NoULDztxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743874037; c=relaxed/simple;
	bh=larYg1hBb0zYQ8ddvysFpCJTzGqt5ZYJc6A0nvv8XdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HGX4pZCZWl94aRDpS2CDWiNMNHSLMk1tlq498wRxBoY3BVWljYoTMCvKoypkGPOEHoVVBwPoJBKp7bDK5QZEKiapdUSieg71Bl56ET6sMbY3gB4Pv2dTSPNVynq/q0m5mpzRhV3h3JjjzjvjJvEqdQAalCdaE+kr+OuXrEtDcDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=WUdw6D/2; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WUdw6D/2"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac2963dc379so496018166b.2
        for <llvm@lists.linux.dev>; Sat, 05 Apr 2025 10:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743874033; x=1744478833; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HrTb9VZlD1+MV9PcZsbh15i/1bQFvjnrnpOg0qSiP9c=;
        b=WUdw6D/2YiSH8n0GcvC/P+kt/O4lQF9I1m3tsFw3s22ugSJ81Gkt5MwilxXTXvrdiJ
         piZElQvZxhSmxGt/8zDZ5LDb6pemXYYK7IL99yfja8CXgpco93Q094LO8zWY61b3ry4Z
         ateRYetg2y7I5sOOEp6lCYn9+apHQQUUJ+Pfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743874033; x=1744478833;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HrTb9VZlD1+MV9PcZsbh15i/1bQFvjnrnpOg0qSiP9c=;
        b=BQq5vK+K/cnYt0/QKui0NTuTQVCysxGsh6BzbI1vEhx9hZ9JXhIU16ql/s5PWAa0Zt
         wff09NRmHlBYhHN6OIj9g8yu2maGPGkUPpW5ToHBd5PLIFOONJpxEy42hBW+TwXTgmwB
         JK8ZI544v4lTjCqpg5TzSOWECuXJTn4p7K/RmJDf4ZEa+MDQ9EYR1DEfOMZRkbhyfUB3
         gbLBWOgy4Fyz8qPslniwqzyc2TZ4QUCtlyXXPW7c2etZGhJlgIOPkkWSdJNYpUAI8/7Y
         h7/cQcp484BJkF7ijTgNV3KPFuEn6YCyvm0epNOE3ExVcabg/7AQnEVvWBK8B3cKJ0Tk
         rq5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUy0x4SbALpbGnQRvOhOxVw4oygM3EAWI7Uj5MOmQAhadQvZD2vbI585TO50shholI/y3E8@lists.linux.dev
X-Gm-Message-State: AOJu0YzUtoNTiEv0+bVLycOVaBU4TBkk1lBflqtSMjcAeGLPv1cewpJv
	eFeZ0gVaVYTjC03CxoZMzH8V3VH7ehBkGAkeHAQHCuCkqZZFPhUgJgTWz4VMW7fQySGtY8y5xgp
	jCoY=
X-Gm-Gg: ASbGncspl/tdvSWAuVSJ2stvk/3ExfClh5pG3jEotvTLtutrA9nm8p0rxHw3P+mgaXd
	NDiR50qGQ9lw6ttlohnIkDgOco7DmhVLrOXEZ1crm10OiLYR0kDTpZyoJVNlD0wqhWKlpujOCEy
	08r9CQkMzYQgeQVb5tPjvr2JRuFEAfHotcudmXjdCPlfnhYOGoByPtSIZVTyku4w9Ld7oyvgeYe
	p9rIkzuJ8tkAKK0xpCGAaPgWSdOCE0k3kMkLZrl0hiS17JaKb/yq/6ex1EUn2zjvAg7tH37fGkK
	D7RnZxxbHPFrUM6LGNwz+bBjFIIBRsqhSzQKjTOET5J1nGoo5HSlX84gw+P/1cGrhJy4xXsOMto
	vvDEEOYwlKREvmGg6x0Q=
X-Google-Smtp-Source: AGHT+IEgevMXar8tuzDH1aM7wgrXpd3uPeB9IrpM9tNAqHdeEOpbBImskIHIrR3ImBIA7P3WtmVVLw==
X-Received: by 2002:a17:907:7f91:b0:ac7:19c9:bb8e with SMTP id a640c23a62f3a-ac7d16ca982mr588562266b.9.1743874033188;
        Sat, 05 Apr 2025 10:27:13 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c0186973sm451114866b.154.2025.04.05.10.27.11
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Apr 2025 10:27:11 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e5e1a38c1aso4168484a12.2
        for <llvm@lists.linux.dev>; Sat, 05 Apr 2025 10:27:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVVPRSA1prcyJx8uhi8z+/unUyLsoKz+NPGYdqOYpgLo2lF8C1E5GN70qJtgM3JBhthbaAf@lists.linux.dev
X-Received: by 2002:a17:907:7d8b:b0:abf:4da0:28e3 with SMTP id
 a640c23a62f3a-ac7d1773abfmr684591066b.18.1743874030918; Sat, 05 Apr 2025
 10:27:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250404-vsprintf-convert-pragmas-to-__diag-v1-0-5d6c5c55b2bd@kernel.org>
 <20250405101126.7a2627a6@pumpkin>
In-Reply-To: <20250405101126.7a2627a6@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 5 Apr 2025 10:26:53 -0700
X-Gmail-Original-Message-ID: <CAHk-=whC15F9=fQqr-5moPA0SXFc-fAx_15=jzbYELg1TCWsqg@mail.gmail.com>
X-Gm-Features: ATxdqUFrvkeu1Sr201J8ENZ25xtQlPJ4DGYFMkNOtvxMM9DDu1oRsew6bWugCBQ
Message-ID: <CAHk-=whC15F9=fQqr-5moPA0SXFc-fAx_15=jzbYELg1TCWsqg@mail.gmail.com>
Subject: Re: [PATCH 0/2] vsprintf: Use __diag macros to disable '-Wsuggest-attribute=format'
To: David Laight <david.laight.linux@gmail.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, 5 Apr 2025 at 02:11, David Laight <david.laight.linux@gmail.com> wrote:
>
> Perhaps the compilers ought to support __attribute__((format(none)))
> to disable the warning.

D'oh, that's a good idea.

And gcc already supports it, even if we have to hack it up.

So let's remove this whole horrible garbage entirely, and replace it
with __printf(1,0) which should do exactly that.

The 1 is for the format string argument number, and we're just *lying*
about it. But there is not format string argument, and gcc just checks
for 'is it a char pointer).

The real format string argument is va_fmt->fmt, but there's no way to
tell gcc that.

And the 0 is is to tell gcc that there's nothing to verify.

Then, if you do that, gcc will say "oh, maybe you need to do the same
for the 'pointer()' function". That one has a real 'fmt' thing, but
again nothing to be checked, so we do the same '__printf(1,0)' there
too.

There it makes more sense, because argument 1 _is_ actually a format
string, so we're not lying about it.

IOW, something like this:

  --- a/lib/vsprintf.c
  +++ b/lib/vsprintf.c
  @@ -1700,9 +1700,10 @@ char *escaped_string(...
   }

  -#pragma GCC diagnostic push
  -#ifndef __clang__
  -#pragma GCC diagnostic ignored "-Wsuggest-attribute=format"
  -#endif
  -static char *va_format(char *buf, char *end, struct va_format *va_fmt,
  +/*
  + * The '__printf(1,0)' thing is a hack make gcc not ask us to use a
  + * a format attribute. 'buf' is *not* the format, 'va_fmt->fmt' is.
  + */
  +static __printf(1,0)
  +char *va_format(char *buf, char *end, struct va_format *va_fmt,
                       struct printf_spec spec)
   {
  @@ -1718,5 +1719,4 @@ static char *va_format(...
        return buf;
   }
  -#pragma GCC diagnostic pop

   static noinline_for_stack
  @@ -2429,5 +2429,5 @@ early_param(...
    * See rust/kernel/print.rs for details.
    */
  -static noinline_for_stack
  +static noinline_for_stack __printf(1,0)
   char *pointer(const char *fmt, char *buf, char *end, void *ptr,
              struct printf_spec spec)

Does that work for people who see this warning?

            Linus
