Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EF02CA0
	for <llvm@lists.linux.dev>; Mon,  6 Dec 2021 11:32:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10189"; a="261330010"
X-IronPort-AV: E=Sophos;i="5.87,291,1631602800"; 
   d="scan'208";a="261330010"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2021 03:32:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,291,1631602800"; 
   d="scan'208";a="678958870"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 06 Dec 2021 03:32:05 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1muCE0-000LDS-CD; Mon, 06 Dec 2021 11:32:04 +0000
Date: Mon, 6 Dec 2021 19:31:56 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Grzeschik <m.grzeschik@pengutronix.de>,
	linux-usb@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, balbi@kernel.org,
	laurent.pinchart@ideasonboard.com, paul.elder@ideasonboard.com,
	kernel@pengutronix.de
Subject: Re: [PATCH v4 6/7] usb: gadget: uvc: add VIDIOC function
Message-ID: <202112061923.TiElYqbE-lkp@intel.com>
References: <20211205225803.268492-7-m.grzeschik@pengutronix.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211205225803.268492-7-m.grzeschik@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Michael,

I love your patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on usb/usb-testing peter-chen-usb/for-usb-next v5.16-rc4 next-20211206]
[cannot apply to balbi-usb/testing/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Michael-Grzeschik/usb-gadget-uvc-use-configfs-entries-for-negotiation-and-v4l2-VIDIOCS/20211206-070014
base:   git://linuxtv.org/media_tree.git master
config: riscv-randconfig-r024-20211205 (https://download.01.org/0day-ci/archive/20211206/202112061923.TiElYqbE-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6e8678903523019903222e4521a5e41af743cab0)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/fddc809d40b686678ad8bea9c47f37b355b3608b
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Michael-Grzeschik/usb-gadget-uvc-use-configfs-entries-for-negotiation-and-v4l2-VIDIOCS/20211206-070014
        git checkout fddc809d40b686678ad8bea9c47f37b355b3608b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/usb/gadget/function/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/usb/gadget/function/uvc_v4l2.c:73:2: warning: variable 'uformat' is used uninitialized whenever 'for' loop exits because its condition is false [-Wsometimes-uninitialized]
           list_for_each_entry(format, &uvc->header->formats, entry) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:631:7: note: expanded from macro 'list_for_each_entry'
                !list_entry_is_head(pos, head, member);                    \
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/uvc_v4l2.c:81:9: note: uninitialized use occurs here
           return uformat;
                  ^~~~~~~
   drivers/usb/gadget/function/uvc_v4l2.c:73:2: note: remove the condition if it is always true
           list_for_each_entry(format, &uvc->header->formats, entry) {
           ^
   include/linux/list.h:631:7: note: expanded from macro 'list_for_each_entry'
                !list_entry_is_head(pos, head, member);                    \
                ^
   drivers/usb/gadget/function/uvc_v4l2.c:70:29: note: initialize the variable 'uformat' to silence this warning
           struct uvcg_format *uformat;
                                      ^
                                       = NULL
   drivers/usb/gadget/function/uvc_v4l2.c:112:2: warning: variable 'uformat' is used uninitialized whenever 'for' loop exits because its condition is false [-Wsometimes-uninitialized]
           list_for_each_entry(format, &uvc->header->formats, entry) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:631:7: note: expanded from macro 'list_for_each_entry'
                !list_entry_is_head(pos, head, member);                    \
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/function/uvc_v4l2.c:121:9: note: uninitialized use occurs here
           return uformat;
                  ^~~~~~~
   drivers/usb/gadget/function/uvc_v4l2.c:112:2: note: remove the condition if it is always true
           list_for_each_entry(format, &uvc->header->formats, entry) {
           ^
   include/linux/list.h:631:7: note: expanded from macro 'list_for_each_entry'
                !list_entry_is_head(pos, head, member);                    \
                ^
   drivers/usb/gadget/function/uvc_v4l2.c:110:29: note: initialize the variable 'uformat' to silence this warning
           struct uvcg_format *uformat;
                                      ^
                                       = NULL
   2 warnings generated.


vim +73 drivers/usb/gadget/function/uvc_v4l2.c

    66	
    67	struct uvcg_format *find_format_by_index(struct uvc_device *uvc, int index)
    68	{
    69		struct uvcg_format_ptr *format;
    70		struct uvcg_format *uformat;
    71		int i = 1;
    72	
  > 73		list_for_each_entry(format, &uvc->header->formats, entry) {
    74			if (index == i) {
    75				uformat = format->fmt;
    76				break;
    77			}
    78			i++;
    79		}
    80	
    81		return uformat;
    82	}
    83	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
