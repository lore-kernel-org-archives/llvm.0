Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29C028EA
	for <llvm@lists.linux.dev>; Thu, 21 Jul 2022 10:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658397665; x=1689933665;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JoAqtAChf2lbh0GsZ6eAYO48p9sUo2QNR2OeR0SM9Nw=;
  b=B0CVuXTK4vtR79/5BC33QLIPL0mTh3Hjh6zUOAvzDqoPMYL8UWQzER1l
   lT1fL7gvPsIKy1r7vkEC7zYmrmjGbs8pxOq2QdFVHxOWjo1i/6y/YZu8v
   0mImAgAw5oqFT8wk2zxXmn75lTR4IRaSP0EJh3mkYxNIEuU9FxWNNtxnS
   PuXFK4URccPAnMdjPNzVOUEl6SkPeuizAHs0D278G5tzPTVIT0YRYFBGK
   MmtGIyetvBg7MwFG06QrO1A6Sp/Cy7QpyiWbzKLfxcLOx4VdcuOM6U3h4
   rCcbj6QBKVbMouJwKny50pYghriewUOMK2XhqPU/gMAR416pBDFwXPjiF
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10414"; a="373306251"
X-IronPort-AV: E=Sophos;i="5.92,289,1650956400"; 
   d="scan'208";a="373306251"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2022 03:00:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,289,1650956400"; 
   d="scan'208";a="598406441"
Received: from lkp-server01.sh.intel.com (HELO 7dfbdc7c7900) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 21 Jul 2022 03:00:52 -0700
Received: from kbuild by 7dfbdc7c7900 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oESz8-0001hb-PC;
	Thu, 21 Jul 2022 10:00:46 +0000
Date: Thu, 21 Jul 2022 18:00:45 +0800
From: kernel test robot <lkp@intel.com>
To: Weitao Wang <WeitaoWang-oc@zhaoxin.com>, stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org, kishon@ti.com, dianders@chromium.org,
	s.shtylyov@omp.ru, mka@chromium.org, ming.lei@canonical.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, tonywwang@zhaoxin.com,
	weitaowang@zhaoxin.com, CobeChen@zhaoxin.com, TimGuo@zhaoxin.com
Subject: Re: [PATCH] USB: HCD: Fix URB giveback issue in tasklet function
Message-ID: <202207211752.TObbLhyX-lkp@intel.com>
References: <20220721060833.4173-1-WeitaoWang-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220721060833.4173-1-WeitaoWang-oc@zhaoxin.com>

Hi Weitao,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on linus/master v5.19-rc7 next-20220720]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Weitao-Wang/USB-HCD-Fix-URB-giveback-issue-in-tasklet-function/20220721-144208
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
config: hexagon-randconfig-r045-20220718 (https://download.01.org/0day-ci/archive/20220721/202207211752.TObbLhyX-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0c1b32717bcffcf8edf95294e98933bd4c1e76ed)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/302398ba5a76bb39957bad7a6a8cb9d0429cd43a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Weitao-Wang/USB-HCD-Fix-URB-giveback-issue-in-tasklet-function/20220721-144208
        git checkout 302398ba5a76bb39957bad7a6a8cb9d0429cd43a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/usb/core/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/usb/core/hcd.c:1694:2: warning: unused label 'restart' [-Wunused-label]
    restart:
    ^~~~~~~~
   1 warning generated.


vim +/restart +1694 drivers/usb/core/hcd.c

94dfd7edfd5c9b Ming Lei    2013-07-03  1686  
e71ea55a5b6f91 Allen Pais  2020-08-17  1687  static void usb_giveback_urb_bh(struct tasklet_struct *t)
94dfd7edfd5c9b Ming Lei    2013-07-03  1688  {
e71ea55a5b6f91 Allen Pais  2020-08-17  1689  	struct giveback_urb_bh *bh = from_tasklet(bh, t, bh);
94dfd7edfd5c9b Ming Lei    2013-07-03  1690  	struct list_head local_list;
94dfd7edfd5c9b Ming Lei    2013-07-03  1691  
94dfd7edfd5c9b Ming Lei    2013-07-03  1692  	spin_lock_irq(&bh->lock);
94dfd7edfd5c9b Ming Lei    2013-07-03  1693  	bh->running = true;
94dfd7edfd5c9b Ming Lei    2013-07-03 @1694   restart:
94dfd7edfd5c9b Ming Lei    2013-07-03  1695  	list_replace_init(&bh->head, &local_list);
94dfd7edfd5c9b Ming Lei    2013-07-03  1696  	spin_unlock_irq(&bh->lock);
94dfd7edfd5c9b Ming Lei    2013-07-03  1697  
94dfd7edfd5c9b Ming Lei    2013-07-03  1698  	while (!list_empty(&local_list)) {
94dfd7edfd5c9b Ming Lei    2013-07-03  1699  		struct urb *urb;
94dfd7edfd5c9b Ming Lei    2013-07-03  1700  
94dfd7edfd5c9b Ming Lei    2013-07-03  1701  		urb = list_entry(local_list.next, struct urb, urb_list);
94dfd7edfd5c9b Ming Lei    2013-07-03  1702  		list_del_init(&urb->urb_list);
c7ccde6eac6d3c Alan Stern  2013-09-03  1703  		bh->completing_ep = urb->ep;
94dfd7edfd5c9b Ming Lei    2013-07-03  1704  		__usb_hcd_giveback_urb(urb);
c7ccde6eac6d3c Alan Stern  2013-09-03  1705  		bh->completing_ep = NULL;
94dfd7edfd5c9b Ming Lei    2013-07-03  1706  	}
94dfd7edfd5c9b Ming Lei    2013-07-03  1707  
302398ba5a76bb Weitao Wang 2022-07-21  1708  	/* giveback new URBs next time to prevent this function from
302398ba5a76bb Weitao Wang 2022-07-21  1709  	 * not exiting for a long time.
302398ba5a76bb Weitao Wang 2022-07-21  1710  	 */
94dfd7edfd5c9b Ming Lei    2013-07-03  1711  	spin_lock_irq(&bh->lock);
302398ba5a76bb Weitao Wang 2022-07-21  1712  	if (!list_empty(&bh->head)) {
302398ba5a76bb Weitao Wang 2022-07-21  1713  		if (bh->hi_priority)
302398ba5a76bb Weitao Wang 2022-07-21  1714  			tasklet_hi_schedule(&bh->bh);
302398ba5a76bb Weitao Wang 2022-07-21  1715  		else
302398ba5a76bb Weitao Wang 2022-07-21  1716  			tasklet_schedule(&bh->bh);
302398ba5a76bb Weitao Wang 2022-07-21  1717  	}
94dfd7edfd5c9b Ming Lei    2013-07-03  1718  	bh->running = false;
94dfd7edfd5c9b Ming Lei    2013-07-03  1719  	spin_unlock_irq(&bh->lock);
94dfd7edfd5c9b Ming Lei    2013-07-03  1720  }
94dfd7edfd5c9b Ming Lei    2013-07-03  1721  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
