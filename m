Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF8B9476
	for <llvm@lists.linux.dev>; Wed, 22 Mar 2023 18:25:57 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id qe8-20020a17090b4f8800b0023f07253a2cso20001309pjb.3
        for <llvm@lists.linux.dev>; Wed, 22 Mar 2023 11:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1679509557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xai25ViACOhtMbP/9A/HIC69Te+6jb14im4nmgBreX0=;
        b=Nc7bqPWvvVP0Fh9GRUREatEuPhbNWcj8ydyJq6p7WhnKTmZsmINp40U8jm2U/D3eOh
         GiADNrvpDW1src3wBD86k8hybLw++0LHdLBlze0Q290ZO1ycLMYXpjqhF0bC849Amhtk
         Uy0gNTTczAqnmq7Ne1eUnCmgjRAczfqeQ58RKE9Z1Dbo8WYhXCE+35mHwpNTZjinRv7Z
         SvFY91A1LyC+CNVJab3PMehak5rGBLhjGTsCzg52VkGZ8uMK06Y5GA1JlP2dh0NN6NWH
         L5Jzlk3GH1BS4NTePFlNBmFvEFZSn5SfhLcK85z0+yzixjDvudD4Wt6pqVVnBBIsUYXI
         dcEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679509557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xai25ViACOhtMbP/9A/HIC69Te+6jb14im4nmgBreX0=;
        b=k9wpeCa7Ev1cEEE7uXw2inLS3144t9dLkuhQUpLjCgnggGSDOApvjXFvzMCtZC7t3O
         Le/fY85Aknl1EaiF67esigsk3shx+B/B91+VWPKNl5ITSD48p8tneFPeWPZPXfRCe1aa
         bIdRZrprWRWtyaUU+v2xCplj1ys1eGNFjOn3SlqtoDHkGxqBWU8f62oJ2xvxxXBwfqQg
         4eM9p22KvmJTrJSNu4Z7E68WI2NuLRSGpSqP09GVYAJw5TEUKzkuwdtiEX/yjSNmJuN2
         0nH0+zP8bqywHiUplRqqtIwkRbk8Hb6FoMl5Y8npucfkIqx+GaZoMYJpj9HJBKYQAu3T
         HoVg==
X-Gm-Message-State: AO0yUKXaqpvUO1sU/VHiaBP5U+7q4NuJn7aELnSaF7U9rLpico6UK718
	RhNyWaue9YtDnTDZVfc87dfZNrI5Ax2g8wbKofbZIA==
X-Google-Smtp-Source: AK7set/ZMXJixIFC4D/KWjt5E7Yb69EPs9KtjzG+BYb//151Eeugg7QbDH72EBo41HILsUMiYkKai/KWyETz2jWK8JA=
X-Received: by 2002:a17:902:7b8b:b0:19a:82a2:fcf9 with SMTP id
 w11-20020a1709027b8b00b0019a82a2fcf9mr1399015pll.2.1679509556719; Wed, 22 Mar
 2023 11:25:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230215143626.453491-1-alexghiti@rivosinc.com>
 <20230215143626.453491-2-alexghiti@rivosinc.com> <4a6fc7a3-9697-a49b-0941-97f32194b0d7@ghiti.fr>
 <877cw7dphf.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <877cw7dphf.fsf@all.your.base.are.belong.to.us>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 22 Mar 2023 11:25:45 -0700
Message-ID: <CAKwvOdk0Lr-9gt0xAKvkcwA53+Wy8oeYQo1RJ7XH-LKCCURQCQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/3] riscv: Introduce CONFIG_RELOCATABLE
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, nathan@kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2023 at 7:58=E2=80=AFAM Bj=C3=B6rn T=C3=B6pel <bjorn@kernel=
.org> wrote:
>
> Alexandre Ghiti <alex@ghiti.fr> writes:
>
> > +cc linux-kbuild, llvm, Nathan, Nick
> >
> > On 2/15/23 15:36, Alexandre Ghiti wrote:
> >> From: Alexandre Ghiti <alex@ghiti.fr>
> >>
> > I tried a lot of things, but I struggle to understand, does anyone have
> > any idea? FYI, the same problem happens with LLVM.

Off the top of my head, no idea.

(Maybe as a follow up to this series, I wonder if pursuing
ARCH_HAS_RELR for ARCH=3Driscv is worthwhile?)

>
> Don't ask me *why*, but adding --emit-relocs to your linker flags solves
> "the NULL .rela.dyn" both for GCC and LLVM.
>
> The downside is that you end up with a bunch of .rela cruft in your
> vmlinux.

There was a patch just this week to use $(OBJCOPY) to strip these from
vmlinux (for x86). Looks like x86 uses --emit-relocs for KASLR:
https://lore.kernel.org/lkml/20230320121006.4863-1-petr.pavlu@suse.com/
--=20
Thanks,
~Nick Desaulniers
