Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB321601C
	for <llvm@lists.linux.dev>; Tue, 26 Jul 2022 20:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658866810; x=1690402810;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Sk6K2LPDhaCT4tlYDzTR6aUs9hbs+OHeE8ZYwsmx+sQ=;
  b=V2HpDqLTO4wrSF9lMDPjY1UQ+nR/SWq2WMzDlEwL4delSmDcNbOGpFUX
   UMblqAjeG+EXwBVRuC5AmuAntXwx7pEwUrXq/dDZ+JQcUvudqJCGsHXuq
   XQMA6uRoorMfqWJsIw/T9Hnxcf3vzkJ6x2dujcFueqn3dCPkBmVVPFr6u
   1+aAJc2KW7Rb3k6qyXDvHJOxnCk2fLvMEIHOCfE54z4ZGV+K4bigGAp8L
   qu4OifnMlEy98OcYu+oIdqCbmqkx7q3jgILW06aWzfIima183lZ5ZYhem
   OHo965uBo1OYXQR2jvdsyNxHNWU5sB2h+jyVHkbRm3CAfclZIGykFUo8a
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10420"; a="352042936"
X-IronPort-AV: E=Sophos;i="5.93,194,1654585200"; 
   d="scan'208";a="352042936"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2022 13:20:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,194,1654585200"; 
   d="scan'208";a="575643213"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 26 Jul 2022 13:20:09 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oGR2G-0007h8-1Z;
	Tue, 26 Jul 2022 20:20:08 +0000
Date: Wed, 27 Jul 2022 04:20:04 +0800
From: kernel test robot <lkp@intel.com>
To: Hou Tao <houtao1@huawei.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH bpf-next 1/3] bpf: Add support for qp-trie map
Message-ID: <202207270430.yGvLY2tk-lkp@intel.com>
References: <20220726130005.3102470-2-houtao1@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220726130005.3102470-2-houtao1@huawei.com>

Hi Hou,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Hou-Tao/Add-support-for-qp-trie-map/20220726-204347
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220727/202207270430.yGvLY2tk-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 83882606dbd7ffb0bdd3460356202d97705809c8)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/74890023aaa2d8ffed54d96d4999f10bf14ccfef
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Hou-Tao/Add-support-for-qp-trie-map/20220726-204347
        git checkout 74890023aaa2d8ffed54d96d4999f10bf14ccfef
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash kernel/bpf/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/bpf/bpf_qp_trie.c:622:24: warning: bitwise or with non-zero value always evaluates to true [-Wtautological-bitwise-compare]
           if (!(attr->map_flags | BPF_F_NO_PREALLOC) ||
                 ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +622 kernel/bpf/bpf_qp_trie.c

   616	
   617	static int qp_trie_alloc_check(union bpf_attr *attr)
   618	{
   619		if (!bpf_capable())
   620			return -EPERM;
   621	
 > 622		if (!(attr->map_flags | BPF_F_NO_PREALLOC) ||
   623		    attr->map_flags & ~QP_TRIE_CREATE_FLAG_MASK ||
   624		    !bpf_map_flags_access_ok(attr->map_flags))
   625			return -EINVAL;
   626	
   627		if (!attr->max_entries || attr->key_size < QP_TRIE_MIN_KEY_SIZE ||
   628		    !attr->value_size)
   629			return -EINVAL;
   630	
   631		if (attr->key_size > QP_TRIE_MAX_KEY_SIZE ||
   632		    !is_valid_k_v_size(attr->key_size, attr->value_size))
   633			return -E2BIG;
   634	
   635		return 0;
   636	}
   637	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
