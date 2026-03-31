Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEFC342C80
	for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 17:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774977537; cv=none; b=tEj3kA2imdncZsSKQF3vYY/T01DJggTsNnRYxSuaWcu/63W58VXjCGKOYv80ZL0V/XaRCwjIvBoKoqFKGA807m+jaeFjvBDsqpo3dK28kkoEU5jqnx0l8UHtyyJg8JM9nKvFROtjgRR80HAuo3srrbGirCKOHHXO6RQPj3ORaKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774977537; c=relaxed/simple;
	bh=6ac9F4nte1Yiyo3mPmvL0jRUpnUVgMzCJ+yaIK6fLrw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gaUkP6mZBO7EYzAKTWcnq+ZZEAt72vLPf9ICRzJqk49m9ackmGK4WLzS7ROAmfiLQUmVO70jJlO7+DrN4h3GmzOOVNqG2QT9tDWHQsPVyL4CpyIfTjuuWn9gm3iWZjRCOsACQQtKQJ2W6RqxKMs1FPfhCu5m0JZEW5Ddjz3Xs0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=FX/JBwT4; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FX/JBwT4"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b97e6e48b24so1003452066b.2
        for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 10:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1774977534; x=1775582334; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4f6EWJpSf2F8Fa/9meaVrgxvLf6j4eAN5dwsMo8lPrs=;
        b=FX/JBwT4UJXLesNexyStthJnaaFauwkTIwpCkLmBNb2ZaHhGSvVJFmHEZqhOt7/UTD
         vvHhn1KhjrOqu1MI0KsOpxTCj4dfeaF3tPJyeUyLcqidJveTJ16FiIQMJ0Qo1YuXGWY3
         xjRdyOgocQEkuhjNdri6azBADyxnt/+qyRAes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774977534; x=1775582334;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4f6EWJpSf2F8Fa/9meaVrgxvLf6j4eAN5dwsMo8lPrs=;
        b=LFyoZ7d0UM3ukY55Ttxu175SpC3TMHNyVr2GK2Z6+mi/aQKYocZ64xFnxJV8JQxdsu
         rq3tQn0H+d60ml05u9U9Mg45xW+f0EDbpSUgBER86eCaHmDKKDDD2rlgcv9AQyDe/dFX
         z6MS3zOCE56zF0qvBf95JFVWAag3hp5Sx/7CdpLKViNDi0yEk2nPxpzsU3Vj4NbAD7Il
         EiMHAodaI8kOLs0+7vZBwmAU+0KlmdccVdVq/GdCnunATBG1JHEoSgVp0w+m38tonmYN
         uONo69HlnHM0jIWgeKcocUhRCh8it+Psyal8wASbL+T+cWiAHWCvRPHjs0p9PSnOxSG6
         qBtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRwBQwy64Y/4Ih9QPtT7IYvEHc+YzSRwFSaLUENfuoWZ4QRQcN96naFgXkwg0SbcgqF5CU@lists.linux.dev
X-Gm-Message-State: AOJu0YyUeFtUmjsTVdS8/PTZdqcALli5paFmmkzRu9fS/JGHgRXPsmtO
	aEfpifI59bSmcwOVPxDRgrIP4fOrHbSovR7SKKHcW7V7u040BttQATCEssKQgKbVobWNybqMS/A
	0WPRdK33HXA==
X-Gm-Gg: ATEYQzyzqul4lIV9L64sHPpBM72BG/JeodITonrufwH4prlc9h7S+m3O217mUEjmgxK
	TaMfB6khtPiV7iMTqDwp7Z8b5L7Y6TLNT9CLw+HxbRSHeiqiUzPgkRmSrssB4/xRvO9LUrGEejR
	uXbnfFN2TZuLOqaF9/LLsJTXrnVUua1IQVu39DWZX1+PBM1jsYQX41/67zWfDuTiDf5j07Q7Kvx
	cSyS0JYG7zBEMMWSRsjj+NzMEJKiOPi3gyI6KFDgS2orxDHXA0ImctwxvaCEvnigco+pHxqAuKq
	KohMzUC/9Z7oYJAZAuqaJh+MZk/H6DIzqwUq8/4lM98ckmFqbZvLnUeq6jflP8r24BW8gqOBFKm
	w8tvoRtgFDtc5cl9OJXbOIk5BLT/TCD3ed30eFw9CDsMllll8CICxueJIyGphm0hc30YL41r5Ma
	fj3F2bIWeJy79ygrNvif+znpT3BOHlU4VZ+i7Pwfg52WQio9vRUAq9kw0STmvEprn1ZkIYAYM4
X-Received: by 2002:a17:907:d204:b0:b98:549d:8376 with SMTP id a640c23a62f3a-b9c138fd9b0mr39504066b.17.1774977534509;
        Tue, 31 Mar 2026 10:18:54 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c0ded4da2sm31508566b.33.2026.03.31.10.18.53
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 10:18:53 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-66bf6aa4858so4026114a12.2
        for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 10:18:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWcDdYPyh+RfWSx04hMT9EfcwFxMJC2TJVP7fsmEPi57jFgjkx7bDAzMX/yiFiVWbVn0Dwb@lists.linux.dev
X-Received: by 2002:a05:6402:43cd:b0:66b:b46f:cbee with SMTP id
 4fb4d7f45d1cf-66dafead9ebmr239737a12.4.1774977532763; Tue, 31 Mar 2026
 10:18:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-3-kees@kernel.org>
 <CAHk-=wg=q7ptcMyUAqPGDbX_DKHivJVppc8bP0zpQqzOky_avA@mail.gmail.com>
In-Reply-To: <CAHk-=wg=q7ptcMyUAqPGDbX_DKHivJVppc8bP0zpQqzOky_avA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 31 Mar 2026 10:18:35 -0700
X-Gmail-Original-Message-ID: <CAHk-=whfF-T-qrvL567DYD3ymqUhEXm_455CS=Xqvngjucd+Pg@mail.gmail.com>
X-Gm-Features: AQROBzDZPm_0YIwJ05O5Tx8cRSfkjvtMjCTPVCmkYZWKjM8JxXDJ7ksIZ8sr0Tg
Message-ID: <CAHk-=whfF-T-qrvL567DYD3ymqUhEXm_455CS=Xqvngjucd+Pg@mail.gmail.com>
Subject: Re: [PATCH 3/5] compiler_attributes: Add overflow_behavior macros
 __ob_trap and __ob_wrap
To: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Justin Stitt <justinstitt@google.com>, 
	Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, kasan-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev, Nicolas Schier <nsc@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 31 Mar 2026 at 10:16, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> The only safe trapping behavior is something that has a clear an
> unambiguous and simple to use way to *HANDLE* it. Not just "mark it
> trapping".

Side note: this is the same kind of complete and utter idiocy that
made Rust people have allocators that abort when running out of
memory, because it's "safer" than returning NULL.

THAT KIND OF THINKING IS NOT ACCEPTABLE IN THE KERNEL.

I don't know why people keep doing this. Stop it.

                   Linus
