Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AA3369D54;
	Thu,  3 Sep 2026 05:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788414605; cv=none; b=KHWmzoBmfTltj7gzHQyhpgFTVxfyKSWeyOrh0ENC6IqbL6YigTn9kZBjAP5O+CodYw048qHk9tRstQ4roxN4nni0e1b5qP0EWujQSEwxNMo6KNeNAEs05nc5UK37T2BtcET8jXCZXvMjdZmN0jjXBhWegirLA8XVSxdraPe6hFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788414605; c=relaxed/simple;
	bh=y1kTHJZ8J1KFTTQsckHU72p83YxqqCJ6n7oA3rb7nn4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OAAAhxf9TRWdvXsZW2usxIXDZl6KBJhbaSoR1pEMpyPLLLZ+J04FgahcKtSOiyNPzNNLAo+KP7F2KOaRK/LR1kcNUEZrKs0+5g2m8Vj8AoKJuKM5Q+a4Q9giH95/+Npo1ek6NJ3fKoAy3sCgHL8GoolD0brab+EGTAZByyG7HBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VihIA8LT; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VihIA8LT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788414603; x=1819950603;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y1kTHJZ8J1KFTTQsckHU72p83YxqqCJ6n7oA3rb7nn4=;
  b=VihIA8LTdD8gIAxfGuTJtfAftOUbvKfhPuOj4c/gbQJ+Qm+Sdo6aKURm
   nab/r68S70CqTGzc+h4BAPc4om1G6xT07D0MHudNSk2BJbXZVjSbPlhlV
   0lZu+qJ4hjWAWv5Uj0/ClU80peZD+yKsxhMo660/TQPenlttlm0TSY1hW
   Drp95a3ehaVQQBZ2qCocW4cafEZvw7Fg7A3Uk/f6v2TTJNQDSeQNXTg92
   zokt71K13tpE4eQeOuKVyAdKMVYQtgNOgMMX1DWpxc0beO/25OqI1s8m4
   nY4lxUblFv3KI4DsbanmND0D3eJ5m54tQSYABYSpVTtr7Q/Ch/inj6arp
   Q==;
X-CSE-ConnectionGUID: lGbn+mwPQaeTKm44jQcFuw==
X-CSE-MsgGUID: 0ED06LryRSKbQDHOpsvt3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="92753372"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="92753372"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 22:50:03 -0700
X-CSE-ConnectionGUID: AdhEw3oWSK+MPdnEttkyig==
X-CSE-MsgGUID: Dv2KNi6cTRuzDgehHi1ETw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="267021033"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Sep 2026 22:50:00 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x20Kk-000000004BM-00uq;
	Thu, 03 Sep 2026 05:49:58 +0000
Date: Thu, 03 Sep 2026 13:49:18 +0800
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 120/131]
 drivers/rpmsg/zx29_smd.c:205:66: warning: cast to smaller integer type
 'unsigned int' from 'struct zx29_smd *'
Message-ID: <202609031311.esEudpZG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   4132307830800b020a6d29d27cb3fec3cb5fbb90
commit: ffc256cf7e9bea66ecdb62566ec625760720329b [120/131] rpmsg polling
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260903/202609031311.esEudpZG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260903/202609031311.esEudpZG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609031311.esEudpZG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/rpmsg/zx29_smd.c:205:66: warning: cast to smaller integer type 'unsigned int' from 'struct zx29_smd *' [-Wpointer-to-int-cast]
     205 |         dev_info(&zx29_smd->pdev->dev, "zx29_smd_rx_work smd 0x%08x\n", (unsigned int)zx29_smd);
         |                                                                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                          ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/rpmsg/zx29_smd.c:337:92: warning: cast to smaller integer type 'unsigned int' from 'u8 *' (aka 'unsigned char *') [-Wpointer-to-int-cast]
     337 |                 dev_info(&pdev->dev, "zx29_smd->data_r phys 0x%08x virt 0x%08x\n", zx29_smd->recv->base, (unsigned int)zx29_smd->data_r);
         |                                                                                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                          ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/rpmsg/zx29_smd.c:367:52: warning: cast to smaller integer type 'unsigned int' from 'u8 *' (aka 'unsigned char *') [-Wpointer-to-int-cast]
     367 |         dev_info(&pdev->dev, "zx29_smd->data_s 0x%08x\n", (unsigned int)zx29_smd->data_s);
         |                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                          ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/rpmsg/zx29_smd.c:193:13: warning: unused function 'zx29_smd_release_device' [-Wunused-function]
     193 | static void zx29_smd_release_device(struct device *dev)
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   4 warnings generated.


vim +205 drivers/rpmsg/zx29_smd.c

   197	
   198	static void zx29_smd_rx_work(struct work_struct *work)
   199	{
   200		struct zx29_smd *zx29_smd = to_zx29_rpmsg_device_work(work);
   201		u32 send_pos, len, pkg_len, processed = 0;
   202		const struct msg_hdr *hdr;
   203		u8 *ptr, *alloc = NULL;
   204	
 > 205		dev_info(&zx29_smd->pdev->dev, "zx29_smd_rx_work smd 0x%08x\n", (unsigned int)zx29_smd);
   206		dev_info(&zx29_smd->pdev->dev, "zx29_smd_rx_work channel 0x%08x\n", zx29_smd->ept.addr);
   207	
   208		if (!zx29_smd->data_r) {
   209			dev_info(&zx29_smd->pdev->dev, "receive base not mapped\n");
   210			// FIXME: I guess I can't do that in an IRQ context
   211			return;
   212			/*
   213			dev_info(&zx29_smd->pdev->dev, "trying to ioremap 0x%08x\n", zx29_smd->recv->base);
   214			zx29_smd->data_r = devm_memremap(&zx29_smd->pdev->dev,
   215						         zx29_smd->recv->base, zx29_smd->recv->size,
   216							 MEMREMAP_WT);
   217			dev_info(&zx29_smd->pdev->dev, "zx29_smd->data_r phys 0x%08x virt 0x%08x\n",
   218				 zx29_smd->recv->base, (unsigned int)zx29_smd->data_r);
   219			*/
   220		}
   221	
   222		for (;;) {
   223			send_pos = zx29_smd->recv->send_pos;
   224	
   225			if (send_pos == zx29_smd->recv->recv_pos) {
   226				break;
   227			}
   228	
   229			dev_info(&zx29_smd->pdev->dev, "old recv %u new incoming %u. Ringbuffer size %u\n",
   230					zx29_smd->recv->recv_pos, send_pos, zx29_smd->recv->size);
   231	
   232			if (send_pos > zx29_smd->recv->recv_pos) {
   233				ptr = zx29_smd->data_r + zx29_smd->recv->recv_pos;
   234				len = send_pos - zx29_smd->recv->recv_pos;
   235				if (send_pos == zx29_smd->recv->size) {
   236					dev_info(&zx29_smd->pdev->dev, "send_pos == size\n");
   237				} else {
   238					dev_info(&zx29_smd->pdev->dev, "easy default path\n");
   239				}
   240			} else if (!send_pos) {
   241				dev_info(&zx29_smd->pdev->dev, "send_pos == 0\n");
   242				ptr = zx29_smd->data_r + zx29_smd->recv->recv_pos;
   243				len = zx29_smd->recv->size - zx29_smd->recv->recv_pos;
   244			} else {
   245				dev_info(&zx29_smd->pdev->dev, "wraparound\n");
   246				len = zx29_smd->recv->size - zx29_smd->recv->recv_pos + send_pos;
   247				alloc = kzalloc(len, GFP_KERNEL);
   248	
   249				memcpy(alloc, zx29_smd->data_r + zx29_smd->recv->recv_pos,
   250				zx29_smd->recv->size - zx29_smd->recv->recv_pos);
   251				memcpy(alloc + zx29_smd->recv->size - zx29_smd->recv->recv_pos, zx29_smd->data_r,
   252				send_pos);
   253			}
   254	
   255			hdr = (const struct msg_hdr *)ptr;
   256			pkg_len = ZX29_MSG_ALIGN(hdr->len) + sizeof(*hdr);
   257			if (hdr->magic != ZX29_MSG_MAGIC) {
   258				dev_info(&zx29_smd->pdev->dev, "Invalid magic 0x%04x\n", hdr->magic);
   259			} else if (pkg_len > len) {
   260				dev_info(&zx29_smd->pdev->dev, "Header length 0x%04x, in buffer 0x%04x\n",
   261					hdr->len, len);
   262			} else {
   263				if (!hdr->len) {
   264					dev_info(&zx29_smd->pdev->dev, "Zero-length packet\n");
   265				}
   266				zx29_smd->ept.cb(&zx29_smd->rpdev, ptr + sizeof(*hdr), hdr->len, zx29_smd->ept.priv, RPMSG_ADDR_ANY);
   267			}
   268	
   269			kfree(alloc);
   270			zx29_smd->recv->recv_pos = (zx29_smd->recv->recv_pos + pkg_len) % zx29_smd->recv->size;
   271			processed++;
   272		}
   273	
   274		if (!processed) {
   275			dev_info(&zx29_smd->pdev->dev, "No messages processed?\n");
   276		}
   277	}
   278	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
