Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4EC7A
	for <llvm@lists.linux.dev>; Thu, 21 Apr 2022 13:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650547398; x=1682083398;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=khceue8ltpZUkmKSPCe9vVKCZ2uvDXMdW5xRg6SPaGQ=;
  b=lhcl19VKqP56KYf2FXNYDiYxkmG1doSXWnU6OdS8X0GFy+YdtB1p2k0D
   NMmk8LgsmMSHZtYT5FomQaP6QFHY6Rr3H/YDmHwACB7SuXj2XplyuRnuG
   pBEsRnsTk5s7RnfzBPD5jXEdp5O5h3uxYXSVroMR7+v60wLGWMUhA/6kB
   NTt14pOML6ASBozTsHGOL2Mb6Bj9CZi9u4lzAT/nSTh66fo9DU5+GrUS2
   pD/0dsRuDfu6fBEcW6fAJOPaByjSyHku+VXReG/W7szAOXCCPTogvO9mB
   9mAX6WTVi+kisRxxkJ4w/+ih4OZ51bmCr5xcyD2kiQNQLsQIn71p/R3Ig
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="244276258"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="244276258"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 06:23:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="648131319"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Apr 2022 06:23:15 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhWmB-0008Qr-B2;
	Thu, 21 Apr 2022 13:23:15 +0000
Date: Thu, 21 Apr 2022 21:22:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jean-Marc Eurin <jmeurin@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [mtd:mtd/next 10/11] drivers/mtd/mtdoops.c:244:39: warning: format
 specifies type 'long' but the argument has type 'unsigned int'
Message-ID: <202204212106.9R1ylUB7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next
head:   f812679fab605b3d5b853ed24a81dabb222ea23a
commit: 0629fcef16d703d384f76cb2c2c3a119a9149a34 [10/11] mtd: mtdoops: Create a header structure for the saved mtdoops.
config: hexagon-randconfig-r045-20220420 (https://download.01.org/0day-ci/archive/20220421/202204212106.9R1ylUB7-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd5bf85669e3376610cfc4c4f9ca015e7b9b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/commit/?id=0629fcef16d703d384f76cb2c2c3a119a9149a34
        git remote add mtd https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
        git fetch --no-tags mtd mtd/next
        git checkout 0629fcef16d703d384f76cb2c2c3a119a9149a34
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/mtd/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/mtd/mtdoops.c:244:39: warning: format specifies type 'long' but the argument has type 'unsigned int' [-Wformat]
                                  page * record_size, retlen, sizeof(hdr), ret);
                                                              ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   1 warning generated.


vim +244 drivers/mtd/mtdoops.c

   225	
   226	static void find_next_position(struct mtdoops_context *cxt)
   227	{
   228		struct mtd_info *mtd = cxt->mtd;
   229		struct mtdoops_hdr hdr;
   230		int ret, page, maxpos = 0;
   231		u32 maxcount = 0xffffffff;
   232		size_t retlen;
   233	
   234		for (page = 0; page < cxt->oops_pages; page++) {
   235			if (mtd_block_isbad(mtd, page * record_size))
   236				continue;
   237			/* Assume the page is used */
   238			mark_page_used(cxt, page);
   239			ret = mtd_read(mtd, page * record_size, sizeof(hdr),
   240				       &retlen, (u_char *)&hdr);
   241			if (retlen != sizeof(hdr) ||
   242					(ret < 0 && !mtd_is_bitflip(ret))) {
   243				printk(KERN_ERR "mtdoops: read failure at %ld (%td of %ld read), err %d\n",
 > 244				       page * record_size, retlen, sizeof(hdr), ret);
   245				continue;
   246			}
   247	
   248			if (hdr.seq == 0xffffffff && hdr.magic == 0xffffffff)
   249				mark_page_unused(cxt, page);
   250			if (hdr.seq == 0xffffffff || hdr.magic != MTDOOPS_KERNMSG_MAGIC)
   251				continue;
   252			if (maxcount == 0xffffffff) {
   253				maxcount = hdr.seq;
   254				maxpos = page;
   255			} else if (hdr.seq < 0x40000000 && maxcount > 0xc0000000) {
   256				maxcount = hdr.seq;
   257				maxpos = page;
   258			} else if (hdr.seq > maxcount && hdr.seq < 0xc0000000) {
   259				maxcount = hdr.seq;
   260				maxpos = page;
   261			} else if (hdr.seq > maxcount && hdr.seq > 0xc0000000
   262						&& maxcount > 0x80000000) {
   263				maxcount = hdr.seq;
   264				maxpos = page;
   265			}
   266		}
   267		if (maxcount == 0xffffffff) {
   268			cxt->nextpage = cxt->oops_pages - 1;
   269			cxt->nextcount = 0;
   270		}
   271		else {
   272			cxt->nextpage = maxpos;
   273			cxt->nextcount = maxcount;
   274		}
   275	
   276		mtdoops_inc_counter(cxt);
   277	}
   278	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
