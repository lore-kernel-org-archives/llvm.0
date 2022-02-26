Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19B13D8B
	for <llvm@lists.linux.dev>; Sat, 26 Feb 2022 19:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645902908; x=1677438908;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZilLojZSqZ0LDXpttJlXq9ljHxiLl/YXESxq3/s2aZ0=;
  b=lb58xaR5s2Rvsnd0r+u/O2NIZI5U8Xk+yUU7HD+AP/YH04UgUaS7rPxj
   7eaWnTsGdezWfdT0oQM/4gGUFPA3dwTaUWY2BEEPEWKoVi0whjGABDLx6
   TlUFEnYSZRa2/BUv6d+ucYKpQoALlpfazmJSMZVFR3s8rE3rfaA2j92t5
   Bns90hRyGURsM8ruIScjhywte9KW0LbEbEc7v1RFv95FZeQ9acH+TWRTU
   o5qYRFU1gcS0r5LTAv4+mHXDmv5F0sglVb4wXzIyw26dmOINPsWxVXzSV
   PmT+xKqEJ91Txru8ic3Eb4JWFAOpUhHxBzJ8kCCpbEk3LWD4SwS23CnNW
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10270"; a="252871362"
X-IronPort-AV: E=Sophos;i="5.90,139,1643702400"; 
   d="scan'208";a="252871362"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2022 11:15:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,139,1643702400"; 
   d="scan'208";a="544346633"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 26 Feb 2022 11:15:06 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nO2X4-0005sQ-5e; Sat, 26 Feb 2022 19:15:06 +0000
Date: Sun, 27 Feb 2022 03:14:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: [linux-next:master 8608/9128] lib/maple_tree.c:473:7: warning:
 variable 'shift' is used uninitialized whenever switch case is taken
Message-ID: <202202262240.NbkCh7vR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   06aeb1495c39c86ccfaf1adadc1d2200179f16eb
commit: 564eadc47f5f72d5fc25b3740452e4fb61cf694e [8608/9128] Maple Tree: Add new data structure
config: mips-buildonly-randconfig-r005-20220225 (https://download.01.org/0day-ci/archive/20220226/202202262240.NbkCh7vR-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=564eadc47f5f72d5fc25b3740452e4fb61cf694e
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 564eadc47f5f72d5fc25b3740452e4fb61cf694e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> lib/maple_tree.c:473:7: warning: variable 'shift' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
           case maple_dense:
                ^~~~~~~~~~~
   lib/maple_tree.c:480:18: note: uninitialized use occurs here
           val |= (slot << shift) | type;
                           ^~~~~
   lib/maple_tree.c:474:7: warning: variable 'shift' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
           case maple_leaf_64:
                ^~~~~~~~~~~~~
   lib/maple_tree.c:480:18: note: uninitialized use occurs here
           val |= (slot << shift) | type;
                           ^~~~~
   lib/maple_tree.c:463:21: note: initialize the variable 'shift' to silence this warning
           unsigned long shift;
                              ^
                               = 0
>> lib/maple_tree.c:473:7: warning: variable 'type' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
           case maple_dense:
                ^~~~~~~~~~~
   lib/maple_tree.c:480:27: note: uninitialized use occurs here
           val |= (slot << shift) | type;
                                    ^~~~
   lib/maple_tree.c:474:7: warning: variable 'type' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
           case maple_leaf_64:
                ^~~~~~~~~~~~~
   lib/maple_tree.c:480:27: note: uninitialized use occurs here
           val |= (slot << shift) | type;
                                    ^~~~
   lib/maple_tree.c:464:20: note: initialize the variable 'type' to silence this warning
           unsigned long type;
                             ^
                              = 0
   lib/maple_tree.c:5547:6: warning: no previous prototype for function 'mas_wr_store_setup' [-Wmissing-prototypes]
   void mas_wr_store_setup(struct ma_wr_state *wr_mas)
        ^
   lib/maple_tree.c:5547:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void mas_wr_store_setup(struct ma_wr_state *wr_mas)
   ^
   static 
   lib/maple_tree.c:6175:5: warning: no previous prototype for function 'mtree_alloc_range' [-Wmissing-prototypes]
   int mtree_alloc_range(struct maple_tree *mt, unsigned long *startp,
       ^
   lib/maple_tree.c:6175:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int mtree_alloc_range(struct maple_tree *mt, unsigned long *startp,
   ^
   static 
   lib/maple_tree.c:6210:5: warning: no previous prototype for function 'mtree_alloc_rrange' [-Wmissing-prototypes]
   int mtree_alloc_rrange(struct maple_tree *mt, unsigned long *startp,
       ^
   lib/maple_tree.c:6210:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int mtree_alloc_rrange(struct maple_tree *mt, unsigned long *startp,
   ^
   static 
   lib/maple_tree.c:76:28: warning: unused variable 'mt_max' [-Wunused-const-variable]
   static const unsigned long mt_max[] = {
                              ^
   lib/maple_tree.c:322:20: warning: unused function 'mte_set_full' [-Wunused-function]
   static inline void mte_set_full(const struct maple_enode *node)
                      ^
   lib/maple_tree.c:327:20: warning: unused function 'mte_clear_full' [-Wunused-function]
   static inline void mte_clear_full(const struct maple_enode *node)
                      ^
   lib/maple_tree.c:837:35: warning: unused function 'mas_get_slot' [-Wunused-function]
   static inline struct maple_enode *mas_get_slot(struct ma_state *mas,
                                     ^
   lib/maple_tree.c:4599:19: warning: unused function 'mas_dead_node' [-Wunused-function]
   static inline int mas_dead_node(struct ma_state *mas, unsigned long index)
                     ^
   lib/maple_tree.c:4621:21: warning: unused function 'mas_first_entry' [-Wunused-function]
   static inline void *mas_first_entry(struct ma_state *mas, struct maple_node *mn,
                       ^
   13 warnings generated.


vim +/shift +473 lib/maple_tree.c

   448	
   449	/*
   450	 * mte_set_parent() - Set the parent node and encode the slot
   451	 * @enode: The encoded maple node.
   452	 * @parent: The encoded maple node that is the parent of @enode.
   453	 * @slot: The slot that @enode resides in @parent.
   454	 *
   455	 * Slot number is encoded in the enode->parent bit 3-6 or 2-6, depending on the
   456	 * parent type.
   457	 */
   458	static inline
   459	void mte_set_parent(struct maple_enode *enode, const struct maple_enode *parent,
   460			    unsigned char slot)
   461	{
   462		unsigned long val = (unsigned long) parent;
   463		unsigned long shift;
   464		unsigned long type;
   465		enum maple_type p_type = mte_node_type(parent);
   466	
   467		switch(p_type) {
   468		case maple_range_64:
   469		case maple_arange_64:
   470			shift = MAPLE_PARENT_SLOT_SHIFT;
   471			type = MAPLE_PARENT_RANGE64;
   472			break;
 > 473		case maple_dense:
   474		case maple_leaf_64:
   475			BUG_ON(1);
   476			break;
   477		}
   478	
   479		val &= ~MAPLE_NODE_MASK; /* Clear all node metadata in parent */
 > 480		val |= (slot << shift) | type;
   481		mte_to_node(enode)->parent = ma_parent_ptr(val);
   482	}
   483	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
