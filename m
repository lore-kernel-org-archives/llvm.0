Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794101802;
	b=ziBpkyiAzfz4Wem8Gxcgfub0d/vP1IeeMpcK9/xcq6AZxwkQdWAkDIDDJMwg7oDp9PD6
	 FczvDiG4Wbsx4NGVADvUoJBrxN5HWXKUqNu28TL27CWirjMiusTP6k7VatIoM9l2inAeJ
	 IO88HVh8L+BhbwG3TBxzwKRNmcddTefNjMR3FI7wsatgCtxuam1QGiqb0IsXyPftvY3F3
	 hN8J4vTiTHKOxsN9jCQWy5ZG1afpqm9MvR0dcIUzviF8fkQ0looYy5Rqb9FRcMPzfpjAi
	 ytYY5zD5DDvTLDZam1wqGT9QRHjg81U53JXjc1iWs/u9Gu6FmTeoiYJMHF+7wY66lRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794101802;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=zF3Gxv5mNvsoF0jBmnl43ffjhA6CkmbaNScKmRFBOeY=;
	b=BwN5kodsp9CHs0QD3aniZRMT/c98VXJl2Z51kxpHPrKeV9zt2rLKmW6f8f5tGbrKOhcN
	 /GoudJkZUTVX6d3TzjNXzrNTgGDEb4QUJPaKsmFycT+GHnYzjuhpBYIV5klw9QoZnDBug
	 pLlPoRxSQai1jIfICur3T8M9BX+WM/qXtAXGzu5gmkWw1mzKwA+4o+pznMMp7KDYIBRFI
	 hWEXtEUAk6de/7vrr4o0it1+OerBIrG4WI9lvBqTNV5Mvw6+/pTXJC3eKtPqfc8xMYZ+p
	 ikNHY9tBMYKLGJgUN09SfWjvQvS+7bL60ldb3QN2WAFV04d+gvkCwX62ljxcNCgCUNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GtuieLeI;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EE7606A330;
	Sun,  8 Nov 2026 01:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52EE7606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GtuieLeI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794101800; x=1825637800;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BOHxs0N36neXsxcIO83qLPTK6oCogbPnkM8eMU4sIDE=;
  b=GtuieLeIeztxsmvmND8NH18tw12ydxHTVRG6RF/fWp5E8CBCtJyyKLnB
   if2YJFklB2iNKUX3C1zw1pbUDqkR10ZbpbemdmtcbtgReYbiWdMEJX5oV
   P5UaN5P0M+3cA74Q+Knpu4hCwnyinCP1hfnYdy7HQigwpv0cT580zJ+H1
   wT1WzeZ89A9o3STqzlDMeVIFCkVHPYHunKk7TJ0kL+UxNPH2SxhWLhSQk
   mePtO64qubDrq/my+6FN8hEXl/tAaCpcYf4Ay8CmK5iDRClZw6OyS6CJb
   hDUI//+yTdz1R12TKHrxyNIN6aUbO6bXwbKpeLwqmWfxcY4QaJcUS1jeO
   g==;
X-CSE-ConnectionGUID: rATbSoM1QGiwKllvKB15tA==
X-CSE-MsgGUID: nQczE5+HSgSSzuFHhhRT3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2765149"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2765149"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 17:36:39 -0800
X-CSE-ConnectionGUID: xhsdsWCQR2SbJEixjPOIrA==
X-CSE-MsgGUID: 2QXC4M2nR3CkvvjnF0r9FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7750550"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Nov 2026 17:36:37 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPrpj-00000000rtb-2e2r;
	Sun, 08 Nov 2026 01:36:35 +0000
Date: Sun, 8 Nov 2026 09:36:22 +0800
From: kernel test robot <lkp@intel.com>
To: Phillip Lougher <phillip@squashfs.org.uk>, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Phillip Lougher <phillip@squashfs.org.uk>
Subject: Re: [PATCH 10/18] Squashfs: sanity check directory metadata block
 location
Message-ID: <202611080942.VKgPZf4A-lkp@intel.com>
References: <20261107052843.725239-11-phillip@squashfs.org.uk>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261107052843.725239-11-phillip@squashfs.org.uk>

Hi Phillip,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on linus/master v7.4-rc1]
[cannot apply to akpm-mm/mm-everything next-20261105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Phillip-Lougher/Squashfs-convert-SQUASHFS_COMPRESSED_-to-inline-functions/20261107-052826
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20261107052843.725239-11-phillip%40squashfs.org.uk
patch subject: [PATCH 10/18] Squashfs: sanity check directory metadata block location
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20261108/202611080942.VKgPZf4A-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project fc9576e3b179738d99c5babe5cd9d6c1f883e0db)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611080942.VKgPZf4A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611080942.VKgPZf4A-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/squashfs/namei.c:141:6: warning: variable 'dire' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     141 |         if (block < 0)
         |             ^~~~~~~~~
   fs/squashfs/namei.c:231:8: note: uninitialized use occurs here
     231 |         kfree(dire);
         |               ^~~~
   fs/squashfs/namei.c:141:2: note: remove the 'if' if its condition is always false
     141 |         if (block < 0)
         |         ^~~~~~~~~~~~~~
     142 |                 goto data_error;
         |                 ~~~~~~~~~~~~~~~
   fs/squashfs/namei.c:133:33: note: initialize the variable 'dire' to silence this warning
     133 |         struct squashfs_dir_entry *dire;
         |                                        ^
         |                                         = NULL
   1 warning generated.


vim +141 fs/squashfs/namei.c

   123	
   124	
   125	static struct dentry *squashfs_lookup(struct inode *dir, struct dentry *dentry,
   126					 unsigned int flags)
   127	{
   128		const unsigned char *name = dentry->d_name.name;
   129		int len = dentry->d_name.len;
   130		struct inode *inode = NULL;
   131		struct squashfs_sb_info *msblk = dir->i_sb->s_fs_info;
   132		struct squashfs_dir_header dirh;
   133		struct squashfs_dir_entry *dire;
   134		u64 block = squashfs_dir_start(squashfs_i(dir)->start, msblk);
   135		int offset = squashfs_i(dir)->offset;
   136		int err, length;
   137		unsigned int dir_count, size;
   138	
   139		TRACE("Entered squashfs_lookup [%llx:%x]\n", squashfs_i(dir)->start, offset);
   140	
 > 141		if (block < 0)
   142			goto data_error;
   143	
   144		dire = kmalloc(sizeof(*dire) + SQUASHFS_NAME_LEN + 1, GFP_KERNEL);
   145		if (dire == NULL) {
   146			ERROR("Failed to allocate squashfs_dir_entry\n");
   147			return ERR_PTR(-ENOMEM);
   148		}
   149	
   150		if (len > SQUASHFS_NAME_LEN) {
   151			err = -ENAMETOOLONG;
   152			goto failed;
   153		}
   154	
   155		length = get_dir_index_using_name(dir->i_sb, &block, &offset,
   156					squashfs_i(dir)->dir_idx_start,
   157					squashfs_i(dir)->dir_idx_offset,
   158					squashfs_i(dir)->dir_idx_cnt, name);
   159	
   160		while (length < i_size_read(dir)) {
   161			/*
   162			 * Read directory header.
   163			 */
   164			err = squashfs_read_metadata(dir->i_sb, &dirh, &block,
   165					&offset, sizeof(dirh));
   166			if (err < 0)
   167				goto read_failure;
   168	
   169			length += sizeof(dirh);
   170	
   171			dir_count = le32_to_cpu(dirh.count) + 1;
   172	
   173			if (dir_count > SQUASHFS_DIR_COUNT)
   174				goto data_error;
   175	
   176			while (dir_count--) {
   177				/*
   178				 * Read directory entry.
   179				 */
   180				err = squashfs_read_metadata(dir->i_sb, dire, &block,
   181						&offset, sizeof(*dire));
   182				if (err < 0)
   183					goto read_failure;
   184	
   185				size = le16_to_cpu(dire->size) + 1;
   186	
   187				/* size should never be larger than SQUASHFS_NAME_LEN */
   188				if (size > SQUASHFS_NAME_LEN)
   189					goto data_error;
   190	
   191				err = squashfs_read_metadata(dir->i_sb, dire->name,
   192						&block, &offset, size);
   193				if (err < 0)
   194					goto read_failure;
   195	
   196				length += sizeof(*dire) + size;
   197	
   198				if (name[0] < dire->name[0])
   199					goto exit_lookup;
   200	
   201				if (len == size && !strncmp(name, dire->name, len)) {
   202					unsigned int blk, off, ino_num;
   203					long long ino;
   204					blk = le32_to_cpu(dirh.start_block);
   205					off = le16_to_cpu(dire->offset);
   206					ino_num = le32_to_cpu(dirh.inode_number) +
   207						(short) le16_to_cpu(dire->inode_number);
   208					ino = squashfs_mkinode(blk, off);
   209	
   210					TRACE("calling squashfs_iget for directory "
   211						"entry %s, inode  %x:%x, %d\n", name,
   212						blk, off, ino_num);
   213	
   214					inode = squashfs_iget(dir->i_sb, ino, ino_num);
   215					goto exit_lookup;
   216				}
   217			}
   218		}
   219	
   220	exit_lookup:
   221		kfree(dire);
   222		return d_splice_alias(inode, dentry);
   223	
   224	data_error:
   225		err = -EIO;
   226	
   227	read_failure:
   228		ERROR("Unable to read directory block [%llx:%x]\n",
   229			squashfs_i(dir)->start, squashfs_i(dir)->offset);
   230	failed:
   231		kfree(dire);
   232		return ERR_PTR(err);
   233	}
   234	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
