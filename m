Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F011A6815;
	Thu,  3 Sep 2026 00:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788394756; cv=none; b=DMbjRvO3u86l/3eQyrbGSvZ6opwgY8KRf0MhdQvOvoSv2mgz3MPLbnAmTlzYZIeLLcqb+W5lNCA1O8sWvF4MRJ7mhiibqITKMtdvuQnxkSkOi4rO8LyB/j0CnvIvsVkk5xuIsGuTQVseF+mAu0x/MKlceNnEOtP4BdhbL9eyFuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788394756; c=relaxed/simple;
	bh=XIF8tZgOezCzNoYbuNvzK0uoDLKEIdY3VuPAz3uvo5U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Z4RDHIW1cjAGKvi3PZvGpOe8RKTfCdJlHUKgEPwosW151KWvp/me1JfLM9gV4zsSZA+jjDSuaIeag83Nvej2jtjx6xNVExozAN7brO88TXl/vU2gDgZxBycBXODu16OSBlSrZpJvYbiipA4OSuKkJ4mp09DWbLkZlviq2vdmXsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mwswpZ8m; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mwswpZ8m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788394754; x=1819930754;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XIF8tZgOezCzNoYbuNvzK0uoDLKEIdY3VuPAz3uvo5U=;
  b=mwswpZ8mVwmtL0S2GY1svQfHRYmZloQsZcyB1IsqLZx44OoEH3Ow81jj
   k0NoqMwii9ov9cB4oJcv5szvyauuL6Z/rNj/mf7SSdj/1Wm8T8phdl3tx
   NBwVe/h5uwkcllMDdqkR6oI0lESlQ0mgfHE39rRNS/1Xxi3K1lV2TwPCS
   OB66/GhSwaeefXieALPMO4/USJ4UeSZQRkmPod64M0ZIObdo3ZcXUOEZD
   KP7cMZWu0GrYyyVfjM+vWbvqUX5krq6AaK/uSJH/HVuMuisBkVt4xquwi
   DNk4txSuLcQMwVaxA43ud/eDWuCIR+npHmv/ZxVIQWMFZSSKa17JkGXuU
   Q==;
X-CSE-ConnectionGUID: IONoq7hYT0SEPB+cIfgyqg==
X-CSE-MsgGUID: 1EkGI9ECQ3it8zDujiVelQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="100026623"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="100026623"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 17:19:11 -0700
X-CSE-ConnectionGUID: FMcZl0oXSXOw1gNjq6ebkA==
X-CSE-MsgGUID: V8ggEPAPQwqOHl3I6o1nWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="269571257"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Sep 2026 17:19:10 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1vAZ-000000003Wc-291Q;
	Thu, 03 Sep 2026 00:19:07 +0000
Date: Thu, 03 Sep 2026 08:18:14 +0800
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 68/131]
 drivers/rpmsg/zx29_smd.c:239:52: warning: cast to smaller integer type
 'unsigned int' from 'u8 *' (aka 'unsigned char *')
Message-ID: <202609030807.XaidEEeM-lkp@intel.com>
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
commit: 98c9c6629dd6a4fee43f04e6bc8cb7879f667d75 [68/131] more mbox stuff stuff
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260903/202609030807.XaidEEeM-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260903/202609030807.XaidEEeM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609030807.XaidEEeM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/rpmsg/zx29_smd.c:178:13: warning: variable 'ptr' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     178 |         } else if (!send_pos) {
         |                    ^~~~~~~~~
   drivers/rpmsg/zx29_smd.c:193:37: note: uninitialized use occurs here
     193 |         zx29_smd->ept.cb(&zx29_smd->rpdev, ptr, len, zx29_smd->ept.priv, RPMSG_ADDR_ANY);
         |                                            ^~~
   drivers/rpmsg/zx29_smd.c:178:9: note: remove the 'if' if its condition is always true
     178 |         } else if (!send_pos) {
         |                ^~~~~~~~~~~~~~
     179 |                 dev_info(&zx29_smd->pdev->dev, "send_pos == 0\n");
     180 |                 ptr = zx29_smd->data_r + zx29_smd->recv->recv_pos;
     181 |                 len = zx29_smd->recv->size - zx29_smd->recv->recv_pos;
     182 |         } else {
         |           ~~~~~~
     183 |                 dev_info(&zx29_smd->pdev->dev, "wraparound\n");
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     184 |                 len = zx29_smd->recv->size - zx29_smd->recv->recv_pos + send_pos;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     185 |                 alloc = kzalloc(len, GFP_KERNEL);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     186 | 
     187 |                 memcpy(alloc, zx29_smd->data_r + zx29_smd->recv->recv_pos,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     188 |                        zx29_smd->recv->size - zx29_smd->recv->recv_pos);
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     189 |                 memcpy(alloc + zx29_smd->recv->size - zx29_smd->recv->recv_pos, zx29_smd->data_r,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     190 |                        send_pos);
         |                        ~~~~~~~~~~
     191 |         }
         |         ~
   drivers/rpmsg/zx29_smd.c:155:9: note: initialize the variable 'ptr' to silence this warning
     155 |         u8 *ptr, *alloc = NULL;
         |                ^
         |                 = NULL
>> drivers/rpmsg/zx29_smd.c:239:52: warning: cast to smaller integer type 'unsigned int' from 'u8 *' (aka 'unsigned char *') [-Wpointer-to-int-cast]
     239 |         dev_info(&pdev->dev, "zx29_smd->data_r 0x%08x\n", (unsigned int)zx29_smd->data_r);
         |                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                          ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/rpmsg/zx29_smd.c:262:52: warning: cast to smaller integer type 'unsigned int' from 'u8 *' (aka 'unsigned char *') [-Wpointer-to-int-cast]
     262 |         dev_info(&pdev->dev, "zx29_smd->data_s 0x%08x\n", (unsigned int)zx29_smd->data_s);
         |                                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                          ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   drivers/rpmsg/zx29_smd.c:146:13: warning: unused function 'zx29_smd_release_device' [-Wunused-function]
     146 | static void zx29_smd_release_device(struct device *dev)
         |             ^~~~~~~~~~~~~~~~~~~~~~~
   4 warnings generated.


vim +239 drivers/rpmsg/zx29_smd.c

   203	
   204	static int zx29_smd_probe(struct platform_device *pdev)
   205	{
   206		struct device *dev = &pdev->dev;
   207		struct zx29_smd *zx29_smd;
   208		struct device_node *sram;
   209		struct resource res;
   210		u32 channel;
   211		int ret;
   212	
   213		ret = of_property_read_u32(pdev->dev.of_node, "zte,rpmsg-channel", &channel);
   214		if (ret) {
   215			dev_err(&pdev->dev, "Invalid rpmsg channel entry\n");
   216			return ret;
   217		}
   218	
   219		zx29_smd = devm_kzalloc(dev, sizeof(*zx29_smd), GFP_KERNEL);
   220		if (!zx29_smd)
   221			return -ENOMEM;
   222		zx29_smd->pdev = pdev;
   223		dev_info(&pdev->dev, "Hello rpmsg\n");
   224	
   225		sram = of_parse_phandle(pdev->dev.of_node, "sram", 0);
   226		if (!sram) {
   227			dev_info(dev, "no sram\n");
   228			return -EINVAL;
   229		}
   230		of_address_to_resource(sram, 0, &res);
   231		zx29_smd->recv = devm_memremap(dev, res.start + channel * sizeof(struct zx29_channel_hdr),
   232					       sizeof(struct zx29_channel_hdr), MEMREMAP_WB);
   233	
   234		if (!(zx29_smd->recv->flags & 1)) {
   235			dev_info(&pdev->dev, "Receive channel not created by remote end\n");
   236			return -ENODEV;
   237		}
   238		zx29_smd->data_r = devm_memremap(dev, zx29_smd->recv->base, zx29_smd->recv->size, MEMREMAP_WB);
 > 239		dev_info(&pdev->dev, "zx29_smd->data_r 0x%08x\n", (unsigned int)zx29_smd->data_r);
   240	
   241		zx29_smd->rpdev.ops = &zx29_smd_device_ops;
   242		zx29_smd->rpdev.src = channel;
   243		zx29_smd->rpdev.dst = channel;
   244		zx29_smd->rpdev.announce = true;
   245		strscpy(zx29_smd->rpdev.id.name, "rpmsg-tty", RPMSG_NAME_SIZE);
   246		zx29_smd->rpdev.dev.parent = &pdev->dev;
   247	
   248		sram = of_parse_phandle(pdev->dev.of_node, "sram", 1);
   249		if (!sram)
   250			return -EINVAL;
   251		of_address_to_resource(sram, 0, &res);
   252		zx29_smd->send = devm_memremap(dev, res.start + channel * sizeof(struct zx29_channel_hdr),
   253					       sizeof(struct zx29_channel_hdr), MEMREMAP_WB);
   254	
   255		/* FIXME: Create channel infrastructure. */
   256		zx29_smd->send->base = 0x82000000;
   257		zx29_smd->send->recv_pos = zx29_smd->send->send_pos = 0;
   258		zx29_smd->send->size = 0x20;
   259		zx29_smd->send->flags = 1;
   260		zx29_smd->send->end = 0;
   261		zx29_smd->data_s = devm_memremap(dev, zx29_smd->send->base, zx29_smd->send->size, MEMREMAP_WB);
   262		dev_info(&pdev->dev, "zx29_smd->data_s 0x%08x\n", (unsigned int)zx29_smd->data_s);
   263	
   264		zx29_smd->mbox_client.dev = &pdev->dev;
   265		zx29_smd->mbox_client.rx_callback = zx29_smd_rx_callback;
   266		zx29_smd->mbox_client.tx_block = true;
   267		zx29_smd->mbox_client.tx_tout = 500;
   268		zx29_smd->mbox_client.tx_done = txdone;
   269		zx29_smd->mbox_client.knows_txdone = false;
   270	
   271		return rpmsg_register_device(&zx29_smd->rpdev);
   272	}
   273	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
