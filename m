Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF21B33EC
	for <llvm@lists.linux.dev>; Wed, 19 Apr 2023 21:35:17 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-24781e23c27so209013a91.0
        for <llvm@lists.linux.dev>; Wed, 19 Apr 2023 14:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681940117; x=1684532117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OzkNoC83E5W4yn7xAvA2kp2dMY6MFjzJc1lOPrGXtTU=;
        b=ryH8H2CzhxhgPRAntJZg2qhSpn9QN/Myf3vxZlODMIdgNF/UWTkGSnYj9rUyGmqqKf
         3UytNfBHSfJ6Qc4kfmwOizdJuaMsuN3IpzeeLuTzGni0xsf5BxbD9Do9hrkOIj/v8SSF
         erXEvB3ts/RQrH4GJ7E+1TKmtUQcnajg89VLIT0QByY9A75WSUTPRpskKRYQrBAQiyFk
         wtwCdvMVV+B0EOKYq5T/ZQh8aadkqBenU6M7SRBHqzToIFV2hVItiCDC9hiyr3l2QKe6
         tzYuzuu+xBlH8sOUgzzicC97w67wNjfyibhFZbTPIxnA83dTxsuNbVakpmoKNKLA7luY
         w5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681940117; x=1684532117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OzkNoC83E5W4yn7xAvA2kp2dMY6MFjzJc1lOPrGXtTU=;
        b=gRzlaOuqWhRn6DFKefpjM93KoxUb3Tb8MtKteR9HUr9JeHvOfqOGTHCyTgXq0U80ry
         Co97GivX6DBWvSLKzfDEsYHchQn5Skq0gImLnjZxLXEk8lch28UrNIdAfCl3d/t9fWXk
         Eh46Ob5F1sNrHWRrlCMyCjgkxiX48Ez/RPXxkFVMsQQgzlldaGF3wP1NdqyJQlgQMlht
         b9QN+xS4C8E/ESIfspbmmd6SVmZVoD1d2PH52rz1zZNN7Me9fPBbr6Det3tuIpqVG+rq
         5BTqjl6XgU4m0bsks8KtLItF60zT6xzxRcj9ynX7nna4tL3WeMyxJySsk/mRVNlqmdaY
         1Okw==
X-Gm-Message-State: AAQBX9fVWtPM96FF0nvnWv31aNoeijXTHISyjR6HotdOTeZ1ds+l8xPf
	ZHOjeKXmbyq+ULVeQuy18jiEqtSmUOHVD3whVCfrP/3sEvj0pS5IH7DRiA==
X-Google-Smtp-Source: AKy350Y5FJRYN+MG23UrI62VxmV/BhDcpZ9mDVdf9iEBaP4/cEaP+GIHDQ/8ViYiNP3fUVheTp8B4qrt2qzU+RLHGjo=
X-Received: by 2002:a17:90a:2d81:b0:247:c0bd:b99a with SMTP id
 p1-20020a17090a2d8100b00247c0bdb99amr3921830pjd.31.1681940117050; Wed, 19 Apr
 2023 14:35:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230414080701.15503-1-jiaxun.yang@flygoat.com>
 <20230414080701.15503-7-jiaxun.yang@flygoat.com> <CAKwvOdkttvdZQyxrP60hAziaRQ4HWRBBSuA-vN25_USg-zEJqg@mail.gmail.com>
 <550FCA0F-2C48-4133-85B0-D9494CC1C23C@flygoat.com>
In-Reply-To: <550FCA0F-2C48-4133-85B0-D9494CC1C23C@flygoat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 19 Apr 2023 14:35:02 -0700
Message-ID: <CAKwvOd=sNyOq9J=CS09XXQ6YY3y3ytLnwHxKoHNdddcxYk=nJQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] MIPS: Fallback CPU -march CFLAG to ISA level if unsupported
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, llvm@lists.linux.dev, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 19, 2023 at 9:50=E2=80=AFAM Jiaxun Yang <jiaxun.yang@flygoat.co=
m> wrote:
>
>
>
> > 2023=E5=B9=B44=E6=9C=8818=E6=97=A5 21:07=EF=BC=8CNick Desaulniers <ndes=
aulniers@google.com> =E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Fri, Apr 14, 2023 at 1:07=E2=80=AFAM Jiaxun Yang <jiaxun.yang@flygoa=
t.com> wrote:
> >>
> >> LLVM does not implement some of -march options. However those options
> >> are not mandatory for kernel to build for those CPUs.
> >>
> >> Fallback -march CFLAG to ISA level if unsupported by toolchain so
> >> we can get those kernel to build with LLVM.
> >>
> >> Link: https://github.com/ClangBuiltLinux/linux/issues/1544
> >> Reported-by: Nathan Chancellor <nathan@kernel.org>
> >> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >
> > Thanks for the patch! Maybe it's more obvious to folks who work on
> > mips, but how did you determine that say `p5600` is `mips32r5` or
> > `r10000` is `mips4`?
>
> Wikipedia [1] should fit the purpose.
>
> [1]: https://en.wikipedia.org/wiki/List_of_MIPS_architecture_processors

Mostly! Though I was not able to verify:
- p5600
- r5500
- rm5200
- sb1
- loongson*

The rest LGTM, but maybe these families are better understood by Thomas?
--=20
Thanks,
~Nick Desaulniers
