Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E67C3148AC;
	Thu,  8 Jan 2026 19:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767900501; cv=none; b=AIv1xwVqg5bdLnNAu8Rr701lDsLOXC6FPl7+2kZOeL0Q7qdHTycdrbekyS3oZbnPVsnQYFO0vcwvCu3ClsCccYbPPp76cxQJukJZTUbgKYcceCTI6LjvIKtj+zjaA3yDve0NL2fAUjvGAm/hzNxd0/TOevl0WYIy4gNpCF+7F60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767900501; c=relaxed/simple;
	bh=XvOnMQDfOyENr09Rp3L+wfaU/IlpF+7Wa8jhQqykkYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kJ3oJLg8I4mDu964nDSz60O+54uSBxXL2p76c27RBHd0H6FxC6pY8ZXIHFHzV72aJxFEa7u0QYldbE41JOauoBZQusSkYkTotfRHCWsZ00uhRLuleT4q1DC2UIlOz0GXAXEFeD37KAVzlZnFv9vBWwXXumuVqKepwhXasusnU+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VqXJbsTi; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VqXJbsTi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767900499; x=1799436499;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XvOnMQDfOyENr09Rp3L+wfaU/IlpF+7Wa8jhQqykkYw=;
  b=VqXJbsTinXtxdIC/DPod60aryG3rNf4nd/IS0NDA8ILEjKwngX7ueIue
   YcbhIxOvmTHzhIKNCCb2QJa3ynvCXJpxMiEFPhVLVw8DaJ3k1dRrbkRJY
   iKKvoCK/tne3crbS340SlpbiGKSlSfnlctHN2d/w/LXP5oVIlilIilwdC
   Oorc05e/HXmN9sZ9LfhR42ZfDMDtIUsgh48Jrvi87Zc0VN3U8XlowwHnn
   DcQHoaBjgskxcvtqZvg3GpuIDKy2I7Ko9swKupAj/cJ1EQPRPCXAOfcNI
   tDyJ5M8QjRiEQ4AbdKoylmh8er+TxHQuw8L/Cq5CVMu8Q0dRZ7s7+m5fT
   g==;
X-CSE-ConnectionGUID: wixV0FoDSRmzZuIvL1UJBA==
X-CSE-MsgGUID: Ucx0h+QVSFiEw99eAt1cpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="79924894"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="79924894"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 11:28:18 -0800
X-CSE-ConnectionGUID: qBJyqdnhQPWix8HD1d4k7w==
X-CSE-MsgGUID: WqHy0LjERLmZyto7c0vMiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="203717852"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 08 Jan 2026 11:28:12 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdvg2-000000001qS-00W4;
	Thu, 08 Jan 2026 19:28:10 +0000
Date: Thu, 8 Jan 2026 20:27:54 +0100
From: kernel test robot <lkp@intel.com>
To: John Groves <John@groves.net>, Miklos Szeredi <miklos@szeredi.hu>,
	Dan Williams <dan.j.williams@intel.com>,
	Bernd Schubert <bschubert@ddn.com>,
	Alison Schofield <alison.schofield@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jonathan Corbet <corbet@lwn.net>,
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
	Gregory Price <gourry@gourry.net>,
	Aravind Ramesh <arramesh@micron.com>
Subject: Re: [PATCH V3 15/21] famfs_fuse: Create files with famfs fmaps
Message-ID: <202601082047.rhEHIxuL-lkp@intel.com>
References: <20260107153332.64727-16-john@groves.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107153332.64727-16-john@groves.net>

Hi John,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on linus/master v6.19-rc4 next-20260108]
[cannot apply to mszeredi-fuse/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Groves/dax-add-fsdev-c-driver-for-fs-dax-on-character-dax/20260108-013232
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20260107153332.64727-16-john%40groves.net
patch subject: [PATCH V3 15/21] famfs_fuse: Create files with famfs fmaps
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260108/202601082047.rhEHIxuL-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260108/202601082047.rhEHIxuL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601082047.rhEHIxuL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/fuse/famfs.c:83 function parameter 'fmap_buf' not described in 'famfs_fuse_meta_alloc'
>> Warning: fs/fuse/famfs.c:83 function parameter 'fmap_buf_size' not described in 'famfs_fuse_meta_alloc'
>> Warning: fs/fuse/famfs.c:83 function parameter 'fmap_buf' not described in 'famfs_fuse_meta_alloc'
>> Warning: fs/fuse/famfs.c:83 function parameter 'fmap_buf_size' not described in 'famfs_fuse_meta_alloc'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
