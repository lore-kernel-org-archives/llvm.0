Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F08120E0
	for <llvm@lists.linux.dev>; Mon, 25 Jul 2022 19:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51C6AC341CD
	for <llvm@lists.linux.dev>; Mon, 25 Jul 2022 19:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658777955;
	bh=D4Ihdgua+l0HAi7W8qDk6GarToM461r2CDrnblJy9VI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tFOF53co3ClMB+rvUjfp/PjXhfuNHiiRGQ2ZUkp5shcsUAxEuooIjcoEWtVvKpCkV
	 8Vmi6mIWpSoFdUUISM9rtT0Kja/gmkeyMvakLJGtcVQUNTnvUvAW0uMPryqeDSe3r0
	 GOvZKWHey0kJNV/Jg6yGdhqq/Meqb3JraR5yezh+KPpldzmIXiQSoxz69LvR81W6JC
	 J7FoN5c2slT+VvipLltCWrEZAHDsB3RSaAj1/6if+Wr+cb+zwn9A7SfM4vx+W0WgnG
	 21dzf8EgPiPN/utv2tn4XkD+K/pLAbqeqiaAoVJ+AO+U5emh6g0gYffXE3ZWzC83Qd
	 E/F8E7JilAISQ==
Received: by mail-ed1-f46.google.com with SMTP id e15so15336722edj.2
        for <llvm@lists.linux.dev>; Mon, 25 Jul 2022 12:39:15 -0700 (PDT)
X-Gm-Message-State: AJIora/fkMnlTa74gVXYuYh+iQ7uOhL9SLw4NTNq9px7iK5Bwf0DIKNQ
	jWdYl6w43tKg1rT6EmFNeD5w5x/ywxOCfpHkjD4=
X-Google-Smtp-Source: AGRyM1tTSMdZKEgPxuibyCdSCrc60peo6eDp6ri26A9PBNJgybVDdwBoqbWM8mUURIw5dt15APKQVAtiX4pw15zi7nY=
X-Received: by 2002:a05:6402:26c2:b0:43b:e542:9f68 with SMTP id
 x2-20020a05640226c200b0043be5429f68mr11319753edd.227.1658777953489; Mon, 25
 Jul 2022 12:39:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CADVatmN97T7b1JC=4kkG4XS0Lr8+bLSVCuDjfaYcZKq-TpNutA@mail.gmail.com>
 <YtBMNLXEQ4WVJezu@dev-arch.thelio-3990X> <CADVatmNtFYyqk0KwYzB1x6hOPkQ=0gV8mPN1BWp6QWrCs5GaxA@mail.gmail.com>
 <YtrAhG0o/x9B3rDp@dev-arch.thelio-3990X> <CAK8P3a2YjaCpZPJd7xkDuk_NYZNJK1KJRr0AsfRrm=yXRTY0kw@mail.gmail.com>
 <Yt6+mxbz0ls+VktG@Ryzen-9-3900X.>
In-Reply-To: <Yt6+mxbz0ls+VktG@Ryzen-9-3900X.>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 25 Jul 2022 21:38:57 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2Ncg3f-D_yJti71t5iOi8JBCRJDJOz+625rpFhv-_ZiQ@mail.gmail.com>
Message-ID: <CAK8P3a2Ncg3f-D_yJti71t5iOi8JBCRJDJOz+625rpFhv-_ZiQ@mail.gmail.com>
Subject: Re: help with clang build for mips
To: Nathan Chancellor <nathan@kernel.org>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 25, 2022 at 6:02 PM Nathan Chancellor <nathan@kernel.org> wrote:
> On Sun, Jul 24, 2022 at 04:49:56PM +0200, Arnd Bergmann wrote:
> >
> > I think we can just give up on the combination of clang and mips in
> > that case, it's
> > just not worth it. As Maciej said, not supporting 32-bit mode on any modern CPU
> > is a joke, as most of the remaining mips machines are 32-bit-only, and
> > many 64-bit
> > machines run 32-bit code because of memory constraints.
>
> Doesn't this configuration only impact 64-bit kernels running 32-bit
> binaries, rather than 64-bit chips running 32-bit kernels (which seems
> to be what your last sentence is concerned with, if I understand you
> correctly)? We can still build and boot some 32-bit MIPS configurations
> in QEMU and I believe Paul Cercueil has clang built kernels running on
> real hardware.

It's the same thing, building 32-bit kernels for 64-bit CPUs fails just
as well:

$ clang --target=mips64-linux -xc /dev/null -o /dev/null  -E
-march=octeon -m32 -mabi=o32
error: ABI 'o32' is not supported on CPU 'octeon'

And it's not like this is tied to code generation at all, the script that
does this just needs the preprocessor macros for a 32-bit environment
in order to generate the compat system call table in the 64-bit kernel.

We could in theory work around this by replacing the -march= flags
with a lookup table that translates each 64-bit CPU to the closest
32-bit CPU that is a direct subset, but this is something the kernel
should not have to do when the clang driver can just do it.

In gcc, these two command lines do the same thing:

$ mips64-linux-gcc -march=mips32r2
$ mips64-linux-gcc -march=mips64r2 -mabi=32

Whereas in clang, one works as expected and the other one throws
an error. The explanation given in the bug report was that it would
be too much work to make llvm generate object code that uses the
64-bit-only instructions but the 32-bit ABI, but this is not what we
need, or what gcc does, we just want the command line to be
interpreted sanely to give 32-bit output, just as it does on x86, powerpc
and s390 when using the -m32 flag to produce 32-bit code.

Note that a compiler that produces object code with 64-bit instructions
but the 32-bit ABI would not even work on 32-bit kernels because the
upper halves of the registers are not saved across context switches.

> Don't get me wrong, of all the architectures that we claim to support,
> MIPS definitely has the weakest support in LLVM, as it is no longer
> being actively developed from what I can see. The couple of crashes I
> have reported have gotten fixed pretty quickly but that is only because
> they were relatively simple. For the more complicated issues, I doubt we
> would have an easy time getting those fixed without more support. Until
> that happens (if it ever does), it probably isn't worth testing MIPS in
> any sort of continuous capacity aside from the few configurations we
> have working already (I test malta_defconfig + the generic 32r*
> configs).

My feeling is more that if nobody can be bothered to implement a
simple command line flag like this one, there is not much hope of them
caring about other bugs either.

         Arnd
