Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9743513E8AE;
	Thu, 28 Nov 2024 18:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732816988; cv=none; b=bsFyKSlP8ey6fMD+qXloGW8JJFlz+3aPJoV3JfULMWlj7VrEO5yxlFgcW67qK3WKsbL1jXkfWtFa36BMvqHIzEbjWtpmGFVDEdFCquQncySHA+ywry/bX1kSvIvoo1VkXZaud3Z+zPmazQDkMYe83XJb7Gb/8kgbIZk/kRm7xp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732816988; c=relaxed/simple;
	bh=AtfypZDvCYRtmcRtXJjJpuKFRhOVj8jwu3jIrNjGWVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YbqIv7kEFsn0AkwyJp3rBEnbuGXkhLhHHw8xPBnKGAz2qWTxguK4bKA4v902M7lDYGx7enqJw1DJnD6i6j+IFx098xa6iyhkUZMD/tfffb7KcMmZAM+6HkkC1JUgeiTv5y0YPfadEhh/46qS32P/cR2FUu+6v28Fe5GLO117Djk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ay+xPQRh; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ay+xPQRh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732816987; x=1764352987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AtfypZDvCYRtmcRtXJjJpuKFRhOVj8jwu3jIrNjGWVQ=;
  b=Ay+xPQRhh5ZOIAhRm87Luyi0kzYfZ+7JloKuddMMtc7HILuq4cDrGxa3
   nh8tyENb9PmnIgEZL17uSm+3DeDnS39ggYt9IQ7cg+ZFy9R7o5KgayDbz
   q/6qhHJLT6iBibgTTj2Vup7kwWQcavkkDR1Qdz86HiWXQA6NVkAmJ8eOH
   b9jdBOjjTnMB6dX1g7mH4JnkBld+w4fq1x75kRwJUt7QejtlJkXGuouAT
   YntnCWM5KhbBZOs0eS5GLDyyq32tVgLDzgPsclvMd2CYHIXvGEyVV+2Ay
   gd2X/jeD7VouHdU5NMpMiZzD4stPYXppzfuBTh8ktwoCMZzbFkzJUBkTf
   w==;
X-CSE-ConnectionGUID: 3K2bdcUIRRKhl1Vp3LmvyQ==
X-CSE-MsgGUID: O8wX17taRmO/6QFubNSxUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="36987994"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="36987994"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 10:03:04 -0800
X-CSE-ConnectionGUID: 4l3xwNpsS8uZHVvQidqyZg==
X-CSE-MsgGUID: K54q15OfT12v4I+C2rmtbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="92174082"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Nov 2024 10:03:02 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGiqy-0009tY-13;
	Thu, 28 Nov 2024 18:03:00 +0000
Date: Fri, 29 Nov 2024 02:02:21 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [vincent-guittot:scmi/ffa-transport 1/1]
 drivers/firmware/arm_scmi/transports/ffa.c:184:28: warning: unused variable
 'msg_ops'
Message-ID: <202411290150.y0YTdvMj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.linaro.org/people/vincent.guittot/kernel.git scmi/ffa-transport
head:   878c4ab1e0ddfc9b1810f3bf4672336452859bee
commit: 878c4ab1e0ddfc9b1810f3bf4672336452859bee [1/1] scmi/ffa: add a new scmi transport layer based on ffa
config: arm64-randconfig-003-20241128 (https://download.01.org/0day-ci/archive/20241129/202411290150.y0YTdvMj-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411290150.y0YTdvMj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411290150.y0YTdvMj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/firmware/arm_scmi/transports/ffa.c:9:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/firmware/arm_scmi/transports/ffa.c:184:28: warning: unused variable 'msg_ops' [-Wunused-variable]
     184 |         const struct ffa_msg_ops *msg_ops = ffa_dev->ops->msg_ops;
         |                                   ^~~~~~~
>> drivers/firmware/arm_scmi/transports/ffa.c:185:6: warning: unused variable 'ret' [-Wunused-variable]
     185 |         int ret;
         |             ^~~
>> drivers/firmware/arm_scmi/transports/ffa.c:317:1: warning: unused label 'out' [-Wunused-label]
     317 | out:
         | ^~~~
   4 warnings generated.
--
>> drivers/firmware/arm_scmi/transports/ffa.c:117: warning: Function parameter or struct member 'ffa_dev' not described in 'scmi_ffa_service'
>> drivers/firmware/arm_scmi/transports/ffa.c:117: warning: Excess struct member 'dev' description in 'scmi_ffa_service'


vim +/msg_ops +184 drivers/firmware/arm_scmi/transports/ffa.c

   > 9	#include <linux/mm.h>
    10	#include <linux/module.h>
    11	#include <linux/mutex.h>
    12	#include <linux/platform_device.h>
    13	#include <linux/slab.h>
    14	#include <linux/tee_drv.h>
    15	#include <linux/uaccess.h>
    16	#include <linux/uuid.h>
    17	#include <uapi/linux/tee.h>
    18	#include <linux/arm_ffa.h>
    19	#include <linux/scatterlist.h>
    20	
    21	#include "../common.h"
    22	
    23	#define SCMI_FFA_MAX_MSG_SIZE		128
    24	
    25	enum scmi_ffa_pta_cmd {
    26		/*
    27		 * FFA_SCMI_CMD_CAPABILITIES - Get channel capabilities
    28		 *
    29		 * [out]    data0: Cmd FFA_SCMI_CMD_CAPABILITIES
    30		 * [in]    data1: Capability bit mask
    31		 */
    32		FFA_SCMI_CMD_CAPABILITIES = 0,
    33	
    34		/*
    35		 * FFA_SCMI_CMD_GET_CHANNEL - Get channel handle
    36		 *
    37		 * [out]    data0: Cmd FFA_SCMI_CMD_GET_CHANNEL
    38		 * [out]    data1: Channel identifier
    39		 * [in]     data1: Returned channel handle
    40		 * [out]    data2: Shared memory handle (optional)
    41		 */
    42		FFA_SCMI_CMD_GET_CHANNEL = 1,
    43	
    44		/*
    45		 * FFA_SCMI_CMD_MSG_SEND_DIRECT_REQ - Process direct SCMI message
    46		 * with shared memory
    47		 *
    48		 * [out]    data0: Cmd FFA_SCMI_CMD_MSG_SEND_DIRECT_REQ
    49		 * [out]    data1: Channel handle
    50		 * [in/out] data2: Response size
    51		 *
    52		 */
    53		FFA_SCMI_CMD_MSG_SEND_DIRECT_REQ = 2,
    54	
    55		/*
    56		 * FFA_SCMI_CMD_SEND_MSG2 - Process SCMI message in RXTX buffer
    57		 *
    58		 * Use FFA RX/TX message to exchange request with the SCMI server.
    59		 */
    60		FFA_SCMI_CMD_MSG_SEND2 = 3,
    61	};
    62	
    63	/*
    64	 * FFA SCMI service capabilities bit flags (32bit)
    65	 *
    66	 * FFA_SCMI_CAPS_RXTX_BUFFER
    67	 * When set, FFA transport layer uses the FFA RX/TX buffer with indirect message
    68	 * command FFA_MSG_SEND2.
    69	 *
    70	 * FFA_SCMI_CAPS_SHARED_BUFFER
    71	 * When set, FFA transport layer shares a page with the server. Direct message
    72	 * is used to send command and receive response. Notification is not supported.
    73	 */
    74	#define FFA_SCMI_CAPS_NONE		0
    75	#define FFA_SCMI_CAPS_RXTX_BUFFER	BIT(0)
    76	#define FFA_SCMI_CAPS_SHARED_BUFFER	BIT(1)
    77	#define FFA_SCMI_CAPS_MASK		(FFA_SCMI_CAPS_RXTX_BUFFER | \
    78						 FFA_SCMI_CAPS_SHARED_BUFFER)
    79	
    80	/**
    81	 * struct scmi_ffa_channel - Description of an FFA SCMI channel
    82	 *
    83	 * @channel_id: FFA channel ID used for this transport
    84	 * @tee_shm: Shared memory object or NULL if using RX/TX buffer
    85	 * @rx_len: Response size
    86	 * @mu: Mutex protection on channel access
    87	 * @cinfo: SCMI channel information
    88	 * @req: Shared memory buffer
    89	 * @link: Reference in agent's channel list
    90	 */
    91	struct scmi_ffa_channel {
    92		u32 channel_id;
    93		struct tee_shm *tee_shm;
    94		u32 rx_len;
    95		struct mutex mu;
    96		struct scmi_chan_info *cinfo;
    97		union {
    98			struct scmi_shared_mem __iomem *shmem;
    99			struct scmi_msg_payld *msg;
   100		} req;
   101		struct list_head link;
   102	};
   103	
   104	/**
   105	 * struct scmi_ffa_service - FFA transport private data
   106	 *
   107	 * @dev: Device used for communication with Secure Partition
   108	 * @caps: Supported capabilities
   109	 * @mu: Mutex for protection of @channel_list
   110	 * @channel_list: List of all created channels for the agent
   111	 */
   112	struct scmi_ffa_service {
   113		struct ffa_device *ffa_dev;
   114		u32 caps;
   115		struct mutex mu;
   116		struct list_head channel_list;
 > 117	};
   118	
   119	/* There can be only 1 SCMI service in FFA we connect to */
   120	static struct scmi_ffa_service *ffa_service;
   121	
   122	static struct scmi_transport_core_operations *core;
   123	
   124	static int get_capabilities(struct scmi_ffa_service *service)
   125	{
   126		struct ffa_device *ffa_dev = service->ffa_dev;
   127		const struct ffa_msg_ops *msg_ops = ffa_dev->ops->msg_ops;
   128		struct ffa_send_direct_data data = {
   129			.data0 = FFA_SCMI_CMD_CAPABILITIES,
   130			};
   131		unsigned int caps = 0;
   132		int ret;
   133	
   134		ret = msg_ops->sync_send_receive(ffa_dev, &data);
   135		if (ret) {
   136			dev_err(&ffa_dev->dev, "Can't get FFA SCMI caps %d / %#x\n",
   137				ret, (u32)data.data0);
   138			return -EOPNOTSUPP;
   139		}
   140	
   141		caps = data.data1;
   142		if (!(caps & FFA_SCMI_CAPS_MASK)) {
   143			dev_err(&ffa_dev->dev, "FFA SCMI doesn't support neither direct nor indirect message\n");
   144			return -EOPNOTSUPP;
   145		}
   146	
   147		if (!(caps & FFA_SCMI_CAPS_SHARED_BUFFER)) {
   148			dev_err(&ffa_dev->dev, "Current FFA transport version supports only direct message\n");
   149			return -EOPNOTSUPP;
   150		}
   151	
   152		service->caps = caps;
   153	
   154		return 0;
   155	}
   156	
   157	static int get_channel_id(struct scmi_ffa_channel *channel, uint32_t channel_id)
   158	{
   159		struct ffa_device *ffa_dev = ffa_service->ffa_dev;
   160		const struct ffa_msg_ops *msg_ops = ffa_dev->ops->msg_ops;
   161		struct ffa_send_direct_data data = {
   162			.data0 = FFA_SCMI_CMD_GET_CHANNEL,
   163			.data1 = (u32)channel_id,
   164			.data2 = channel->tee_shm->sec_world_id,
   165			};
   166		int ret;
   167	
   168		ret = msg_ops->sync_send_receive(ffa_dev, &data);
   169		if (ret || data.data0) {
   170			dev_err(&ffa_dev->dev, "Can't get channel id 0x%x : %d / %#x\n",
   171				channel_id, ret, (u32)data.data0);
   172			return -EOPNOTSUPP;
   173		}
   174	
   175		/* From now on use channel identifer provided by FFA SCMI service */
   176		channel->channel_id = data.data1;
   177	
   178		return 0;
   179	}
   180	
   181	static int invoke_ffa_indirect_msg_channel(struct scmi_ffa_channel *channel, void  *msg,  size_t msg_size)
   182	{
   183		struct ffa_device *ffa_dev = ffa_service->ffa_dev;
 > 184		const struct ffa_msg_ops *msg_ops = ffa_dev->ops->msg_ops;
 > 185		int ret;
   186	
   187		dev_dbg(&ffa_dev->dev, "%s channel_id 0x%x size %lu\n", __func__, channel->channel_id, msg_size);
   188	
   189		return -EIO;
   190	}
   191	
   192	static int invoke_ffa_direct_msg_channel(struct scmi_ffa_channel *channel, size_t msg_size)
   193	{
   194		struct ffa_device *ffa_dev = ffa_service->ffa_dev;
   195		const struct ffa_msg_ops *msg_ops = ffa_dev->ops->msg_ops;
   196		struct ffa_send_direct_data data = {
   197			.data0 = FFA_SCMI_CMD_MSG_SEND_DIRECT_REQ,
   198			.data1 = (u32)channel->channel_id,
   199			.data2 = msg_size,
   200		};
   201		int ret;
   202	
   203		dev_dbg(&ffa_dev->dev, "%s channel_id 0x%x size %lu\n", __func__, channel->channel_id, msg_size);
   204	
   205		ret = msg_ops->sync_send_receive(ffa_dev, &data);
   206		if (ret || data.data0) {
   207			dev_err(&ffa_dev->dev, "Can't invoke channel %x: %d / %#x\n",
   208				channel->channel_id, ret, (u32)data.data0);
   209			return -EIO;
   210		}
   211	
   212		/* Save response size */
   213		channel->rx_len = data.data2;
   214	
   215		return 0;
   216	}
   217	
   218	static bool scmi_ffa_chan_available(struct device_node *of_node, int idx)
   219	{
   220		u32 channel_id;
   221	
   222		return !of_property_read_u32_index(of_node, "linaro,ffa-channel-id",
   223						   idx, &channel_id);
   224	}
   225	
   226	static int ffa_memory_share(struct ffa_device *ffa_dev, struct tee_shm *shm, unsigned long start)
   227	{
   228		const struct ffa_mem_ops *mem_ops = ffa_dev->ops->mem_ops;
   229		struct ffa_mem_region_attributes mem_attr = {
   230			.receiver = ffa_dev->vm_id,
   231			.attrs = FFA_MEM_RW,
   232		};
   233		struct ffa_mem_ops_args args = {
   234			.use_txbuf = true,
   235			.attrs = &mem_attr,
   236			.nattrs = 1,
   237		};
   238		struct sg_table sgt;
   239		int rc = 0;
   240	
   241		shm->sec_world_id = 0xDEADBEEF;
   242	
   243		/* Share the pages with SCMI server SP */
   244		rc = sg_alloc_table_from_pages(&sgt, shm->pages, shm->num_pages, 0,
   245					       shm->num_pages * PAGE_SIZE, GFP_KERNEL);
   246		if (rc)
   247			return rc;
   248	
   249		args.sg = sgt.sgl;
   250		rc = mem_ops->memory_share(&args);
   251		sg_free_table(&sgt);
   252		if (rc) {
   253			return rc;
   254		}
   255	
   256		/* Save memory handle */
   257		shm->sec_world_id = args.g_handle;
   258		return 0;
   259	}
   260	
   261	static int ffa_shm_alloc_kernel_buf(struct scmi_ffa_channel *channel)
   262	{
   263		size_t msg_size = SCMI_FFA_MAX_MSG_SIZE;
   264		struct ffa_device *ffa_dev = ffa_service->ffa_dev;
   265		struct page *page;
   266		struct tee_shm *shm;
   267		void *shbuf;
   268		int ret;
   269	
   270		/*
   271		 * If only MSG_SEND_DIRECT_REQ is supported, allocate and share a page
   272		 * Otherwise use RX/TX buffer
   273		 */
   274		if (ffa_service->caps & ~(FFA_SCMI_CAPS_SHARED_BUFFER))
   275			return 0;
   276	
   277		/*
   278		 * Ignore alignment since this is already going to be page aligned
   279		 * and there's no need for any larger alignment.
   280		 */
   281		page = alloc_pages(GFP_KERNEL | __GFP_ZERO, 1);
   282		if (!page)
   283			return -ENOMEM;
   284	
   285		/* Allocate shared memory object */
   286		shm = kzalloc(sizeof(*shm), GFP_KERNEL);
   287		if (!shm) {
   288			ret = -ENOMEM;
   289			goto err_free_page;
   290		}
   291	
   292		/* Init shared memory object */
   293		shm->flags = 0;
   294		shm->kaddr = page_address(page);
   295		shm->paddr = page_to_phys(page);
   296		shm->size = PAGE_SIZE;
   297		shm->offset = 0;
   298	
   299		shm->pages = kcalloc(1, sizeof(*shm->pages), GFP_KERNEL);
   300		if (!shm->pages) {
   301			ret = -ENOMEM;
   302			goto err_free_shm;
   303		}
   304	
   305		shm->pages[0] = page;
   306		shm->num_pages = 1;
   307	
   308		ret = ffa_memory_share(ffa_dev, shm, (unsigned long)shm->kaddr);
   309		if (ret)
   310			goto err_put_shm_pages;
   311	
   312		/* Init Channel message */
   313		shbuf = tee_shm_get_va(shm, 0);
   314		memset(shbuf, 0, msg_size);
   315		channel->tee_shm = shm;
   316	
 > 317	out:
   318		channel->req.msg = shbuf;
   319		channel->rx_len = msg_size;
   320	
   321		return 0;
   322	
   323	err_put_shm_pages:
   324		kfree(shm->pages);
   325	err_free_shm:
   326		kfree(shm);
   327	err_free_page:
   328		free_pages((unsigned long)page_address(page), 1);
   329		return ret;
   330	}
   331	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
