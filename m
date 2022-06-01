Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0F9366
	for <llvm@lists.linux.dev>; Wed,  1 Jun 2022 05:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654062290; x=1685598290;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1sqm3JQDoLDrhWARKDhFVitl2lkVt0q//HmMCX54PtQ=;
  b=gtp9Af0DWhvobvFIK0iZv+pIQets0icuRRp8Jbhvt0l39fC8PPPtrIlk
   ZWUdCFNKdTFok//lFT8orr7RfdC9NwvD5oaWnFWhOV9iI4b2Iv+miOD4h
   xcVSH+p4zWdGY624VSNH1k/Vh8g8e7iQa9BlUH3RPsxbU9JxR3zENbqh9
   os2N8dfzScZJKK8kJWqcfhNJJgw658T1dvcRRUYvT8Srwr7/TNi5+fhLl
   UtZabCPe9UPX3oFq/lRosISxLayROj4CjUpLuQqSyl4mTkV1liIjCB1Z0
   WaAbABF+hemvHhiZJMLM/k11eeWVddF0mguLOCHHqtMRVl5PKmYdgwkn7
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="257551841"
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; 
   d="scan'208";a="257551841"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 22:44:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; 
   d="scan'208";a="904299326"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 31 May 2022 22:44:46 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nwH9y-0003bM-92;
	Wed, 01 Jun 2022 05:44:46 +0000
Date: Wed, 1 Jun 2022 13:44:29 +0800
From: kernel test robot <lkp@intel.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>, ebiederm@xmission.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	chengzhihao1@huawei.com, yukuai3@huawei.com, yi.zhang@huawei.com
Subject: Re: [PATCH v3] proc: Fix a dentry lock race between release_task and
 lookup
Message-ID: <202206011314.dh4oSNjS-lkp@intel.com>
References: <20220601023622.4191510-1-chengzhihao1@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220601023622.4191510-1-chengzhihao1@huawei.com>

Hi Zhihao,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.18 next-20220601]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhihao-Cheng/proc-Fix-a-dentry-lock-race-between-release_task-and-lookup/20220601-102513
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 700170bf6b4d773e328fa54ebb70ba444007c702
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220601/202206011314.dh4oSNjS-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c825abd6b0198fb088d9752f556a70705bc99dfd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/9dfec748ded82f145043dc08a944e1a9af7a640d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Zhihao-Cheng/proc-Fix-a-dentry-lock-race-between-release_task-and-lookup/20220601-102513
        git checkout 9dfec748ded82f145043dc08a944e1a9af7a640d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/proc/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/proc/base.c:1929:15: warning: no previous prototype for function 'proc_pid_make_base_inode' [-Wmissing-prototypes]
   struct inode *proc_pid_make_base_inode(struct super_block *sb,
                 ^
   fs/proc/base.c:1929:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct inode *proc_pid_make_base_inode(struct super_block *sb,
   ^
   static 
   1 warning generated.


vim +/proc_pid_make_base_inode +1929 fs/proc/base.c

  1928	
> 1929	struct inode *proc_pid_make_base_inode(struct super_block *sb,
  1930					       struct task_struct *task, umode_t mode)
  1931	{
  1932		struct inode *inode;
  1933		struct proc_inode *ei;
  1934		struct pid *pid;
  1935	
  1936		inode = proc_pid_make_inode(sb, task, mode);
  1937		if (!inode)
  1938			return NULL;
  1939	
  1940		/* Let proc_flush_pid find this directory inode */
  1941		ei = PROC_I(inode);
  1942		pid = ei->pid;
  1943		spin_lock(&pid->lock);
  1944		hlist_add_head_rcu(&ei->sibling_inodes, &pid->inodes);
  1945		spin_unlock(&pid->lock);
  1946	
  1947		return inode;
  1948	}
  1949	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
