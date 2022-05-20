Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A497A
	for <llvm@lists.linux.dev>; Fri, 20 May 2022 02:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653013134; x=1684549134;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2LDGVFgyt3wwnRRC5Qo163Ro/+whgNBtXlwCyPG059o=;
  b=XMQgZPKCiTjGIJLyiUzASnIQUBpVDb+YHwq8xI54sTYqapwevMQoCNRN
   HqjQFJx2Hdc9ql0LSuPpQxs5sgz5PFEsPQoPiDCC/HPxAB9dlCyNTy0In
   ny4qGZ3LW/msYMcRdM/9Bmw1hZb46Jwvd/W90xuJ+t6mBKxWTq3THe8iC
   LwMYWIekgmoTUsLaNbcuxIqsZF/yDFCDNB7VDbF17mgwmisK2uWz5mQlY
   N1XNvYf975gHr2t1d1WxLaWH5mIdLi5bjCvDsZfcjS5Cs1kNkxsU+qISt
   QqEL0NBoqsDchucs42RjJX/Sde4TPE5WNH7adQLD/hKjHl45lZOZl1BMl
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="297764270"
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; 
   d="scan'208";a="297764270"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2022 19:18:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; 
   d="scan'208";a="557224316"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 19 May 2022 19:18:51 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nrsE6-0004BQ-VF;
	Fri, 20 May 2022 02:18:50 +0000
Date: Fri, 20 May 2022 10:18:23 +0800
From: kernel test robot <lkp@intel.com>
To: Kalesh Singh <kaleshsingh@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH] procfs: Add file path and size to /proc/<pid>/fdinfo
Message-ID: <202205201031.8hfAOoam-lkp@intel.com>
References: <20220519214021.3572840-1-kaleshsingh@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220519214021.3572840-1-kaleshsingh@google.com>

Hi Kalesh,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on b015dcd62b86d298829990f8261d5d154b8d7af5]

url:    https://github.com/intel-lab-lkp/linux/commits/Kalesh-Singh/procfs-Add-file-path-and-size-to-proc-pid-fdinfo/20220520-054133
base:   b015dcd62b86d298829990f8261d5d154b8d7af5
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220520/202205201031.8hfAOoam-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e00cbbec06c08dc616a0d52a20f678b8fbd4e304)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/f2c1e6a5785dd09b34671073319c5aba5a94f423
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kalesh-Singh/procfs-Add-file-path-and-size-to-proc-pid-fdinfo/20220520-054133
        git checkout f2c1e6a5785dd09b34671073319c5aba5a94f423
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/proc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/proc/fd.c:61:6: warning: format specifies type 'size_t' (aka 'unsigned int') but the argument has type 'loff_t' (aka 'long long') [-Wformat]
                      file_inode(file)->i_size);
                      ^~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +61 fs/proc/fd.c

    20	
    21	static int seq_show(struct seq_file *m, void *v)
    22	{
    23		struct files_struct *files = NULL;
    24		int f_flags = 0, ret = -ENOENT;
    25		struct file *file = NULL;
    26		struct task_struct *task;
    27	
    28		task = get_proc_task(m->private);
    29		if (!task)
    30			return -ENOENT;
    31	
    32		task_lock(task);
    33		files = task->files;
    34		if (files) {
    35			unsigned int fd = proc_fd(m->private);
    36	
    37			spin_lock(&files->file_lock);
    38			file = files_lookup_fd_locked(files, fd);
    39			if (file) {
    40				struct fdtable *fdt = files_fdtable(files);
    41	
    42				f_flags = file->f_flags;
    43				if (close_on_exec(fd, fdt))
    44					f_flags |= O_CLOEXEC;
    45	
    46				get_file(file);
    47				ret = 0;
    48			}
    49			spin_unlock(&files->file_lock);
    50		}
    51		task_unlock(task);
    52		put_task_struct(task);
    53	
    54		if (ret)
    55			return ret;
    56	
    57		seq_printf(m, "pos:\t%lli\nflags:\t0%o\nmnt_id:\t%i\nino:\t%lu\nsize:\t%zu\n",
    58			   (long long)file->f_pos, f_flags,
    59			   real_mount(file->f_path.mnt)->mnt_id,
    60			   file_inode(file)->i_ino,
  > 61			   file_inode(file)->i_size);
    62	
    63		seq_puts(m, "path:\t");
    64		seq_file_path(m, file, "\n");
    65		seq_putc(m, '\n');
    66	
    67		/* show_fd_locks() never deferences files so a stale value is safe */
    68		show_fd_locks(m, file, files);
    69		if (seq_has_overflowed(m))
    70			goto out;
    71	
    72		if (file->f_op->show_fdinfo)
    73			file->f_op->show_fdinfo(m, file);
    74	
    75	out:
    76		fput(file);
    77		return 0;
    78	}
    79	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
