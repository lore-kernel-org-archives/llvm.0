Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499BB8486;
	Wed, 30 Aug 2023 21:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693431903; x=1724967903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EBG0J1H0QkNOAsJMPYSmDOc0q2/l1Bku4zKgiYN5X/k=;
  b=Jd4FKfeVASWZ0SSx2lDWJgTxtqNDGrpE7IbBHb8iy5iA4G3S5/VKtu7I
   9rK8M0g9ME5P9wA8VKIKEQow0Hh10yOTRbbkCm+ibZVR2x9yDmHh9EN/r
   68YOpVbEvygZMwNLljp5/RDdEON0yToBqNk736umKbDHEe5GXzndGqwlS
   lyWuwSLmgTF1Y02E2TgUTon+Q4wbFwc7wj4nLWuSkaG2HyTxRdFiHShKn
   k1CYiLdl365VvHhB8iYB+AGNo2vg9fBFEFHsajFHJv7pHRrjP5CkbsLQ/
   WijDYK6t+iHvUE7DcTvAPOkz/najU6JnHo3LGFlR+2q+EmgX//xlQGbun
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="373157306"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="373157306"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 14:45:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="985928344"
X-IronPort-AV: E=Sophos;i="6.02,214,1688454000"; 
   d="scan'208";a="985928344"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 30 Aug 2023 14:45:00 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbSzk-000AFr-0q;
	Wed, 30 Aug 2023 21:45:00 +0000
Date: Thu, 31 Aug 2023 05:44:05 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/090-spi-hid 15/21]
 drivers/hid/dockchannel-hid/dockchannel-hid.c:989:18: warning: format
 specifies type 'long' but the argument has type 'unsigned int'
Message-ID: <202308310552.8Ey6MzZK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   58700c861f0a37630478bf31ded5eaf81e50b1a2
commit: d23de663008a9220cb8c6a4bf49874b8e7fe33a5 [15/21] hid: Add Apple DockChannel HID transport driver
config: arm-randconfig-r001-20230831 (https://download.01.org/0day-ci/archive/20230831/202308310552.8Ey6MzZK-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308310552.8Ey6MzZK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308310552.8Ey6MzZK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hid/dockchannel-hid/dockchannel-hid.c:989:18: warning: format specifies type 'long' but the argument has type 'unsigned int' [-Wformat]
     989 |                 dev_err(iface->dchid->dev, "Bad sub header length (%d > %ld)\n",
         |                                                                         ~~~
         |                                                                         %u
     990 |                         shdr->length, hdr->length - sizeof(*shdr));
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
     144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   1 warning generated.


vim +989 drivers/hid/dockchannel-hid/dockchannel-hid.c

   981	
   982	static void dchid_handle_ack(struct dchid_iface *iface, struct dchid_hdr *hdr, void *data)
   983	{
   984		struct dchid_subhdr *shdr = (void *)data;
   985		u8 *payload = data + sizeof(*shdr);
   986	
   987		if (shdr->length + sizeof(*shdr) > hdr->length) {
   988			dev_err(iface->dchid->dev, "Bad sub header length (%d > %ld)\n",
 > 989				shdr->length, hdr->length - sizeof(*shdr));
   990			return;
   991		}
   992		if (shdr->flags != iface->out_flags) {
   993			dev_err(iface->dchid->dev,
   994				"Received unexpected flags 0x%x on ACK channel (expFected 0x%x)\n",
   995				shdr->flags, iface->out_flags);
   996			return;
   997		}
   998	
   999		if (shdr->length < 1) {
  1000			dev_err(iface->dchid->dev, "Received length 0 output report ack\n");
  1001			return;
  1002		}
  1003		if (iface->tx_seq != hdr->seq) {
  1004			dev_err(iface->dchid->dev, "Received ACK with bad seq (expected %d, got %d)\n",
  1005				iface->tx_seq, hdr->seq);
  1006			return;
  1007		}
  1008		if (iface->out_report != payload[0]) {
  1009			dev_err(iface->dchid->dev, "Received ACK with bad report (expected %d, got %d\n",
  1010				iface->out_report, payload[0]);
  1011			return;
  1012		}
  1013	
  1014		if (iface->resp_buf && iface->resp_size)
  1015			memcpy(iface->resp_buf, payload + 1, min((size_t)shdr->length - 1, iface->resp_size));
  1016	
  1017		iface->resp_size = shdr->length;
  1018		iface->out_report = -1;
  1019		iface->retcode = shdr->retcode;
  1020		complete(&iface->out_complete);
  1021	}
  1022	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
