Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DA227136;
	Thu, 27 Jul 2023 18:56:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11600C433CA;
	Thu, 27 Jul 2023 18:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690484184;
	bh=GdpvQy+TLxh28j9Lg5uaAuL2Xcd/FYyhWzOcnOULMlw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=s2Ew6aBZARlLfx31eWWZweVOcZIMUduWA+np7Jf9y2zLOu3nvAouIoUG6zEQRMdKy
	 x1v1mqXsdPNJTDfQxJuPL3SuEUBIs/RuBRIYYxF0cJTowePuG2CwwNTX2BDomSfk2j
	 7dk+YV8ikL2xOs3P8dr+Y9lJZ/wjL0EXA8OHCAhoswbXsbpqXI2Hl7bs8tPOKCjjJL
	 latFIBBoOf+Z+MFj6tSLGN9TlTzT9IA8nPZ5ueEKpUG33gHgHEtzVNnffog0EXa2f4
	 59JBDwscyq81amAoRXGntXfMuYwnacklvAt9ntnIyOV1srhKPbkMy/TjpDyB5SVD1z
	 bzxQNjqkPOI2g==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2b9ba3d6157so19817071fa.3;
        Thu, 27 Jul 2023 11:56:23 -0700 (PDT)
X-Gm-Message-State: ABy/qLaKVVnpo56Qyr7IY2CFJk7HMIcaI2jCqobmH7YOszr0gWlZ5t8r
	6xzdh6Iv4yv5Ey588nvUi26BJ8v1TcVm5jtp7g==
X-Google-Smtp-Source: APBJJlG4rtYiGyh12FBhcTdOAmGuW518edMYvz47WsBMlAInLev7gPxJ/hJNCFkrTIilCdzsj9806LAk0wdKvNfhnTA=
X-Received: by 2002:a2e:9796:0:b0:2b6:e536:a2a9 with SMTP id
 y22-20020a2e9796000000b002b6e536a2a9mr2503657lji.47.1690484182034; Thu, 27
 Jul 2023 11:56:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202307280212.w1lY1gCG-lkp@intel.com>
In-Reply-To: <202307280212.w1lY1gCG-lkp@intel.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 27 Jul 2023 12:56:10 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKGgt18rPaE1JsVZGru6Y-gwyf3t94gL+Knpt21QRW6sQ@mail.gmail.com>
Message-ID: <CAL_JsqKGgt18rPaE1JsVZGru6Y-gwyf3t94gL+Knpt21QRW6sQ@mail.gmail.com>
Subject: Re: [linux-next:master 3825/5027] arch/mips/pic32/pic32mzda/config.c:22:8:
 error: type specifier missing, defaults to 'int'; ISO C99 and later do not
 support implicit int
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2023 at 12:19=E2=80=AFPM kernel test robot <lkp@intel.com> =
wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   451cc82bd11eb6a374f4dbcfc1cf007eafea91ab
> commit: 657c45b303f87d77eb4ef49e9452f1c5d1fc363c [3825/5027] MIPS: Explic=
itly include correct DT includes
> config: mips-randconfig-r022-20230727 (https://download.01.org/0day-ci/ar=
chive/20230728/202307280212.w1lY1gCG-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git =
4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> reproduce: (https://download.01.org/0day-ci/archive/20230728/202307280212=
.w1lY1gCG-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307280212.w1lY1gCG-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> arch/mips/pic32/pic32mzda/config.c:22:8: error: type specifier missing=
, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimpli=
cit-int]
>       22 | static DEFINE_SPINLOCK(config_lock);
>          | ~~~~~~ ^
>          | int
> >> arch/mips/pic32/pic32mzda/config.c:22:24: error: a parameter list with=
out types is only allowed in a function definition
>       22 | static DEFINE_SPINLOCK(config_lock);
>          |                        ^
> >> arch/mips/pic32/pic32mzda/config.c:41:2: error: call to undeclared fun=
ction 'spin_lock_irqsave'; ISO C99 and later do not support implicit functi=
on declarations [-Wimplicit-function-declaration]
>       41 |         spin_lock_irqsave(&config_lock, flags);
>          |         ^
> >> arch/mips/pic32/pic32mzda/config.c:41:21: error: use of undeclared ide=
ntifier 'config_lock'
>       41 |         spin_lock_irqsave(&config_lock, flags);
>          |                            ^
> >> arch/mips/pic32/pic32mzda/config.c:46:2: error: call to undeclared fun=
ction 'spin_unlock_irqrestore'; ISO C99 and later do not support implicit f=
unction declarations [-Wimplicit-function-declaration]
>       46 |         spin_unlock_irqrestore(&config_lock, flags);
>          |         ^
>    arch/mips/pic32/pic32mzda/config.c:46:26: error: use of undeclared ide=
ntifier 'config_lock'
>       46 |         spin_unlock_irqrestore(&config_lock, flags);
>          |                                 ^
>    6 errors generated.

Already fixed in [1].

Rob

[1] https://lore.kernel.org/all/20230727012028.3933785-1-robh@kernel.org/
