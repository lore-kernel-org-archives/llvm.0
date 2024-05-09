Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B7F29A2
	for <llvm@lists.linux.dev>; Thu,  9 May 2024 00:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715214209; cv=none; b=U4aRfJc80RLTFpOCoynYKGAUWp4KSuY968xOqu4Khx6AyPcAcZ0C+aycPjuH7WFC3hwpNwzm8EHGBON/2H0sdP3nN2cryScfx64aGWhcY2o5p/0jNGekg1qbQ1KJDEdZOXufbZu8tvsV1EWwZ9HiEJwDW7eU3Bk3juOEzSxuMsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715214209; c=relaxed/simple;
	bh=DODW/4URxRbA9DuTjYXWV8p06cnOAPHfE8OhcWBuxFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fah6J19zJlKA5R/Y8qKBTFpiKrQ0o8jM3IlkOgf0w54YTncuYnLgave5GI380fgilHx++a+u9RSl9D07piAL/SWlTBt6J83C0u6jzEfMCEPMmElQBqxQ18S95mk1GanTzLoWeCZWr2oV5TcvpduSmDMl4J8V8DRr7/c/YIe9hE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=cJc6Kkyu; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cJc6Kkyu"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-51f17ac14daso336064e87.1
        for <llvm@lists.linux.dev>; Wed, 08 May 2024 17:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1715214206; x=1715819006; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tUREf8Y8+BNsNPUONsk6UGY92nmezphsmslNvqS96no=;
        b=cJc6KkyuYw/7/jxbpbTI+6OL1Yy7ue6ZN/+DJ07iSKi83DxYtJGArKhek8hR2KcT+p
         Ke7NSs/dIIEAuDehprBbMNPKtSqqPZdihgJc1yYhsSX4qwHu3FAOk0AblP0gukm4E26Q
         TAJztjZqqCp83LZ9J6d+4JSB9tpuCc8bz9+OI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715214206; x=1715819006;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tUREf8Y8+BNsNPUONsk6UGY92nmezphsmslNvqS96no=;
        b=RWbMLDF6lWghP0emP7ydDgIDCEOotaL9pb0NAu0R7WWyATH/j2zYs5WXzE3qX4EHTZ
         w2QVlJjHANaWHlSEuIRWJlPaFEsYQD2/iMhQVulUyOESdqmacqfeHcqL51i0QAfDrOXs
         z+Y0CnI7xrEP/h959fuqcQEyt6oLxbW8nGGyPyiqIkc621cOlJ429CTrbXjE7jc0aePx
         8oSLni3nZhyk/PPVE35+iVKtOu8D7TDfGvJN5jbRGkRyeE5SunjtanPUABOXBuSDcx4N
         +C+VB5Sl6cWZ1U7RF+sODFwXHfc2YN0lliLuTbBiydUMq1odKGDLs0/etl/xbynncv9G
         02Yg==
X-Forwarded-Encrypted: i=1; AJvYcCUQ66x+W2n8nLQchfeH8d2DHKdJJ8h4OR/MaHFq6YJzZbmE8kQmsastWK88duUiUPR8oDXhWQiMl8rK1TWa0N8wAOE35w==
X-Gm-Message-State: AOJu0Yxa+IWUIm5xSMKWR+wkLH/Ud/POwiaGKPK7jYvvG6GHVhx1ctm1
	E0SG74mKUlY+sN8S9ccUAOyj81jdinGkJh+pu0dTUCx49XLlzS63yZy2ikH7VTZtOw4riBdwYbf
	NzyUHoA==
X-Google-Smtp-Source: AGHT+IGVYAX1zeLHKvHNJhXsuxSnlVwUB0WBZGeSnz8uajiRZqy2ZufWDzRz+B96sFuO9YAnJbvHqQ==
X-Received: by 2002:a05:6512:10cc:b0:521:9315:670 with SMTP id 2adb3069b0e04-521931506a7mr2752737e87.9.1715214206096;
        Wed, 08 May 2024 17:23:26 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781c269sm15262366b.38.2024.05.08.17.23.24
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 May 2024 17:23:24 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a59ad344f7dso57367566b.0
        for <llvm@lists.linux.dev>; Wed, 08 May 2024 17:23:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW6BbIloYV7gb7RNzS1nT/r1o8tCsSYNZAC3Sg8mS8c4bHpS6Nh8NjodUlxh3mxcpx5Q5KZMwpgY2PQ71agqaxjCelEkA==
X-Received: by 2002:a17:906:f6cd:b0:a59:a7b7:2b8f with SMTP id
 a640c23a62f3a-a59fb923241mr262394466b.9.1715214204485; Wed, 08 May 2024
 17:23:24 -0700 (PDT)
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
Date: Wed, 8 May 2024 17:23:08 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgf5mpRT_Aiw9aebX_z0i49aUbUBEPr6jk_dUaCTuR6cw@mail.gmail.com>
Message-ID: <CAHk-=wgf5mpRT_Aiw9aebX_z0i49aUbUBEPr6jk_dUaCTuR6cw@mail.gmail.com>
Subject: Re: [RFC] Mitigating unexpected arithmetic overflow
To: Kees Cook <keescook@chromium.org>
Cc: Justin Stitt <justinstitt@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 May 2024 at 16:47, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> So *that* I feel could be something where you can warn without a ton
> of compiler smarts at all. If you see an *implicit* cast to unsigned
> and then the subsequent operations wraps around, it's probably worth
> being a lot more worried about.

Side note on this part: quite often, because of C promotion rules, you
have "int" as an "intermediate" type.

IOW, while I had that example of

        int a;
        ...
        a * sizeof(xyz);

being questionably not-UB (because "int a" gets promoted to unsigned
as part of C integer promotion, and thus you really had a signed value
that was involved in unsigned wrap-around), if you have

        unsigned short a;
        ...
        a * sizeof(xyz);

then technically that 'a' is first promoted to 'int' (because all
arithmetic on types smaller than int get promoted to int), and then it
gets promoted to size_t because the multiply gets done in the bigger
type.

So in one sense that unsigned multiply may actually have involved a
cast from a signed type, but at the same time it's not at all in that
kind of "accidentally not UB" class.

I suspect most compilers would have combined the two levels of
implicit casts into just one, so at no point outside of perhaps some
very intermediate stage will it show as a signed int cast to unsigned,
but I thought I'd mention it anyway. Implicit casts get nasty not just
in assignments, but also in these kinds of situations.

I still suspect the "implicit truncating cast at assignment" is likely
a much more common case of loss of information than actual arithmetic
wrap-around, but clearly the two have commonalities.

              Linus
