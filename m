Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1D817E4
	for <llvm@lists.linux.dev>; Tue,  1 Mar 2022 04:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646108389; x=1677644389;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YPc+Vv753n/nQqu9zqd3mEiaWhYBz0Ih+wU0yrkOclg=;
  b=PeskbdeOi80jh/HK6xZSLoMNTdwku64eXWQCM0Z9ZwP2CRxeQt171L2J
   tmQjpPi2shsDIYGXk9O8uPaQAost/nZtpQ4381pXQrNWUHINgoX+5NMK3
   rc870rM1u60546JPyh9QbtFj2QwjZxSEaIPX1iuDGoJU17QhYfnn0XF43
   eUMzoaF2nHqK8lvD6zkmqukm1EO0nLuqye2NOiLBk73icsgrK0lSHziI2
   kMP+ahcX1GQUzwmsmneBTnUH2UPZsu6rARc8LVzXKbqi6GjzyZpbdjvjV
   974sPkFN8+fTWnsUJq2BkSxM7/K3/ExllQmpOZVAteveV49UEHCAPAWvA
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="277715190"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; 
   d="scan'208";a="277715190"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2022 20:19:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; 
   d="scan'208";a="593466285"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 28 Feb 2022 20:19:47 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nOtzG-00086V-Ks; Tue, 01 Mar 2022 04:19:46 +0000
Date: Tue, 1 Mar 2022 12:19:09 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [amir73il:sb_iostats 6/8] fs/proc_namespace.c:243:11: error: no
 member named 's_iostats' in 'struct super_block'
Message-ID: <202203011209.huwPaHLQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/amir73il/linux sb_iostats
head:   ecfdb413f2105083296e9cb45290eb1f01b0ef5c
commit: df9b63258be710a78278da75d11cfe0cbaa8ca74 [6/8] fs: report per-sb io stats
config: hexagon-alldefconfig (https://download.01.org/0day-ci/archive/20220301/202203011209.huwPaHLQ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/amir73il/linux/commit/df9b63258be710a78278da75d11cfe0cbaa8ca74
        git remote add amir73il https://github.com/amir73il/linux
        git fetch --no-tags amir73il sb_iostats
        git checkout df9b63258be710a78278da75d11cfe0cbaa8ca74
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> fs/proc_namespace.c:243:11: error: no member named 's_iostats' in 'struct super_block'
                              sb->s_iostats.start_time, ktime_get_seconds(),
                              ~~  ^
   1 error generated.


vim +243 fs/proc_namespace.c

   196	
   197	static int show_vfsstat(struct seq_file *m, struct vfsmount *mnt)
   198	{
   199		struct proc_mounts *p = m->private;
   200		struct mount *r = real_mount(mnt);
   201		struct path mnt_path = { .dentry = mnt->mnt_root, .mnt = mnt };
   202		struct super_block *sb = mnt_path.dentry->d_sb;
   203		int err;
   204	
   205		/* device */
   206		if (sb->s_op->show_devname) {
   207			seq_puts(m, "device ");
   208			err = sb->s_op->show_devname(m, mnt_path.dentry);
   209			if (err)
   210				goto out;
   211		} else {
   212			if (r->mnt_devname) {
   213				seq_puts(m, "device ");
   214				mangle(m, r->mnt_devname);
   215			} else
   216				seq_puts(m, "no device");
   217		}
   218	
   219		/* mount point */
   220		seq_puts(m, " mounted on ");
   221		/* mountpoints outside of chroot jail will give SEQ_SKIP on this */
   222		err = seq_path_root(m, &mnt_path, &p->root, " \t\n\\");
   223		if (err)
   224			goto out;
   225		seq_putc(m, ' ');
   226	
   227		/* file system type */
   228		seq_puts(m, "with fstype ");
   229		show_type(m, sb);
   230	
   231		/* optional statistics */
   232		if (sb->s_op->show_stats) {
   233			seq_putc(m, ' ');
   234			err = sb->s_op->show_stats(m, mnt_path.dentry);
   235		} else if (sb_has_iostats(sb)) {
   236			/* Similar to /proc/<pid>/io */
   237			seq_printf(m, "\n"
   238				   "\ttimes: %lld %lld\n"
   239				   "\trchar: %lld\n"
   240				   "\twchar: %lld\n"
   241				   "\tsyscr: %lld\n"
   242				   "\tsyscw: %lld\n",
 > 243				   sb->s_iostats.start_time, ktime_get_seconds(),
   244				   sb_iostats_counter_read(sb, SB_IOSTATS_CHARS_RD),
   245				   sb_iostats_counter_read(sb, SB_IOSTATS_CHARS_WR),
   246				   sb_iostats_counter_read(sb, SB_IOSTATS_SYSCALLS_RD),
   247				   sb_iostats_counter_read(sb, SB_IOSTATS_SYSCALLS_WR));
   248		}
   249	
   250		seq_putc(m, '\n');
   251	out:
   252		return err;
   253	}
   254	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
