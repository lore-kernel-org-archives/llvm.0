Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E772C80
	for <llvm@lists.linux.dev>; Wed, 13 Oct 2021 09:16:25 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="214330811"
X-IronPort-AV: E=Sophos;i="5.85,370,1624345200"; 
   d="scan'208";a="214330811"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2021 02:16:25 -0700
X-IronPort-AV: E=Sophos;i="5.85,370,1624345200"; 
   d="scan'208";a="491378550"
Received: from rli9-dbox.sh.intel.com (HELO rli9-dbox) ([10.239.159.115])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2021 02:16:22 -0700
Date: Wed, 13 Oct 2021 17:16:57 +0800
From: Philip Li <philip.li@intel.com>
To: Yicong Yang <yangyicong@hisilicon.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
	x86@kernel.org, Barry Song <baohua@kernel.org>,
	Valentin Schneider <valentin.schneider@arm.com>
Subject: Re: [kbuild-all] Re: [tip:sched/core 45/47]
 kernel/sched/topology.c:23:20: error: unused function 'sched_debug'
Message-ID: <YWakCfUA+MZULt2w@rli9-dbox>
References: <202110130209.1XL2cTpW-lkp@intel.com>
 <0538ccac-19eb-a184-6aef-1d11eefbae17@hisilicon.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0538ccac-19eb-a184-6aef-1d11eefbae17@hisilicon.com>

On Wed, Oct 13, 2021 at 05:02:42PM +0800, Yicong Yang wrote:
> Hi,
> 
> On 2021/10/13 2:30, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
> > head:   b2d5b9cec60fecc72a13191c2c6c05acf60975a5
> > commit: f43df9225fcad9b07a4ef4d0fe4c3ad2fb4ce82d [45/47] sched/topology: Remove unused numa_distance in cpu_attach_domain()
> > config: hexagon-buildonly-randconfig-r004-20211012 (attached as .config)
> > compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c3dcf39554dbea780d6cb7e12239451ba47a2668)
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=f43df9225fcad9b07a4ef4d0fe4c3ad2fb4ce82d
> >         git remote add tip https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
> >         git fetch --no-tags tip sched/core
> >         git checkout f43df9225fcad9b07a4ef4d0fe4c3ad2fb4ce82d
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=hexagon 
> > 
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > 
> > All errors (new ones prefixed by >>):
> > 
> >>> kernel/sched/topology.c:23:20: error: unused function 'sched_debug' [-Werror,-Wunused-function]
> >    static inline bool sched_debug(void)
> >                       ^
> >    1 error generated.
> > 
> 
> sched_debug() is unused if CONFIG_ENERGY_MODEL=n || CONFIG_CPU_FREQ_GOV_SCHEDUTIL=n and CONFIG_NUMA=n,
> which is the case in the report. This is not introduced by this patch.
> 
> A __maybe_unused qualify for sched_debug() may fix this. Not sure we intends to do so.
Hi Yicong, you may wait for Peter's input. 0-day CI is consulting Peter what the appropriate
scope is to ignore the W=1 related warnings at
https://lore.kernel.org/llvm/CALOAHbDkBn3LDsNvSXujMiQXrLHdRsfvJUqJv_eTh4s63osuTw@mail.gmail.com/T/#m516619d3b8b632e457522ef7827694f9b47c574c

We will not reporting out such un-interested issues anymore per the input.

> 
> > 
> > vim +/sched_debug +23 kernel/sched/topology.c
> > 
> > f2cb13609d5397 Ingo Molnar    2017-02-01  22  
> > f2cb13609d5397 Ingo Molnar    2017-02-01 @23  static inline bool sched_debug(void)
> > f2cb13609d5397 Ingo Molnar    2017-02-01  24  {
> > 9406415f46f612 Peter Zijlstra 2021-04-15  25  	return sched_debug_verbose;
> > f2cb13609d5397 Ingo Molnar    2017-02-01  26  }
> > f2cb13609d5397 Ingo Molnar    2017-02-01  27  
> > 
> > :::::: The code at line 23 was first introduced by commit
> > :::::: f2cb13609d5397cdd747f3ed6fb651233851717d sched/topology: Split out scheduler topology code from core.c into topology.c
> > 
> > :::::: TO: Ingo Molnar <mingo@kernel.org>
> > :::::: CC: Ingo Molnar <mingo@kernel.org>
> > 
> > ---
> > 0-DAY CI Kernel Test Service, Intel Corporation
> > https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> > 
> _______________________________________________
> kbuild-all mailing list -- kbuild-all@lists.01.org
> To unsubscribe send an email to kbuild-all-leave@lists.01.org
