Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DCD63D
	for <llvm@lists.linux.dev>; Thu,  9 May 2024 00:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715213188; cv=none; b=tra6pU/f39ica3tErQI3u5QmyqrVhV2L2yMyc1QY9i2K3QpvaDg5tSnnD6eoJn1QuiikAeD07EdlymOuJLV8/q1rgqQB7/4qEr9xAO/Lfom0DhSxGqdHH8kLToj5DijtZM6l6X7diLHFdDwV8gnBUZkcNKSw/J+R6gQJvNrY5j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715213188; c=relaxed/simple;
	bh=IDtem1V12nNx0FHh41q9CjFqh2Oa/zkNU2jMr995274=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LIH/2XHPiuzlXXGe4YxevQ9tTj7mU5M28ykYx3Vwjg/ITyfaLfpnm2u8o/opwXAH8Kmi9YelRS6SKR8oL6nI/Pud4JGl6s4VodrSwLC1uLjYe+N5IIE2CdbtPhtQdPPFzJhIQzaNqkM7Qw2H1VaRPf4s1q91Vy8Xtdi2jDp6nrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Uhcvp7mq; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Uhcvp7mq"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-51f0b6b682fso292833e87.1
        for <llvm@lists.linux.dev>; Wed, 08 May 2024 17:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1715213185; x=1715817985; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EqMDZ7IrqUxdNK1BGX9Bv8+FLqyvy2F/S5DRaEwsjkM=;
        b=Uhcvp7mqrYTGnNCnzSjIY3DLyTytaAlTXnRqsYSFtT0UMDxAwOrZFNX7rF2sgd3xVx
         GooNir/uAHUsmwuEayGLyAF3YjWm1M1DC4TAvPnJMKfgGJ6kp7otFQ8dT5G8NcMDJVWp
         1L4bedcqIn+pggzkRAhO2J6o24ykqKxk36tdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715213185; x=1715817985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EqMDZ7IrqUxdNK1BGX9Bv8+FLqyvy2F/S5DRaEwsjkM=;
        b=jqTN9oTu6nzSxm70C0zfiNJVp1UZrm+A8o2A0CePMnX4UEIrCc3VvQd64kduRBHiGR
         DtFQfBfmpF4i9tphBzdvi5FCphSz//JWwGq8rggDEM8zUorAcCnsUqy+aBHe2XgTkTgV
         y/BdY7OCX30iTX5sMJ38QyATjnhUqO+Juxaumjko95/sYNZeNfRQ+ShZg/nxKd2/p1dz
         u2/H9k/a5IariDknv9FopbkW2NptIVHBCQxw3lute3LQoztBX6w8VOeCYgjhAtT8Tg6S
         J9M6tI7hgOr9WiQaUu82IDI09VivDR9clbpetwtUryKNK0I8JeFNqg/12pYQjeHPoK82
         fxTA==
X-Forwarded-Encrypted: i=1; AJvYcCUFPjOFqP2b8zgdC0bfHVXAMYW+yt3O43Q+UyU/yTOCxBeNgSFXhuxwAa+M7iDkbqKp5CruiNMA82U4ERcMRVzWWUkDQA==
X-Gm-Message-State: AOJu0YzjffkzG8w7vNi7QyEgG3NPd52bYX5xcLnhSjlu1lKXoB1XioCb
	iWdKAnmKdVZQbLYTvZwOoLHQmRR0A7Omidlq/dBeimFcHcH75UWkWjTLKuC6wUrkFEckcxXtgNY
	h4i0+BA==
X-Google-Smtp-Source: AGHT+IHrZU9tqgGVQlI6itVwrWhu8rfq9jOYw8uTaD8PUkibxm9gojKdsFAJe2DPP3aP4EWOxUHhBQ==
X-Received: by 2002:a19:551a:0:b0:51c:dc6:a1ce with SMTP id 2adb3069b0e04-5217c372c30mr3098988e87.7.1715213185001;
        Wed, 08 May 2024 17:06:25 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733c2c7dbasm106443a12.70.2024.05.08.17.06.24
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 May 2024 17:06:24 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a5a1054cf61so66844566b.1
        for <llvm@lists.linux.dev>; Wed, 08 May 2024 17:06:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXuobzX3Xj/7jCSUUy1ccraTTaJ11OUYMhb59KOQxdajooey7L13Z/r3ilTD4e6Jutldnu/oQ06H1tZZtwUrKqnpJvxLQ==
X-Received: by 2002:a17:906:57c1:b0:a59:ea34:fe0d with SMTP id
 a640c23a62f3a-a59fb9c675emr342484566b.47.1715213183807; Wed, 08 May 2024
 17:06:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202404291502.612E0A10@keescook> <CAHk-=wi5YPwWA8f5RAf_Hi8iL0NhGJeL6MN6UFWwRMY8L6UDvQ@mail.gmail.com>
 <202405081144.D5FCC44A@keescook> <CAHk-=wjeiGb1UxCy6Q8aif50C=wWDX9Pgp+WbZYrO72+B1f_QA@mail.gmail.com>
 <202405081354.B0A8194B3C@keescook> <CAHk-=wgoE5EkH+sQwi4KhRhCZizUxwZAnC=+9RbZcw7g6016LQ@mail.gmail.com>
In-Reply-To: <CAHk-=wgoE5EkH+sQwi4KhRhCZizUxwZAnC=+9RbZcw7g6016LQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 8 May 2024 17:06:07 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgLaDBSP9MXCHc8heA7-rVNGh9yZDG_y4=87KOx_N0cRg@mail.gmail.com>
Message-ID: <CAHk-=wgLaDBSP9MXCHc8heA7-rVNGh9yZDG_y4=87KOx_N0cRg@mail.gmail.com>
Subject: Re: [RFC] Mitigating unexpected arithmetic overflow
To: Kees Cook <keescook@chromium.org>
Cc: Justin Stitt <justinstitt@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 May 2024 at 16:47, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> But again, maybe it would be worth looking into, at least for some
> limited cases. To go back to your particular example, it might be
> worth trying to limit it for unusual type sizes like implicit casts to
> 'u16' or bitfields: not because those type sizes are magical, but
> because it might be a way to limit the pain.

I think it would be interesting in general to have some kind of
warning for "implicit cast drops bits".

I fear that we'd have an enormous about of them, and maybe they'd be
unsolvable without making the code *much* uglier (and sometimes the
fix might be to add an explicit cast to document intentionally dropped
bits, but explicit casts have their own issues).

So that's why I feel like it might be interesting to see if limiting
such checks to only "unusual" types might give us a manageable list of
worrisome places.

I think it *would* have flagged the perf u16 overflow case. Again: I
don't think that was actually ever overflow or wrap-around in the
arithmetic sense, and it was purely a "assignment to smaller field
truncated bits" issue.

Which again is most definitely not undefined behavior, but I would not
be at all surprised if it was a much more common issue than actual
arithmetic overflow is.

               Linus
