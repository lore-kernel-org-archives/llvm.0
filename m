Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B71469837;
	Wed, 29 Jul 2026 16:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785344077; cv=none; b=n8016rHDUVBCKQMTwCa2UOyGsAx+RQzE7kr5aQw1V5dN6w3BPMAF/3DVW+stt34rWvMLGh6HmEKjx4/tsgVx/pjA+7LySFwo9EUfcakSA4+X1CWXW7tobIrDVo36y87s/nxS56JBSj8BkMnsu+8e7e6n79pq6vuwQi//9hO5poI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785344077; c=relaxed/simple;
	bh=+nK1+E9xqYgGDTomzsVvntmR+XAc1abcu+P5XiGUwfA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=faYw/gGXW3QYz7y2yLRcPJvDOK3b+4H8bsDSP81JvF/igs3qdE4RUjecwMbJh0IjFytRwiaNnoM6AVp1dExGlTWAtbiWU6oNkQAAV89Bta5yWBgE7BkFJLPUf28lBzej+vAXX9cU5HkhDRjtN+llfM1y9XgWAWWWvLvRbkX5Fos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ReIRYJMv; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ReIRYJMv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785344075; x=1816880075;
  h=date:from:to:cc:subject:message-id;
  bh=+nK1+E9xqYgGDTomzsVvntmR+XAc1abcu+P5XiGUwfA=;
  b=ReIRYJMvwGe2XS+zlGJoHkljJXSuUYu+xYgryNV0QgkG7fVSc5VDM+vs
   OOMy3OZbp341ZbDzzjXdtzYkBb8tTfUdq863fvMnNg8wkLencNWPN4gWT
   ZrgHspgAFQlR614zINylKS1U0/lnLEJGAORJ96YqlmmlfmtPkxL/ePvVW
   Z6vEHX2KkKvC39SQo/WBvYeNBDOEoYDIh6JBmrco5IalFSmxCyo58Fo6z
   Kr2FIEt/CyrhLQnE/THVbWFyDXMBlXHehXqUc2VYOWQPYpo1eRECJOHIN
   mvbcyq5+qrBToYEUywTRtYUIEnl6m9IUa/H00iCiJGBRnLy0iJtqpFjQP
   g==;
X-CSE-ConnectionGUID: emSCNOqyRx2rITBoY5MZFQ==
X-CSE-MsgGUID: s0xW7SDdTB62CaHPWlLueQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103494306"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="103494306"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 09:54:34 -0700
X-CSE-ConnectionGUID: NoVnChz+Q0Op2F+SCUjLIg==
X-CSE-MsgGUID: a2FOx8l1Ta2iX0qgRMPeNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="265100042"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 29 Jul 2026 09:54:32 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wp7Y6-00000000fXX-1nQH;
	Wed, 29 Jul 2026 16:54:30 +0000
Date: Thu, 30 Jul 2026 00:50:17 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [chenxing:mstar_v6_5_reorder 6/700]
 drivers/clk/mstar/clk-msc313-mux.c:27:2: error: call to undeclared function
 'regmap_field_read'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202607300052.0D3YvzeB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/linux-chenxing/linux.git mstar_v6_5_reorder
head:   1a5c60e65ea399670a5384b869c4958338af2799
commit: b4e750e9c28b84519ef454234db2feb4664b72af [6/700] clk: mstar: msc313 clock mux base
config: powerpc-mpc866_ads_defconfig (https://download.01.org/0day-ci/archive/20260730/202607300052.0D3YvzeB-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607300052.0D3YvzeB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607300052.0D3YvzeB-lkp@intel.com/

All errors (new ones prefixed by >>):

      82 | __do_insb
         | ^
   arch/powerpc/include/asm/io.h:614:56: note: expanded from macro '__do_insb'
     614 | #define __do_insb(p, b, n)      readsb((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
         |                                        ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/clk/mstar/clk-msc313-mux.c:8:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:45:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      45 | DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      46 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:84:1: note: expanded from here
      84 | __do_insw
         | ^
   arch/powerpc/include/asm/io.h:615:56: note: expanded from macro '__do_insw'
     615 | #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
         |                                        ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/clk/mstar/clk-msc313-mux.c:8:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      47 | DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      48 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:86:1: note: expanded from here
      86 | __do_insl
         | ^
   arch/powerpc/include/asm/io.h:616:56: note: expanded from macro '__do_insl'
     616 | #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
         |                                        ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/clk/mstar/clk-msc313-mux.c:8:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      49 | DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      50 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:88:1: note: expanded from here
      88 | __do_outsb
         | ^
   arch/powerpc/include/asm/io.h:617:58: note: expanded from macro '__do_outsb'
     617 | #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/clk/mstar/clk-msc313-mux.c:8:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      51 | DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      52 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:90:1: note: expanded from here
      90 | __do_outsw
         | ^
   arch/powerpc/include/asm/io.h:618:58: note: expanded from macro '__do_outsw'
     618 | #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/clk/mstar/clk-msc313-mux.c:8:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      53 | DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      54 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     674 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:92:1: note: expanded from here
      92 | __do_outsl
         | ^
   arch/powerpc/include/asm/io.h:619:58: note: expanded from macro '__do_outsl'
     619 | #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
>> drivers/clk/mstar/clk-msc313-mux.c:27:2: error: call to undeclared function 'regmap_field_read'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      27 |         regmap_field_read(mux->mux, &index);
         |         ^
   drivers/clk/mstar/clk-msc313-mux.c:69:3: error: call to undeclared function 'regmap_field_read'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      69 |                 regmap_field_read(mux->gate, &notgated);
         |                 ^
   drivers/clk/mstar/clk-msc313-mux.c:92:3: error: call to undeclared function 'regmap_field_read'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      92 |                 regmap_field_read(mux->deglitch, &index);
         |                 ^
>> drivers/clk/mstar/clk-msc313-mux.c:163:39: error: call to undeclared function 'REG_FIELD'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     163 |                 const struct reg_field gate_field = REG_FIELD(mux_data->offset,
         |                                                     ^
>> drivers/clk/mstar/clk-msc313-mux.c:163:26: error: variable has incomplete type 'const struct reg_field'
     163 |                 const struct reg_field gate_field = REG_FIELD(mux_data->offset,
         |                                        ^
   drivers/clk/mstar/clk-msc313-mux.c:163:16: note: forward declaration of 'struct reg_field'
     163 |                 const struct reg_field gate_field = REG_FIELD(mux_data->offset,
         |                              ^
   drivers/clk/mstar/clk-msc313-mux.c:165:26: error: variable has incomplete type 'const struct reg_field'
     165 |                 const struct reg_field mux_field = REG_FIELD(mux_data->offset,
         |                                        ^
   drivers/clk/mstar/clk-msc313-mux.c:163:16: note: forward declaration of 'struct reg_field'
     163 |                 const struct reg_field gate_field = REG_FIELD(mux_data->offset,
         |                              ^
   drivers/clk/mstar/clk-msc313-mux.c:167:26: error: variable has incomplete type 'const struct reg_field'
     167 |                 const struct reg_field deglitch_field = REG_FIELD(mux_data->offset,
         |                                        ^
   drivers/clk/mstar/clk-msc313-mux.c:163:16: note: forward declaration of 'struct reg_field'
     163 |                 const struct reg_field gate_field = REG_FIELD(mux_data->offset,
         |                              ^
>> drivers/clk/mstar/clk-msc313-mux.c:174:16: error: call to undeclared function 'devm_regmap_field_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     174 |                         mux->gate = devm_regmap_field_alloc(dev, regmap, gate_field);
         |                                     ^
   drivers/clk/mstar/clk-msc313-mux.c:179:15: error: call to undeclared function 'devm_regmap_field_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     179 |                 mux->mux =  devm_regmap_field_alloc(dev, regmap, mux_field);
         |                             ^
   6 warnings and 9 errors generated.


vim +/regmap_field_read +27 drivers/clk/mstar/clk-msc313-mux.c

    21	
    22	static u8 msc313_mux_mux_get_parent(struct clk_hw *hw)
    23	{
    24		struct msc313_mux *mux = mux_to_mux(hw);
    25		unsigned int index;
    26	
  > 27		regmap_field_read(mux->mux, &index);
    28	
    29		return index;
    30	}
    31	
    32	static int msc313_mux_mux_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
    33	{
    34		struct msc313_mux *mux = mux_to_mux(hw);
    35	
    36		return clk_mux_determine_rate_flags(hw, req, clk_hw_get_flags(&mux->mux_hw));
    37	}
    38	
    39	static const struct clk_ops msc313_mux_mux_ops = {
    40		.set_parent = msc313_mux_mux_set_parent,
    41		.get_parent = msc313_mux_mux_get_parent,
    42		.determine_rate = msc313_mux_mux_determine_rate,
    43	};
    44	
    45	static int msc313_mux_deglitch_enable(struct clk_hw *hw)
    46	{
    47		struct msc313_mux *mux = deglitch_to_mux(hw);
    48	
    49		if (mux->gate)
    50			regmap_field_write(mux->gate, 0);
    51	
    52		return 0;
    53	}
    54	
    55	static void msc313_mux_deglitch_disable(struct clk_hw *hw)
    56	{
    57		struct msc313_mux *mux = deglitch_to_mux(hw);
    58	
    59		if (mux->gate)
    60			regmap_field_write(mux->gate, 1);
    61	}
    62	
    63	static int msc313_mux_deglitch_is_enabled(struct clk_hw *hw)
    64	{
    65		struct msc313_mux *mux = deglitch_to_mux(hw);
    66		unsigned int notgated;
    67	
    68		if (mux->gate) {
    69			regmap_field_read(mux->gate, &notgated);
    70			return !notgated;
    71		}
    72	
    73		return 1;
    74	}
    75	
    76	static int msc313_mux_deglitch_set_parent(struct clk_hw *hw, u8 index)
    77	{
    78		struct msc313_mux *mux = deglitch_to_mux(hw);
    79	
    80		if (!mux->deglitch)
    81			return -ENOTSUPP;
    82	
    83		return regmap_field_write(mux->deglitch, index);
    84	}
    85	
    86	static u8 msc313_mux_deglitch_get_parent(struct clk_hw *hw)
    87	{
    88		struct msc313_mux *mux = deglitch_to_mux(hw);
    89		unsigned int index = 0;
    90	
    91		if (mux->deglitch) {
    92			regmap_field_read(mux->deglitch, &index);
    93		}
    94	
    95		return index;
    96	}
    97	
    98	static int msc313_mux_deglitch_determine_rate(struct clk_hw *hw,
    99			struct clk_rate_request *req)
   100	{
   101		struct msc313_mux *mux = deglitch_to_mux(hw);
   102	
   103		return clk_mux_determine_rate_flags(hw, req, clk_hw_get_flags(&mux->deglitch_hw));
   104	}
   105	
   106	static const struct clk_ops msc313_mux_deglitch_ops = {
   107		.enable = msc313_mux_deglitch_enable,
   108		.disable = msc313_mux_deglitch_disable,
   109		.is_enabled = msc313_mux_deglitch_is_enabled,
   110		.set_parent = msc313_mux_deglitch_set_parent,
   111		.get_parent = msc313_mux_deglitch_get_parent,
   112		.determine_rate = msc313_mux_deglitch_determine_rate,
   113	};
   114	
   115	struct clk_hw *msc313_mux_xlate(struct of_phandle_args *clkspec, void *data)
   116	{
   117		struct msc313_muxes *muxes = data;
   118		unsigned int of_idx = clkspec->args[0];
   119		unsigned int idx = of_idx / 2;
   120	
   121		/* mux, deglitch, mux, deglitch,.. */
   122		if (of_idx >= muxes->muxes_data->num_muxes * 2)
   123			return ERR_PTR(-EINVAL);
   124	
   125		if (of_idx % 2)
   126			return &muxes->muxes[idx].deglitch_hw;
   127	
   128		return &muxes->muxes[idx].mux_hw;
   129	}
   130	
   131	struct msc313_muxes *msc313_mux_register_muxes(struct device *dev,
   132			struct regmap *regmap, const struct msc313_muxes_data *muxes_data,
   133			int (*fill_clk_parent_data)(struct clk_parent_data*, void*, const void*, const struct msc313_muxes*, unsigned int, unsigned int), void *data)
   134	{
   135		const struct msc313_mux_data *mux_data = muxes_data->muxes;
   136		struct clk_init_data mux_init = {
   137			.ops = &msc313_mux_mux_ops,
   138		};
   139		struct clk_init_data deglitch_init = {
   140			.ops = &msc313_mux_deglitch_ops,
   141		};
   142		struct clk_parent_data *dynamic_parent_data = NULL;
   143		struct msc313_muxes *muxes;
   144		struct msc313_mux *mux;
   145		struct clk_hw *clk_hw;
   146		int i, ret, mux_parent;
   147	
   148		/*
   149		 * If using the dynamic clk_parent_data mode you have to have both
   150		 * a callback and data.
   151		 */
   152		if ((fill_clk_parent_data && !data) || (!fill_clk_parent_data && data))
   153			return ERR_PTR(-EINVAL);
   154	
   155		muxes = devm_kzalloc(dev, struct_size(muxes, muxes, muxes_data->num_muxes), GFP_KERNEL);
   156		if (!muxes)
   157			return ERR_PTR(-ENOMEM);
   158	
   159		muxes->muxes_data = muxes_data;
   160		mux = muxes->muxes;
   161	
   162		for (i = 0; i < muxes_data->num_muxes; i++, mux++, mux_data++) {
 > 163			const struct reg_field gate_field = REG_FIELD(mux_data->offset,
   164					mux_data->gate_shift, mux_data->gate_shift);
   165			const struct reg_field mux_field = REG_FIELD(mux_data->offset,
   166					mux_data->mux_shift, mux_data->mux_shift + (mux_data->mux_width - 1));
   167			const struct reg_field deglitch_field = REG_FIELD(mux_data->offset,
   168					mux_data->deglitch_shift, mux_data->deglitch_shift);
   169	
   170			if(!mux_data->name)
   171				continue;
   172	
   173			if (mux_data->gate_shift != -1) {
 > 174				mux->gate = devm_regmap_field_alloc(dev, regmap, gate_field);

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
