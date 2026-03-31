Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2403738E121
	for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 18:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774982197; cv=none; b=ETMprDXZmI+n67LDz4EBFKbTB/pZo05Zbmp6wQgrj0uOn/ntDJe0bSJ0tOH2SEQo/5RSLDrAjfpstL/u8WC0+26l9LRN04Rcar6fkkGIsPErnr1csnrZK96J9m34xa2qshOWr0EvFuH50Z+P31xoeAfXPUia9IkFJZ/3Sh6/xjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774982197; c=relaxed/simple;
	bh=DwEKjICeDkCjJOVrt0+LZu6p2US33YhraP63lKerfiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kcgsCthI2cBIk+u0RuL94w6mG+qtFoL0g+VAqdzT8RM2wo5Apc+eV3L1+QU1Q42INgtjJwRi5fW/smgja8hYl7OzLuhk5AAlxdOyKppXAaGdodoXUJp9q+P8y3rBdiUZz09FuyKBdUsmv6zMaKooLEu4kC0GzaupnfhyJsqFCz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Wq/nacdx; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Wq/nacdx"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b8f9568e074so847508166b.0
        for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 11:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1774982194; x=1775586994; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6Jwbq+7LR0mSJFQk5uCurdhkOuVoq3zAKj7b6at5J18=;
        b=Wq/nacdxUYeWLr40tD0pMOAbU0e8MzRhJfoxvCmdFzGGvzjdrHGoV+a2fwvru+c2mx
         21SNwzWRA9p4+PvZMTdvYKOmWqRLXY8os64D46WMQ7NbMsh4wX+aMJbA6XT6VCZWmndV
         CKsrelLJCUJEK3IOTx/Mo6ybPhU7Lq+7xoDGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774982194; x=1775586994;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Jwbq+7LR0mSJFQk5uCurdhkOuVoq3zAKj7b6at5J18=;
        b=mQ4PedwOR1I+nfbSma7+FF5ij2QSClZdgNXRLkMdSR72Iubu88xArcpSInU4svTQsJ
         f4NRGBZsTaNG4AfjhYBIN1/EoBXSmYvfEOUOUXjhmye4B+Tj9aOW1XjjYEEQsYWkmjeg
         gCJ5dWStiw3SsfreLhoIGIWuAyF+Led6Tbr+ReS143+QZac8FYc8qnLhygAVvrTWSPia
         niuJsGrkez2xgTI1dtObtfj8NTRwVabWDeMz8GqE4swsE2gCgd+ou7VMS6UOdPlbLylW
         kJ6woo9wiwEVC+90MpYheV0eEQcAY9vFJMQwPfO2IPWWaTveao0ORtPkGIkIcaMzgVQw
         Bieg==
X-Forwarded-Encrypted: i=1; AJvYcCXpJh9PYMtSWbzRaxydC6PTB4f0kXlHC1ZdYwd8bYfF8aafHAlregarXJduxFtPC3YCeB/v@lists.linux.dev
X-Gm-Message-State: AOJu0YxMZCaIYen/bP0KdgFgATPWRSolY0GN+CVqZ3zdSY51KnkE6zVD
	SAMkhfQMk2LuwHbKqqE+DUbeaHrUFNJqZbFJzdJxxDfN3MbWgMCRpfRRtwK++mnTqsk9gMGzxhy
	YJ7KQ2IDwBQ==
X-Gm-Gg: ATEYQzzyYcJkXDlK3SFJtR35uoc3N0TYNgZe6SiLdZ+SAfdtBeJaM1XoKjtxmdPHuBh
	wKmG/qMP9WOND9otJECsyTuouoO1zqXM7PaOhh+Gjtiy0q+zXVYNhLIsd70T81tDQlH/D87A/z0
	DCFaEO4UPu7ZJ3hdE1zNuFoohI24Ym2SyCYI63tLUac0BkiBtEr1DWr9K65cBLEfniIi1rrFe2n
	ajSW7qrgeJR9+bUOuGYD9LQRMmcrrcgTgHuC+noJmiax9roeZAxFL9Vgw/NOC2yTbbchAqliQ26
	C6K9Gk9IqacxGtTCQoMp/2hIlpx75xMp9D+4OJW8MYEUk0LInZkUVK0kCBGBNtvRHn6/1F3ewq3
	1TmNyFY7jTd3A1RIQvfVC3rpqV13uaZFgF5AhSLBgFBkcv40SnPYM9CnC1sU359V9MTe03lZDBb
	/Um16Di0Rrdup6VCdy6mh7cg4Y5ro9bq54ItfvGGBkE83eIjohULgz6R5R7eNkFbbyTeGvUi+7
X-Received: by 2002:a17:906:7d56:b0:b9b:fa57:d5b0 with SMTP id a640c23a62f3a-b9c13ca1993mr30840866b.43.1774982194196;
        Tue, 31 Mar 2026 11:36:34 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae23dfesm443676466b.13.2026.03.31.11.36.33
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 11:36:33 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b9c098328acso90721366b.3
        for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 11:36:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWHvD7FnpTNVgVmPQHTH4hD/wgTr3vZKOu1+TDyIdhL81kKndY0fyAWO4kD8EDUS4bcDG2S@lists.linux.dev
X-Received: by 2002:a17:907:c789:b0:b97:d126:c007 with SMTP id
 a640c23a62f3a-b9c13b2c4a6mr48468766b.30.1774982192841; Tue, 31 Mar 2026
 11:36:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-5-kees@kernel.org>
 <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com>
 <CANiq72kL3rTKyDNYmD7wXiKCVJSfa1bnp2L8NShXU7OPmWjJ4w@mail.gmail.com>
 <CAHk-=whjwHjmB0_2yXsOjDa7Mi_yFSx3AMd3vGk5r70WocvZZg@mail.gmail.com> <202603311117.454F578@keescook>
In-Reply-To: <202603311117.454F578@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 31 Mar 2026 11:36:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=wizJdr1qgJ9NKNjtbH=ugL3umA9JRW9ifrQaD+PpWCMuQ@mail.gmail.com>
X-Gm-Features: AQROBzBUflXPh777BM9crSo8MSIUJXluDEJ78_cVjfj9YSXDGlWfMakjxHiYmFw
Message-ID: <CAHk-=wizJdr1qgJ9NKNjtbH=ugL3umA9JRW9ifrQaD+PpWCMuQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] types: Add standard __ob_trap and __ob_wrap scalar types
To: Kees Cook <kees@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
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

On Tue, 31 Mar 2026 at 11:32, Kees Cook <kees@kernel.org> wrote:
>
> If the code was written perfectly, then there's no problem.

My point is that BUG_ON() DOES NTO SOLVE THE PROBLEM.

> The point is to make a type that still works with C and all the associated
> APIs (e.g. format strings, native arithmetic, etc) without creating the
> mess that Jakub, Peter, and others (correctly) balked at around accessors
> for doing function based math.

Has anybody tried to suggest that "use a label" model?

Because I 100% agree that the current overflow handling is pure
garbage, and doesn't allow the code to be used in any kind of sane
code.

But I think that's solvable with the "branch out on error to be
handled elsewhere" model.

               Linus
