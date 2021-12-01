Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD0268
	for <llvm@lists.linux.dev>; Wed,  1 Dec 2021 07:39:27 +0000 (UTC)
Received: from mail-wr1-f48.google.com ([209.85.221.48]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M5fdC-1myOkp3Iza-007EyD for <llvm@lists.linux.dev>; Wed, 01 Dec 2021
 08:39:25 +0100
Received: by mail-wr1-f48.google.com with SMTP id i5so50099931wrb.2
        for <llvm@lists.linux.dev>; Tue, 30 Nov 2021 23:39:25 -0800 (PST)
X-Gm-Message-State: AOAM530Bfgph9dhJjleILZgJJcK3Fh96Dx3kQoj91xjk0jwznY4PWGYw
	pKM5kXpaJSfVXm5ySTQhYn4Op2iAAnQeBrrbeJc=
X-Google-Smtp-Source: ABdhPJwvNRVCL/nM2dpSEG/anSd9Li4NuYP7RMZkVtAHnEbwsCl1N0uPe/rmQ6Ou9gQAQd5lqVHhjNQqzRJaTmxtW60=
X-Received: by 2002:a5d:64ea:: with SMTP id g10mr4768401wri.137.1638344365444;
 Tue, 30 Nov 2021 23:39:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202112011148.XrnWip5a-lkp@intel.com>
In-Reply-To: <202112011148.XrnWip5a-lkp@intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 1 Dec 2021 08:39:09 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0c+zE22ouZKF66gfoqNJuCZTv0r3nnDR+AjxgCLgE87A@mail.gmail.com>
Message-ID: <CAK8P3a0c+zE22ouZKF66gfoqNJuCZTv0r3nnDR+AjxgCLgE87A@mail.gmail.com>
Subject: Re: [ardb:for-kernelci 18/28] arch/arm/mach-footbridge/common.c:102:6:
 warning: no previous prototype for function 'dc21285_handle_irq'
To: kernel test robot <lkp@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:JtktasPd0XAaYe/GTX2I/bGYxozrBArW7UYdQt4ial20d+30f2H
 56YlXGAY9PgfXdd5O2V3muaDT30ZX3SAnqxzBF6pt+s/qzbBtb0NraPBSaLohQdMYMbYE14
 9uQWqorG7h4Dgfu2b8YHvvHS34uKNEYvYaBzYJhMdpufKbQAAzC5m2NN/vMssOZAkeBI6dq
 3T8WmTJAAG4L3d/cUxtmw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:RhzrFOvw0Ms=:Q3JBUFL5btOlNm2XPOhmke
 phthRI+XJE5FmN0JoGijGDEzkb2qjBDQlxj8QhbLGOx65YVnmHJZxk4Bbzw0rFvgIsrxsQJZC
 DqfRhmqp4jadwB8NQ7gKJ0O7Ux5fGUg93hVt1FoWVGMia7rUBIhjXTpA0Er+y7CYCtphH2kQ5
 9ZC2+ZjzZCmO/OpIFWv4pLt4tvwLFTIInMP4GdZMwnmBkly+lrNroCMLeSi0PGObgBPpvHdW1
 b3FWQBue4t3ayQ+l8YK3cXxa5MeuIoJm7SVdjxCLCTsd1eVQxs1YDcFRXFze2JhC1E0M5YoXe
 IPGj//QUpviNqwaa6/ASBDQR19PyO6yCOGMl7vetwWGh3o/hmmBZSQxGUyuPwXWajUprJHwEg
 eAIUaIbgZ5jCu+N9Nw1/gsoCwT98/U3xah/lX/mK2F3q1tAJFncuqEAm9aspChIrG4u8SWE8x
 A25etD0mrJzq69/ZGnjCphII+Wx3JhDkux4WwCpGNoqlHX6uJXznuA9TsxBE+KWE3VY83Co4d
 k52BLx2MXs8Z6Em2sdRqxJnqWCjCWlI8Gfg9eRZMFfx/Nb1F3ZQ4v4iOPDG8B5yTN97qvcvdS
 sQSGmfkhSok0EqIBYZVFslOn+O5upOKSBqE0kMvc2NCLRkejjf4grWlXkpMJr+w3xzkWEbMJN
 lhjEIDtbcAQgP99p4t02ADWa1othF4ld6g+hJyQu4Rz+ttkSO23/gHLlTwx420TAk9gM=

On Wed, Dec 1, 2021 at 4:42 AM kernel test robot <lkp@intel.com> wrote:
>
>    arch/arm/mach-footbridge/common.c:102:1: note: declare 'static' if the function is not intended to be used outside of this translation unit

Correct, thanks for the report!

Ard, I assume you can fix this up in your tree.

         Arnd
