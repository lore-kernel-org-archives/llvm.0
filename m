Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DA91DE8AF;
	Thu, 17 Oct 2024 15:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729179937; cv=none; b=GYXcO9cvLJcrr3QMMKxQ0/cKTSFFjxX/zpIhgDIWIa90xbMXW8oRL2PzLhSidM4hORRfWwiQRuE6yz2h1XEnVc3Ad05+Hefw42d+vq6AGYk4ETB4UNoW+ydgd6JMxD7IstPHIUI4XMVB22pUtO438nUPf1PnRQK9GSbu14P5g8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729179937; c=relaxed/simple;
	bh=fX05BKuUlo+pbjB6aPV4sDFdLrsi2ruVzH9d3En1Q+s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PAZjGJYWxrB2rsQ0KiZWaLp2bLoqEqf9LsrzO58tbZB04gm8jFvcrSlSGx7FOJ8vdsxQ5Ff4nVBmjoRL5ermo0yYecuBga/3bLsBsrLbvJzjxtCoyRnBaxjG8b2XLmWIFvBNCZGfGBS5dBUIRDx+JF9HfnPEH6K1AsX5rmg0bRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hDfmAuA+; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hDfmAuA+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729179933; x=1760715933;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fX05BKuUlo+pbjB6aPV4sDFdLrsi2ruVzH9d3En1Q+s=;
  b=hDfmAuA+tTofYhhNiYg+1rmpcTkiAqzst2dpJLnJS33aYIU+o+Gph+kq
   kf/uFd+cjLie5zk1g42kZwjNXD6Z0gbEfnir30fQyDVFS3qEUpouRZAjN
   VpufF3uHHAKRoK94zIAh7kvE9f8De/voXQk8cowtbawkf2vQlS8wVcKjj
   YPQbftHw+OJPso0F3hdmciyfJ2EOPQD7Su1rcq0ssAo4CnnmsIzcUSLFC
   F+yIL3l48Fql5R1KuJKmtpRe6VQwLjL3hUWieSkQL+XOKz9R6qkJTWwUo
   LP7qW4MjcDbvOdrwIqpGHR2p21DUeu4/XLHHpz9RN90s696IplwXrmXIU
   w==;
X-CSE-ConnectionGUID: Zf2DoNqnSd+wJ0N5WFUsfw==
X-CSE-MsgGUID: 2+5yosQbT0azDCtOX+MwJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28825356"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28825356"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 08:45:32 -0700
X-CSE-ConnectionGUID: 3iVwNsoUQzmYJsHWX2Y+ZA==
X-CSE-MsgGUID: 4tjX71iRTw2kXgxB2TrPQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; 
   d="scan'208";a="78554044"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Oct 2024 08:45:31 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1Sgq-000MXB-1z;
	Thu, 17 Oct 2024 15:45:28 +0000
Date: Thu, 17 Oct 2024 23:44:31 +0800
From: kernel test robot <lkp@intel.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ambarus:v6.12-rc3-acpm 3/4] drivers/firmware/samsung/acpm_ipc.c:89:
 warning: Function parameter or struct member 'reserved' not described in
 'exynos_acpm_shmem_chan'
Message-ID: <202410172343.sIBTl4lf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ambarus/linux-0day v6.12-rc3-acpm
head:   d71fd673696817643113d8cc1cca465299882179
commit: a9f9802294ffb071360414c69ea507b6c6900bc0 [3/4] add acpm driver
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241017/202410172343.sIBTl4lf-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241017/202410172343.sIBTl4lf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410172343.sIBTl4lf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/samsung/acpm_ipc.c:89: warning: Function parameter or struct member 'reserved' not described in 'exynos_acpm_shmem_chan'
>> drivers/firmware/samsung/acpm_ipc.c:89: warning: Function parameter or struct member 'reserved1' not described in 'exynos_acpm_shmem_chan'
>> drivers/firmware/samsung/acpm_ipc.c:89: warning: Function parameter or struct member 'reserved2' not described in 'exynos_acpm_shmem_chan'
>> drivers/firmware/samsung/acpm_ipc.c:193: warning: Function parameter or struct member 'req' not described in 'exynos_acpm_work_data'
>> drivers/firmware/samsung/acpm_ipc.c:193: warning: Excess struct member 'mbox_request' description in 'exynos_acpm_work_data'
>> drivers/firmware/samsung/acpm_ipc.c:193: warning: Excess struct member 'work_data' description in 'exynos_acpm_work_data'
>> drivers/firmware/samsung/acpm_ipc.c:193: warning: Excess struct member 'status' description in 'exynos_acpm_work_data'


vim +89 drivers/firmware/samsung/acpm_ipc.c

    60	
    61	/**
    62	 * struct exynos_acpm_shmem_chan - descriptor of a shared memory channel.
    63	 *
    64	 * @id:			channel ID.
    65	 * @rx_rear:		rear pointer of RX queue.
    66	 * @rx_front:		front pointer of RX queue.
    67	 * @rx_base:		base address of RX queue.
    68	 * @tx_rear:		rear pointer of TX queue.
    69	 * @tx_front:		front pointer of TX queue.
    70	 * @tx_base:		base address of TX queue.
    71	 * @qlen:		queue length. Applies to both TX/RX queues.
    72	 * @mlen:		message length. Applies to both TX/RX queues.
    73	 * @polling:		true when the channel works on polling.
    74	 */
    75	struct exynos_acpm_shmem_chan {
    76		u32 id;
    77		u32 reserved[3];
    78		u32 rx_rear;
    79		u32 rx_front;
    80		u32 rx_base;
    81		u32 reserved1[3];
    82		u32 tx_rear;
    83		u32 tx_front;
    84		u32 tx_base;
    85		u32 qlen;
    86		u32 mlen;
    87		u32 reserved2[2];
    88		u32 polling;
  > 89	};
    90	
    91	/**
    92	 * struct exynos_acpm_queue - exynos acpm queue.
    93	 *
    94	 * @rear:	rear address of the queue.
    95	 * @front:	front address of the queue.
    96	 * @base:	base address of the queue.
    97	 */
    98	struct exynos_acpm_queue {
    99		void __iomem *rear;
   100		void __iomem *front;
   101		void __iomem *base;
   102	};
   103	
   104	/**
   105	 * struct exynos_acpm_rx_data - RX queue data.
   106	 *
   107	 * @cmd:	pointer to where the data shall be saved.
   108	 * @response:	true if the client expects the RX data.
   109	 */
   110	struct exynos_acpm_rx_data {
   111		u32 *cmd;
   112		bool response;
   113	};
   114	
   115	#define EXYNOS_ACPM_SEQNUM_MAX    64
   116	
   117	/**
   118	 * struct exynos_acpm_chan - driver internal representation of a channel.
   119	 * @tx:		TX queue. The enqueue is done by the host.
   120	 *			- front index is written by the host.
   121	 *			- rear index is written by the firmware.
   122	 *
   123	 * @rx:		RX queue. The enqueue is done by the firmware.
   124	 *			- front index is written by the firmware.
   125	 *			- rear index is written by the host.
   126	 * @rx_lock:	protects RX queue.
   127	 * @tx_lock:	protects TX queue.
   128	 * @qlen:	queue length. Applies to both TX/RX queues.
   129	 * @mlen:	message length. Applies to both TX/RX queues.
   130	 * @seqnum:	sequence number of the last message enqueued on TX queue.
   131	 * @id:		channel ID.
   132	 * @polling:	true when the channel works on polling.
   133	 * @bitmap_seqnum: bitmap that tracks the messages on the TX/RX queues.
   134	 * @rx_data:	internal buffer used to drain the RX queue.
   135	 */
   136	struct exynos_acpm_chan {
   137		struct exynos_acpm_queue tx;
   138		struct exynos_acpm_queue rx;
   139		spinlock_t rx_lock;
   140		spinlock_t tx_lock;
   141	
   142		unsigned int qlen;
   143		unsigned int mlen;
   144		u8 seqnum;
   145		u8 id;
   146		bool polling;
   147	
   148		DECLARE_BITMAP(bitmap_seqnum, EXYNOS_ACPM_SEQNUM_MAX - 1);
   149		struct exynos_acpm_rx_data rx_data[EXYNOS_ACPM_SEQNUM_MAX];
   150	};
   151	
   152	/**
   153	 * struct exynos_acpm - driver's private data.
   154	 * @shmem:	pointer to the SRAM configuration data.
   155	 * @chans:	pointer to the ACPM channel parameters retrieved from SRAM.
   156	 * @sram_base:	base address of SRAM.
   157	 * @regs:	mailbox registers base address.
   158	 * @mbox:	pointer to the mailbox controller.
   159	 * @wq:		pointer to workqueue.
   160	 * @dev:	pointer to the exynos-acpm device.
   161	 * @pclk:	pointer to the mailbox peripheral clock.
   162	 * @num_chans:	number of channels available for this controller.
   163	 */
   164	struct exynos_acpm {
   165		struct exynos_acpm_shmem *shmem;
   166		struct exynos_acpm_chan *chans;
   167		void __iomem *sram_base;
   168		void __iomem *regs;
   169		struct mbox_controller *mbox;
   170		struct workqueue_struct *wq;
   171		struct device *dev;
   172		struct clk *pclk;
   173		u32 num_chans;
   174	};
   175	
   176	/**
   177	 * struct exynos_acpm_work_data - data structure representing the work.
   178	 * @mbox_chan:	pointer to the mailbox channel.
   179	 * @mbox_request:	pointer to the mailbox request.
   180	 * @callback:	pointer to a callback function to be invoked upon
   181	 *		completion of this request. This has the form:
   182	 *		(callback)(struct exynos_acpm_work_data *work_data, int status)
   183	 *		where:
   184	 *		@work_data:	data structure representing the work.
   185	 *		@status:	status returned from the mailbox controller.
   186	 * @work:	describes the task to be executed.
   187	 */
   188	struct exynos_acpm_work_data {
   189		struct mbox_chan *mbox_chan;
   190		struct mbox_request *req;
   191		void (*callback)(struct exynos_acpm_work_data *work_data, int status);
   192		struct work_struct work;
 > 193	};
   194	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
