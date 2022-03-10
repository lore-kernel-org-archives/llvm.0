Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3788E7A
	for <llvm@lists.linux.dev>; Thu, 10 Mar 2022 07:40:14 +0000 (UTC)
Received: from mail-wr1-f48.google.com ([209.85.221.48]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mgek8-1o4aYL0NcC-00h37p for <llvm@lists.linux.dev>; Thu, 10 Mar 2022
 08:40:13 +0100
Received: by mail-wr1-f48.google.com with SMTP id r6so6112515wrr.2
        for <llvm@lists.linux.dev>; Wed, 09 Mar 2022 23:40:13 -0800 (PST)
X-Gm-Message-State: AOAM533e5e/QJsa5VI5Ott6RhzynMieGyoqts2dVmGE5g6ZKXPLAycPY
	X9Drc5EIkikg2wx2q/AhsCGffJH5SgvWaxSUxKU=
X-Google-Smtp-Source: ABdhPJy6ASVmBdPmI7FarBcjvR8m7K73FE37gpQa895a5+tJobzCZkYvsr/cC1ORStsisrKCaLtp4n3AzQZZYxNAHJo=
X-Received: by 2002:adf:f606:0:b0:203:8dff:f4ac with SMTP id
 t6-20020adff606000000b002038dfff4acmr366050wrp.12.1646898012730; Wed, 09 Mar
 2022 23:40:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202203091741.IetDk7a7-lkp@intel.com> <20220309230950.GA89632@bhelgaas>
 <YilD68QeKpgJG1W2@dev-arch.thelio-3990X>
In-Reply-To: <YilD68QeKpgJG1W2@dev-arch.thelio-3990X>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 10 Mar 2022 08:39:51 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0pv3WGCAywSR8QcaLBHsu4EPz+KkN8Ybbge4CwA3rHBg@mail.gmail.com>
Message-ID: <CAK8P3a0pv3WGCAywSR8QcaLBHsu4EPz+KkN8Ybbge4CwA3rHBg@mail.gmail.com>
Subject: Re: [lpieralisi-pci:pci/rcar 2/2] drivers/pci/controller/pcie-rcar-host.c:139:3:
 error: instruction requires: data-barriers
To: Nathan Chancellor <nathan@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, kernel test robot <lkp@intel.com>, 
	Marek Vasut <marek.vasut+renesas@gmail.com>, llvm@lists.linux.dev, 
	kbuild-all@lists.01.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:MfRjPoSdbF3QEVUV8rkQsa7YMY2p5xzMcTg1tCdq3FH4MrF+wiv
 uDmSFHOqonG/5MC4iwiLqpBEb32LHSkBexzt9zvRLkyPS3NRmHE3ub31UY1tGUQgctdOuEm
 DbBzxnjmUdWiKNmf+ThpGDDiXSKgunwBbdEOlZNorNWmSbhCNs4NwNlwG28uZDQtkiu+4ZW
 enVdeJTB0w7SxiJyTxGrA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Qu26Ozg0ug8=:qclhsdlwUXthJATmghug95
 w4zYO2VlVjdWmthds+5ORr1Z2rRG0LHCCz8ohAkyya/T4uRYNE0vshbcNMEc/sWl/TQXnXrF8
 cy55yWfPAt8ad7fxkrkGyCtSaDXV/MRnPFg04ot6ijZpgH3J3KpddSYZFoTXSBcJoD8Ewt6gD
 FSKRK+ChRu1k6BwRk1A7iYaW16dnVcNiYcTDzpNbnp0u/LFlfBFHnqK4CxL8jNBr3isvh/cTQ
 8WWhBSmIN8HsyUvVuk9ebZGku+EqSaXZqFtVDFpxu9riRUyt+WdIztLGDPoYX6WK0ZGjoB5Ol
 D1GZSKl2k7KXte766WKrR+iXwIrvAEL7MmIPpQaPY+TrP083hhJH5MsnOgihAlavgVjQAsUqn
 vj56cBFn1jYJJmKqaSW/d8m/fwTRQWqwhFEbBgyvZ15TuX5nTwy1YnuM9qQqWwurhQEztGMN7
 goG4AlMAja2/bFbnq9S0mFnGcOrUPedMExWlvGZqCf7NtZALF+OzUIWcGvNheFjOYEqge+2fI
 kfdKMLjsAP1Nu1FLTlUn0vEBpM1hT7oaV1aQQBXAw2/hsPtjAT3DJ/DRDvTP6GMqYlURDgsvb
 R5vHLUfSZ/WB88ag2MXNZeOtzooWKTTZQoaV3Bm1jd3B3JxB1AyclvyoO4X+SakJB7l0P25f6
 lnT0Y+4/GpMn4tjodLReitgHmvacybT3w/tiXTPFf4YcKZQ0z5YAte+Qbp5wEcE8pGWwYrlYk
 KLF+p7VSje/rTaLQKz6Dnt/AKtL/FWKjTh1t3t9IU5GbtUsOqL+VT9w15HwIpiln8oPL0PxqB
 GEMqEeqGKl/f9yi/gxXRO9zeqvHF4JvR4pCx8va6A4C/3Gwkqc=

On Thu, Mar 10, 2022 at 1:18 AM Nathan Chancellor <nathan@kernel.org> wrote:

> > To avoid this error, for now I have cherry-picked de6b5097f58b to a
> > local pci/host/rcar branch and dropped 9775965dbae5.
>
> FWIW, this is not clang specific, the same configuration blows up with
> GCC 11.2.0 as well:
>
> $ make -skj"$(nproc)" \
>        ARCH=arm \
>        CROSS_COMPILE=arm-linux-gnueabi- \
>        olddefconfig drivers/pci/controller/pcie-rcar-host.o
> /tmp/ccz8ybtm.s: Assembler messages:
> /tmp/ccz8ybtm.s:742: Error: selected processor does not support `isb' in ARM mode
> /tmp/ccz8ybtm.s:812: Error: selected processor does not support `isb' in ARM mode
> make[4]: *** [scripts/Makefile.build:288: drivers/pci/controller/pcie-rcar-host.o] Error 1
>
> $ rg CONFIG_CPU_32 .config
> 289:CONFIG_CPU_32v4=y
>
> It does not look like isb can be used with this configuration, at least
> if I understand arch/arm/include/asm/barrier.h correctly.

My first thought was to amend the #ifdef to

#if IS_ENABLED(CONFIG_ARM) && IS_ENABLED(CONFIG_ARCH_RENESAS)

However, this is still broken because you can build a kernel that
enables the Renesas ARMv7 platform along with early ARMv6 (omap2 and
imx3) that do not support "isb" either.

What I think we want to do here instead is to add a ".arch armv7-a" in the
inline assembly.

        Arnd
