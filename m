Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E506D425CC1
	for <llvm@lists.linux.dev>; Tue, 20 Jan 2026 18:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768932706; cv=pass; b=nR+d84Yt7pNXab0iIdO813NYxtMOi93EE9rAUn8muWMVLDXXcwVZQ3G0+pEZkmFdnOhdZ8nB4XWqXshYMP5MyYuehqahbmgrhZgzoKTpmZ/rExdGtmU0TwIbpSoyxnO2m4qP2ER9fxaz062hTi1ZCbM1Lwtp4vyM56xF1QyE3D4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768932706; c=relaxed/simple;
	bh=6uJ8uXj14S0D0ONW/lrmUGGFAUg1zVWxSuh2ypdbbKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e21tqFmR/Ys27VDk1UzVSR/m641n3ObZJopdv2f5d+7Qg43fmR6ZZ9xxHBNueGAU5MWfUDK4vaby+odFnQH4zJw4nPeeu/qBEk9KkkMbiQBkRDgeoXlTiHf2AmMO27n8ZwClWemp/1pVxV5WtLMW/LqZUCQN7VtfVRovaqjiJSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sJovEVPH; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sJovEVPH"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b87693c981fso945686166b.1
        for <llvm@lists.linux.dev>; Tue, 20 Jan 2026 10:11:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768932701; cv=none;
        d=google.com; s=arc-20240605;
        b=i9YJH1+pKer6G7bxUUL+Mi15gPjgvotBsgq/YZXgangrTERWQXToYzGj8HA0IHi2ja
         vkFdCvxzB9/dLRFZp+xYcGmXKGydcSM5cN8xyqWYr3CNCyXPFWLrwkALzkays4GnwE/0
         WoJMuQDu+apOxmaV5zKAahJ0rjccMkbEzjNBiyUuXo8IAzdhZh/QU4Z4fqnMgauTUl/j
         /mRi4VltpA/RR10vzV5Q35GKPJP2U3KyJvH5VG/cywztN6snPP53LbVu2mLPT/nams9M
         9A0hp5sl7su2xj+5QDE85i+sjvlH4pQ4hD9CDnDASUW/u1N5PbN5sqGiyHPP81cflCF5
         LN8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6HNUo8PrhXo91SkMVhjYZd+vwGPnd7oySasSZ/9ylOM=;
        fh=tjiObY0fG0XyDmJPS21WCVO3KdRJaalJoKwG2TTOm5c=;
        b=PndjwiUYZFQIGVnYn9YvFMGDA56zsepvcOAWsPmRAGHFyVrUuikSMxEOewcpIDo4EG
         G9XliISdo9nfquM6SL78gEiyppFruAK03QR1Zp0SaTyryaKA8t0/G2FNPhbJvuSPcSSA
         UVNIfKqHtHifDX+S8w1M3m0OSZ2NTsAmg7xoCCSY0pbJrkkcP2uY87qWq9wr4ProgwuA
         Qsnqy5Ni4wC2DhuAKlZU44qog4xDduhO04th8+217GkVdENjnPfZC3/sleNKqSPtlR4u
         mZw0nIuVrfUJN2UT6T14pZsFO+L3qqYfzVgaVXABE/1Ib5d3gwYQlsQDyB9b/WF2T0kU
         MCOA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768932701; x=1769537501; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6HNUo8PrhXo91SkMVhjYZd+vwGPnd7oySasSZ/9ylOM=;
        b=sJovEVPHIbnni9j7u9B6WPQieVt4dQSIy9Qjno9/ExPkNw5B8TtDEPK57WbMxcJ7pY
         sTUecGaVGbMKiO1is2Z1TEbiUye4RQCidBZmTU3nSv7f1/KH9Np0noIwRVxwYCKFsJmX
         WoowlxBdOnMkt2iSYCGrGfHs98YUAAczN5yS+JSyyzcsUiGOVs+VbSU47l5YCzdM893y
         ppy46+Wo99p042czoYy74T3/26oEFCOg+s3zV0EaDSrShHPjcKbrqyu+JlAmgSE8Xcun
         EX/zwUYsOMeVdF+Edj0C+dyq6qBB/gnb9ZxVGjGfKblOfVQLhzy403el48za87BlKJCI
         KrZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768932701; x=1769537501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6HNUo8PrhXo91SkMVhjYZd+vwGPnd7oySasSZ/9ylOM=;
        b=Z411PwLtn+wSzq1GrcBq27kQtyK0D6BXMwCySIwuduYKbKntqDz/GirhkGHsg8KuvX
         yEPIZJd8jiskfcVnT715qUrodgFuD64+6khRufzND4xMi94Kr7j2qzL6fFb/vV/YFrQo
         RT/1+kBz3iiTR7iLcZaecbh1nhpQnpOcS7GlW19SOD3K0iRmSBEHyQOvzC4rZyPJMVIO
         2sPn/anaoRa1KtbWegVb5OY5vTXr2bnsqZUFXU3jTe91zWZPA3l3EDUneVbcwT4zUOHf
         3uMHvifr707tmizG1Gf/lcUjwd61youCEtkBIoC2tyyEKLYoeXaH1xcSwc8+F5dksjg8
         vTww==
X-Forwarded-Encrypted: i=1; AJvYcCU+Os8I7eIg29d3J2fdoEJSGPiKtCRrYVZFyMULZiPQpi4eNrt9PFusLDbfv9Y5OIz1HeaJ@lists.linux.dev
X-Gm-Message-State: AOJu0YwuZ39IrIEtRuunapG2ngB8QPjaFcEJfE5Be25qiDs/7Qkn2Uio
	36ikj6qbjoRNDzQTQRm9Z8j6IENwBjtsva9HSIHrqfYdKtQUbZTZSoHUPKXwVgZHpHWF5cz+C8L
	Adcj46GjAhqEZS2eVEhE3fK4TJuH7cuLH/HKR5Og=
X-Gm-Gg: AZuq6aK4T57sReziYLSg/oC9vqF2JvTejWFZVDWgNcsITAzye0JDfIP1LNM8zPkY77/
	J8BDtUSdDANqL+JK0AG93Esd7b/AfC3W3xGQV+RIAP2Wt2Lh6qcr9ywWK9uj/l2Kt50VhuRETkj
	pP3BkX9C/WnM6vrKyjLrTUaQyPo0n17w1WSnkPbcbHQ0N9jebMAziTqs6683JLXPircFej7341s
	BZQPgnhxKPLzlm80hlntqL7uucZ+2XVCRKxD9QMNWX/oBXrBjzlGjCH/AfSFU+vobVaSzWedxME
	ldKic4noe+yiSwjVep++tpVymrqh3lNVuQKRzRHv53lC+iCf7RrPLIHZsP4v8EkteY6Ks03vNpY
	5QRo=
X-Received: by 2002:a17:907:d92:b0:b87:1d30:7ec with SMTP id
 a640c23a62f3a-b8792f7985dmr1331959866b.37.1768932700986; Tue, 20 Jan 2026
 10:11:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260114193716.1740684-1-morbo@google.com> <20260116005838.2419118-1-morbo@google.com>
 <20260116095318.46a149fb@pumpkin>
In-Reply-To: <20260116095318.46a149fb@pumpkin>
From: Bill Wendling <morbo@google.com>
Date: Tue, 20 Jan 2026 10:11:24 -0800
X-Gm-Features: AZwV_Qg0Q8H8gkTfPD29xQRQkPN2S6byR4RDcVQeMnbq12oeSFaTrTP_sX4-TZQ
Message-ID: <CAGG=3QWLn1uRih-F0mVfEjXNjw47Tb=-RWsoqBJUHH=7e_qwPQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] Compiler Attributes: Add __counted_by_ptr macro
To: David Laight <david.laight.linux@gmail.com>
Cc: Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Marc Herbert <Marc.Herbert@linux.intel.com>, 
	Uros Bizjak <ubizjak@gmail.com>, Tejun Heo <tj@kernel.org>, Jeff Xu <jeffxu@chromium.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	John Stultz <jstultz@google.com>, Christian Brauner <brauner@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Brian Gerst <brgerst@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev, 
	Nicolas Schier <nsc@kernel.org>, Tamir Duberstein <tamird@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Naman Jain <namjain@linux.microsoft.com>, Simon Horman <horms@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Douglas Anderson <dianders@chromium.org>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 1:53=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Fri, 16 Jan 2026 00:57:57 +0000
> Bill Wendling <morbo@google.com> wrote:
>
> > Introduce __counted_by_ptr(), which works like __counted_by(), but for
> > pointer struct members.
> >
> > struct foo {
> >       int a, b, c;
> >       char *buffer __counted_by_ptr(bytes);
> >       short nr_bars;
> >       struct bar *bars __counted_by_ptr(nr_bars);
> >       size_t bytes;
> > };
> >
> > Because "counted_by" can only be applied to pointer members in very
> > recent compiler versions, its application ends up needing to be distinc=
t
> > from flexibe array "counted_by" annotations, hence a separate macro.
> ...
> > diff --git a/Makefile b/Makefile
> > index 9d38125263fb..6b029f694bc2 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -952,6 +952,12 @@ KBUILD_CFLAGS    +=3D $(CC_AUTO_VAR_INIT_ZERO_ENAB=
LER)
> >  endif
> >  endif
> >
> > +ifdef CONFIG_CC_IS_CLANG
> > +ifdef CONFIG_CC_HAS_COUNTED_BY_PTR
> > +KBUILD_CFLAGS        +=3D -fexperimental-late-parse-attributes
> > +endif
> > +endif
>
> Will that still be needed for clang 22?
> Looks a bit like a temporary flag to avoid regressions.
> Probably ought to at least have a comment that it won't be needed
> by some future clang version so that it gets tidied up.

I don't believe that there's a timeline for removing this flag, but I
agree that it should go at some point.

-bw
