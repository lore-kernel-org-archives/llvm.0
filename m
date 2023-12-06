Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0642D7A6;
	Wed,  6 Dec 2023 23:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MxMcLE3X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701904270; x=1733440270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5G+k20sgMa+QbnWuXymdH1FNxQ71D3luO0TIpoxDr1U=;
  b=MxMcLE3Xf3HQg6GodWWZFkMsZTryC6IxUI46kISzW2dQIYO0X8zRDfI0
   VwZBM0fKBFWM/9UIuSR5WTC7Pep+SDDVwuLDsV4ajPr3OhPoG9WEoqYqJ
   i/QQUWlZwH63KD2WfLkNpQNCD2tgoy5ssF99knYRu2NSiTaAgJ0d99xeb
   ZLILQb21ABhpDom1lFVQZT1ZEPmUHD/5neg9qa63ySePhTW7YIIcZz0o5
   p25gOVJNj/kSQAUk6AgOxg7bgoK2szGXdx7K8EnYmzqKC3ZDmfhx50gp7
   dvFTJgxZX5kjY9gR8DgDSvxJyuaqSoLeMp5VeY6hrtyKyAVHu8pnYFIKN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="7443878"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="7443878"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 15:11:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="837487578"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="837487578"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 06 Dec 2023 15:11:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rB12m-000BXi-2O;
	Wed, 06 Dec 2023 23:11:04 +0000
Date: Thu, 7 Dec 2023 07:10:10 +0800
From: kernel test robot <lkp@intel.com>
To: Sujuan Chen <sujuan.chen@mediatek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Felix Fietkau <nbd@nbd.name>, Rex Lu <rex.lu@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [nbd168-wireless:mt76 58/62]
 drivers/net/wireless/mediatek/mt76/dma.c:249:49: warning: shift count >=
 width of type
Message-ID: <202312070745.56ZYhRLd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nbd168/wireless mt76
head:   131c05dd91da2a13df20d4e5671e7c90d510bf69
commit: 950aaa76922a903f2431d36e9093327dc0e8ff9c [58/62] wifi: mt76: mt7996: set DMA mask to 36 bits for boards with more than 4GB of RAM
config: i386-randconfig-012-20231207 (https://download.01.org/0day-ci/archive/20231207/202312070745.56ZYhRLd-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231207/202312070745.56ZYhRLd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312070745.56ZYhRLd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/mediatek/mt76/dma.c:249:49: warning: shift count >= width of type [-Wshift-count-overflow]
           buf1 = FIELD_PREP(MT_DMA_CTL_SDP0_H, buf->addr >> 32);
                                                          ^  ~~
   include/linux/bitfield.h:114:33: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                                                 ^~~~
   include/linux/bitfield.h:68:41: note: expanded from macro '__BF_FIELD_CHECK'
                   BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
                                                         ^~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                                            ^~~~
   include/linux/compiler_types.h:435:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:423:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:415:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/net/wireless/mediatek/mt76/dma.c:249:49: warning: shift count >= width of type [-Wshift-count-overflow]
           buf1 = FIELD_PREP(MT_DMA_CTL_SDP0_H, buf->addr >> 32);
                                                          ^  ~~
   include/linux/bitfield.h:114:33: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                                                 ^~~~
   include/linux/bitfield.h:69:39: note: expanded from macro '__BF_FIELD_CHECK'
                                    ~((_mask) >> __bf_shf(_mask)) & (_val) : 0, \
                                                                     ^~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                                            ^~~~
   include/linux/compiler_types.h:435:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:423:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:415:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
>> drivers/net/wireless/mediatek/mt76/dma.c:249:49: warning: shift count >= width of type [-Wshift-count-overflow]
           buf1 = FIELD_PREP(MT_DMA_CTL_SDP0_H, buf->addr >> 32);
                                                          ^  ~~
   include/linux/bitfield.h:115:20: note: expanded from macro 'FIELD_PREP'
                   ((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);   \
                                    ^~~~
   drivers/net/wireless/mediatek/mt76/dma.c:316:53: warning: shift count >= width of type [-Wshift-count-overflow]
                   info |= FIELD_PREP(MT_DMA_CTL_SDP0_H, buf[0].addr >> 32);
                                                                     ^  ~~
   include/linux/bitfield.h:114:33: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                                                 ^~~~
   include/linux/bitfield.h:68:41: note: expanded from macro '__BF_FIELD_CHECK'
                   BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
                                                         ^~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                                            ^~~~
   include/linux/compiler_types.h:435:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:423:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:415:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   drivers/net/wireless/mediatek/mt76/dma.c:316:53: warning: shift count >= width of type [-Wshift-count-overflow]
                   info |= FIELD_PREP(MT_DMA_CTL_SDP0_H, buf[0].addr >> 32);
                                                                     ^  ~~
   include/linux/bitfield.h:114:33: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                                                 ^~~~
   include/linux/bitfield.h:69:39: note: expanded from macro '__BF_FIELD_CHECK'
                                    ~((_mask) >> __bf_shf(_mask)) & (_val) : 0, \
                                                                     ^~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                                            ^~~~
   include/linux/compiler_types.h:435:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:423:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:415:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   drivers/net/wireless/mediatek/mt76/dma.c:316:53: warning: shift count >= width of type [-Wshift-count-overflow]
                   info |= FIELD_PREP(MT_DMA_CTL_SDP0_H, buf[0].addr >> 32);
                                                                     ^  ~~
   include/linux/bitfield.h:115:20: note: expanded from macro 'FIELD_PREP'
                   ((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);   \
                                    ^~~~
   drivers/net/wireless/mediatek/mt76/dma.c:323:21: warning: shift count >= width of type [-Wshift-count-overflow]
                                              buf[1].addr >> 32);
                                                          ^  ~~
   include/linux/bitfield.h:114:33: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                                                 ^~~~
   include/linux/bitfield.h:68:41: note: expanded from macro '__BF_FIELD_CHECK'
                   BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?           \
                                                         ^~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                                            ^~~~
   include/linux/compiler_types.h:435:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:423:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:415:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   drivers/net/wireless/mediatek/mt76/dma.c:323:21: warning: shift count >= width of type [-Wshift-count-overflow]
                                              buf[1].addr >> 32);
                                                          ^  ~~
   include/linux/bitfield.h:114:33: note: expanded from macro 'FIELD_PREP'
                   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
                                                 ^~~~
   include/linux/bitfield.h:69:39: note: expanded from macro '__BF_FIELD_CHECK'
                                    ~((_mask) >> __bf_shf(_mask)) & (_val) : 0, \
                                                                     ^~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                                            ^~~~
   include/linux/compiler_types.h:435:22: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                               ^~~~~~~~~
   include/linux/compiler_types.h:423:23: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
                                ^~~~~~~~~
   include/linux/compiler_types.h:415:9: note: expanded from macro '__compiletime_assert'
                   if (!(condition))                                       \
                         ^~~~~~~~~
   drivers/net/wireless/mediatek/mt76/dma.c:323:21: warning: shift count >= width of type [-Wshift-count-overflow]
                                              buf[1].addr >> 32);
                                                          ^  ~~
   include/linux/bitfield.h:115:20: note: expanded from macro 'FIELD_PREP'
                   ((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask);   \


vim +249 drivers/net/wireless/mediatek/mt76/dma.c

   227	
   228	static int
   229	mt76_dma_add_rx_buf(struct mt76_dev *dev, struct mt76_queue *q,
   230			    struct mt76_queue_buf *buf, void *data)
   231	{
   232		struct mt76_queue_entry *entry = &q->entry[q->head];
   233		struct mt76_txwi_cache *txwi = NULL;
   234		struct mt76_desc *desc;
   235		int idx = q->head;
   236		u32 buf1, ctrl;
   237		int rx_token;
   238	
   239		if (mt76_queue_is_wed_rro_ind(q)) {
   240			struct mt76_wed_rro_desc *rro_desc;
   241	
   242			rro_desc = (struct mt76_wed_rro_desc *)q->desc;
   243			data = &rro_desc[q->head];
   244			goto done;
   245		}
   246	
   247		desc = &q->desc[q->head];
   248		ctrl = FIELD_PREP(MT_DMA_CTL_SD_LEN0, buf[0].len);
 > 249		buf1 = FIELD_PREP(MT_DMA_CTL_SDP0_H, buf->addr >> 32);
   250	
   251		if (mt76_queue_is_wed_rx(q)) {
   252			txwi = mt76_get_rxwi(dev);
   253			if (!txwi)
   254				return -ENOMEM;
   255	
   256			rx_token = mt76_rx_token_consume(dev, data, txwi, buf->addr);
   257			if (rx_token < 0) {
   258				mt76_put_rxwi(dev, txwi);
   259				return -ENOMEM;
   260			}
   261	
   262			buf1 |= FIELD_PREP(MT_DMA_CTL_TOKEN, rx_token);
   263			ctrl |= MT_DMA_CTL_TO_HOST;
   264		}
   265	
   266		WRITE_ONCE(desc->buf0, cpu_to_le32(buf->addr));
   267		WRITE_ONCE(desc->buf1, cpu_to_le32(buf1));
   268		WRITE_ONCE(desc->ctrl, cpu_to_le32(ctrl));
   269		WRITE_ONCE(desc->info, 0);
   270	
   271	done:
   272		entry->dma_addr[0] = buf->addr;
   273		entry->dma_len[0] = buf->len;
   274		entry->txwi = txwi;
   275		entry->buf = data;
   276		entry->wcid = 0xffff;
   277		entry->skip_buf1 = true;
   278		q->head = (q->head + 1) % q->ndesc;
   279		q->queued++;
   280	
   281		return idx;
   282	}
   283	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
