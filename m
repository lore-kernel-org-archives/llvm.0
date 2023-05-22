Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA529D309
	for <llvm@lists.linux.dev>; Mon, 22 May 2023 16:36:07 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-19a16355c51so4476974fac.0
        for <llvm@lists.linux.dev>; Mon, 22 May 2023 09:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684773367; x=1687365367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gE6VEcd6SehC09OLRuj4spGCMv2zTi9X2ZUJCimN/cs=;
        b=qXdboosidh2M1j9oJmWe2Vzv5zswW5Ta90fX/3QP4glyDrkjOQ1uDu+ghyYwnWa5od
         Qh1n+VgXDY44q/AmQvJWADGHdU7sAdQLubfxKSi7HDEkrEgN+yr2e6r1HqeCWXnZ8OIy
         MRRiCa9SPdionSCLe26ou5pHylT2HKDb69XeJdUTcjIjCa2S6EqvJnXwnNyPeoRuWmpA
         NGD3vMOzZkV6Ay5aUTr4y5b7f0SaeMFL97RGaJ50A/Rqbk3AicN2McLe9AVMiPqjkp3c
         4JJBq3v3lBKizJ3t/1qrAbvIoBOphCFVzx/3v+R8c1ECmKJDXIXbGXXOPRauY9refL8e
         yw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684773367; x=1687365367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gE6VEcd6SehC09OLRuj4spGCMv2zTi9X2ZUJCimN/cs=;
        b=kgyPvd+4tuhTJmRgjgeFWabwbIzHc2ma3QTm5JjJL+VwRbBN3kF9UEwEfQJ6RF3dKT
         w/ObGT5G+ATqpv1dD40YZvm/spUaqsAV1V55YiMdG0mbqb1MyuhPj/tZRyDAB+dZqS/1
         S8ksHkoAB+6JPU/+cUBhDjAmsaMDCcr9DYIcV+45zgYHw1eTUaIxwM7XHkf/tZ696U45
         z2PZss3jA4xWSGJweGAA3feero02Gtvu41zEhjJprZDVwnsapT0jl/88vT+/EGVCQDln
         lEeJW2j2VeAvQRPOAKIBJ0KQWxJQq4CqURjgXPtqykI6z6fgzkZYWgLnEIqcPvJxA+Kf
         PVOA==
X-Gm-Message-State: AC+VfDxCCYmr8o++XMdVxnHooQpcf/oGULjrV1PG05OkcOVu3fnWqHem
	25BQncK313bJkf3LvJKuEWlvEMLaw0WEVGBgdP0=
X-Google-Smtp-Source: ACHHUZ5Q2A3P446/ClvG0cbEyqJw5C98bhbbV/2l1fuktu3rGaOBg+8fbLOO5RN66inW4ZDkM7KG57e8jxOpWY0meHE=
X-Received: by 2002:a05:6870:6183:b0:192:736c:ae28 with SMTP id
 a3-20020a056870618300b00192736cae28mr4686856oah.58.1684773366819; Mon, 22 May
 2023 09:36:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230522171557.32027acf@canb.auug.org.au> <ZGuYeDA9jDlxzfZN@google.com>
In-Reply-To: <ZGuYeDA9jDlxzfZN@google.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 22 May 2023 12:35:55 -0400
Message-ID: <CADnq5_OoGDVWX5UwV_hQQBfPorBuE2jJymMA-hW+Y3+7ni0f5g@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the amdgpu tree
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>, 
	Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>, 
	Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, llvm@lists.linux.dev, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 22, 2023 at 12:29=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Mon, May 22, 2023 at 05:15:57PM +1000, Stephen Rothwell wrote:
> > Hi all,
> >
> > After merging the amdgpu tree, today's linux-next build (arm allmodconf=
ig
> > clang-17) failed like this:
> >
> > drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c:146:54: error: format specifie=
s type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'un=
signed int') [-Werror,-Wformat]
> >
> > Caused by commit
> >
> >   d020a29b6b58 ("drm/amdgpu: Allocate GART table in RAM for AMD APU")
> >
> > Reported by the kernelci.org bot.
>
> Alex,
> This is the third report of linux-next being broken for clang due to the
> AMDGPU tree.
> 1. https://lore.kernel.org/lkml/20230522171557.32027acf@canb.auug.org.au/
> 2. https://lore.kernel.org/lkml/20230522171145.38a8bd4d@canb.auug.org.au/
> 3. https://lore.kernel.org/lkml/20230522170031.5fb87a64@canb.auug.org.au/
>
> Our CI is red as a result.
> https://github.com/ClangBuiltLinux/continuous-integration2/actions/runs/5=
045716034/jobs/9053211936
>
> When will AMD start testing their kernels with Clang?

We have clang as part of our CI system and have had it for a while.
I'm not sure why it didn't catch these.  Our CI clang builds are
currently passing.

Alex

>
> >
> > --
> > Cheers,
> > Stephen Rothwell
>
> Thanks for reporting these, Stephen.
