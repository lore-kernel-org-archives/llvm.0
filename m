Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C76F33C4
	for <llvm@lists.linux.dev>; Sat, 28 May 2022 22:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653775202; x=1685311202;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hlRg9g52u5vxOk/jSrRWEoSqn/Oi/OW1YX3JORUOjGM=;
  b=NJfEXKcRkomOVOI+d1AsqvvH8tdkDXmXOQKLUp53NQqSoH000v7KPR4t
   r5hTQv4OJgpIDhbP3Ap4yzZK8ZtNBVG9MkDeXWjC+TWntG3aao5ET4ePl
   m14JXPAysXH9I0xVgtrtRg+572sE1vQs/FF64psq7ThpowuvvDJzvyHIC
   dxjrAGOY8Vm6gyfQpItVCaOD6hMxa812BQqQ1TEo6cCntuJfQMhoqA5bV
   IneesdnQ8ljl73S8v4dn/LGZaqeQxF7UQvnod5wTKbkVZ+WwcpkvSEfmZ
   OC6XTJBOAMLRDSO24FR5XRccNawvC/LKW4C0TTJmdGlOl5ji/nHsJQFUO
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10361"; a="274441359"
X-IronPort-AV: E=Sophos;i="5.91,259,1647327600"; 
   d="scan'208";a="274441359"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2022 15:00:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,259,1647327600"; 
   d="scan'208";a="550802214"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 28 May 2022 15:00:00 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nv4TX-0000Z2-Rg;
	Sat, 28 May 2022 21:59:59 +0000
Date: Sun, 29 May 2022 05:59:35 +0800
From: kernel test robot <lkp@intel.com>
To: Felix Fietkau <nbd@nbd.name>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC/RFT 2/2] mac80211: rework the airtime fairness
 implementation
Message-ID: <202205290520.I4cH1rY0-lkp@intel.com>
References: <20220528190756.31029-2-nbd@nbd.name>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220528190756.31029-2-nbd@nbd.name>

Hi Felix,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on wireless-next/main]
[also build test ERROR on wireless/main linus/master v5.18 next-20220527]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Felix-Fietkau/mac80211-fix-overflow-issues-in-airtime-fairness-code/20220529-030959
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
config: x86_64-randconfig-a003 (https://download.01.org/0day-ci/archive/20220529/202205290520.I4cH1rY0-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0fbe3f3f486e01448121f7931a4ca29fac1504ab)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/cf2b510572e85ecfada3512dbdf30efd02d882fa
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Felix-Fietkau/mac80211-fix-overflow-issues-in-airtime-fairness-code/20220529-030959
        git checkout cf2b510572e85ecfada3512dbdf30efd02d882fa
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from net/mac80211/main.c:28:
>> net/mac80211/ieee80211_i.h:1686:13: error: no member named 'v_t_cur' in 'struct airtime_info'
           return a1->v_t_cur - a2->v_t_cur;
                  ~~  ^
   net/mac80211/ieee80211_i.h:1686:27: error: no member named 'v_t_cur' in 'struct airtime_info'
           return a1->v_t_cur - a2->v_t_cur;
                                ~~  ^
   2 errors generated.
--
   In file included from net/mac80211/sta_info.c:23:
>> net/mac80211/ieee80211_i.h:1686:13: error: no member named 'v_t_cur' in 'struct airtime_info'
           return a1->v_t_cur - a2->v_t_cur;
                  ~~  ^
   net/mac80211/ieee80211_i.h:1686:27: error: no member named 'v_t_cur' in 'struct airtime_info'
           return a1->v_t_cur - a2->v_t_cur;
                                ~~  ^
   net/mac80211/sta_info.c:1909:6: warning: variable 'weight_sum' set but not used [-Wunused-but-set-variable]
           u64 weight_sum, weight_sum_reciprocal;
               ^
   1 warning and 2 errors generated.
--
   In file included from net/mac80211/tx.c:32:
>> net/mac80211/ieee80211_i.h:1686:13: error: no member named 'v_t_cur' in 'struct airtime_info'
           return a1->v_t_cur - a2->v_t_cur;
                  ~~  ^
   net/mac80211/ieee80211_i.h:1686:27: error: no member named 'v_t_cur' in 'struct airtime_info'
           return a1->v_t_cur - a2->v_t_cur;
                                ~~  ^
>> net/mac80211/tx.c:3888:16: error: no member named 'v_t_cur' in 'struct airtime_info'
           if (air_info->v_t_cur > air_sched->v_t) {
               ~~~~~~~~  ^
   net/mac80211/tx.c:3890:45: error: no member named 'v_t_cur' in 'struct airtime_info'
                           airtime_catchup_v_t(air_sched, air_info->v_t_cur, now);
                                                          ~~~~~~~~  ^
   net/mac80211/tx.c:3915:12: error: no member named 'v_t_cur' in 'struct airtime_info'
           air_info->v_t_cur = air_info->v_t + aql_time;
           ~~~~~~~~  ^
   5 errors generated.
--
   In file included from net/mac80211/rc80211_minstrel_ht.c:14:
   In file included from net/mac80211/rate.h:15:
>> net/mac80211/ieee80211_i.h:1686:13: error: no member named 'v_t_cur' in 'struct airtime_info'
           return a1->v_t_cur - a2->v_t_cur;
                  ~~  ^
   net/mac80211/ieee80211_i.h:1686:27: error: no member named 'v_t_cur' in 'struct airtime_info'
           return a1->v_t_cur - a2->v_t_cur;
                                ~~  ^
   net/mac80211/rc80211_minstrel_ht.c:1708:6: warning: variable 'n_supported' set but not used [-Wunused-but-set-variable]
           int n_supported = 0;
               ^
   1 warning and 2 errors generated.
--
   In file included from net/mac80211/trace.c:8:
   In file included from net/mac80211/driver-ops.h:12:
>> net/mac80211/ieee80211_i.h:1686:13: error: no member named 'v_t_cur' in 'struct airtime_info'
           return a1->v_t_cur - a2->v_t_cur;
                  ~~  ^
   net/mac80211/ieee80211_i.h:1686:27: error: no member named 'v_t_cur' in 'struct airtime_info'
           return a1->v_t_cur - a2->v_t_cur;
                                ~~  ^
   In file included from net/mac80211/trace.c:11:
   In file included from net/mac80211/trace.h:2908:
   include/trace/define_trace.h:95:10: fatal error: './trace.h' file not found
   #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/define_trace.h:90:32: note: expanded from macro 'TRACE_INCLUDE'
   # define TRACE_INCLUDE(system) __TRACE_INCLUDE(system)
                                  ^~~~~~~~~~~~~~~~~~~~~~~
   include/trace/define_trace.h:87:34: note: expanded from macro '__TRACE_INCLUDE'
   # define __TRACE_INCLUDE(system) __stringify(TRACE_INCLUDE_PATH/system.h)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/stringify.h:10:27: note: expanded from macro '__stringify'
   #define __stringify(x...)       __stringify_1(x)
                                   ^~~~~~~~~~~~~~~~
   include/linux/stringify.h:9:29: note: expanded from macro '__stringify_1'
   #define __stringify_1(x...)     #x
                                   ^~
   <scratch space>:123:1: note: expanded from here
   "./trace.h"
   ^~~~~~~~~~~
   3 errors generated.


vim +1686 net/mac80211/ieee80211_i.h

  1676	
  1677	static inline int
  1678	airtime_sched_cmp(struct airtime_sched_list *list,
  1679			  struct airtime_sched_node *n1, struct airtime_sched_node *n2)
  1680	{
  1681		struct airtime_info *a1, *a2;
  1682	
  1683		a1 = container_of(n1, struct airtime_info, schedule_order);
  1684		a2 = container_of(n2, struct airtime_info, schedule_order);
  1685	
> 1686		return a1->v_t_cur - a2->v_t_cur;
  1687	}
  1688	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
