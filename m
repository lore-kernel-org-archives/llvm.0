Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D320720F85;
	Wed, 12 Jul 2023 17:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689182646; x=1720718646;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=elnDIXnQiiUPODUhfQIcNt3/a/D/Vn2mZ6hUuvMOyCU=;
  b=ckpDVO6WcfRUbRvBpNncXtn3wOAYHPKrAStKPCvAhc56e1mNY88wEFA3
   xTmOcYcXIMZ4y7dHE9/xCV6VCmakiAglWNYFLYJ9dFn7O96sZl2CQBOpc
   qJIcE7dIkz+czJ+FDIvLtv3sEGWJEzD37aEeXav0VEQeo6K/9zqtld5ss
   b1buqWQ9vftTaGm8qd358ElWXQ/g1f/Nsj/2V/mv6SvFfwQO5LjfQne/a
   iX0j5jqAbZmxWsgo3vfU1SYCW/ZJ0QlZAxYXMRIcVyJgt1hm6mmSIeGWn
   T3JKZmf5emqnFrK1od85nnfA1b98x7BmcI4R8iZ+526goVcgjpMubBtGJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="354865412"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="354865412"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 10:24:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="756830742"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="756830742"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 12 Jul 2023 10:24:03 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJdZK-0005sb-2M;
	Wed, 12 Jul 2023 17:24:02 +0000
Date: Thu, 13 Jul 2023 01:23:09 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/audio-wsa884x-on-top-of-wip-sm8450-audio-on-next
 40/44] sound/soc/codecs/lpass-tx-macro.c:855:24: warning: variable
 'dmic_clk_reg' is uninitialized when used here
Message-ID: <202307130104.JTOhWT0Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/audio-wsa884x-on-top-of-wip-sm8450-audio-on-next
head:   52f967da5d133e7e2f9506ab5ccb1dbb9db34f86
commit: d083eacc13e9a3664d24b61879b62d54ed575eac [40/44] WIP: codec: correct AMIC in TX
config: s390-randconfig-r026-20230712 (https://download.01.org/0day-ci/archive/20230713/202307130104.JTOhWT0Q-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307130104.JTOhWT0Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307130104.JTOhWT0Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/codecs/lpass-tx-macro.c:7:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from sound/soc/codecs/lpass-tx-macro.c:7:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from sound/soc/codecs/lpass-tx-macro.c:7:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> sound/soc/codecs/lpass-tx-macro.c:855:24: warning: variable 'dmic_clk_reg' is uninitialized when used here [-Wuninitialized]
     855 |                                                     mic_sel_reg, dmic_clk_reg,
         |                                                                  ^~~~~~~~~~~~
   sound/soc/codecs/lpass-tx-macro.c:811:18: note: initialize the variable 'dmic_clk_reg' to silence this warning
     811 |         u16 dmic_clk_reg;
         |                         ^
         |                          = 0
   13 warnings generated.


vim +/dmic_clk_reg +855 sound/soc/codecs/lpass-tx-macro.c

   802	
   803	static int tx_macro_put_dec_enum(struct snd_kcontrol *kcontrol,
   804					 struct snd_ctl_elem_value *ucontrol)
   805	{
   806		struct snd_soc_dapm_widget *widget = snd_soc_dapm_kcontrol_widget(kcontrol);
   807		struct snd_soc_component *component = snd_soc_dapm_to_component(widget->dapm);
   808		struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
   809		unsigned int val;
   810		u16 mic_sel_reg;
   811		u16 dmic_clk_reg;
   812		struct tx_macro *tx = snd_soc_component_get_drvdata(component);
   813	
   814		val = ucontrol->value.enumerated.item[0];
   815		if (val >= e->items)
   816			return -EINVAL;
   817	
   818		switch (e->reg) {
   819		case CDC_TX_INP_MUX_ADC_MUX0_CFG0:
   820			mic_sel_reg = CDC_TX0_TX_PATH_CFG0;
   821			break;
   822		case CDC_TX_INP_MUX_ADC_MUX1_CFG0:
   823			mic_sel_reg = CDC_TX1_TX_PATH_CFG0;
   824			break;
   825		case CDC_TX_INP_MUX_ADC_MUX2_CFG0:
   826			mic_sel_reg = CDC_TX2_TX_PATH_CFG0;
   827			break;
   828		case CDC_TX_INP_MUX_ADC_MUX3_CFG0:
   829			mic_sel_reg = CDC_TX3_TX_PATH_CFG0;
   830			break;
   831		case CDC_TX_INP_MUX_ADC_MUX4_CFG0:
   832			mic_sel_reg = CDC_TX4_TX_PATH_CFG0;
   833			break;
   834		case CDC_TX_INP_MUX_ADC_MUX5_CFG0:
   835			mic_sel_reg = CDC_TX5_TX_PATH_CFG0;
   836			break;
   837		case CDC_TX_INP_MUX_ADC_MUX6_CFG0:
   838			mic_sel_reg = CDC_TX6_TX_PATH_CFG0;
   839			break;
   840		case CDC_TX_INP_MUX_ADC_MUX7_CFG0:
   841			mic_sel_reg = CDC_TX7_TX_PATH_CFG0;
   842			break;
   843		default:
   844			dev_err(component->dev, "Error in configuration!!\n");
   845			return -EINVAL;
   846		}
   847	
   848		if (val != 0) {
   849			if (widget->shift) { /* MSM DMIC */
   850				snd_soc_component_write_field(component, mic_sel_reg,
   851							      CDC_TXn_ADC_DMIC_SEL_MASK, 1);
   852				pr_err("AAA %s:%d\n", __func__, __LINE__);
   853			} else if (tx->data->ver <= LPASS_VER_9_0_0)
   854				tx_macro_update_smic_sel_v9(component, widget, tx,
 > 855							    mic_sel_reg, dmic_clk_reg,
   856							    val);
   857			else
   858				tx_macro_update_smic_sel_v9_2(component, widget, tx,
   859							      mic_sel_reg, dmic_clk_reg,
   860							      val);
   861		}
   862		pr_err("AAA %s:%d - mic_sel_reg=0x%x, dmic_clk_reg=0x%x, val=%d, mux0 cfg=0x%x, reg=0x%x\n",
   863			       __func__, __LINE__,
   864			       mic_sel_reg, dmic_clk_reg, val,
   865			       snd_soc_component_read(component, e->reg), e->reg);
   866	
   867		return snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
   868	}
   869	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
