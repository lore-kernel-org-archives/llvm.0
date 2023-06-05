Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E705328C0A;
	Mon,  5 Jun 2023 23:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686007834; x=1717543834;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LQ/YmNHaOqxHB3zFE5Dw/U8hbSjvEZuD9JaXPGLULFQ=;
  b=juFPoSiVZzsbiQfM2F3dAc62SoYTW8rDNAqtu8AxSDQdl5Nz5QI2N93q
   slIlKRpTSZhN48Cyza2tnhiEntSWGNHNxuUTbwl/0TY4NwP+wEKwtdsvm
   +mRlBckRzXdJtl/VU6CzH0qYXDnP94yUUbSpJjQSi9TM2LF6bUATUajVB
   qaLVE3joBmw36uRD6NeGzpVejzL717B2NCrlB5kzOZ4PqXUoxAbXz0kW0
   teEmAl527kDae/+rPj3SmKSB06WlZJ5qZiBSpJpnNbje0U1hC6An53i48
   mK5w5ItSijhTVLp33Y+LlSkcRC03Ek2/aCR86EazGBJqKilQG8Y8Airtc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="359826342"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="359826342"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 16:30:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="738531797"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="738531797"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 05 Jun 2023 16:30:31 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6Jeg-0004Xx-1a;
	Mon, 05 Jun 2023 23:30:30 +0000
Date: Tue, 6 Jun 2023 07:29:54 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Richard Weinberger <richard@nod.at>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 4/4] ubifs: Convert do_writepage() to take a folio
Message-ID: <202306060727.jUL92Co4-lkp@intel.com>
References: <20230605165029.2908304-5-willy@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605165029.2908304-5-willy@infradead.org>

Hi Matthew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rw-ubifs/next]
[also build test WARNING on linus/master v6.4-rc5 next-20230605]
[cannot apply to rw-ubifs/fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/ubifs-Convert-from-writepage-to-writepages/20230606-005309
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rw/ubifs.git next
patch link:    https://lore.kernel.org/r/20230605165029.2908304-5-willy%40infradead.org
patch subject: [PATCH 4/4] ubifs: Convert do_writepage() to take a folio
config: i386-randconfig-i001-20230605 (https://download.01.org/0day-ci/archive/20230606/202306060727.jUL92Co4-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/4f6ac0962f61cc07c95177f78cf1f3b03e79d822
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Matthew-Wilcox-Oracle/ubifs-Convert-from-writepage-to-writepages/20230606-005309
        git checkout 4f6ac0962f61cc07c95177f78cf1f3b03e79d822
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/ubifs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306060727.jUL92Co4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ubifs/file.c:905:15: warning: variable 'i' set but not used [-Wunused-but-set-variable]
           int err = 0, i, blen;
                        ^
   1 warning generated.


vim +/i +905 fs/ubifs/file.c

1e51764a3c2ac0 Artem Bityutskiy        2008-07-14  902  
4f6ac0962f61cc Matthew Wilcox (Oracle  2023-06-05  903) static int do_writepage(struct folio *folio, size_t len)
1e51764a3c2ac0 Artem Bityutskiy        2008-07-14  904  {
1e51764a3c2ac0 Artem Bityutskiy        2008-07-14 @905  	int err = 0, i, blen;
1e51764a3c2ac0 Artem Bityutskiy        2008-07-14  906  	unsigned int block;
1e51764a3c2ac0 Artem Bityutskiy        2008-07-14  907  	void *addr;
4f6ac0962f61cc Matthew Wilcox (Oracle  2023-06-05  908) 	size_t offset = 0;
1e51764a3c2ac0 Artem Bityutskiy        2008-07-14  909  	union ubifs_key key;
4f6ac0962f61cc Matthew Wilcox (Oracle  2023-06-05  910) 	struct inode *inode = folio->mapping->host;
1e51764a3c2ac0 Artem Bityutskiy        2008-07-14  911  	struct ubifs_info *c = inode->i_sb->s_fs_info;
1e51764a3c2ac0 Artem Bityutskiy        2008-07-14  912  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
