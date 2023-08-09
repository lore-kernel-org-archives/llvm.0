Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3C9211C;
	Wed,  9 Aug 2023 06:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691560914; x=1723096914;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=62vBEsNLqi1Mjl+DIxfpijOYd5i+/By8huTMmJzzxY0=;
  b=Ph6UOq35BCYsL2ewY7GI/Q4vAav+q4tNckt1hYjUVmz8j7tWAR8COt2Y
   zpCh+361MFxBX8CFAFiYCkw3mgY6h0TGBkjXQoH73sVwxONVADbHxXKDc
   sDpzebIxz62XiyAROkjsAdObmCWeuS5BectLi9bLJDdvv0Hw0mO32IgAA
   aNh9QcRIdDktvNKPL0rbZtPmBVmJ/v1VFw5nPb8s1oYTwvM7iWZp/D04T
   czJPBznXnQLLB/rZNFb1PDb+y/MZseP7i8TEm2vQdNTv8rhQ+iKfS7x2j
   DDS4dhoSyM1Mb3jja7NxXpAX3Bs2faY21Y9AZT3YQzeb4Czweq2g11ocs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="355996473"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="355996473"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 23:01:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="761224544"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="761224544"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 08 Aug 2023 23:01:23 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTcG2-0005qi-2y;
	Wed, 09 Aug 2023 06:01:22 +0000
Date: Wed, 9 Aug 2023 14:01:20 +0800
From: kernel test robot <lkp@intel.com>
To: Breno Leitao <leitao@debian.org>, sdf@google.com, axboe@kernel.dk,
	asml.silence@gmail.com, willemdebruijn.kernel@gmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, io-uring@vger.kernel.org, kuba@kernel.org,
	pabeni@redhat.com
Subject: Re: [PATCH v2 3/8] io_uring/cmd: Introduce SOCKET_URING_OP_SETSOCKOPT
Message-ID: <202308091352.OnDIGFfN-lkp@intel.com>
References: <20230808134049.1407498-4-leitao@debian.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230808134049.1407498-4-leitao@debian.org>

Hi Breno,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20230808]
[cannot apply to bpf-next/master bpf/master net/main net-next/main linus/master horms-ipvs/master v6.5-rc5 v6.5-rc4 v6.5-rc3 v6.5-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Breno-Leitao/net-expose-sock_use_custom_sol_socket/20230809-011901
base:   next-20230808
patch link:    https://lore.kernel.org/r/20230808134049.1407498-4-leitao%40debian.org
patch subject: [PATCH v2 3/8] io_uring/cmd: Introduce SOCKET_URING_OP_SETSOCKOPT
config: hexagon-randconfig-r041-20230808 (https://download.01.org/0day-ci/archive/20230809/202308091352.OnDIGFfN-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308091352.OnDIGFfN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308091352.OnDIGFfN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: sock_setsockopt
   >>> referenced by uring_cmd.c
   >>>               io_uring/uring_cmd.o:(io_uring_cmd_sock) in archive vmlinux.a
   >>> referenced by uring_cmd.c
   >>>               io_uring/uring_cmd.o:(io_uring_cmd_sock) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
