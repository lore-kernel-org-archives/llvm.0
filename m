Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7A11101
	for <llvm@lists.linux.dev>; Thu, 26 Jan 2023 04:22:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAB60C433D2
	for <llvm@lists.linux.dev>; Thu, 26 Jan 2023 04:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674706978;
	bh=wZ7PBz2jqDU4NDuGlZAPATfEy7lDMc9qS1F/oyAFONs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bcwaD85RmG0IF/8n9eiuYAxS1/mDWuiE7h92nOHq50+2X3uBTrYl2g1flqpKQ3bst
	 AaVXetWxjY7Ih6cD7DWMGyg3PJ5dI6/7CRmtd2RF5mGCFS0SOVe2OWaQJfJrwjBqK/
	 /wtAi/zz5L2swU4Tn/VwCik2aMS/Q5yMBdCGbHBj9/MTKtFTKNjkf9Iuh1LpI704gi
	 XTOyG/5FPcXwzkWkOd54rV6DOwJOcs5ze6GoJGlOaeL+tn9pfbiKvdYMCrnj08Qf4v
	 6DKALZRd68tzlM8/gJo2SRnlMoaLmCtONLcDbzqz/zhuUxL9xO45ZO7q/58/hFYBnJ
	 gUiv73BJnCqTg==
Received: by mail-ot1-f46.google.com with SMTP id f5-20020a9d5f05000000b00684c0c2eb3fso379848oti.10
        for <llvm@lists.linux.dev>; Wed, 25 Jan 2023 20:22:58 -0800 (PST)
X-Gm-Message-State: AFqh2kopkvNJ0l2UrR4B6w9NkTms6c2Z1CHDxX/GKjg0jS+wBukRf9oe
	5Os599onrS9UN1jGUjyCAs14Xkn5dMAh9Usczhk=
X-Google-Smtp-Source: AMrXdXufR6pDOeFuIyPbmDS6WVQNM1DgbYqV35b5aVOlVeaHNoWPRyY/PmXldGSKTEdajVesmoVacTD3KgGFr1aoMXE=
X-Received: by 2002:a05:6830:2330:b0:670:5fd5:1ea3 with SMTP id
 q16-20020a056830233000b006705fd51ea3mr1950794otg.85.1674706978079; Wed, 25
 Jan 2023 20:22:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
 <20221228-drop-qunused-arguments-v2-5-9adbddd20d86@kernel.org>
 <871qnjqmmq.fsf@mpe.ellerman.id.au> <CAK7LNAR2ASj6bGS6sR5x=cDCDDFW3ZkHRTdsHAY_+JEqojTUNQ@mail.gmail.com>
 <Y9HgXE9kmcfmva1C@dev-arch.thelio-3990X>
In-Reply-To: <Y9HgXE9kmcfmva1C@dev-arch.thelio-3990X>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 26 Jan 2023 13:22:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNAROfEi7021v+SkDd=uU1hM_vzuGYvDD6OQ0bJ2Tu0yjvA@mail.gmail.com>
Message-ID: <CAK7LNAROfEi7021v+SkDd=uU1hM_vzuGYvDD6OQ0bJ2Tu0yjvA@mail.gmail.com>
Subject: Re: [PATCH v2 05/14] powerpc: Remove linker flag from KBUILD_AFLAGS
To: Nathan Chancellor <nathan@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, ndesaulniers@google.com, nicolas@fjasle.eu, 
	trix@redhat.com, linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	npiggin@gmail.com, christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 26, 2023 at 11:07 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Thu, Jan 26, 2023 at 10:29:54AM +0900, Masahiro Yamada wrote:
> > On Wed, Jan 25, 2023 at 1:11 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
> > >
> > > Nathan Chancellor <nathan@kernel.org> writes:
> > > > When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
> > > > points out that KBUILD_AFLAGS contains a linker flag, which will be
> > > > used:
> > >
> > > Should that say "unused" ?
> >
> >
> >
> > Nathan, shall I fix it up locally?
> > (it will change the commit hash, though.)
>
> Yes please, if you would not mind. Sorry about that and thank you for
> spotting it Michael!
>
> Since you have to rebase to fix it, you can include Michael's acks?
>
> Cheers,
> Nathan



Done.








-- 
Best Regards
Masahiro Yamada
