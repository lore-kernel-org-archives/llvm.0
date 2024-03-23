Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA153209;
	Sat, 23 Mar 2024 00:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711153848; cv=none; b=b8ybri085M8W/UsOEHHmIdZjgYSVzE5/cQ+bdpAdO7rkWywQWHLwnrJDxV8qZ4FLzar3xh5GB6uLuBInf9dFHiOhaU5VA3mx/Wx4s00w7Qpx+cS4vX/nrukc3zNqUm10CK0qRa1j5E2tyJIOltcHGERwFTpfP/drYOKrE7ZGzsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711153848; c=relaxed/simple;
	bh=fvYbg/R9o3D49pUo0AKjKkNjgCrUFNBoKqPCTTEhlws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kyMZs7ERQhOZjCLg/pMFoKkr6yfAUBLtkNdZxRHgmvCXL/juNyiwWHwmRf6I4uL/WBNcAL4SQd53PK+nRfC6OBAGdjRlKT75BDMfP8JoUJQPjZuZh13hNUe9uqHGIBc4h4WbJxSHwhuj4bO1+ZdfANUvbp0cap3Tc82EFKNj9hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lR6BG7W1; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lR6BG7W1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711153844; x=1742689844;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fvYbg/R9o3D49pUo0AKjKkNjgCrUFNBoKqPCTTEhlws=;
  b=lR6BG7W1lUQrlr62pxFQMAyV9/gby0uKswKvV5nuI0OgqcZsNjnKXA9k
   qOd1rDViy0Wuk2ZxGgghS+yODUDWSZYTQfaG5DWYzEJjzA0DZFdt3N1ln
   hL6dOaeFknJY14GJzeIua4KeNo+Zbz1z+c+JcBQ4LjG6GsSf2zoTtYAfQ
   xYaJfYMAmgfibKnBXlJ/WdBTW/GMDYZK311UmMQG7vaPIcfL4KBhFW617
   jm9vEFs8HZ70oJYpHAe5IlfCDMUAivfWebVmIAbJmc62Cws9SEzkhlj86
   B2xYKiQ364nVPn8hgOmUnhCsSAxKq2ZcBrc1c4avAbCszd2LKGjDRIk7i
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="16765886"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; 
   d="scan'208";a="16765886"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 17:30:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; 
   d="scan'208";a="19761066"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 22 Mar 2024 17:30:43 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnpHU-000Kjt-1C;
	Sat, 23 Mar 2024 00:30:40 +0000
Date: Sat, 23 Mar 2024 08:29:58 +0800
From: kernel test robot <lkp@intel.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH vhost v4 3/6] virtio: find_vqs: pass struct instead of
 multi parameters
Message-ID: <202403230820.okiEkuGQ-lkp@intel.com>
References: <20240321101532.59272-4-xuanzhuo@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240321101532.59272-4-xuanzhuo@linux.alibaba.com>

Hi Xuan,

kernel test robot noticed the following build errors:

[auto build test ERROR on remoteproc/rproc-next]
[also build test ERROR on v6.8]
[cannot apply to s390/features linus/master uml/next uml/fixes next-20240322]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xuan-Zhuo/virtio_balloon-remove-the-dependence-where-names-is-null/20240321-182217
base:   git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rproc-next
patch link:    https://lore.kernel.org/r/20240321101532.59272-4-xuanzhuo%40linux.alibaba.com
patch subject: [PATCH vhost v4 3/6] virtio: find_vqs: pass struct instead of multi parameters
config: arm-randconfig-002-20240322 (https://download.01.org/0day-ci/archive/20240323/202403230820.okiEkuGQ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 23de3862dce582ce91c1aa914467d982cb1a73b4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240323/202403230820.okiEkuGQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403230820.okiEkuGQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/virtio/virtio_vdpa.c:17:
   In file included from include/linux/virtio.h:7:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/virtio/virtio_vdpa.c:216:36: error: no member named 'cfg_idx' in 'struct virtio_vq_config'
     216 |         cb.callback = cfg->callbacks[cfg->cfg_idx] ? virtio_vdpa_virtqueue_cb : NULL;
         |                                      ~~~  ^
   1 warning and 1 error generated.


vim +216 drivers/virtio/virtio_vdpa.c

  > 17	#include <linux/virtio.h>
    18	#include <linux/vdpa.h>
    19	#include <linux/virtio_config.h>
    20	#include <linux/virtio_ring.h>
    21	
    22	#define MOD_VERSION  "0.1"
    23	#define MOD_AUTHOR   "Jason Wang <jasowang@redhat.com>"
    24	#define MOD_DESC     "vDPA bus driver for virtio devices"
    25	#define MOD_LICENSE  "GPL v2"
    26	
    27	struct virtio_vdpa_device {
    28		struct virtio_device vdev;
    29		struct vdpa_device *vdpa;
    30		u64 features;
    31	
    32		/* The lock to protect virtqueue list */
    33		spinlock_t lock;
    34		/* List of virtio_vdpa_vq_info */
    35		struct list_head virtqueues;
    36	};
    37	
    38	struct virtio_vdpa_vq_info {
    39		/* the actual virtqueue */
    40		struct virtqueue *vq;
    41	
    42		/* the list node for the virtqueues list */
    43		struct list_head node;
    44	};
    45	
    46	static inline struct virtio_vdpa_device *
    47	to_virtio_vdpa_device(struct virtio_device *dev)
    48	{
    49		return container_of(dev, struct virtio_vdpa_device, vdev);
    50	}
    51	
    52	static struct vdpa_device *vd_get_vdpa(struct virtio_device *vdev)
    53	{
    54		return to_virtio_vdpa_device(vdev)->vdpa;
    55	}
    56	
    57	static void virtio_vdpa_get(struct virtio_device *vdev, unsigned int offset,
    58				    void *buf, unsigned int len)
    59	{
    60		struct vdpa_device *vdpa = vd_get_vdpa(vdev);
    61	
    62		vdpa_get_config(vdpa, offset, buf, len);
    63	}
    64	
    65	static void virtio_vdpa_set(struct virtio_device *vdev, unsigned int offset,
    66				    const void *buf, unsigned int len)
    67	{
    68		struct vdpa_device *vdpa = vd_get_vdpa(vdev);
    69	
    70		vdpa_set_config(vdpa, offset, buf, len);
    71	}
    72	
    73	static u32 virtio_vdpa_generation(struct virtio_device *vdev)
    74	{
    75		struct vdpa_device *vdpa = vd_get_vdpa(vdev);
    76		const struct vdpa_config_ops *ops = vdpa->config;
    77	
    78		if (ops->get_generation)
    79			return ops->get_generation(vdpa);
    80	
    81		return 0;
    82	}
    83	
    84	static u8 virtio_vdpa_get_status(struct virtio_device *vdev)
    85	{
    86		struct vdpa_device *vdpa = vd_get_vdpa(vdev);
    87		const struct vdpa_config_ops *ops = vdpa->config;
    88	
    89		return ops->get_status(vdpa);
    90	}
    91	
    92	static void virtio_vdpa_set_status(struct virtio_device *vdev, u8 status)
    93	{
    94		struct vdpa_device *vdpa = vd_get_vdpa(vdev);
    95	
    96		return vdpa_set_status(vdpa, status);
    97	}
    98	
    99	static void virtio_vdpa_reset(struct virtio_device *vdev)
   100	{
   101		struct vdpa_device *vdpa = vd_get_vdpa(vdev);
   102	
   103		vdpa_reset(vdpa, 0);
   104	}
   105	
   106	static bool virtio_vdpa_notify(struct virtqueue *vq)
   107	{
   108		struct vdpa_device *vdpa = vd_get_vdpa(vq->vdev);
   109		const struct vdpa_config_ops *ops = vdpa->config;
   110	
   111		ops->kick_vq(vdpa, vq->index);
   112	
   113		return true;
   114	}
   115	
   116	static bool virtio_vdpa_notify_with_data(struct virtqueue *vq)
   117	{
   118		struct vdpa_device *vdpa = vd_get_vdpa(vq->vdev);
   119		const struct vdpa_config_ops *ops = vdpa->config;
   120		u32 data = vring_notification_data(vq);
   121	
   122		ops->kick_vq_with_data(vdpa, data);
   123	
   124		return true;
   125	}
   126	
   127	static irqreturn_t virtio_vdpa_config_cb(void *private)
   128	{
   129		struct virtio_vdpa_device *vd_dev = private;
   130	
   131		virtio_config_changed(&vd_dev->vdev);
   132	
   133		return IRQ_HANDLED;
   134	}
   135	
   136	static irqreturn_t virtio_vdpa_virtqueue_cb(void *private)
   137	{
   138		struct virtio_vdpa_vq_info *info = private;
   139	
   140		return vring_interrupt(0, info->vq);
   141	}
   142	
   143	static struct virtqueue *
   144	virtio_vdpa_setup_vq(struct virtio_device *vdev, unsigned int index,
   145			     struct virtio_vq_config *cfg)
   146	{
   147		struct virtio_vdpa_device *vd_dev = to_virtio_vdpa_device(vdev);
   148		struct vdpa_device *vdpa = vd_get_vdpa(vdev);
   149		struct device *dma_dev;
   150		const struct vdpa_config_ops *ops = vdpa->config;
   151		struct virtio_vdpa_vq_info *info;
   152		bool (*notify)(struct virtqueue *vq) = virtio_vdpa_notify;
   153		struct vdpa_callback cb;
   154		struct virtqueue *vq;
   155		u64 desc_addr, driver_addr, device_addr;
   156		/* Assume split virtqueue, switch to packed if necessary */
   157		struct vdpa_vq_state state = {0};
   158		unsigned long flags;
   159		u32 align, max_num, min_num = 1;
   160		bool may_reduce_num = true;
   161		int err;
   162	
   163		if (index >= vdpa->nvqs)
   164			return ERR_PTR(-ENOENT);
   165	
   166		/* We cannot accept VIRTIO_F_NOTIFICATION_DATA without kick_vq_with_data */
   167		if (__virtio_test_bit(vdev, VIRTIO_F_NOTIFICATION_DATA)) {
   168			if (ops->kick_vq_with_data)
   169				notify = virtio_vdpa_notify_with_data;
   170			else
   171				__virtio_clear_bit(vdev, VIRTIO_F_NOTIFICATION_DATA);
   172		}
   173	
   174		/* Queue shouldn't already be set up. */
   175		if (ops->get_vq_ready(vdpa, index))
   176			return ERR_PTR(-ENOENT);
   177	
   178		/* Allocate and fill out our active queue description */
   179		info = kmalloc(sizeof(*info), GFP_KERNEL);
   180		if (!info)
   181			return ERR_PTR(-ENOMEM);
   182	
   183		max_num = ops->get_vq_num_max(vdpa);
   184		if (max_num == 0) {
   185			err = -ENOENT;
   186			goto error_new_virtqueue;
   187		}
   188	
   189		if (ops->get_vq_num_min)
   190			min_num = ops->get_vq_num_min(vdpa);
   191	
   192		may_reduce_num = (max_num == min_num) ? false : true;
   193	
   194		/* Create the vring */
   195		align = ops->get_vq_align(vdpa);
   196	
   197		if (ops->get_vq_dma_dev)
   198			dma_dev = ops->get_vq_dma_dev(vdpa, index);
   199		else
   200			dma_dev = vdpa_get_dma_dev(vdpa);
   201		vq = vring_create_virtqueue_dma(index, max_num, align, vdev,
   202						true, may_reduce_num,
   203						cfg->ctx ? cfg->ctx[index] : false,
   204						notify,
   205						cfg->callbacks[index],
   206						cfg->names[index],
   207						dma_dev);
   208		if (!vq) {
   209			err = -ENOMEM;
   210			goto error_new_virtqueue;
   211		}
   212	
   213		vq->num_max = max_num;
   214	
   215		/* Setup virtqueue callback */
 > 216		cb.callback = cfg->callbacks[cfg->cfg_idx] ? virtio_vdpa_virtqueue_cb : NULL;
   217		cb.private = info;
   218		cb.trigger = NULL;
   219		ops->set_vq_cb(vdpa, index, &cb);
   220		ops->set_vq_num(vdpa, index, virtqueue_get_vring_size(vq));
   221	
   222		desc_addr = virtqueue_get_desc_addr(vq);
   223		driver_addr = virtqueue_get_avail_addr(vq);
   224		device_addr = virtqueue_get_used_addr(vq);
   225	
   226		if (ops->set_vq_address(vdpa, index,
   227					desc_addr, driver_addr,
   228					device_addr)) {
   229			err = -EINVAL;
   230			goto err_vq;
   231		}
   232	
   233		/* reset virtqueue state index */
   234		if (virtio_has_feature(vdev, VIRTIO_F_RING_PACKED)) {
   235			struct vdpa_vq_state_packed *s = &state.packed;
   236	
   237			s->last_avail_counter = 1;
   238			s->last_avail_idx = 0;
   239			s->last_used_counter = 1;
   240			s->last_used_idx = 0;
   241		}
   242		err = ops->set_vq_state(vdpa, index, &state);
   243		if (err)
   244			goto err_vq;
   245	
   246		ops->set_vq_ready(vdpa, index, 1);
   247	
   248		vq->priv = info;
   249		info->vq = vq;
   250	
   251		spin_lock_irqsave(&vd_dev->lock, flags);
   252		list_add(&info->node, &vd_dev->virtqueues);
   253		spin_unlock_irqrestore(&vd_dev->lock, flags);
   254	
   255		return vq;
   256	
   257	err_vq:
   258		vring_del_virtqueue(vq);
   259	error_new_virtqueue:
   260		ops->set_vq_ready(vdpa, index, 0);
   261		/* VDPA driver should make sure vq is stopeed here */
   262		WARN_ON(ops->get_vq_ready(vdpa, index));
   263		kfree(info);
   264		return ERR_PTR(err);
   265	}
   266	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
