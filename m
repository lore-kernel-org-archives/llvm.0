Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E27C2C9C
	for <llvm@lists.linux.dev>; Thu, 16 Dec 2021 03:12:12 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id bk14so34528619oib.7
        for <llvm@lists.linux.dev>; Wed, 15 Dec 2021 19:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OfZS1Njc5yh2bfwwXg5RMSkOxds11+ph3qRszAqv9Pc=;
        b=pPkUkRSWWWMPrzGA2U+Rp+lnG5AJbf7Ru5YJ/j5Fyl6iB67coLnIcNknGaBlmK262W
         fSr5QUbbsSYn0OUpILY9uHrLyhAxUVU6GNFSRb4k4UsdaXDJaA6IQW2MsU7eKXgDcyPw
         Z1zqGfXm2D89wR8Lzt9qh77T0Qd8zI+ucOefnFlvPFfxzS7FwJVQl8SQfk/aLMrDb+UH
         Dmo0nN7jqWZd9dp5SEOoYs30zTN8Rhuap4h4oT8DOLNTFGf00taK9bhtls1zXDe91hja
         C+FNBd5paIyzCcbrgzpWnJ7tCtielYd5DaZcIbh5c3+ixw7LiBMysx8YheNyAmhwjDcX
         rrug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OfZS1Njc5yh2bfwwXg5RMSkOxds11+ph3qRszAqv9Pc=;
        b=DgG4WQmXWXbWYh5RWQGeAsXRL0FgWH9RR2gJGDydJd09oOdjK1HPKJ0TIsTXnuDaER
         cxaPVF0YXbz9QizZGd+wrDmBsEoeX6jmkQYc5zD47dV5UvUEWxyHu2k17DHlvXcAOfwB
         +DH5AsUmG/+9KtVMMjZHqS5k31b4v0oxRCXfldWMW05xDydIVoR1ETsFRcP0mfZCgcYb
         qQFdNzyDbwmxaQvXak7MH7Lml/fDJc5uipCmOpTcpAtcITUNGaBFr1DFCgNOxkDrYdJE
         gYRmjKHnfgSIN9bJ0DW/Vy5guhZeK6hLeKegWT79Dr4nOaiNqDitG10OjmJPPXcZNsta
         kyrQ==
X-Gm-Message-State: AOAM5301Rvg4dI79xaZWUEG5XqUxfoXu2OsttXS0ayJygZyF+stqPWlh
	WuMACq6aW5JqH2pAQqq2CBChxWW6tmd+7KrJ5OvZ9w==
X-Google-Smtp-Source: ABdhPJyX1OXymKbWNBsIE1E8AupgYn3qxOT6wxKG0eN0/chi0YZ7SfZ2WvEkeGPr+hCpX84UDhL/q3CJaSPAmEDm1yU=
X-Received: by 2002:aca:120f:: with SMTP id 15mr2596471ois.132.1639624331477;
 Wed, 15 Dec 2021 19:12:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202112142208.QW0tVv0m-lkp@intel.com> <YbjlV4HdWI8WUcAR@archlinux-ax161>
In-Reply-To: <YbjlV4HdWI8WUcAR@archlinux-ax161>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Dec 2021 04:12:00 +0100
Message-ID: <CACRpkdaBE-wyhiekdW9WtO=zdpDqjZuT7DqqsT2kWzeDGepivQ@mail.gmail.com>
Subject: Re: drivers/pinctrl/bcm/pinctrl-bcm2835.c:412:14: warning: variable
 'group' is used uninitialized whenever 'for' loop exits because its condition
 is false
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Jason Wang <wangborong@cdjrlc.com>, llvm@lists.linux.dev, 
	kbuild-all@lists.01.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 14, 2021 at 7:41 PM Nathan Chancellor <nathan@kernel.org> wrote:
> On Tue, Dec 14, 2021 at 10:44:28PM +0800, kernel test robot wrote:
> > Hi Jason,
> >
> > FYI, the error/warning still remains.
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   5472f14a37421d1bca3dddf33cabd3bd6dbefbbc
> > commit: 29d45a642d4ea8de7e89b57f856046df7c3b219f pinctrl: bcm2835: Replace BUG with BUG_ON
> > date:   5 months ago
> > config: mips-randconfig-c004-20211214 (https://download.01.org/0day-ci/archive/20211214/202112142208.QW0tVv0m-lkp@intel.com/config)
> > compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2ddb6c8ac29412b1361810972e15221fa021c)
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install mips cross compiling tool for clang build
> >         # apt-get install binutils-mips-linux-gnu
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=29d45a642d4ea8de7e89b57f856046df7c3b219f
> >         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> >         git fetch --no-tags linus master
> >         git checkout 29d45a642d4ea8de7e89b57f856046df7c3b219f
> >         # save the config file to linux build tree
> >         mkdir build_dir
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/pinctrl/bcm/
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All warnings (new ones prefixed by >>):
> >
> > >> drivers/pinctrl/bcm/pinctrl-bcm2835.c:412:14: warning: variable 'group' is used uninitialized whenever 'for' loop exits because its condition is false [-Wsometimes-uninitialized]
> >            for (i = 0; i < BCM2835_NUM_IRQS; i++) {
> >                        ^~~~~~~~~~~~~~~~~~~~
> >    drivers/pinctrl/bcm/pinctrl-bcm2835.c:423:10: note: uninitialized use occurs here
> >            switch (group) {
> >                    ^~~~~
> >    drivers/pinctrl/bcm/pinctrl-bcm2835.c:412:14: note: remove the condition if it is always true
> >            for (i = 0; i < BCM2835_NUM_IRQS; i++) {
> >                        ^~~~~~~~~~~~~~~~~~~~
> >    drivers/pinctrl/bcm/pinctrl-bcm2835.c:409:11: note: initialize the variable 'group' to silence this warning
> >            int group;
> >                     ^
> >                      = 0
> >    1 warning generated.
>
> It seems like MIP's __BUG_ON() makes it harder for clang to figure out
> that 'i == BCM2835_NUM_IRQS' will make the kernel panic, which is the
> only way that the loop exits because the condition is false.
>
> I am not really sure of a way to fix this other than just reverting that
> change or changing the BUG_ON() to WARN_ON().

We can also just ignore the test robot like any invalid
review comment.

The maintainer of this driver can decide, if it's up to me I'd
just ignore it.

Yours,
Linus Walleij
