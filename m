Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3782C8B
	for <llvm@lists.linux.dev>; Thu, 21 Oct 2021 07:02:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD4F660E76
	for <llvm@lists.linux.dev>; Thu, 21 Oct 2021 07:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634799764;
	bh=N9e50nuGo9dSlul8hisBaWU2MocV5pjunVpoO9qay7E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JVbYV5yaOD1l+L4/Q4dYLTvdACbOH0039wVQIwg9X5hDmjxctc+CnLrsB3Q3aeCfK
	 uw/hh57wW2fvzaQIarNnC+KJ9rOJsEEzL+wjBm2vEmjTESoOv58HgGrObi0x1ywxvE
	 Kknneu54qtxoYyZ8lmh2O2WuRmaFP+Ieg+SLTOYTTdCulTyRLmt2uwyfB19J/wEyxC
	 p8wfvwG5EdAt1Np3vybY77kyED3YiaQmnZLnYh8N+4xspBKd4lQMgaGNelbzDbW9Jb
	 mdEJ8hxCJ0mIFJEuyvPC4YcH3EKolSYPvMIy8zHN0B4tPvGM3WpmBV73x+LyQg1VvE
	 RH85UtXHFzR9Q==
Received: by mail-oi1-f178.google.com with SMTP id q129so12714840oib.0
        for <llvm@lists.linux.dev>; Thu, 21 Oct 2021 00:02:44 -0700 (PDT)
X-Gm-Message-State: AOAM531MSOGq/Lf5XZTb6skfDbtZOUrLmW5Rf8b4CBj5/CLENufdsY8q
	/93iIsyqp9syKySUeQFLyVo1G7sZNCysGHVEC70=
X-Google-Smtp-Source: ABdhPJwVwdSM2DTKCeM6BAPs5VX1qV2yThkHPYhwqe1jU0c3k6dzi9ulQUHRzIKTwb3+xBoR5e3pMSC1PHg0buy6vFk=
X-Received: by 2002:aca:4bc4:: with SMTP id y187mr2922485oia.174.1634799764139;
 Thu, 21 Oct 2021 00:02:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202110051030.J3Ub7djT-lkp@intel.com> <CAK8P3a3uOV=AMmOTP09rBhyq2zJutDJiof-4uQ-7MbX9xyVivg@mail.gmail.com>
In-Reply-To: <CAK8P3a3uOV=AMmOTP09rBhyq2zJutDJiof-4uQ-7MbX9xyVivg@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 21 Oct 2021 09:02:32 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHem8-qpNswtRcEKErncpO65JpQJQL3-8k_-qzUm4S4_Q@mail.gmail.com>
Message-ID: <CAMj1kXHem8-qpNswtRcEKErncpO65JpQJQL3-8k_-qzUm4S4_Q@mail.gmail.com>
Subject: Re: [ardb:arm-vmap-stacks 5/20] arch/arm/mm/context.c:112:28: error:
 no member named 'task' in 'struct thread_info'
To: Arnd Bergmann <arnd@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Keith Packard <keithpac@amazon.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Oct 2021 at 08:55, Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Tue, Oct 5, 2021 at 4:03 AM kernel test robot <lkp@intel.com> wrote:
> >
>
> > All errors (new ones prefixed by >>):
> >
> > >> arch/arm/mm/context.c:112:28: error: no member named 'task' in 'struct thread_info'
> >            pid = task_pid_nr(thread->task) << ASID_BITS;
> >                              ~~~~~~  ^
> >    1 error generated.
>
> I ran into this as well on my randconfig builds, though it happens very rarely.
>
> Apparently CONFIG_THREAD_INFO_IN_TASK is incompatible with
> CONFIG_PID_IN_CONTEXTIDR, but should be easy to fix by changing that
> one line to do the right thing.
>

None of the existing configs enable that, so that is why I never saw
this even with all the kernelci coverage.

I'll send a patch to fix this.
