Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC8019CD03;
	Sat, 17 Jan 2026 01:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768614102; cv=none; b=AdVi244UNpU70d8bGzBiUzKJh9km2BBphvBoHcvwSD+tLASWsmZ6p+8cRPSTADCZjmMnqBdRQ4mXzGTwxbS8GH9EfFVfIVLtaxdcI9++0yVxLx2/I5OiXUjh3GQ821yNcD1iVtE+aaMxEAc8qz4yhcbp8g8i8+iKjz9U9vJuJvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768614102; c=relaxed/simple;
	bh=65Oeufs+W/s9Urm/cMBhPSNb3wLmLMe+aDB4Wsr7ptg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IsX0kAcIJUHQLTqLBg235HBWo56P8TZcZNZXkCr/XVxt6Xpu45GjpCkgBjKfHNj4pndcuS/bVvhBYafC47t8Z091hTAivKE9BNxdzEnPVswEPR5ymFUAFScf9l3DNqzJCGUluhZDRyUFPcuDtWI4x2rkT2V7wFj9dzyTjZtVsGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bfTKyiRH; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bfTKyiRH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768614101; x=1800150101;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=65Oeufs+W/s9Urm/cMBhPSNb3wLmLMe+aDB4Wsr7ptg=;
  b=bfTKyiRHxPAP/ndLodzt8LgotRTpqgSwAfsZv4ArXuaS1Klzx0q1eg7e
   iIEp5wswN1VbawoL7ZlWwU7sO979goEGNat5sgVEuJFuj8WrO52cFmpBM
   2a8/626S0jckSgwOjP/8np+uFZDklDR83kiJk2R5uPei1G1i5+5ts7xRi
   fiNxMlbiFeAZudk54seZsac5SrVPpSkYWYbxQ9EgnHct3rLSb3g7y4v/P
   +qDs2j54xr5OUNunnBcah0NMskBDhkHGrmMpQLcI1XPgymaQWVBz+eMJs
   0WF1dkGlWdSFRWcEjkolnucIkhGiJzk/1c509VsHlVtiu4qKq5oUMMqre
   A==;
X-CSE-ConnectionGUID: XxQCujEhTM+/wscoN5kYiw==
X-CSE-MsgGUID: W5trCVlOTIa1OsbY7Z19og==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="80649632"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="80649632"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 17:41:40 -0800
X-CSE-ConnectionGUID: uPH9YteEQseVeLleeUPjuQ==
X-CSE-MsgGUID: X1Pm1qY+Rqa/tnQUnB7bKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="205438363"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 16 Jan 2026 17:41:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgvJh-00000000LQy-3vN0;
	Sat, 17 Jan 2026 01:41:29 +0000
Date: Sat, 17 Jan 2026 09:40:39 +0800
From: kernel test robot <lkp@intel.com>
To: John Groves <john@jagalactic.com>, John Groves <John@groves.net>,
	Miklos Szeredi <miklos@szeredi.hu>,
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
	James Morse <james.morse@arm.com>, Fuad Tabba <tabba@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Shivank Garg <shivankg@amd.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Gregory Price <gourry@gourry.net>,
	Aravind Ramesh <arramesh@micron.com>,
	Ajay Joshi <ajayjoshi@micron.com>
Subject: Re: [PATCH V5 15/19] famfs_fuse: Plumb dax iomap and fuse
 read/write/mmap
Message-ID: <202601170925.1qbFpAwE-lkp@intel.com>
References: <0100019bc834ead9-7ed67793-5e18-45f6-80cc-146cfd7d4c8a-000000@email.amazonses.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0100019bc834ead9-7ed67793-5e18-45f6-80cc-146cfd7d4c8a-000000@email.amazonses.com>

Hi John,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mszeredi-fuse/for-next]
[also build test WARNING on brauner-vfs/vfs.all v6.19-rc5]
[cannot apply to linus/master next-20260116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Groves/dax-Factor-out-dax_folio_reset_order-helper/20260117-031401
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git for-next
patch link:    https://lore.kernel.org/r/0100019bc834ead9-7ed67793-5e18-45f6-80cc-146cfd7d4c8a-000000%40email.amazonses.com
patch subject: [PATCH V5 15/19] famfs_fuse: Plumb dax iomap and fuse read/write/mmap
config: s390-defconfig (https://download.01.org/0day-ci/archive/20260117/202601170925.1qbFpAwE-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601170925.1qbFpAwE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601170925.1qbFpAwE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/fuse/famfs.c:610:22: warning: variable 'ext_size' is uninitialized when used within its own initialization [-Wuninitialized]
     610 |                 u64 ext_size = min(ext_size, meta->file_size);
         |                     ~~~~~~~~       ^~~~~~~~
   include/linux/minmax.h:105:38: note: expanded from macro 'min'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                                            ^
   include/linux/minmax.h:98:25: note: expanded from macro '__careful_cmp'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |                                ^
   include/linux/minmax.h:92:13: note: expanded from macro '__careful_cmp_once'
      92 |         auto ux = (x); auto uy = (y);                   \
         |                    ^
   1 warning generated.


vim +/ext_size +610 fs/fuse/famfs.c

   585	
   586	static int
   587	famfs_interleave_fileofs_to_daxofs(struct inode *inode, struct iomap *iomap,
   588				 loff_t file_offset, off_t len, unsigned int flags)
   589	{
   590		struct fuse_inode *fi = get_fuse_inode(inode);
   591		struct famfs_file_meta *meta = fi->famfs_meta;
   592		struct fuse_conn *fc = get_fuse_conn(inode);
   593		loff_t local_offset = file_offset;
   594	
   595		/* This function is only for extent_type INTERLEAVED_EXTENT */
   596		if (meta->fm_extent_type != INTERLEAVED_EXTENT) {
   597			pr_err("%s: bad extent type\n", __func__);
   598			goto err_out;
   599		}
   600	
   601		if (famfs_file_bad(inode))
   602			goto err_out;
   603	
   604		iomap->offset = file_offset;
   605	
   606		for (int i = 0; i < meta->fm_niext; i++) {
   607			struct famfs_meta_interleaved_ext *fei = &meta->ie[i];
   608			u64 chunk_size = fei->fie_chunk_size;
   609			u64 nstrips = fei->fie_nstrips;
 > 610			u64 ext_size = min(ext_size, meta->file_size);
   611	
   612			if (ext_size == 0) {
   613				pr_err("%s: ext_size=%lld file_size=%ld\n",
   614				       __func__, fei->fie_nbytes, meta->file_size);
   615				goto err_out;
   616			}
   617	
   618			/* Is the data is in this striped extent? */
   619			if (local_offset < ext_size) {
   620				u64 chunk_num       = local_offset / chunk_size;
   621				u64 chunk_offset    = local_offset % chunk_size;
   622				u64 chunk_remainder = chunk_size - chunk_offset;
   623				u64 stripe_num      = chunk_num / nstrips;
   624				u64 strip_num       = chunk_num % nstrips;
   625				u64 strip_offset    = chunk_offset + (stripe_num * chunk_size);
   626				u64 strip_dax_ofs = fei->ie_strips[strip_num].ext_offset;
   627				u64 strip_devidx = fei->ie_strips[strip_num].dev_index;
   628	
   629				if (strip_devidx >= fc->dax_devlist->nslots) {
   630					pr_err("%s: strip_devidx %llu >= nslots %d\n",
   631					       __func__, strip_devidx,
   632					       fc->dax_devlist->nslots);
   633					goto err_out;
   634				}
   635	
   636				if (!fc->dax_devlist->devlist[strip_devidx].valid) {
   637					pr_err("%s: daxdev=%lld invalid\n", __func__,
   638						strip_devidx);
   639					goto err_out;
   640				}
   641	
   642				iomap->addr    = strip_dax_ofs + strip_offset;
   643				iomap->offset  = file_offset;
   644				iomap->length  = min_t(loff_t, len, chunk_remainder);
   645	
   646				iomap->dax_dev = fc->dax_devlist->devlist[strip_devidx].devp;
   647	
   648				iomap->type    = IOMAP_MAPPED;
   649				iomap->flags   = flags;
   650	
   651				return 0;
   652			}
   653			local_offset -= ext_size; /* offset is beyond this striped extent */
   654		}
   655	
   656	 err_out:
   657		pr_err("%s: err_out\n", __func__);
   658	
   659		/* We fell out the end of the extent list.
   660		 * Set iomap to zero length in this case, and return 0
   661		 * This just means that the r/w is past EOF
   662		 */
   663		iomap->addr    = 0; /* there is no valid dax device offset */
   664		iomap->offset  = file_offset; /* file offset */
   665		iomap->length  = 0; /* this had better result in no access to dax mem */
   666		iomap->dax_dev = NULL;
   667		iomap->type    = IOMAP_MAPPED;
   668		iomap->flags   = flags;
   669	
   670		return -EIO;
   671	}
   672	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
