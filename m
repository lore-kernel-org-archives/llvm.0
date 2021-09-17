Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971003FC0
	for <llvm@lists.linux.dev>; Fri, 17 Sep 2021 20:34:09 +0000 (UTC)
Received: from mail-wm1-f48.google.com ([209.85.128.48]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MEFfB-1mZH2I2byP-00AB8D for <llvm@lists.linux.dev>; Fri, 17 Sep 2021
 22:34:07 +0200
Received: by mail-wm1-f48.google.com with SMTP id z184-20020a1c7ec1000000b003065f0bc631so10905181wmc.0
        for <llvm@lists.linux.dev>; Fri, 17 Sep 2021 13:34:07 -0700 (PDT)
X-Gm-Message-State: AOAM531xwhOE9qEt7vuwQBGuQESZiQ/II21sRIZSl2CIfxAVjVU7RB9B
	icDV13WC7jFgb1t1yDngVnU6njIHjOINNutSVPk=
X-Google-Smtp-Source: ABdhPJzAbeTYpS2KwNzXeQccqROQ/2kwCIIHTD2x3Zr6TyjGe+VoZM1x0dwFcygbCopM8pJgYBHGbYVc6dFIkJDVR3I=
X-Received: by 2002:a05:600c:190e:: with SMTP id j14mr9029138wmq.35.1631910847126;
 Fri, 17 Sep 2021 13:34:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210830213846.2609349-1-ndesaulniers@google.com> <CAK8P3a2JJ=5t16enn2LaZE_zT1ZqNVyi9FQpTUrgVsQWiMtDkw@mail.gmail.com>
In-Reply-To: <CAK8P3a2JJ=5t16enn2LaZE_zT1ZqNVyi9FQpTUrgVsQWiMtDkw@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 17 Sep 2021 22:33:51 +0200
X-Gmail-Original-Message-ID: <CAK8P3a04ZGgxNf6mmufwOmCY37JJkN9CHDJGQe2wY4CabwafuQ@mail.gmail.com>
Message-ID: <CAK8P3a04ZGgxNf6mmufwOmCY37JJkN9CHDJGQe2wY4CabwafuQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: select HAVE_FUTEX_CMPXCHG
To: Arnd Bergmann <arnd@arndb.de>
Cc: Nick Desaulniers <ndesaulniers@google.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, llvm@lists.linux.dev, 
	Nathan Chancellor <nathan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Linus Walleij <linus.walleij@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	YiFei Zhu <yifeifz2@illinois.edu>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Mike Rapoport <rppt@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:u6qrKmiQKaeR+Oy103+XRHj1UKbxSIAK8aKjBT+UPTjPMqppKgy
 iQQAB2DRVOKUNKoAkvKKcqa2+odRIN6qdHQ3IaDKoqMMB5S+wjQLsq3uXAFSPSa0wtauUdn
 oa6BwB7J9qk52l1HNvT/jrHHzujMNu4eosr1luqoDr6tZPGLyCDHFBUrhnJirS1RObPpST6
 vI8pY6AGJfVKwg6k8K/Vg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0UCKuqECZYQ=:t84cL9gTOIWozbqPy8dwSH
 TvzCzcgt/xuSoOrumZFSuGHRbu8uvVgjPzbPhYHrrvnntszw88pHZK5klseIo3G3580zMhcRk
 armkB2g4sVxibBztXKWlxcDGJIziVjQ7MQmohgaJ36uNxBEKJRHshpnuxhK8sYG5ByejGMKsO
 B0MJgMI5dHlh5BrNObOfUI/nmDRX5XGPxxd5UxJH2cY3mTFsglHV6m3x69XfQzKqWgt3J8U7T
 c2zVSTmpwXBM7BW4szVeihnir41gKh+jUB6cEe6p7p/mO2b+OpwzQ+BG5hqaaOOenx3m7utgk
 1BqHWjgqni09hJ54368VutzfBfusx7autDZK8QTl8xQgIcpNQGaMGcMQKqIRldxdvqq6hX5kT
 VJpy6oBAMVERkn/zRwsBCfhYG9XvSqsEgRHfOYvFzDsk9phT3znGHApqlpCPCLiSX4FIQEMsM
 yRPFsXPziXgn6OshBOwmfaqEC1/PWwbalrLX1tuoJOZM8uy6iPh53kUTNxmm7zgdcT8xUItd5
 6wRnq6JJ2zLMzhUl3V8cuqSFxH9vskBUu98RSKKuGJukz9muZ9/V/v8/gmIOlgmpEdZxgpl0V
 osEjlBfER67Smy7vO5vZM36RrpPsZgDb19sC8Vw5po83aPEwEITMd9l2US0R1gqpz4fcH85sY
 S+7EQc2SdUE1EPXOvTpUYd/fV7huTUv+BbZi4peWEbD/TKxNdvN8HofnOctloiRcHFxlZJegp
 vACrBpXMwsrbCGcD2kYWqbTbNee9Y7+pYO6tf22Y7fsYfUa6mWUT0LuGxOx/6lHAfHfMl96PE
 AiI4h5pyVUAHO5P2pZilCHdKdWcFMvlByDo6CuF2gMSV8x3KNIoP3+fbZTzMC2lg3jw/nykl4
 bjU0E1GcM+bqbfCwU8hg==

On Fri, Sep 17, 2021 at 9:11 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> Nice! I did remember that we had come up with a number of solutions
> for the build error and that at least one of them was an obvious and
> nice fix, but I could never figure out what it was. This is clearly better
> than any of the other ones I had found when I last looked.

Actually it turns out that I had come up with another approach, removing
the need for HAVE_FUTEX_CMPXCHG and the boot time check altogether:

https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/commit/?h=randconfig-5.13&id=7bbd7403526a2a9f398f360fcb97f256052ca6bf

Guo Ren fixed the missing csky bit in there, but since the sparc32 support
is still missing, I never sent this before forgetting about it.
I think the only users of sparc32 these days are LEON CPUs, which have
usable atomics and could implement this properly but support for that was
not upstreamed.

        Arnd
