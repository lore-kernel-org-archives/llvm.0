Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BBF2DB79F;
	Sat,  9 May 2026 20:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778359050; cv=none; b=BUQy+0TP4Jv9pnCkwh0rCNBK6vf8owK2tkkLofNgkrFPV95iOV5xWbTaRrZ8ALq/TInEZqlvh2ePgbBhVoi8SyRt2B6f9nEU4z707dILD/engrumyJ6PFFLlxF90Uu46omFB4kjx4m+OQRZ51x9ZYRsE1cw/EkMbTnUVbNem8gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778359050; c=relaxed/simple;
	bh=8/haYIuAQgcqbLsOjqloZuxzUC4x11AW1w9LtdUoKJU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iN0e3BWmakJGmjRaNAA2F3L6LJpV8O7wv7g6HnTu1nYpk9RcjXUF3SD48fyHHPP1H0s6ABLYUIhDFQWLQFOOzrWtJNynJohatG33/GuU5sndVnrQa0AdOCjJRgsOBCPNU4rtHQ7gWnnztIunwmPgDa7cjqlw+W7V2xqkiAgN18s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GBUqgj2U; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GBUqgj2U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778359049; x=1809895049;
  h=date:from:to:cc:subject:message-id;
  bh=8/haYIuAQgcqbLsOjqloZuxzUC4x11AW1w9LtdUoKJU=;
  b=GBUqgj2UhA6O6+99uDEiICtSjndjHqXGo/xZQGNnoNTpXAP/3Oz7U17u
   Srp+j15sg0x6PR1mGuieEYYx5nO36zyzTnfdnLPCOuMQcs3wcOvTgUlKo
   r0nr0aghINwINGTyBn3woAS9X2IGk/mNyAfSvoEM+sT6M2DW1B8R/EnXY
   X6qoLr+KH6n3tDN6A6TRSv6veYFLqrwU3TGznkjkMzzcxRgVcm4Y+j6lM
   45KT0kTo2HX8yhi4wkR6922VLdaW0kJsPuGQ6PRMkg2YWmQ1Q3Tr9cP4p
   XbLyJO28hWplkaefy8ibvlZ7yUGOC1Ami8FL8GtfdtloNeJeoOR6Pl7f0
   A==;
X-CSE-ConnectionGUID: mxOqbCipRhGP3lgWbx6qUA==
X-CSE-MsgGUID: jepv4V5fQw2p/FrPSg/Jdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="90682947"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="90682947"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 13:37:28 -0700
X-CSE-ConnectionGUID: 4Wj1+eCRRzCFpPgGY3ahwg==
X-CSE-MsgGUID: E6JwBCKZQnC7gQhvwAJxhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="275202606"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 May 2026 13:37:27 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLoQO-000000001Op-0AOO;
	Sat, 09 May 2026 20:37:24 +0000
Date: Sun, 10 May 2026 04:36:43 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/090-spi-hid 18/19]
 drivers/hid/dockchannel-hid/dockchannel-hid.c:987:18: warning: format
 specifies type 'long' but the argument has type '__size_t' (aka 'unsigned
 int')
Message-ID: <202605100420.YhXKJxAo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   7b3c6e8461f3035d025ece758919facbc1c6d854
commit: e9ca8c87d173cbf7eb2089d7ddec9149e1d608a1 [18/19] HID: Add Apple DockChannel HID transport driver
config: arm-randconfig-004-20260510 (https://download.01.org/0day-ci/archive/20260510/202605100420.YhXKJxAo-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605100420.YhXKJxAo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605100420.YhXKJxAo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hid/dockchannel-hid/dockchannel-hid.c:987:18: warning: format specifies type 'long' but the argument has type '__size_t' (aka 'unsigned int') [-Wformat]
     986 |                 dev_err(iface->dchid->dev, "Bad sub header length (%d > %ld)\n",
         |                                                                         ~~~
         |                                                                         %zu
     987 |                         shdr->length, hdr->length - sizeof(*shdr));
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   1 warning generated.


vim +987 drivers/hid/dockchannel-hid/dockchannel-hid.c

   979	
   980	static void dchid_handle_ack(struct dchid_iface *iface, struct dchid_hdr *hdr, void *data)
   981	{
   982		struct dchid_subhdr *shdr = (void *)data;
   983		u8 *payload = data + sizeof(*shdr);
   984	
   985		if (shdr->length + sizeof(*shdr) > hdr->length) {
   986			dev_err(iface->dchid->dev, "Bad sub header length (%d > %ld)\n",
 > 987				shdr->length, hdr->length - sizeof(*shdr));
   988			return;
   989		}
   990		if (shdr->flags != iface->out_flags) {
   991			dev_err(iface->dchid->dev,
   992				"Received unexpected flags 0x%x on ACK channel (expFected 0x%x)\n",
   993				shdr->flags, iface->out_flags);
   994			return;
   995		}
   996	
   997		if (shdr->length < 1) {
   998			dev_err(iface->dchid->dev, "Received length 0 output report ack\n");
   999			return;
  1000		}
  1001		if (iface->tx_seq != hdr->seq) {
  1002			dev_err(iface->dchid->dev, "Received ACK with bad seq (expected %d, got %d)\n",
  1003				iface->tx_seq, hdr->seq);
  1004			return;
  1005		}
  1006		if (iface->out_report != payload[0]) {
  1007			dev_err(iface->dchid->dev, "Received ACK with bad report (expected %d, got %d\n",
  1008				iface->out_report, payload[0]);
  1009			return;
  1010		}
  1011	
  1012		if (iface->resp_buf && iface->resp_size)
  1013			memcpy(iface->resp_buf, payload + 1, min((size_t)shdr->length - 1, iface->resp_size));
  1014	
  1015		iface->resp_size = shdr->length;
  1016		iface->out_report = -1;
  1017		iface->retcode = shdr->retcode;
  1018		complete(&iface->out_complete);
  1019	}
  1020	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
