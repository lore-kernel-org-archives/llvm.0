Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5BE1863;
	Thu,  4 May 2023 10:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683196710; x=1714732710;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iS70t4FeEa2a2F8WILyDHhYmEoGn1/VGQcL+DHz+314=;
  b=f8BD9bXrMk7nfSjCI//CIuqu7qqo94GJJ+vdtNamIctfkKuAYXh/7mK9
   sFRWYZlvukK5Dbyf5C0ss4kmvn+d1Eh9HYzfT9AIIZap2rw+YZtyklQrY
   gLBL8k9DQ/v397DblVUqbdrvK2xv61wRfzI7usQrELMrZmJNxA6tHG4CY
   j0e9RgUgJl9BylUJit6YuGRqn1TLYh959d7NnB5E4KaLkmk6ZDgS2Lwk1
   JXsxv75eEzBWV5Kub2mYD1vAcQEqDAGa7+YTIit9BQL3o8eYPns/y4cLd
   av6HpeuqGTz+5RT2h4EuIl2bBbfpxoJnnHMpsyHamukjWkadBmwDrePwS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="329256695"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="329256695"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 03:38:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="871296204"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="871296204"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 04 May 2023 03:38:27 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puWLt-0002qs-1l;
	Thu, 04 May 2023 10:38:21 +0000
Date: Thu, 4 May 2023 18:37:23 +0800
From: kernel test robot <lkp@intel.com>
To: Aditi Ghag <aditi.ghag@isovalent.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7 bpf-next 04/10] udp: seq_file: Remove bpf_seq_afinfo
 from udp_iter_state
Message-ID: <202305041828.hgd3q82B-lkp@intel.com>
References: <20230503225351.3700208-5-aditi.ghag@isovalent.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230503225351.3700208-5-aditi.ghag@isovalent.com>

Hi Aditi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Aditi-Ghag/bpf-tcp-Avoid-taking-fast-sock-lock-in-iterator/20230504-065508
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230503225351.3700208-5-aditi.ghag%40isovalent.com
patch subject: [PATCH v7 bpf-next 04/10] udp: seq_file: Remove bpf_seq_afinfo from udp_iter_state
config: i386-randconfig-a011-20230501 (https://download.01.org/0day-ci/archive/20230504/202305041828.hgd3q82B-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/abadc0049c37c3ab51bc0893c69a6a22019c46bd
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Aditi-Ghag/bpf-tcp-Avoid-taking-fast-sock-lock-in-iterator/20230504-065508
        git checkout abadc0049c37c3ab51bc0893c69a6a22019c46bd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash net/ipv4/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305041828.hgd3q82B-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ipv4/udp.c:3001:36: warning: unused variable 'bpf_iter_udp_seq_ops' [-Wunused-const-variable]
   static const struct seq_operations bpf_iter_udp_seq_ops;
                                      ^
   1 warning generated.


vim +/bpf_iter_udp_seq_ops +3001 net/ipv4/udp.c

  3000	
> 3001	static const struct seq_operations bpf_iter_udp_seq_ops;
  3002	static struct udp_table *udp_get_table_seq(struct seq_file *seq,
  3003						   struct net *net)
  3004	{
  3005		const struct udp_seq_afinfo *afinfo;
  3006	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
