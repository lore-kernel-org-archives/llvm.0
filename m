Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0A820F3
	for <llvm@lists.linux.dev>; Mon, 25 Jul 2022 16:02:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FA9CC341C8;
	Mon, 25 Jul 2022 16:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658764957;
	bh=SMHMCoUk8FoGYD4FUmehAI5iRpDlIiYCqFbZtG+A3Ec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nb31y1vv/6qg8tVtcd4m+mLJ/IQKk4uXakftsDer+tvjGM7a4r65VplqTHM9UHnqe
	 mc8fP6tTiWRClDTSwzqwbdJM3Vdtipp7rgzuT7wfNeZChGNnKbsRe6FNG9MVvyZKDy
	 VHT9J/Mnx+cjya/3chIvN0zLVTtmnvXe2h8o7LQkz0C3SuQ2b+3HNZkmckiDxhrAV7
	 VofkXdL1x1mT8HMUhaI5KdjoBgt/3jsjfryPIv58vQyNK9tg9FW7u9ExLf4Ol7M/Yk
	 9rsZlMYpYmS1WsLeuZvdAHBsWRqu1PVPkdToVBNwnleyOo3xf72ttgZ8vCgRltazB2
	 Y3EVPtCpHRW6Q==
Date: Mon, 25 Jul 2022 09:02:35 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	clang-built-linux <llvm@lists.linux.dev>
Subject: Re: help with clang build for mips
Message-ID: <Yt6+mxbz0ls+VktG@Ryzen-9-3900X.>
References: <CADVatmN97T7b1JC=4kkG4XS0Lr8+bLSVCuDjfaYcZKq-TpNutA@mail.gmail.com>
 <YtBMNLXEQ4WVJezu@dev-arch.thelio-3990X>
 <CADVatmNtFYyqk0KwYzB1x6hOPkQ=0gV8mPN1BWp6QWrCs5GaxA@mail.gmail.com>
 <YtrAhG0o/x9B3rDp@dev-arch.thelio-3990X>
 <CAK8P3a2YjaCpZPJd7xkDuk_NYZNJK1KJRr0AsfRrm=yXRTY0kw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2YjaCpZPJd7xkDuk_NYZNJK1KJRr0AsfRrm=yXRTY0kw@mail.gmail.com>

On Sun, Jul 24, 2022 at 04:49:56PM +0200, Arnd Bergmann wrote:
> On Fri, Jul 22, 2022 at 5:21 PM Nathan Chancellor <nathan@kernel.org> wrote:
> > On Fri, Jul 22, 2022 at 02:29:01PM +0100, Sudip Mukherjee wrote:
> > > On Thu, Jul 14, 2022 at 6:02 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > The o32 ABI is not supported by LLVM and it sounds like it is unlikely
> > to without someone stepping up:
> >
> > https://github.com/ClangBuiltLinux/linux/issues/884
> >
> > https://llvm.org/pr38063
> >
> > There was a patch to disable this on the kernel side but it was never
> > picked up due to what I read as a soft NAK:
> >
> > https://lore.kernel.org/1614838778-3696-1-git-send-email-yangtiezhu@loongson.cn/
> >
> > https://lore.kernel.org/alpine.DEB.2.21.2103042356150.51127@angie.orcam.me.uk/
> 
> I think we can just give up on the combination of clang and mips in
> that case, it's
> just not worth it. As Maciej said, not supporting 32-bit mode on any modern CPU
> is a joke, as most of the remaining mips machines are 32-bit-only, and
> many 64-bit
> machines run 32-bit code because of memory constraints.

Doesn't this configuration only impact 64-bit kernels running 32-bit
binaries, rather than 64-bit chips running 32-bit kernels (which seems
to be what your last sentence is concerned with, if I understand you
correctly)? We can still build and boot some 32-bit MIPS configurations
in QEMU and I believe Paul Cercueil has clang built kernels running on
real hardware.

Don't get me wrong, of all the architectures that we claim to support,
MIPS definitely has the weakest support in LLVM, as it is no longer
being actively developed from what I can see. The couple of crashes I
have reported have gotten fixed pretty quickly but that is only because
they were relatively simple. For the more complicated issues, I doubt we
would have an easy time getting those fixed without more support. Until
that happens (if it ever does), it probably isn't worth testing MIPS in
any sort of continuous capacity aside from the few configurations we
have working already (I test malta_defconfig + the generic 32r*
configs).

Cheers,
Nathan
