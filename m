Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE2C68
	for <llvm@lists.linux.dev>; Wed, 24 Nov 2021 19:29:28 +0000 (UTC)
Received: from mail-wm1-f47.google.com ([209.85.128.47]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N95mL-1mbLRK2mPv-0167X3 for <llvm@lists.linux.dev>; Wed, 24 Nov 2021
 20:24:13 +0100
Received: by mail-wm1-f47.google.com with SMTP id az34-20020a05600c602200b0033bf8662572so3001446wmb.0
        for <llvm@lists.linux.dev>; Wed, 24 Nov 2021 11:24:13 -0800 (PST)
X-Gm-Message-State: AOAM533xKGD+/Ii7Wd8wzb3JSMDHjgn8iQoKvjbgs/tTgmbCfsjuPQld
	gcPl4/Eze62wWNnNVyhwOgDDK9y5/MnInrlpVO4=
X-Google-Smtp-Source: ABdhPJxU3XHzGkZdmjVLUlcDMysYVZXYBGK7dc18pfMdKQoniTree9ljP7IJbkiJjYrYSt/hozmOHO002j1Kgkumx8s=
X-Received: by 2002:a1c:1c1:: with SMTP id 184mr18501034wmb.1.1637781853302;
 Wed, 24 Nov 2021 11:24:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1637781097.git.mchehab+huawei@kernel.org>
In-Reply-To: <cover.1637781097.git.mchehab+huawei@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 24 Nov 2021 20:23:57 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1kQp4g6-59ui8ASBb-QYmwrtK5dh6L2PKjyXVV_VEGvw@mail.gmail.com>
Message-ID: <CAK8P3a1kQp4g6-59ui8ASBb-QYmwrtK5dh6L2PKjyXVV_VEGvw@mail.gmail.com>
Subject: Re: [PATCH 00/20] Solve the remaining issues with clang and W=1 on media
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linuxarm <linuxarm@huawei.com>, Mauro Carvalho Chehab <mauro.chehab@huawei.com>, 
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Andy Gross <agross@kernel.org>, 
	Antti Palosaari <crope@iki.fi>, Bjorn Andersson <bjorn.andersson@linaro.org>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Malcolm Priestley <tvboxspy@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Robert Foss <robert.foss@linaro.org>, 
	Todor Tomov <todor.too@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:vEcR4C4y3/s6c8H8EK6/Mb23Sqxavfuq27L+UPXTHIKahBr6BRd
 O1EdwEnQNzPJP+7dwxaJnWTR6ekmkt/22K0untNw3Ykr0SOL6gpw4d5Y66lze+/gCgdu1YS
 WSiWWkbyl/iZdiKMydmF7JwIKCthN0ItM62f2kgsSgq0xRWvgQkyZa3VUDAJNWOoM0oOVl9
 uGoKU7NQZefzS/TdaUk+Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Q98/yR7+tVs=:96+LP5cgV6BMfzVzMPkChZ
 6K9u6l4TvcT8Bc2VN+lcy6d9aMVfr5zbZFnfbPMHg4s9gHTEkXA43USCMa/wQ9XZCKVdN6ybd
 0t29jPcuHB+tpI2n4y4Rm4K8/FcL/XaY+piKCfJvchxEWvgMBPSJv5bNwxav8orIIvHhmKkpY
 pFIuqJxj5aaSadUS1D+V84fioPheY86IyRg7k4l34ttELMc6hQP5rjebBPBqPt41x1kWmljLb
 gI9jgwv/uJTvaijaw6BlqHWJ+B0omkCjjrcECekJFYvtakM9/lLfD4yrJDuQQb8JSp8hKOJu4
 8Vioibs4Gp4eX1TXgB8l+pheEmpDl3pAXAF5A7bADwCe0EPCI+O21lZManmyFJeE19htd66Yo
 NKUfZrU8Z+cgg01aD2nMObMUQk4h5F5SjeOffsjWhljhizehN2lJmXKhuW6ebzq70Cs9s7Myx
 Thl5cUKIbSXR7ZAULFzNoTZ8MmHv6AOPm1+a1y/YUcB8dYX/pzYI/X3bv63ypCbPTh9EjT0su
 qrDCq8Tl4ZAznkfSkn4u27IqJ7s/Fxc5D8Jhz+ap/gC7rvCjed66xwyglayK8A+d/So7I4F20
 M4JgTFC2uf/8oUDeycgZ2XD9UHheHe9GUQVdiiUWnrXQsWpofuR5qEhOBdjxglGmn7gLfKphh
 ++zyec0RTcNAeZNXlpLa/rbhiB4N5czHkIdzM0Evt6VaHBBd9qUKaz57WZT+cqmIn8+FfgWWO
 sUr4EqTeQt73+A9/Bu9juwW/8oNNmjEYwmkLTgWLA5ziRbJ6xHwCDZd9FFQN2hnQwHjtLdlmn
 syJ/i0F044by80QwkruYZKWHNKqN/zh/cvn7P45iH3L3oXSb0E=

On Wed, Nov 24, 2021 at 8:13 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Currently, using clang with W=1 and CONFIG_WERROR causes media to break.
> This is reported by builder.linuxtv.org.
>
> This series solve the remaining issues.

I looked through my randconfig tree and found one more that I had
initially not sent
as I wasn't sure whether we want to fix
-Wtautological-constant-out-of-range-compare
warnings. I'll send it now, as all warnings of that type in other
drivers have been addressed.

        Arnd
