Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7812C80
	for <llvm@lists.linux.dev>; Fri, 26 Nov 2021 13:59:47 +0000 (UTC)
Received: from mail-wm1-f49.google.com ([209.85.128.49]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MqatK-1mCrAX47Rg-00mfUy for <llvm@lists.linux.dev>; Fri, 26 Nov 2021
 14:59:46 +0100
Received: by mail-wm1-f49.google.com with SMTP id j140-20020a1c2392000000b003399ae48f58so10779976wmj.5
        for <llvm@lists.linux.dev>; Fri, 26 Nov 2021 05:59:45 -0800 (PST)
X-Gm-Message-State: AOAM531qi3U2h8qfL79aOTKFRCTgPZ9Tq704GpB4GuepbFB4TV4qafHW
	0eN7gJJQL8dTHLEKHXM+uXGzi5wIC45QFMc0zaE=
X-Google-Smtp-Source: ABdhPJwLo2gvIaV7a7BIVtCOjM0MfS2JQcBHF9YHLbK8BZai46KYcznJM7hhcadb89FUv1DDYSJlNeq22biIjPHaGvA=
X-Received: by 2002:a05:600c:6d2:: with SMTP id b18mr15934623wmn.98.1637935185632;
 Fri, 26 Nov 2021 05:59:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211125154406.470082-1-anders.roxell@linaro.org> <6b1e51a8-2f4d-2024-df90-a35c926d7a30@csgroup.eu>
In-Reply-To: <6b1e51a8-2f4d-2024-df90-a35c926d7a30@csgroup.eu>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 26 Nov 2021 14:59:29 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0n_n+PnfYmAdS9923yheLqYXRp8=65hKf9abLCRAX8ig@mail.gmail.com>
Message-ID: <CAK8P3a0n_n+PnfYmAdS9923yheLqYXRp8=65hKf9abLCRAX8ig@mail.gmail.com>
Subject: Re: [PATCH] powerpc: mm: radix_tlb: rearrange the if-else block
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Anders Roxell <anders.roxell@linaro.org>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, 
	Arnd Bergmann <arnd@arndb.de>, llvm@lists.linux.dev, 
	Nick Desaulniers <ndesaulniers@google.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:v+5riThGSZl64zUlaVdGhTmyDES+I4/qPWOCoo+k06CmtG332vU
 ZHEdKhPhIpGrnyXwU4WLvU4iFqyH2kIl4YTbW+tqXXvVSDDrpY48XABdIzznOv9yUGDDlvV
 ovzz3FDywafamvilo2HFZ1M+FjMw9GF3XVmGuYqQrUZlXGUnz+e4HPYPnEE8dxeZEqQ/FjV
 1wKlvocaFpIaB6MBMzBng==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:IryqBhuadRo=:OpCJI5HW58P2VqQJbJEXd3
 Yw6gS88vjLmvk8EELC07BVTc88VyhUAmxJSOfffNsbhkcaF5k1HlB5/tlZjDaP+p67hAH2SXT
 xvPlisGQCyEcXm0jj/A9BH376bknMCtDO1cpExCaccTzZ4VxfZNElQ9h4rzS1vxQVwqL2pwgH
 4C5SmyDyAaWFzJ6Xhrri56RO001Kj5YBdiNl3/zPqlLe9bjE0+iadBxyVSHzjsPpj1zgP5atT
 HlkRpIgBP1sRGOOHE+y9rbyRM1Jt92yfj8xxf5E/IlRHYIqgYqDkPAhQLc5nvf4GLK1aimAVt
 j0T1NvRjx3+sSPDq8d2yZISrxeMMzQ1ShBGM1fenYY89Y26FvD1kiixJF1ulWIl5I5U2UAh8k
 YYNPpDJONNnYgkOcpHgcKwu+AUAB2VoF6duEEdTiH7Vyye66QyGzp8ILu2UvL4uLAkZyAeQ/T
 1MBRW8fAmd3rPW5wLKa33CtOcll6IHin/WEVOs4bip3ECEDMljfjTGpM57Fr+ohPnBWaPDwFa
 rKDF25BqqMiw5SRNVtajWXc+bRSOYVEXom1cYRV93Vb5M7i6kxw9Cq9AWVYbLLTkHWsfCuM7y
 I2APgZPsLzqREel9xjSlfsBMIvgXz/Flyx5LKiJL7idzfRyoKhtV7LW9YYaJls3PQZH7f9q1A
 0G2nwIJtxN2jYWMro62l9Je8L9kT7bMt0sPMUHqtOzCK5v2D4ZYEIFHMt7l8ij4J5M2c=

On Fri, Nov 26, 2021 at 2:43 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> Le 25/11/2021 =C3=A0 16:44, Anders Roxell a =C3=A9crit :
> Can't you fix CLANG instead :) ?
>
> Or just add an else to the IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) that
> sets hstart and hend to 0 ?

That doesn't sound any less risky than duplicating the code, it can lead to
incorrect changes just as easily if a patch ends up actually flushing at th=
e
wrong address, and the compiler fails to complain because of the bogus
initialization.

> Or just put hstart and hend calculation outside the IS_ENABLED() ? After
> all GCC should drop the calculation when not used.

I like this one. I'm still unsure how clang can get so confused about wheth=
er
the variables are initialized or not, usually it handles this much better t=
han
gcc. My best guess is that one of the memory clobbers makes it conclude
that 'hflush' can be true when it gets written to by an inline asm.

        Arnd
