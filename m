Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC58B2F41
	for <llvm@lists.linux.dev>; Wed, 10 Aug 2022 17:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660151943; x=1691687943;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LmwbX+mh4uHjDwRRDXV7R/Jr/jLNCB9tPJUFhhiEExg=;
  b=RiEY0YPC6O3XoKj4gGJn9mgmuZEAPRtH+fs07UHdpFhMGID4CzA+cGAe
   R4FVuyc5BMGfHYxANlLaKaPoCPH9fm2qG+jSerJVzcx+vSIDqWfQOOAC1
   i5L7DhXKVKQ8VNjq9ur9d43IJ+vLbGBMIy2zqwJS9eV2qESJNKeSDraVv
   ZmHiqQJvMDqwo4K+r1u98M8yMP/8g7nMUBN11kzANQx0uGniFWX0EtLNJ
   MN5A7rEhQE326o/PPeU/BgcJW7iEUEisJpo6H9fwb5jMbl8HcncCWncq1
   P3KpEJ88EXfJ3mK3Gmvrt2Vv4eQVryunbGhISu2pzXnVJ+bSEWgW4os9X
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10435"; a="271529841"
X-IronPort-AV: E=Sophos;i="5.93,227,1654585200"; 
   d="scan'208";a="271529841"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2022 10:19:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,227,1654585200"; 
   d="scan'208";a="638186837"
Received: from lkp-server02.sh.intel.com (HELO 5d6b42aa80b8) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 10 Aug 2022 10:18:57 -0700
Received: from kbuild by 5d6b42aa80b8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oLpM8-0000WL-2p;
	Wed, 10 Aug 2022 17:18:56 +0000
Date: Thu, 11 Aug 2022 01:18:40 +0800
From: kernel test robot <lkp@intel.com>
To: Bastien Nocera <hadess@hadess.net>, linux-usb@vger.kernel.org,
	bpf@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Peter Hutterer <peter.hutterer@who-t.net>,
	"Eric W . Biederman" <ebiederm@xmission.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Bastien Nocera <hadess@hadess.net>
Subject: Re: [PATCH 1/2] USB: core: add a way to revoke access to open USB
 devices
Message-ID: <202208110108.ilG9Ea14-lkp@intel.com>
References: <20220809094300.83116-2-hadess@hadess.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220809094300.83116-2-hadess@hadess.net>

Hi Bastien,

I love your patch! Perhaps something to improve:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on balbi-usb/testing/next peter-chen-usb/for-usb-next linus/master v5.19 next-20220810]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bastien-Nocera/USB-core-add-a-way-to-revoke-access-to-open-USB-devices/20220809-174609
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
config: arm64-randconfig-r001-20220810 (https://download.01.org/0day-ci/archive/20220811/202208110108.ilG9Ea14-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/6bd6f04e6d463be82fbf45585e4af84925bf1ab9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Bastien-Nocera/USB-core-add-a-way-to-revoke-access-to-open-USB-devices/20220809-174609
        git checkout 6bd6f04e6d463be82fbf45585e4af84925bf1ab9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/usb/core/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/usb/core/devio.c:2649:1: warning: unused label 'out' [-Wunused-label]
   out:
   ^~~~
   1 warning generated.


vim +/out +2649 drivers/usb/core/devio.c

  2627	
  2628	int usb_revoke_for_euid(struct usb_device *udev,
  2629			int euid)
  2630	{
  2631		struct usb_dev_state *ps;
  2632	
  2633		usb_lock_device(udev);
  2634	
  2635		list_for_each_entry(ps, &udev->filelist, list) {
  2636			if (euid >= 0) {
  2637				kuid_t kuid;
  2638	
  2639				if (!ps || !ps->cred)
  2640					continue;
  2641				kuid = ps->cred->euid;
  2642				if (kuid.val != euid)
  2643					continue;
  2644			}
  2645	
  2646			usbdev_revoke(ps);
  2647		}
  2648	
> 2649	out:
  2650		usb_unlock_device(udev);
  2651		return 0;
  2652	}
  2653	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
