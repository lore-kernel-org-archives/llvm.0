Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0FC20690
	for <llvm@lists.linux.dev>; Thu, 22 Jun 2023 21:41:11 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-62fe6580f17so60219816d6.0
        for <llvm@lists.linux.dev>; Thu, 22 Jun 2023 14:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687470071; x=1690062071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PKMhtKFgdWfySpTweTXU9j4cru4Ry9zStYx1evxgaA8=;
        b=Y87dbw+cg+wTMcIpPAtf85ukrOYybmHletqopcUQkoSrYPCxLkeUlvHLlbETcKGAsq
         ZNmZck/5BEnT8PesoEeeDhOXhQ48R6+TZ8vVR7DhbrSAUoqxT7zZv5AgWdC4lhSfZakI
         g+Q1KhqrS0QbfALMKqALAWQJjiM+o+sRmd+v+dBmGGlGwBy1i3uvNkxst1ywqA/cC8kk
         0EGRHcCeYrPMwgH7SKkgS+4wrp/CcpVAV3U9eftiJIHmApYlAqUg0VREho4AabQEtA9/
         WdSj9HxWNNhpMhGAL8FAVQb/EzlwW61rZjQ7yjeEd4niYKFiUkp4Rayk8LLmVJbH0faV
         DqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687470071; x=1690062071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PKMhtKFgdWfySpTweTXU9j4cru4Ry9zStYx1evxgaA8=;
        b=gUGkr6BeZAK/Mztq7pZXZvYNf8ktR17UMhYeiBm10QsdzayRpcEZrObWetBY4n6Ax7
         Db0ygojPEfrmcp1W4PFXwOWY5DyqoIy1IDgV8RVzumseFlyyotyJ8L0aXtOJ9tCqpD2X
         saQN/lu14jsLtyJF+8ZoTdNWweCDph5OolcNyumQViBZtjfiLU9XUgZNZWSH6xMxreV/
         Gh2g8NLI0QTluTzBbJPguy3iq1Fh2Ug5f0ScY9fM8uI6FCO88IeT+pOPLyqE1bHbXjeX
         ggLZ2vkBEqvpSj2GM+ifPDeN91a9TkNGQQBbSIpj0G2jxqo9oAP4d0Dqg8qkJTAhFC5W
         j7+w==
X-Gm-Message-State: AC+VfDyix8OX6Yt9AfB1oSbMN2XaMGreBUXkb+YWfzpoiPnL+PBBBAyS
	ivMqQ22WW0mZbRnt/VEfw5hdVtpG85e//2Vw26kGLA==
X-Google-Smtp-Source: ACHHUZ6mCI1jN5S3s7ShvvInAUX/6XlWctrvaeIXm/Y08Ms1/dqk8yh1L7hnRjD6E7oASdxzNWEi8VTMlPOi9UYUjdc=
X-Received: by 2002:a05:6214:2a8b:b0:62d:df48:baf0 with SMTP id
 jr11-20020a0562142a8b00b0062ddf48baf0mr23221940qvb.61.1687470070594; Thu, 22
 Jun 2023 14:41:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <mhng-1d790a82-44ad-4b9c-bfe4-6303f09b0705@palmer-ri-x1c9a> <mhng-ad2d02fa-2d4d-4bf1-ab2a-fd84fa4bcb40@palmer-ri-x1c9a>
In-Reply-To: <mhng-ad2d02fa-2d4d-4bf1-ab2a-fd84fa4bcb40@palmer-ri-x1c9a>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 22 Jun 2023 14:40:59 -0700
Message-ID: <CAKwvOd=bHe07O=eBimOg5G-XxXgs6=h5OXzkfS+ayfuAHGOUew@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: nathan@kernel.org, bjorn@kernel.org, Conor Dooley <conor@kernel.org>, 
	jszhang@kernel.org, llvm@lists.linux.dev, 
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
	Arnd Bergmann <arnd@arndb.de>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 21, 2023 at 12:46=E2=80=AFPM Palmer Dabbelt <palmer@dabbelt.com=
> wrote:
>
> On Wed, 21 Jun 2023 11:19:31 PDT (-0700), Palmer Dabbelt wrote:
> > On Wed, 21 Jun 2023 10:51:15 PDT (-0700), bjorn@kernel.org wrote:
> >> Conor Dooley <conor@kernel.org> writes:
> >>
> >> [...]
> >>
> >>>> So I'm no longer actually sure there's a hang, just something slow.
> >>>> That's even more of a grey area, but I think it's sane to call a 1-h=
our
> >>>> link time a regression -- unless it's expected that this is just ver=
y
> >>>> slow to link?
> >>>
> >>> I dunno, if it was only a thing for allyesconfig, then whatever - but
> >>> it's gonna significantly increase build times for any large kernels i=
f LLD
> >>> is this much slower than LD. Regression in my book.
> >>>
> >>> I'm gonna go and experiment with mixed toolchain builds, I'll report
> >>> back..
> >>
> >> I took palmer/for-next (1bd2963b2175 ("Merge patch series "riscv: enab=
le
> >> HAVE_LD_DEAD_CODE_DATA_ELIMINATION"")) for a tuxmake build with llvm-1=
6:
> >>
> >>   | ~/src/tuxmake/run -v --wrapper ccache --target-arch riscv \
> >>   |     --toolchain=3Dllvm-16 --runtime docker --directory . -k \
> >>   |     allyesconfig
> >>
> >> Took forever, but passed after 2.5h.
> >
> > Thanks.  I just re-ran mine 17/trunk LLD under time (rather that just
> > checking top sometimes), it's at 1.5h but even that seems quite long.
> >
> > I guess this is sort of up to the LLVM folks: if it's expected that DCE
> > takes a very long time to link then I'm not opposed to allowing it, but
> > if this is probably a bug in LLD then it seems best to turn it off unti=
l
> > we sort things out over there.
> >
> > I think maybe Nick or Nathan is the best bet to know?
>
> Looks like it's about 2h for me.  I'm going to drop these from my
> staging tree in the interest of making progress on other stuff, but if
> this is just expected behavior them I'm OK taking them (though that's
> too much compute for me to test regularly):
>
> $ time ../../../../llvm/install/bin/ld.lld -melf64lriscv -z noexecstack -=
r -o vmlinux.o --whole-archive vmlinux.a --no-whole-archive --start-group .=
/drivers/firmware/efi/libstub/lib.a --end-group
>
> real    111m50.678s
> user    111m18.739s
> sys     1m13.147s

Ah, I think you meant s/allmodconfig/allyesconfig/ in your initial
report.  That makes more sense, and I can reproduce.  Let me work on a
report.

>
> >> CONFIG_CC_VERSION_TEXT=3D"Debian clang version 16.0.6 (++2023061011330=
7+7cbf1a259152-1~exp1~20230610233402.106)"
> >>
> >>
> >> Bj=C3=B6rn



--
Thanks,
~Nick Desaulniers
