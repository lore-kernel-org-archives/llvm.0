Received: from muru.com (muru.com [72.249.23.125])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FE7F3C27;
	Tue, 15 Aug 2023 05:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id BE82D80E0;
	Tue, 15 Aug 2023 05:39:49 +0000 (UTC)
Date: Tue, 15 Aug 2023 08:39:48 +0300
From: Tony Lindgren <tony@atomide.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-omap@vger.kernel.org, Dhruva Gole <d-gole@ti.com>,
	Nishanth Menon <nm@ti.com>
Subject: Re: [tmlind-omap:omap-for-v6.6/ti-sysc 3/5]
 drivers/bus/ti-sysc.c:3107:19: warning: cast to smaller integer type 'enum
 sysc_soc' from 'const void *'
Message-ID: <20230815053948.GP11676@atomide.com>
References: <202308150723.ziuGCdM3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202308150723.ziuGCdM3-lkp@intel.com>

* kernel test robot <lkp@intel.com> [230814 23:20]:
> Hi Tony,
> 
> First bad commit (maybe != root cause):
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git omap-for-v6.6/ti-sysc
> head:   40a4f49cd32dbc641c706215c1fa6c5bd051428c
> commit: 063dc0622705623b3a70739b9f33d5ea019882e6 [3/5] bus: ti-sysc: Build driver for TI K3 SoCs
> config: arm64-randconfig-r006-20230815 (https://download.01.org/0day-ci/archive/20230815/202308150723.ziuGCdM3-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> reproduce: (https://download.01.org/0day-ci/archive/20230815/202308150723.ziuGCdM3-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308150723.ziuGCdM3-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/bus/ti-sysc.c:3107:19: warning: cast to smaller integer type 'enum sysc_soc' from 'const void *' [-Wvoid-pointer-to-enum-cast]
>     3107 |                 sysc_soc->soc = (enum sysc_soc)match->data;
>          |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    1 warning generated.

Thanks seems we need to do (enum sysc_soc)(unsigned long)match->data or just
(unsigned long)match->data.

Regards,

Tony
