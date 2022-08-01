Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CC37F
	for <llvm@lists.linux.dev>; Mon,  1 Aug 2022 14:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659365135; x=1690901135;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N3kJUozwNWYuhBjEeQrJ7y3It/lpGzr+ftVqH3Mq8NQ=;
  b=awn7xs4VhdUHzxn0do5yPUYEBa/nCHmWH48q9mL2u9l8YBdwXTLgNIWD
   MPJp1uqPG7PEeR4z4R6+9Tz+8wbXzg/KUjRoWYwIOo4xrdMKZzELZLq5C
   NB680FbqtQuceMBfUpUgX31inbe/qWTglTQieEeoYdriRdbsf84aDApvN
   fcOqN6S5+OsQjoVAel0fqJJKaP1IadmoqaeRbDi/4pyZmXcBRZJUfOs3X
   l9ny13PdPsd1WEYX2TM4TCG2lSFovhQxtiIHqRtzJ4TPnscs0cHWVwGgQ
   M7V9+zwfV/034sc1j6LQA4tRt8vBb6MOzCP5+wcEWF7YgTPqwvXVpNZwa
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="268925744"
X-IronPort-AV: E=Sophos;i="5.93,208,1654585200"; 
   d="scan'208";a="268925744"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2022 07:45:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,208,1654585200"; 
   d="scan'208";a="552532136"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 01 Aug 2022 07:45:33 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oIWfk-000F6z-2y;
	Mon, 01 Aug 2022 14:45:32 +0000
Date: Mon, 1 Aug 2022 22:44:38 +0800
From: kernel test robot <lkp@intel.com>
To: Dmytro SHYTYI <dmytro@shytyi.net>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH mptcp-next v4] mptcp: Fast Open Mechanism
Message-ID: <202208012231.LBppAj4q-lkp@intel.com>
References: <20220801024656.397714-1-dmytro@shytyi.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220801024656.397714-1-dmytro@shytyi.net>

Hi Dmytro,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on mptcp/export]
[cannot apply to linus/master v5.19 next-20220728]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmytro-SHYTYI/mptcp-Fast-Open-Mechanism/20220801-104819
base:   https://github.com/multipath-tcp/mptcp_net-next.git export
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220801/202208012231.LBppAj4q-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6222c0fe0b73c1e72446173527266777f4ffe855
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dmytro-SHYTYI/mptcp-Fast-Open-Mechanism/20220801-104819
        git checkout 6222c0fe0b73c1e72446173527266777f4ffe855
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   net/ipv4/tcp_output.c:186:3: warning: result of comparison of constant -1 with expression of type 'u8' (aka 'unsigned char') is always false [-Wtautological-constant-out-of-range-compare]
                   NET_ADD_STATS(sock_net(sk), LINUX_MIB_TCPACKCOMPRESSED,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/ip.h:293:41: note: expanded from macro 'NET_ADD_STATS'
   #define NET_ADD_STATS(net, field, adnd) SNMP_ADD_STATS((net)->mib.net_statistics, field, adnd)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/snmp.h:143:4: note: expanded from macro 'SNMP_ADD_STATS'
                           this_cpu_add(mib->mibs[field], addend)
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:509:33: note: expanded from macro 'this_cpu_add'
   #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, pcp, val)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   <scratch space>:186:1: note: expanded from here
   this_cpu_add_8
   ^
   arch/x86/include/asm/percpu.h:326:35: note: expanded from macro 'this_cpu_add_8'
   #define this_cpu_add_8(pcp, val)                percpu_add_op(8, volatile, (pcp), val)
                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/percpu.h:127:31: note: expanded from macro 'percpu_add_op'
                                 ((val) == 1 || (val) == -1)) ?            \
                                                ~~~~~ ^  ~~
>> net/ipv4/tcp_output.c:747:54: error: too many arguments to function call, expected 3, have 4
                   if (mptcp_synack_options(req, &size, &opts->mptcp, &opts->options)) {
                       ~~~~~~~~~~~~~~~~~~~~                           ^~~~~~~~~~~~~~
   include/net/mptcp.h:249:20: note: 'mptcp_synack_options' declared here
   static inline bool mptcp_synack_options(const struct request_sock *req,
                      ^
   1 warning and 1 error generated.


vim +747 net/ipv4/tcp_output.c

   739	
   740	static void mptcp_set_option_cond(const struct request_sock *req,
   741					  struct tcp_out_options *opts,
   742					  unsigned int *remaining)
   743	{
   744		if (rsk_is_mptcp(req)) {
   745			unsigned int size;
   746	
 > 747			if (mptcp_synack_options(req, &size, &opts->mptcp, &opts->options)) {
   748				if (*remaining >= size) {
   749					opts->options |= OPTION_MPTCP;
   750					*remaining -= size;
   751				}
   752			}
   753		}
   754	}
   755	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
