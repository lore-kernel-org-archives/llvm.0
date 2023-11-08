Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C56410785
	for <llvm@lists.linux.dev>; Wed,  8 Nov 2023 09:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from loongson.cn (unknown [209.85.128.180])
	by gateway (Coremail) with SMTP id _____8CxNvFuV0tl8f83AA--.44130S3;
	Wed, 08 Nov 2023 17:39:59 +0800 (CST)
Received: from mail-yw1-f180.google.com (unknown [209.85.128.180])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxbS9sV0tlE_E7AA--.65087S3;
	Wed, 08 Nov 2023 17:39:58 +0800 (CST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-59b5484fbe6so78608177b3.1
        for <llvm@lists.linux.dev>; Wed, 08 Nov 2023 01:39:58 -0800 (PST)
X-Gm-Message-State: AOJu0YzlCCUSijM+nS/3ffuV/1NTYZ3q/BRvuTkhcwNvHX9WCdET9LHC
	oipsmRJw6osjCvEmTXMCywBvqN9zv7FMXkuK/pAl6g==
X-Google-Smtp-Source: AGHT+IGJw6kxe2AuHux+s5+MaURvgqvxjUxou2MX4C7yq7jPaCu5YsXeP43aDJUBTZfW4qAw+LoksQL8ZcDMCnjIKY0=
X-Received: by 2002:a25:ad48:0:b0:d9a:6b1e:ef51 with SMTP id
 l8-20020a25ad48000000b00d9a6b1eef51mr1139641ybe.2.1699436396146; Wed, 08 Nov
 2023 01:39:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231108040447.288870-1-wangrui@loongson.cn> <d32d8a26dcd75a840727cdb50546b621d34d326b.camel@xry111.site>
 <CAHirt9jQHTRGdv4rShgvWHEbG1vzuLkNDbxLP7x4eMtuB3BB5g@mail.gmail.com>
 <4075b4dad9bedbc3def5dfe75f66f3e5d49ce6d5.camel@xry111.site> <CAHirt9jRH1CKE=BUWpML_jNgTBvMfJiYoAYPnVS3E=89oBUVyw@mail.gmail.com>
In-Reply-To: <CAHirt9jRH1CKE=BUWpML_jNgTBvMfJiYoAYPnVS3E=89oBUVyw@mail.gmail.com>
From: WANG Rui <wangrui@loongson.cn>
Date: Wed, 8 Nov 2023 17:39:45 +0800
X-Gmail-Original-Message-ID: <CAHirt9i-esjhZWF9yTsd+wBuMB+ebjVT33dY5VUkWHLcYREQpw@mail.gmail.com>
Message-ID: <CAHirt9i-esjhZWF9yTsd+wBuMB+ebjVT33dY5VUkWHLcYREQpw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Disable module from accessing external data directly
To: Xi Ruoyao <xry111@xry111.site>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	loongson-kernel@lists.loongnix.cn, Fangrui Song <maskray@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:AQAAf8CxbS9sV0tlE_E7AA--.65087S3
X-CM-SenderInfo: pzdqw2txl6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Ww4kArykCFW3Gw1fKF1Utwc_yoW8WrWrpF
	ZrGF1rKrs7Jr1jqrn2vFn7X3WYva1xArWxGFy0vw1Yvas0kr9rXa13tr4agF9FqryDWw12
	9r4vga42934UX3cCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_GFv_Wrylx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JV
	WxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUzsqW
	UUUUU

On Wed, Nov 8, 2023 at 5:36=E2=80=AFPM WANG Rui <wangrui@loongson.cn> wrote=
:
>
> On Wed, Nov 8, 2023 at 5:26=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wro=
te:
> >
> > On Wed, 2023-11-08 at 17:20 +0800, WANG Rui wrote:
> > > > then the linked binary triggers a SIGBUS.  Ideally this should be
> > > > detected by the linker at link time, but currently the BFD linker
> > > > fails
> > > > to detect this error (FWIW this flaw is caused by a really nasty
> > > > method
> > > > for the medium code model implementation).  So to me -fno-direct-
> > > > access-
> > > > external-data is the default.  I also grepped for -fdirect-access-
> > > > external-data in the kernel building system but I've not found any
> > > > match.
> > > >
> > > > Are you using a different version of Clang, or maybe Clang has some
> > > > configuration-time option to make -fdirect-access-external-data the
> > > > default?
> > >
> > > The clang enables `direct-access-external-data` by default in PIC and
> > > disables it by default in no-PIC. This also applies to PIE. [1]
> >
> > Oh sh*t:
> >
> > xry111@nanmen2 ~ $ clang t1.c -O2 -fno-pie -no-pie
> > xry111@nanmen2 ~ $ ./a.out
> > Bus error (core dumped)
> >
> > I'll consider it a Clang bug then.
>
> That's it, no copy relocations. As far as I know, copying relocations
> has some issues and is not recommended by Fangrui.
>
> For modules, if distance is not a problem, `no-pic` and
> `direct-access-external-data` can be together because the code is
> writable. Does it seem reasonable to exist?

Of course, for LoongArch, it is better for `no-pic` to disable
`direct-access-external-data` by default. I will send a patch.

--=20
WANG Rui

