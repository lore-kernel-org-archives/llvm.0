Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EF27C
	for <llvm@lists.linux.dev>; Mon, 28 Feb 2022 15:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE27DC340F4
	for <llvm@lists.linux.dev>; Mon, 28 Feb 2022 15:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646062897;
	bh=kUHj0dIOXGHqtRWBFs95OAMPTNPiain1rxD1sCE0X+o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RPL8O27wy227IH6hDihlMeTKAdbi9LQDnLtlsiiouWp4R1IzvBA8ofH2xN7GASBr9
	 IttqVHeMJMNAncDEmvWOiWGLhYi0Lb3g77NPL1xxvEdmfT/kwBSMayvVYzRnlTF7Qr
	 +V8WFqryXaLG797SYz0zkSm+ND1hQgo2Goswh5KNVLr9d325z8wCUmMxvkxnF1CmIk
	 JMjCdqwAudTgRYBh02xfXRa+8wcG3TgLLsNdmjkzm/P8TMa8TXU6hneRUiL5ux/TwR
	 VVvvRysT4HBDbCaCyUHh3cFjjFr8D3bVprN275xSp8FTVT352BkWuKTSQZmH1MQ/fu
	 qvHfr8aeyJbiw==
Received: by mail-wm1-f41.google.com with SMTP id p184-20020a1c29c1000000b0037f76d8b484so6292152wmp.5
        for <llvm@lists.linux.dev>; Mon, 28 Feb 2022 07:41:37 -0800 (PST)
X-Gm-Message-State: AOAM533K+lIolg/bzat/4B7bMLmCXba9AldeDejZTe3B8xNSYiPEcxUW
	lXh8HXgutp5JgczCEXO6kGekeVlpDKELbSSQKwg=
X-Google-Smtp-Source: ABdhPJxISiZ41KAtSIiPPfznP2BMAZANGGomoQBB+i3Aqrew6fpEKZrCd96CMlxa7yjxEx4ZivbdLNGkQjrtoXzO9Ak=
X-Received: by 2002:a05:600c:4f8e:b0:381:6de4:fccc with SMTP id
 n14-20020a05600c4f8e00b003816de4fcccmr3161768wmq.82.1646062895799; Mon, 28
 Feb 2022 07:41:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220228152658.3367506-1-arnd@kernel.org> <b8eb2e55-b5a8-4a39-86cb-93cadbd67922@conchuod.ie>
In-Reply-To: <b8eb2e55-b5a8-4a39-86cb-93cadbd67922@conchuod.ie>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 28 Feb 2022 16:41:19 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1NWuoHVWXVZUGJxSg=D0d3umrMzWqZ75devfOwO-JhuQ@mail.gmail.com>
Message-ID: <CAK8P3a1NWuoHVWXVZUGJxSg=D0d3umrMzWqZ75devfOwO-JhuQ@mail.gmail.com>
Subject: Re: [PATCH] SoC: polarfire: fix build warning
To: Conor Dooley <mail@conchuod.ie>
Cc: Lewis Hanly <lewis.hanly@microchip.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Arnd Bergmann <arnd@arndb.de>, 
	kernel test robot <lkp@intel.com>, Jassi Brar <jaswinder.singh@linaro.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 28, 2022 at 4:35 PM Conor Dooley <mail@conchuod.ie> wrote:
>
> I had sent a fix for the build warning on saturday morning - but I guess
> you missed it.
>
> Thanks for fixing it anyway :)

Thank you for your quick reply. I had indeed missed that fix. You did the
right thing here by sending it to Nicolas, but he hasn't had a chance to forward
it to soc@kernel.org yet, so it was not visible in patchwork.

As it turns out, your patch is correct and mine was wrong anyway, so I
have now replaced my patch with yours.

Nicolas, I hope that doesn't cause you extra work. If you have picked it
up into your tree, you can drop it again from there.

          Arnd
