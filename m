Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF1B72
	for <llvm@lists.linux.dev>; Fri, 26 Nov 2021 20:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC58FC9305E
	for <llvm@lists.linux.dev>; Fri, 26 Nov 2021 20:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637957988;
	bh=a0s2gfBWietgKO4JH0PNWWcxxCfP3DUg5GlbyFnS0hs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=E7DmdJOmjwVfimksFXilYgRFugV24ViMgoFEjJi6fTRk53x9ErkXvdAaKISr/VTzn
	 SUZB9Uh+IiEcZqLUNf4W9iO5dk++0sldocgQW9YGwlQZmNEWH56WR1Wu/4WbAX7tO1
	 CmGjTb2UN9uw10GqOpFuhmsOvCrBWbcfT8/xHCYToIosZh2YVeWayxPSqvgesUzouC
	 WCrGwoD964D7ddpv8xShKcGAjsAJYB7H/DndpaCvGZEByp+fRzIpeYb/8uLMnifJAe
	 aTe6pUiqqzQq1nUZ+6QrnEVnpJNOvnyYFXKQ5Sf+IfjveuwDTxhfaNfmfX85tqBISF
	 4oDOLcRNVDOTQ==
Received: by mail-wm1-f50.google.com with SMTP id az34-20020a05600c602200b0033bf8662572so7536918wmb.0
        for <llvm@lists.linux.dev>; Fri, 26 Nov 2021 12:19:48 -0800 (PST)
X-Gm-Message-State: AOAM530FCd6YoK/8mQCwk2Y3idz4pwheUSCy+TNGO+Yu8mLdc7IsG3eJ
	4Y9aigx7G8CKNAU3XS1Qw21f0HaAxUHjyrlVu1w=
X-Google-Smtp-Source: ABdhPJz71/waTta7JgF/geLHgSsIO5CbXPWZ0x5mbSBBYj0q5j8zzOZzGV/JPWNvtUxQCqCYRgc/10cMEUpCWtNsy1s=
X-Received: by 2002:a1c:1c1:: with SMTP id 184mr18302939wmb.1.1637957987118;
 Fri, 26 Nov 2021 12:19:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211126143329.2689618-1-arnd@kernel.org> <CAHmME9rotnZRzqeD43FJmSX6-i2CwvUVpXHrFkLGt+qVVdxK7A@mail.gmail.com>
 <CAK8P3a2KfmmGDbVHULWevB0hv71P2oi2ZCHEAqT=8dQfa0=cqQ@mail.gmail.com> <CAHmME9q3ihG6OukcbhgkzwMUY7y+N3tKrGu2aRHjkgmAv4j=WQ@mail.gmail.com>
In-Reply-To: <CAHmME9q3ihG6OukcbhgkzwMUY7y+N3tKrGu2aRHjkgmAv4j=WQ@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 26 Nov 2021 21:19:31 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1Jk8-mokkzo6Q4M5xoO+13fCgdh-A2bajD9HR7Xenn0w@mail.gmail.com>
Message-ID: <CAK8P3a1Jk8-mokkzo6Q4M5xoO+13fCgdh-A2bajD9HR7Xenn0w@mail.gmail.com>
Subject: Re: [PATCH] crypto: siphash - use _unaligned version by default
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	"David S. Miller" <davem@davemloft.net>, 
	Jean-Philippe Aumasson <jeanphilippe.aumasson@gmail.com>, LKML <linux-kernel@vger.kernel.org>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 26, 2021 at 4:26 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> On Fri, Nov 26, 2021 at 10:18 AM Arnd Bergmann <arnd@kernel.org> wrote:
> > I have not tested this specific patch on all platforms, but I did
> > extensive testing of the get_unaligned()/put_unaligned() helpers
> > in my rewrite earlier this year[1], making sure that these are NOPs
> > on all the important architectures, and that they prevent the use
> > of trapping ldrd/ldm instructions on ARMv6/ARMv7.
>
> If you're confident that the codegen doesn't change for ARMv8 and
> x86{,_64}, then:
>
> Reviewed-by: Jason A. Donenfeld <Jason@zx2c4.com>

Thanks

> We should probably Cc stable@, right?

Yes, I meant to add that but forgot.

> I'm preparing a patchset for DaveM's stable tree today, and I can take
> this in that patchset.

It's not urgent, but I think we need to fix it and get it into stable kernels
at some point. I'm happy with whatever timing works for you.

         Arnd
