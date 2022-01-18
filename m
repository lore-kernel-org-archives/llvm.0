Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51E5168
	for <llvm@lists.linux.dev>; Tue, 18 Jan 2022 11:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642504472; x=1674040472;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vCIEMO8vnt+m4PzofXMvxSmuR6Gq6JalXfmkabBSbPM=;
  b=ntQV+VnyzGLi733eT/1+WNO+HcDddNFxPuOeRZ8HIxfAeXS3izDWU8x0
   GP1BE2/OL1k76rZBvOws0J9+DHLQFMmkA4MfPiYC9xR3846T28oUnrtm0
   bmN+T5yUhv35vHIDIqmSvqEt4DEJHIzmh+EvDFxMQljXPI14xMaGK9w6L
   nSwwBWYUyBc7tTcAdVo0IzVoquzvUGOJ1HSN9Got1KvfcyY2Qz+bWMcy3
   c5AImrp1xON0OeGHwuLUzdFj/lcECQ/j/zcR0e195dFq6k2SzxICMAJpE
   5gI4Fu+PCXVojQgSWIXbwqXxh0fKSOQfhPypYo/AxgUKQfBo5Eozbfmpr
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10230"; a="308129784"
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; 
   d="scan'208";a="308129784"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2022 03:14:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,297,1635231600"; 
   d="scan'208";a="517728747"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 18 Jan 2022 03:14:30 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n9mRa-000CVM-4A; Tue, 18 Jan 2022 11:14:30 +0000
Date: Tue, 18 Jan 2022 19:14:10 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Jan Kara <jack@suse.cz>
Subject: fs/notify/fanotify/fanotify_user.c:154:24: warning: variable 'info'
 set but not used
Message-ID: <202201181811.egJXbMCF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e3a8b6a1e70c37702054ae3c7c07ed828435d8ee
commit: 7326e382c21e9c23c89c88369afdc90b82a14da8 fanotify: report old and/or new parent+name in FAN_RENAME event
date:   5 weeks ago
config: hexagon-randconfig-r045-20220117 (https://download.01.org/0day-ci/archive/20220118/202201181811.egJXbMCF-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c10cbb243cafc0cf42c3e922cb29183279444432)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7326e382c21e9c23c89c88369afdc90b82a14da8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 7326e382c21e9c23c89c88369afdc90b82a14da8
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash fs/notify/fanotify/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/notify/fanotify/fanotify_user.c:154:24: warning: variable 'info' set but not used [-Wunused-but-set-variable]
           struct fanotify_info *info;
                                 ^
   1 warning generated.


vim +/info +154 fs/notify/fanotify/fanotify_user.c

7326e382c21e9c Amir Goldstein          2021-11-29  149  
b9928e80dda84b Gabriel Krisman Bertazi 2021-10-25  150  static size_t fanotify_event_len(unsigned int info_mode,
929943b38daf81 Amir Goldstein          2020-07-16  151  				 struct fanotify_event *event)
5e469c830fdb5a Amir Goldstein          2019-01-10  152  {
b9928e80dda84b Gabriel Krisman Bertazi 2021-10-25  153  	size_t event_len = FAN_EVENT_METADATA_LEN;
b9928e80dda84b Gabriel Krisman Bertazi 2021-10-25 @154  	struct fanotify_info *info;
b9928e80dda84b Gabriel Krisman Bertazi 2021-10-25  155  	int fh_len;
929943b38daf81 Amir Goldstein          2020-07-16  156  	int dot_len = 0;
f454fa610a69b9 Amir Goldstein          2020-07-16  157  
b9928e80dda84b Gabriel Krisman Bertazi 2021-10-25  158  	if (!info_mode)
b9928e80dda84b Gabriel Krisman Bertazi 2021-10-25  159  		return event_len;
b9928e80dda84b Gabriel Krisman Bertazi 2021-10-25  160  
130a3c742107ac Gabriel Krisman Bertazi 2021-10-25  161  	if (fanotify_is_error_event(event->mask))
130a3c742107ac Gabriel Krisman Bertazi 2021-10-25  162  		event_len += FANOTIFY_ERROR_INFO_LEN;
130a3c742107ac Gabriel Krisman Bertazi 2021-10-25  163  
b9928e80dda84b Gabriel Krisman Bertazi 2021-10-25  164  	info = fanotify_event_info(event);
b9928e80dda84b Gabriel Krisman Bertazi 2021-10-25  165  
7326e382c21e9c Amir Goldstein          2021-11-29  166  	if (fanotify_event_has_any_dir_fh(event)) {
7326e382c21e9c Amir Goldstein          2021-11-29  167  		event_len += fanotify_dir_name_info_len(event);
d3424c9bac893b Matthew Bobrowski       2021-08-08  168  	} else if ((info_mode & FAN_REPORT_NAME) &&
d3424c9bac893b Matthew Bobrowski       2021-08-08  169  		   (event->mask & FAN_ONDIR)) {
929943b38daf81 Amir Goldstein          2020-07-16  170  		/*
929943b38daf81 Amir Goldstein          2020-07-16  171  		 * With group flag FAN_REPORT_NAME, if name was not recorded in
929943b38daf81 Amir Goldstein          2020-07-16  172  		 * event on a directory, we will report the name ".".
929943b38daf81 Amir Goldstein          2020-07-16  173  		 */
929943b38daf81 Amir Goldstein          2020-07-16  174  		dot_len = 1;
929943b38daf81 Amir Goldstein          2020-07-16  175  	}
afc894c784c84c Jan Kara                2020-03-24  176  
af579beb666aef Matthew Bobrowski       2021-08-08  177  	if (info_mode & FAN_REPORT_PIDFD)
b9928e80dda84b Gabriel Krisman Bertazi 2021-10-25  178  		event_len += FANOTIFY_PIDFD_INFO_HDR_LEN;
af579beb666aef Matthew Bobrowski       2021-08-08  179  
4bd5a5c8e6e5cd Gabriel Krisman Bertazi 2021-10-25  180  	if (fanotify_event_has_object_fh(event)) {
4bd5a5c8e6e5cd Gabriel Krisman Bertazi 2021-10-25  181  		fh_len = fanotify_event_object_fh_len(event);
b9928e80dda84b Gabriel Krisman Bertazi 2021-10-25  182  		event_len += fanotify_fid_info_len(fh_len, dot_len);
4bd5a5c8e6e5cd Gabriel Krisman Bertazi 2021-10-25  183  	}
5e469c830fdb5a Amir Goldstein          2019-01-10  184  
b9928e80dda84b Gabriel Krisman Bertazi 2021-10-25  185  	return event_len;
5e469c830fdb5a Amir Goldstein          2019-01-10  186  }
5e469c830fdb5a Amir Goldstein          2019-01-10  187  

:::::: The code at line 154 was first introduced by commit
:::::: b9928e80dda84b349ba8de01780b9bef2fc36ffa fanotify: Fold event size calculation to its own function

:::::: TO: Gabriel Krisman Bertazi <krisman@collabora.com>
:::::: CC: Jan Kara <jack@suse.cz>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
