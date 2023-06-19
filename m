Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D2512B6E
	for <llvm@lists.linux.dev>; Mon, 19 Jun 2023 15:24:53 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2b46f5f4d79so21804791fa.1
        for <llvm@lists.linux.dev>; Mon, 19 Jun 2023 08:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687188291; x=1689780291;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tvsv/WghBZtMVC+4mKl//bfuiXAwAB2g1EzwWwnS4WY=;
        b=hmTfkVb+5LmAraeoRlAOtQU14wJrr/lgzvR+pDJxJ7X2TCQxz9veq5BwYSt39JR1um
         fKJGbSp1IWE5aslsjXPVUho0EMDZ4bRE6wJkt768yw0v+lxdELB77ZDd9nAmmmZLEbVs
         D5VHK5W0jz9fPmJsuYlOrMqoaZsr1vOK50OzAz39gP4y7j64wNGVM9ekZSm1jDo7bCrc
         4tnCoZrgax2KIniW6LeEd1BtaYeYEgjtXZI2VS5n/n+3+R6XGkHtZKJiuNAVGUdP64Tp
         jnx6X0d68TpmsanR2eHuE4wuWo0Y9n4ZGdtl29klrSRgrKYxtDCQEt1lu0b/ZrmfwuxK
         5k7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687188291; x=1689780291;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tvsv/WghBZtMVC+4mKl//bfuiXAwAB2g1EzwWwnS4WY=;
        b=FljaBTHc8mZ7/txXye8itrCwYq0pJN7czKthRyqJXbx+Tu8C1reF3bAEptcHRRIimb
         0GLZu90NPUyVSji7R81wod/sYJYb6gFiztrYLRPN/7dp09Hxz1y0F0x5k88Kjm1tj1je
         sQSO5G5xQ1umUpfArymUVvP/CSbMaaHpCIQVQk74JUM2fm81DZS35FqGt31K6y6dwXgK
         rG+Uy0BHgCZV9F+vgsUubk9WfZZo88INp/veE1/daCIC1FJEqIr9U4Ze8YQMsIlWxKbN
         IH01iblvt4jWD1wf/+11hCPdz5/yUINElYTYTlHVoapeepj7wFJmgnMwctmYYRNg2zCT
         evXQ==
X-Gm-Message-State: AC+VfDznBCUwOIyOv2wrLYYLBZ62pZb7Y2AREfJwqiArCTMDsBhXqMwp
	RkNQHRh6v1gYKArN/bSJlOE=
X-Google-Smtp-Source: ACHHUZ7A1W0yVDwzsTAdsr/IbmVvuV/7c1xvRqXSQlsbE31LJj2Z0Ti8MaZzcSuz6xpu+pZnnF0n4A==
X-Received: by 2002:a2e:b5cc:0:b0:2b4:7500:3094 with SMTP id g12-20020a2eb5cc000000b002b475003094mr1308798ljn.3.1687188291342;
        Mon, 19 Jun 2023 08:24:51 -0700 (PDT)
Received: from [192.168.1.95] (host-176-36-0-241.b024.la.net.ua. [176.36.0.241])
        by smtp.gmail.com with ESMTPSA id 15-20020a05651c008f00b002b47e824518sm388769ljq.76.2023.06.19.08.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 08:24:50 -0700 (PDT)
Message-ID: <478f608e3b8de1218798c792b34dca75fa91f6a9.camel@gmail.com>
Subject: Re: [PATCH bpf] bpf/btf: Accept function names that contain dots
From: Eduard Zingerman <eddyz87@gmail.com>
To: Florent Revest <revest@chromium.org>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
  martin.lau@linux.dev, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org,  song@kernel.org, yhs@fb.com, john.fastabend@gmail.com,
 kpsingh@kernel.org,  sdf@google.com, haoluo@google.com, jolsa@kernel.org,
 nathan@kernel.org,  ndesaulniers@google.com, trix@redhat.com,
 stable@vger.kernel.org
Date: Mon, 19 Jun 2023 18:24:49 +0300
In-Reply-To: <CABRcYmKY_4_udQtsu7E9CVPruPphnejcgCvGnfHzzu-yc4Kshg@mail.gmail.com>
References: <20230615145607.3469985-1-revest@chromium.org>
	 <CABRcYm+C+tPwXAGnaDRR_U2hzyt+09fjkKBp3tPx6iKT4wBE2Q@mail.gmail.com>
	 <fbd79f5f2b250ec913c78d91b94ca96fb96f67ee.camel@gmail.com>
	 <CABRcYmLaummOg=Nf0qXVN2eci=25OqXLD0zpCUz4CgmTjvo9LA@mail.gmail.com>
	 <CABRcYmKY_4_udQtsu7E9CVPruPphnejcgCvGnfHzzu-yc4Kshg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2023-06-19 at 15:55 +0200, Florent Revest wrote:
> On Mon, Jun 19, 2023 at 1:20=E2=80=AFPM Florent Revest <revest@chromium.o=
rg> wrote:
> >=20
> > On Thu, Jun 15, 2023 at 7:05=E2=80=AFPM Eduard Zingerman <eddyz87@gmail=
.com> wrote:
> > >=20
> > > On Thu, 2023-06-15 at 17:44 +0200, Florent Revest wrote:
> > > > An easy reproducer is:
> > > >=20
> > > > $ touch pwet.c
> > > >=20
> > > > $ clang -g -fsanitize=3Dkernel-address -c -o pwet.o pwet.c
> > > > $ llvm-dwarfdump pwet.o | grep module_ctor
> > > >=20
> > > > $ clang -fno-integrated-as -g -fsanitize=3Dkernel-address -c -o pwe=
t.o pwet.c
> > > > $ llvm-dwarfdump pwet.o | grep module_ctor
> > > >                 DW_AT_name      ("asan.module_ctor")
> > >=20
> > > Interestingly, I am unable to reproduce it using either
> > > clang version 14.0.0-1ubuntu1 or clang main (bd66f4b1da30).
> >=20
> > Somehow, I didn't think of trying other clang versions! Thanks, that's
> > a good point Eduard. :)
> >=20
> > I also can't reproduce it on a 14x build.
> >=20
> > However, I seem to be able to reproduce it on main:
> >=20
> >   git clone https://github.com/llvm/llvm-project.git
> >   mkdir llvm-project/build
> >   cd llvm-project/build
> >   git checkout bd66f4b1da30
> >   cmake -DLLVM_ENABLE_PROJECTS=3Dclang -DCMAKE_BUILD_TYPE=3DRelease -G
> > "Unix Makefiles" ../llvm
> >   make -j $(nproc)
> >=20
> >   bin/clang -fno-integrated-as -g -fsanitize=3Dkernel-address -c -o
> > ~/pwet.o ~/pwet.c
> >   bin/llvm-dwarfdump ~/pwet.o | grep module_ctor
> >   # Shows module_ctor
> >=20
> > I started a bisection, hopefully that will point to something interesti=
ng
>=20
> The bisection pointed to a LLVM patch from Nick in October 2022:
> e3bb359aacdd ("[clang][Toolchains][Gnu] pass -g through to assembler")
>=20
> Based on the context I have, that commit sounds fair enough. I don't
> think LLVM does anything wrong here, it seems like BPF should be the
> one dealing with dots in function debug info.

That explains why I could not reproduce the issue: I tried with gas 2.38.
Using gas 2.40 I see the same behavior as you.

If one tries to generate assembly file with '-fsanitize':

  $ clang -fno-integrated-as -g -fsanitize=3Dkernel-address -S -o pwet.s pw=
et.c
  $ cat pwet.s
  	.text
  	.file	"pwet.c"
  	.p2align	4, 0x90                         # -- Begin function asan.module=
_ctor
  	.type	asan.module_ctor,@function
  asan.module_ctor:                       # @asan.module_ctor
  .Lfunc_begin0:
      ...

And then compile it using Gnu assembler:

  $ as --64 -o pwet.o pwet.s -g -gdwarf-5

The behavior differs between 2.38 and 2.40, the older version does not
produce debug entry for 'asan.module_ctor', while newer does.

