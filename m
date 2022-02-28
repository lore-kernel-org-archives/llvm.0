Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A875D513F;
	Mon, 28 Feb 2022 08:11:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B3BAC36AEA;
	Mon, 28 Feb 2022 08:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646035894;
	bh=DljB/ws5J9Owyl5yds3GZxgK+VN9CcGAOjBMjtsvHLY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lUHl1zVGtsG7blAH/F0UTToBcop4tD/U31a16Z8iFIbr3Yz3NZyMMruEmqnjff4ZV
	 sOXR4ep1bZSZFP0thZxfJu86f2z6+1scEBxEdmX2MzzbIbTJIcJ58A29zDedh4boJZ
	 xAOME5veJRutesYxFUwWk5sQ+QrLNYM/TVXnCtonVD/qOrj4pXJn2RS2GVaVmp52BQ
	 5iwZQ45A8fmgwsj70jPmE+MF5yxYndWMbRpKn6LVhUyC6bqg4uPpX27ECqsMIMGs2u
	 XUwEuPOV78DTReq/jMwlT/mX0z/iDJpT5zge+xiLD8/j5HMuuicA5nzcXCsD/SOF5J
	 RTmRglaDYVWmw==
Received: by mail-wm1-f50.google.com with SMTP id e6-20020a05600c4e4600b0038173851f5eso612193wmq.2;
        Mon, 28 Feb 2022 00:11:34 -0800 (PST)
X-Gm-Message-State: AOAM532wguLDoO12eqLdBUijRWL08tC40ljt63APlSTNgWlAgj0Lband
	tB3XIOsVJec2jDwAHVhOTSHzWm5+dKhxvapnKFI=
X-Google-Smtp-Source: ABdhPJwcMEK5ybaUtjnn+nhdYBsBMcvPLAK49eN6lkpL2rzIto/bB9bCpNQVYXjU55YpRRxY6tLnPO6gmy6I0G+qdwc=
X-Received: by 2002:a05:600c:3b87:b0:381:428c:24c1 with SMTP id
 n7-20020a05600c3b8700b00381428c24c1mr8612916wms.1.1646035892684; Mon, 28 Feb
 2022 00:11:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220227215408.3180023-1-arnd@kernel.org> <dd41c574-05b0-23bc-646c-0bd341e6e50b@linaro.org>
In-Reply-To: <dd41c574-05b0-23bc-646c-0bd341e6e50b@linaro.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 28 Feb 2022 09:11:16 +0100
X-Gmail-Original-Message-ID: <CAK8P3a05aLS1sgQdeUDN6LD3oS0khZh07pyEO9LhUC5CJHN-Kg@mail.gmail.com>
Message-ID: <CAK8P3a05aLS1sgQdeUDN6LD3oS0khZh07pyEO9LhUC5CJHN-Kg@mail.gmail.com>
Subject: Re: [greybus-dev] [PATCH] Kbuild: remove -std=gnu89 from compiler arguments
To: Alex Elder <elder@linaro.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	llvm@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>, 
	Federico Vaga <federico.vaga@vaga.pv.it>, Alex Shi <alexs@kernel.org>, 
	Hu Haowen <src.res@email.cn>, Michal Marek <michal.lkml@markovi.net>, 
	Nick Desaulniers <ndesaulniers@google.com>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc-tw-discuss@lists.sourceforge.net, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Intel Graphics <intel-gfx@lists.freedesktop.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, linux-btrfs <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 28, 2022 at 12:04 AM Alex Elder <elder@linaro.org> wrote:
> On 2/27/22 3:52 PM, Arnd Bergmann wrote: From: Arnd Bergmann <arnd@arndb.de>

> > I put the suggestion into patch form, based on what we discussed
> > in the thread.  I only gave it minimal testing, but it would
> > be good to have it in linux-next if we want to do this in the
> > merge window.
>
> Did you determine what needed the new compiler flag based on
> compilation results?
>
> Glancing at the Greybus code, I don't believe there's any
> reason it needs to shift a negative value.  Such warnings
> could be fixed by making certain variables unsigned, for
> example.
>
> I have no objection, I'll just make a note of it.

I've clarified in the changelog that I'm adding the -Wno-shift-negative-value
everywhere that -Wextra is used, not because I saw actual warnings
for greybus and btrfs. The -Wextra is copied from scripts/Makefile.extrawarn,
so this keeps it in sync. Ideally we should have an easier way for a
subdirectory to get the W=1 flags without copying the list, but the
patch I started to do this never got close to getting integrated.

         Arnd
