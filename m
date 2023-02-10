Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844AA624;
	Fri, 10 Feb 2023 01:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675994356; x=1707530356;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G9Lcx3FnINMmOlyeSeP/pVV0yaB2mrasmLWakZilSfY=;
  b=Y1xrmfbz3q5o5/AhbVCJxwI8o30Xssrw49Rc/RfnF7UtB2Jk7HZFmPUj
   drjobXC+4swSG7E1ujh7DZLiBR6yyNGZnVeBwbtRg4+c06HdAIiyONby3
   g+h4ID7iDjausvoLpittyOl6oNlZdOLMkocteSWE+VtVBOeKUS3knjKHD
   4lN96SYHdOZp/rXEitUL1fye2ssjVnwo1GcGVys6vmQlgaP8qK5/NWxVe
   qvfG1Ty7h4CSyVj8b88H4E91Uh7lqVcq6zI/64paxAuYsdXtzePnMzk/E
   LaIpadz0LyQ2ASxNRiEJ62Fbz2hBTyA25p4xgAAcBiLsP8P3JOaBnDTRr
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="392709642"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="392709642"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 17:59:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="791808078"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="791808078"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 09 Feb 2023 17:59:14 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQIgz-0005RU-2y;
	Fri, 10 Feb 2023 01:59:13 +0000
Date: Fri, 10 Feb 2023 09:58:25 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/1] v4l: async: Add some debug prints
Message-ID: <202302100915.9sd03PJI-lkp@intel.com>
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
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20230210/202302100915.9sd03PJI-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e7f54a8293c1023ad1d5c5cd757278037d55088f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sakari-Ailus/v4l-async-Add-some-debug-prints/20230210-061721
        git checkout e7f54a8293c1023ad1d5c5cd757278037d55088f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302100915.9sd03PJI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/v4l2-core/v4l2-async.c:276:5: error: implicit declaration of function 'deb_dbg' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                                   deb_dbg(subdev_notifier->sd->dev,
                                   ^
>> drivers/media/v4l2-core/v4l2-async.c:290:1: error: function definition is not allowed here
   {
   ^
>> drivers/media/v4l2-core/v4l2-async.c:319:1: error: function declared in block scope cannot have 'static' storage class
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
   20 errors generated.


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
   284	/*
   285	 * Complete the master notifier if possible. This is done when all async
   286	 * sub-devices have been bound; v4l2_device is also available then.
   287	 */
   288	static int
   289	v4l2_async_nf_try_complete(struct v4l2_async_notifier *notifier)
 > 290	{
   291		/* Quick check whether there are still more sub-devices here. */
   292		if (!list_empty(&notifier->waiting))
   293			return 0;
   294	
   295		if (notifier->sd)
   296			deb_dbg(notifier->sd->dev, "trying to complete\n");
   297	
   298		/* Check the entire notifier tree; find the root notifier first. */
   299		while (notifier->parent)
   300			notifier = notifier->parent;
   301	
   302		/* This is root if it has v4l2_dev. */
   303		if (!notifier->v4l2_dev) {
   304			if (notifier->sd)
   305				deb_dbg(notifier->sd->dev,
   306					"V4L2 device not available\n");
   307			return 0;
   308		}
   309	
   310		/* Is everything ready? */
   311		if (!v4l2_async_nf_can_complete(notifier))
   312			return 0;
   313	
   314		deb_dbg(notifier->sd->dev, "complete\n");
   315	
   316		return v4l2_async_nf_call_complete(notifier);
   317	}
   318	
 > 319	static int
   320	v4l2_async_nf_try_all_subdevs(struct v4l2_async_notifier *notifier);
   321	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
