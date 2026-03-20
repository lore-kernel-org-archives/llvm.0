Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FCA3B8D61;
	Fri, 20 Mar 2026 13:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774011823; cv=none; b=nqvxofmtDkpHh4UruD6o3Hp/sbWpuJcsEkFlQzgpWG7kLU0WsAd+gTLrT6AXSOk5DBS8ur2CTMmKY/NDAlNmE33dc8gIChc/wRginyj4gpk/WxEPdGOP0VRVyuBsxFGgWM3q6/IJ9YiJMiudXJFSCgHwPPcd0386avc3y0ogdwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774011823; c=relaxed/simple;
	bh=9CF+HuH5bRQeiKr+ZDAWSBXYOepUWT4NlxXBo6FxCcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HRXYZlAoQEJTTmg3WeebUxCR8PDmiGuOO1KXgU50q+8qT0FzkH2xlo3RIYM39B6SZhyOFYyaSnl9vKB1s8n/t7Te1sG9fvjlQxFu7wdKX77fusgk5ZN7MamKZNbP7l1MIBJ+zw28W8YAYPl/VR2zN7VXM9Szej+zD7YDbVRJhWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d7uONVLW; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d7uONVLW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774011820; x=1805547820;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9CF+HuH5bRQeiKr+ZDAWSBXYOepUWT4NlxXBo6FxCcE=;
  b=d7uONVLWb6p79qdQ4sX1BpAneC3kthaUFDJ7x88uIzw+uir1QEGs1ET+
   n70CT5zvs2VfsADn7J8iKOaZCYYZTX9XAIn6CIBEZQN6n6RZrn7iAwuZs
   sJ/eS8oqIjq/9PbCaufi6Kofb0oLb+VAmOfNXi1CR0zrDSvmsp9UjVb1Q
   rS4gXnDEht93lXaPCg5qKiJfRf6Pg6POO9eDbDLqtC0LhcaJ4F/hw16z4
   TEgEp98a4MVKgCP4u8kZD4JPN6yJ+VX5QWcZ4YRDLEReJZa+W3oWRIjZQ
   pVNC895W+SX5k/GLb3xgjIbIHmrzt3oh9u1eWVKdOhuCuJqwTzEXEqqbI
   g==;
X-CSE-ConnectionGUID: BJ3lbMpwSMeMY6WYMqFsFQ==
X-CSE-MsgGUID: xeoWD1OfSO+zBPvwI08cNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="75126429"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="75126429"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 06:03:38 -0700
X-CSE-ConnectionGUID: pjifNspxS76yjGq3EWZmVQ==
X-CSE-MsgGUID: zLMm9RMESqqa+99gNzZuOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="246309675"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 20 Mar 2026 06:03:31 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3ZVh-0000000051x-1mW4;
	Fri, 20 Mar 2026 13:03:29 +0000
Date: Fri, 20 Mar 2026 14:02:47 +0100
From: kernel test robot <lkp@intel.com>
To: John Groves <john@jagalactic.com>, John Groves <John@groves.net>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Dan Williams <dan.j.williams@intel.com>,
	Bernd Schubert <bschubert@ddn.com>,
	Alison Schofield <alison.schofield@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	David Hildenbrand <david@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jeff Layton <jlayton@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Stefan Hajnoczi <shajnocz@redhat.com>,
	Joanne Koong <joannelkoong@gmail.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Chen Linxuan <chenlinxuan@uniontech.com>,
	James Morse <james.morse@arm.com>, Fuad Tabba <tabba@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Shivank Garg <shivankg@amd.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Gregory Price <gourry@gourry.net>
Subject: Re: [PATCH V8 05/10] famfs_fuse: GET_DAXDEV message and daxdev_table
Message-ID: <202603201310.TAKgF3KT-lkp@intel.com>
References: <0100019d06402f14-3a614309-878f-4837-be72-e36fd75d74f6-000000@email.amazonses.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0100019d06402f14-3a614309-878f-4837-be72-e36fd75d74f6-000000@email.amazonses.com>

Hi John,

kernel test robot noticed the following build errors:

[auto build test ERROR on mszeredi-fuse/for-next]
[also build test ERROR on brauner-vfs/vfs.all linus/master v7.0-rc4 next-20260319]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Groves/famfs_fuse-Basic-fuse-kernel-ABI-enablement-for-famfs/20260320-152719
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git for-next
patch link:    https://lore.kernel.org/r/0100019d06402f14-3a614309-878f-4837-be72-e36fd75d74f6-000000%40email.amazonses.com
patch subject: [PATCH V8 05/10] famfs_fuse: GET_DAXDEV message and daxdev_table
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260320/202603201310.TAKgF3KT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603201310.TAKgF3KT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603201310.TAKgF3KT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/fuse/famfs.c:163:18: error: call to undeclared function 'dax_dev_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     163 |                 daxdev->devp = dax_dev_get(daxdev->devno);
         |                                ^
>> fs/fuse/famfs.c:163:16: error: incompatible integer to pointer conversion assigning to 'struct dax_device *' from 'int' [-Wint-conversion]
     163 |                 daxdev->devp = dax_dev_get(daxdev->devno);
         |                              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/dax_dev_get +163 fs/fuse/famfs.c

    90	
    91	/**
    92	 * famfs_fuse_get_daxdev() - Retrieve info for a DAX device from fuse server
    93	 *
    94	 * Send a GET_DAXDEV message to the fuse server to retrieve info on a
    95	 * dax device.
    96	 *
    97	 * @fm:     fuse_mount
    98	 * @index:  the index of the dax device; daxdevs are referred to by index
    99	 *          in fmaps, and the server resolves the index to a particular daxdev
   100	 *
   101	 * Returns: 0=success
   102	 *          -errno=failure
   103	 */
   104	static int
   105	famfs_fuse_get_daxdev(struct fuse_mount *fm, const u64 index)
   106	{
   107		struct fuse_daxdev_out daxdev_out = { 0 };
   108		struct fuse_conn *fc = fm->fc;
   109		struct famfs_daxdev *daxdev;
   110		int rc;
   111	
   112		FUSE_ARGS(args);
   113	
   114		/* Store the daxdev in our table */
   115		if (index >= fc->dax_devlist->nslots) {
   116			pr_err("%s: index(%lld) > nslots(%d)\n",
   117			       __func__, index, fc->dax_devlist->nslots);
   118			return -EINVAL;
   119		}
   120	
   121		args.opcode = FUSE_GET_DAXDEV;
   122		args.nodeid = index;
   123	
   124		args.in_numargs = 0;
   125	
   126		args.out_numargs = 1;
   127		args.out_args[0].size = sizeof(daxdev_out);
   128		args.out_args[0].value = &daxdev_out;
   129	
   130		/* Send GET_DAXDEV command */
   131		rc = fuse_simple_request(fm, &args);
   132		if (rc) {
   133			pr_err("%s: rc=%d from fuse_simple_request()\n",
   134			       __func__, rc);
   135			/* Error will be that the payload is smaller than FMAP_BUFSIZE,
   136			 * which is the max we can handle. Empty payload handled below.
   137			 */
   138			return rc;
   139		}
   140	
   141		scoped_guard(rwsem_write, &fc->famfs_devlist_sem) {
   142			daxdev = &fc->dax_devlist->devlist[index];
   143	
   144			/* Abort if daxdev is now valid (races are possible here) */
   145			if (daxdev->valid) {
   146				pr_debug("%s: daxdev already known\n", __func__);
   147				return 0;
   148			}
   149	
   150			/* Verify dev is valid and can be opened and gets the devno */
   151			rc = famfs_verify_daxdev(daxdev_out.name, &daxdev->devno);
   152			if (rc) {
   153				pr_err("%s: rc=%d from famfs_verify_daxdev()\n",
   154				       __func__, rc);
   155				return rc;
   156			}
   157	
   158			daxdev->name = kstrdup(daxdev_out.name, GFP_KERNEL);
   159			if (!daxdev->name)
   160				return -ENOMEM;
   161	
   162			/* This will fail if it's not a dax device */
 > 163			daxdev->devp = dax_dev_get(daxdev->devno);
   164			if (!daxdev->devp) {
   165				pr_warn("%s: device %s not found or not dax\n",
   166					__func__, daxdev_out.name);
   167				kfree(daxdev->name);
   168				daxdev->name = NULL;
   169				return -ENODEV;
   170			}
   171	
   172			wmb(); /* All other fields must be visible before valid */
   173			daxdev->valid = 1;
   174		}
   175	
   176		return 0;
   177	}
   178	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
