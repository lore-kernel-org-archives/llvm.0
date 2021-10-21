Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8869A29CA
	for <llvm@lists.linux.dev>; Thu, 21 Oct 2021 07:20:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2EA9760F9F
	for <llvm@lists.linux.dev>; Thu, 21 Oct 2021 07:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634800808;
	bh=43pO5T59WNNBTSvDZ/15HN0qNsYc6BB2mYcutQPQZb8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qZP8Wqy8lCgm9a+nKCbcfyHPOmEg3+15OtkUCE3DxCGYuYryfaUirXhVm2V3a8hOI
	 1WS4O0ynItYO1us2GdYv0lkmFKSFZUTC0et7YKyf7wFUjfrugVBWZGbjbaqP8NGqBz
	 o82zKA8WlbVSb3tf+iIpAgeUWBZhwdUyeriOgmTfHxkgUL4t/KhjHlt5efUIhoV159
	 QWZcE1lL+RaAZKvcaWRiSvrwwEN8XaIjetyHj3u9rLqnhvYvxpGvQb5KedTCj2Vijm
	 UCyBgNsx2y9dxhBwyiNaWTrgwszFi3n0wSBYTrRk+k7AILaMNV5o0XEqZais9FWMac
	 podF1KzE4BdAA==
Received: by mail-wm1-f48.google.com with SMTP id g39so17760678wmp.3
        for <llvm@lists.linux.dev>; Thu, 21 Oct 2021 00:20:08 -0700 (PDT)
X-Gm-Message-State: AOAM530gt/h5afKqyqsyq1NUd64flmnkNlcZoX4MAUR5pxtKJvFjpAQi
	CtmUSP4Zh+6eCQRfliLKhp4oxrvDrvGn6Ig8NOI=
X-Google-Smtp-Source: ABdhPJw/z58fZLDJTbPf9HpyiDZ54iUJbEkQ5PNF/R2XdWkDlPbJwN5mSyp4ngOeqZsP6n0kxAo5a9Zj4ZQ70Y91Lvg=
X-Received: by 2002:a05:600c:4f42:: with SMTP id m2mr19235671wmq.82.1634800806678;
 Thu, 21 Oct 2021 00:20:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202110051030.J3Ub7djT-lkp@intel.com> <CAK8P3a3uOV=AMmOTP09rBhyq2zJutDJiof-4uQ-7MbX9xyVivg@mail.gmail.com>
 <CAMj1kXHem8-qpNswtRcEKErncpO65JpQJQL3-8k_-qzUm4S4_Q@mail.gmail.com>
In-Reply-To: <CAMj1kXHem8-qpNswtRcEKErncpO65JpQJQL3-8k_-qzUm4S4_Q@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 21 Oct 2021 09:19:49 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1yRTcRgVD_o7YCwKckePPPcy9Btneh6TC1b_ThUzkmtg@mail.gmail.com>
Message-ID: <CAK8P3a1yRTcRgVD_o7YCwKckePPPcy9Btneh6TC1b_ThUzkmtg@mail.gmail.com>
Subject: Re: [ardb:arm-vmap-stacks 5/20] arch/arm/mm/context.c:112:28: error:
 no member named 'task' in 'struct thread_info'
To: Ard Biesheuvel <ardb@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Keith Packard <keithpac@amazon.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 21, 2021 at 9:02 AM Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Thu, 21 Oct 2021 at 08:55, Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > On Tue, Oct 5, 2021 at 4:03 AM kernel test robot <lkp@intel.com> wrote:
> > >
> >
> > > All errors (new ones prefixed by >>):
> > >
> > > >> arch/arm/mm/context.c:112:28: error: no member named 'task' in 'struct thread_info'
> > >            pid = task_pid_nr(thread->task) << ASID_BITS;
> > >                              ~~~~~~  ^
> > >    1 error generated.
> >
> > I ran into this as well on my randconfig builds, though it happens very rarely.
> >
> > Apparently CONFIG_THREAD_INFO_IN_TASK is incompatible with
> > CONFIG_PID_IN_CONTEXTIDR, but should be easy to fix by changing that
> > one line to do the right thing.
> >
>
> None of the existing configs enable that, so that is why I never saw
> this even with all the kernelci coverage.

Right, I have no idea what makes this configuration so rare, it took me
hundreds of randconfig builds before I first ran into it.

          Arnd
