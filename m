Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2CE7F
	for <llvm@lists.linux.dev>; Tue,  7 Jun 2022 05:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654578166; x=1686114166;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LPA7h3+IyNIvca/ylIVjR4V0o32O63i1I9Z+FGfIgi0=;
  b=LXjJmo9r0ZFGDIZRQfdiMk5Luy/Gt5Iy0lJ0cOi1fKtlhWNc4v42aObx
   vTZrtFNlMiSiRJthNmuko4aUe70unoEcp7YC8LwAbER0IjjkfJQsXZ91X
   ntWbyEaKEMyImfgjzQSfSDDRobcfOTzuee1qSVUq8xyuPeAmI5WloELDx
   GgNx9BnJUhM4jN4PMlNFY/2BoF2bzIoGG5uoJCDGO+oMLqfTn8xzO+cEY
   XGPmfkp1T+VAaJebMsmY0XVkbr16dFcYh3mNkCqk99k94Jbz2sNbpgHik
   e4265d573osFEIbbWm28vwCc0g68hXM6g2sWE06+plY95ZfKYQ0Pgy1cH
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="257150390"
X-IronPort-AV: E=Sophos;i="5.91,282,1647327600"; 
   d="scan'208";a="257150390"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2022 22:02:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,282,1647327600"; 
   d="scan'208";a="614727226"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 06 Jun 2022 22:02:42 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nyRMX-000DN3-W4;
	Tue, 07 Jun 2022 05:02:41 +0000
Date: Tue, 7 Jun 2022 13:01:49 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver Ford <ojford@gmail.com>, linux-fsdevel@vger.kernel.org,
	jack@suse.cz, amir73il@gmail.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, ojford@gmail.com
Subject: Re: [PATCH 1/1] fs: inotify: Add full paths option to inotify
Message-ID: <202206071212.ER5BjGEI-lkp@intel.com>
References: <20220606224241.25254-2-ojford@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220606224241.25254-2-ojford@gmail.com>

Hi Oliver,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on jack-fs/fsnotify]
[also build test ERROR on linus/master v5.19-rc1 next-20220606]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Oliver-Ford/fs-inotify-Add-full-paths-option-to-inotify/20220607-064615
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git fsnotify
config: hexagon-randconfig-r018-20220607 (https://download.01.org/0day-ci/archive/20220607/202206071212.ER5BjGEI-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b92436efcb7813fc481b30f2593a4907568d917a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/67d0b1ab6f9129e4902f90506f2ab045ddbae43f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Oliver-Ford/fs-inotify-Add-full-paths-option-to-inotify/20220607-064615
        git checkout 67d0b1ab6f9129e4902f90506f2ab045ddbae43f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash fs/notify/inotify/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> fs/notify/inotify/inotify_user.c:219:12: error: call to undeclared function 'inotify_idr_find'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   i_mark = inotify_idr_find(group, event->wd);
                            ^
>> fs/notify/inotify/inotify_user.c:219:10: warning: incompatible integer to pointer conversion assigning to 'struct inotify_inode_mark *' from 'int' [-Wint-conversion]
                   i_mark = inotify_idr_find(group, event->wd);
                          ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/notify/inotify/inotify_user.c:451:35: error: static declaration of 'inotify_idr_find' follows non-static declaration
   static struct inotify_inode_mark *inotify_idr_find(struct fsnotify_group *group,
                                     ^
   fs/notify/inotify/inotify_user.c:219:12: note: previous implicit declaration is here
                   i_mark = inotify_idr_find(group, event->wd);
                            ^
   1 warning and 2 errors generated.


vim +/inotify_idr_find +219 fs/notify/inotify/inotify_user.c

   194	
   195	/*
   196	 * Copy an event to user space, returning how much we copied.
   197	 *
   198	 * We already checked that the event size is smaller than the
   199	 * buffer we had in "get_one_event()" above.
   200	 */
   201	static ssize_t copy_event_to_user(struct fsnotify_group *group,
   202					  struct fsnotify_event *fsn_event,
   203					  char __user *buf)
   204	{
   205		struct inotify_event inotify_event;
   206		struct inotify_event_info *event;
   207		struct path event_path;
   208		struct inotify_inode_mark *i_mark;
   209		size_t event_size = sizeof(struct inotify_event);
   210		size_t name_len;
   211		size_t pad_name_len;
   212	
   213		pr_debug("%s: group=%p event=%p\n", __func__, group, fsn_event);
   214	
   215		event = INOTIFY_E(fsn_event);
   216		/* ensure caller has access to view the full path */
   217		if (event->mask & IN_FULL_PATHS && event->mask & IN_MOVE_SELF &&
   218		    kern_path(event->name, 0, &event_path)) {
 > 219			i_mark = inotify_idr_find(group, event->wd);
   220			if (likely(i_mark)) {
   221				fsnotify_destroy_mark(&i_mark->fsn_mark, group);
   222				/* match ref taken by inotify_idr_find */
   223				fsnotify_put_mark(&i_mark->fsn_mark);
   224			}
   225			return -EACCES;
   226		}
   227	
   228		name_len = event->name_len;
   229		/*
   230		 * round up name length so it is a multiple of event_size
   231		 * plus an extra byte for the terminating '\0'.
   232		 */
   233		pad_name_len = round_event_name_len(fsn_event);
   234		inotify_event.len = pad_name_len;
   235		inotify_event.mask = inotify_mask_to_arg(event->mask);
   236		inotify_event.wd = event->wd;
   237		inotify_event.cookie = event->sync_cookie;
   238	
   239		/* send the main event */
   240		if (copy_to_user(buf, &inotify_event, event_size))
   241			return -EFAULT;
   242	
   243		buf += event_size;
   244	
   245		/*
   246		 * fsnotify only stores the pathname, so here we have to send the pathname
   247		 * and then pad that pathname out to a multiple of sizeof(inotify_event)
   248		 * with zeros.
   249		 */
   250		if (pad_name_len) {
   251			/* copy the path name */
   252			if (copy_to_user(buf, event->name, name_len))
   253				return -EFAULT;
   254			buf += name_len;
   255	
   256			/* fill userspace with 0's */
   257			if (clear_user(buf, pad_name_len - name_len))
   258				return -EFAULT;
   259			event_size += pad_name_len;
   260		}
   261	
   262		return event_size;
   263	}
   264	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
