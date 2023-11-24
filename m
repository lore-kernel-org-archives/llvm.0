Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754F38F52;
	Fri, 24 Nov 2023 07:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WLj3gLjZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700812653; x=1732348653;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qG4s0c4Fn7QkxCFhL3U8QsYQ813yHHE5QaUmSiBOdoY=;
  b=WLj3gLjZ9n6R4zSg2yYqOXpLOiRVt3KkmWNTHLA/FqCLt67/Y39c1ILT
   3qg6N+8Bzy9ERfTtBu5xt9Q1DUGOV/BlV/prioHH7uPOtKMnWjQ4R6g9P
   4mdWVzFuZrsdfHIJOdhM1JQaqz5TcxdK7PM0VikrgDSWo/bZGEJFwFBdX
   eBkXIW5rRhQnV2fTCaHMdYWOxx3K88UqXUxcdrglcVNRuktGIUKwBZ/UW
   QZbld9N65HujWUC95+c54Ngqo3HvNhaNRrDBct844GRs9gZ5yMOIJzXs7
   ORP9TA9ne2D1lcXyPcGwjTz7gjzCPSsJ/6JuxpAoy6JL4f6C8NpNmLH1s
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="395199288"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="395199288"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 23:57:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="767393118"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="767393118"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 23 Nov 2023 23:57:32 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6R45-0002Ew-2x;
	Fri, 24 Nov 2023 07:57:29 +0000
Date: Fri, 24 Nov 2023 15:56:28 +0800
From: kernel test robot <lkp@intel.com>
To: Zhang Yi <yi.zhang@huaweicloud.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 13/18] ext4: impliment writeback iomap path
Message-ID: <202311241138.EHVuHAFc-lkp@intel.com>
References: <20231123125121.4064694-14-yi.zhang@huaweicloud.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231123125121.4064694-14-yi.zhang@huaweicloud.com>

Hi Zhang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.6]
[cannot apply to tytso-ext4/dev linus/master v6.7-rc2 v6.7-rc1 next-20231124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhang-Yi/ext4-make-ext4_es_lookup_extent-return-the-next-extent-if-not-found/20231124-005707
base:   v6.6
patch link:    https://lore.kernel.org/r/20231123125121.4064694-14-yi.zhang%40huaweicloud.com
patch subject: [PATCH RFC 13/18] ext4: impliment writeback iomap path
config: arm-mmp2_defconfig (https://download.01.org/0day-ci/archive/20231124/202311241138.EHVuHAFc-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311241138.EHVuHAFc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241138.EHVuHAFc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ext4/inode.c:3914:15: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
                            __func__, ioend->io_size >> inode->i_blkbits,
                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/ext4.h:3162:31: note: expanded from macro 'ext4_msg'
           __ext4_msg(sb, level, fmt, ##__VA_ARGS__)
                                 ~~~    ^~~~~~~~~~~
   fs/ext4/inode.c:4083:46: warning: unused variable 'ext4_iomap_aops' [-Wunused-const-variable]
   static const struct address_space_operations ext4_iomap_aops = {
                                                ^
   2 warnings generated.


vim +3914 fs/ext4/inode.c

  3889	
  3890	static int ext4_iomap_prepare_ioend(struct iomap_ioend *ioend, int status)
  3891	{
  3892		handle_t *handle = NULL;
  3893		struct inode *inode = ioend->io_inode;
  3894		int rsv_blocks;
  3895		int ret;
  3896	
  3897		if (ioend->io_type != IOMAP_UNWRITTEN)
  3898			return status;
  3899	
  3900		ioend->io_bio->bi_end_io = ext4_iomap_end_bio;
  3901	
  3902		/*
  3903		 * Reserve enough transaction credits for unwritten extent
  3904		 * convert processing in end IO.
  3905		 */
  3906		rsv_blocks = 1 + ext4_chunk_trans_blocks(inode,
  3907					ioend->io_size >> inode->i_blkbits);
  3908		handle = ext4_journal_start_with_reserve(inode,
  3909					EXT4_HT_WRITE_PAGE, 0, rsv_blocks);
  3910		if (IS_ERR(handle)) {
  3911			ret = PTR_ERR(handle);
  3912			ext4_msg(inode->i_sb, KERN_CRIT,
  3913				 "%s: jbd2_start: %ld blocks, ino %lu; err %d\n",
> 3914				 __func__, ioend->io_size >> inode->i_blkbits,
  3915				 inode->i_ino, ret);
  3916			return status ? status : ret;
  3917		}
  3918		if (ext4_handle_valid(handle)) {
  3919			ioend->io_private = handle->h_rsv_handle;
  3920			handle->h_rsv_handle = NULL;
  3921		}
  3922		ext4_journal_stop(handle);
  3923	
  3924		return status;
  3925	}
  3926	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
