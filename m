Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F15DEC0
	for <llvm@lists.linux.dev>; Sun, 12 Jun 2022 13:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655040622; x=1686576622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5LKXzQLCQoh0rjoFQjl+3HcDItBh/kLW3+qqm6Tqcn4=;
  b=NRjoGW8qDgsTQqwM4O+u/OCLehtpIs+JLmR6bobAWA0qf2OXbNXxfR5i
   VNJCBrW90E0RVhpJrlOW3KMGDV8FJos5OeYDfBAtFs2KuRGeZgpaMDzA+
   YnMpMFKhQwnUf9caW1l6649GhwFh41EaMScAALfqRQfVhvONv4n8ukIco
   4eymlMOcommeCDQWJmVRxBG33GyoRbzKzfPJtXCy60CY5abvnpQqoOVu5
   zvG21N9MUDjg6zKf+6/NK78JQlCmpiqRygzgxajbA+UtZ9sxrtq8aZ8Vo
   x6g4lDQzZM1XLEkKB5/S+2r5uRvMRJOP69s44notPftqNDtuZ+fZCZUKC
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10376"; a="339740437"
X-IronPort-AV: E=Sophos;i="5.91,294,1647327600"; 
   d="scan'208";a="339740437"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2022 06:30:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,294,1647327600"; 
   d="scan'208";a="711600792"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 12 Jun 2022 06:30:08 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o0NfL-000Jwb-Uc;
	Sun, 12 Jun 2022 13:30:07 +0000
Date: Sun, 12 Jun 2022 21:29:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	ceph-devel@vger.kernel.org, Xiubo Li <xiubli@redhat.com>
Subject: [ceph-client:testing 7/14] fs/ceph/addr.c:125:2: error: call to
 undeclared function 'VM_WARN_ON_FOLIO'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202206122114.9T6bqADv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ceph/ceph-client.git testing
head:   3e303a58e3a89d254098138aa8488872bf73c9a4
commit: 00043f493521923e81e179ef2e01a47941b07ef2 [7/14] ceph: switch back to testing for NULL folio->private in ceph_dirty_folio
config: hexagon-randconfig-r023-20220612 (https://download.01.org/0day-ci/archive/20220612/202206122114.9T6bqADv-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6466c9abf3674bade1f6ee859f24ebc7aaf9cd88)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ceph/ceph-client/commit/00043f493521923e81e179ef2e01a47941b07ef2
        git remote add ceph-client https://github.com/ceph/ceph-client.git
        git fetch --no-tags ceph-client testing
        git checkout 00043f493521923e81e179ef2e01a47941b07ef2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash fs/ceph/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> fs/ceph/addr.c:125:2: error: call to undeclared function 'VM_WARN_ON_FOLIO'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           VM_WARN_ON_FOLIO(folio->private, folio);
           ^
   1 error generated.


vim +/VM_WARN_ON_FOLIO +125 fs/ceph/addr.c

    74	
    75	/*
    76	 * Dirty a page.  Optimistically adjust accounting, on the assumption
    77	 * that we won't race with invalidate.  If we do, readjust.
    78	 */
    79	static bool ceph_dirty_folio(struct address_space *mapping, struct folio *folio)
    80	{
    81		struct inode *inode;
    82		struct ceph_inode_info *ci;
    83		struct ceph_snap_context *snapc;
    84	
    85		if (folio_test_dirty(folio)) {
    86			dout("%p dirty_folio %p idx %lu -- already dirty\n",
    87			     mapping->host, folio, folio->index);
    88			VM_BUG_ON_FOLIO(!folio_test_private(folio), folio);
    89			return false;
    90		}
    91	
    92		inode = mapping->host;
    93		ci = ceph_inode(inode);
    94	
    95		/* dirty the head */
    96		spin_lock(&ci->i_ceph_lock);
    97		BUG_ON(ci->i_wr_ref == 0); // caller should hold Fw reference
    98		if (__ceph_have_pending_cap_snap(ci)) {
    99			struct ceph_cap_snap *capsnap =
   100					list_last_entry(&ci->i_cap_snaps,
   101							struct ceph_cap_snap,
   102							ci_item);
   103			snapc = ceph_get_snap_context(capsnap->context);
   104			capsnap->dirty_pages++;
   105		} else {
   106			BUG_ON(!ci->i_head_snapc);
   107			snapc = ceph_get_snap_context(ci->i_head_snapc);
   108			++ci->i_wrbuffer_ref_head;
   109		}
   110		if (ci->i_wrbuffer_ref == 0)
   111			ihold(inode);
   112		++ci->i_wrbuffer_ref;
   113		dout("%p dirty_folio %p idx %lu head %d/%d -> %d/%d "
   114		     "snapc %p seq %lld (%d snaps)\n",
   115		     mapping->host, folio, folio->index,
   116		     ci->i_wrbuffer_ref-1, ci->i_wrbuffer_ref_head-1,
   117		     ci->i_wrbuffer_ref, ci->i_wrbuffer_ref_head,
   118		     snapc, snapc->seq, snapc->num_snaps);
   119		spin_unlock(&ci->i_ceph_lock);
   120	
   121		/*
   122		 * Reference snap context in folio->private.  Also set
   123		 * PagePrivate so that we get invalidate_folio callback.
   124		 */
 > 125		VM_WARN_ON_FOLIO(folio->private, folio);
   126		folio_attach_private(folio, snapc);
   127	
   128		return ceph_fscache_dirty_folio(mapping, folio);
   129	}
   130	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
