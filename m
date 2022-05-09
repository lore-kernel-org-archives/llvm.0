Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC7C7E
	for <llvm@lists.linux.dev>; Mon,  9 May 2022 06:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652076664; x=1683612664;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q/+TWUhk9UE5aPgQPz4SwR0O7CR+cRK/KszfoagCEiE=;
  b=aiMwkV9k3ESryZHD1a8tUq6yXa4TNi5HvduxyMNMuI2a6a0Hw2JsoEj2
   GXYZwrF7rIfFE/sskxqRzE7eR51letlhmBJacYrpqbCnAdp+McgrmuMrY
   gVmr2dgGYSKpCfj/tE4mebf6YEeMrJtQd6YvaHdEKuTzQVaj49JuyG9bl
   n3bVBWEP3ReQ6+Ky168gdBHsTm+tDdYvmtLrk/xtOYjWG2Artjf2RUvIG
   wueuJUQ9fQq0T4cc1SWeCJoM/luz4noSZEA9cd8C+1dmJ24Yns0WorzoS
   vgVPR5KDO6XXZazKf96yIaK3Kthj8nG5KJSse70bbHZl5RO5D4DeV0yl5
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="268609451"
X-IronPort-AV: E=Sophos;i="5.91,210,1647327600"; 
   d="scan'208";a="268609451"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2022 23:11:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,210,1647327600"; 
   d="scan'208";a="633885902"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 08 May 2022 23:11:02 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nnwbl-000GEI-D3;
	Mon, 09 May 2022 06:11:01 +0000
Date: Mon, 9 May 2022 14:10:41 +0800
From: kernel test robot <lkp@intel.com>
To: Linyu Yuan <quic_linyyuan@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-usb@vger.kernel.org, Jack Pham <quic_jackp@quicinc.com>,
	Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: Re: [PATCH] usb: gadget: update DECLARE_USB_FUNCTION(_INIT) macro
Message-ID: <202205091426.o1eXthPp-lkp@intel.com>
References: <1652069653-6961-1-git-send-email-quic_linyyuan@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1652069653-6961-1-git-send-email-quic_linyyuan@quicinc.com>

Hi Linyu,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on v5.18-rc6 next-20220506]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Linyu-Yuan/usb-gadget-update-DECLARE_USB_FUNCTION-_INIT-macro/20220509-122915
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
config: hexagon-randconfig-r045-20220509 (https://download.01.org/0day-ci/archive/20220509/202205091426.o1eXthPp-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a385645b470e2d3a1534aae618ea56b31177639f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ce4965d3f282c0e6971a978b6b892f2f8352553d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Linyu-Yuan/usb-gadget-update-DECLARE_USB_FUNCTION-_INIT-macro/20220509-122915
        git checkout ce4965d3f282c0e6971a978b6b892f2f8352553d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/usb/gadget/function/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/usb/gadget/function/f_loopback.c:590:32: error: use of undeclared identifier 'Loopbackusb_func'; did you mean 'Loopback_usb_func'?
           return usb_function_register(&Loopbackusb_func);
                                         ^~~~~~~~~~~~~~~~
                                         Loopback_usb_func
   drivers/usb/gadget/function/f_loopback.c:586:1: note: 'Loopback_usb_func' declared here
   DECLARE_USB_FUNCTION(Loopback, loopback_alloc_instance, loopback_alloc);
   ^
   include/linux/usb/composite.h:614:36: note: expanded from macro 'DECLARE_USB_FUNCTION'
           static struct usb_function_driver _name ## _usb_func = {        \
                                             ^
   <scratch space>:94:1: note: expanded from here
   Loopback_usb_func
   ^
   drivers/usb/gadget/function/f_loopback.c:595:27: error: use of undeclared identifier 'Loopbackusb_func'; did you mean 'Loopback_usb_func'?
           usb_function_unregister(&Loopbackusb_func);
                                    ^~~~~~~~~~~~~~~~
                                    Loopback_usb_func
   drivers/usb/gadget/function/f_loopback.c:586:1: note: 'Loopback_usb_func' declared here
   DECLARE_USB_FUNCTION(Loopback, loopback_alloc_instance, loopback_alloc);
   ^
   include/linux/usb/composite.h:614:36: note: expanded from macro 'DECLARE_USB_FUNCTION'
           static struct usb_function_driver _name ## _usb_func = {        \
                                             ^
   <scratch space>:94:1: note: expanded from here
   Loopback_usb_func
   ^
   2 errors generated.
--
>> drivers/usb/gadget/function/f_sourcesink.c:1273:31: error: use of undeclared identifier 'SourceSinkusb_func'; did you mean 'SourceSink_usb_func'?
           ret = usb_function_register(&SourceSinkusb_func);
                                        ^~~~~~~~~~~~~~~~~~
                                        SourceSink_usb_func
   drivers/usb/gadget/function/f_sourcesink.c:1266:1: note: 'SourceSink_usb_func' declared here
   DECLARE_USB_FUNCTION(SourceSink, source_sink_alloc_inst,
   ^
   include/linux/usb/composite.h:614:36: note: expanded from macro 'DECLARE_USB_FUNCTION'
           static struct usb_function_driver _name ## _usb_func = {        \
                                             ^
   <scratch space>:136:1: note: expanded from here
   SourceSink_usb_func
   ^
   drivers/usb/gadget/function/f_sourcesink.c:1278:28: error: use of undeclared identifier 'SourceSinkusb_func'; did you mean 'SourceSink_usb_func'?
                   usb_function_unregister(&SourceSinkusb_func);
                                            ^~~~~~~~~~~~~~~~~~
                                            SourceSink_usb_func
   drivers/usb/gadget/function/f_sourcesink.c:1266:1: note: 'SourceSink_usb_func' declared here
   DECLARE_USB_FUNCTION(SourceSink, source_sink_alloc_inst,
   ^
   include/linux/usb/composite.h:614:36: note: expanded from macro 'DECLARE_USB_FUNCTION'
           static struct usb_function_driver _name ## _usb_func = {        \
                                             ^
   <scratch space>:136:1: note: expanded from here
   SourceSink_usb_func
   ^
   drivers/usb/gadget/function/f_sourcesink.c:1283:27: error: use of undeclared identifier 'SourceSinkusb_func'; did you mean 'SourceSink_usb_func'?
           usb_function_unregister(&SourceSinkusb_func);
                                    ^~~~~~~~~~~~~~~~~~
                                    SourceSink_usb_func
   drivers/usb/gadget/function/f_sourcesink.c:1266:1: note: 'SourceSink_usb_func' declared here
   DECLARE_USB_FUNCTION(SourceSink, source_sink_alloc_inst,
   ^
   include/linux/usb/composite.h:614:36: note: expanded from macro 'DECLARE_USB_FUNCTION'
           static struct usb_function_driver _name ## _usb_func = {        \
                                             ^
   <scratch space>:136:1: note: expanded from here
   SourceSink_usb_func
   ^
   3 errors generated.


vim +590 drivers/usb/gadget/function/f_loopback.c

cf9a08ae5aece8 drivers/usb/gadget/f_loopback.c          Sebastian Andrzej Siewior 2012-12-23  587  
cf9a08ae5aece8 drivers/usb/gadget/f_loopback.c          Sebastian Andrzej Siewior 2012-12-23  588  int __init lb_modinit(void)
cf9a08ae5aece8 drivers/usb/gadget/f_loopback.c          Sebastian Andrzej Siewior 2012-12-23  589  {
5387c920372a3a drivers/usb/gadget/function/f_loopback.c Colin Ian King            2016-09-08 @590  	return usb_function_register(&Loopbackusb_func);
e5760fdac8c8ae drivers/usb/gadget/f_loopback.c          David Brownell            2008-06-19  591  }
5387c920372a3a drivers/usb/gadget/function/f_loopback.c Colin Ian King            2016-09-08  592  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
