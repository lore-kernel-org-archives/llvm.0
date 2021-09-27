Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E3672
	for <llvm@lists.linux.dev>; Mon, 27 Sep 2021 18:32:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D711A60FED
	for <llvm@lists.linux.dev>; Mon, 27 Sep 2021 18:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632767549;
	bh=Z3UO9nj32fEK6vQVolbZguKJlD1p5STFHKPBJv3KJQg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dZh2RYayA7LxaAeJOuCNwWxrMprjpDk4E9Kxod1a5ehMCtGSzGFFn/zWwN+GNCy35
	 8ylpMLg9jzIenrcNrPRVfv4X0E3dBiwkc7VM/WGT0NN6YRBGsRBwW3f2JoMl3VAupX
	 EaRSvl0aMT2PiD6pfkIA98057Cvdnz7ILruLZ/uG/+yDooq+N738+k3ljmf0ZoT9uI
	 46DTQdhYe91oiuBBO2sbTbqbsQErzpFyMQBSF4a7I2X80yDixbJnKuiahkzls/ggqh
	 44JsUn1Dxbia7XMStiw2IyOUsT1F3E8jn+5yW9RnPtHP4aYYC7KQzWddpn51GuOd74
	 sSMgU/z70KD9A==
Received: by mail-wm1-f49.google.com with SMTP id r11-20020a1c440b000000b0030cf0f01fbaso505397wma.1
        for <llvm@lists.linux.dev>; Mon, 27 Sep 2021 11:32:29 -0700 (PDT)
X-Gm-Message-State: AOAM532Y+6fJD3tic1Jn+uGkGYHPH6y2kQAGMb3QqoLve8cZSBvljAWD
	q1VQWAgVNMRsZzYk3j3W359OhULvdRuGbEgsPaQ=
X-Google-Smtp-Source: ABdhPJy81F3lD3pHEB3YQPHgcm0Zno3w7mltEvGPEoJki55dOCAfbC+vGxFRTJKJjSZmwgl481WWFreaqH8Z3nBcUo8=
X-Received: by 2002:a1c:2357:: with SMTP id j84mr551126wmj.1.1632767548383;
 Mon, 27 Sep 2021 11:32:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210927125007.1581919-1-arnd@kernel.org> <YVHE1qclD6ZyjvvD@chrisdown.name>
 <20210927122138.56cb1d8e@oasis.local.home>
In-Reply-To: <20210927122138.56cb1d8e@oasis.local.home>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 27 Sep 2021 20:32:12 +0200
X-Gmail-Original-Message-ID: <CAK8P3a264UGrqV648i3v_z_MciRO+eYN8f9RhJL9ksDuKVdAkg@mail.gmail.com>
Message-ID: <CAK8P3a264UGrqV648i3v_z_MciRO+eYN8f9RhJL9ksDuKVdAkg@mail.gmail.com>
Subject: Re: [PATCH] printk: avoid -Wsometimes-uninitialized warning
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Chris Down <chris@chrisdown.name>, Petr Mladek <pmladek@suse.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Jessica Yu <jeyu@kernel.org>, Arnd Bergmann <arnd@arndb.de>, John Ogness <john.ogness@linutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	YueHaibing <yuehaibing@huawei.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 27, 2021 at 6:21 PM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Mon, 27 Sep 2021 14:19:18 +0100
> Chris Down <chris@chrisdown.name> wrote:
>
> > Having IS_ENABLED and then an #ifdef seems to hurt code readability to me.
>
> I agree.
>
> Would this be a better solution?

Sounds good, I'll follow up with that version after the next round of randconfig
builds.

Thanks,

      Arnd
