Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85311468B;
	Wed,  9 Aug 2023 04:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691554685; x=1723090685;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BiBLxiXXW0roMyU9uVFtT4aTm3ZZI6IWHSqR6mmpuy8=;
  b=fik9m7qOiIvRxo5OUr6rwZi5OyyDKoPM8RNOxwzugcQcahZzz0YZ9TcA
   danEL7IOrzgrg4J+zqoiGeh0lPgrjvRWump+6WiUF8iWIHaE/wv+dlFqc
   eium1rjmNX7ufaV0EDirHSjNERMtunlJ27oa7TeRYf2NX3+4NXouAtT2v
   2lUT1v8sYG9nGTJHX/wkShWOYraldibjLeZ2c5pKpS7alrRtCYco6uFWF
   987qKkvK/0AB9FHrNms3/E3kSbSMNwtKFYpBzsj50XiKoyjw/+ddI0hac
   Dp3WbyWRb5zCOzpf0KwLlYRk4NpqMBlMeU6OaVTASlYlu8mE6G62/JlRN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="361140109"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="361140109"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 21:08:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="978220412"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="978220412"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 08 Aug 2023 21:08:22 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTaUf-0005na-0d;
	Wed, 09 Aug 2023 04:08:21 +0000
Date: Wed, 9 Aug 2023 12:07:27 +0800
From: kernel test robot <lkp@intel.com>
To: Breno Leitao <leitao@debian.org>, sdf@google.com, axboe@kernel.dk,
	asml.silence@gmail.com, willemdebruijn.kernel@gmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, io-uring@vger.kernel.org, kuba@kernel.org,
	pabeni@redhat.com
Subject: Re: [PATCH v2 2/8] io_uring/cmd: Introduce SOCKET_URING_OP_GETSOCKOPT
Message-ID: <202308091103.ylvbuCww-lkp@intel.com>
References: <20230808134049.1407498-3-leitao@debian.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230808134049.1407498-3-leitao@debian.org>

Hi Breno,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20230808]
[cannot apply to bpf-next/master bpf/master net/main net-next/main linus/master horms-ipvs/master v6.5-rc5 v6.5-rc4 v6.5-rc3 v6.5-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Breno-Leitao/net-expose-sock_use_custom_sol_socket/20230809-011901
base:   next-20230808
patch link:    https://lore.kernel.org/r/20230808134049.1407498-3-leitao%40debian.org
patch subject: [PATCH v2 2/8] io_uring/cmd: Introduce SOCKET_URING_OP_GETSOCKOPT
config: hexagon-randconfig-r041-20230808 (https://download.01.org/0day-ci/archive/20230809/202308091103.ylvbuCww-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308091103.ylvbuCww-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308091103.ylvbuCww-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: sk_getsockopt
   >>> referenced by uring_cmd.c
   >>>               io_uring/uring_cmd.o:(io_uring_cmd_sock) in archive vmlinux.a
   >>> referenced by uring_cmd.c
   >>>               io_uring/uring_cmd.o:(io_uring_cmd_sock) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
