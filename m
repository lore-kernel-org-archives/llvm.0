Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210D410EE
	for <llvm@lists.linux.dev>; Fri, 25 Feb 2022 03:12:09 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id b5so2460784wrr.2
        for <llvm@lists.linux.dev>; Thu, 24 Feb 2022 19:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2tXA6AeT/n84QHis5S/egaFq21pdbXEw9XfX//TKVfM=;
        b=c7GYzBUZ9xR/BVJG5gvZgCEJWk3vhp6OQX6HWlS9iuFRLcxYPGbKRSEHM+64LlVY1g
         8xIbBZr9zBJEu7O0NERNKR5d52ZiltX0nnRUgH6OAgMUPcQivl9IpnKHLQGvN62wGriA
         kaUUenhCahjCZ9/EhzF+CSapnzjWiiPFc2iltfDulLHS1VY2pkUuHv8b5rInK+IusWXU
         SVhF1Gmh1MfaLf+S62E0LFzQGLSnTxV2EPxsWoTGrPcFP95/JgZ7mcxX/3PoPAFif7Ro
         qyu9JeOC94XiTIrVVFdNtmrBGN2vNFmJnpxfnWKUnxKVGmb9jS3EdJNWec8tPVaN4ArF
         Q8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2tXA6AeT/n84QHis5S/egaFq21pdbXEw9XfX//TKVfM=;
        b=hJqtrXGtc614Upyn3d5ny4fLOYnzsN4DfWm+Z+yDUQ9ZxwKK/CuLbhuraie7+vl9gd
         KJss1bkv/M667ErjLmfpMXNSWp8gTDPCgnLYAjw8TtPJ04JwozMhNqaf+aYmAg+uFek/
         Cj9/vYDxbmbG+GrLduPXydMgcRBNcNwDLcl3PHJax4rcxNSti7WcFgPjZhWv8YWrTVrZ
         cq9FF8ApZSEoAxO6ouvrIn33ZW7leWnyq5yaWKep75EI6wVEdeBbZJJQeFz7DOf+x/67
         O9klpVX8n0sh1rdqqlxM6q+jGkBGacuD4LcVV+ctDoEDdrO7OQnxg868T7c8W/pGXgyl
         IQkw==
X-Gm-Message-State: AOAM533GhZQyZkAwI+vp2dksQy4jt0ETsFmSWzDkxTOvMXLeRdsIsQgu
	kgMIky0AlY3hBvX3Q4XKEKIzlqDQnGGYiDSr6ZTXfQ==
X-Google-Smtp-Source: ABdhPJxpp13+Gj6zLNHG/fdOzoKqtaJB14AbGDQVpFLIsU1SU8SdTUT1E0oKQs51V54e00SfilVyzOkbf0DXzqyfito=
X-Received: by 2002:adf:ca08:0:b0:1ed:c0bc:c212 with SMTP id
 o8-20020adfca08000000b001edc0bcc212mr4359347wrh.577.1645758727122; Thu, 24
 Feb 2022 19:12:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220222165212.2005066-7-kaleshsingh@google.com>
 <202202231727.L621fVgD-lkp@intel.com> <875yp63ptg.wl-maz@kernel.org>
 <YhYpvfZaSjrAtkZp@rli9-dbox> <cb750267af0636c49d2f8aa354f086a5@kernel.org>
 <CAMj1kXHsNsQXbeeS1zcy+xYA7kSE5apbLpChohfvkABS7Z6jKg@mail.gmail.com>
 <89c48bd2a9b32b4607d1515714fa3c1b@kernel.org> <16f47fa9-90b4-0b5c-33cb-cb004fc39266@intel.com>
In-Reply-To: <16f47fa9-90b4-0b5c-33cb-cb004fc39266@intel.com>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Thu, 24 Feb 2022 19:11:55 -0800
Message-ID: <CAC_TJvd2a4DJUgvFLAHyBJT-eZNWwwohuTG=NOfvaOpyTTd3oA@mail.gmail.com>
Subject: Re: [kbuild-all] Re: [PATCH v2 6/9] KVM: arm64: Detect and handle
 hypervisor stack overflows
To: "Chen, Rong A" <rong.a.chen@intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, kernel test robot <lkp@intel.com>, 
	llvm@lists.linux.dev, kbuild-all@lists.01.org, Will Deacon <will@kernel.org>, 
	Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Android Kernel Team <kernel-team@android.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, James Morse <james.morse@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Joey Gouly <joey.gouly@arm.com>, Peter Collingbourne <pcc@google.com>, Andrew Scull <ascull@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kvmarm <kvmarm@lists.cs.columbia.edu>
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 24, 2022 at 6:12 PM Chen, Rong A <rong.a.chen@intel.com> wrote:
>
>
>
> On 2/24/2022 6:39 PM, Marc Zyngier wrote:
> > On 2022-02-23 12:56, Ard Biesheuvel wrote:
> >> On Wed, 23 Feb 2022 at 13:54, Marc Zyngier <maz@kernel.org> wrote:
> >>>
> >>> On 2022-02-23 12:34, Philip Li wrote:
> >>> > On Wed, Feb 23, 2022 at 09:16:59AM +0000, Marc Zyngier wrote:
> >>> >> On Wed, 23 Feb 2022 09:05:18 +0000,
> >>> >> kernel test robot <lkp@intel.com> wrote:
> >>> >> >
> >>> >> > Hi Kalesh,
> >>> >> >
> >>> >> > Thank you for the patch! Perhaps something to improve:
> >>> >> >
> >>> >> > [auto build test WARNING on
> >>> cfb92440ee71adcc2105b0890bb01ac3cddb8507]
> >>> >> >
> >>> >> > url:
> >>> https://github.com/0day-ci/linux/commits/Kalesh-Singh/KVM-arm64-Hypervisor-stack-enhancements/20220223-010522
> >>>
> >>> >> > base:   cfb92440ee71adcc2105b0890bb01ac3cddb8507
> >>> >> > config: arm64-randconfig-r011-20220221
> >>> (https://download.01.org/0day-ci/archive/20220223/202202231727.L621fVgD-lkp@intel.com/config)
> >>>
> >>> >> > compiler: clang version 15.0.0
> >>> (https://github.com/llvm/llvm-project
> >>> d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
> >>> >> > reproduce (this is a W=1 build):
> >>> >> >         wget
> >>> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
> >>> -O ~/bin/make.cross
> >>> >> >         chmod +x ~/bin/make.cross
> >>> >> >         # install arm64 cross compiling tool for clang build
> >>> >> >         # apt-get install binutils-aarch64-linux-gnu
> >>> >> >         #
> >>> https://github.com/0day-ci/linux/commit/7fe99fd40f7c4b2973218045ca5b9c9160524db1
> >>>
> >>> >> >         git remote add linux-review
> >>> https://github.com/0day-ci/linux
> >>> >> >         git fetch --no-tags linux-review
> >>> Kalesh-Singh/KVM-arm64-Hypervisor-stack-enhancements/20220223-010522
> >>> >> >         git checkout 7fe99fd40f7c4b2973218045ca5b9c9160524db1
> >>> >> >         # save the config file to linux build tree
> >>> >> >         mkdir build_dir
> >>> >> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang
> >>> make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/
> >>> >> >
> >>> >> > If you fix the issue, kindly add following tag as appropriate
> >>> >> > Reported-by: kernel test robot <lkp@intel.com>
> >>> >> >
> >>> >> > All warnings (new ones prefixed by >>):
> >>> >> >
> >>> >> >    include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
> >>> >> >    #define NULL ((void *)0)
> >>> >> >                 ^~~~~~~~~~~
> >>> >> >    arch/arm64/kvm/hyp/nvhe/switch.c:200:27: warning: initializer
> >>> overrides prior initialization of this subobject
> >>> [-Winitializer-overrides]
> >>> >> >            [ESR_ELx_EC_FP_ASIMD]           = kvm_hyp_handle_fpsimd,
> >>> >> >                                              ^~~~~~~~~~~~~~~~~~~~~
> >>> >> >    arch/arm64/kvm/hyp/nvhe/switch.c:196:28: note: previous
> >>> initialization is here
> >>> >> >            [0 ... ESR_ELx_EC_MAX]          = NULL,
> >>> >> >                                              ^~~~
> >>> >> >    include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
> >>> >> >    #define NULL ((void *)0)
> >>> >> >                 ^~~~~~~~~~~
> >>> >>
> >>> >> Kalesh, please ignore this nonsense. There may be things to improve,
> >>> >> but this is *NOT* one of them.
> >>> >>
> >>> >> These reports are pretty useless, and just lead people to ignore real
> >>> >> bug reports.
> >>> >
> >>> > Hi Kalesh, sorry there're some irrelevant issues mixed in the report,
> >>> > kindly ignore them. And the valuable ones are the new ones that
> >>> > prefixed by >>, as the below one in original report.
> >>> >
> >>> >>> arch/arm64/kvm/hyp/nvhe/switch.c:372:17: warning: no previous
> >>> >>> prototype for function 'hyp_panic_bad_stack' [-Wmissing-prototypes]
> >>> >    void __noreturn hyp_panic_bad_stack(void)
> >>> >                    ^
> >>>
> >>> This is only called from assembly code, so a prototype wouldn't bring
> >>> much.
> >>>
> >>
> >> Should probably be marked as 'asmlinkage' then. I've suggested many
> >> times already that this bogus diagnostic should either be disabled, or
> >> disregard 'asmlinkage' symbols.
> >
> > Yes, asmlinkage is definitely missing.
> >
> > But it is pretty obvious that the robot people aren't interested in
> > fixing this particular issue, given how long we have been suggesting
> > this...
> >
> >          M.
>
> Hi Marc, Ard,
>
> We have ignored the warning related to asmlinkage according to the below
> advice:
>
> https://lore.kernel.org/lkml/CAMj1kXHrRYagSVniSetHdG15rkQS+fm4zVOtN=Zda3W0QaEoJA@mail.gmail.com/
>
> do you want the bot ignore such warning if asmlinkage not specified?

Hi Rong,

I have added asmlinkage to the functions without a prototype in later
versions of the patch.

Perhaps the report should be updated to say "functions only called
from assembly code should be annotated with the asmlinkage attribute"
if the error is a missing prototype

Thanks,
Kalesh
>
> Best Regards,
> Rong Chen
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
