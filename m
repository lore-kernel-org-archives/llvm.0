Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795560304;
	b=ssxPlFTg6d7LSiznq10MmiN9bUOtwRevPla8g/OFiRCMBYYjseTlKDo9Yp68EJMtRech
	 OjHlg53zRwQF9ltrGxRK9UOaBOU6xMGJyHqVEqxtWaSep0dtnqz5C4HLDt9MBCjFmhz0a
	 HyXO6hRt7VogCM9mKgVteEVtlaEm/u2kmyDOMkGhERMnJPXWGCp/rCrTAVIjT7VNscgEQ
	 KQYdYWGyT2NFpm5FSkmLnf466GsDw1+spWJM9D6X3KKM2zHs5sea+m8flO5So/vn7KlIP
	 XVaOa8y0cUJ6ia1gO5PTnE8lTcyqWVM9eyOYKsxjEL6ngwWHXJnYjNCoGPzwN5l+C8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560304;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LKPzb2+W5dLdTUHlVB713c/iH+Eklo173lHqi2t1XUI=;
	b=OMvBMFafN/9mVFB2uEETc5Mjk8c6fWGyIDudpoMIo62KWmh7WBG5/rf8tWzHkrUpIAD6
	 nurmN+FanqhV2z6WpVzaKt8pePxFDqFRnqBBksptPR7/pj9zJY0weSuC4qWRKlaEKgBLD
	 viRQzTPZlb05nrmniewcPGYsQ+vtlXIT/8NEfS8QollhYzoOH2tD3o/OcIvUOmN/SHaOC
	 KNnEwoM/ikZwS9NENJLBle5ANd1MB4gs2Ork3iVB9h06slFZ4Q6g+PJ7E26ULdvhWU+1X
	 Xao15nhSaQuYtB5rNMVvRNFwOgGy8m890vSiL6Gejydc8cozhTlxJKQpDoTV8B3Cm4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MZk9ZQEy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AE8606A32A
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 22:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1AE8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MZk9ZQEy
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so44226025e9.1
        for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 14:45:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795560302; cv=none;
        d=google.com; s=arc-20260327;
        b=ZcMAlTNXtTFY/keBR7wldSM0WXFE1SgHQx3LeaOSyINMCCYTjgTuPNfmPkLq4/OmzS
         1YNZyR3pqyNVhKoZniwnvWomv6asVfZHFlTS+RmLd3hpmY1htK8auahpDBZGrNDUfv9j
         riBx+EF5lWxM/knUs2OtphSUUkno5O88xIJegf/+OZoNMtQa6UYHE7vi1yyx0710nS+H
         3nG1WT9XAYHKBbyvY9ig2dWs1H39e9XxeiE4hUMrZGdQ/bTE6kwJntdiFn/vBj+nvas1
         wckIWXN6vUvZUbopnt/TiQNRQh+85A3UUPfQfa9gMqvTbhMTQFS8tErWAd8Ln0hYWZyC
         kNVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LKPzb2+W5dLdTUHlVB713c/iH+Eklo173lHqi2t1XUI=;
        fh=s4sUNO9qlPltmrPtHv4NnfbgiEDYFAvFCuI2+h1WN2g=;
        b=ED6pQvC8FpNR0f3tS2ML1rfHhEvqOHM3LR96WmaKYaVldKCR8JpiZ03Z7mIPGGMzgg
         JF6ur6ResVzB7HOFw3zCfInci+Bi1bAOJjC0BuSEEjZvvlntsKmndXCQvNAaq38p2oz5
         TDk182Z8Xh0gqJRPjSajiiehT9RHVtx1KbdbxigwTslcXjC7pwBTAgU88erMRORPlEeH
         8N/lCk2ka7FxCqYlDhhGvyfhHG0iZVhOVIWZDP25ZWyVBLZT2LSiRmVgUhEAoz6TEp9b
         Z+NFQ9yNTDq2AWvo1zyKXNH5Sm6aWkIj6SjlmtxHwkajm9OqlxiQbvykWjOSbAeyf09b
         yVZA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795560302; x=1796165102; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LKPzb2+W5dLdTUHlVB713c/iH+Eklo173lHqi2t1XUI=;
        b=MZk9ZQEyUygAEL8nY/IwhqvhDwHdm+32tgUc0Q6XruzvHkxgspAB3oDoGBv2IG5xzh
         e3a6DQZz5bqzaj8oTm6qt08G1GM75z8Vv7hLjUDnzh2UibRM/3CuMnUnYqax5LXoT9bv
         /6UY51SC8HAN8PWv00uRyeEUlt3nzhlW+XvfE7DtuGeoBbupu5GdmDx69miS5cQoDNuH
         xjw1OrvQD71+grXBfvkUEoYQwjcTF9tm8BTUHntQjL5Qkp6eVC8PPc4R/vQEwKomKBtF
         3jSznFrCpdms2c3kr/clueSFPErDdqYsC2sEgXClU3mjI9PUqiK019KPUXAGrzxksNed
         VD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560302; x=1796165102;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LKPzb2+W5dLdTUHlVB713c/iH+Eklo173lHqi2t1XUI=;
        b=KUj3e65Nq4zG/Oi5tWzvbAjcH3KsOnmoqBYDFvnjpYaTfSMR7JsWqyeG5zUPT+d+js
         WT0nd4qGhKXRVNNqfbgZdU5nUZ97Ja/FINZ5EjfGntJEYZbydVNKME/Zk9bSCrKQZ7AU
         mF6l8DsWWS+IKi3CQYmWKRrZ4Ey+CN2nXB7tyGbZRF/g1nBt2cRxmth4BSLOBtscwj9y
         LjlMhCju8/0gJ1BUJq33O2VBJ86N9YtwBeNXflBEjAbruRIxpg8eiCIXr8Bsq70QxPzA
         SOgpLWEgbQ2uyKYidZ9xlzPOz+gSyQRWjs4Xa3BNZFy+p7kXKx+RPJQ3tzsUDWEzxtSF
         1Dfg==
X-Forwarded-Encrypted: i=1; AL+hErEo3Xu6bgC3gVrSZIx8XHUER8iFZvfYdzcqR6PkWoJmmPmzbKZyY0Kdj5wM2uMd0z8FYbj3@lists.linux.dev
X-Gm-Message-State: APuU4Z9R3zK7HZTGAzuscFn7+WCZbPTNqQraIq9PnH9hlX0LFsP8e7Cg
	52oRIgXNrBFnHD9wlAcrvxBiJ02Dmex3MBZR2SdZepbmDBrkoUgt8FWB8ueVVy42+4yekO4U1bv
	fKwE3VhNgZ/3VzpxQaJRAN6pPUHFi5UqdKC+d43I8
X-Gm-Gg: AZFdTZceRgWjRXL1h4zrI8a9/IiPpKN8qNJN2YJxe7vj7LKuLbcH8hyzEnkECWmNMub
	4fGdnf/b0J8kzT3g0wBTBcOh9/EtViPIi9R4iiIRHD89nlSbrm4LnZHADsgrbD/f0u/yCeQVUdf
	r5ebPb4TpronA1nRr5PxXHE0TSnBHLncZlakKp0k1It+Xq2NbytZBVzhv1V57BROB18SLk86BN/
	4TC2KTPuqNFEDtauFo7HyIddeYVxn0monerjbFmslOE0OYHbkzwIUBbgDKJbyRCarRwB7gfFzKs
	+w6pnaPOoSR6ZZQG1dRiqbya3nsjb6VCJ7gawp05qRwDhRUPob4JDmSzdZaJh9ydU+dpyzakhjR
	uSUe53tO/WrAlXa2HKS3lul/f7PQo3TTUBFMH3Qh3Cld27N2oPglVrkYtYJxQ5r2ig0gbtqik2F
	M3ad2yhEmRHRJy9ejhEAztc8jVxpfXubT1ZVKo2mzSXdjfFAXUUn0bwjCSTeqZpZgsVRYu3mAQd
	i6qMco76741pRzy1PPIz2IjcgF1NsEJuLLanQ==
X-Received: by 2002:a05:600c:4e0d:b0:4bb:5f07:10d7 with SMTP id
 5b1f17b1804b1-4bb8882445cmr316029555e9.26.1795560301449; Tue, 24 Nov 2026
 14:45:01 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261122105646.2223131-2-ardb+git@google.com> <CAKwvOdkOjGkGajGMKtqcHpRSrpXC9UZrH9XPsiv5Rpcdte5tJQ@mail.gmail.com>
 <73d50ff0-36db-4dcc-ad1e-c34bf3ebbce6@app.fastmail.com> <CAKwvOdnh-0nOBdU=J+R-yDE7wrP_K2BZ7mY1icrL-nOQ3Bk=og@mail.gmail.com>
 <20261124163905.tkkaLhJ2@linutronix.de> <CAKwvOd=KbZgizb1VhD-zq4S1jRGCxUaLM+VHeRNhTFQf+KMrRQ@mail.gmail.com>
 <1d4d7a84-d0b8-4b81-adb5-4fcecd1e19a1@app.fastmail.com>
In-Reply-To: <1d4d7a84-d0b8-4b81-adb5-4fcecd1e19a1@app.fastmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 24 Nov 2026 14:44:49 -0800
X-Gm-Features: Aa3M54rC89z0KOBeXpPiIj8H9mJc9hPSjUEBQDdtYvMjKRBIGlH9HWNTTpZ8tA0
Message-ID: <CAKwvOdn=FjiYgiB9wdut2=2FwivPUXiNOG2F=uOeEkycrtoVUw@mail.gmail.com>
Subject: Re: [PATCH] locking/local_lock: Don't evaluate the per-CPU lock
 pointer if unused
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Bill Wendling <morbo@google.com>, 
	Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 2:25=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
>
>
>
> On Tue, 24 Nov 2026, at 20:32, Nick Desaulniers wrote:
> > On Tue, Nov 24, 2026 at 8:39=E2=80=AFAM Sebastian Andrzej Siewior
> > <bigeasy@linutronix.de> wrote:
> >>
> >> On 2026-11-23 13:52:09 [-0800], Nick Desaulniers wrote:
> >> > On Mon, Nov 23, 2026 at 1:23=E2=80=AFPM Ard Biesheuvel <ardb@kernel.=
org> wrote:
> >> > >
> >> > >
> >> +/*
> >> + * Only evaluate @lock if it is actually used, i.e., for local_tryloc=
k_t, or
> >> + * when lock debugging is enabled (see local_lock_acquire() above).
> >> + */
> >>  #define __local_lock_acquire(lock)                                   =
  \
> >>         do {                                                          =
  \
> >> -               local_trylock_t *__tl;                                =
  \
> >> -               local_lock_t *__l;                                    =
  \
> >> -                                                                     =
  \
> >> -               __l =3D (local_lock_t *)(lock);                       =
    \
> >> -               __tl =3D (local_trylock_t *)__l;                      =
    \
> >>                 _Generic((lock),                                      =
  \
> >>                         local_trylock_t *: ({                         =
  \
> >> +                               local_trylock_t *__tl =3D (local_trylo=
ck_t *)(lock); \
> >> +                                                                     =
  \
> >
> > Why do we need the temporary?
> >
>
> Because 'lock' is a macro argument that we should evaluate only once.

Ah, right!  Don't we have __auto_type or something for that though?
Maybe cleaner than the cast? Ah, that also doesn't work for the same
reason as below.

>
> >>                                 lockdep_assert(__tl->acquired =3D=3D 0=
);    \
> >>                                 WRITE_ONCE(__tl->acquired, 1);        =
  \
> >> +                               local_lock_acquire((local_lock_t *)__t=
l); \
> >>                         }),                                           =
  \
> >> -                       local_lock_t *: (void)0);                     =
  \
> >> -               local_lock_acquire(__l);                              =
  \
> >> +                       local_lock_t *: ({                            =
  \
> >> +                               local_lock_acquire((local_lock_t *)(lo=
ck)); \
> >
> > Is this cast necessary?
> >
>
> Surprisingly, yes.
>
> https://godbolt.org/z/E8rGchfev

What the f...

Anyways, with the additional context (git trailers) linking to the
clang bugs (and missed optimizations):

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
--=20
Thanks,
~Nick Desaulniers
