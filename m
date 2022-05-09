Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38497B
	for <llvm@lists.linux.dev>; Mon,  9 May 2022 09:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652088278; x=1683624278;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ICKv/oGTVhXmu4zbAi3B0UmKekWHwF4fu+Id32q0AVo=;
  b=RbAWm3EP1a+WKvKah5ne9QJkQ84WTz5HUNJMXsc2SJxgiVVo8pLVJeXd
   pbqybv/n1uFCty7Ifl7afrCFDU9UAf4vnv5ZNndtGSpoScncaq0Fx0XGd
   40STRhixE5JBVUleqB7H14kne13WwBKhKohoEkRph9ymUc4UlgHGtGSJ8
   UDdMRdBJDBbkkbsynmfEIYRxD4b2ZLEPazZ7bnNaaxIRfSF7ng9wLfXRc
   52ZnyMjZVfOBIWUQlsm4RPzOEBTklgXrQfvZoXqAt4Fg6u5EZVufLc0KV
   h/swDbEZPLvqn+ix385cOVtpSjW2sI5Op70hxtH9v8WnJ3tlhDRfDsswg
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="332026844"
X-IronPort-AV: E=Sophos;i="5.91,210,1647327600"; 
   d="scan'208";a="332026844"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2022 02:24:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,210,1647327600"; 
   d="scan'208";a="622881184"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 09 May 2022 02:24:36 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nnzd5-000GNi-Jk;
	Mon, 09 May 2022 09:24:35 +0000
Date: Mon, 9 May 2022 17:24:34 +0800
From: kernel test robot <lkp@intel.com>
To: Linyu Yuan <quic_linyyuan@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-usb@vger.kernel.org, Jack Pham <quic_jackp@quicinc.com>,
	Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: Re: [PATCH v2] usb: gadget: update DECLARE_USB_FUNCTION(_INIT) macro
Message-ID: <202205091746.HoR8ueL5-lkp@intel.com>
References: <1652077685-30622-1-git-send-email-quic_linyyuan@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1652077685-30622-1-git-send-email-quic_linyyuan@quicinc.com>

Hi Linyu,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on v5.18-rc6 next-20220506]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Linyu-Yuan/usb-gadget-update-DECLARE_USB_FUNCTION-_INIT-macro/20220509-144542
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
config: mips-randconfig-r024-20220509 (https://download.01.org/0day-ci/archive/20220509/202205091746.HoR8ueL5-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a385645b470e2d3a1534aae618ea56b31177639f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/5c9f589ea23bf995436cde6bd39f1c5b2cc1ec4f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Linyu-Yuan/usb-gadget-update-DECLARE_USB_FUNCTION-_INIT-macro/20220509-144542
        git checkout 5c9f589ea23bf995436cde6bd39f1c5b2cc1ec4f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/usb/gadget/function/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/usb/gadget/function/f_tcm.c:2313:31: error: use of undeclared identifier 'tcmusb_func'; did you mean 'tcm_usb_func'?
           ret = usb_function_register(&tcmusb_func);
                                        ^~~~~~~~~~~
                                        tcm_usb_func
   drivers/usb/gadget/function/f_tcm.c:2307:1: note: 'tcm_usb_func' declared here
   DECLARE_USB_FUNCTION(tcm, tcm_alloc_inst, tcm_alloc);
   ^
   include/linux/usb/composite.h:614:36: note: expanded from macro 'DECLARE_USB_FUNCTION'
           static struct usb_function_driver _name ## _usb_func = {        \
                                             ^
   <scratch space>:20:1: note: expanded from here
   tcm_usb_func
   ^
   drivers/usb/gadget/function/f_tcm.c:2319:28: error: use of undeclared identifier 'tcmusb_func'; did you mean 'tcm_usb_func'?
                   usb_function_unregister(&tcmusb_func);
                                            ^~~~~~~~~~~
                                            tcm_usb_func
   drivers/usb/gadget/function/f_tcm.c:2307:1: note: 'tcm_usb_func' declared here
   DECLARE_USB_FUNCTION(tcm, tcm_alloc_inst, tcm_alloc);
   ^
   include/linux/usb/composite.h:614:36: note: expanded from macro 'DECLARE_USB_FUNCTION'
           static struct usb_function_driver _name ## _usb_func = {        \
                                             ^
   <scratch space>:20:1: note: expanded from here
   tcm_usb_func
   ^
   drivers/usb/gadget/function/f_tcm.c:2328:27: error: use of undeclared identifier 'tcmusb_func'; did you mean 'tcm_usb_func'?
           usb_function_unregister(&tcmusb_func);
                                    ^~~~~~~~~~~
                                    tcm_usb_func
   drivers/usb/gadget/function/f_tcm.c:2307:1: note: 'tcm_usb_func' declared here
   DECLARE_USB_FUNCTION(tcm, tcm_alloc_inst, tcm_alloc);
   ^
   include/linux/usb/composite.h:614:36: note: expanded from macro 'DECLARE_USB_FUNCTION'
           static struct usb_function_driver _name ## _usb_func = {        \
                                             ^
   <scratch space>:20:1: note: expanded from here
   tcm_usb_func
   ^
   3 errors generated.


vim +2313 drivers/usb/gadget/function/f_tcm.c

dc8c46a5ae770d Andrzej Pietrasiewicz 2015-12-11  2308  
dc8c46a5ae770d Andrzej Pietrasiewicz 2015-12-11  2309  static int tcm_init(void)
dc8c46a5ae770d Andrzej Pietrasiewicz 2015-12-11  2310  {
dc8c46a5ae770d Andrzej Pietrasiewicz 2015-12-11  2311  	int ret;
dc8c46a5ae770d Andrzej Pietrasiewicz 2015-12-11  2312  
dc8c46a5ae770d Andrzej Pietrasiewicz 2015-12-11 @2313  	ret = usb_function_register(&tcmusb_func);
dc8c46a5ae770d Andrzej Pietrasiewicz 2015-12-11  2314  	if (ret)
dc8c46a5ae770d Andrzej Pietrasiewicz 2015-12-11  2315  		return ret;
dc8c46a5ae770d Andrzej Pietrasiewicz 2015-12-11  2316  
dc8c46a5ae770d Andrzej Pietrasiewicz 2015-12-11  2317  	ret = target_register_template(&usbg_ops);
dc8c46a5ae770d Andrzej Pietrasiewicz 2015-12-11  2318  	if (ret)
dc8c46a5ae770d Andrzej Pietrasiewicz 2015-12-11  2319  		usb_function_unregister(&tcmusb_func);
dc8c46a5ae770d Andrzej Pietrasiewicz 2015-12-11  2320  
dc8c46a5ae770d Andrzej Pietrasiewicz 2015-12-11  2321  	return ret;
dc8c46a5ae770d Andrzej Pietrasiewicz 2015-12-11  2322  }
dc8c46a5ae770d Andrzej Pietrasiewicz 2015-12-11  2323  module_init(tcm_init);
dc8c46a5ae770d Andrzej Pietrasiewicz 2015-12-11  2324  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
