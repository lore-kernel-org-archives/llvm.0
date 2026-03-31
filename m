Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863752D46CE
	for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 20:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774988362; cv=none; b=dnU2TIWbEHnxP+0cK/k65wZUkii10YGlzWDgJHaLHwdPRsVZOrFLjlIzMbgZk3Dt8DnMJ/dII3ihB/rfVcHPK/Q+K5lkYLVhZb10Nqvi6evLAkWOEqfXqi4STuVmD1soNbTjNx1TBcQlTNRAulTPFMs0TIvaU3xlfI62G4Kbsgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774988362; c=relaxed/simple;
	bh=Y/YFED/0OtgPfgeV4gPZ7asbBZssxn6FNaeq1L4CVTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KoIS8mSIE24Gn+/b6uegabMdAZwSDlXqgqzK5ZvP5MaFx4RwklBomVFrZOyhtwRNadoN5mPGB57RyHjCd1jxJZyB8lv8WVDQjaZgYlwGp7j3YS0G8YSpP5axdvOpXJBpxOMh5UJJfnqohak8Ojnonm8+TSa/Fmn1VW6Y2Pqmg0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=h1bPKEDB; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="h1bPKEDB"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b982b0889d8so743912566b.2
        for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 13:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1774988359; x=1775593159; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VcN9sER3VoMAwC3I5Sh98SVftLUl9If6/CrHtfP+ol0=;
        b=h1bPKEDBin589TarlCpONhSTtadEu46iU6RNbVcPg3bs8UjnofI+ME6RORsDvBoDP1
         AOL2mghYue5K0J3vz2gWTV3Y8e8QcTvRXC7TSpD+i0/jb4yMvb+tUwZib5wWCILWsdgM
         qZ74lndI3fFGL0GHZClqelAFaEAY91Wf4xEr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774988359; x=1775593159;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VcN9sER3VoMAwC3I5Sh98SVftLUl9If6/CrHtfP+ol0=;
        b=bnm3NcjvRZdUgfzL4ns0N8csEFyy50zVaStw/AYKHMnE38hiajPg/YyfC7SvsxFO+F
         O5mjnpZzmhGhR0IKlyksYtthFfmW9X8y+W7d/ljJkogiYFFQtk+8memMpEE0WGXt899z
         UtcTF9oAxK3d+Dm0K16RleEfqJSv0IlE3KtPS0BjgRlfSHmHKsuoaQZQo3D0ptSqUfno
         6FzQvV6d3EwKrDihy7XK5xqNi/Pu//yIHYbYpyK1iIb6lWB+vxsHEi0HEH9C9JIcg6TT
         Otf7jJM492cpOhwJLpUGHvQNlw5SRi5U8lu+S7jde6F/CRPsOqoFA0UvglYLY+64Aoki
         ectQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxnYHlIe/HgsiT6BKz9ltro+6hfe+hKagxgz1uzQrzNLYk+o8uitavULkjhJd08wAU0bBD@lists.linux.dev
X-Gm-Message-State: AOJu0YzHNVMiFa409L2PjwrNUQaHvQPwT+AS0Vacm4GxpHJg7x9hSzae
	DTwGKBF9gEnpQMvX1NymT/JdPDp3A+GRcNUHP3PDk0DP5rXSazdsJv2VboMn3GNSj44fA0q08Q1
	PIduzSW6GpQ==
X-Gm-Gg: ATEYQzzN+8bsetl5MqI4t65/uWCi/r1JzV2vVQcQSTMBRtcBEhCHFWDZb1IAqxT/AUC
	IPGwY5L1F1Bv9Kxpgl/jtrCNirE5Lxu+wV48lzcxnqJzrfYZBekCIrycUigauwZQFw/67SgGpUe
	IRZE290s5SULBs3ixxoutmueW/t/lEwaWrh8xUn+AzAjYbtdSgfsvEax7WKuNu16ZXI+o1cXk1K
	n7Mp2UsLGD7gOwvHX/Z+eKJ0Eeia9zkP6/Xa+kOCDM9MI/Y0nCZvczhkMLvqMxorYOWXazDAGue
	AYlCpUkR2ObTaNc8dKEM5SqakUpBc+Or2QpPwsPS4Rykaz9XbOMT579CIbLbPFY9aR/fdzP2Tu1
	+KulTb2nTRnsIx1pmgZprz7SPBkZ2e+rsvAsRFciZOnoKWbQHYjahP9tVtYBCP2ts/9hNnDqc2V
	ejxZByeea6fCouFjuNO3Q/nFcnU4XJuJpJUTO+RYsQOXuG67xkLcWY8S6SiC9OmKIvXPf7Fv/V
X-Received: by 2002:a17:907:e112:b0:b98:36cd:7e11 with SMTP id a640c23a62f3a-b9c13cbc953mr47645566b.45.1774988358506;
        Tue, 31 Mar 2026 13:19:18 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae25b08sm437641166b.7.2026.03.31.13.19.18
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 13:19:18 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b9358bc9c50so833528166b.1
        for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 13:19:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXOe5U9r5rVGmzyw7WMf61OXAplND6Dzu1nsolJH/Ze531iCGNMrzfNx5euDC1m9g8S6OMO@lists.linux.dev
X-Received: by 2002:a05:6402:210f:b0:66b:a9bf:41 with SMTP id
 4fb4d7f45d1cf-66db9efda06mr583269a12.27.1774987898160; Tue, 31 Mar 2026
 13:11:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-5-kees@kernel.org>
 <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com> <202603311253.95C54588E@keescook>
In-Reply-To: <202603311253.95C54588E@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 31 Mar 2026 13:11:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjSOGaausLeTD13yAqso7qM09EnkDFiN7wF15kH0VWmZQ@mail.gmail.com>
X-Gm-Features: AQROBzCgLuTpLW2yBmTolIYlFODjWyPAxSyS-qNDPcZnOIgx-hYNdl2uT2sLn6M
Message-ID: <CAHk-=wjSOGaausLeTD13yAqso7qM09EnkDFiN7wF15kH0VWmZQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] types: Add standard __ob_trap and __ob_wrap scalar types
To: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Justin Stitt <justinstitt@google.com>, 
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

On Tue, 31 Mar 2026 at 13:03, Kees Cook <kees@kernel.org> wrote:
>
> Mark Rutland had strong reservations about function-level annotations,
> but I wonder if the combination of new type _and_ function-level
> annotation could get us something near what would be palatable:

Yes, if we had some way to specify the label, that actually looks
really nice to me.

So with _this_ kind of interface, all my reservations about it go away.

And as long as the compiler actually requires that label to exist when
trapping arithmetic is done, I don't think people will use it without
having fixups.

> Or we could make the label a global part of the language itself so it
> wouldn't need to be a function annotation, but rather a _required_
> element of any function that uses a trapping type?

Yes, I'd be ok with that too, because I think in practice you
typically only ever have one, and I guess you could use local labels -
or multiple functions - if you really needed to have different
targets.

We have a few years of experience with "unsafe_get_user()" and
friends, and a few hundred places that use it, and while it's common
to have several cases in one function, I can't think of a single case
where we actually had more than one error target.

I tried a quick grep, and nothing jumped out at me.

(And a lot of them use "Efault" or "efault" as the target name, so it
probably would have been fine with a default name)

            Linus
