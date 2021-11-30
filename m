Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31802C80
	for <llvm@lists.linux.dev>; Tue, 30 Nov 2021 04:22:31 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10183"; a="234864457"
X-IronPort-AV: E=Sophos;i="5.87,275,1631602800"; 
   d="scan'208";a="234864457"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2021 20:22:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,275,1631602800"; 
   d="scan'208";a="608991235"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 29 Nov 2021 20:22:29 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mruey-000Cjw-TZ; Tue, 30 Nov 2021 04:22:28 +0000
Date: Tue, 30 Nov 2021 12:21:27 +0800
From: kernel test robot <lkp@intel.com>
To: Hao Luo <haoluo@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH bpf-next v2 4/9] bpf: Replace PTR_TO_XXX_OR_NULL with
 PTR_TO_XXX | PTR_MAYBE_NULL
Message-ID: <202111301214.JYWypTyw-lkp@intel.com>
References: <20211130012948.380602-5-haoluo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211130012948.380602-5-haoluo@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Hao,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on bpf-next/master]

url:    https://github.com/0day-ci/linux/commits/Hao-Luo/Introduce-composable-bpf-types/20211130-093143
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
config: arm-buildonly-randconfig-r005-20211128 (https://download.01.org/0day-ci/archive/20211130/202111301214.JYWypTyw-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 25eb7fa01d7ebbe67648ea03841cda55b4239ab2)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/9e92c0a723fc173ac102b3bb27df479a01f32896
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Hao-Luo/Introduce-composable-bpf-types/20211130-093143
        git checkout 9e92c0a723fc173ac102b3bb27df479a01f32896
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash kernel/bpf/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/bpf/verifier.c:533:21: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
   static const char * const reg_type_str(enum bpf_reg_type type)
                       ^~~~~~
   kernel/bpf/verifier.c:6545:5: warning: format specifies type 'int' but the argument has type 'unsigned long' [-Wformat]
                                   BPF_BASE_TYPE(ret_type), func_id_name(func_id),
                                   ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:326:26: note: expanded from macro 'BPF_BASE_TYPE'
   #define BPF_BASE_TYPE(x)        ((x) & BPF_BASE_TYPE_MASK)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:6556:4: warning: format specifies type 'int' but the argument has type 'unsigned long' [-Wformat]
                           BPF_BASE_TYPE(ret_type), func_id_name(func_id), func_id);
                           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:326:26: note: expanded from macro 'BPF_BASE_TYPE'
   #define BPF_BASE_TYPE(x)        ((x) & BPF_BASE_TYPE_MASK)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   3 warnings generated.


vim +/const +533 kernel/bpf/verifier.c

   531	
   532	/* string representation of 'enum bpf_reg_type' */
 > 533	static const char * const reg_type_str(enum bpf_reg_type type)
   534	{
   535		static const char * const str[] = {
   536			[NOT_INIT]		= "?",
   537			[SCALAR_VALUE]		= "inv",
   538			[PTR_TO_CTX]		= "ctx",
   539			[CONST_PTR_TO_MAP]	= "map_ptr",
   540			[PTR_TO_MAP_VALUE]	= "map_value",
   541			[PTR_TO_STACK]		= "fp",
   542			[PTR_TO_PACKET]		= "pkt",
   543			[PTR_TO_PACKET_META]	= "pkt_meta",
   544			[PTR_TO_PACKET_END]	= "pkt_end",
   545			[PTR_TO_FLOW_KEYS]	= "flow_keys",
   546			[PTR_TO_SOCKET]		= "sock",
   547			[PTR_TO_SOCK_COMMON]	= "sock_common",
   548			[PTR_TO_TCP_SOCK]	= "tcp_sock",
   549			[PTR_TO_TP_BUFFER]	= "tp_buffer",
   550			[PTR_TO_XDP_SOCK]	= "xdp_sock",
   551			[PTR_TO_BTF_ID]		= "ptr_",
   552			[PTR_TO_PERCPU_BTF_ID]	= "percpu_ptr_",
   553			[PTR_TO_MEM]		= "mem",
   554			[PTR_TO_RDONLY_BUF]	= "rdonly_buf",
   555			[PTR_TO_RDWR_BUF]	= "rdwr_buf",
   556			[PTR_TO_FUNC]		= "func",
   557			[PTR_TO_MAP_KEY]	= "map_key",
   558		};
   559	
   560		return str[BPF_BASE_TYPE(type)];
   561	}
   562	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
