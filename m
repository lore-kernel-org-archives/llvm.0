Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F44E10E6;
	Sat,  6 May 2023 01:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683336042; x=1714872042;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sLmS1ulh1Y7jm/osNc2HA1AwwvKrqdax/5pzcHc1jf0=;
  b=QdICU9t+4ox+S3ZWRI88JyG8KaI8hrVGMq9TRRbeP6rrtDiwb21scAeY
   Koq6aa81nithGGbiedM0T3cpYuKum+Coqbf9GjqzrCpbjQdJTdzp0KJya
   PDtsz3w169tSikKzk1FIsUrKlkfyDbf4liEGitDtERYAVSotBoc2ImXc/
   HvYgBwnpOyqgZKo0Ru39hrgwWWDS4HhCmtgNXxSloW/vK5vmg9SwvDM1p
   /TV3dBFXrfjS9+8pN5fzo+WuXfhysmpwMPkvVs4wXlcRCKpN+jT1Kfpx9
   nh75/kvJ4AiGMRad+d0zMxFH+8i3Y/YV9vptQtS9J3qC8ehdCbO9sFH4K
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="333758954"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="333758954"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 18:20:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="787355724"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="787355724"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 05 May 2023 18:20:33 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pv6bA-000111-2P;
	Sat, 06 May 2023 01:20:32 +0000
Date: Sat, 6 May 2023 09:19:42 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:pr/new-api-tcx2 7/13] include/linux/bpf_mprog.h:193:11:
 error: call to undeclared function 'bpf_link_by_id'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202305060903.hnV1hub9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/new-api-tcx2
head:   94e6243273cf3f1e5e03c37288780f5b861fe555
commit: 3ba2eec83a93ca19cc31cdeae1ebc8d2cddd99c7 [7/13] bpf: Implement relative BPF link handling for tc BPF programs
config: riscv-randconfig-r023-20230430 (https://download.01.org/0day-ci/archive/20230506/202305060903.hnV1hub9-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://github.com/cilium/linux/commit/3ba2eec83a93ca19cc31cdeae1ebc8d2cddd99c7
        git remote add cilium https://github.com/cilium/linux.git
        git fetch --no-tags cilium pr/new-api-tcx2
        git checkout 3ba2eec83a93ca19cc31cdeae1ebc8d2cddd99c7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash net/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305060903.hnV1hub9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/core/dev.c:110:
   In file included from include/net/tcx.h:7:
>> include/linux/bpf_mprog.h:193:11: error: call to undeclared function 'bpf_link_by_id'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           ltmp = bpf_link_by_id(relobj);
                                  ^
>> include/linux/bpf_mprog.h:193:9: error: incompatible integer to pointer conversion assigning to 'struct bpf_link *' from 'int' [-Wint-conversion]
                           ltmp = bpf_link_by_id(relobj);
                                ^ ~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bpf_mprog.h:197:11: error: call to undeclared function 'bpf_link_get_from_fd'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           ltmp = bpf_link_get_from_fd(relobj);
                                  ^
   include/linux/bpf_mprog.h:197:9: error: incompatible integer to pointer conversion assigning to 'struct bpf_link *' from 'int' [-Wint-conversion]
                           ltmp = bpf_link_get_from_fd(relobj);
                                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 errors generated.


vim +/bpf_link_by_id +193 include/linux/bpf_mprog.h

   181	
   182	static inline int
   183	bpf_mprog_tuple_relative(struct bpf_tuple *tuple,
   184				 u32 relobj, u32 flags,
   185				 enum bpf_prog_type type)
   186	{
   187		struct bpf_prog *ptmp;
   188		struct bpf_link *ltmp;
   189	
   190		memset(tuple, 0, sizeof(*tuple));
   191		if (flags & BPF_F_LINK) {
   192			if (flags & BPF_F_ID) {
 > 193				ltmp = bpf_link_by_id(relobj);
   194			} else {
   195				if (!relobj)
   196					return -EINVAL;
 > 197				ltmp = bpf_link_get_from_fd(relobj);
   198			}
   199			if (IS_ERR(ltmp))
   200				return PTR_ERR(ltmp);
   201			if (ltmp->prog->type != type) {
   202				bpf_link_put(ltmp);
   203				return -EINVAL;
   204			}
   205			tuple->link = ltmp;
   206			tuple->prog = ltmp->prog;
   207		} else {
   208			if (flags & BPF_F_ID) {
   209				ptmp = bpf_prog_by_id(relobj);
   210			} else {
   211				if (!relobj)
   212					return 0;
   213				ptmp = bpf_prog_get(relobj);
   214			}
   215			if (IS_ERR(ptmp))
   216				return PTR_ERR(ptmp);
   217			if (ptmp->type != type) {
   218				bpf_prog_put(ptmp);
   219				return -EINVAL;
   220			}
   221			tuple->link = NULL;
   222			tuple->prog = ptmp;
   223		}
   224		return 0;
   225	}
   226	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
