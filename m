Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B82A179
	for <llvm@lists.linux.dev>; Sun, 24 Jul 2022 18:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658685735; x=1690221735;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wlDYF/mA+Dyob8XRa12X+xUPsrRmatzJ8fbOfCTqDPo=;
  b=ZSvxyGieViIZ2/Nu09wn2oWv5TCW5eqZ0MVJUM7b+lR3EeOqxGtNsvr+
   puEmlHW4S9MCjW6bbc7SGR4qK614MJjyi4KT8UbHPPRaQroGC3/sjlJiS
   pox3LEVPRpPOyIuXpOily4B9VhwXQtOJq9KQ5c725Td5Fsj6JdMxcNHzT
   aTElv9TOD9kPfZHH61tYu1CxmcJATPxdr3seVzreTWhjbEvWXrOH5zoJa
   2oUPRRVkkDHI3Z95+LLJPKyld+ugz1sASay5qgQCpSQB4qIJwd2nbYpV0
   1Tz6MrCFBM7iJyRzgOGmSpqjDIcJ/Z8kuDN32T4QhvD/KzFyC6cFx4R9h
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10418"; a="270597436"
X-IronPort-AV: E=Sophos;i="5.93,190,1654585200"; 
   d="scan'208";a="270597436"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2022 11:02:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,190,1654585200"; 
   d="scan'208";a="741595649"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Jul 2022 11:02:12 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oFfvf-000457-29;
	Sun, 24 Jul 2022 18:02:11 +0000
Date: Mon, 25 Jul 2022 02:01:49 +0800
From: kernel test robot <lkp@intel.com>
To: Enzo Matsumiya <ematsumiya@suse.de>, linux-cifs@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, smfrench@gmail.com,
	pc@cjr.nz, ronniesahlberg@gmail.com, nspmangalore@gmail.com
Subject: Re: [PATCH] cifs: split procfs from debug code
Message-ID: <202207250111.xRaRSq5I-lkp@intel.com>
References: <20220724145735.5853-1-ematsumiya@suse.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220724145735.5853-1-ematsumiya@suse.de>

Hi Enzo,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on cifs/for-next]
[also build test ERROR on next-20220722]
[cannot apply to linus/master v5.19-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Enzo-Matsumiya/cifs-split-procfs-from-debug-code/20220724-225846
base:   git://git.samba.org/sfrench/cifs-2.6.git for-next
config: i386-randconfig-a006 (https://download.01.org/0day-ci/archive/20220725/202207250111.xRaRSq5I-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 12fbd2d377e396ad61bce56d71c98a1eb1bebfa9)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a9bbb62b87033fb57943ff221160dbf92e84e297
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Enzo-Matsumiya/cifs-split-procfs-from-debug-code/20220724-225846
        git checkout a9bbb62b87033fb57943ff221160dbf92e84e297
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "cifs_dump_mem" [fs/cifs/cifs.ko] undefined!
>> ERROR: modpost: "cifs_dump_detail" [fs/cifs/cifs.ko] undefined!
--
In file included from fs/cifs/cifssmb.c:31:
>> fs/cifs/debug.h:14:20: warning: function 'cifs_dump_mem' has internal linkage but is not defined [-Wundefined-internal]
static inline void cifs_dump_mem(char *label, void *data, int length);
^
fs/cifs/cifssmb.c:418:2: note: used here
cifs_dump_mem("Invalid transact2 SMB: ", (char *)pSMB,
^
1 warning generated.
--
In file included from fs/cifs/smb1ops.c:13:
>> fs/cifs/debug.h:15:20: warning: function 'cifs_dump_detail' has internal linkage but is not defined [-Wundefined-internal]
static inline void cifs_dump_detail(void *buf, struct TCP_Server_Info *ptcp_info);
^
fs/cifs/smb1ops.c:1172:17: note: used here
.dump_detail = cifs_dump_detail,
^
1 warning generated.
--
fs/cifs/connect.c:2739:24: warning: variable 'saddr4' set but not used [-Wunused-but-set-variable]
struct sockaddr_in *saddr4;
^
In file included from fs/cifs/connect.c:39:
>> fs/cifs/debug.h:14:20: warning: function 'cifs_dump_mem' has internal linkage but is not defined [-Wundefined-internal]
static inline void cifs_dump_mem(char *label, void *data, int length);
^
fs/cifs/connect.c:1054:3: note: used here
cifs_dump_mem("Bad SMB: ", buf,
^
2 warnings generated.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
