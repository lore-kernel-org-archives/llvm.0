Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C952C80
	for <llvm@lists.linux.dev>; Thu,  6 Jan 2022 15:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641484586; x=1673020586;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WbcFkPtqXMPV9yhHmfVHCDFCm0yO9ZW/9txJmnh6GSs=;
  b=dhrwQkD0skTnFaJbxkzlGxs3hYqkvZeOrnFEmXJL0yHZ2cNWMzY5e3Gg
   uhXNEc0QaURKkVpyoxXVk8+71koUejCI7LF88aWsOOtASgDj5K3GcvIWW
   4pmpOuk/oP7ssPj3VuLj1pwuOm65QSJpV97ke08FzGjBEJ7lyYj3+fK8p
   k/vJsbWbuLPRtBObNV2VE2FtfxV4LEB5GAwFK047Z8ZA9LN/skqHREaHR
   IPUtV2BBYut97veCwPEMl+gFWXlQAQX2jnGjHf69P0ovYUO40Q9RMVKpz
   XoahPZ6++Ahf8FGiihRpuLIjbT5lz7SjaGUAAJxHlWcfSL+VOreQ8oDQB
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="266968363"
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600"; 
   d="scan'208";a="266968363"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2022 07:56:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600"; 
   d="scan'208";a="689446485"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 06 Jan 2022 07:56:24 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n5V7n-000Hlj-C2; Thu, 06 Jan 2022 15:56:23 +0000
Date: Thu, 6 Jan 2022 23:55:52 +0800
From: kernel test robot <lkp@intel.com>
To: Yan Yan <evitayan@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v1 1/2] xfrm: Check if_id in xfrm_migrate
Message-ID: <202201062313.QMYcwsyC-lkp@intel.com>
References: <20220106005251.2833941-2-evitayan@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220106005251.2833941-2-evitayan@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Yan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 18343b80691560f41c3339119a2e9314d4672c77]

url:    https://github.com/0day-ci/linux/commits/Yan-Yan/Fix-issues-in-xfrm_migrate/20220106-085707
base:   18343b80691560f41c3339119a2e9314d4672c77
config: riscv-randconfig-r002-20220106 (https://download.01.org/0day-ci/archive/20220106/202201062313.QMYcwsyC-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project ca7ffe09dc6e525109e3cd570cc5182ce568be13)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/2be451f5a66efd5951102e188daee7c730f55dc7
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Yan-Yan/Fix-issues-in-xfrm_migrate/20220106-085707
        git checkout 2be451f5a66efd5951102e188daee7c730f55dc7
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash net/xfrm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from net/xfrm/xfrm_policy.c:24:
   In file included from include/linux/netdevice.h:37:
   In file included from include/net/net_namespace.h:40:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from net/xfrm/xfrm_policy.c:24:
   In file included from include/linux/netdevice.h:37:
   In file included from include/net/net_namespace.h:40:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from net/xfrm/xfrm_policy.c:24:
   In file included from include/linux/netdevice.h:37:
   In file included from include/net/net_namespace.h:40:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:1024:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
>> net/xfrm/xfrm_policy.c:4403:9: warning: using the result of an assignment as a condition without parentheses [-Wparentheses]
                   if (x = xfrm_migrate_state_find(mp, net, if_id)) {
                       ~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/xfrm/xfrm_policy.c:4403:9: note: place parentheses around the assignment to silence this warning
                   if (x = xfrm_migrate_state_find(mp, net, if_id)) {
                         ^
                       (                                          )
   net/xfrm/xfrm_policy.c:4403:9: note: use '==' to turn this assignment into an equality comparison
                   if (x = xfrm_migrate_state_find(mp, net, if_id)) {
                         ^
                         ==
   8 warnings generated.


vim +4403 net/xfrm/xfrm_policy.c

  4373	
  4374	int xfrm_migrate(const struct xfrm_selector *sel, u8 dir, u8 type,
  4375			 struct xfrm_migrate *m, int num_migrate,
  4376			 struct xfrm_kmaddress *k, struct net *net,
  4377			 struct xfrm_encap_tmpl *encap, u32 if_id)
  4378	{
  4379		int i, err, nx_cur = 0, nx_new = 0;
  4380		struct xfrm_policy *pol = NULL;
  4381		struct xfrm_state *x, *xc;
  4382		struct xfrm_state *x_cur[XFRM_MAX_DEPTH];
  4383		struct xfrm_state *x_new[XFRM_MAX_DEPTH];
  4384		struct xfrm_migrate *mp;
  4385	
  4386		/* Stage 0 - sanity checks */
  4387		if ((err = xfrm_migrate_check(m, num_migrate)) < 0)
  4388			goto out;
  4389	
  4390		if (dir >= XFRM_POLICY_MAX) {
  4391			err = -EINVAL;
  4392			goto out;
  4393		}
  4394	
  4395		/* Stage 1 - find policy */
  4396		if ((pol = xfrm_migrate_policy_find(sel, dir, type, net, if_id)) == NULL) {
  4397			err = -ENOENT;
  4398			goto out;
  4399		}
  4400	
  4401		/* Stage 2 - find and update state(s) */
  4402		for (i = 0, mp = m; i < num_migrate; i++, mp++) {
> 4403			if (x = xfrm_migrate_state_find(mp, net, if_id)) {

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
