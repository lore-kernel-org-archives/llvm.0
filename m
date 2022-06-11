Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615617F3
	for <llvm@lists.linux.dev>; Sat, 11 Jun 2022 10:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654942937; x=1686478937;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1FQ1UCouIaP6LU42YfbC0jlHmjtqheR5eWTCBmjbZqw=;
  b=eNfNTkBBQLWnkZhMcfIMYnjS0qbbbHMJgouGsbJ2L3IUjkk+ui3NTM9e
   2N2oREqdyInh4j+CF42DNaLdFzymlAPKsz7JGYgjmV4v5HXNdKkNo07/+
   VJpfpBgECQlcVCyVckVtDnpoyAq7PZKDeX9K0GyD1jgtg4ny4nCw1f2mV
   BtgCSc6mM9o/yjzyWXtIpfwATEKmhbFPyTPAqtJnr2lxZrYqwdyait1lr
   c6NDA9+lIXt0A1clutj0nQuGqhCvWj8Is1NaGdapdnFQlUQoDgJwaQ16M
   mklDBxtTWTP/fQCSzcv5PP03PIkFk5vqvJAAhoV1d6LQmC9DmH+Bgwy6x
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="303242745"
X-IronPort-AV: E=Sophos;i="5.91,293,1647327600"; 
   d="scan'208";a="303242745"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2022 03:22:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,293,1647327600"; 
   d="scan'208";a="556760939"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 11 Jun 2022 03:22:10 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nzyFu-000InX-4C;
	Sat, 11 Jun 2022 10:22:10 +0000
Date: Sat, 11 Jun 2022 18:22:03 +0800
From: kernel test robot <lkp@intel.com>
To: Yosry Ahmed <yosryahmed@google.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Hao Luo <haoluo@google.com>,
	Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Michal Hocko <mhocko@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Roman Gushchin <roman.gushchin@linux.dev>,
	David Rientjes <rientjes@google.com>,
	Stanislav Fomichev <sdf@google.com>,
	Greg Thelen <gthelen@google.com>,
	Shakeel Butt <shakeelb@google.com>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, bpf@vger.kernel.org,
	cgroups@vger.kernel.org, Yosry Ahmed <yosryahmed@google.com>
Subject: Re: [PATCH bpf-next v2 6/8] cgroup: bpf: enable bpf programs to
 integrate with rstat
Message-ID: <202206111842.O3viR9gq-lkp@intel.com>
References: <20220610194435.2268290-7-yosryahmed@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610194435.2268290-7-yosryahmed@google.com>

Hi Yosry,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Yosry-Ahmed/bpf-rstat-cgroup-hierarchical-stats/20220611-034720
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
config: hexagon-randconfig-r012-20220611 (https://download.01.org/0day-ci/archive/20220611/202206111842.O3viR9gq-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ff4abe755279a3a47cc416ef80dbc900d9a98a19)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/83f297e2b47dc41b511f071b9eadf38339387b41
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yosry-Ahmed/bpf-rstat-cgroup-hierarchical-stats/20220611-034720
        git checkout 83f297e2b47dc41b511f071b9eadf38339387b41
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash kernel/cgroup/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> kernel/cgroup/rstat.c:161:22: warning: no previous prototype for function 'bpf_rstat_flush' [-Wmissing-prototypes]
   __weak noinline void bpf_rstat_flush(struct cgroup *cgrp,
                        ^
   kernel/cgroup/rstat.c:161:17: note: declare 'static' if the function is not intended to be used outside of this translation unit
   __weak noinline void bpf_rstat_flush(struct cgroup *cgrp,
                   ^
                   static 
>> kernel/cgroup/rstat.c:509:3: error: field designator 'sleepable_set' does not refer to any field in type 'const struct btf_kfunc_id_set'
           .sleepable_set  = &bpf_rstat_sleepable_kfunc_ids,
            ^
   1 warning and 1 error generated.


vim +509 kernel/cgroup/rstat.c

   505	
   506	static const struct btf_kfunc_id_set bpf_rstat_kfunc_set = {
   507		.owner		= THIS_MODULE,
   508		.check_set	= &bpf_rstat_check_kfunc_ids,
 > 509		.sleepable_set	= &bpf_rstat_sleepable_kfunc_ids,
   510	};
   511	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
