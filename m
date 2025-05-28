Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A63D13EFF3;
	Wed, 28 May 2025 15:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748444733; cv=none; b=QDBgQYKWV6AUtaX9nRe0E1QWoYYxqhgQuVyn8SvVEYYLRfrIWWAywKVKYReh9ew4WB6gRbseYqJCmlMm9F8Uu7i0qx8CNmnOZDaHNmGXP3SeSynvEURUCc2gIava3HefkAwZQQgNZPB7PJdRnTmx3DKEX9zlU95q5mxIdX1bB20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748444733; c=relaxed/simple;
	bh=zhvyuzLrK5n6OUVbI62QSy1rb7U3esqo/4EEAEHM8SA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EgnN0F5inn+CiqaUnb/XQOJ1f1zarr4Tq7FtbL1ulLuYLp+rOLQz5KeKek9EIbV6+y2yh6fZeikSze1yxKaFyr7MKVDhXt3MSJr7jpKm7USqbQRQ7ozMozw+3UtVVR1DuwhuX2bZ0PTkhJyuFhgBZOagSrwZHhg+Li1OyXDG7FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cIlBl5EC; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cIlBl5EC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748444732; x=1779980732;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zhvyuzLrK5n6OUVbI62QSy1rb7U3esqo/4EEAEHM8SA=;
  b=cIlBl5EC8QRdG0tif0/DYurN+oCjbYaKAw67aH0j2LE7HDsEhGilWjLq
   GtdFvAt76FO/qdW1k8+BT39V4oFzmea8rJThVcG9EbHbs3B6TfRvHclA7
   JeguBZqh6/bFNUB4WpqCOsjjLDhicjmkmVG2XeoswSDsqcNR081eu+tCb
   FxxnrmbM+V73+ADh/Gw9O+ingxXgrnWDhxbXiw4Yi6LFVI5IksB+cSOci
   P10+fG6iJDBZgSTtSGVW+rtpo9XKCgfKpr8P9Y1TUpMsTraXnNsqQj7nu
   uorcZ2hnr/IHdkIhMhkOGoy6CCO0OVhxjMHUHIJg1POTF9rNYXNiNpD+Q
   w==;
X-CSE-ConnectionGUID: P4nasgOmTaiJJbvna72DoA==
X-CSE-MsgGUID: 2ob1UNqQSaCIwLijYXkuyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="54271013"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="54271013"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 08:05:30 -0700
X-CSE-ConnectionGUID: H2diCw0jSpqy65KQgLimxw==
X-CSE-MsgGUID: pVfdUDaYRI6hPQWbpUbzEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="144235065"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 May 2025 08:05:17 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKILC-000Vmu-24;
	Wed, 28 May 2025 15:05:14 +0000
Date: Wed, 28 May 2025 23:04:41 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Wang <jasowang@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH V2 19/19] virtio_ring: add in order support
Message-ID: <202505282256.MVII3mpu-lkp@intel.com>
References: <20250528064234.12228-20-jasowang@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528064234.12228-20-jasowang@redhat.com>

Hi Jason,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mst-vhost/linux-next]
[also build test WARNING on linus/master v6.15 next-20250528]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Wang/virtio_ring-rename-virtqueue_reinit_xxx-to-virtqueue_reset_xxx/20250528-144806
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next
patch link:    https://lore.kernel.org/r/20250528064234.12228-20-jasowang%40redhat.com
patch subject: [PATCH V2 19/19] virtio_ring: add in order support
config: arm-randconfig-002-20250528 (https://download.01.org/0day-ci/archive/20250528/202505282256.MVII3mpu-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505282256.MVII3mpu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505282256.MVII3mpu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virtio/virtio_ring.c:2109:40: warning: variable 'id' is uninitialized when used here [-Wuninitialized]
    2109 |                 BAD_RING(vq, "id %u out of range\n", id);
         |                                                      ^~
   drivers/virtio/virtio_ring.c:60:32: note: expanded from macro 'BAD_RING'
      60 |                         "%s:"fmt, (_vq)->vq.name, ##args);      \
         |                                                     ^~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/virtio/virtio_ring.c:2075:19: note: initialize the variable 'id' to silence this warning
    2075 |         u16 last_used, id, last_used_idx;
         |                          ^
         |                           = 0
   1 warning generated.


vim +/id +2109 drivers/virtio/virtio_ring.c

  2069	
  2070	static void *virtqueue_get_buf_ctx_packed_in_order(struct vring_virtqueue *vq,
  2071							   unsigned int *len,
  2072							   void **ctx)
  2073	{
  2074		unsigned int num = vq->packed.vring.num;
  2075		u16 last_used, id, last_used_idx;
  2076		bool used_wrap_counter;
  2077		void *ret;
  2078	
  2079		START_USE(vq);
  2080	
  2081		if (unlikely(vq->broken)) {
  2082			END_USE(vq);
  2083			return NULL;
  2084		}
  2085	
  2086		last_used_idx = vq->last_used_idx;
  2087		used_wrap_counter = packed_used_wrap_counter(last_used_idx);
  2088		last_used = packed_last_used(last_used_idx);
  2089	
  2090		if (vq->batch_head == num) {
  2091			if (!__more_used_packed(vq)) {
  2092				pr_debug("No more buffers in queue\n");
  2093				END_USE(vq);
  2094				return NULL;
  2095			}
  2096			/* Only get used elements after they have been exposed by host. */
  2097			virtio_rmb(vq->weak_barriers);
  2098			vq->batch_head = le16_to_cpu(vq->packed.vring.desc[last_used].id);
  2099			vq->batch_len = le32_to_cpu(vq->packed.vring.desc[last_used].len);
  2100		}
  2101	
  2102		if (vq->batch_head == last_used) {
  2103			vq->batch_head = num;
  2104			*len = vq->batch_len;
  2105		} else
  2106			*len = vq->packed.desc_state[last_used].total_len;
  2107	
  2108		if (unlikely(last_used >= num)) {
> 2109			BAD_RING(vq, "id %u out of range\n", id);
  2110			return NULL;
  2111		}
  2112		if (unlikely(!vq->packed.desc_state[last_used].data)) {
  2113			BAD_RING(vq, "id %u is not a head!\n", id);
  2114			return NULL;
  2115		}
  2116	
  2117		/* detach_buf_packed clears data, so grab it now. */
  2118		ret = vq->packed.desc_state[last_used].data;
  2119		detach_buf_packed_in_order(vq, last_used, ctx);
  2120	
  2121		update_last_used_idx_packed(vq, last_used, last_used,
  2122					    used_wrap_counter);
  2123	
  2124		LAST_ADD_TIME_INVALID(vq);
  2125	
  2126		END_USE(vq);
  2127		return ret;
  2128	}
  2129	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
