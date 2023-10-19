Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EACC140;
	Thu, 19 Oct 2023 21:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Md74B/T8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697750913; x=1729286913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tKa4MQ+PBKaXg5BBwkeyeILYw9gKB4mpdkP2+KY/7fw=;
  b=Md74B/T86CrpSUPjWUM38n3Oi5gCmi4Ik+8D0preEVuIBXGc0SomqOya
   5a3V7NeYsMCROyuSnCk1YhZWyZx6cftIm0iFb1GOMH4vx0xt1Q4wv7rjq
   E/e4tzBpNHgJFR3i8DsgpUmzpJnIY2QIVI9IKziPnru704G5Vj0UFA4qj
   bTPoJXVDdaXBWLAFOOL5jIMuSDKpOqgrS4lQoRqZNieyCFSrqxh6nKajA
   0ADwIwdof47IJs5DjsqrENxvNEfWhJsvcr25dBxhFoQyrwf3pFiBGLsHj
   salZ76WJ8AQ7/2QyxJ7mb5f405/JfvnigRHvXAmpBdVi8ccmiL5bmKjTi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="452846782"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="452846782"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 14:28:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="5157592"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Oct 2023 14:28:33 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtaZB-0002cE-0G;
	Thu, 19 Oct 2023 21:28:29 +0000
Date: Fri, 20 Oct 2023 05:27:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 8592/13518] fs/tracefs/event_inode.c:734:10:
 error: casting from randomized structure pointer type 'struct dentry *' to
 'struct eventfs_inode *'
Message-ID: <202310200550.p46bE4w7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4230ea146b1e64628f11e44290bb4008e391bc24
commit: 5790b1fb3d672d9a1fe3881a7181dfdbe741568f [8592/13518] eventfs: Remove eventfs_file and just use eventfs_inode
config: hexagon-randconfig-r001-20230603 (https://download.01.org/0day-ci/archive/20231020/202310200550.p46bE4w7-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310200550.p46bE4w7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310200550.p46bE4w7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/tracefs/event_inode.c:734:10: error: casting from randomized structure pointer type 'struct dentry *' to 'struct eventfs_inode *'
                   return (struct eventfs_inode *)dentry;
                          ^
   fs/tracefs/event_inode.c:909:6: warning: no previous prototype for function 'eventfs_remove_events_dir' [-Wmissing-prototypes]
   void eventfs_remove_events_dir(struct dentry *dentry)
        ^
   fs/tracefs/event_inode.c:909:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void eventfs_remove_events_dir(struct dentry *dentry)
   ^
   static 
   1 warning and 1 error generated.


vim +734 fs/tracefs/event_inode.c

   710	
   711	/**
   712	 * eventfs_create_events_dir - create the top level events directory
   713	 * @name: The name of the top level directory to create.
   714	 * @parent: Parent dentry for this file in the tracefs directory.
   715	 * @entries: A list of entries that represent the files under this directory
   716	 * @size: The number of @entries
   717	 * @data: The default data to pass to the files (an entry may override it).
   718	 *
   719	 * This function creates the top of the trace event directory.
   720	 */
   721	struct eventfs_inode *eventfs_create_events_dir(const char *name, struct dentry *parent,
   722							const struct eventfs_entry *entries,
   723							int size, void *data)
   724	{
   725		struct dentry *dentry = tracefs_start_creating(name, parent);
   726		struct eventfs_inode *ei;
   727		struct tracefs_inode *ti;
   728		struct inode *inode;
   729	
   730		if (security_locked_down(LOCKDOWN_TRACEFS))
   731			return NULL;
   732	
   733		if (IS_ERR(dentry))
 > 734			return (struct eventfs_inode *)dentry;
   735	
   736		ei = kzalloc(sizeof(*ei), GFP_KERNEL);
   737		if (!ei)
   738			goto fail;
   739	
   740		inode = tracefs_get_inode(dentry->d_sb);
   741		if (unlikely(!inode))
   742			goto fail;
   743	
   744		if (size) {
   745			ei->d_children = kzalloc(sizeof(*ei->d_children) * size, GFP_KERNEL);
   746			if (!ei->d_children)
   747				goto fail;
   748		}
   749	
   750		ei->dentry = dentry;
   751		ei->entries = entries;
   752		ei->nr_entries = size;
   753		ei->data = data;
   754		ei->name = kstrdup_const(name, GFP_KERNEL);
   755		if (!ei->name)
   756			goto fail;
   757	
   758		INIT_LIST_HEAD(&ei->children);
   759		INIT_LIST_HEAD(&ei->list);
   760	
   761		ti = get_tracefs(inode);
   762		ti->flags |= TRACEFS_EVENT_INODE | TRACEFS_EVENT_TOP_INODE;
   763		ti->private = ei;
   764	
   765		inode->i_mode = S_IFDIR | S_IRWXU | S_IRUGO | S_IXUGO;
   766		inode->i_op = &eventfs_root_dir_inode_operations;
   767		inode->i_fop = &eventfs_file_operations;
   768	
   769		/* directory inodes start off with i_nlink == 2 (for "." entry) */
   770		inc_nlink(inode);
   771		d_instantiate(dentry, inode);
   772		inc_nlink(dentry->d_parent->d_inode);
   773		fsnotify_mkdir(dentry->d_parent->d_inode, dentry);
   774		tracefs_end_creating(dentry);
   775	
   776		/* Will call dput when the directory is removed */
   777		dget(dentry);
   778	
   779		return ei;
   780	
   781	 fail:
   782		kfree(ei->d_children);
   783		kfree(ei);
   784		tracefs_failed_creating(dentry);
   785		return ERR_PTR(-ENOMEM);
   786	}
   787	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
