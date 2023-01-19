Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF716FC2;
	Thu, 19 Jan 2023 12:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674131216; x=1705667216;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H269WeIV3twGlKdC3pI/QmxkXXeeNvBc5MicwYiQYEc=;
  b=AHvUeoqXHS0zVMCJGSNGEwAxYMPoISZu2nLHpDOoATW1XTOy80YHtUMT
   mbdUtfBNIMHTntZnJcbL5BO2OovA/+pBJ0Cb+JGNBxFTdVdfbGg/hJx5I
   L3ChPk/FfncAPAhvX0Y4yKbIn+3pOKbjBz+ZW2cy05+ihurwbdTDt8oBl
   UpjP66MoOlcXh0vP56UgZ7NwG54MSuEzP6mOOHtAtCNEGDRUzdisTmuyl
   J8AEV0uuvhNuUjARiNj40yZjGO/n+TFMfbku6zdkNUax0Fv9KtaWmdv3n
   5NrWPKG6FxFubIIDYJH411FIQ6cWdKnYzaAnHnMF97jyrVEtQrTQQwUco
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="411509851"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="411509851"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 04:26:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="784050177"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="784050177"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 19 Jan 2023 04:26:55 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIU0H-0001Re-29;
	Thu, 19 Jan 2023 12:26:49 +0000
Date: Thu, 19 Jan 2023 20:26:02 +0800
From: kernel test robot <lkp@intel.com>
To: Zhang Yi <yi.zhang@huaweicloud.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] jbd2: cycled record log on clean journal logging
 area
Message-ID: <202301192010.lD5VIFC1-lkp@intel.com>
References: <20230119034600.3431194-2-yi.zhang@huaweicloud.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119034600.3431194-2-yi.zhang@huaweicloud.com>

Hi Zhang,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on tytso-ext4/dev]
[also build test WARNING on linus/master v6.2-rc4 next-20230119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhang-Yi/jbd2-cycled-record-log-on-clean-journal-logging-area/20230119-131055
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
patch link:    https://lore.kernel.org/r/20230119034600.3431194-2-yi.zhang%40huaweicloud.com
patch subject: [RFC PATCH 1/2] jbd2: cycled record log on clean journal logging area
config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20230119/202301192010.lD5VIFC1-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d06b20c3b83cb41caf3ae4c0fdc0fbae9697dc20
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Zhang-Yi/jbd2-cycled-record-log-on-clean-journal-logging-area/20230119-131055
        git checkout d06b20c3b83cb41caf3ae4c0fdc0fbae9697dc20
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/jbd2/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/jbd2/recovery.c:330:38: warning: format specifies type 'unsigned int' but the argument has type 'unsigned long' [-Wformat]
                     journal->j_transaction_sequence, journal->j_head);
                                                      ^~~~~~~~~~~~~~~
   include/linux/jbd2.h:63:52: note: expanded from macro 'jbd2_debug'
   #define jbd2_debug(n, fmt, a...)  no_printk(fmt, ##a)
                                               ~~~    ^
   include/linux/printk.h:131:17: note: expanded from macro 'no_printk'
                   printk(fmt, ##__VA_ARGS__);             \
                          ~~~    ^~~~~~~~~~~
   include/linux/printk.h:457:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:429:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   1 warning generated.


vim +330 fs/jbd2/recovery.c

   277	
   278	/**
   279	 * jbd2_journal_recover - recovers a on-disk journal
   280	 * @journal: the journal to recover
   281	 *
   282	 * The primary function for recovering the log contents when mounting a
   283	 * journaled device.
   284	 *
   285	 * Recovery is done in three passes.  In the first pass, we look for the
   286	 * end of the log.  In the second, we assemble the list of revoke
   287	 * blocks.  In the third and final pass, we replay any un-revoked blocks
   288	 * in the log.
   289	 */
   290	int jbd2_journal_recover(journal_t *journal)
   291	{
   292		int			err, err2;
   293		journal_superblock_t *	sb;
   294	
   295		struct recovery_info	info;
   296	
   297		memset(&info, 0, sizeof(info));
   298		sb = journal->j_superblock;
   299	
   300		/*
   301		 * The journal superblock's s_start field (the current log head)
   302		 * is always zero if, and only if, the journal was cleanly
   303		 * unmounted.
   304		 */
   305		if (!sb->s_start) {
   306			jbd2_debug(1, "No recovery required, last transaction %d, head block %u\n",
   307				  be32_to_cpu(sb->s_sequence), be32_to_cpu(sb->s_head));
   308			journal->j_transaction_sequence = be32_to_cpu(sb->s_sequence) + 1;
   309			journal->j_head = be32_to_cpu(sb->s_head);
   310			return 0;
   311		}
   312	
   313		err = do_one_pass(journal, &info, PASS_SCAN);
   314		if (!err)
   315			err = do_one_pass(journal, &info, PASS_REVOKE);
   316		if (!err)
   317			err = do_one_pass(journal, &info, PASS_REPLAY);
   318	
   319		jbd2_debug(1, "JBD2: recovery, exit status %d, "
   320			  "recovered transactions %u to %u\n",
   321			  err, info.start_transaction, info.end_transaction);
   322		jbd2_debug(1, "JBD2: Replayed %d and revoked %d/%d blocks\n",
   323			  info.nr_replays, info.nr_revoke_hits, info.nr_revokes);
   324	
   325		/* Restart the log at the next transaction ID, thus invalidating
   326		 * any existing commit records in the log. */
   327		journal->j_transaction_sequence = ++info.end_transaction;
   328		journal->j_head = info.head_block;
   329		jbd2_debug(1, "JBD2: last transaction %d, head block %u\n",
 > 330			  journal->j_transaction_sequence, journal->j_head);
   331	
   332		jbd2_journal_clear_revoke(journal);
   333		err2 = sync_blockdev(journal->j_fs_dev);
   334		if (!err)
   335			err = err2;
   336		/* Make sure all replayed data is on permanent storage */
   337		if (journal->j_flags & JBD2_BARRIER) {
   338			err2 = blkdev_issue_flush(journal->j_fs_dev);
   339			if (!err)
   340				err = err2;
   341		}
   342		return err;
   343	}
   344	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
