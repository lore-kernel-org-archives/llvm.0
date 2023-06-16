Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBD92627;
	Fri, 16 Jun 2023 01:28:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E02C81FB;
	Thu, 15 Jun 2023 18:28:44 -0700 (PDT)
Received: from [10.163.45.18] (unknown [10.163.45.18])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 441323F5A1;
	Thu, 15 Jun 2023 18:27:55 -0700 (PDT)
Message-ID: <883f2a20-fe20-4d43-86cf-7847d59e2169@arm.com>
Date: Fri, 16 Jun 2023 06:57:52 +0530
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V12 05/10] arm64/perf: Add branch stack support in ARMV8
 PMU
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com,
 mark.rutland@arm.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Mark Brown <broonie@kernel.org>, James Clark <james.clark@arm.com>,
 Rob Herring <robh@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Suzuki Poulose <suzuki.poulose@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, linux-perf-users@vger.kernel.org
References: <20230615133239.442736-6-anshuman.khandual@arm.com>
 <202306160706.Uei5XDoi-lkp@intel.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <202306160706.Uei5XDoi-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/16/23 05:12, kernel test robot wrote:
> Hi Anshuman,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on arm64/for-next/core]
> [also build test ERROR on tip/perf/core acme/perf/core linus/master v6.4-rc6 next-20230615]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Anshuman-Khandual/drivers-perf-arm_pmu-Add-new-sched_task-callback/20230615-223352
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
> patch link:    https://lore.kernel.org/r/20230615133239.442736-6-anshuman.khandual%40arm.com
> patch subject: [PATCH V12 05/10] arm64/perf: Add branch stack support in ARMV8 PMU
> config: arm-randconfig-r004-20230615 (https://download.01.org/0day-ci/archive/20230616/202306160706.Uei5XDoi-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> reproduce (this is a W=1 build):
>         mkdir -p ~/bin
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         git remote add arm64 https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
>         git fetch arm64 for-next/core
>         git checkout arm64/for-next/core
>         b4 shazam https://lore.kernel.org/r/20230615133239.442736-6-anshuman.khandual@arm.com
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/perf/

I am unable to reproduce this on mainline 6.4-rc6 via default cross compiler
on a W=1 build. Looking at all other problems reported on the file, it seems
something is not right here. Reported build problems around these callbacks,
i.e armv8pmu_branch_XXXX() do not make sense as they are available via config
CONFIG_PERF_EVENTS which is also enabled along with CONFIG_ARM_PMUV3 in this
test config.
