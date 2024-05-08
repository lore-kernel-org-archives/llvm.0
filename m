Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A64412F383
	for <llvm@lists.linux.dev>; Wed,  8 May 2024 20:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715198880; cv=none; b=etd5PbmolS5ev043+rHlsg1XYYPAk7cP62gBIYw1AxC8zQJcud9AhLCfDVkSaz2bqCO7uZL9B0qo6Pqmq85E1WK6+8UpJgUFFwauoGURWvQ7mHavnzQ2Jz3u8h9s4VoDPVb6x9vvw1r1D6TLxPm8j8PZnrYzzXp6rzbcZ5SjeFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715198880; c=relaxed/simple;
	bh=cUhMA3hEDpUsxR6hzz85ZAu88LnRo8wpM9SADaguZmM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=soI23/AvyxqfU0EGA9ZSO1vJWkTXYESL7WnIOosPsUJO0Oxz/gLxtO/koPs+5URxRuQAgFBVJfFR8TL1U0dQEXxQTZapMTpJGcJ3qETQgVO0bfrIi804mmSWowEtYXuf9DiAgRKT51dXWqjdD6R98IoH178LNT9CKbsnrtwGZ7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=L1cHa+hS; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="L1cHa+hS"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a59b49162aeso28148166b.3
        for <llvm@lists.linux.dev>; Wed, 08 May 2024 13:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1715198877; x=1715803677; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KNS3uukLqvQS7T/1QMyWRNid+5RlhH+5kk2j7s9gPHA=;
        b=L1cHa+hS0VtYil2AxnsbOoCs0bcA+0qSWkCXeEC2BetkFULSut4vQF09FVA+kXwmhe
         sXyIZVsJ95H3vbipPVhdWgi+p3Nb+ADPwMSQz+c0E8mM/7Q+Fzlfh6U3Ha605xYd0YvK
         DQgpmzfANMSnkk7UzsyDuh4wU+mcBxbj5pR6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715198877; x=1715803677;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KNS3uukLqvQS7T/1QMyWRNid+5RlhH+5kk2j7s9gPHA=;
        b=MCZjdssYZaJuuXh6vrpbUpLsAF+zDU8h8OAutT552ta+mQUh+xMFGDGnRSMAi2rS8s
         mI+js62Ayl5NJfOSnHW/pN2IL5Su/RPDZijO96wBuwHH0jW0WazCDFnw4rjr2ykvUjo/
         vRJ0ia0PAEqBqGElfGjXzVgMOnOaLq6XsGJ6+VCL6CksdkawoC9UgBDPaw8IB6boI9MW
         +nNsFHGi0U0eh7VhA5EP/Jkv9JeUIPYqxleHdgalDO59m8sGB7pg+/b6lQSvXECRyElx
         iOgVbG7yn4DtxCZokuotIROM/vzEGIr2wjxZuYg1FBhE+HccJ7O+uG4cH0095v/i8wHI
         Yt2g==
X-Forwarded-Encrypted: i=1; AJvYcCUvm8PjuJySv+kbH9lhfohVAv5iAY0Y9ZhCEp3DlRqwfjVtQullijVotp5yx8HvHfmT4vmTGgOLrJlOkJNl8Vdy1NpgEw==
X-Gm-Message-State: AOJu0Yzx0Rr7cjY0vj2Hen2Ijt4Qp5kjzKanPBxPH651ofEg6uO9HfVm
	Hf9ysauHgPUq1KvBQY18M4LnClWfRw+sLfrnxRHybNgazQZYibJz6Jsgi9zuzK3NN4KK2dm+pNl
	vxPazRg==
X-Google-Smtp-Source: AGHT+IFkyIA7U6xr9xgP6KpxaVJIBzCGpg/A51gbtfSyXzejKsB/kTT/mSLgME0dbBy/8XEY5hCQ+w==
X-Received: by 2002:a17:907:11c2:b0:a59:cf38:5338 with SMTP id a640c23a62f3a-a59fb94b5famr230914066b.19.1715198876802;
        Wed, 08 May 2024 13:07:56 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id me16-20020a170906aed000b00a59cb16818csm4318624ejb.100.2024.05.08.13.07.56
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 May 2024 13:07:56 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a59b49162aeso28144166b.3
        for <llvm@lists.linux.dev>; Wed, 08 May 2024 13:07:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWqSWyus014VWWiL6HLJEn04vjeIdmZh2GK408oSomMZ4j4R2Qj/PQbhDvoHsqmJx1+h1HOuuxViKbb5Pf5JzelNFw91A==
X-Received: by 2002:a17:906:74d:b0:a59:bb20:9964 with SMTP id
 a640c23a62f3a-a59fb94b8f0mr259835466b.23.1715198875937; Wed, 08 May 2024
 13:07:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202404291502.612E0A10@keescook> <CAHk-=wi5YPwWA8f5RAf_Hi8iL0NhGJeL6MN6UFWwRMY8L6UDvQ@mail.gmail.com>
 <202405081144.D5FCC44A@keescook>
In-Reply-To: <202405081144.D5FCC44A@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 8 May 2024 13:07:38 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjeiGb1UxCy6Q8aif50C=wWDX9Pgp+WbZYrO72+B1f_QA@mail.gmail.com>
Message-ID: <CAHk-=wjeiGb1UxCy6Q8aif50C=wWDX9Pgp+WbZYrO72+B1f_QA@mail.gmail.com>
Subject: Re: [RFC] Mitigating unexpected arithmetic overflow
To: Kees Cook <keescook@chromium.org>
Cc: Justin Stitt <justinstitt@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 May 2024 at 12:45, Kees Cook <keescook@chromium.org> wrote:
>
> On Wed, May 08, 2024 at 10:52:44AM -0700, Linus Torvalds wrote:
> > Example:
> >
> >    static inline u32 __hash_32_generic(u32 val)
> >    {
> >         return val * GOLDEN_RATIO_32;
> >    }
>
> But what about:
>
> static inline u32 __item_offset(u32 val)
> {
>         return val * ITEM_SIZE_PER_UNIT;
> }

What about it? I'm saying that your tool NEEDS TO BE SMART ENOUGH to
see the "what about".

> All I did was change the names of things and now we have to wonder if
> the result is going to be used for indexing or sizing

Exactly. Your tool needs to take that into account.

Any kind of mindless "this can wrap around" is inexcusable.

It needs to be smarter than that. And yes, that means exactly taking
into account how the result of the possible wrap-around is actually
used.

If it's used as a size or as an array index, it might be a problem.
But if it's used for masking and then a *masked* version is used for
an index, it clearly is NOT a problem.

IOW, exactly the same as "a+b < a". Yes, "a+b" might wrap around, but
if the use is to then compare it with one of the addends, then clearly
such a wrap-around is fine.

A tool that doesn't look at how the result is used, and just blindly
says "wrap-around error" is a tool that I think is actively
detrimental.

And no, the answer is ABSOLUTELY NOT to add cognitive load on kernel
developers by adding yet more random helper types and/or functions.

We already expect a lot of kernel developers. We should not add on to
that burden because of your pet project.

Put another way: I'm putting the onus on YOU to make sure your pet
project is the "Yogi Bear" of pet projects - smarter than the average
bear.

As long as you are approaching this from a "this puts the onus on
others", *YOU* are the problem.

Be the solution, not the problem.

              Linus
