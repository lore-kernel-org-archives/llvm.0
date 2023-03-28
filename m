Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648A02560;
	Tue, 28 Mar 2023 12:21:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B378AC433EF;
	Tue, 28 Mar 2023 12:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680006104;
	bh=fW2128x5Fp5fkpxJkAfHDZrmykXA979A6ajR0DCHjMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X/yYa1sRpQes6VuvqnFMruQaUvX+vpkTOb5DbEG2NHcCLWr0MVAxIKlCEFCAgHjV8
	 flspzLqw4tHv5TQ7irCiUxuMcNUgcMvTr/u695okMAh/b2APdfMnxEjszOiUtLDKFo
	 G1l2cfv4zatu7uG2d/1BBldfK9GQMPfz8+rLwbnWs7ZYd6vpnUsVi7b06lkyoOLHc1
	 +s3tsg8sSrfg8IVChFp3PevImRcr//PkI3NUt/g86eUPYO67cpOOeEHLb/q5CYD4JC
	 6D345Ug4vC947/zv7KDbTlFnrM4eGhRHh0mg8drHI45UoesTLYS57/G3bDPT4jOse/
	 4j6JZ5LD3zRVA==
Date: Tue, 28 Mar 2023 13:21:38 +0100
From: Will Deacon <will@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Zaid Al-Bassam <zalbassam@google.com>
Subject: Re: [linux-next:master 6577/7309] drivers/perf/arm_pmuv3.c:44:2:
 error: use of undeclared identifier 'PERF_MAP_ALL_UNSUPPORTED'
Message-ID: <20230328122138.GA1275@willie-the-truck>
References: <202303281539.zzI4vpw1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202303281539.zzI4vpw1-lkp@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Mar 28, 2023 at 04:01:49PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   a6faf7ea9fcb7267d06116d4188947f26e00e57e
> commit: 3b16f6268e660f15aed0bb97aefe87e893eb8882 [6577/7309] ARM: mach-virt: Select PMUv3 driver by default
> config: arm-randconfig-r024-20230326 (https://download.01.org/0day-ci/archive/20230328/202303281539.zzI4vpw1-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=3b16f6268e660f15aed0bb97aefe87e893eb8882
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 3b16f6268e660f15aed0bb97aefe87e893eb8882
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/perf/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303281539.zzI4vpw1-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/perf/arm_pmuv3.c:44:2: error: use of undeclared identifier 'PERF_MAP_ALL_UNSUPPORTED'
>            PERF_MAP_ALL_UNSUPPORTED,
>            ^
> >> drivers/perf/arm_pmuv3.c:59:2: error: use of undeclared identifier 'PERF_CACHE_MAP_ALL_UNSUPPORTED'
>            PERF_CACHE_MAP_ALL_UNSUPPORTED,
>            ^

I think the Kconfig warning is relevant here:

> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for ARM_PMUV3
>    Depends on [n]: PERF_EVENTS [=y] && HW_PERF_EVENTS [=n] && (ARM [=y] && CPU_V7 [=y] || ARM64)
>    Selected by [y]:
>    - ARCH_VIRT [=y] && ARCH_MULTI_V7 [=y] && PERF_EVENTS [=y]

Since we're selecting an option which has its own dependencies. I think
the easiest bet is to invert the linkage so that PMUV3 has a dependency
on ARCH_VIRT for 32-bit Arm (diff below).

Marc, Zaid -- what do you think?

Cheers,

Will

--->8

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index a5e5c0b09ff2..e24a9820e12f 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -401,7 +401,6 @@ config ARCH_VIRT
        select ARM_GIC_V3
        select ARM_GIC_V3_ITS if PCI
        select ARM_PSCI
-       select ARM_PMUV3 if PERF_EVENTS
        select HAVE_ARM_ARCH_TIMER
 
 config ARCH_AIROHA
diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
index 711f82400086..cf1559581fbc 100644
--- a/drivers/perf/Kconfig
+++ b/drivers/perf/Kconfig
@@ -103,7 +103,7 @@ config ARM_SMMU_V3_PMU
 config ARM_PMUV3
        depends on HW_PERF_EVENTS && ((ARM && CPU_V7) || ARM64)
        bool "ARM PMUv3 support" if !ARM64
-       default ARM64
+       default ARM64 || (ARM && ARCH_VIRT)
          help
          Say y if you want to use the ARM performance monitor unit (PMU)
          version 3. The PMUv3 is the CPU performance monitors on ARMv8

