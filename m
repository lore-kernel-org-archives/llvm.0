Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EAE21D595;
	Thu,  5 Dec 2024 15:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733414270; cv=none; b=MUK7OkciwRo7TiUGuko6OrAj+4iQtTuPsXcZuXQN4EaQ5vKpF7vUEsnb6UVF6J+bluOabtxx/ubHceE7LSvm0Vjk136jzqYPXr4+FwhBilpxQLhAVowZk9W1gKjC6vzyvC70KRvlswoJQ157M6ru5Zuo6RmlOeMGvqrlXgtnM3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733414270; c=relaxed/simple;
	bh=gYj2Cn0A25p30ukJU5NirjJCGlV3C1DFe68Dw8RwYzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ICjPiYn3lAUM17WsxJmsr6NT01FzKcbxSuK6MkvL36/40DY2O8e69Zed6N1vdhlgsPHfQ732nOoxZOF1Z6pD/VvCixXZBIrUC3ZXtV90eiOJgMdgmAyyWDBsGoKsdhWbVCMBqxEyp1AC/GPF4BKHILpVCWMkiTMPdNaa23MYgco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YQhiQmso; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YQhiQmso"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733414268; x=1764950268;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gYj2Cn0A25p30ukJU5NirjJCGlV3C1DFe68Dw8RwYzg=;
  b=YQhiQmsoZ/QxyEPuWYE4/OhF3iD4jL0hYs9pMxtZgJsV3v1SbAtBYBpK
   KCvaQCgU5FDBH23mumIZQ/HA0pKMZDHXUTpqISXX3zRPMt6PrgeHVdUlY
   bjG4ls2Kl/7v2kiCOF8/IDRmwWfOmifhJz+IHOqvsoOCdXGQAQakkZSmD
   EKbrt6QrzQgfpCnO3utv6/a6YlSZrxwm5OqWFi+M5O0iuijZ6b56KsBCQ
   9ywQcE9EloWmzPZp7mXxUZ2PAs09JjbCV0X+Ir+jBKUP8gKMSK0tTOFjZ
   9MS8zjRCIaVSuOM5D4L0sS6iv7c60ZMmiG51GTNZziXQYfDw6/0Q++mF4
   g==;
X-CSE-ConnectionGUID: gsupaPHLRvquGaizY7Btsw==
X-CSE-MsgGUID: w45mip0UTAyYvsg8kbkZ/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="33976410"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="33976410"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 07:57:45 -0800
X-CSE-ConnectionGUID: LVDT7OZJSRue19ygkYAYkQ==
X-CSE-MsgGUID: dipDvXyMRlmwYrpo1fVt4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="93959166"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Dec 2024 07:57:43 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJEEW-0000AG-31;
	Thu, 05 Dec 2024 15:57:40 +0000
Date: Thu, 5 Dec 2024 23:57:23 +0800
From: kernel test robot <lkp@intel.com>
To: Sricharan R <quic_srichara@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/2] mailbox: tmelite-qmp: Introduce QCOM TMEL QMP
 mailbox driver
Message-ID: <202412052337.B1J3nB8v-lkp@intel.com>
References: <20241205080633.2623142-3-quic_srichara@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205080633.2623142-3-quic_srichara@quicinc.com>

Hi Sricharan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.12]
[cannot apply to robh/for-next linus/master v6.13-rc1 next-20241205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sricharan-R/dt-bindings-mailbox-qcom-Document-qcom-tmelite-qmp/20241205-161122
base:   v6.12
patch link:    https://lore.kernel.org/r/20241205080633.2623142-3-quic_srichara%40quicinc.com
patch subject: [PATCH RFC 2/2] mailbox: tmelite-qmp: Introduce QCOM TMEL QMP mailbox driver
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20241205/202412052337.B1J3nB8v-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412052337.B1J3nB8v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412052337.B1J3nB8v-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/mailbox/qcom-tmelite-qmp.c:10:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/mailbox/qcom-tmelite-qmp.c:10:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/mailbox/qcom-tmelite-qmp.c:10:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/mailbox/qcom-tmelite-qmp.c:10:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/mailbox/qcom-tmelite-qmp.c:303:55: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     303 |                 dev_err(mdev->dev, "Unsupported packet size %lu\n", pkt->iov_len);
         |                                                             ~~~     ^~~~~~~~~~~~
         |                                                             %zu
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/mailbox/qcom-tmelite-qmp.c:705:10: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     704 |                 pr_err("Invalid pkt.size received size: %lu, expected: %zu\n",
         |                                                         ~~~
         |                                                         %zu
     705 |                        tdev->pkt.iov_len, sizeof(struct tmel_ipc_pkt));
         |                        ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:533:33: note: expanded from macro 'pr_err'
     533 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:490:60: note: expanded from macro 'printk'
     490 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:462:19: note: expanded from macro 'printk_index_wrap'
     462 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   9 warnings generated.


vim +303 drivers/mailbox/qcom-tmelite-qmp.c

   281	
   282	/**
   283	 * qmp_send_data() - Copy the data to the channel's mailbox and notify
   284	 *		     remote subsystem of new data. This function will
   285	 *		     return an error if the previous message sent has
   286	 *		     not been read. Cannot Sleep.
   287	 * @chan:	mailbox channel that data is to be sent over.
   288	 * @data:	Data to be sent to remote processor, should be in the format of
   289	 *		a kvec.
   290	 *
   291	 * Return: 0 on succes or standard Linux error code.
   292	 */
   293	static int qmp_send_data(struct qmp_device *mdev, void *data)
   294	{
   295		struct kvec *pkt = (struct kvec *)data;
   296		void __iomem *addr;
   297		unsigned long flags;
   298	
   299		if (!mdev || !data || !completion_done(&mdev->ch_complete))
   300			return -EINVAL;
   301	
   302		if (pkt->iov_len > QMP_MAX_PKT_SIZE) {
 > 303			dev_err(mdev->dev, "Unsupported packet size %lu\n", pkt->iov_len);
   304			return -EINVAL;
   305		}
   306	
   307		spin_lock_irqsave(&mdev->tx_lock, flags);
   308		if (mdev->tx_sent) {
   309			spin_unlock_irqrestore(&mdev->tx_lock, flags);
   310			return -EAGAIN;
   311		}
   312	
   313		dev_dbg(mdev->dev, "%s: mcore 0x%x ucore 0x%x", __func__,
   314			mdev->mcore.val, mdev->ucore.val);
   315	
   316		addr = mdev->mcore_desc + QMP_CTRL_DATA_SIZE;
   317		memcpy_toio(addr, pkt->iov_base, pkt->iov_len);
   318	
   319		mdev->mcore.bits.frag_size = pkt->iov_len;
   320		mdev->mcore.bits.rem_frag_count = 0;
   321	
   322		dev_dbg(mdev->dev, "Copied buffer to mbox, sz: %d",
   323			mdev->mcore.bits.frag_size);
   324	
   325		mdev->tx_sent = true;
   326		QMP_MCORE_CH_VAR_TOGGLE(mdev, tx);
   327		send_irq(mdev);
   328		qmp_schedule_tx_timeout(mdev);
   329		spin_unlock_irqrestore(&mdev->tx_lock, flags);
   330	
   331		return 0;
   332	}
   333	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
