Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388058826
	for <llvm@lists.linux.dev>; Tue, 28 Mar 2023 15:15:04 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id d2so10648364vso.9
        for <llvm@lists.linux.dev>; Tue, 28 Mar 2023 08:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680016503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zogcj48cUORsp+cx8m+6WD2kysHO7bsUVfNCnma4boE=;
        b=J5WsMN8aXW8oQ6ohBV6kiuUuq9TQp9a/GN0VOMsfec4YAsOfUey/eAkJwvqZdBgXSh
         mb8vmORY4U9gNoetWmo7kJ9yQyKTivuWi0sBO5FDWpabK3wrukmarN+t1yHnyg/yF5vN
         BPB1z37fK6CkvhJJq4Au9rCJFmEUMBjuVYa87A2QgWW6+RQUu0A3Tne+xLd7p7TAfwK9
         05KfrOxAU4uNMicxW/aRBIEyySsyUIWP8KE8070LDgcOFw6DGKU1ycnaOLA43NutIJI3
         zUCHJnUw1uw0OPwwOY/BHgepWBXqKG4Q0jsL25cWIBVb1PB5GnXh1ABBOX3wmkqCgKoA
         zcuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680016503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zogcj48cUORsp+cx8m+6WD2kysHO7bsUVfNCnma4boE=;
        b=A4sHfXjpU2JbU+Vo2rjy846wlrEi3gdrZDwOLwPBhGP30eCnLN6MrFGZscTuvvdiq0
         WjB9TXTlr4G/OuEKWYMoty6PgKj3bmQlXtbGU19/es/YLrDeYigbdt20CawyN+gdlU5x
         iS9hr0SLj7MhWPl94PSvPsQ7aF88NCiT8AoktxQB7LKn5FzUqXdmMlkMKQxI8tZWLkw9
         TJyXnnPXu1pfUEfDpfQobdeFD6GNgzlwCrJBGeLWoBZYk3vSdIe9dr9WdjoyZpZsqDZg
         GcQ7GHvj4ke/bzob0lL+kstWQVMxpWomE95rKdw9OYJq2OmnxQYRyJgTei/h6Sqnjd6b
         j1pg==
X-Gm-Message-State: AO0yUKUY2h3zSjshp1fufTrsEBxESNmF4kGModoszgEqIK6AMh1d8JK+
	s/HQRuYBeq8qmSZcFbaFRdkYHQEjvMb7TzcGNVKWCw==
X-Google-Smtp-Source: AK7set+faee5ptEy2k2sQCK3L2uCYQ3XJJUAvnEws3za20OTSyTXDtTPbBo9iA9TXkDVxOwhcRch50TLewCm/8cOaLM=
X-Received: by 2002:a05:6102:2338:b0:421:c4a3:b607 with SMTP id
 b24-20020a056102233800b00421c4a3b607mr12323114vsa.3.1680016502956; Tue, 28
 Mar 2023 08:15:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202303281539.zzI4vpw1-lkp@intel.com> <20230328122138.GA1275@willie-the-truck>
In-Reply-To: <20230328122138.GA1275@willie-the-truck>
From: Zaid Al-Bassam <zalbassam@google.com>
Date: Tue, 28 Mar 2023 11:14:52 -0400
Message-ID: <CALBRaFnrm4joJV=SZ-f6fiU=N-naZeS4kV+v3Z1c0BNABYf2Bg@mail.gmail.com>
Subject: Re: [linux-next:master 6577/7309] drivers/perf/arm_pmuv3.c:44:2:
 error: use of undeclared identifier 'PERF_MAP_ALL_UNSUPPORTED'
To: Will Deacon <will@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Marc Zyngier <marc.zyngier@arm.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Will,

First, Sorry I haven't noticed that missing dependency case. Your
change looks good to me, but to keep the driver/perf/Kconfig clean, I
was thinking of rather expanding the check at the arch level, i.e.:

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 6f0a2576d17f..a82765929f67 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -401,7 +401,7 @@ config ARCH_VIRT
        select ARM_GIC_V3
        select ARM_GIC_V3_ITS if PCI
        select ARM_PSCI
-       select ARM_PMUV3 if PERF_EVENTS
+       select ARM_PMUV3 if PERF_EVENTS && HW_PERF_EVENTS
        select HAVE_ARM_ARCH_TIMER

 config ARCH_AIROHA

What do you think? Marc, Any input? please!

Thank you,
Zaid

On Tue, Mar 28, 2023 at 8:21=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Tue, Mar 28, 2023 at 04:01:49PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git master
> > head:   a6faf7ea9fcb7267d06116d4188947f26e00e57e
> > commit: 3b16f6268e660f15aed0bb97aefe87e893eb8882 [6577/7309] ARM: mach-=
virt: Select PMUv3 driver by default
> > config: arm-randconfig-r024-20230326 (https://download.01.org/0day-ci/a=
rchive/20230328/202303281539.zzI4vpw1-lkp@intel.com/config)
> > compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67=
409911353323ca5edf2049ef0df54132fa1ca7)
> > reproduce (this is a W=3D1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install arm cross compiling tool for clang build
> >         # apt-get install binutils-arm-linux-gnueabi
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-ne=
xt.git/commit/?id=3D3b16f6268e660f15aed0bb97aefe87e893eb8882
> >         git remote add linux-next https://git.kernel.org/pub/scm/linux/=
kernel/git/next/linux-next.git
> >         git fetch --no-tags linux-next master
> >         git checkout 3b16f6268e660f15aed0bb97aefe87e893eb8882
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross =
W=3D1 O=3Dbuild_dir ARCH=3Darm olddefconfig
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross =
W=3D1 O=3Dbuild_dir ARCH=3Darm SHELL=3D/bin/bash drivers/perf/
> >
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Link: https://lore.kernel.org/oe-kbuild-all/202303281539.zzI4vpw1-lkp=
@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> > >> drivers/perf/arm_pmuv3.c:44:2: error: use of undeclared identifier '=
PERF_MAP_ALL_UNSUPPORTED'
> >            PERF_MAP_ALL_UNSUPPORTED,
> >            ^
> > >> drivers/perf/arm_pmuv3.c:59:2: error: use of undeclared identifier '=
PERF_CACHE_MAP_ALL_UNSUPPORTED'
> >            PERF_CACHE_MAP_ALL_UNSUPPORTED,
> >            ^
>
> I think the Kconfig warning is relevant here:
>
> > Kconfig warnings: (for reference only)
> >    WARNING: unmet direct dependencies detected for ARM_PMUV3
> >    Depends on [n]: PERF_EVENTS [=3Dy] && HW_PERF_EVENTS [=3Dn] && (ARM =
[=3Dy] && CPU_V7 [=3Dy] || ARM64)
> >    Selected by [y]:
> >    - ARCH_VIRT [=3Dy] && ARCH_MULTI_V7 [=3Dy] && PERF_EVENTS [=3Dy]
>
> Since we're selecting an option which has its own dependencies. I think
> the easiest bet is to invert the linkage so that PMUV3 has a dependency
> on ARCH_VIRT for 32-bit Arm (diff below).
>
> Marc, Zaid -- what do you think?
>
> Cheers,
>
> Will
>
> --->8
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index a5e5c0b09ff2..e24a9820e12f 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -401,7 +401,6 @@ config ARCH_VIRT
>         select ARM_GIC_V3
>         select ARM_GIC_V3_ITS if PCI
>         select ARM_PSCI
> -       select ARM_PMUV3 if PERF_EVENTS
>         select HAVE_ARM_ARCH_TIMER
>
>  config ARCH_AIROHA
> diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
> index 711f82400086..cf1559581fbc 100644
> --- a/drivers/perf/Kconfig
> +++ b/drivers/perf/Kconfig
> @@ -103,7 +103,7 @@ config ARM_SMMU_V3_PMU
>  config ARM_PMUV3
>         depends on HW_PERF_EVENTS && ((ARM && CPU_V7) || ARM64)
>         bool "ARM PMUv3 support" if !ARM64
> -       default ARM64
> +       default ARM64 || (ARM && ARCH_VIRT)
>           help
>           Say y if you want to use the ARM performance monitor unit (PMU)
>           version 3. The PMUv3 is the CPU performance monitors on ARMv8
>
