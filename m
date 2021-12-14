Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F025129CA
	for <llvm@lists.linux.dev>; Tue, 14 Dec 2021 04:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639454831; x=1670990831;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=idGga7JHsTTNGwOM4gkNNjAONgZTkfZEFF35dWQ/gXI=;
  b=h+/NnoECuYqWDP8cljV9aHcCho+WQ9qejjNwGRgpNcBVeQ3evlk3S2e+
   L75KS2BDWuiKPsMge5pqD42FDXZ/vXHtLqGo1SaDq6QVffKwvjK2ew8BF
   ZF6Ay4nBehNbfwCMZyzEu5RrnmMcZ2jIX5qrWvjf7B8QmrwZrxpM/0mwa
   hNXJ0VrbkgdsHpyGcx19wlNVkXZhM8o6ra9fJ7H0DIhR1jLcqSDeeMG5t
   wppkoz2rYrbODBwYBHCU1zfdUE4D/7DERgSa2v2d4Jue2jxarq2/ui/P/
   4nmTDhr9B4RHxkTDjUO+ek6ADMStgF5nUf7QJ0eE+zxhmyDwz5ea6hQJt
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="238838882"
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600"; 
   d="scan'208";a="238838882"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2021 20:07:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600"; 
   d="scan'208";a="754693591"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 13 Dec 2021 20:07:08 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mwz5o-0007QA-1K; Tue, 14 Dec 2021 04:07:08 +0000
Date: Tue, 14 Dec 2021 12:06:44 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Scally <djrscally@gmail.com>, linux-media@vger.kernel.org,
	libcamera-devel@lists.libcamera.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
	hanlinchen@chromium.org, tfiga@chromium.org, hdegoede@redhat.com,
	kieran.bingham@ideasonboard.com, hpa@redhat.com
Subject: Re: [PATCH 4/5] media: entity: Add support for ancillary links
Message-ID: <202112141239.xdqTNOOD-lkp@intel.com>
References: <20211213232849.40071-5-djrscally@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211213232849.40071-5-djrscally@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Daniel,

I love your patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on v5.16-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Daniel-Scally/Introduce-ancillary-links/20211214-073020
base:   git://linuxtv.org/media_tree.git master
config: i386-buildonly-randconfig-r003-20211213 (https://download.01.org/0day-ci/archive/20211214/202112141239.xdqTNOOD-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2ddb6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/627c8446267d301ed36953f7e4fa616ab6cb771a
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Daniel-Scally/Introduce-ancillary-links/20211214-073020
        git checkout 627c8446267d301ed36953f7e4fa616ab6cb771a
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/media/mc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/mc/mc-entity.c:1062:6: warning: no previous prototype for function 'media_remove_ancillary_link' [-Wmissing-prototypes]
   void media_remove_ancillary_link(struct media_link *link)
        ^
   drivers/media/mc/mc-entity.c:1062:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void media_remove_ancillary_link(struct media_link *link)
   ^
   static 
   drivers/media/mc/mc-entity.c:17:27: warning: unused function 'intf_type' [-Wunused-function]
   static inline const char *intf_type(struct media_interface *intf)
                             ^
   2 warnings generated.


vim +/media_remove_ancillary_link +1062 drivers/media/mc/mc-entity.c

  1061	
> 1062	void media_remove_ancillary_link(struct media_link *link)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
