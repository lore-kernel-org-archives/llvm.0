Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5334868
	for <llvm@lists.linux.dev>; Sun, 14 Nov 2021 10:10:30 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id DD16160F6B;
	Sun, 14 Nov 2021 10:10:29 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <maz@kernel.org>)
	id 1mmCSx-005IA5-Ll; Sun, 14 Nov 2021 10:10:27 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Sun, 14 Nov 2021 10:10:27 +0000
From: Marc Zyngier <maz@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [arm-platforms:hack/m1-pmu 8/8]
 drivers/perf/apple_m1_cpu_pmu.c:100:32: warning: initializer overrides prior
 initialization of this subobject
In-Reply-To: <202111141650.o5b2LSZU-lkp@intel.com>
References: <202111141650.o5b2LSZU-lkp@intel.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <0b7463e699956abb0f8b0da7a9254500@kernel.org>
X-Sender: maz@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: lkp@intel.com, llvm@lists.linux.dev, kbuild-all@lists.01.org, linux-arm-kernel@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

On 2021-11-14 08:25, kernel test robot wrote:
> tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git
> hack/m1-pmu
> head:   a905c66ae0b391425e9ad7f261ad7b4c33af2c07
> commit: a905c66ae0b391425e9ad7f261ad7b4c33af2c07 [8/8] drivers/perf:
> Add Apple icestorm/firestorm CPU PMU driver
> config: arm64-randconfig-r036-20211114 (attached as .config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project
> c3dddeeafb529e769cde87bd29ef6271ac6bfa5c)
> reproduce (this is a W=1 build):
>         wget
> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
> -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         #
> https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/commit/?id=a905c66ae0b391425e9ad7f261ad7b4c33af2c07
>         git remote add arm-platforms
> https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git
>         git fetch --no-tags arm-platforms hack/m1-pmu
>         git checkout a905c66ae0b391425e9ad7f261ad7b4c33af2c07
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1
> ARCH=arm64
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>>> drivers/perf/apple_m1_cpu_pmu.c:100:32: warning: initializer 
>>> overrides prior initialization of this subobject 
>>> [-Winitializer-overrides]
>            [M1_PMU_PERFCTR_UNKNOWN_01]     = BIT(7),
>                                              ^~~~~~
>    include/vdso/bits.h:7:19: note: expanded from macro 'BIT'
>    #define BIT(nr)                 (UL(1) << (nr))
>                                    ^~~~~~~~~~~~~~~
>    drivers/perf/apple_m1_cpu_pmu.c:99:32: note: previous initialization 
> is here
>            [0 ... M1_PMU_PERFCTR_LAST]     = ANY_BUT_0_1,
>                                              ^~~~~~~~~~~

Oh please, not that thing again. I've commented on this many times,
and this warning is just bogus. Initialisation override is a necessity,
and working around this warning leads to something that is far less
maintainable, and thus more *dangerous* than this.

I really wish this warning was simply turned off, because it only
leads to the robot emails to be ignored do to the number of false 
positives.

         M.
-- 
Jazz is not dead. It just smells funny...
