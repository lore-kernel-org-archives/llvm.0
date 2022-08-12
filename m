Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79754641
	for <llvm@lists.linux.dev>; Fri, 12 Aug 2022 12:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660308644; x=1691844644;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/KtBNPvGQ2mNcA9sGwPdSmE26eBAY4W9p9JpqDNXn7g=;
  b=MzQSUeNZKOAOjxCsSlwsaTXJYB9RRRVH1WoxOJe6px0vpVHJJFAy2sV/
   MW5yhZBCIn/YuxArcCv9kcR7+LHA/bWCOHkv3v4p6MqnEWsgZC7VB0HVW
   rFuNWr3dv58FBieCGFsEWOeHZrifHrSzkI0BiiLJIBuP8GMTrsm5soeYg
   +cLjkKQD7/ELgFDiC+2OEzLG5E7nYRHbCrzcAqV5F10DdKOw6Wm/3eGsH
   plERnEyKKibSLnbp4aPfFCyIqc+SlUi8eLppd/U1+9xtGffRk8SRTx3zX
   cQaxaPsG0+DNwmGpOulQCwoJLt/EyF2Chf2JIvrr2RlwytUfXu/wQLmgq
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10436"; a="291586663"
X-IronPort-AV: E=Sophos;i="5.93,231,1654585200"; 
   d="scan'208";a="291586663"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2022 05:50:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,231,1654585200"; 
   d="scan'208";a="748185953"
Received: from lkp-server02.sh.intel.com (HELO 8745164cafc7) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 12 Aug 2022 05:50:42 -0700
Received: from kbuild by 8745164cafc7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oMU7d-0000Wh-1u;
	Fri, 12 Aug 2022 12:50:41 +0000
Date: Fri, 12 Aug 2022 20:50:23 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org
Subject: [arm:ktext 16/19] arch/arm64/mm/ktext.c:96:3: error: call to
 undeclared function 'clean_dcache_range_nopatch'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202208122029.5V0qysnW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Russell,

First bad commit (maybe != root cause):

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git ktext
head:   6f969d4aee6bbafad356a7bae6e37d9e2dce9e08
commit: 5e25ed1e1f5ddef3d1be949922f9ea10c2e45b24 [16/19] arm64: text replication: add Kconfig
config: arm64-randconfig-r032-20220812 (https://download.01.org/0day-ci/archive/20220812/202208122029.5V0qysnW-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        git remote add arm git://git.armlinux.org.uk/~rmk/linux-arm.git
        git fetch --no-tags arm ktext
        git checkout 5e25ed1e1f5ddef3d1be949922f9ea10c2e45b24
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/mm/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/arm64/mm/ktext.c:96:3: error: call to undeclared function 'clean_dcache_range_nopatch'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   clean_dcache_range_nopatch((u64)p, (u64)p + size);
                   ^
>> arch/arm64/mm/ktext.c:145:23: error: call to undeclared function 'memblock_alloc_node'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   kernel_texts[nid] = memblock_alloc_node(size, PAGE_SIZE, nid);
                                       ^
   arch/arm64/mm/ktext.c:145:23: note: did you mean 'kmem_cache_alloc_node'?
   include/linux/slab.h:462:7: note: 'kmem_cache_alloc_node' declared here
   void *kmem_cache_alloc_node(struct kmem_cache *s, gfp_t flags, int node) __assume_slab_alignment
         ^
>> arch/arm64/mm/ktext.c:145:21: error: incompatible integer to pointer conversion assigning to 'void *' from 'int' [-Wint-conversion]
                   kernel_texts[nid] = memblock_alloc_node(size, PAGE_SIZE, nid);
                                     ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/mm/ktext.c:151:17: error: incompatible integer to pointer conversion assigning to 'struct pgtables *' from 'int' [-Wint-conversion]
                   pgtables[nid] = memblock_alloc_node(sizeof(*pgtables[0]),
                                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 errors generated.


vim +/clean_dcache_range_nopatch +96 arch/arm64/mm/ktext.c

b8557d9117093e Russell King (Oracle  2022-05-24   73) 
b8557d9117093e Russell King (Oracle  2022-05-24   74) /* Copy the patched alternative from the node0 image to the other
b8557d9117093e Russell King (Oracle  2022-05-24   75)  * modes. src is the node 0 linear-mapping address.
b8557d9117093e Russell King (Oracle  2022-05-24   76)  */
b8557d9117093e Russell King (Oracle  2022-05-24   77) void ktext_replication_patch_alternative(__le32 *src, int nr_inst)
b8557d9117093e Russell King (Oracle  2022-05-24   78) {
b8557d9117093e Russell King (Oracle  2022-05-24   79) 	unsigned long offset;
b8557d9117093e Russell King (Oracle  2022-05-24   80) 	size_t size;
b8557d9117093e Russell King (Oracle  2022-05-24   81) 	int nid;
b8557d9117093e Russell King (Oracle  2022-05-24   82) 	__le32 *p;
b8557d9117093e Russell King (Oracle  2022-05-24   83) 
b8557d9117093e Russell King (Oracle  2022-05-24   84) 	offset = (unsigned long)src - (unsigned long)lm_alias(_stext);
b8557d9117093e Russell King (Oracle  2022-05-24   85) 	if (WARN_ON_ONCE(offset >= _etext - _stext))
b8557d9117093e Russell King (Oracle  2022-05-24   86) 		return;
b8557d9117093e Russell King (Oracle  2022-05-24   87) 
b8557d9117093e Russell King (Oracle  2022-05-24   88) 	size = AARCH64_INSN_SIZE * nr_inst;
b8557d9117093e Russell King (Oracle  2022-05-24   89) 
b8557d9117093e Russell King (Oracle  2022-05-24   90) 	for_each_node(nid) {
b8557d9117093e Russell King (Oracle  2022-05-24   91) 		if (!kernel_texts[nid])
b8557d9117093e Russell King (Oracle  2022-05-24   92) 			continue;
b8557d9117093e Russell King (Oracle  2022-05-24   93) 
b8557d9117093e Russell King (Oracle  2022-05-24   94) 		p = kernel_texts[nid] + offset;
b8557d9117093e Russell King (Oracle  2022-05-24   95) 		memcpy(p, src, size);
b8557d9117093e Russell King (Oracle  2022-05-24  @96) 		clean_dcache_range_nopatch((u64)p, (u64)p + size);
b8557d9117093e Russell King (Oracle  2022-05-24   97) 	}
b8557d9117093e Russell King (Oracle  2022-05-24   98) }
b8557d9117093e Russell King (Oracle  2022-05-24   99) 
c328a296007681 Russell King (Oracle  2022-07-07  100) static bool ktext_enabled = true;
c328a296007681 Russell King (Oracle  2022-07-07  101) 
c328a296007681 Russell King (Oracle  2022-07-07  102) static int __init parse_ktext(char *str)
c328a296007681 Russell King (Oracle  2022-07-07  103) {
c328a296007681 Russell King (Oracle  2022-07-07  104) 	bool enabled;
c328a296007681 Russell King (Oracle  2022-07-07  105) 	int ret = strtobool(str, &enabled);
c328a296007681 Russell King (Oracle  2022-07-07  106) 
c328a296007681 Russell King (Oracle  2022-07-07  107) 	if (ret)
c328a296007681 Russell King (Oracle  2022-07-07  108) 		return ret;
c328a296007681 Russell King (Oracle  2022-07-07  109) 
c328a296007681 Russell King (Oracle  2022-07-07  110) 	ktext_enabled = enabled;
c328a296007681 Russell King (Oracle  2022-07-07  111) 	return 0;
c328a296007681 Russell King (Oracle  2022-07-07  112) }
c328a296007681 Russell King (Oracle  2022-07-07  113) early_param("ktext", parse_ktext);
c328a296007681 Russell King (Oracle  2022-07-07  114) 
06e9efea0a2391 Russell King (Oracle  2022-04-20  115) /* Allocate page tables and memory for the replicated kernel texts. */
4a17b67dc0c254 Russell King (Oracle  2022-04-21  116) void ktext_replication_init(void)
4a17b67dc0c254 Russell King (Oracle  2022-04-21  117) {
c5ce21bcc37dcf Russell King (Oracle  2022-06-17  118) 	size_t size = __end_rodata - _stext;
cc8a46d8fdca7d Russell King (Oracle  2022-04-21  119) 	int kidx = pgd_index((phys_addr_t)KERNEL_START);
62f0b42355e0b5 Russell King (Oracle  2022-05-16  120) 	int nid;
cc8a46d8fdca7d Russell King (Oracle  2022-04-21  121) 
cc8a46d8fdca7d Russell King (Oracle  2022-04-21  122) 	/*
cc8a46d8fdca7d Russell King (Oracle  2022-04-21  123) 	 * If we've messed up and the kernel shares a L0 entry with the
cc8a46d8fdca7d Russell King (Oracle  2022-04-21  124) 	 * module or vmalloc area, then don't even attempt to use text
cc8a46d8fdca7d Russell King (Oracle  2022-04-21  125) 	 * replication.
cc8a46d8fdca7d Russell King (Oracle  2022-04-21  126) 	 */
cc8a46d8fdca7d Russell King (Oracle  2022-04-21  127) 	if (pgd_index(MODULES_VADDR) == kidx) {
cc8a46d8fdca7d Russell King (Oracle  2022-04-21  128) 		pr_warn("Kernel is located in the same L0 index as modules - text replication disabled\n");
cc8a46d8fdca7d Russell King (Oracle  2022-04-21  129) 		return;
cc8a46d8fdca7d Russell King (Oracle  2022-04-21  130) 	}
cc8a46d8fdca7d Russell King (Oracle  2022-04-21  131) 	if (pgd_index(VMALLOC_START) == kidx) {
cc8a46d8fdca7d Russell King (Oracle  2022-04-21  132) 		pr_warn("Kernel is located in the same L0 index as vmalloc - text replication disabled\n");
cc8a46d8fdca7d Russell King (Oracle  2022-04-21  133) 		return;
cc8a46d8fdca7d Russell King (Oracle  2022-04-21  134) 	}
62f0b42355e0b5 Russell King (Oracle  2022-05-16  135) 
c328a296007681 Russell King (Oracle  2022-07-07  136) 	if (!ktext_enabled)
c328a296007681 Russell King (Oracle  2022-07-07  137) 		return;
c328a296007681 Russell King (Oracle  2022-07-07  138) 
62f0b42355e0b5 Russell King (Oracle  2022-05-16  139) 	for_each_node(nid) {
62f0b42355e0b5 Russell King (Oracle  2022-05-16  140) 		/* Nothing to do for node 0 */
62f0b42355e0b5 Russell King (Oracle  2022-05-16  141) 		if (!nid)
62f0b42355e0b5 Russell King (Oracle  2022-05-16  142) 			continue;
62f0b42355e0b5 Russell King (Oracle  2022-05-16  143) 
62f0b42355e0b5 Russell King (Oracle  2022-05-16  144) 		/* Allocate and copy initial kernel text for this node */
62f0b42355e0b5 Russell King (Oracle  2022-05-16 @145) 		kernel_texts[nid] = memblock_alloc_node(size, PAGE_SIZE, nid);
62f0b42355e0b5 Russell King (Oracle  2022-05-16  146) 		memcpy(kernel_texts[nid], _stext, size);
62f0b42355e0b5 Russell King (Oracle  2022-05-16  147) 		caches_clean_inval_pou((u64)kernel_texts[nid],
62f0b42355e0b5 Russell King (Oracle  2022-05-16  148) 				       (u64)kernel_texts[nid] + size);
06e9efea0a2391 Russell King (Oracle  2022-04-20  149) 
06e9efea0a2391 Russell King (Oracle  2022-04-20  150) 		/* Allocate the pagetables for this node */
06e9efea0a2391 Russell King (Oracle  2022-04-20 @151) 		pgtables[nid] = memblock_alloc_node(sizeof(*pgtables[0]),
06e9efea0a2391 Russell King (Oracle  2022-04-20  152) 						    PGD_SIZE, nid);
06e9efea0a2391 Russell King (Oracle  2022-04-20  153) 
06e9efea0a2391 Russell King (Oracle  2022-04-20  154) 		/* Copy initial swapper page directory */
06e9efea0a2391 Russell King (Oracle  2022-04-20  155) 		memcpy(pgtables[nid]->swapper_pg_dir, swapper_pg_dir, PGD_SIZE);
26904e19f00089 Russell King (Oracle  2022-05-16  156) 
26904e19f00089 Russell King (Oracle  2022-05-16  157) 		/* Clear the kernel mapping */
26904e19f00089 Russell King (Oracle  2022-05-16  158) 		memset(&pgtables[nid]->swapper_pg_dir[kidx], 0,
26904e19f00089 Russell King (Oracle  2022-05-16  159) 		       sizeof(pgtables[nid]->swapper_pg_dir[kidx]));
26904e19f00089 Russell King (Oracle  2022-05-16  160) 
26904e19f00089 Russell King (Oracle  2022-05-16  161) 		/* Create kernel mapping pointing at our local copy */
26904e19f00089 Russell King (Oracle  2022-05-16  162) 		create_kernel_nid_map(pgtables[nid]->swapper_pg_dir,
26904e19f00089 Russell King (Oracle  2022-05-16  163) 				      kernel_texts[nid]);
06e9efea0a2391 Russell King (Oracle  2022-04-20  164) 	}
06e9efea0a2391 Russell King (Oracle  2022-04-20  165) }
06e9efea0a2391 Russell King (Oracle  2022-04-20  166) 

:::::: The code at line 96 was first introduced by commit
:::::: b8557d9117093ebe17320d36dadd47fc742820c9 arm64: text replication: add node text patching

:::::: TO: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
:::::: CC: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
