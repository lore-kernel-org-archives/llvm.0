Received: from condef-09.nifty.com (condef-09.nifty.com [202.248.20.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042F6181
	for <llvm@lists.linux.dev>; Sun, 22 May 2022 06:58:34 +0000 (UTC)
Received: from conssluserg-05.nifty.com ([10.126.8.84])by condef-09.nifty.com with ESMTP id 24M6oJKA004001
	for <llvm@lists.linux.dev>; Sun, 22 May 2022 15:50:19 +0900
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175]) (authenticated)
	by conssluserg-05.nifty.com with ESMTP id 24M6oASW006411
	for <llvm@lists.linux.dev>; Sun, 22 May 2022 15:50:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 24M6oASW006411
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1653202211;
	bh=5TwfumVCNM+fvix8eWg6i86pc65IzESlNEbAwwhHqrU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ojV6XLeO60FMwlo+YWIjhWtRGEEawpk4CVTb4L9aglvOsxoK5f7z7QbZSOZfJ/tak
	 alBhcAPXcIxYqPD77l9IRzaTuM1+hmJzoN/AY0CLlXq3RF133ODYyShafJ1NmxJjCa
	 q0lpyWHvIylOEdH/w5NWWS57WrNaaAJ1LH6EpwkqOq/sHCzQtTbTby/WMAjGehyBu4
	 kVp9a8pzx79AFXB+F86AeNMng169Yna619lykZelRBT/YmqMzU/NmFg613kiYe1zhM
	 gliHIyRLAvkJUkXtL+XM5BQLs9Sn5t2kQlyC6svng8bF7Ur/kDDSJ0tasHLmdhpwVA
	 4ZAHOIk6oYabQ==
X-Nifty-SrcIP: [209.85.210.175]
Received: by mail-pf1-f175.google.com with SMTP id bo5so11079356pfb.4
        for <llvm@lists.linux.dev>; Sat, 21 May 2022 23:50:11 -0700 (PDT)
X-Gm-Message-State: AOAM5319bypYzdxpKquUlNOuayn5KlIU1wQz7xy+pTQL/mfqYn7FwW+5
	yegkRvpgaODgJCTEkWp0QQAW3bwGgRnCfwyTGFU=
X-Google-Smtp-Source: ABdhPJxhJ2rh9Olkm7eNlJF8gpCf6NRGhN1KHbnGfK8m1IcXzz+fxX+v0f9XGq/1eBPx2nbsbhKNAZoEfz+GfSITou8=
X-Received: by 2002:a63:9043:0:b0:3f9:6c36:3de3 with SMTP id
 a64-20020a639043000000b003f96c363de3mr8127619pge.616.1653202210391; Sat, 21
 May 2022 23:50:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220513113930.10488-1-masahiroy@kernel.org> <CAK7LNAQvneCi11myLpkikuXh=i5PLtTaLe0nGpDZXgv_Q1L0Ow@mail.gmail.com>
 <CA+icZUUWww3fXvjQcefgFuq=tPO6+FYDbHE2E5PmL-BSJg4+cw@mail.gmail.com>
In-Reply-To: <CA+icZUUWww3fXvjQcefgFuq=tPO6+FYDbHE2E5PmL-BSJg4+cw@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 22 May 2022 15:49:33 +0900
X-Gmail-Original-Message-ID: <CAK7LNATx1QcM6BdqBSascV8J8rD6etRgRZj9PjBno5Qrb=p3Yg@mail.gmail.com>
Message-ID: <CAK7LNATx1QcM6BdqBSascV8J8rD6etRgRZj9PjBno5Qrb=p3Yg@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] kbuild: yet another series of cleanups (modpost,
 LTO, MODULE_REL_CRCS, export.h)
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-modules <linux-modules@vger.kernel.org>,
        clang-built-linux <llvm@lists.linux.dev>,
        Ard Biesheuvel <ardb@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, May 22, 2022 at 10:45 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Fri, May 13, 2022 at 4:31 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > On Fri, May 13, 2022 at 8:42 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > >
> > > This is the third batch of cleanups in this development cycle.
> > >
> >
> >
> > This series is available at
> > git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
> >  lto-cleanup-v6
> >
>
> Hi Masahiro,
>
> I cloned the repository on top of latest Linus Git.
>
> Not able to boot in Quemu - Not able to boot on bare metal.
>
> $ grep module_layout log_quemu-5.18.0-rc7-2-amd64-clang14-lto.txt
> 366:[    2.173265] floppy: disagrees about version of symbol module_layout
> 367:[    2.198746] scsi_common: disagrees about version of symbol module_layout
> 368:[    2.205573] i2c_piix4: disagrees about version of symbol module_layout
> 369:[    2.210610] psmouse: disagrees about version of symbol module_layout
> 370:[    2.225138] scsi_common: disagrees about version of symbol module_layout
> 371:[    2.235536] scsi_common: disagrees about version of symbol module_layout
> 375:Begin: Running /scripts/local-premount ... [    2.298555]
> crc32c_intel: disagrees about version of symbol module_layout
> 376:[    2.303335] crc32c_generic: disagrees about version of symbol
> module_layout
> 377:[    2.306667] libcrc32c: disagrees about version of symbol module_layout
>
> Infos: LLVM-14 + CONFIG_LTO_CLANG_THIN=y
>
> My linux-config and qemu-log are attached.
>


Thanks for your testing.

I was also able to reproduce this issue.


The problematic parts are:

[    2.298555] crc32c_intel: disagrees about version of symbol module_layout
[    2.303335] crc32c_generic: disagrees about version of symbol module_layout
[    2.306667] libcrc32c: disagrees about version of symbol module_layout



When CONFIG_LTO_CLANG_THIN=y,
I cannot see any __crc_* symbols in "nm  vmlinux".

Perhaps, LTO might have discarded all the __crc_* symbols
from vmlinux, but I am still checking the details...



-- 
Best Regards
Masahiro Yamada
