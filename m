Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F041FD1
	for <llvm@lists.linux.dev>; Tue, 12 Apr 2022 16:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649781159; x=1681317159;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P66e4gojOVMBKxSt1qupuHDJXLtN+UPi+7Xzg41aZrw=;
  b=CDHh+bR0+TfrJk1nXTdQtUJpiWPKCr2pxz1CBykVKv2uMp78VQknDt12
   vPXXDS70v6vM/0RVDGrso8VsOisSEPZ9MoMVbtvAIkxBXjTLbKxZGEoeS
   W/DOxdDgoQxBr/h9jOWGmm9xQmgdSg/Kwc33APd+TTi6UOvmeKr9XJ/2x
   w6nMqKIq3/DmDYJ4xzNSPEgI7mXd/ZCdDe+VIpYBtCrf+4lyhUetnsm87
   9JFYspVInUhEVP7rkPsJoJgmSZu4lm5bP6JRP06B5gaYvjsrTmnn8qOB0
   n79Vq90JPkknO9RPOa4tc5KOeZqDv6HsZnvPhP/fjVjr9K74NbkbR5BAH
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="242368546"
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; 
   d="scan'208";a="242368546"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2022 09:17:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; 
   d="scan'208";a="559390278"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 12 Apr 2022 09:17:20 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1neJCh-0002z1-4l;
	Tue, 12 Apr 2022 16:17:19 +0000
Date: Wed, 13 Apr 2022 00:16:42 +0800
From: kernel test robot <lkp@intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Benson Leung <bleung@google.com>,
	Prashant Malani <pmalani@chromium.org>,
	Jameson Thies <jthies@google.com>,
	"Regupathy, Rajaram" <rajaram.regupathy@intel.com>,
	Guenter Roeck <linux@roeck-us.net>, Won Chung <wonchung@google.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] usb: typec: USB Power Deliver helpers for ports
 and partners
Message-ID: <202204130028.O6wRGxzY-lkp@intel.com>
References: <20220412130023.83927-3-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220412130023.83927-3-heikki.krogerus@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Heikki,

I love your patch! Perhaps something to improve:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on chrome-platform/for-next v5.18-rc2 next-20220412]
[cannot apply to balbi-usb/testing/next peter-chen-usb/for-usb-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Heikki-Krogerus/usb-typec-Separate-sysfs-directory-for-all-USB-PD-objects/20220412-211628
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
config: hexagon-buildonly-randconfig-r005-20220412 (https://download.01.org/0day-ci/archive/20220413/202204130028.O6wRGxzY-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fe2478d44e4f7f191c43fef629ac7a23d0251e72)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/98fece77872792e49f1005617761a533089f319d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Heikki-Krogerus/usb-typec-Separate-sysfs-directory-for-all-USB-PD-objects/20220412-211628
        git checkout 98fece77872792e49f1005617761a533089f319d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/usb/typec/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/usb/typec/class.c:30:27: warning: unused variable 'cap_name' [-Wunused-const-variable]
   static const char * const cap_name[] = {
                             ^
   1 warning generated.


vim +/cap_name +30 drivers/usb/typec/class.c

    29	
  > 30	static const char * const cap_name[] = {
    31		[TYPEC_SINK]		= "sink-capabilities",
    32		[TYPEC_SOURCE]		= "source-capabilities",
    33	};
    34	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
