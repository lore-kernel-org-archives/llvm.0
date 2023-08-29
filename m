Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D290B13ADA;
	Tue, 29 Aug 2023 08:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693299346; x=1724835346;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zU8HnXI0OoZea1cBwO3xuOCr3H8ytiNTf5s4hGlu9Po=;
  b=ljR6EeCgenz6szgmPwTDXzOPJPL4ym2KgAwEW/n1m+cSwoQqOpfm5QFh
   i/gp/tUtnjLztkSZSToMxHta/5TOUnU1778FeR+y9WqRqfY4JT/jq0iIo
   ZcDJG+As6A6ohX8pT1vh02QAkRE3wdfcIOjos8SXIO0AyLEEf/Qa7uQE7
   z70vIMVRg5D6evKpG41egzqj/g6PdepywhgBJWhLwK6TJftGvNtNd4zLC
   rTFpLIbnz6kNA1uEksaJ3lU5mD8mMqqhRjsedTnglTtkDWZ3/iXiM++CD
   Zll9FDxgKuDeiv8FToxDes876Q907UrWHVHW+w4eDQyUf3JAdwI2zg9W5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="379088347"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; 
   d="scan'208";a="379088347"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2023 01:55:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="882234947"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 29 Aug 2023 01:55:32 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qauVS-0008ap-2h;
	Tue, 29 Aug 2023 08:55:26 +0000
Date: Tue, 29 Aug 2023 16:55:23 +0800
From: kernel test robot <lkp@intel.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Navneet Singh <navneet.singh@intel.com>
Subject: [weiny2:dcd-v2-2023-08-28 24/36] drivers/cxl/core/hdm.c:431:31:
 warning: format specifies type 'unsigned long long' but the argument has
 type 'resource_size_t' (aka 'unsigned int')
Message-ID: <202308291652.Z9t9Czds-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git dcd-v2-2023-08-28
head:   4e8d6c7176cb59f986a4365a6c6bd7d3610c229e
commit: 7331cb03643ce725e68eaaec47bcacd02b208ee1 [24/36] cxl/port: Add Dynamic Capacity size support to endpoint decoders
config: i386-buildonly-randconfig-003-20230829 (https://download.01.org/0day-ci/archive/20230829/202308291652.Z9t9Czds-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230829/202308291652.Z9t9Czds-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308291652.Z9t9Czds-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cxl/core/hdm.c:431:31: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
                                   port->id, cxled->cxld.id, base, skipped);
                                                             ^~~~
   include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
                                        ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:272:19: note: expanded from macro 'dynamic_dev_dbg'
                              dev, fmt, ##__VA_ARGS__)
                                   ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:59: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
                                                                    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:246:65: note: expanded from macro '_dynamic_func_call_cls'
           __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
                                                                          ^~~~~~~~~~~
   include/linux/dynamic_debug.h:222:15: note: expanded from macro '__dynamic_func_call_cls'
                   func(&id, ##__VA_ARGS__);                       \
                               ^~~~~~~~~~~
   drivers/cxl/core/hdm.c:431:37: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
                                   port->id, cxled->cxld.id, base, skipped);
                                                                   ^~~~~~~
   include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
                                        ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:272:19: note: expanded from macro 'dynamic_dev_dbg'
                              dev, fmt, ##__VA_ARGS__)
                                   ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:59: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
                                                                    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:246:65: note: expanded from macro '_dynamic_func_call_cls'
           __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
                                                                          ^~~~~~~~~~~
   include/linux/dynamic_debug.h:222:15: note: expanded from macro '__dynamic_func_call_cls'
                   func(&id, ##__VA_ARGS__);                       \
                               ^~~~~~~~~~~
   drivers/cxl/core/hdm.c:730:3: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
                   start, size, skip);
                   ^~~~~
   include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
                                        ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:272:19: note: expanded from macro 'dynamic_dev_dbg'
                              dev, fmt, ##__VA_ARGS__)
                                   ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:59: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
                                                                    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:246:65: note: expanded from macro '_dynamic_func_call_cls'
           __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
                                                                          ^~~~~~~~~~~
   include/linux/dynamic_debug.h:222:15: note: expanded from macro '__dynamic_func_call_cls'
                   func(&id, ##__VA_ARGS__);                       \
                               ^~~~~~~~~~~
   drivers/cxl/core/hdm.c:730:16: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
                   start, size, skip);
                                ^~~~
   include/linux/dev_printk.h:155:39: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
                                        ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:272:19: note: expanded from macro 'dynamic_dev_dbg'
                              dev, fmt, ##__VA_ARGS__)
                                   ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:59: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
                                                                    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:246:65: note: expanded from macro '_dynamic_func_call_cls'
           __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
                                                                          ^~~~~~~~~~~
   include/linux/dynamic_debug.h:222:15: note: expanded from macro '__dynamic_func_call_cls'
                   func(&id, ##__VA_ARGS__);                       \
                               ^~~~~~~~~~~
   4 warnings generated.


vim +431 drivers/cxl/core/hdm.c

   389	
   390	static int __cxl_dpa_reserve(struct cxl_endpoint_decoder *cxled,
   391				     resource_size_t base, resource_size_t len,
   392				     resource_size_t skipped)
   393	{
   394		struct cxl_memdev *cxlmd = cxled_to_memdev(cxled);
   395		struct cxl_port *port = cxled_to_port(cxled);
   396		struct cxl_dev_state *cxlds = cxlmd->cxlds;
   397		struct device *dev = &port->dev;
   398		struct resource *res;
   399	
   400		lockdep_assert_held_write(&cxl_dpa_rwsem);
   401	
   402		if (!len) {
   403			dev_warn(dev, "decoder%d.%d: empty reservation attempted\n",
   404				 port->id, cxled->cxld.id);
   405			return -EINVAL;
   406		}
   407	
   408		if (cxled->dpa_res) {
   409			dev_dbg(dev, "decoder%d.%d: existing allocation %pr assigned\n",
   410				port->id, cxled->cxld.id, cxled->dpa_res);
   411			return -EBUSY;
   412		}
   413	
   414		if (port->hdm_end + 1 != cxled->cxld.id) {
   415			/*
   416			 * Assumes alloc and commit order is always in hardware instance
   417			 * order per expectations from 8.2.5.12.20 Committing Decoder
   418			 * Programming that enforce decoder[m] committed before
   419			 * decoder[m+1] commit start.
   420			 */
   421			dev_dbg(dev, "decoder%d.%d: expected decoder%d.%d\n", port->id,
   422				cxled->cxld.id, port->id, port->hdm_end + 1);
   423			return -EBUSY;
   424		}
   425	
   426		if (skipped) {
   427			int rc = cxl_reserve_dpa_skip(cxled, base, skipped);
   428	
   429			if (rc) {
   430				dev_dbg(dev, "decoder%d.%d: failed to reserve skipped space; %#llx - %#llx\n",
 > 431					port->id, cxled->cxld.id, base, skipped);
   432				return rc;
   433			}
   434		}
   435		res = __request_region(&cxlds->dpa_res, base, len,
   436				       dev_name(&cxled->cxld.dev), 0);
   437		if (!res) {
   438			dev_dbg(dev, "decoder%d.%d: failed to reserve allocation\n",
   439				port->id, cxled->cxld.id);
   440			cxl_skip_release(cxled);
   441			return -EBUSY;
   442		}
   443		cxled->dpa_res = res;
   444		cxled->skip = skipped;
   445	
   446		for (int mode = CXL_DECODER_DC0; mode <= CXL_DECODER_DC7; mode++) {
   447			int index = dc_mode_to_region_index(mode);
   448	
   449			if (resource_contains(&cxlds->dc_res[index], res)) {
   450				cxled->mode = mode;
   451				goto success;
   452			}
   453		}
   454		if (resource_contains(&cxlds->pmem_res, res))
   455			cxled->mode = CXL_DECODER_PMEM;
   456		else if (resource_contains(&cxlds->ram_res, res))
   457			cxled->mode = CXL_DECODER_RAM;
   458		else {
   459			dev_dbg(dev, "decoder%d.%d: %pr mixed\n", port->id,
   460				cxled->cxld.id, cxled->dpa_res);
   461			cxled->mode = CXL_DECODER_MIXED;
   462		}
   463	
   464	success:
   465		dev_dbg(dev, "decoder%d.%d: %pr mode: %d\n", port->id, cxled->cxld.id,
   466			cxled->dpa_res, cxled->mode);
   467		port->hdm_end++;
   468		get_device(&cxled->cxld.dev);
   469		return 0;
   470	}
   471	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
