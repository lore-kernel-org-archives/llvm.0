Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E442CA8
	for <llvm@lists.linux.dev>; Fri, 21 Jan 2022 22:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642805290; x=1674341290;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8BmSztggpxzDwXuEMY46SAnA9T3VH5WSjJL9Hr5cKbo=;
  b=kCfSRAvRyCnjKD/cLjldjXeASlXXcmmCBu3Tkvh32CcF7bhtscVHPmME
   19rqy+IGNr70V1CNIbQvqbNVB6K2jtu3n/STJniyLn067wI6PYnzYEu/G
   wPHTVqXXasu8Q80SW0OdIr8krpmNNnShZQ0mCT+ExsBXVDUujst9Y6+4W
   NivkmN0gQt4SIL+3w3o1mxit5zHNVHF813Rw2z5cpylVRO3FqGvso3a7P
   5fHJTrUL017ahNJt5xpx2M05Xda6dbtoQQ7Exx8y/NmpIyZnom4n8heUN
   fq5xlC7UepewtCLnZ4geoVoRm/s3I/Ta79l2vCJ50MLqtB3PWfc/IMT/w
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10234"; a="270185742"
X-IronPort-AV: E=Sophos;i="5.88,306,1635231600"; 
   d="scan'208";a="270185742"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2022 14:48:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,306,1635231600"; 
   d="scan'208";a="476102087"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 21 Jan 2022 14:48:05 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nB2hR-000FjX-6Q; Fri, 21 Jan 2022 22:48:05 +0000
Date: Sat, 22 Jan 2022 06:47:33 +0800
From: kernel test robot <lkp@intel.com>
To: Usama Arif <usama.arif@bytedance.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC bpf-next 1/3] bpf: btf: Introduce infrastructure for module
 helpers
Message-ID: <202201220614.duEAa9pD-lkp@intel.com>
References: <20220121193956.198120-2-usama.arif@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220121193956.198120-2-usama.arif@bytedance.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Usama,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on bpf-next/master]

url:    https://github.com/0day-ci/linux/commits/Usama-Arif/bpf-Introduce-module-helper-functions/20220122-034203
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
config: arm-spear3xx_defconfig (https://download.01.org/0day-ci/archive/20220122/202201220614.duEAa9pD-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7b3d30728816403d1fd73cc5082e9fb761262bce)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/ca60b90025819a8a03818e86e2105bd15576d134
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Usama-Arif/bpf-Introduce-module-helper-functions/20220122-034203
        git checkout ca60b90025819a8a03818e86e2105bd15576d134
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash net/core/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from net/core/filter.c:50:
>> include/linux/btf.h:391:5: warning: no previous prototype for function 'register_mod_helper' [-Wmissing-prototypes]
   int register_mod_helper(struct btf_mod_helper *mod_helper)
       ^
   include/linux/btf.h:391:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int register_mod_helper(struct btf_mod_helper *mod_helper)
   ^
   static 
>> include/linux/btf.h:395:5: warning: no previous prototype for function 'unregister_mod_helper' [-Wmissing-prototypes]
   int unregister_mod_helper(struct btf_mod_helper *mod_helper)
       ^
   include/linux/btf.h:395:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int unregister_mod_helper(struct btf_mod_helper *mod_helper)
   ^
   static 
>> include/linux/btf.h:399:30: warning: no previous prototype for function 'get_mod_helper_proto' [-Wmissing-prototypes]
   const struct bpf_func_proto *get_mod_helper_proto(const struct btf *btf,
                                ^
   include/linux/btf.h:399:7: note: declare 'static' if the function is not intended to be used outside of this translation unit
   const struct bpf_func_proto *get_mod_helper_proto(const struct btf *btf,
         ^
   static 
   3 warnings generated.


vim +/register_mod_helper +391 include/linux/btf.h

   373	
   374	#ifdef CONFIG_DEBUG_INFO_BTF_MODULES
   375	int register_mod_helper(struct btf_mod_helper *mod_helper);
   376	int unregister_mod_helper(struct btf_mod_helper *mod_helper);
   377	const struct bpf_func_proto *get_mod_helper_proto(const struct btf *btf,
   378		const u32 kfunc_btf_id);
   379	
   380	#define DEFINE_MOD_HELPER(mod_helper, owner, helper_func, func_proto) \
   381	BTF_SET_START(helper_func##__id_set) \
   382	BTF_ID(func, helper_func) \
   383	BTF_SET_END(helper_func##__id_set) \
   384	struct btf_mod_helper mod_helper = { \
   385		LIST_HEAD_INIT(mod_helper.list), \
   386		(owner), \
   387		(&(helper_func##__id_set)), \
   388		(&(func_proto)) \
   389	}
   390	#else
 > 391	int register_mod_helper(struct btf_mod_helper *mod_helper)
   392	{
   393		return -EPERM;
   394	}
 > 395	int unregister_mod_helper(struct btf_mod_helper *mod_helper)
   396	{
   397		return -EPERM;
   398	}
 > 399	const struct bpf_func_proto *get_mod_helper_proto(const struct btf *btf,
   400		const u32 kfunc_btf_id)
   401	{
   402		return NULL;
   403	}
   404	#endif
   405	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
