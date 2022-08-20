Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5779B19B
	for <llvm@lists.linux.dev>; Sat, 20 Aug 2022 00:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660953798; x=1692489798;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=06cewc+clZxP7xd/tYAo0kMTF4VMD/eMFsSQV/Sz0vg=;
  b=dk/rnWu3VawTIHdEjLq4xpDd+r0GqTrsTnI+tlNfH1pQAIhWngWnzKEt
   RdLYLlZFCaR7MjddZWhgkTKsPbvrqn57g+86pAfUzRL4rWioUV11ZoM41
   8p4y1Bg9WrDMm4p3UaVgtdwZIR8nT/mFYAo0EdREmb74ChYt2druHU4Yj
   st7s3n7ZQ2Z4pZm5m4iBpwWBO7WGxd6ieCjBS7cHQIMMgxJAWpaEmmtNJ
   IiDK5IVrH4/Gs6yDfIYrjwhyB1SnEXYShJzvaO50yW9VleOjD35NjYdgt
   n5ceYuKhzEqGKfIp3Km8W76DKA9/bZ+DGCnAhNdUYkH39KQaZ0o53z5Go
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10444"; a="291875285"
X-IronPort-AV: E=Sophos;i="5.93,249,1654585200"; 
   d="scan'208";a="291875285"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2022 17:03:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,249,1654585200"; 
   d="scan'208";a="697719158"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Aug 2022 17:03:16 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oPBxM-0001w9-0C;
	Sat, 20 Aug 2022 00:03:16 +0000
Date: Sat, 20 Aug 2022 08:03:09 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v3 bpf-next 01/15] bpf: Introduce any context BPF
 specific memory allocator.
Message-ID: <202208200754.DmNmnDs3-lkp@intel.com>
References: <20220819214232.18784-2-alexei.starovoitov@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220819214232.18784-2-alexei.starovoitov@gmail.com>

Hi Alexei,

I love your patch! Yet something to improve:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexei-Starovoitov/bpf-BPF-specific-memory-allocator/20220820-054421
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
config: powerpc-randconfig-r035-20220820 (https://download.01.org/0day-ci/archive/20220820/202208200754.DmNmnDs3-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 0ac597f3cacf60479ffd36b03766fa7462dabd78)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/430052d4904f4c7e48cd90f0d4efeb45f73ea69e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Alexei-Starovoitov/bpf-BPF-specific-memory-allocator/20220820-054421
        git checkout 430052d4904f4c7e48cd90f0d4efeb45f73ea69e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash kernel/bpf/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   kernel/bpf/memalloc.c:84:2: error: unknown type name 'local_t'
           local_t active;
           ^
>> kernel/bpf/memalloc.c:178:7: error: implicit declaration of function 'local_inc_return' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   if (local_inc_return(&c->active) == 1) {
                       ^
   kernel/bpf/memalloc.c:178:7: note: did you mean 'atomic_inc_return'?
   include/linux/atomic/atomic-instrumented.h:195:1: note: 'atomic_inc_return' declared here
   atomic_inc_return(atomic_t *v)
   ^
>> kernel/bpf/memalloc.c:182:3: error: implicit declaration of function 'local_dec' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   local_dec(&c->active);
                   ^
   kernel/bpf/memalloc.c:207:7: error: implicit declaration of function 'local_inc_return' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   if (local_inc_return(&c->active) == 1) {
                       ^
   kernel/bpf/memalloc.c:214:3: error: implicit declaration of function 'local_dec' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   local_dec(&c->active);
                   ^
   kernel/bpf/memalloc.c:380:6: error: implicit declaration of function 'local_inc_return' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           if (local_inc_return(&c->active) == 1) {
               ^
   kernel/bpf/memalloc.c:385:2: error: implicit declaration of function 'local_dec' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           local_dec(&c->active);
           ^
   kernel/bpf/memalloc.c:408:6: error: implicit declaration of function 'local_inc_return' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           if (local_inc_return(&c->active) == 1) {
               ^
   kernel/bpf/memalloc.c:420:2: error: implicit declaration of function 'local_dec' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           local_dec(&c->active);
           ^
   9 errors generated.


vim +/local_inc_return +178 kernel/bpf/memalloc.c

   156	
   157	/* Mostly runs from irq_work except __init phase. */
   158	static void alloc_bulk(struct bpf_mem_cache *c, int cnt, int node)
   159	{
   160		struct mem_cgroup *memcg = NULL, *old_memcg;
   161		unsigned long flags;
   162		void *obj;
   163		int i;
   164	
   165		memcg = get_memcg(c);
   166		old_memcg = set_active_memcg(memcg);
   167		for (i = 0; i < cnt; i++) {
   168			obj = __alloc(c, node);
   169			if (!obj)
   170				break;
   171			if (IS_ENABLED(CONFIG_PREEMPT_RT))
   172				/* In RT irq_work runs in per-cpu kthread, so disable
   173				 * interrupts to avoid preemption and interrupts and
   174				 * reduce the chance of bpf prog executing on this cpu
   175				 * when active counter is busy.
   176				 */
   177				local_irq_save(flags);
 > 178			if (local_inc_return(&c->active) == 1) {
   179				__llist_add(obj, &c->free_llist);
   180				c->free_cnt++;
   181			}
 > 182			local_dec(&c->active);
   183			if (IS_ENABLED(CONFIG_PREEMPT_RT))
   184				local_irq_restore(flags);
   185		}
   186		set_active_memcg(old_memcg);
   187		mem_cgroup_put(memcg);
   188	}
   189	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
