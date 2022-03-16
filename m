Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CA838C2
	for <llvm@lists.linux.dev>; Wed, 16 Mar 2022 13:55:52 +0000 (UTC)
Received: from mail-wr1-f47.google.com ([209.85.221.47]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N62mG-1oA3Bv0Nho-016Kwk for <llvm@lists.linux.dev>; Wed, 16 Mar 2022
 14:55:51 +0100
Received: by mail-wr1-f47.google.com with SMTP id h23so2481763wrb.8
        for <llvm@lists.linux.dev>; Wed, 16 Mar 2022 06:55:50 -0700 (PDT)
X-Gm-Message-State: AOAM532w3GfA8YT2tokH/R6obj7xZ9yyE4kjkpJdfJxPTC7NKIf0bhUI
	7BhAsc0ZAoKsLVFfPo7q9Cgjxl/1MWDSBwFcY44=
X-Google-Smtp-Source: ABdhPJy+lwx53EZnd7w8d/ihKdeWtRvy8fq/hg43IWx4M+zNwmv/HP81T+84POeldU40HhcONYSQPVqVO7LeEIbIOV0=
X-Received: by 2002:adf:edc3:0:b0:1ec:5f11:5415 with SMTP id
 v3-20020adfedc3000000b001ec5f115415mr48812wro.317.1647438950657; Wed, 16 Mar
 2022 06:55:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202203162123.Ksr0CtpZ-lkp@intel.com>
In-Reply-To: <202203162123.Ksr0CtpZ-lkp@intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 16 Mar 2022 14:55:34 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1atu-azCPCC_1c-MKTungkHVn0Wd1awhZ4=hf1i9MWfA@mail.gmail.com>
Message-ID: <CAK8P3a1atu-azCPCC_1c-MKTungkHVn0Wd1awhZ4=hf1i9MWfA@mail.gmail.com>
Subject: Re: [csky-linux:riscv_compat_v8 20/20] arch/riscv/kernel/compat_signal.c:199:5:
 warning: no previous prototype for function 'compat_setup_rt_frame'
To: Guo Ren <guoren@linux.alibaba.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:uV4EFctnBr372wgQzCONr0lV643RczXljTXZ3UUV8T3uzVG6Trh
 I1XNFt/GpaICDUKG/quoaSj5zBoWnF4s1VkfNdm++FQBSy3jboQlJfyTvP/NqyE1qJRn6if
 4wEwT4AQon6NF/D9qwOqRCyFcyn/Q6lNeMg7gKxctB+fYvMJrhKiK206kAx7+KQHxmAujb7
 8cG7P9htVjsdfpTK4TV0Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:KzBLOvuekmw=:dBL09SKFTI6t+N33qV4s4J
 zICFxJ7e9DJ1vPYNphUXSODZMpFFErR8Vn5aWsUKVlEKU/qQ4zDF4FOsNq7Sx/unl6VbkHrZZ
 Jna+3G5zIUq60NBVbS+3dn1HPC8/CWhKLxjEzQLqx8cTr1DnpxvivA8xQl2N7PJsdxbpGHiki
 R9SAJclvvSsvTsdBghWXZd71g10MttfrqaAYkIFtzwkgZNIV1+2g4lYAUsUYwvatVeSNYq1kK
 yo9UtYuVQZC3E+G4EFZNHaJ8jH/KxHQH8muHLC26RYGPnQXG6waEQidxi7y2tbRRQn9Vy0olh
 4F12N7+OMYkq3Qye3RxE7lCfOYo4yLMfN9k8u/cMwFzYM5lQeOEEciEMAdjOgMWs6GtRyrIIF
 +u6ZpjiVIxc+/ePt5+NgqLSrCPQ7yD2RNura3yt9KcRrOc2kmV8LXhss86BCzBIR5v6l6MHwh
 RGklo4cxwHXSB5L79YklzzYsSZVeZWrbcTZvP+d6tuolnxHkMS+kIubRoBCEvOm1x28I0iTMD
 +d7ZvtmYItnG3CLll23jFaSFip31vGr6hvo6LTM4O/6pssVUHGhCEvF95kJu3YoAN2VOV/Ao0
 fS1+C9UoJiLaJcG2qrn1TlxHVB4t/ODorl7kxA+iDi5TU9tc7Az8myVmeI07ThDhKHfUiNsYk
 j0fCw3oK0Qy9qo/l1nC5by9Dr9iRehkrxoqyPChi04p0N0bwp0jMMJDEcV+buniDZk9/YGcMg
 CBmRw0YIa45WQPjs0cw27E4pcp0yv/eDZru0HWOtzMLmQIbr7Z6RvCQjEEMxllIO7IuiSCCim
 T2u0lA235V90fe1agiP/4YWBxzBikfSmNNe2APF89fopimz5t4=

On Wed, Mar 16, 2022 at 2:42 PM kernel test robot <lkp@intel.com> wrote:
>
> All warnings (new ones prefixed by >>):
>
> >> arch/riscv/kernel/compat_signal.c:199:5: warning: no previous prototype for function 'compat_setup_rt_frame' [-Wmissing-prototypes]
>    int compat_setup_rt_frame(struct ksignal *ksig, sigset_t *set,
>        ^
>    arch/riscv/kernel/compat_signal.c:199:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>    int compat_setup_rt_frame(struct ksignal *ksig, sigset_t *set,
>    ^
>    static
>    1 warning generated.

The problem here is that the compat_setup_rt_frame() declaration got added to
arch/riscv/kernel/signal.c instead of a header file that is included by both
signal.c and compat_signal.c.

Alternatively, the definition could be made static and moved into signal.c.

       Arnd
