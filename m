Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E9468
	for <llvm@lists.linux.dev>; Wed, 24 Nov 2021 19:22:08 +0000 (UTC)
Received: from mail-wm1-f42.google.com ([209.85.128.42]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MvaO8-1mWeVN0Zc6-00sh9c for <llvm@lists.linux.dev>; Wed, 24 Nov 2021
 20:22:07 +0100
Received: by mail-wm1-f42.google.com with SMTP id 77-20020a1c0450000000b0033123de3425so6420046wme.0
        for <llvm@lists.linux.dev>; Wed, 24 Nov 2021 11:22:07 -0800 (PST)
X-Gm-Message-State: AOAM5333lXXTzSjevKM+GQIbveBUjA+otNfL1MGpAxPA2kCy5Q/c5run
	YP0CPqFvzgiH5XcMcDn/GyD6IdcttWzKC+ZYA7Y=
X-Google-Smtp-Source: ABdhPJyA967xXsVVOdLJdkVj5zYgmz3qs3/FxEAJIV2nNiYoRheYa4DjM+GWWKPY+38aCDJUPzvYqT2XNbgtE7c9kMM=
X-Received: by 2002:a1c:770e:: with SMTP id t14mr17497596wmi.173.1637781726785;
 Wed, 24 Nov 2021 11:22:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1637781097.git.mchehab+huawei@kernel.org> <63ecb865c4f2b81862f5e6ac0dea497d3e0baca3.1637781097.git.mchehab+huawei@kernel.org>
In-Reply-To: <63ecb865c4f2b81862f5e6ac0dea497d3e0baca3.1637781097.git.mchehab+huawei@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 24 Nov 2021 20:21:50 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2ez6nEw4d+Mqa3XXAz0RFTZHunqqRj6sCt7Y_Eqqs0rw@mail.gmail.com>
Message-ID: <CAK8P3a2ez6nEw4d+Mqa3XXAz0RFTZHunqqRj6sCt7Y_Eqqs0rw@mail.gmail.com>
Subject: Re: [PATCH 18/20] media: mtk-mdp: address a clang warning
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linuxarm <linuxarm@huawei.com>, Mauro Carvalho Chehab <mauro.chehab@huawei.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Yl6Et6cfkAXJd3o3lE6rbakCsT+6fX4LYcX6Y6eZxyOzsKJ+0+M
 rLKuNDLkTIUCBW21BhCT/S5/HhTXNguIrj02HCaWVdcbCxAVVq04mghccvlNOzNtxoYVqRt
 lb7gSaDtvKcsryq68q9QWGyhSstZXLiREOK46rbqoi8OWigTEzcVALqRbQJHa+cPZs1PkoI
 LCUYJHhfkpcvSUNbXr7uA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oAn1LtlhDOo=:33tadCV5JD7nfdZBhk9biF
 HAo4VAp+Bn+BRAk08xFxOibXFskcBkL9swM+vmBXBOrHVWvaQID1H3oTmfyZxYopI4Ufsbs4Z
 re35gFPtvVey4pBAt8bKEwGiiUD9n3Q74Du/6QZLQAErpJ0cldaRC+oou6WaALUsY4iaOZJiu
 vMwEL+OWZoMOzghTGjDKLMzyx75iD7bS2jhqGlBI1FQ2yg5u2lU/idtk8eAToKuRG1Lx89qIg
 qM7mzpsccWWyZR+CMsYPwCDBNzst0qENzue3ffkNZcV/ZbRP2iMMRxiQt2XGCnV0mE3uLpMWy
 qv8/Ixy8O89/dTkcDCEdy7V5aW96wiWM8gLgLOKVx5+M3Aeu1WTdiTpsinTUAnouagdF7VY3o
 OhvUEDDslf7W4MehHk/ESnSQmZ1piNY/OVx7wpjVP98930gmtF5hjk4ghsTEY1SqlPvre7pnu
 prjyPl088DHWFf4iWLIU627PG0mBnTDFXynEtg6iRgopcaPeZsL6f2Zg+dOL29a9bF639Q+hv
 lovUgFEOfHuG5HZ6ofKVIgdQ3J5G/VczqzGoVxt8PFWoczZK3Ldpu66rmM8JBTPgTEdfUPv/6
 aIkhUd2QLX2sldY8GiYC63WNLh9ZkaLuKnyjVAJPs0XDLyZJujcRqoA+iFFsTow0gJ4aSTUKR
 wQsw9ywd6Dq8R3Ddo8mnpz9G03DqyCtWYlE15gWFJ2axQsqpe1wyoR0p2/Ug8KQDpT5k=

On Wed, Nov 24, 2021 at 8:13 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> The typecasts at the dvb-core generate clang warnings when W=1
> is enabled.
>
> Such warning is harmless, but it causes the build to break with
> CONFIG_WERROR and W=1 with clang, so do the cast on a way that
> it won't produce warnings anymore.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

>
> -               comp_type = (enum mtk_mdp_comp_type)of_id->data;
> +               comp_type = (long)of_id->data;

I would generally use (uintptr_t) for this purpose, but the effect is the same.

        Arnd
