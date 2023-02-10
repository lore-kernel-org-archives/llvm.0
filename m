Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C62963B;
	Fri, 10 Feb 2023 01:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675991895; x=1707527895;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ll2yXoKA7g4EDQfVpAY2RZFnezn4j169aR6rfZ+443s=;
  b=FN8ildSY+A8L59cATGU/1zUeIY7BRo5Y9qi67XU8uD3KJ9SIw3sXBA3p
   Ivx3rf/IDzDQ2ryaMl2mi17B3oXDboClfe5TXvDJ7ol9t/LEjAefUz2eU
   FjnO5wKsPamkB8hC+x5Gnc+n462SnQ0I1z0brPoX787nQXbVcUL6RQoOs
   CWAzGdUwmr18Sq1YxOUCHqXeyiLohzU8B5utmT30/WV/iP5u0647Ub1OL
   xK1yJzOVv4wF8EZQemI+MTO7nhqiOvCaZyIf/wBJWa2Li26Ni/3h1/3w4
   Rh8nnokTSIMPUfxC/+iop5H8q2e/XeQYXvqT9zfMU1KfcHxveFFHRHhyM
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="318318317"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="318318317"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 17:18:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="791799552"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="791799552"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 09 Feb 2023 17:18:13 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQI3I-0005QD-2m;
	Fri, 10 Feb 2023 01:18:12 +0000
Date: Fri, 10 Feb 2023 09:17:43 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/1] v4l: async: Add some debug prints
Message-ID: <202302100919.j3SFqccW-lkp@intel.com>
References: <20230209221634.35239-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230209221634.35239-1-sakari.ailus@linux.intel.com>

Hi Sakari,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on media-tree/master]
[also build test ERROR on sailus-media-tree/streams soc/for-next linus/master v6.2-rc7 next-20230209]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sakari-Ailus/v4l-async-Add-some-debug-prints/20230210-061721
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230209221634.35239-1-sakari.ailus%40linux.intel.com
patch subject: [RFC 1/1] v4l: async: Add some debug prints
config: hexagon-randconfig-r024-20230209 (https://download.01.org/0day-ci/archive/20230210/202302100919.j3SFqccW-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e7f54a8293c1023ad1d5c5cd757278037d55088f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sakari-Ailus/v4l-async-Add-some-debug-prints/20230210-061721
        git checkout e7f54a8293c1023ad1d5c5cd757278037d55088f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/media/v4l2-core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302100919.j3SFqccW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/v4l2-core/v4l2-async.c:11:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/media/v4l2-core/v4l2-async.c:11:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/media/v4l2-core/v4l2-async.c:11:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/media/v4l2-core/v4l2-async.c:276:5: error: call to undeclared function 'deb_dbg'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                                   deb_dbg(subdev_notifier->sd->dev,
                                   ^
   drivers/media/v4l2-core/v4l2-async.c:290:1: error: function definition is not allowed here
   {
   ^
   drivers/media/v4l2-core/v4l2-async.c:319:1: error: function declared in block scope cannot have 'static' storage class
   static int
   ^
   drivers/media/v4l2-core/v4l2-async.c:324:1: error: function definition is not allowed here
   {
   ^
   drivers/media/v4l2-core/v4l2-async.c:344:1: error: function definition is not allowed here
   {
   ^
   drivers/media/v4l2-core/v4l2-async.c:399:1: error: function definition is not allowed here
   {
   ^
   drivers/media/v4l2-core/v4l2-async.c:436:1: error: function definition is not allowed here
   {
   ^
   drivers/media/v4l2-core/v4l2-async.c:449:1: error: function definition is not allowed here
   {
   ^
   drivers/media/v4l2-core/v4l2-async.c:472:1: error: function definition is not allowed here
   {
   ^
   drivers/media/v4l2-core/v4l2-async.c:499:1: error: function definition is not allowed here
   {
   ^
   drivers/media/v4l2-core/v4l2-async.c:524:1: error: function definition is not allowed here
   {
   ^
   drivers/media/v4l2-core/v4l2-async.c:549:1: error: function definition is not allowed here
   {
   ^
   drivers/media/v4l2-core/v4l2-async.c:555:1: error: function definition is not allowed here
   {
   ^
   drivers/media/v4l2-core/v4l2-async.c:601:1: error: function definition is not allowed here
   {
   ^
   drivers/media/v4l2-core/v4l2-async.c:619:1: error: function definition is not allowed here
   {
   ^
   drivers/media/v4l2-core/v4l2-async.c:637:1: error: function definition is not allowed here
   {
   ^
   drivers/media/v4l2-core/v4l2-async.c:650:1: error: function definition is not allowed here
   {
   ^
   drivers/media/v4l2-core/v4l2-async.c:660:1: error: function definition is not allowed here
   {
   ^
   drivers/media/v4l2-core/v4l2-async.c:682:1: error: function definition is not allowed here
   {
   ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   6 warnings and 20 errors generated.


vim +/deb_dbg +276 drivers/media/v4l2-core/v4l2-async.c

   257	
   258	/*
   259	 * Return true if all child sub-device notifiers are complete, false otherwise.
   260	 */
   261	static bool
   262	v4l2_async_nf_can_complete(struct v4l2_async_notifier *notifier)
   263	{
   264		struct v4l2_subdev *sd;
   265	
   266		if (!list_empty(&notifier->waiting))
   267			return false;
   268	
   269		list_for_each_entry(sd, &notifier->done, async_list) {
   270			struct v4l2_async_notifier *subdev_notifier =
   271				v4l2_async_find_subdev_notifier(sd);
   272	
   273			if (subdev_notifier &&
   274			    !v4l2_async_nf_can_complete(subdev_notifier)) {
   275				if (subdev_notifier->sd)
 > 276					deb_dbg(subdev_notifier->sd->dev,
   277						"cannot complete\n");
   278				return false;
   279		}
   280	
   281		return true;
   282	}
   283	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
