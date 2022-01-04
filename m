Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD2D168
	for <llvm@lists.linux.dev>; Tue,  4 Jan 2022 09:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641288584; x=1672824584;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IF6aBx/wsL2x04BFThSDT/xjTP9UTa9f9ZYFCXBOBZE=;
  b=SAvFlFgRauWlNX7XOxftGsTTcCpn6Z0wioAZTnWnWpDbspcEin2Nd4G/
   1Sg/lqPieJj0TNkueGvMJrKJjv/zgW3rm8I/NxZ1UF/KPKabj/g3IaiHK
   N+R1slS7hWmgPxlEIhCrMdf8g6brH+gVyzLOM4qpYVF7XEEpWM/YJJLFi
   VvRNisheojXHRhFlfaiF7gYxIFj3U9sMOa3NmCso6wwgmyGQobrZVZTnW
   TiR2zk0SiGGNTL70Gm8fWcGXph95yx305YxO5rsMeFelAtSurOBfwYJme
   hh/3YMUzvOOebloTj+YmDNqQPH4+yxqsRG0oFb1BTG7UMcHP2VvteO8P8
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10216"; a="242146651"
X-IronPort-AV: E=Sophos;i="5.88,260,1635231600"; 
   d="scan'208";a="242146651"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2022 01:29:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,260,1635231600"; 
   d="scan'208";a="688508189"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 04 Jan 2022 01:29:42 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n4g8U-000FA9-9l; Tue, 04 Jan 2022 09:29:42 +0000
Date: Tue, 4 Jan 2022 17:29:12 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>
Subject: [mcgrof-next:20210916-firmware-builtin-v2 1565/2476]
 fs/smbfs_client/cifsroot.c:83:12: warning: no previous prototype for
 function 'cifs_root_data'
Message-ID: <202201041758.okbqhT2i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Steve,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git 20210916-firmware-builtin-v2
head:   f69194f4bcf5b301f2d169b2f036c0da4b642e53
commit: b4a8c8f8fa8b7b86bb62257fbb27e7bde58ac97e [1565/2476] cifs: rename fs/cifs directory to fs/smbfs_client
config: x86_64-randconfig-a003-20210928 (https://download.01.org/0day-ci/archive/20220104/202201041758.okbqhT2i-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dc6e8dfdfe7efecfda318d43a06fae18b40eb498)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git/commit/?id=b4a8c8f8fa8b7b86bb62257fbb27e7bde58ac97e
        git remote add mcgrof-next https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git
        git fetch --no-tags mcgrof-next 20210916-firmware-builtin-v2
        git checkout b4a8c8f8fa8b7b86bb62257fbb27e7bde58ac97e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/smbfs_client/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/smbfs_client/cifsroot.c:83:12: warning: no previous prototype for function 'cifs_root_data' [-Wmissing-prototypes]
   int __init cifs_root_data(char **dev, char **opts)
              ^
   fs/smbfs_client/cifsroot.c:83:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __init cifs_root_data(char **dev, char **opts)
   ^
   static 
   1 warning generated.


vim +/cifs_root_data +83 fs/smbfs_client/cifsroot.c

8eecd1c2e5bc73 fs/cifs/cifsroot.c Paulo Alcantara (SUSE  2019-07-16  82) 
8eecd1c2e5bc73 fs/cifs/cifsroot.c Paulo Alcantara (SUSE  2019-07-16 @83) int __init cifs_root_data(char **dev, char **opts)

:::::: The code at line 83 was first introduced by commit
:::::: 8eecd1c2e5bc73d33f3a544751305679dbf88eb4 cifs: Add support for root file systems

:::::: TO: Paulo Alcantara (SUSE) <paulo@paulo.ac>
:::::: CC: Steve French <stfrench@microsoft.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
