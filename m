Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6A82C9C
	for <llvm@lists.linux.dev>; Wed, 12 Jan 2022 13:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641992706; x=1673528706;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T/nZJpDrhFZpXzN0a8FTvEPzmmZJ6uW8zk0Ak+sujE8=;
  b=dl+7t/dIDy5Kz/hY0sjfrQ0i3glDJYtHroc6jrgZ/qI68wwOxRYAzwfS
   H8WswVBMV7Bj97eWyOSlDlGlADeDavZ/nomkqVuENE558AqBiN4m9pQOi
   rCmWgfpoX+Qzops+nOeHNnLEnM44nWFP8fxumPr3zQsfcOL0nSxGWMIa2
   5qCmvRV/Cy37GgXKTtpMvCIVAAmZohxx8dq+QDaqHKs2wrZVvKNkEhcxM
   XXo8W9XKlaWlfsNEZ3YxJxo0xH7S9w0XhyFxs/dD/hMTFhZw4Kw10cnE7
   N5i3e3gxQ43M3B+d9i5MjMcuRBUS58wun72rv0bwTlEPT4IPMTmcgFe7x
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10224"; a="242544977"
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; 
   d="scan'208";a="242544977"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2022 05:04:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; 
   d="scan'208";a="474899818"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 12 Jan 2022 05:04:46 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n7dIz-0005pF-TE; Wed, 12 Jan 2022 13:04:45 +0000
Date: Wed, 12 Jan 2022 21:04:34 +0800
From: kernel test robot <lkp@intel.com>
To: Olga Kornievskaia <kolga@netapp.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Anna Schumaker <Anna.Schumaker@Netapp.com>
Subject: [linux-next:master 11662/12034] fs/nfs/nfs4proc.c:4008:5: warning:
 no previous prototype for function 'nfs4_discover_trunking'
Message-ID: <202201122054.45b1t1el-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   32ce2abb03cfae17a9eb42bd6b1b619b72f23f20
commit: 82ebfb0d633383ee00156e2b5bfa9ddf8c550b65 [11662/12034] NFSv4.1 query for fs_location attr on a new file system
config: i386-randconfig-a011 (https://download.01.org/0day-ci/archive/20220112/202201122054.45b1t1el-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 244dd2913a43a200f5a6544d424cdc37b771028b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=82ebfb0d633383ee00156e2b5bfa9ddf8c550b65
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 82ebfb0d633383ee00156e2b5bfa9ddf8c550b65
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/nfs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/nfs/nfs4proc.c:4008:5: warning: no previous prototype for function 'nfs4_discover_trunking' [-Wmissing-prototypes]
   int nfs4_discover_trunking(struct nfs_server *server, struct nfs_fh *fhandle)
       ^
   fs/nfs/nfs4proc.c:4008:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int nfs4_discover_trunking(struct nfs_server *server, struct nfs_fh *fhandle)
   ^
   static 
   1 warning generated.


vim +/nfs4_discover_trunking +4008 fs/nfs/nfs4proc.c

  4007	
> 4008	int nfs4_discover_trunking(struct nfs_server *server, struct nfs_fh *fhandle)
  4009	{
  4010		struct nfs4_exception exception = {
  4011			.interruptible = true,
  4012		};
  4013		struct nfs_client *clp = server->nfs_client;
  4014		int err = 0;
  4015	
  4016		if (!nfs4_has_session(clp))
  4017			goto out;
  4018		do {
  4019			err = nfs4_handle_exception(server,
  4020					_nfs4_discover_trunking(server, fhandle),
  4021					&exception);
  4022		} while (exception.retry);
  4023	out:
  4024		return err;
  4025	}
  4026	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
