Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33E33B4EAB;
	Thu,  8 Oct 2026 17:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791481516; cv=none; b=n4S0uS61Jbr6tmeOb9RwTo2ve66j/ImsUxGi+VCvNzMCUz8fV6NIEZC2g6sq6XR54eo+EOIy0yWVt2wVHQkxyqw4GKVB4WdTiPLIUZoIKi5aFtrryhOd9SYcBwAL/MWM8TLGRbv1eFALfrePK3E7icFbIAs4Z0jxensHrpBIknc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791481516; c=relaxed/simple;
	bh=51aa0ttBuBa51YhcQTg/bGmdJ3OKYBtXypCqo+SQeRM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rTfA/aZviyeHlbfec36xRe9X13TVBTfhF9KN/LJ3E/aBS/LtQW4fh1X+kqi29WdT9CT/OrP+qSDivyvH2ka0vMf7pi/npoE6aH5HiJKye0YkZTZfcBNrCV15rYU45LzTRGa7q+oV0BrMo7YZvhmBKQwNTe2DKjnYXQZ7VeuMEUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=evk1gj8h; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="evk1gj8h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791481514; x=1823017514;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=51aa0ttBuBa51YhcQTg/bGmdJ3OKYBtXypCqo+SQeRM=;
  b=evk1gj8hmlrUWsOP8IQshj1idNRDJRtJSbeZTz0wnp0UBnj/9AGb9arm
   8WBfn099h2FR28UP/sCNKqHk15kem4TuQwc3nbz+PdfX63U9AEqdojTBD
   1ZGLjSIUiqenUw0UGAzHuD25LkRQnL+OYzID6ydUNYVaRWa0ONNZIheFt
   mpoECi4ZHCv/MGLrYOxNPcvjyFazz2rKYl0FQlNnYTlrVteTSQORdYswL
   6bOhN7INPN0q3oAbmwoPZZxqIc8AC5SZ6zGirMAi/Mx/JBWk4BbUCFIK+
   KgsCBNDRW7nRJK6MGBZE09tEZbLIoKLLKqO7gXVbiVwVmo1gfX/Ov+AAI
   g==;
X-CSE-ConnectionGUID: 4K2ODENQSTmXNU4y2QoOKQ==
X-CSE-MsgGUID: KYKAbXTLRjSb4PMnsVNS8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="174130"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="174130"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 10:45:13 -0700
X-CSE-ConnectionGUID: 66un1TyzShuWsRgqWGbmdQ==
X-CSE-MsgGUID: /NeWR6PIQTamqGlGgVmWlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="47106"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Oct 2026 10:45:12 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEsB3-000000004ku-152B;
	Thu, 08 Oct 2026 17:45:09 +0000
Date: Fri, 09 Oct 2026 01:44:34 +0800
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 69/142]
 drivers/rpmsg/zx29_smd.c:239:52: warning: cast to smaller integer type
 'unsigned int' from 'u8 *' (aka 'unsigned char *')
Message-ID: <202610090126.utqNiMAt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   7998b6e929bb20ed66acafa33720d8e3533e1598
commit: fcc80da512bd8aa06a383a655eaf0bed6df90b43 [69/142] more mbox stuff stuff
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20261009/202610090126.utqNiMAt-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261009/202610090126.utqNiMAt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610090126.utqNiMAt-lkp@intel.com/

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
