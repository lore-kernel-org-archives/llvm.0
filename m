Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722942F26
	for <llvm@lists.linux.dev>; Wed,  2 Feb 2022 08:12:26 +0000 (UTC)
Received: from mail-ot1-f41.google.com ([209.85.210.41]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Moewz-1mQvcf06RN-00p5VU for <llvm@lists.linux.dev>; Wed, 02 Feb 2022
 09:12:24 +0100
Received: by mail-ot1-f41.google.com with SMTP id j38-20020a9d1926000000b0059fa6de6c71so18708711ota.10
        for <llvm@lists.linux.dev>; Wed, 02 Feb 2022 00:12:23 -0800 (PST)
X-Gm-Message-State: AOAM530eMQTsvyflqVc72HwCL/kG5Ps822HTO0fs9PVdT6XmYUDuuGq8
	ZCTFVeqsS/DmVqUU1av25kQR92rCGs4XJaZLiZo=
X-Google-Smtp-Source: ABdhPJyEFkk72bdUObGJgIJxLDuxts5d7uWNZdnao0zPMQMtv0LI7rheA2HGG79b1fevO/Ddwrj5pRSA5+k2nVrxNQw=
X-Received: by 2002:a9d:654f:: with SMTP id q15mr16551925otl.119.1643789542701;
 Wed, 02 Feb 2022 00:12:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220201232229.2992968-1-nathan@kernel.org>
In-Reply-To: <20220201232229.2992968-1-nathan@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 2 Feb 2022 09:12:06 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2Y8nQ55sycxbpfN=71BNO9wuEDt=Q24ELS_u_WNRpqZw@mail.gmail.com>
Message-ID: <CAK8P3a2Y8nQ55sycxbpfN=71BNO9wuEDt=Q24ELS_u_WNRpqZw@mail.gmail.com>
Subject: Re: [PATCH] Makefile.extrawarn: Move -Wunaligned-access to W=2
To: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	"# 3.4.x" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:b7hQoI0J+APvU6Z7XiUMl63bCAC1QkQG2wuAHl0EK7fJqCpC9S/
 In+ImaeLbGcHPhuI+VT0Y9jIRfakLAsYz1rrfS38OLDCfuT+DNGmxsnspEh6/0msbzoH5Aa
 e7kDPTKvtaMFXmPqkzfR5DR+ssGJFjumpMJCdgT+isZx2asKOG5xj/MJsruSOuRnCAD70XV
 2qRZs7gEmyp8EJ3uEvZ1Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:feVCQKz5G8Y=:6S370ezdqEH3uafMLE0l5M
 w/fmhPpXILvN+tNzxpQ6cN6idlLIJbv9EjJOVUgBTbKLjXhKkOpIPEgLmVtIVN71X6q7iQmB3
 mdifI8bKu3xJ4ZNXySj9sNHpsFx310s8gVd+jBiA35e2TvBZ6P08sSbK/uufY9qti9EFKpY0K
 SbizmFx9ETVkKGsFZTPqKbnnc/UlLCK7ZNh8//AXOPlssfqGEPLhmWC6mvMdRDCz0EWAy5iPt
 8FATH0slTwJCg6CIr9bw6TwHIQT+U5s+fEnKKlSOyPF6mUYLCIdUD+PFbsvTNEiy7KJxwwQu/
 /XsH1spoR6HkOvuu8Hwzhj3Jw3ll2dGJUMnbMMyU6y0gwNq4lSB4c5kXDM9KjgeJzDLyZqM/b
 SKo20wGVsubQ7K60NjWnyLOrl+TPN83kKBsHWN4IjE0pTsksEB+89xTzUW5dzwhDXL7swelVg
 SZU9IYkOvXIgqqmiOS3DtH/58mSezkfI3QTW2Z+vdK1hJuSRqCrX89YduQwMr4v3rBKV3LoWE
 I7h49w65IoAEcS3j4iBez80Zu6Cr1HQyxryw2ct3iCuNANZYkQgugmd/P/wAh6XPAowFIPn0i
 e7V5OnkmHLM8X4PWf0BwlimuEKmnllF4jTHE3A43ysvdknTTrXtouBtqQjNB1fnr1fFpfcZYO
 M+Z91DGcRgakora9y3Jbp9g5R8IW0s7MizW6qa+wt9b38Hx0kWAtiivWJLVgteaiGxjzMQSvY
 GPiBcXPzZGz3HhfF2M7vPYmuKf7O7dQB3zecUYhb8izOXFO0L3vUTBzHihysDhqIzRmlo0GZp
 d6vB3y21WWuTUdACRlVaY/PPZyuvqu5Xvk5K1Ap1XtzFRUmB9Y=

On Wed, Feb 2, 2022 at 12:22 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> -Wunaligned-access is a new warning in clang that is default enabled for
> arm and arm64 under certain circumstances within the clang frontend (see
> LLVM commit below). Under an ARCH=arm allmodconfig, there are
> 1284 total/70 unique instances of this warning (most of the instances
> are in header files), which is quite noisy.
>
> To keep the build green through CONFIG_WERROR, only allow this warning
> with W=2, which seems appropriate according to its description:
> "warnings which occur quite often but may still be relevant".
>
> This intentionally does not use the -Wno-... + -W... pattern that the
> rest of the Makefile does because this warning is not enabled for
> anything other than certain arm and arm64 configurations within clang so
> it should only be "not disabled", rather than explicitly enabled, so
> that other architectures are not disturbed by the warning.
>
> Cc: stable@vger.kernel.org
> Link: https://github.com/llvm/llvm-project/commit/35737df4dcd28534bd3090157c224c19b501278a
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

The warning seems important enough to be considered for W=1 on 32-bit arm,
otherwise the chances of anyone actually fixing drivers for it is
relatively slim.
Can you point post the (sufficiently trimmed) output that you get with
the warning
enabled in an allmodconfig build?

I'm not sure why this is enabled by default for arm64, which does not have
the problem with fixup handlers.

       Arnd
