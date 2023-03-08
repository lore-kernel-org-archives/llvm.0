Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978CD36A;
	Wed,  8 Mar 2023 16:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678293294; x=1709829294;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S/CWG2Hj9kzJU1x0vGgsQg2iSQVU/Sy7dBK7o94pPYA=;
  b=hxYonSU3W9KfiH4eWnNIbAyBM9CoYnquDXDo/cHVMfH3Eo6CXL+ozfXM
   LqFikk1/7101UkKnjxm/6YO2gSaCyyGsmwAvBzxYiiMEaW44HrEl/C3z6
   Ww/hZNQcC7lE5s0UbCYkaj6gn6S4ooZ57EYQekeTXVLVescPeW+y+sCqS
   hdV9AkXDPD1OsJN5Jrz1VItNt2ImiHlzeZO/V5FUS1HVKhUPX4DgPDcXh
   QWzQS8i8dU4n70IlrgImFI6pyxZFcjmRwHnutlX2hAtVtEJW8qutAc88W
   NavUiwtwKoGaAsPbaQ+W91VQ8Wxvu9tuuS0FNo4oDhfHsG9JNNXWLRVwD
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="422474574"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="422474574"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 08:34:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="820292050"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="820292050"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 08 Mar 2023 08:34:53 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZwke-0002GN-0S;
	Wed, 08 Mar 2023 16:34:52 +0000
Date: Thu, 9 Mar 2023 00:33:59 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.2 136/139] fs/debugfs/file.c:959:9: warning:
 no previous prototype for function 'debugfs_read_file_cpumask'
Message-ID: <202303090038.R0U1uPBw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.2
head:   b04a157f0da06d80607a04ca0c1f58b610ba4a44
commit: eca824efb549effb3884515952c8587ee46cc8fb [136/139] debugfs: Add helpers for creating cpumask entries in debugfs
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20230309/202303090038.R0U1uPBw-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?id=eca824efb549effb3884515952c8587ee46cc8fb
        git remote add morse https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git
        git fetch --no-tags morse mpam/snapshot/v6.2
        git checkout eca824efb549effb3884515952c8587ee46cc8fb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/debugfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303090038.R0U1uPBw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/debugfs/file.c:959:9: warning: no previous prototype for function 'debugfs_read_file_cpumask' [-Wmissing-prototypes]
   ssize_t debugfs_read_file_cpumask(struct file *file, char __user *user_buf,
           ^
   fs/debugfs/file.c:959:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   ssize_t debugfs_read_file_cpumask(struct file *file, char __user *user_buf,
   ^
   static 
   1 warning generated.


vim +/debugfs_read_file_cpumask +959 fs/debugfs/file.c

   958	
 > 959	ssize_t debugfs_read_file_cpumask(struct file *file, char __user *user_buf,
   960					   size_t count, loff_t *ppos)
   961	{
   962		struct dentry *dentry = F_DENTRY(file);
   963		struct cpumask *cpumask;
   964		char *kernel_buf;
   965		ssize_t ret;
   966		int len;
   967	
   968		ret = debugfs_file_get(dentry);
   969		if (unlikely(ret))
   970			return ret;
   971	
   972		/* How long is a piece of string? */
   973		kernel_buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
   974		if (!kernel_buf) {
   975			debugfs_file_put(dentry);
   976			return -ENOMEM;
   977		}
   978	
   979		cpumask = (struct cpumask *)file->private_data;
   980		len = scnprintf(kernel_buf, PAGE_SIZE,
   981				"%*pb\n", cpumask_pr_args(cpumask));
   982		debugfs_file_put(dentry);
   983		if (len + 1 >= PAGE_SIZE) {
   984			kfree(kernel_buf);
   985			return -EIO;
   986		}
   987	
   988		ret = simple_read_from_buffer(user_buf, count, ppos, kernel_buf, len);
   989		kfree(kernel_buf);
   990	
   991		return ret;
   992	}
   993	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
