Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC082C82
	for <llvm@lists.linux.dev>; Mon, 27 Dec 2021 11:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640603160; x=1672139160;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=uB7gujBweGOO/CygV/S5OsSiqY/Uc3Tj2LIPSFRXRqk=;
  b=A83QPGc7L2AKRU1YSSafDdBkPwXMQlZDyFig8fYvELChwcKxCo/OK0Fy
   zeHd1i8pTNrH8/9ABvV6P5P8JkA5PchipZ97ZkB7+Pxk1eGiDwDaL6jck
   bUi+PLt6B+uLcSqygXMj8SLJGewvtjJ/1YdH27d6mSyhOkH16CYE3e1HG
   Zxh0BKYhydccCoiR/dmq66ArHcjF4puT3akNsoQu+l0nKkfvEJR2GnNnD
   XihTDbx4hKTVJEspzroAWxYBSDHL1OVwAbiol7bjtSLFZBaHVcK43XWXp
   0G98IavL7228F36aJlgpOg8FMYXWvS3zKbD02XCe6lesiPy6xJYl/wCSt
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10209"; a="265417222"
X-IronPort-AV: E=Sophos;i="5.88,239,1635231600"; 
   d="scan'208";a="265417222"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2021 03:05:59 -0800
X-IronPort-AV: E=Sophos;i="5.88,239,1635231600"; 
   d="scan'208";a="553755221"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2021 03:05:57 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with ESMTP id 3F6592036B;
	Mon, 27 Dec 2021 13:05:55 +0200 (EET)
Date: Mon, 27 Dec 2021 13:05:55 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [linux-next:master 838/9897] ERROR: modpost:
 "v4l2_async_register_subdev" [drivers/staging/media/max96712/max96712.ko]
 undefined!
Message-ID: <YcmeE4SMXEIzcrK5@paasikivi.fi.intel.com>
References: <202112260753.8orwHSlb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202112260753.8orwHSlb-lkp@intel.com>

On Sun, Dec 26, 2021 at 07:36:24AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   ea586a076e8aa606c59b66d86660590f18354b11
> commit: 5814f32fef137e34577c4f053272c53e7ca33cd9 [838/9897] media: staging: max96712: Add basic support for MAX96712 GMSL2 deserializer
> config: i386-randconfig-a012-20211226 (https://download.01.org/0day-ci/archive/20211226/202112260753.8orwHSlb-lkp@intel.com/config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project a9e8b1ee7fd44b53c555a7823ae8fd1a8209c520)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=5814f32fef137e34577c4f053272c53e7ca33cd9
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 5814f32fef137e34577c4f053272c53e7ca33cd9
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> Note: the linux-next/master HEAD ea586a076e8aa606c59b66d86660590f18354b11 builds fine.
>       It may have been fixed somewhere.
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> >> ERROR: modpost: "v4l2_async_register_subdev" [drivers/staging/media/max96712/max96712.ko] undefined!
> >> ERROR: modpost: "v4l2_ctrl_handler_free" [drivers/staging/media/max96712/max96712.ko] undefined!
> >> ERROR: modpost: "v4l2_ctrl_new_std_menu_items" [drivers/staging/media/max96712/max96712.ko] undefined!
> >> ERROR: modpost: "v4l2_ctrl_new_std" [drivers/staging/media/max96712/max96712.ko] undefined!
> >> ERROR: modpost: "v4l2_ctrl_handler_init_class" [drivers/staging/media/max96712/max96712.ko] undefined!
> >> ERROR: modpost: "v4l2_fwnode_endpoint_parse" [drivers/staging/media/max96712/max96712.ko] undefined!
> >> ERROR: modpost: "v4l2_async_unregister_subdev" [drivers/staging/media/max96712/max96712.ko] undefined!

This is fixed by:

commit 8cc464fdcaaef1a38423c79c29df96db397d8b69
Author: Sakari Ailus <sakari.ailus@linux.intel.com>
Date:   Fri Nov 26 09:04:42 2021 +0100

    media: max96712: Depend on VIDEO_V4L2
    
    Depend on VIDEO_V4L2 for the driver actually depends on it, failing to
    compile otherwise.
    
    Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
    Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
    Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
    Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> 
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
>    Depends on MEDIA_SUPPORT && VIDEO_DEV && MEDIA_CONTROLLER
>    Selected by
>    - VIDEO_MAX96712 && STAGING && STAGING_MEDIA && MEDIA_SUPPORT && I2C && OF_GPIO
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

-- 
Sakari Ailus
