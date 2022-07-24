Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2203833C3
	for <llvm@lists.linux.dev>; Sun, 24 Jul 2022 14:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B702DC3411E
	for <llvm@lists.linux.dev>; Sun, 24 Jul 2022 14:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658674214;
	bh=kSE8sj2RR+nFsObByXQcCvrd/EFSmfbGc/4RyEOCy2E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MyutaT4EIVYSA9TsYAKl6qIaJCse5SqC5cbClDW8/aLTipB1s2Iyzw0Cye5qAZrEJ
	 h2apl8tAx88eN1AVoOXtQfMSp0NcE+D4gktf5H0kE0c6f+KkNoJOEyylsejE2QRSGf
	 hWUzJ+aTt4Ho02WKxanxyGvCBR2etpZYdXMl/IpphDcu6Xd0TvIy3q5H66KrtOFfaI
	 VdkoPg8D61UgRcZkneTowZ558Rq+zL48DJLVpy9H8BMSYOgnMd48/TN1vaWKxVL6xY
	 zeqRPlmGeZ1atGrBBbAdT7ZNz6L5hNnyjY0N9OArW2it2F+oXbCbxojcOTqDaQtE1F
	 PXDOm9DBGunIg==
Received: by mail-yb1-f174.google.com with SMTP id 6so15754351ybc.8
        for <llvm@lists.linux.dev>; Sun, 24 Jul 2022 07:50:14 -0700 (PDT)
X-Gm-Message-State: AJIora+ZPu2YDPvt70wOMgqPWdV3DmLBq+FV54onqqR3bpAu02Paiv4P
	SB9cCSwo7eDAt37ED/FHunI4qOf2UMPynQnTkzA=
X-Google-Smtp-Source: AGRyM1sVmWEyi/wcyOZN+Do8V3iW8XvxmO6iUP+irWvtN41Fw4eZvriCteDZEONAtPCYrIjTv1jf+aPwAqq47TzmcwI=
X-Received: by 2002:a25:6706:0:b0:670:8d4d:7832 with SMTP id
 b6-20020a256706000000b006708d4d7832mr5932809ybc.106.1658674213836; Sun, 24
 Jul 2022 07:50:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CADVatmN97T7b1JC=4kkG4XS0Lr8+bLSVCuDjfaYcZKq-TpNutA@mail.gmail.com>
 <YtBMNLXEQ4WVJezu@dev-arch.thelio-3990X> <CADVatmNtFYyqk0KwYzB1x6hOPkQ=0gV8mPN1BWp6QWrCs5GaxA@mail.gmail.com>
 <YtrAhG0o/x9B3rDp@dev-arch.thelio-3990X>
In-Reply-To: <YtrAhG0o/x9B3rDp@dev-arch.thelio-3990X>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sun, 24 Jul 2022 16:49:56 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2YjaCpZPJd7xkDuk_NYZNJK1KJRr0AsfRrm=yXRTY0kw@mail.gmail.com>
Message-ID: <CAK8P3a2YjaCpZPJd7xkDuk_NYZNJK1KJRr0AsfRrm=yXRTY0kw@mail.gmail.com>
Subject: Re: help with clang build for mips
To: Nathan Chancellor <nathan@kernel.org>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 22, 2022 at 5:21 PM Nathan Chancellor <nathan@kernel.org> wrote:
> On Fri, Jul 22, 2022 at 02:29:01PM +0100, Sudip Mukherjee wrote:
> > On Thu, Jul 14, 2022 at 6:02 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> The o32 ABI is not supported by LLVM and it sounds like it is unlikely
> to without someone stepping up:
>
> https://github.com/ClangBuiltLinux/linux/issues/884
>
> https://llvm.org/pr38063
>
> There was a patch to disable this on the kernel side but it was never
> picked up due to what I read as a soft NAK:
>
> https://lore.kernel.org/1614838778-3696-1-git-send-email-yangtiezhu@loongson.cn/
>
> https://lore.kernel.org/alpine.DEB.2.21.2103042356150.51127@angie.orcam.me.uk/

I think we can just give up on the combination of clang and mips in
that case, it's
just not worth it. As Maciej said, not supporting 32-bit mode on any modern CPU
is a joke, as most of the remaining mips machines are 32-bit-only, and
many 64-bit
machines run 32-bit code because of memory constraints.

         Arnd
