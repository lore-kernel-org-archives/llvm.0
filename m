Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBFB7C
	for <llvm@lists.linux.dev>; Sun, 24 Apr 2022 11:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650800924; x=1682336924;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bK7lkwOx8GhEMs8AaNpbDNyDjZ4A4n5nPcVUeZeW2PE=;
  b=iPBt1FTRXT0KT0ghZzvUb2GSzdo9ITQkmO4SDiqp3JTIojH5tBu8gTXY
   EURAgONQkr8RIgarX+ONW7Au0GqqO3zcpL2QqzHbg6NWzE9Y8O0YhnflG
   vFmDfPbFSla4BIPlBhTfQNSFHyegpOh9HaHQ1IYBYY/6IqMuqdd2npWzL
   S9LwKJUuSOF+7ivaGF3ilGSAnP9M3RU58AlisA/RsXoSPZO5s8ktJH1En
   35wRAEUyJncko0weg4bUBhBCTtBH88GUI0eMjQusnHe5BFKeSz6WaK+HW
   gXOIbCbFAJWEXX3oQmI2ceZfTV2LdImy/PQ6YumTKSm33UVsIqPKZQA9Q
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10326"; a="265201441"
X-IronPort-AV: E=Sophos;i="5.90,286,1643702400"; 
   d="scan'208";a="265201441"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2022 04:48:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,286,1643702400"; 
   d="scan'208";a="594820063"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 24 Apr 2022 04:48:38 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1niajF-0001PL-7Z;
	Sun, 24 Apr 2022 11:48:37 +0000
Date: Sun, 24 Apr 2022 19:47:54 +0800
From: kernel test robot <lkp@intel.com>
To: menglong8.dong@gmail.com, ast@kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, rostedt@goodmis.org,
	mingo@redhat.com, davem@davemloft.net, yoshfuji@linux-ipv6.org,
	dsahern@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	benbjiang@tencent.com, flyingpeng@tencent.com,
	imagedong@tencent.com, edumazet@google.com, kafai@fb.com,
	talalahmad@google.com, keescook@chromium.org, mengensun@tencent.com,
	dongli.zhang@oracle.com, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH] bpf: init map_btf_id during compiling
Message-ID: <202204241926.3xdM8EYM-lkp@intel.com>
References: <20220424092613.863290-1-imagedong@tencent.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220424092613.863290-1-imagedong@tencent.com>

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on bpf-next/master]
[also build test WARNING on bpf/master net-next/master net/master linus/master v5.18-rc3 next-20220422]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/menglong8-dong-gmail-com/bpf-init-map_btf_id-during-compiling/20220424-172902
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20220424/202204241926.3xdM8EYM-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcfdc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a1d0d3f8a71cc20be0b95fe9506a3b3bd1b572b5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review menglong8-dong-gmail-com/bpf-init-map_btf_id-during-compiling/20220424-172902
        git checkout a1d0d3f8a71cc20be0b95fe9506a3b3bd1b572b5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash kernel/bpf/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/bpf/btf.c:4823:41: warning: unused variable 'btf_vmlinux_map_ops' [-Wunused-const-variable]
   static const struct bpf_map_ops * const btf_vmlinux_map_ops[] = {
                                           ^
   1 warning generated.


vim +/btf_vmlinux_map_ops +4823 kernel/bpf/btf.c

8580ac9404f624 Alexei Starovoitov 2019-10-15  4822  
41c48f3a982317 Andrey Ignatov     2020-06-19 @4823  static const struct bpf_map_ops * const btf_vmlinux_map_ops[] = {
41c48f3a982317 Andrey Ignatov     2020-06-19  4824  #define BPF_PROG_TYPE(_id, _name, prog_ctx_type, kern_ctx_type)
41c48f3a982317 Andrey Ignatov     2020-06-19  4825  #define BPF_LINK_TYPE(_id, _name)
41c48f3a982317 Andrey Ignatov     2020-06-19  4826  #define BPF_MAP_TYPE(_id, _ops) \
41c48f3a982317 Andrey Ignatov     2020-06-19  4827  	[_id] = &_ops,
41c48f3a982317 Andrey Ignatov     2020-06-19  4828  #include <linux/bpf_types.h>
41c48f3a982317 Andrey Ignatov     2020-06-19  4829  #undef BPF_PROG_TYPE
41c48f3a982317 Andrey Ignatov     2020-06-19  4830  #undef BPF_LINK_TYPE
41c48f3a982317 Andrey Ignatov     2020-06-19  4831  #undef BPF_MAP_TYPE
41c48f3a982317 Andrey Ignatov     2020-06-19  4832  };
41c48f3a982317 Andrey Ignatov     2020-06-19  4833  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
