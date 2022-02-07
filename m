Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E362C9C
	for <llvm@lists.linux.dev>; Mon,  7 Feb 2022 10:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644229940; x=1675765940;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XRmP/X8RLTSHNZOJtP0mmFwv/xOazCe7T0uuWyO98Rw=;
  b=TPPXjgi5E1idvMVbl8+ZFeczfZvMHtiktSM+kqnQSl9AOLlhn4mRa5sm
   cF82olkJ1OCB8Mof9SSCsBNhAwwQc7ffAKkFq2M/3Pd+ZLMqPlvUBWw3S
   W+DPvawL3sBuEJhJMyFQf4xx7fPGWIbX3XORUzxNCRUYBUayv1N+kfMKD
   712wK/ZWYFRrrmpUzvNRN4gwcqRJTs/F9gsuzDpRrPMFUqWqx6ZO4H2BQ
   lYq1zOTVWWfdhBz23bXfnD130CL0SpzFilVQzQm/IWYafsk0CBPzqXIGY
   932m88f2/0NBx1qQrVRR1JIJc5nzgqIgNpvFciYKOCEXAk6GWhBHrD8dr
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="228658629"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; 
   d="scan'208";a="228658629"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2022 02:32:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; 
   d="scan'208";a="499158093"
Received: from lkp-server01.sh.intel.com (HELO 9dd77a123018) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 07 Feb 2022 02:32:17 -0800
Received: from kbuild by 9dd77a123018 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nH1Jh-0000PM-9R; Mon, 07 Feb 2022 10:32:17 +0000
Date: Mon, 7 Feb 2022 18:31:38 +0800
From: kernel test robot <lkp@intel.com>
To: Badhri Jagan Sridharan <badhri@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v1 2/2] usb: typec: tcpm: Enable limit_src_current_set
 callback
Message-ID: <202202071805.JWYS6D5m-lkp@intel.com>
References: <20220207043907.2758424-2-badhri@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220207043907.2758424-2-badhri@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Badhri,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on linus/master v5.17-rc3 next-20220207]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Badhri-Jagan-Sridharan/usb-typec-Introduce-typec-attributes-for-limiting-source-current/20220207-141625
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
config: i386-randconfig-a006-20220207 (https://download.01.org/0day-ci/archive/20220207/202202071805.JWYS6D5m-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0d8850ae2cae85d49bea6ae0799fa41c7202c05c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/3b7afb6baa84baf8d1d27a46425095017772e87b
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Badhri-Jagan-Sridharan/usb-typec-Introduce-typec-attributes-for-limiting-source-current/20220207-141625
        git checkout 3b7afb6baa84baf8d1d27a46425095017772e87b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/usb/typec/tcpm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/usb/typec/tcpm/tcpm.c:5919:5: warning: no previous prototype for function 'tcpm_update_source_capabilities_locked' [-Wmissing-prototypes]
   int tcpm_update_source_capabilities_locked(struct tcpm_port *port)
       ^
   drivers/usb/typec/tcpm/tcpm.c:5919:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int tcpm_update_source_capabilities_locked(struct tcpm_port *port)
   ^
   static 
   1 warning generated.


vim +/tcpm_update_source_capabilities_locked +5919 drivers/usb/typec/tcpm/tcpm.c

  5918	
> 5919	int tcpm_update_source_capabilities_locked(struct tcpm_port *port)
  5920	{
  5921		int ret = 0;
  5922	
  5923		switch (port->state) {
  5924		case SRC_UNATTACHED:
  5925		case SRC_ATTACH_WAIT:
  5926		case SRC_TRYWAIT:
  5927			tcpm_set_cc(port, tcpm_rp_cc(port));
  5928			break;
  5929		case SRC_SEND_CAPABILITIES:
  5930		case SRC_NEGOTIATE_CAPABILITIES:
  5931		case SRC_READY:
  5932		case SRC_WAIT_NEW_CAPABILITIES:
  5933			port->upcoming_state = SRC_SEND_CAPABILITIES;
  5934			ret = tcpm_ams_start(port, POWER_NEGOTIATION);
  5935			if (ret == -EAGAIN) {
  5936				port->upcoming_state = INVALID_STATE;
  5937				break;
  5938			}
  5939			break;
  5940		default:
  5941			break;
  5942		}
  5943		return ret;
  5944	}
  5945	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
