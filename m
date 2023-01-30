Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B777323C;
	Mon, 30 Jan 2023 14:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675088709; x=1706624709;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6NdavVOwrEvk093APw6uR4iJhtN475OF/eVzCOmDNx0=;
  b=Y9H37zY3yLZ+JeDH/ACmnscOGk5rDkvQ8CkultyoEIBuGn/hP7L5jzOS
   Md2Y1nhLxQM8qeF+4hoYV0wnYDuQwCgcV/yaTCZ65ULFyPRCuQSkdys4N
   2p9TZYx9V611gyThSlN8zTgWHvH7fNvk+PcSGQ4mItQhBkF6aUEfxlFs5
   Pvv8TVUl64ElVd8p7t/ij8TZZ8DoCDYUG94s3o9AYCwwf1sxraiLnxRye
   CJ4c7FXi4D0C7AtHQFn3mqBCafyjTelQPXgUB/AW8T7ZjSDTETt0GJJqV
   JCCF+J/fNHzoEH6EcLL47eNCBC1uyRwqCCNMvvk3Doee7M3jvtfMuzFb1
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="392114736"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="392114736"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 06:25:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="992921712"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="992921712"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 30 Jan 2023 06:25:05 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMV5k-0003gA-2m;
	Mon, 30 Jan 2023 14:25:04 +0000
Date: Mon, 30 Jan 2023 22:24:47 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Scally <dan.scally@ideasonboard.com>, linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org, laurent.pinchart@ideasonboard.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, mgr@pengutronix.de,
	balbi@kernel.org, kieran.bingham@ideasonboard.com,
	torleiv@huddly.com, stern@rowland.harvard.edu,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH v3 06/11] usb: gadget: configfs: Support arbitrary string
 descriptors
Message-ID: <202301302236.Ogdqs7GZ-lkp@intel.com>
References: <20230130093443.25644-7-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130093443.25644-7-dan.scally@ideasonboard.com>

Hi Daniel,

I love your patch! Perhaps something to improve:

[auto build test WARNING on usb/usb-linus]
[also build test WARNING on westeri-thunderbolt/next linus/master v6.2-rc6 next-20230130]
[cannot apply to usb/usb-testing usb/usb-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Scally/usb-gadget-uvc-Make-bSourceID-read-write/20230130-174215
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
patch link:    https://lore.kernel.org/r/20230130093443.25644-7-dan.scally%40ideasonboard.com
patch subject: [PATCH v3 06/11] usb: gadget: configfs: Support arbitrary string descriptors
config: i386-randconfig-a013-20230130 (https://download.01.org/0day-ci/archive/20230130/202301302236.Ogdqs7GZ-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/452304e81fac1427f314a4b0beef8561ef4ebf17
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Daniel-Scally/usb-gadget-uvc-Make-bSourceID-read-write/20230130-174215
        git checkout 452304e81fac1427f314a4b0beef8561ef4ebf17
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/usb/gadget/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/usb/gadget/configfs.c:811:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
           int ret;
               ^
   1 warning generated.


vim +/ret +811 drivers/usb/gadget/configfs.c

   805	
   806	static ssize_t gadget_string_s_store(struct config_item *item, const char *page,
   807					     size_t len)
   808	{
   809		struct gadget_string *string = to_gadget_string(item);
   810		int size = min(sizeof(string->string), len + 1);
 > 811		int ret;
   812	
   813		if (len > USB_MAX_STRING_LEN)
   814			return -EINVAL;
   815	
   816		ret = strscpy(string->string, page, size);
   817		return len;
   818	}
   819	CONFIGFS_ATTR(gadget_string_, s);
   820	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
