Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E09B2B2F2;
	Sun, 17 Nov 2024 07:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731827590; cv=none; b=V4y+Qf+W+JiygXz0f1oniHa+BMcuYwUa4Xy1WofPAjB/JldKWUGliK8fEwQiMxHYKA3b1DxpfUdhe6d7xgdHV7BRSv/GcBk1i+obS37WmwP8rSWKwJetjrUHf7U4r63PxDT0iHhLZRtOLDHGFaMutUY19wvRwcKHjXK6S1/MlDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731827590; c=relaxed/simple;
	bh=Q0DSojzS6SMBV75ThQ8WkD1uiP1t2+Zuv6GVveanh28=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ixBqrRM0AqzUxw+YGMj2LdBLeVTI0GvSiK1jJRElIa1pRtK5Rgdr3dFzb8UM+viDLWj31aqovFNFGOoyeX/pqzwiy4x2z0ylzTnR0Lc232viMbdT/RzkD8dObEa/VaxZ3e8WYlijoc1xYN9o7Jn0/8zWN1elAqjMmFM+A2ms3KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gzNYOCgk; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gzNYOCgk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731827589; x=1763363589;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q0DSojzS6SMBV75ThQ8WkD1uiP1t2+Zuv6GVveanh28=;
  b=gzNYOCgkUSinjm1Xn0f/2wm2JqPkUFaTcNhLv2RsywXvfA5xi/X9r5uh
   A63rKcEobrXqxo2yEMz9bFQgveXdFFfrcOD1p9UTBORHVyY/Do2yorjdz
   SNZHnOci0aXqHijG6SPQRTFzG4Ay9cRjiwPPsLPl9zjgTNyDlvBngbl11
   5xDll95TWhcNEv6/Q2JH2/U32KdA2GRjIwW7INdQ6Lz8p4jyVtJdwGOwZ
   zUUalgYt8JYUB/pQmIPt+jDvSwsg/2F5XNMAjN8roMB0nKfwPq04YdHRs
   SBzsRVag5ME89FWUT3Vk8JGB6/Ur6b29VjdlxEb9QYFxn/60VF6WW0p8K
   A==;
X-CSE-ConnectionGUID: oRInq8RZSN2TXF/uZFjn7Q==
X-CSE-MsgGUID: ZzJAccGhS4eCYDuhDtx6xA==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="31638514"
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="31638514"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 23:13:08 -0800
X-CSE-ConnectionGUID: ydQ5d1h8SKajqIKI81aJQg==
X-CSE-MsgGUID: yHi+J0IIRNeC1MJS8iys1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="89094165"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 16 Nov 2024 23:13:07 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCZSx-0001cV-3C;
	Sun, 17 Nov 2024 07:13:03 +0000
Date: Sun, 17 Nov 2024 15:12:50 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?unknown-8bit?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/180-sio 2/4] drivers/dma/apple-sio.c:512:5:
 warning: variable 'param' set but not used
Message-ID: <202411171547.QP5TMxtb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/180-sio
head:   bdf5443483813f581ab80ea5e4a6b675ec2c211f
commit: b84a7086d959ffdb1184c2022e5e0f0941467055 [2/4] dmaengine: apple-sio: Add Apple SIO driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241117/202411171547.QP5TMxtb-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411171547.QP5TMxtb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411171547.QP5TMxtb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/dma/apple-sio.c:12:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2232:
   include/linux/vmstat.h:503:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     503 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     504 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:510:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     510 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     511 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:523:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     523 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     524 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/dma/apple-sio.c:512:5: warning: variable 'param' set but not used [-Wunused-but-set-variable]
     512 |         u8 param, type, tag, sioep;
         |            ^
   5 warnings generated.


vim +/param +512 drivers/dma/apple-sio.c

   506	
   507	static void sio_recv_msg(void *cookie, u8 ep, u64 msg)
   508	{
   509		struct sio_data *sio = cookie;
   510		struct sio_tagdata *tags = &sio->tags;
   511		u32 data;
 > 512		u8 param, type, tag, sioep;
   513	
   514		if (ep != EP_SIO)
   515			goto unknown;
   516	
   517		data  = FIELD_GET(SIOMSG_DATA, msg);
   518		param = FIELD_GET(SIOMSG_PARAM, msg);
   519		type  = FIELD_GET(SIOMSG_TYPE, msg);
   520		tag   = FIELD_GET(SIOMSG_TAG, msg);
   521		sioep = FIELD_GET(SIOMSG_EP, msg);
   522	
   523		switch (type) {
   524		case MSG_STARTED:
   525			dev_info(sio->dev, "SIO protocol v%u\n", data);
   526			type = MSG_ACK; /* Pretend this is an ACK */
   527			fallthrough;
   528		case MSG_ACK:
   529		case MSG_NACK:
   530			if (WARN_ON(tag >= SIO_NTAGS))
   531				break;
   532	
   533			if (tags->atomic[tag]) {
   534				sio_ack_callback callback = tags->ack_callback[tag];
   535	
   536				if (callback && !WARN_ON(sioep >= sio->nchannels))
   537					callback(&sio->channels[sioep],
   538						 tags->cookie[tag], type == MSG_ACK);
   539				if (type == MSG_NACK)
   540					dev_err(sio->dev, "got a NACK on channel %d\n", sioep);
   541				sio_free_tag(sio, tag);
   542			} else {
   543				tags->acked[tag] = (type == MSG_ACK);
   544				complete(&tags->completions[tag]);
   545			}
   546			break;
   547	
   548		case MSG_REPORT:
   549			if (WARN_ON(sioep >= sio->nchannels))
   550				break;
   551	
   552			sio_process_report(&sio->channels[sioep]);
   553			break;
   554	
   555		default:
   556			goto unknown;
   557		}
   558		return;
   559	
   560	unknown:
   561		dev_warn(sio->dev, "received unknown message: ep %x data %016llx\n",
   562			 ep, msg);
   563	}
   564	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
