Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E71C2CF
	for <llvm@lists.linux.dev>; Fri,  7 Jul 2023 20:46:08 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-765a311a7a9so118173285a.0
        for <llvm@lists.linux.dev>; Fri, 07 Jul 2023 13:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688762767; x=1691354767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0aYVMvYe1G1Ct9F0r9UZVqRVY35bvxFcxuMPw9DOHvw=;
        b=lkuqLxF14A/w/d+fV/ttf+K3Ub3mN4dsNqaNLTsP+ZDcGTajiX2EvRqyzkSjnpw90h
         2/kSM88bqsMjXMcVJVwmaRQGqOm4/nSCxcUal0Du0s8hegtUlJy/KdIPSt3tU5D0lEw0
         WN36Zgo/31PlXBRBCDW4zoA6ZdCUY76aH/bC14sD01W8wnDCdG9bYPTUABJxt5CYePd+
         lDwNBBGzo8oQPeOZ7xteUlOayvMdyzlP9mBMsp2tPYiyDWDygUa0ybaVaKei63uKBEih
         5lPTF8ShwuPVLnHlcCIXQLPBhagZJxmmubKJEEIZbSH7Snzkbfqr4uNsd1A2DxzC8zKa
         yTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688762767; x=1691354767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0aYVMvYe1G1Ct9F0r9UZVqRVY35bvxFcxuMPw9DOHvw=;
        b=F80Vc560gCC15OY6AhNoMX/ON37WhtGmuyzokecW4490Pq5b6+WQX3Iyklhw+ZP95c
         IT28AUOy7B1B5+183tSpC1o3dqsIArk2d5FTil8/nI1aEXFSVqbNiSWAxbJ3hBUzxURN
         K8fJTkoycL3sEI+Gz6CIX8eQf/nZn+VgAP3Zh6LeH9F86FidNhO9++dxBXbGl8SPRNDU
         0RU6Szr0r/xO1oMQzmswP8gJi1e3GN8M7uv9IznHTYa+ZdpK2qUtEL/siSNEvbmOr1BZ
         i2MraYZiRtR4yAwoa2uhb8poukBmsLfuUaSZqYhs4sMEQQMl6oDuZSv/M+uP2cy9Y59T
         ROZg==
X-Gm-Message-State: ABy/qLZPAe+aAAjgGpxzyByUHbjdY9Z0BG4o0pwgqoN3nn6QgB0vmJTX
	u/PA+x+cm88e0CC/LWuIB/AqaOjnbvriCmRx/qqdag==
X-Google-Smtp-Source: APBJJlHUf0rmBIyOI/T2pORO24BydSGObRtEeKTOwPbRW6TmxkjVJRfSahixaV1hd2/4VLJVPsq9WGAU0WIhQb6nXas=
X-Received: by 2002:a05:620a:2687:b0:765:449d:1397 with SMTP id
 c7-20020a05620a268700b00765449d1397mr10632093qkp.13.1688762767012; Fri, 07
 Jul 2023 13:46:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <253mt0il43o.fsf@mtr-vdi-124.i-did-not-set--mail-host-address--so-tickle-me>
 <20230620145338.1300897-1-dhowells@redhat.com> <20230620145338.1300897-11-dhowells@redhat.com>
 <58466.1688074499@warthog.procyon.org.uk> <20230629164318.44f45caf@kernel.org>
 <20230630161043.GA2902645@dev-arch.thelio-3990X> <20230630091442.172ec67f@kernel.org>
 <20230630192825.GA2745548@dev-arch.thelio-3990X>
In-Reply-To: <20230630192825.GA2745548@dev-arch.thelio-3990X>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 7 Jul 2023 13:45:55 -0700
Message-ID: <CAKwvOd=H3R0sZjFSNs4xyFdw5yGgxSWk2=v+dmR5TrZfjjXaWA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 10/18] nvme/host: Use sendmsg(MSG_SPLICE_PAGES)
 rather then sendpage
To: Nathan Chancellor <nathan@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, David Howells <dhowells@redhat.com>, 
	Aurelien Aptel <aaptel@nvidia.com>, netdev@vger.kernel.org, 
	Alexander Duyck <alexander.duyck@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>, David Ahern <dsahern@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, Jens Axboe <axboe@kernel.dk>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Sagi Grimberg <sagi@grimberg.me>, 
	Willem de Bruijn <willemb@google.com>, Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>, 
	Christoph Hellwig <hch@lst.de>, Chaitanya Kulkarni <kch@nvidia.com>, linux-nvme@lists.infradead.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 30, 2023 at 12:28=E2=80=AFPM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> On Fri, Jun 30, 2023 at 09:14:42AM -0700, Jakub Kicinski wrote:
> > On Fri, 30 Jun 2023 09:10:43 -0700 Nathan Chancellor wrote:
> > > > Let me CC llvm@ in case someone's there is willing to make
> > > > the compiler warn about this.
> > >
> > > Turns out clang already has a warning for this, -Wcomma:
> > >
> > >   drivers/nvme/host/tcp.c:1017:38: error: possible misuse of comma op=
erator here [-Werror,-Wcomma]
> > >    1017 |                         msg.msg_flags &=3D ~MSG_SPLICE_PAGE=
S,
> > >         |                                                           ^
> > >   drivers/nvme/host/tcp.c:1017:4: note: cast expression to void to si=
lence warning
> > >    1017 |                         msg.msg_flags &=3D ~MSG_SPLICE_PAGE=
S,
> > >         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >         |                         (void)(                           )
> > >   1 error generated.
> > >
> > > Let me do some wider build testing to see if it is viable to turn thi=
s
> > > on for the whole kernel because it seems worth it, at least in this
> > > case. There are a lot of cases where a warning won't be emitted (see =
the
> > > original upstream review for a list: https://reviews.llvm.org/D3976) =
but
> > > something is better than nothing, right? :)
>
> Well, that was a pipe dream :/ In ARCH=3Darm multi_v7_defconfig alone,
> there are 289 unique instances of the warning (although a good number
> have multiple instances per line, so it is not quite as bad as it seems,
> but still bad):
>
> $ rg -- -Wcomma arm-multi_v7_defconfig.log | sort | uniq -c | wc -l
> 289
>
> https://gist.github.com/nathanchance/907867e0a7adffc877fd39fd08853801

It's definitely interesting to take a look at some of these cases.
Some are pretty funny IMO.

>
> Probably not a good sign of the signal to noise ratio, I looked through
> a good handful and all the cases I saw were not interesting... Perhaps
> the warning could be tuned further to become useful for the kernel but
> in its current form, it is definitely a no-go :/
>
> > Ah, neat. Misleading indentation is another possible angle, I reckon,
> > but not sure if that's enabled/possible to enable for the entire kernel
>
> Yeah, I was surprised there was no warning for misleading indentation...
> it is a part of -Wall for both clang and GCC, so it is on for the
> kernel, it just appears not to trigger in this case.
>
> > either :( We test-build with W=3D1 in networking, FWIW, so W=3D1 would =
be
> > enough for us.
>
> Unfortunately, even in its current form, it is way too noisy for W=3D1, a=
s
> the qualifier for W=3D1 is "do not occur too often". Probably could be
> placed under W=3D2 but it still has the problem of wading through every
> instance and it is basically a no-op because nobody tests with W=3D2.
>
> Cheers,
> Nathan
>


--=20
Thanks,
~Nick Desaulniers
