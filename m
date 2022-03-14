Received: from gnuweeb.org (gnuweeb.org [51.81.211.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8807C7469
	for <llvm@lists.linux.dev>; Mon, 14 Mar 2022 23:38:39 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	by gnuweeb.org (Postfix) with ESMTPSA id 56F317E310
	for <llvm@lists.linux.dev>; Mon, 14 Mar 2022 23:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gnuweeb.org;
	s=default; t=1647301113;
	bh=wIqQvh6SBH7/sGVClwpwSqfcrSrcjWMeXd2Jqdos78Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SF94SUvS8LJUWE9hy25eQlftDp0lAuo2+vUJFf3uWZwImg4PZ56TeTK8Whi3Zsgpq
	 LTa5pm9Nvr3y3G2Jrm+dX1eECGorxNWssXdOHFOz24MntWpiStPDUsAM2jcgAdTYOr
	 cXHw1zbaSVRzplfbBeEAexhMHYWkZh/UZ72NTFUZoZEXg0ltyb69VcMEHbhqLdWGrA
	 CnSAFUkjCjnCGjuMKDSGj28/Mx8c7vH6DqSw8NMuygo68kDCEd5WhJK+CB+YHrfeLA
	 DXosJw4uhLGQLrlg4AbIaVREjYJf5GUhkCTQtW32bHTRdLd3DKJl/cFh2RJ3AqE376
	 A2OdCZWmaUo4g==
Received: by mail-lf1-f54.google.com with SMTP id s25so29998987lfs.10
        for <llvm@lists.linux.dev>; Mon, 14 Mar 2022 16:38:33 -0700 (PDT)
X-Gm-Message-State: AOAM530feevtQPK2cvK/cisrr4y/TRFEpN1yyB4XisMIlqTiRGCCKsr0
	bG3b1emrg9HyjQHqC4qirOwPM/0NCc3lFSprLVU=
X-Google-Smtp-Source: ABdhPJzjbTe0C+EB0JCEH8nKklBaChHKoWAjB6pm0Yx3tVZK6ZlpNE/YAxy/WZLl0PWZHm/FmYeIcj6s+9bIXMcWQJw=
X-Received: by 2002:a05:6512:3f90:b0:446:6b95:24aa with SMTP id
 x16-20020a0565123f9000b004466b9524aamr15278707lfa.610.1647301111209; Mon, 14
 Mar 2022 16:38:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202203091430.MLY27Bif-lkp@intel.com> <20220309065849.96165-1-alviro.iskandar@gnuweeb.org>
 <Yi+8ft7yXrNN4+Yx@dev-arch.thelio-3990X>
In-Reply-To: <Yi+8ft7yXrNN4+Yx@dev-arch.thelio-3990X>
From: Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>
Date: Tue, 15 Mar 2022 06:38:19 +0700
X-Gmail-Original-Message-ID: <CAOG64qNUd12UaSNYax5tnZh5uOnqjmiiSc9HxTfTEU4w5HPvXA@mail.gmail.com>
Message-ID: <CAOG64qNUd12UaSNYax5tnZh5uOnqjmiiSc9HxTfTEU4w5HPvXA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: atmel: mchp-pdmc: Fix `-Wpointer-bool-conversion` warning
To: Nathan Chancellor <nathan@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, 
	Nugraha <richiisei@gmail.com>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	"GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>, 
	Alviro Iskandar Setiawan <alviro.iskandar@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 15, 2022 at 5:07 AM Nathan Chancellor wrote:
> Hi Alviro,
[...]
>
> I would recommend removing these and just setting those values via git
> send-email flags. In other words:
>
> git send-email --to "..." --cc "..." --cc "..." <path to .patch>
>
> and so on. It can cause a lot of spam if this patch is ever backported
> or needed in other trees.

Fixed.

> > Reported-by: kernel test robot <lkp@intel.com>
> > Link: https://lore.kernel.org/lkml/202203091430.MLY27Bif-lkp@intel.com
> > Fixes: 50291652af5269813baa6024eb0e81b5f0bbb451 ("ASoC: atmel: mchp-pdmc: add PDMC driver")
>
> This should be simplified to:
>
> Fixes: 50291652af52 ("ASoC: atmel: mchp-pdmc: add PDMC driver")
>
> I don't think the automated checkers will complain about that but the
> short form is preferred.

Fixed.

> > Signed-off-by: Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>
>
> Thanks a lot for the patch!
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
> I don't know if those nits are worth resending but I do not see this
> applied to Mark's tree yet. It might have gotten lost because this was
> sent as a reply to the build report, rather than its own thread, which
> has caused issues for me in the past:
>
> https://lore.kernel.org/r/20210903162639.GM4932@sirena.org.uk/
>
> If there is no action on this patch in the next couple of days, please
> consider resending with the above nits addressed with Codrin's tag and
> my tag.

Will address those. Thanks for the review.

-- Viro
