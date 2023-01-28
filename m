Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F6E23A2;
	Sat, 28 Jan 2023 04:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674881241; x=1706417241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TMaPEK/flWHkegvDhPNIMpyJEF1mxwCi9JdCIBlRCTg=;
  b=WBGXhR3JIOHFtUxNQgoVpOGncM0mkr3rpAccaYKxZtn+RkZSm/0+4Pxv
   2YgevCjxK0rz91x4n0o4XI316D5072wh1GXi56/mzUqTMSkkJ9hRIsHPm
   tkIjjNN4HEtn4FF7SahtWulSfwuyQnO9rNGUAwUBRCkQ1/YsQ1AlNxeBx
   nQYWH5MEW/25XeV8BXZ7bfIYMfMGYXYGpxDU7eTahp+K732ZDoRgrnd3Z
   QTwzPTz3Q2D8WsojuQGKRq3IAVaS3tS2J4fsLpEwVcdkzGupJ6njcMdjX
   Aw4TVPK7K8rPfIxPNaJ0cKpsTg6kOfq1MeC9fa5Gt6zMo3V5WuPOBHsw1
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="328549690"
X-IronPort-AV: E=Sophos;i="5.97,253,1669104000"; 
   d="scan'208";a="328549690"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2023 20:47:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="665486817"
X-IronPort-AV: E=Sophos;i="5.97,253,1669104000"; 
   d="scan'208";a="665486817"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 27 Jan 2023 20:47:17 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLd7V-0000Oz-0I;
	Sat, 28 Jan 2023 04:47:17 +0000
Date: Sat, 28 Jan 2023 12:46:48 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Ben Widawsky <ben.widawsky@intel.com>,
	Dan Williams <dan.j.williams@intel.com>, linux-cxl@vger.kernel.org
Subject: [cxl:for-6.3/cxl-ram-region 14/18] drivers/cxl/core/region.c:1479:7:
 warning: variable 'rc' set but not used
Message-ID: <202301281217.NvoiwL4w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git for-6.3/cxl-ram-region
head:   a7cf664d7e997ac36b0f466af2e2be33464ab598
commit: d5c71004c2cb69354ab7f1bb9b0a33ae9f7edf9d [14/18] cxl/region: Refactor attach_target() for autodiscovery
config: i386-randconfig-a012-20230123 (https://download.01.org/0day-ci/archive/20230128/202301281217.NvoiwL4w-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git/commit/?id=d5c71004c2cb69354ab7f1bb9b0a33ae9f7edf9d
        git remote add cxl https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git
        git fetch --no-tags cxl for-6.3/cxl-ram-region
        git checkout d5c71004c2cb69354ab7f1bb9b0a33ae9f7edf9d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/cxl/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/cxl/core/region.c:1479:7: warning: variable 'rc' set but not used [-Wunused-but-set-variable]
                   int rc;
                       ^
>> drivers/cxl/core/region.c:1482:7: warning: variable 'rc' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
                   if (!dev)
                       ^~~~
   drivers/cxl/core/region.c:1496:6: note: uninitialized use occurs here
           if (rc < 0)
               ^~
   drivers/cxl/core/region.c:1482:3: note: remove the 'if' if its condition is always true
                   if (!dev)
                   ^~~~~~~~~
   drivers/cxl/core/region.c:1473:8: note: initialize the variable 'rc' to silence this warning
           int rc;
                 ^
                  = 0
   2 warnings generated.


vim +/rc +1479 drivers/cxl/core/region.c

  1469	
  1470	static size_t store_targetN(struct cxl_region *cxlr, const char *buf, int pos,
  1471				    size_t len)
  1472	{
  1473		int rc;
  1474	
  1475		if (sysfs_streq(buf, "\n"))
  1476			rc = detach_target(cxlr, pos);
  1477		else {
  1478			struct device *dev;
> 1479			int rc;
  1480	
  1481			dev = bus_find_device_by_name(&cxl_bus_type, NULL, buf);
> 1482			if (!dev)
  1483				return -ENODEV;
  1484	
  1485			if (!is_endpoint_decoder(dev)) {
  1486				rc = -EINVAL;
  1487				goto out;
  1488			}
  1489	
  1490			rc = attach_target(cxlr, to_cxl_endpoint_decoder(dev), pos,
  1491					   TASK_INTERRUPTIBLE);
  1492	out:
  1493			put_device(dev);
  1494		}
  1495	
  1496		if (rc < 0)
  1497			return rc;
  1498		return len;
  1499	}
  1500	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
