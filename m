Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4B21C6AE
	for <llvm@lists.linux.dev>; Fri,  3 Nov 2023 16:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IPaDe4xU"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40859dee28cso17011805e9.0
        for <llvm@lists.linux.dev>; Fri, 03 Nov 2023 09:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699030648; x=1699635448; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0lIsbDHPwaa1oft7g9fsOhHYzHACUbAbiF4uUBUfwbY=;
        b=IPaDe4xU4EewBesirFcS5SeWg4Muil0a5KFwsnsehpgQ62F9jmRQ6E9wwfsjof8qbq
         PbPZ/gakvUrevHxK2UTeCVXQ3oZWZtF9MM3T3PYAghffP/8biE0cNPWb+M9nNajaTCNA
         k0Pk+5bohybzulY332KpEazyYdlg7gRX+iSQB4/4rTogog5wxeKi37GSkbsAv2SuZZRZ
         QR+SsYGulyiSyS0XB8soJ0Vp5Xeuai2+aXGyBCX+0Oof/IJbwgAua1ikQJR94u4oDA1o
         zhkZcJ8M41ltzABUkNGr+uHtchlbX+ZslxA1x2Rtqb8IobYffIEg+nyQob5q3E650n3f
         1hKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699030648; x=1699635448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0lIsbDHPwaa1oft7g9fsOhHYzHACUbAbiF4uUBUfwbY=;
        b=N/bKD8FWkAp98+oBmWT2doNsra1puP3ZCSjg8YJ9SXGGEw4ucRRNfl90pLpX/e5PQO
         1MEFeAMPH41c3Rsn09fVwSODayY7KUrG/oV9GxmI753hFOAx1IJ+1Ets7x2YnoLQ39c8
         05vWqs6geDzzLC7XdVO/Pyp8bWa3OuYJbgTH5SScpB9FlGmEc8Nk5DdfWbMkLKIKvPDI
         ykFZ4CaD7e9lClLor/sboROfp2DrkbZ1F+fACA9sgOMtTj2vYhopQaMMyl00QDHvcWz6
         XLGwFtlg/3B+BEndS66gi8K3l49ljKGjJfhBaNP5pJKRD8KsfazeR8wNwfBmPnYapFL0
         SylQ==
X-Gm-Message-State: AOJu0YxDmH2o7SJYeeE4EgmCBSe0Onlaz4aPkqyNpxg8pzkJhEsvkF1+
	a618/TuFfanaFpBst6M3J1a+KGCg5EOTPVIcPL9k4w==
X-Google-Smtp-Source: AGHT+IHsyB2RMiwtGQtmp5D41evpEcLf0w+GRDtt6AMs5gXHG7mDc80QXHpPVY9wrU1VMaW7Ifo9PRPl2ELGlTdes+M=
X-Received: by 2002:a05:6000:12c5:b0:32d:9755:44f1 with SMTP id
 l5-20020a05600012c500b0032d975544f1mr17649157wrx.32.1699030648342; Fri, 03
 Nov 2023 09:57:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231031-tcp-ao-fix-label-in-compound-statement-warning-v1-1-c9731d115f17@kernel.org>
 <ZUStrQCqBjBBB6dc@infradead.org>
In-Reply-To: <ZUStrQCqBjBBB6dc@infradead.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 3 Nov 2023 09:57:17 -0700
Message-ID: <CAKwvOd=voKM+kPWa=toFfWDvq2gOw7Q0yyjq7ragxmPS7U5HBQ@mail.gmail.com>
Subject: Re: [PATCH net] tcp: Fix -Wc23-extensions in tcp_options_write()
To: Christoph Hellwig <hch@infradead.org>
Cc: Nathan Chancellor <nathan@kernel.org>, edumazet@google.com, davem@davemloft.net, 
	dsahern@kernel.org, kuba@kernel.org, pabeni@redhat.com, trix@redhat.com, 
	0x7f454c46@gmail.com, fruggeri@arista.com, noureddine@arista.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	patches@lists.linux.dev, Thorsten Leemhuis <regressions@leemhuis.info>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 3, 2023 at 1:22=E2=80=AFAM Christoph Hellwig <hch@infradead.org=
> wrote:
>
> On Tue, Oct 31, 2023 at 01:23:35PM -0700, Nathan Chancellor wrote:
> > Clang warns (or errors with CONFIG_WERROR=3Dy) when CONFIG_TCP_AO is se=
t:
> >
> >   net/ipv4/tcp_output.c:663:2: error: label at end of compound statemen=
t is a C23 extension [-Werror,-Wc23-extensions]
> >     663 |         }
> >         |         ^
> >   1 error generated.
> >
> > On earlier releases (such as clang-11, the current minimum supported
> > version for building the kernel) that do not support C23, this was a
> > hard error unconditionally:
> >
> >   net/ipv4/tcp_output.c:663:2: error: expected statement
> >           }
> >           ^
> >   1 error generated.
> >
> > Add a semicolon after the label to create an empty statement, which
> > resolves the warning or error for all compilers.
>
> Can you please just split the A0 handlig into a separate helper, which
> shuld make the whole thing a lot cleaner?

Just a note; mainline is currently red over this for us since
1e03d32bea8e spent all of ~3 days in linux-next before getting merged
into mainline.

Whatever the fix is, it would be great to get it into mainline ASAP.

--=20
Thanks,
~Nick Desaulniers
