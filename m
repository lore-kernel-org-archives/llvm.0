Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51337E
	for <llvm@lists.linux.dev>; Wed, 19 Oct 2022 08:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27250C43470
	for <llvm@lists.linux.dev>; Wed, 19 Oct 2022 08:00:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Z5CKHwzj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1666166412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PxSluxerE6G4fwdeKok18h4vgy1I/qb8uvz6x8nH8TQ=;
	b=Z5CKHwzj4Z/3lBbyHjCGZYmQ52qvbia6hOjFKCccORBqJX4IgNMPCvfB/iTJd1U3AizS0W
	xcD/jmXhGEwG/d/0QslCeUFgmUfnwUVt/nHGJZWE0guCG21C8upQtUmkgDJf/O6cyLLbKR
	coOcu3+mdxf5W3nxfSa4HExtt/c9kiY=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2baaa34a (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
	for <llvm@lists.linux.dev>;
	Wed, 19 Oct 2022 08:00:12 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id i16so6754980uak.1
        for <llvm@lists.linux.dev>; Wed, 19 Oct 2022 01:00:11 -0700 (PDT)
X-Gm-Message-State: ACrzQf0CQAHajjwqbGpBrqVaf9Ynq7ceujIV4qb2dFft4EKqA5TqVniX
	b0bVfd8XFdUHa94po6EaZPZp800K8YbbnkdNHgc=
X-Google-Smtp-Source: AMsMyM5G5WhX8GiS5gNMWGYONMD6c+DaKsq1lwCf49pq8tcrgb6gkhCIMEJiWp9M1B+DeUhS/EZzBUNztaoxRz5otMY=
X-Received: by 2002:ab0:5483:0:b0:3dc:40aa:84cf with SMTP id
 p3-20020ab05483000000b003dc40aa84cfmr1162170uaa.102.1666166410079; Wed, 19
 Oct 2022 01:00:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202210191553.vO9rtKe5-lkp@intel.com> <87pmeol020.fsf@kernel.org>
In-Reply-To: <87pmeol020.fsf@kernel.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 19 Oct 2022 01:59:58 -0600
X-Gmail-Original-Message-ID: <CAHmME9qFKMLJiZa=pg9bnBWHSfbgP-+yimteL_t4sxuepQ6bAg@mail.gmail.com>
Message-ID: <CAHmME9qFKMLJiZa=pg9bnBWHSfbgP-+yimteL_t4sxuepQ6bAg@mail.gmail.com>
Subject: Re: drivers/net/wireless/ralink/rt2x00/rt2800lib.c:9439:15: warning:
 result of comparison of constant -7 with expression of type 'char' is always false
To: Kalle Valo <kvalo@kernel.org>
Cc: kernel test robot <lkp@intel.com>, =?UTF-8?Q?Tomislav_Po=C5=BEega?= <pozega.tomislav@gmail.com>, 
	llvm@lists.linux.dev, kbuild-all@lists.01.org, linux-kernel@vger.kernel.org, 
	Daniel Golle <daniel@makrotopia.org>, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 19, 2022 at 1:55 AM Kalle Valo <kvalo@kernel.org> wrote:
>
> + jason, linux-wireless
>
> kernel test robot <lkp@intel.com> writes:
>
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   aae703b02f92bde9264366c545e87cec451de471
> > commit: dab902fe1d29dc0fa1dccc8d13dc89ffbf633881 wifi: rt2x00: add TX
> > LOFT calibration for MT7620
> > date:   4 weeks ago
> > config: arm64-allmodconfig
> > compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project
> > 791a7ae1ba3efd6bca96338e10ffde557ba83920)
> > reproduce (this is a W=1 build):
> >         wget
> > https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
> > -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install arm64 cross compiling tool for clang build
> >         # apt-get install binutils-aarch64-linux-gnu
> >         #
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=dab902fe1d29dc0fa1dccc8d13dc89ffbf633881
> >         git remote add linus
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> >         git fetch --no-tags linus master
> >         git checkout dab902fe1d29dc0fa1dccc8d13dc89ffbf633881
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1
> > O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/
> > drivers/net/wireless/ralink/rt2x00/ drivers/staging/media/
> >
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> >
> > All warnings (new ones prefixed by >>):
> >
> >>> drivers/net/wireless/ralink/rt2x00/rt2800lib.c:9439:15: warning:
> >> result of comparison of constant -7 with expression of type 'char'
> >> is always false [-Wtautological-constant-out-of-range-compare]
> >            gerr = (gerr < -0x07) ? -0x07 : (gerr > 0x05) ? 0x05 : gerr;
> >                    ~~~~ ^ ~~~~~
> >    drivers/net/wireless/ralink/rt2x00/rt2800lib.c:9443:15: warning: result of comparison of constant -31 with expression of type 'char' is always false [-Wtautological-constant-out-of-range-compare]
> >            perr = (perr < -0x1f) ? -0x1f : (perr > 0x1d) ? 0x1d : perr;
> >                    ~~~~ ^ ~~~~~
> >    2 warnings generated.
>
> I believe this patch should fix it:
>
> https://patchwork.kernel.org/project/linux-wireless/patch/20221018202734.140489-1-Jason@zx2c4.com/
>
> Jason, is my understanding correct?

That's a different bug caused by the same pitfall: assuming char is
signed. I'll send a patch for that function too.

Jason
