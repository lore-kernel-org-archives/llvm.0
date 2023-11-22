Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B27E23DF
	for <llvm@lists.linux.dev>; Wed, 22 Nov 2023 03:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jq3m3PfJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8877C433C7
	for <llvm@lists.linux.dev>; Wed, 22 Nov 2023 03:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700622584;
	bh=qdLHRBoKEw4gFMfVFRwpwvnicE8hhhtpNM9aNH2gRU8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Jq3m3PfJbSX+yRjZLK2B59ZrYeuva4W0cT1Sai+cg+WfR2XEw8E/X9nbeYhwJzSav
	 ZXnK1rKg8cXcz4ErBDe+qQMJ6PUqMO1WNGAqiziL6SsxbXfT76gt/fZmJ5ZrGpMMgP
	 87WIuYwfbeQiMKtyu6y1yryDCJmub3H81IQT+fqMA8mdEDhYYZj0kPKGG/M4W1OXIw
	 oPV6ScXTQxPw6+E/N10A5MFMi0FhNo65cKxm283zOnE9J2PmBoeKmf4c6N1EsZmsGI
	 8EjhJQybncfkQf+zm1LoKDdcrOPluGIBnLVN+wuFEj/2g7Ghpb+2FhpG1oTalGecFo
	 s5VOk134bwjFQ==
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-1ea98ad294cso2963436fac.3
        for <llvm@lists.linux.dev>; Tue, 21 Nov 2023 19:09:44 -0800 (PST)
X-Gm-Message-State: AOJu0YwDui9cN1COPjsW/zfSpSvo1fmol4yEE1dfQS/Y6JvM5h37QMjG
	MWkwXvHwSrJ+LokTfNqmTJTschktgQF4SOYDa9U=
X-Google-Smtp-Source: AGHT+IHCfjburBQ1UdmjywweePttcXq8IzEtQKzgns2nPfAmlJiNNiQj6TYBr2fVJWJRAVnlcJyJRUk5V/ku2eUIpJU=
X-Received: by 2002:a05:6870:8e0b:b0:1f9:5ae9:bb6e with SMTP id
 lw11-20020a0568708e0b00b001f95ae9bb6emr1378749oab.32.1700622584238; Tue, 21
 Nov 2023 19:09:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231120232332.4100288-1-masahiroy@kernel.org>
 <CX42TU4QHS1Z.A0UUHMDAMZOL@wheely> <87bkbnsa5r.fsf@kernel.org>
In-Reply-To: <87bkbnsa5r.fsf@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 22 Nov 2023 12:09:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT-_07_h1_jG606VX0WjJq8dEW+C_4E0f28mjyqFnCWFw@mail.gmail.com>
Message-ID: <CAK7LNAT-_07_h1_jG606VX0WjJq8dEW+C_4E0f28mjyqFnCWFw@mail.gmail.com>
Subject: Re: [PATCH] powerpc: add crtsavres.o to always-y instead of extra-y
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, llvm@lists.linux.dev, 
	Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2023 at 6:55=E2=80=AFPM Aneesh Kumar K.V
<aneesh.kumar@kernel.org> wrote:
>
> "Nicholas Piggin" <npiggin@gmail.com> writes:
>
> > On Tue Nov 21, 2023 at 9:23 AM AEST, Masahiro Yamada wrote:
> >> crtsavres.o is linked to modules. However, as explained in commit
> >> d0e628cd817f ("kbuild: doc: clarify the difference between extra-y
> >> and always-y"), 'make modules' does not build extra-y.
> >>
> >> For example, the following command fails:
> >>
> >>   $ make ARCH=3Dpowerpc LLVM=3D1 KBUILD_MODPOST_WARN=3D1 mrproper ps3_=
defconfig modules
> >>     [snip]
> >>     LD [M]  arch/powerpc/platforms/cell/spufs/spufs.ko
> >>   ld.lld: error: cannot open arch/powerpc/lib/crtsavres.o: No such fil=
e or directory
> >>   make[3]: *** [scripts/Makefile.modfinal:56: arch/powerpc/platforms/c=
ell/spufs/spufs.ko] Error 1
> >>   make[2]: *** [Makefile:1844: modules] Error 2
> >>   make[1]: *** [/home/masahiro/workspace/linux-kbuild/Makefile:350: __=
build_one_by_one] Error 2
> >>   make: *** [Makefile:234: __sub-make] Error 2
> >>
> >
> > Thanks. Is this the correct Fixes tag?
> >
> > Fixes: d0e628cd817f ("powerpc/64: Do not link crtsavres.o in vmlinux")
> >
>
> I am finding a different commit ID:
>
> commit baa25b571a168aff5a13bfdc973f1229e2b12b63
> Author: Nicholas Piggin <npiggin@gmail.com>
> Date:   Fri May 12 01:56:49 2017 +1000
>
>     powerpc/64: Do not link crtsavres.o in vmlinux
>
>     The 64-bit linker creates save/restore functions on demand with final
>     links, so vmlinux does not require crtsavres.o.
>
>
> -aneesh



Yeah, I think the correct tag is:


Fixes: baa25b571a16 ("powerpc/64: Do not link crtsavres.o in vmlinux")


--=20
Best Regards
Masahiro Yamada
