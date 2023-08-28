Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CED134D3
	for <llvm@lists.linux.dev>; Mon, 28 Aug 2023 17:30:21 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-44d5696fad1so850365137.1
        for <llvm@lists.linux.dev>; Mon, 28 Aug 2023 10:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693243820; x=1693848620;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2WXMkuXavCrvB5E1bSmvUXIa9Xz7X0iJQJfaZFxRihk=;
        b=C8lvsFNOYMem0PLD28/tzEAE2qEIzHidIey+CQoeI/aBZ0YTVeFVWYombQUGViO2+t
         W+80eJyqOHVAhZryw0bNoYX3j/u3RqY/2VyNLWozWheCAXYLfsy/KIYqgCFnx1sFctD0
         p2186BC1f9D4So9WK6jNJQGqgNlb7+Lja2enTtdMHhCtoNj2eUKz2kLeO5be6yyyL+lF
         RdVmYG4sDir0f1W8QK+9BrR5dPRK+3o0W+LIVIpDg8HDpY+UqWCIMMxE45JqAlv43aCH
         +6F0q9p4NMRxZRB4hzh9Oe+sr5oOX9C5kkiVwlU2BIH1WtM4s3T9DgcxAVgrZzlRWRZT
         FmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693243820; x=1693848620;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2WXMkuXavCrvB5E1bSmvUXIa9Xz7X0iJQJfaZFxRihk=;
        b=FGrzXECychsfhsSmcdiz6EUGGB5jQ1RY5LCZlopiCCkP1cnH2eXfkppDG/Qh46e32K
         ei2AJvrZye+E7icX6g40gz9cU/y8MZyCCc2gTDzoYVM5pv2uCh8rp2yKMSReHh+ukRpd
         d2vDthYN5pG4qzKEk5xakLn1fzMOStKrLqCGME8h1amXVVB1IJ9nStBxM9RUK2zejouu
         0PgAhGk4yMmRF4t6a5o/IeCWV3yq9bCQmxOE87dBrKOsOX5dHLCHy5cOAbdoXVI0OJcf
         gvd3irJAry0FUmCb+jsukckNzfK+tKAJDrGvIYbZOoS1BSUz+C6gyuCgHi6jN+z3AlQe
         s1eA==
X-Gm-Message-State: AOJu0YzA5o7aVvmJhVHxisV5fO1Zhgc17vMUerh7oactlczLDassL0ci
	3p+gD4PinXRJEAdblaLdkdQRJ/n50jhfhKPmVHhD7w==
X-Google-Smtp-Source: AGHT+IGgcJ/msAlUq9iW+kDjKzwJiwE02t53bR7UOEBKquUn9g7lTmqYj/TpdAvPJIlxRJNe5bMBS4W5kuKO4v5LwKk=
X-Received: by 2002:a67:f8d5:0:b0:44e:9a71:27a1 with SMTP id
 c21-20020a67f8d5000000b0044e9a7127a1mr7609225vsp.17.1693243820627; Mon, 28
 Aug 2023 10:30:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYscGFiG1TVLyfETVu3NV5BAe8sCOXRGDnky-w31aB6yVQ@mail.gmail.com>
 <2023082853-ladylike-clanking-3dbb@gregkh>
In-Reply-To: <2023082853-ladylike-clanking-3dbb@gregkh>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 28 Aug 2023 23:00:08 +0530
Message-ID: <CA+G9fYtS-Pe0L9PsjTdEjnysuX9Ax+04jgZSkJAFqsGHC1Xm=w@mail.gmail.com>
Subject: Re: clang: net: qed_main.c:1227:3: error: 'snprintf' will always be
 truncated; specified size is 16, but format string expands to at least 18 [-Werror,-Wfortify-source]
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: clang-built-linux <llvm@lists.linux.dev>, linux-stable <stable@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Netdev <netdev@vger.kernel.org>, 
	David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Sasha Levin <sashal@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Aug 2023 at 20:22, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Aug 28, 2023 at 05:57:38PM +0530, Naresh Kamboju wrote:
> > [My two cents]
> >
> > stable-rc linux-6.1.y and linux-6.4.y x86 clang-nightly builds fail with
> > following warnings / errors.
> >
> > Build errors:
> > --------------
> > drivers/net/ethernet/qlogic/qed/qed_main.c:1227:3: error: 'snprintf'
> > will always be truncated; specified size is 16, but format string
> > expands to at least 18 [-Werror,-Wfortify-source]
> >  1227 |                 snprintf(name, NAME_SIZE, "slowpath-%02x:%02x.%02x",
> >       |                 ^
> > 1 error generated.
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> Is this also an issue in 6.5?

I see it on 6.5, Linux next-20230828 tag, stable 6.4 and 6.1.

- Naresh
