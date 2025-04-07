Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860D9224B0F
	for <llvm@lists.linux.dev>; Mon,  7 Apr 2025 07:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744011095; cv=none; b=VZD/cpi79SqZPZd4Mf3VebkQ9uEdI4cvgKwVk91t2yX4F8mqD5ewJ8e3ckBWhFcsHHOIEmCmlEDYOid2zmPAU/Xr1xNWYjbAKQr12bESu5u9/YUtbX7jBzyH841uZ39CvUWzVuJIoxgff7Uy3A8isoGTwXb3MIXghdESbX78i+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744011095; c=relaxed/simple;
	bh=P79AB40idj6Dfczhk1WELPjg31facOxkbCuN+/gQ1AI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=O56reAHeLuSCvUNN/tustyJzuK40BQwclRi4Cdc33KsyMZFHNiwhKKNKCPCBCDcykqM66bDxnPmYmNb7ZYmzvmD1Wi4M5mNwzyIOyOm83Y44o6s12CMClzTjYJFLvzgrRmXxV5/1LQWfuKcJug9Opyz6xUMsO96HmsX12qK45rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk; spf=pass smtp.mailfrom=rasmusvillemoes.dk; dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b=fks90IPC; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="fks90IPC"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30613802a6bso42502691fa.1
        for <llvm@lists.linux.dev>; Mon, 07 Apr 2025 00:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1744011090; x=1744615890; darn=lists.linux.dev;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e+FsyiVxgrsALzOGSoH1DnqIv36lge3vR/AnQvANcFA=;
        b=fks90IPClUDpvu3fLb9i062uxuoCcBywN+MAXA/WfFgOJFmVQTqNo6cfgWmkh9lTCy
         ScB+tCOJXlzW4TmTAyBWQRmLPdrm1L5RY5KyKK+v0kNcqBG6av7/EUP9+L9mYMzm7CUD
         p4jGl/xyQ+pwJgl9c6z8YgwY/IezdLeYCg2gA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744011090; x=1744615890;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e+FsyiVxgrsALzOGSoH1DnqIv36lge3vR/AnQvANcFA=;
        b=fRIImP52n+x1jO4i6i6gjC/zz0NFPhVP2ojNYvz8yaObbi3WJDJ4zxXvOVN4zYsx7d
         A+Cm164UPaUYugqvNLdyWXXXu5+x8jFFiB3cVcVmWqtwZeViENw5NsS1qsHKYx0f3DBD
         +/00M8Vcjgl/pvg0bY/fBVeANpvjNefXgt7J9rQENug8hoi/7/njd3Ns5NrCjQNblZEM
         /bebncZ1sabtmEwV4x+/W5sU2KsuznV5Pi/NJ/tlwm1ZxI2DJ7ZtUaltZ71Y1D+t2vi5
         Hrv0OygVVl/VZzypn4rgfSKx6jXJvo8UowjzFXRa2ytAlWOnMzLVCUTMx8mJTRck8JxJ
         jrqg==
X-Forwarded-Encrypted: i=1; AJvYcCX6bQRiOUHQ5ELHhsu5wBXq1toTAvjF7eo3+DYjqdESPqwmyafNL0tCMihxwbjlSnzf0cu2@lists.linux.dev
X-Gm-Message-State: AOJu0YxdQlE5+ltDia2nFw7VMo8MsbaZr0xmLj2W5DeO5DjZqUUdW11s
	M0EZ9NfDF0s68H8xwZLGKDKbDbaIX6XpRZ7KzkbABX/N8JBEyMyBz4gGCKm+Yp4=
X-Gm-Gg: ASbGncuhvC0YNhZc2LLFoz9lSQomxy6zTbnZj9znEhTwQqYO6Q1uPDBve4uune04kEL
	5qiwA/DdJ7uH9HCk+5KMJd21NT19LfnFIZSpa5DuKMRVzs3va1xzEROLXnQkUfmN+cTANs5Y0d5
	tMshFLXHynz3gx7/nXbayFWob7S29mvn+dKu+TZykTtxiBKJcuF/BcL60rzXMhPSjiaHKqZERFl
	y6umNlRZpRKl5ETX3KXUh5/9ORDIlC/xmOoNe6CBixZ/vPqiLqsU2rwEbxSVHvOFRLJQhvA4sXZ
	hdChEp5rqihUFu9GCiTd+jdTry9R4GEg3pxZfl861fW2IA==
X-Google-Smtp-Source: AGHT+IGvfCDZmH37Rku3/6brkNRCFnNVTT4+L3+viZzCFFTWFfGF0W6PoQouzKsU9D+T5t6fCyWK/g==
X-Received: by 2002:a05:651c:b23:b0:30c:16cd:8818 with SMTP id 38308e7fff4ca-30f0a109f5emr34850011fa.16.1744011090190;
        Mon, 07 Apr 2025 00:31:30 -0700 (PDT)
Received: from localhost ([81.216.59.226])
        by smtp.gmail.com with UTF8SMTPSA id 38308e7fff4ca-30f031ce889sm14676201fa.98.2025.04.07.00.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:31:29 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: David Laight <david.laight.linux@gmail.com>,  Andy Shevchenko
 <andy.shevchenko@gmail.com>,  Nathan Chancellor <nathan@kernel.org>,  Petr
 Mladek <pmladek@suse.com>,  Steven Rostedt <rostedt@goodmis.org>,  Sergey
 Senozhatsky <senozhatsky@chromium.org>,  linux-kernel@vger.kernel.org,
  llvm@lists.linux.dev
Subject: Re: [PATCH 0/2] vsprintf: Use __diag macros to disable
 '-Wsuggest-attribute=format'
In-Reply-To: <CAHk-=whC15F9=fQqr-5moPA0SXFc-fAx_15=jzbYELg1TCWsqg@mail.gmail.com>
	(Linus Torvalds's message of "Sat, 5 Apr 2025 10:26:53 -0700")
References: <20250404-vsprintf-convert-pragmas-to-__diag-v1-0-5d6c5c55b2bd@kernel.org>
	<20250405101126.7a2627a6@pumpkin>
	<CAHk-=whC15F9=fQqr-5moPA0SXFc-fAx_15=jzbYELg1TCWsqg@mail.gmail.com>
Date: Mon, 07 Apr 2025 09:31:28 +0200
Message-ID: <87zfgs5sxb.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Apr 05 2025, Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Sat, 5 Apr 2025 at 02:11, David Laight <david.laight.linux@gmail.com> wrote:
>>
>> Perhaps the compilers ought to support __attribute__((format(none)))
>> to disable the warning.
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
>   -#pragma GCC diagnostic ignored "-Wsuggest-attribute=format"
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

IMHO, this is much worse.

Yes, as I also said in the previous thread, I consider the
warning/suggestion here a gcc bug, as it shouldn't make that suggestion
when one doesn't pass any of the function's arguments as the fmt
argument to another __format__(()) annotated-function.

But we have this __diag infrastructure exactly to silence special cases
(and sorry I forgot about that when suggesting the #pragma approach to
Andy), and this is very much a special case: It's the only place in the
whole codebase that has any reason to dereference that va_fmt, and any
other function anywhere calling a vsprintf()-like really should have
gotten the format string that goes along with the varargs from its
caller.

As this is apparently some newer gcc that has started doing this, you
just risk the next version turning the wrongness to 11 and complaining
that "buf" or "fmt" is not passed to a vsprintf-like function. Let's not
do "a hack make gcc not ask us to use a format attribute" when we have
a proper way to selectively silence such false-positives. If this was
something happening all over, we'd do -Wno-suggest-attribute=format, not
spread these annotations. But this really is a special case in the guts
of our printf implementation.

So, FWIW, ack on Nathan's fixups, nak on this one.

Rasmus
