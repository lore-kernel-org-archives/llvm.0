Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8872315AC
	for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 22:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647642713; x=1679178713;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zIw54+e45boIaDOdi15UX3ZvBJl8AV/hmlrf8+mVydM=;
  b=gcIC0aVqfhEBNG2vqhTjlqSwMP+C5vS5nGmnPocnf1mSq6YKUxZ6kSbX
   AMsr79E+cXMyvDOZh/480B0JmfRaxLfuXIE4oQqt3yV8kLT65k4uT4tRH
   WI2a6etkB5c9dSDaLcGEdd3ESrwiIuQo4WObSxr/qDob2MbdSOSY7oKLa
   bCd7cQK0YllNS3eAFqBEmusYSXz+z6OEUe+jakgdMwS/EGU2+0JPV+0WM
   Y4FZEQyMwCcEWNJtMg5uEwY0+XvFLaIMiQbDNcZx92AUH1xPF7RAOOP5n
   4Ti7wWSDicX8S7/svh93HmJuSA5mrQ8dbAuIqhjhl/cWezu7RIzeKACGd
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="237849342"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="237849342"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2022 15:31:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="581931749"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 18 Mar 2022 15:31:50 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nVL8Q-000FE6-44; Fri, 18 Mar 2022 22:31:50 +0000
Date: Sat, 19 Mar 2022 06:31:41 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Lassoff <jof@thejof.com>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, Jonathan Lassoff <jof@thejof.com>
Subject: Re: [PATCH v2] Add FAT messages to printk index
Message-ID: <202203190644.dlcQDVaN-lkp@intel.com>
References: <c11c5c259d5e53afe5b20fa761002e7edd48277f.1647624190.git.jof@thejof.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c11c5c259d5e53afe5b20fa761002e7edd48277f.1647624190.git.jof@thejof.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Jonathan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on hnaz-mm/master]
[also build test WARNING on linux/master linus/master v5.17-rc8 next-20220318]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jonathan-Lassoff/Add-FAT-messages-to-printk-index/20220319-012711
base:   https://github.com/hnaz/linux-mm master
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20220319/202203190644.dlcQDVaN-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6e70e4056dff962ec634c5bd4f2f4105a0bef71)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/e3f2c52ef480a29ed0b693801bcd9497c19b89ab
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jonathan-Lassoff/Add-FAT-messages-to-printk-index/20220319-012711
        git checkout e3f2c52ef480a29ed0b693801bcd9497c19b89ab
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/fat/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   fs/fat/misc.c:49: warning: Function parameter or member 'sb' not described in '_fat_msg'
   fs/fat/misc.c:49: warning: Function parameter or member 'level' not described in '_fat_msg'
   fs/fat/misc.c:49: warning: Function parameter or member 'fmt' not described in '_fat_msg'
>> fs/fat/misc.c:49: warning: expecting prototype for fat_msg(). Prototype was for _fat_msg() instead


vim +49 fs/fat/misc.c

^1da177e4c3f41 Linus Torvalds   2005-04-16  43  
81ac21d34a91e8 Oleksij Rempel   2011-04-12  44  /**
81ac21d34a91e8 Oleksij Rempel   2011-04-12  45   * fat_msg() - print preformated FAT specific messages. Every thing what is
81ac21d34a91e8 Oleksij Rempel   2011-04-12  46   * not fat_fs_error() should be fat_msg().
81ac21d34a91e8 Oleksij Rempel   2011-04-12  47   */
e3f2c52ef480a2 Jonathan Lassoff 2022-03-18  48  void _fat_msg(struct super_block *sb, const char *level, const char *fmt, ...)
81ac21d34a91e8 Oleksij Rempel   2011-04-12 @49  {
81ac21d34a91e8 Oleksij Rempel   2011-04-12  50  	struct va_format vaf;
81ac21d34a91e8 Oleksij Rempel   2011-04-12  51  	va_list args;
81ac21d34a91e8 Oleksij Rempel   2011-04-12  52  
81ac21d34a91e8 Oleksij Rempel   2011-04-12  53  	va_start(args, fmt);
81ac21d34a91e8 Oleksij Rempel   2011-04-12  54  	vaf.fmt = fmt;
81ac21d34a91e8 Oleksij Rempel   2011-04-12  55  	vaf.va = &args;
e3f2c52ef480a2 Jonathan Lassoff 2022-03-18  56  	_printk(FAT_PRINTK_PREFIX "%pV\n", level, sb->s_id, &vaf);
81ac21d34a91e8 Oleksij Rempel   2011-04-12  57  	va_end(args);
81ac21d34a91e8 Oleksij Rempel   2011-04-12  58  }
81ac21d34a91e8 Oleksij Rempel   2011-04-12  59  

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
