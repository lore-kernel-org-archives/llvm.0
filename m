Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88E718E0E;
	Fri,  6 Sep 2024 01:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725586212; cv=none; b=ldhkOuj7odjLoBnEga7K2iZBQhMclmV4zKWzcxlp/R2bkHxen03CUlfSPPDPv2wPD4sxKBOeWI8arCL88FfI3g1aRX+GExSWP2cIYsZ+ZUDjW3hazh+QDUVdIQmrbe4QbkRo2BosYxRUHgWXKx68asaIRBXdHubJMgWFDWiQaIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725586212; c=relaxed/simple;
	bh=HtG6uSXXWRog7nKDfiC6YaFPLPvrPqv+rZ6AdW7RDIw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xw8s4cRH/BVyYDzrVQgvphx82KMuY9HnaQg6n10EUwa3h6m2m6itSbva6MVmgWVMO6YPhV02gJWDWIVBZ8Y3sKq4KC9BSU/85Js7uSbo6NIxWDFI3vqiaTDLPE2BTmr/btzZG3jHKV8OXfvO4H81XQvcUCl8ROLTP/uSy6YAzq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j4+oBLEV; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j4+oBLEV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725586210; x=1757122210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HtG6uSXXWRog7nKDfiC6YaFPLPvrPqv+rZ6AdW7RDIw=;
  b=j4+oBLEVOpGJmHrZj7DzMpwbTih03DdXnHq5Lk6rwDYYYCm8lXKQdo8H
   CoCbOz97mPKKlHGEilGMB5XEgqwCgmGtBeEy2tMhEYBYwn8NGdB6tfyQg
   z9KfsdeeL91NfOEVYGuQ5fSXdZYT+OLrUnbX3oV6Q6kfuERCAOSgepBxC
   6S3lkiJ5pShUgHDxwzGY/8EK8UKXivsIFSCKLioMCk3pYVPH8DuLz2CfZ
   3r1xa6MRy/mtbtUbrUjtO7MPk0V9IJDF/EzMYB5dEngXGwbsmuOLvUxnx
   95mq+XFCyDcWRRgtEDU4ro2OXZIRfHxH/JW6+Kw2mf/G3UIcteXF2dvEF
   w==;
X-CSE-ConnectionGUID: 1mGEU3v0T9WaHI2V3Heodg==
X-CSE-MsgGUID: RAMqsmfaT6aG47Z1QWuzGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="23841735"
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; 
   d="scan'208";a="23841735"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 18:30:09 -0700
X-CSE-ConnectionGUID: lCQSG0QLS3aTdWCbRx7DkA==
X-CSE-MsgGUID: ACObBSwGQW2FqcqMnRscJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; 
   d="scan'208";a="66347794"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 Sep 2024 18:30:07 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smNnZ-000AUB-1F;
	Fri, 06 Sep 2024 01:30:05 +0000
Date: Fri, 6 Sep 2024 09:29:32 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.11-rc6-esp32 20/53]
 drivers/misc/esp32-ipc.c:152:13: warning: cast to 'void *' from smaller
 integer type 'u32' (aka 'unsigned int')
Message-ID: <202409060915.Nh4xNgvG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.11-rc6-esp32
head:   4a9ffb44ce4c24e9dcd4a5f06beeb3dded85319a
commit: 9aee3c117c9d9b9481c339d9ac7b47e6c949bdac [20/53] misc/esp32-ipc: introduce generic IPC for ESP32
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240906/202409060915.Nh4xNgvG-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 05f5a91d00b02f4369f46d076411c700755ae041)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240906/202409060915.Nh4xNgvG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409060915.Nh4xNgvG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/misc/esp32-ipc.c:5:
   In file included from include/linux/interrupt.h:22:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/misc/esp32-ipc.c:152:13: warning: cast to 'void *' from smaller integer type 'u32' (aka 'unsigned int') [-Wint-to-void-pointer-cast]
     152 |         hw->hw_q = (void *)readl(p);
         |                    ^~~~~~~~~~~~~~~~
   2 warnings generated.


vim +152 drivers/misc/esp32-ipc.c

     2	
     3	#include <linux/esp32-ipc-api.h>
     4	#include <linux/delay.h>
   > 5	#include <linux/interrupt.h>
     6	#include <linux/mutex.h>
     7	#include <linux/of.h>
     8	#include <linux/of_address.h>
     9	#include <linux/of_device.h>
    10	#include <linux/of_platform.h>
    11	#include <linux/platform_device.h>
    12	#include <linux/spinlock.h>
    13	
    14	#include "esp32-ipc.h"
    15	
    16	#define ESP32_IPC_IRQ_FROM_FW_REG	0
    17	#define ESP32_IPC_IRQ_TO_FW_REG		4
    18	
    19	#define ESP32_IPC_READ_HW_Q		0
    20	#define ESP32_IPC_WRITE_HW_Q		1
    21	
    22	#define ESP32_IPC_CLIENTS_MAX		4
    23	
    24	struct esp32_ipc_client {
    25		void *p;
    26		int (*rx)(void *p, void *data);
    27		void (*rx_batch_done)(void *p, u32 tag);
    28	};
    29	
    30	struct esp32_ipc {
    31		void __iomem *regs;
    32		int irq;
    33		struct esp32_ipc_queue *hw_q;
    34		spinlock_t lock;
    35		struct esp32_ipc_client client[ESP32_IPC_CLIENTS_MAX];
    36	};
    37	
    38	int esp32_ipc_register_rx(void *ipc, u32 addr, void *p,
    39				int (*rx)(void *p, void *data),
    40				void (*rx_batch_done)(void *p, u32 tag))
    41	{
    42		struct esp32_ipc *hw = ipc;
    43	
    44		if (addr < ESP32_IPC_CLIENTS_MAX) {
    45			hw->client[addr].p = p;
    46			hw->client[addr].rx = rx;
    47			hw->client[addr].rx_batch_done = rx_batch_done;
    48			return 0;
    49		}
    50		return -EINVAL;
    51	}
    52	EXPORT_SYMBOL(esp32_ipc_register_rx);
    53	
    54	int esp32_ipc_tx(void *ipc, u32 addr, void *info, u32 *tag)
    55	{
    56		struct esp32_ipc *hw = ipc;
    57		struct esp32_ipc_queue *q = hw->hw_q + ESP32_IPC_WRITE_HW_Q;
    58		struct esp32_ipc_queue_entry *data = (void *)hw->hw_q + q->offset;
    59		unsigned long flags;
    60		u32 r, w;
    61	
    62		spin_lock_irqsave(&hw->lock, flags);
    63		r = READ_ONCE(q->read);
    64		w = READ_ONCE(q->write);
    65		rmb();
    66		pr_debug("%s: q->read = %d, q->write = %d\n", __func__, r, w);
    67		if (w - r == q->mask) {
    68			spin_unlock_irqrestore(&hw->lock, flags);
    69			pr_debug("%s: write queue full\n", __func__);
    70			return -EBUSY;
    71		}
    72	
    73		WRITE_ONCE(data[w & q->mask].addr, addr);
    74		WRITE_ONCE(data[w & q->mask].info, info);
    75		wmb();
    76		if (tag)
    77			*tag = w;
    78		++w;
    79		WRITE_ONCE(q->write, w);
    80		spin_unlock_irqrestore(&hw->lock, flags);
    81		wmb();
    82		writel(1, hw->regs + ESP32_IPC_IRQ_TO_FW_REG);
    83		return 0;
    84	}
    85	EXPORT_SYMBOL(esp32_ipc_tx);
    86	
    87	static irqreturn_t esp32_ipc_irq_handler(int irq, void *dev)
    88	{
    89		struct esp32_ipc *hw = dev;
    90	
    91		if (hw->hw_q) {
    92			writel(0, hw->regs + ESP32_IPC_IRQ_FROM_FW_REG);
    93			return IRQ_WAKE_THREAD;
    94		}
    95		return IRQ_NONE;
    96	}
    97	
    98	static irqreturn_t esp32_ipc_thread_handler(int irq, void *dev)
    99	{
   100		struct esp32_ipc *hw = dev;
   101		struct esp32_ipc_queue *q = hw->hw_q + ESP32_IPC_READ_HW_Q;
   102		struct esp32_ipc_queue_entry *data = (void *)hw->hw_q + q->offset;
   103		bool rx_done[ESP32_IPC_CLIENTS_MAX] = {0};
   104		u32 w, r;
   105		int i;
   106	
   107		for (;;) {
   108			w = READ_ONCE(q->write);
   109			r = READ_ONCE(q->read);
   110			rmb();
   111			if (r == w) {
   112				break;
   113			} else {
   114				u32 addr = READ_ONCE(data[r & q->mask].addr);
   115				void *info = READ_ONCE(data[r & q->mask].info);
   116	
   117				pr_debug("%s: read queue: r = %d, w = %d\n", __func__, r, w);
   118				if (addr < ESP32_IPC_CLIENTS_MAX && hw->client[addr].rx) {
   119					if (hw->client[addr].rx(hw->client[addr].p, info))
   120						rx_done[addr] = true;
   121				} else {
   122					pr_warn("%s: got message for addr = %d, no handler\n",
   123						__func__, addr);
   124				}
   125				++r;
   126				wmb();
   127				WRITE_ONCE(q->read, r);
   128			}
   129		}
   130	
   131		q = hw->hw_q + ESP32_IPC_WRITE_HW_Q;
   132		r = READ_ONCE(q->read);
   133		rmb();
   134	
   135		/* postprocessing calls */
   136	
   137		for (i = 0; i < ESP32_IPC_CLIENTS_MAX; ++i) {
   138			if (rx_done[i] && hw->client[i].rx_batch_done)
   139				hw->client[i].rx_batch_done(hw->client[i].p, r);
   140		}
   141	
   142		return IRQ_HANDLED;
   143	}
   144	
   145	static int init_hw(struct platform_device *pdev, struct esp32_ipc *hw)
   146	{
   147		void __iomem *p;
   148	
   149		p = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 0, NULL);
   150		if (IS_ERR(p))
   151			return PTR_ERR(p);
 > 152		hw->hw_q = (void *)readl(p);
   153		devm_iounmap(&pdev->dev, p);
   154	
   155		hw->regs = devm_of_iomap(&pdev->dev, pdev->dev.of_node, 1, NULL);
   156		if (IS_ERR(hw->regs))
   157			return PTR_ERR(hw->regs);
   158	
   159		dev_dbg(&pdev->dev, "%s: regs = %p, queues = %p\n",
   160			__func__, hw->regs, hw->hw_q);
   161		if (hw->hw_q) {
   162			u32 i;
   163	
   164			for (i = 0; i < 2; ++i) {
   165				dev_dbg(&pdev->dev, "%s: queue %d: offset = %d, mask = %x\n",
   166					__func__, i,
   167					hw->hw_q[i].offset,
   168					hw->hw_q[i].mask);
   169			}
   170		} else {
   171			return -ENODEV;
   172		}
   173	
   174		hw->irq = platform_get_irq(pdev, 0);
   175		if (hw->irq >= 0) {
   176			int ret;
   177	
   178			ret = devm_request_threaded_irq(&pdev->dev, hw->irq,
   179							esp32_ipc_irq_handler,
   180							esp32_ipc_thread_handler,
   181							IRQF_SHARED, pdev->name, hw);
   182			if (ret < 0) {
   183				dev_err(&pdev->dev, "request_irq %d failed\n", hw->irq);
   184				return ret;
   185			}
   186		} else {
   187			dev_err(&pdev->dev, "missing IRQ property\n");
   188			return -ENODEV;
   189		}
   190	
   191		return 0;
   192	}
   193	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
