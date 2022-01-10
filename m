Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14331168
	for <llvm@lists.linux.dev>; Mon, 10 Jan 2022 19:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641841212; x=1673377212;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vr1cxxq9/3VmrMkyfz/ryMyc8x31UKaq/SpoFW5djOI=;
  b=Jqu6gAwnKde58SpWe/hWq3iHEwsnh7k0N+NuWPGzvPdaJIpDUNpEpxdz
   RnGdz/jL+tVvyPZNmNZs8pv/TiTsnXoNh3IczX+zG/caz7lC9i1v6fHYr
   nq2/dcdcgg2TexoGNWqbedEGcr1SgPVnyS+qrC5f0WgSmN7eItITm/oD0
   DNtaNeNeIhHd4ml7LamHkqCyJvb9eTi+EQKx1TpxETiElPF0pWIIc9u/V
   44zft4WJr39GCtqeiat3Ahl1UXeBGELuQdToZENfmDFABcH03ekv3SgBA
   L95bh7UYeX3Z6Owq1PA4z5jVzkCEdWEi5/+SDGTcijdsEOs2/+98X9nom
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="243253661"
X-IronPort-AV: E=Sophos;i="5.88,277,1635231600"; 
   d="scan'208";a="243253661"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2022 11:00:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,277,1635231600"; 
   d="scan'208";a="575919466"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 10 Jan 2022 11:00:10 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n6ztp-0003rc-CL; Mon, 10 Jan 2022 19:00:09 +0000
Date: Tue, 11 Jan 2022 02:59:39 +0800
From: kernel test robot <lkp@intel.com>
To: Wolfgang Bumiller <w.bumiller@proxmox.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v2] blk-cgroup: always terminate io.stat lines
Message-ID: <202201110247.qH9hWEzx-lkp@intel.com>
References: <20220110153457.5894-1-w.bumiller@proxmox.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220110153457.5894-1-w.bumiller@proxmox.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Wolfgang,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on v5.16 next-20220110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Wolfgang-Bumiller/blk-cgroup-always-terminate-io-stat-lines/20220110-233543
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
config: hexagon-buildonly-randconfig-r003-20220110 (https://download.01.org/0day-ci/archive/20220111/202201110247.qH9hWEzx-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5c46c1c23abb4a01f7f40bfcb8851cb893739e14)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/c9dc1e57476c43bd1d0df31c43db298a2be92e8e
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Wolfgang-Bumiller/blk-cgroup-always-terminate-io-stat-lines/20220110-233543
        git checkout c9dc1e57476c43bd1d0df31c43db298a2be92e8e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> block/blk-iolatency.c:917:1: error: non-void function does not return a value [-Werror,-Wreturn-type]
   }
   ^
>> block/blk-iolatency.c:929:3: error: void function 'iolatency_pd_stat' should not return a value [-Wreturn-type]
                   return iolatency_ssd_stat(iolat, s);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +917 block/blk-iolatency.c

d70675121546c3 Josef Bacik            2018-07-03  893  
252c651a4c854b Christoph Hellwig      2021-08-10  894  static bool iolatency_ssd_stat(struct iolatency_grp *iolat, struct seq_file *s)
1fa2840e56f903 Josef Bacik            2018-09-28  895  {
1fa2840e56f903 Josef Bacik            2018-09-28  896  	struct latency_stat stat;
1fa2840e56f903 Josef Bacik            2018-09-28  897  	int cpu;
1fa2840e56f903 Josef Bacik            2018-09-28  898  
1fa2840e56f903 Josef Bacik            2018-09-28  899  	latency_stat_init(iolat, &stat);
1fa2840e56f903 Josef Bacik            2018-09-28  900  	preempt_disable();
1fa2840e56f903 Josef Bacik            2018-09-28  901  	for_each_online_cpu(cpu) {
1fa2840e56f903 Josef Bacik            2018-09-28  902  		struct latency_stat *s;
1fa2840e56f903 Josef Bacik            2018-09-28  903  		s = per_cpu_ptr(iolat->stats, cpu);
1fa2840e56f903 Josef Bacik            2018-09-28  904  		latency_stat_sum(iolat, &stat, s);
1fa2840e56f903 Josef Bacik            2018-09-28  905  	}
1fa2840e56f903 Josef Bacik            2018-09-28  906  	preempt_enable();
1fa2840e56f903 Josef Bacik            2018-09-28  907  
1fa2840e56f903 Josef Bacik            2018-09-28  908  	if (iolat->rq_depth.max_depth == UINT_MAX)
252c651a4c854b Christoph Hellwig      2021-08-10  909  		seq_printf(s, " missed=%llu total=%llu depth=max",
1fa2840e56f903 Josef Bacik            2018-09-28  910  			(unsigned long long)stat.ps.missed,
1fa2840e56f903 Josef Bacik            2018-09-28  911  			(unsigned long long)stat.ps.total);
252c651a4c854b Christoph Hellwig      2021-08-10  912  	else
252c651a4c854b Christoph Hellwig      2021-08-10  913  		seq_printf(s, " missed=%llu total=%llu depth=%u",
1fa2840e56f903 Josef Bacik            2018-09-28  914  			(unsigned long long)stat.ps.missed,
1fa2840e56f903 Josef Bacik            2018-09-28  915  			(unsigned long long)stat.ps.total,
1fa2840e56f903 Josef Bacik            2018-09-28  916  			iolat->rq_depth.max_depth);
1fa2840e56f903 Josef Bacik            2018-09-28 @917  }
1fa2840e56f903 Josef Bacik            2018-09-28  918  
c9dc1e57476c43 Wolfgang Bumiller      2022-01-10  919  static void iolatency_pd_stat(struct blkg_policy_data *pd, struct seq_file *s)
d70675121546c3 Josef Bacik            2018-07-03  920  {
d70675121546c3 Josef Bacik            2018-07-03  921  	struct iolatency_grp *iolat = pd_to_lat(pd);
1fa2840e56f903 Josef Bacik            2018-09-28  922  	unsigned long long avg_lat;
1fa2840e56f903 Josef Bacik            2018-09-28  923  	unsigned long long cur_win;
1fa2840e56f903 Josef Bacik            2018-09-28  924  
07b0fdecb24773 Tejun Heo              2019-07-16  925  	if (!blkcg_debug_stats)
c9dc1e57476c43 Wolfgang Bumiller      2022-01-10  926  		return;
07b0fdecb24773 Tejun Heo              2019-07-16  927  
1fa2840e56f903 Josef Bacik            2018-09-28  928  	if (iolat->ssd)
252c651a4c854b Christoph Hellwig      2021-08-10 @929  		return iolatency_ssd_stat(iolat, s);
d70675121546c3 Josef Bacik            2018-07-03  930  
1fa2840e56f903 Josef Bacik            2018-09-28  931  	avg_lat = div64_u64(iolat->lat_avg, NSEC_PER_USEC);
1fa2840e56f903 Josef Bacik            2018-09-28  932  	cur_win = div64_u64(iolat->cur_win_nsec, NSEC_PER_MSEC);
a284390b397ae2 Josef Bacik            2018-07-11  933  	if (iolat->rq_depth.max_depth == UINT_MAX)
252c651a4c854b Christoph Hellwig      2021-08-10  934  		seq_printf(s, " depth=max avg_lat=%llu win=%llu",
c480bcf97b186a Dennis Zhou (Facebook  2018-08-01  935) 			avg_lat, cur_win);
252c651a4c854b Christoph Hellwig      2021-08-10  936  	else
252c651a4c854b Christoph Hellwig      2021-08-10  937  		seq_printf(s, " depth=%u avg_lat=%llu win=%llu",
c480bcf97b186a Dennis Zhou (Facebook  2018-08-01  938) 			iolat->rq_depth.max_depth, avg_lat, cur_win);
d70675121546c3 Josef Bacik            2018-07-03  939  }
d70675121546c3 Josef Bacik            2018-07-03  940  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
