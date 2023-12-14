Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA726A021;
	Thu, 14 Dec 2023 20:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A0xFnAQW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702585095; x=1734121095;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uCpo6PzRSxPyqzDi0lkW0AuppjkJDNwKQvYWYuElAPw=;
  b=A0xFnAQWQkaKTrKM3sOstzFMgp7lIwkdlWsxV3xCEnCY6e2gJLDKOx29
   jPtxBUvWrj+8vUMB0jV1IqgeWhkg7k5/4MC6JrTODmUsb1o2x7LusPVd4
   liQ8SGBclRFCLYceymCusB4ZA7Y6zVkMi6H13F3Ve2u0IOJmuKxfB9/RN
   CzUwWauhZbe2nmgf/dLBC1C2gezbP1XwOw+0PAxb2SNV6roxw8RWyDCLB
   iS+iy21aBkMGmcSTi1fWZ5iXZ7yy9S1wguRzvT8p0F2DFHAjLryiNZnRS
   yLSR3kJvJEShKBRy3Ij3FPQixf/XCNPfmZdypZkB0TcsrbGo7D5CxBJR1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="394051694"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="394051694"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 12:18:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="724191744"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="724191744"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 14 Dec 2023 12:18:12 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDs9q-000MZn-0I;
	Thu, 14 Dec 2023 20:18:10 +0000
Date: Fri, 15 Dec 2023 04:18:09 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	mhi@lists.linux.dev
Subject: [mani-mhi:mhi-next 13/15] drivers/bus/mhi/ep/main.c:520:17: warning:
 format specifies type 'long' but the argument has type 'size_t' (aka
 'unsigned int')
Message-ID: <202312150418.TOQGiuVw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
head:   f5668f251e29292326e45a022f933c15740a8af2
commit: e59bba2cc6c746942c7c2d83ebcd9b92ae0a1aca [13/15] bus: mhi: ep: Add support for async DMA write operation
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20231215/202312150418.TOQGiuVw-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231215/202312150418.TOQGiuVw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312150418.TOQGiuVw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bus/mhi/ep/main.c:520:17: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
   ring->er_index, ring->rd_offset);
                   ^~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
                                        ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:274:19: note: expanded from macro 'dynamic_dev_dbg'
                              dev, fmt, ##__VA_ARGS__)
                                   ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
                                                                    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
           __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
                                                                          ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
                   func(&id, ##__VA_ARGS__);                       \
                               ^~~~~~~~~~~
   drivers/bus/mhi/ep/main.c:601:1: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
   mhi_chan->rd_offset);
   ^~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
                                        ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:274:19: note: expanded from macro 'dynamic_dev_dbg'
                              dev, fmt, ##__VA_ARGS__)
                                   ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
                                                                    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
           __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
                                                                          ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
                   func(&id, ##__VA_ARGS__);                       \
                               ^~~~~~~~~~~
   2 warnings generated.


vim +520 drivers/bus/mhi/ep/main.c

   499	
   500	static void mhi_ep_skb_completion(struct mhi_ep_buf_info *buf_info)
   501	{
   502		struct mhi_ep_device *mhi_dev = buf_info->mhi_dev;
   503		struct mhi_ep_cntrl *mhi_cntrl = mhi_dev->mhi_cntrl;
   504		struct mhi_ep_chan *mhi_chan = mhi_dev->dl_chan;
   505		struct mhi_ep_ring *ring = &mhi_cntrl->mhi_chan[mhi_chan->chan].ring;
   506		struct mhi_ring_element *el = &ring->ring_cache[ring->rd_offset];
   507		struct device *dev = &mhi_dev->dev;
   508		struct mhi_result result = {};
   509		int ret;
   510	
   511		if (mhi_chan->xfer_cb) {
   512			result.buf_addr = buf_info->cb_buf;
   513			result.dir = mhi_chan->dir;
   514			result.bytes_xferd = buf_info->size;
   515	
   516			mhi_chan->xfer_cb(mhi_dev, &result);
   517		}
   518	
   519		dev_dbg(dev, "Sending completion for ring (%d) rd_offset: %ld\n",
 > 520	ring->er_index, ring->rd_offset);
   521		ret = mhi_ep_send_completion_event(mhi_cntrl, ring, el, buf_info->size,
   522						   buf_info->code);
   523		if (ret) {
   524			dev_err(dev, "Error sending transfer completion event\n");
   525			return;
   526		}
   527	
   528		mhi_ep_ring_inc_index(ring);
   529	}
   530	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
