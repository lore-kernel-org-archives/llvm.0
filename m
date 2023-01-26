Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530711877
	for <llvm@lists.linux.dev>; Thu, 26 Jan 2023 04:24:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F189BC4339B
	for <llvm@lists.linux.dev>; Thu, 26 Jan 2023 04:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674707071;
	bh=sWbjQTRCxadlbLQUn48rYhAzqa6RuEwbYlxB2uDoP2g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UwapKS2vrsI7ZOzOY5TofHCbFKrUlciDFa9tN6TEiMdx7KUG8QhImE+8styYe5LrF
	 KWw8Wbq4InPm/slYsE+49hdnc/i4gxclZXc4yvTxOd524CO4YwmUCz3/xEY6Ez5Yz9
	 bF5ZVpx3MBxPfsrbclYAQnutqTS7/NRjsQLG+PGAGZknEKCvzQtW5P9tkwMLmFCeAk
	 oz6RBiq6BWWB8PuxVl0FXiZibxDL8emUgfKohrysRkKx2kht9JibKnbGz9YfRyH2t9
	 ERC5LJVGox+5KPDx4mvwnp1tguJ9M293x3l2Uzv41Rk1FJMXzIGYF7M1s4rqWAD34g
	 ASwx/zKw+nvNA==
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1442977d77dso1091622fac.6
        for <llvm@lists.linux.dev>; Wed, 25 Jan 2023 20:24:30 -0800 (PST)
X-Gm-Message-State: AFqh2kqu8k6o3WEVlaKGvj6wsqL6m8l58R4rhuQs7OwjzBcZ/1pi7QhO
	IZsk5xwTBqqU4ffgOb1EDrDYi01JwxQM9rAoziE=
X-Google-Smtp-Source: AK7set/PNYPvPP/GjRjIRGJzYjSEmyoUNcXyniROhcp8vnAKH6317MZroWIjsXCLu1JuqdqIc9JD2eMm+ul9pJnsLE8=
X-Received: by 2002:a05:6870:110f:b0:160:3296:a9b9 with SMTP id
 15-20020a056870110f00b001603296a9b9mr850092oaf.287.1674707070213; Wed, 25 Jan
 2023 20:24:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230123-qunused-argument-auto-var-init-v1-1-ec06051f0d87@kernel.org>
In-Reply-To: <20230123-qunused-argument-auto-var-init-v1-1-ec06051f0d87@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 26 Jan 2023 13:23:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNAThyrFRH22f8pdKyh0ypgCkEhnF9kUJ3XM3C=B2XGF-9A@mail.gmail.com>
Message-ID: <CAK7LNAThyrFRH22f8pdKyh0ypgCkEhnF9kUJ3XM3C=B2XGF-9A@mail.gmail.com>
Subject: Re: [PATCH] powerpc/vdso: Filter clang's auto var init zero enabler
 when linking
To: Nathan Chancellor <nathan@kernel.org>
Cc: ndesaulniers@google.com, nicolas@fjasle.eu, mpe@ellerman.id.au, 
	npiggin@gmail.com, christophe.leroy@csgroup.eu, trix@redhat.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 25, 2023 at 1:20 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> After commit 7bbf02b875b5 ("kbuild: Stop using '-Qunused-arguments' with
> clang"), the PowerPC vDSO shows the following error with clang-13 and
> older when CONFIG_INIT_STACK_ALL_ZERO is enabled:
>
>   clang: error: argument unused during compilation: '-enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang' [-Werror,-Wunused-command-line-argument]
>
> clang-14 added a change to make sure this flag never triggers
> -Wunused-command-line-argument, so it is fixed with newer releases. For
> older releases that the kernel still supports building with, just filter
> out this flag, as has been done for other flags.
>
> Fixes: b174f4c26aa3 ("powerpc/vdso: Improve linker flags")
> Fixes: 7bbf02b875b5 ("kbuild: Stop using '-Qunused-arguments' with clang")
> Link: https://github.com/llvm/llvm-project/commit/ca6d5813d17598cd180995fb3bdfca00f364475f
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> This should be the last flag that needs to be filtered (famous last
> words...) but if any more come up, we should really just explore
> switching the PowerPC vDSO to linking with $(LD) like every other part
> of the kernel; for now, I hope this is fine.
>
> Cheers,
> Nathan


Applied to linux-kbuild. Thanks.

Since I rebased the branch, the tags have been updated
accordingly.





    powerpc/vdso: Filter clang's auto var init zero enabler when linking

    After commit 8d9acfce3332 ("kbuild: Stop using '-Qunused-arguments' with
    clang"), the PowerPC vDSO shows the following error with clang-13 and
    older when CONFIG_INIT_STACK_ALL_ZERO is enabled:

      clang: error: argument unused during compilation:
'-enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang'
[-Werror,-Wunused-command-line-argument]

    clang-14 added a change to make sure this flag never triggers
    -Wunused-command-line-argument, so it is fixed with newer releases. For
    older releases that the kernel still supports building with, just filter
    out this flag, as has been done for other flags.

    Fixes: f0a42fbab447 ("powerpc/vdso: Improve linker flags")
    Fixes: 8d9acfce3332 ("kbuild: Stop using '-Qunused-arguments' with clang")
    Link: https://github.com/llvm/llvm-project/commit/ca6d5813d17598cd180995fb3bdfca00f364475f
    Signed-off-by: Nathan Chancellor <nathan@kernel.org>
    Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>



-- 
Best Regards
Masahiro Yamada
