Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E46014F6D
	for <llvm@lists.linux.dev>; Tue, 29 Aug 2023 15:39:41 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-44d3cdba3f6so1836259137.2
        for <llvm@lists.linux.dev>; Tue, 29 Aug 2023 08:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693323580; x=1693928380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mnzm799P6Q3j74LZPQjfhcA/lU7vvWbHsfU0R3jlCdA=;
        b=21bL9sgc2nberDTHd8JR2kcJpnJThYAPI+w+wEl/2TE70wClWsQXUKQtxDRy+i0rtP
         XyYc3bYl+wlHw4DhaTvnupahq//RRbeLSvoUnZikhM6PdxUpeC8n36+KN/A5MJBMJcI+
         KyWGLe5XdNSGSw6FUYlq6sxc98Rq3oZwmtbpA5zPxdAxdpDgUinCD2hTw1Ob0+vtu4Bx
         NiQaZhnQGGRUclNw78fljAstc+Hn68o7Phzrc2oa4Bwu5eQqLYz65P+UtBJiGlF1JQLt
         JZ6SGRo/y9dmH6AiWjXD91jGoem9/zBIzFBbV6EO4qGEqcIxAY2KD7TBdXRORtaLnQ0p
         RjRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693323580; x=1693928380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mnzm799P6Q3j74LZPQjfhcA/lU7vvWbHsfU0R3jlCdA=;
        b=G8mA1+kEi8hpCORWbKLBGXTncf33Gv9EC2rrAoeOrwgJJM1hUJQ3dQ2+Qc46pwhin3
         +OOTXOh3bvTU2UUl6P1dPzp0ZauI1waMcW0BCs/Z7893wi2CqRCk4GtCS52o3CZIKaCf
         f7eSNfHo7JkV5+c1vtE0fNwdwo6T4A2DK7n0ADS0+rEeQ7tIlhgUEvzq6FdyzXgAjUEq
         pN3+J1B0mPHiqxQSxFA8+K/5D1ihktWV8vDTWFH0+6Hp+qPs2Xe9/zXAFHa8UgZ6J/XM
         Tsm3SwXh+OkdnWclq3jmpRZyg9TLac9dOHIp9fEhrdbYg1UAW+AaostC0KgucqO/Dew+
         q3kA==
X-Gm-Message-State: AOJu0YyWftJCpuUr1MwpYxptPfZENd3CENLeEynZCfqIXLtbC8zIze1f
	EVqtvZLbV4cprVaCrAB4+TxIu3iAO3uCZ5uy9HO+Sg==
X-Google-Smtp-Source: AGHT+IFgQBf6W91PZLktY29myj7AxhMFsuzp9YBkQzOUK+EHpYkPHFHRJFOWCwRTC6PQXEYtheCVljru3JQYuH8tDTQ=
X-Received: by 2002:a05:6102:358:b0:44e:d85c:ac48 with SMTP id
 e24-20020a056102035800b0044ed85cac48mr3766077vsa.5.1693323580026; Tue, 29 Aug
 2023 08:39:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230828153142.2843753-1-hca@linux.ibm.com> <20230828153142.2843753-2-hca@linux.ibm.com>
 <f0419f6428ad404386ebca813dc1ec03@AcuMS.aculab.com> <ZO0k1Par4i4FBCWF@google.com>
 <20230829074854.7031-A-hca@linux.ibm.com> <51f70b0ad37f469a93242db9cfc6d9e8@AcuMS.aculab.com>
In-Reply-To: <51f70b0ad37f469a93242db9cfc6d9e8@AcuMS.aculab.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 29 Aug 2023 08:39:29 -0700
Message-ID: <CAKwvOdkrCUchQzCT48dReOgxT4xFc5jOtz1YNDAYJp8FqdeHzA@mail.gmail.com>
Subject: Re: [PATCH 1/1] s390/dasd: fix string length handling
To: David Laight <David.Laight@aculab.com>
Cc: Heiko Carstens <hca@linux.ibm.com>, Jens Axboe <axboe@kernel.dk>, 
	Stefan Haberland <sth@linux.ibm.com>, =?UTF-8?B?SmFuIEjDtnBwbmVy?= <hoeppner@linux.ibm.com>, 
	Peter Oberparleiter <oberpar@linux.ibm.com>, 
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 29, 2023 at 1:32=E2=80=AFAM David Laight <David.Laight@aculab.c=
om> wrote:
>
> From: Heiko Carstens
> > Sent: 29 August 2023 08:49
> >
> > On Mon, Aug 28, 2023 at 03:51:00PM -0700, Nick Desaulniers wrote:
> > > On Mon, Aug 28, 2023 at 05:18:37PM +0000, David Laight wrote:
> > > > From: Heiko Carstens
> > > > > Sent: 28 August 2023 16:32
> > > > >         if (strlen(uid.vduit) > 0)
> > > >
> > > > Does the compiler know enough to optimise that brain-dead test?
> > > >
> > >
> > > For the purposes of skipping diagnostics, no; clang performs semantic
> > > analysis BEFORE optimization (which is handled by LLVM). As such, cla=
ng
> > > will produce diagnostics on dead code.
> > >
> > > Partly because LLVM isn't very ergonomic at emitting diagnostics from
> > > the backend, partly because Clang code owner and developers don't wan=
t
> > > clang to emit diagnostics dependent on optimization level.
> > >
> > > I disagree with my compatriots, and you can read more thoughts here:
> > > https://discourse.llvm.org/t/rfc-improving-clangs-middle-and-back-end=
-
> > diagnostics/69261?u=3Dnickdesaulniers
> >
> > Maybe I misunderstand what you write above, however clang (latest+great=
est)
> > does indeed optimize the strlen() away and generates code which only te=
sts
> > if uid.vduit[0] is zero or not.
> >
> > Unlike gcc, which does not optimize this away and which uses the strlen=
()
> > inline assembly provided via string.h...
>
> And, if -ffreestanding is set (as in some kernel builds), the compiler
> can't assume what strlen() does.

Exactly.

But triple checking if -ffreestanding is being used in arch/s390/ I only se=
e:

arch/s390/purgatory/Makefile
26:KBUILD_CFLAGS +=3D -fno-zero-initialized-in-bss -fno-builtin -ffreestand=
ing

arch/s390/Makefile
28:KBUILD_CFLAGS_DECOMPRESSOR +=3D -ffreestanding

---
So I don't think -ffreestanding is at play here.
--=20
Thanks,
~Nick Desaulniers
