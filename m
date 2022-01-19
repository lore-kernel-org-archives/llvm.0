Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31F12C80
	for <llvm@lists.linux.dev>; Wed, 19 Jan 2022 16:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642610258; x=1674146258;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qsg5yYZeqEXKNTcPd+VbPYg9nPFZfX5hlmIWtJ9zrsA=;
  b=IA5rN0sZKamXHPhVfK6Nx32/ZK7CdVTUn4cMwGcaMOfepyuiIgOpZCi0
   Yxi8qzCG6hZMLTHlnXOmPWc5NPJHk2dKZS0yqjA/Gu7NuCxznGYRhHA74
   C6IGyWvdHlWtjp2JvkU1OCyv5+M73TyYBZ7E/yo9EtdpRnG7cJGU8HcDn
   XevxZd4TBA3Y5KXWXaXrX2a7iwz0XJfqJqFZDGujuJ7xrD+KQr3JHGHFl
   iwGLc1LTnFthY6Z7f1fespWjjngUT1vA3Llt0YhG3JSo2+NqokIImDan2
   DvjRCqfcWM72YLWh88xcQUDl4eh9KvBmbr8I7W/sVqLjkLKHEXliJm+Mt
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="245064552"
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; 
   d="scan'208";a="245064552"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2022 08:37:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; 
   d="scan'208";a="493084022"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 19 Jan 2022 08:37:35 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nADxm-000De3-Tf; Wed, 19 Jan 2022 16:37:34 +0000
Date: Thu, 20 Jan 2022 00:37:12 +0800
From: kernel test robot <lkp@intel.com>
To: Xin Ji <xji@analogixsemi.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, bliang@analogixsemi.com,
	qwen@analogixsemi.com, jli@analogixsemi.com,
	Xin Ji <xji@analogixsemi.com>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v1 2/2] usb: typec: anx7411: Add Analogix PD ANX7411
 support
Message-ID: <202201200042.BIqTHWGV-lkp@intel.com>
References: <20220119110141.1020452-2-xji@analogixsemi.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220119110141.1020452-2-xji@analogixsemi.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Xin,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on robh/for-next peter-chen-usb/for-usb-next v5.16 next-20220118]
[cannot apply to balbi-usb/testing/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Xin-Ji/dt-bindings-usb-Add-analogix-anx7411-PD-binding/20220119-190352
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20220120/202201200042.BIqTHWGV-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f7b7138a62648f4019c55e4671682af1f851f295)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/760b0d28447fcaef7a39a20ebce9a4fb96cc0c7d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Xin-Ji/dt-bindings-usb-Add-analogix-anx7411-PD-binding/20220119-190352
        git checkout 760b0d28447fcaef7a39a20ebce9a4fb96cc0c7d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/usb/typec/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/usb/typec/anx7411.c:835:6: warning: no previous prototype for function 'anx7411_port_unregister_altmodes' [-Wmissing-prototypes]
   void anx7411_port_unregister_altmodes(struct typec_altmode **adev)
        ^
   drivers/usb/typec/anx7411.c:835:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void anx7411_port_unregister_altmodes(struct typec_altmode **adev)
   ^
   static 
   1 warning generated.


vim +/anx7411_port_unregister_altmodes +835 drivers/usb/typec/anx7411.c

   834	
 > 835	void anx7411_port_unregister_altmodes(struct typec_altmode **adev)
   836	{
   837		int i;
   838	
   839		for (i = 0; i < MAX_ALTMODE; i++)
   840			if (adev[i]) {
   841				typec_unregister_altmode(adev[i]);
   842				adev[i] = NULL;
   843			}
   844	}
   845	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
