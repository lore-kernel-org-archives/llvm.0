Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DC12BEC2B;
	Sun, 12 Apr 2026 06:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775975434; cv=none; b=QKaLoqC5t7uLFeBqV/AQnkIs9/miwTxoI9YK5+T1sFdTa2iOsY+vD6KrKpCLv7BwFc0QpX3wroAlq3ChlZ9hrRkYgfXhLaw1vxtZFxcZZA8qqd4IQ30CehCnd71vFfejypkOSu1c8oKJCXD62dknlq7i94iLyOoRohYixUg+F+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775975434; c=relaxed/simple;
	bh=zZUOzQCvBMLwLfRY/WvKSRnkFI3WeBswwLP1YKrA3So=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j8vrMSjWiPPEZD9J5yXmKClZ6C4eTmEmMV5WWcEQ9S+Y8ULNvBFUQ2rFBZR0R6D50M69o4UHMaqG+ujIXQ1pUeC+ULi5FR+BvGCueDg2Xlgiq6KNntL+9a4YFA5jvqENjESWgFz1GGb7zmIUiLKERmzuue/+vYqPMMbBkrtBTaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aXScUBo7; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aXScUBo7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775975432; x=1807511432;
  h=date:from:to:cc:subject:message-id;
  bh=zZUOzQCvBMLwLfRY/WvKSRnkFI3WeBswwLP1YKrA3So=;
  b=aXScUBo7naCDByXeMWN0h9ngfy6/m6MPrI7FysNGwH3SSVlo6yvpkQoz
   x29NsUgH6zzY+V9xO9tqHrTLBqAYDszdS/L79Klm6nXSTLzD6aPyLJGjq
   +ISeNn18IDfcDig1wOkH3Z4Qb6EJJ5IZlGLzXLNlxcKYyhzrgIAcFamoR
   QCaqsbS5aB3yMk6IqDwmZovW+iZ0wTFlJA/XYWc8C6Xp9HbsgNcIDcnhV
   yyR0wgbE4bngL9muP6nTYx63nikO9IabiEfDi330GtKftQFwwYH6DZwmY
   nfpox2UqASclzn4HDiMmRGEg/dJidsPlY6Mp8h0A84n32yR2baNl11Qou
   A==;
X-CSE-ConnectionGUID: 7qmao6WiRv6OP9TJD8xh2w==
X-CSE-MsgGUID: 36FhnHDoQB+SW7tmtI8/QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="102400092"
X-IronPort-AV: E=Sophos;i="6.23,174,1770624000"; 
   d="scan'208";a="102400092"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2026 23:30:30 -0700
X-CSE-ConnectionGUID: 0k7bH4ZpR8Ce5ib1DuasTg==
X-CSE-MsgGUID: yowh6fsVSe6I7+nCBv+lsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,174,1770624000"; 
   d="scan'208";a="231217078"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 11 Apr 2026 23:30:29 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBoKw-00000000BGJ-2pCf;
	Sun, 12 Apr 2026 06:30:26 +0000
Date: Sun, 12 Apr 2026 08:29:40 +0200
From: kernel test robot <lkp@intel.com>
To: Ye Bin <yebin10@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: fs/ext4/orphan.c:745:6: warning: format specifies type
 'unsigned long long' but the argument has type 'unsigned long'
Message-ID: <202604120805.LcpcTk0i-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Ye-Bin/ext4-register-orphan_list-procfs/20260412-043155
head:   40c8b08a765262ff0c3d84ac9ac0ec5110487e8c
commit: cf76577bfa266ccf03e5c8ab1775327709c32984 ext4: show inode orphan list detail information
date:   10 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260412/202604120805.LcpcTk0i-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260412/202604120805.LcpcTk0i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604120805.LcpcTk0i-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ext4/orphan.c:745:6: warning: format specifies type 'unsigned long long' but the argument has type 'unsigned long' [-Wformat]
     744 |         seq_printf(seq, "%llu\t%u\t%llu\t%llu\t%u\t",
         |                          ~~~~
         |                          %lu
     745 |                    inode->i_ino, inode->i_nlink,
         |                    ^~~~~~~~~~~~
   1 warning generated.


vim +745 fs/ext4/orphan.c

   733	
   734	static int ext4_orphan_seq_show(struct seq_file *seq, void *v)
   735	{
   736		struct inode *inode = v;
   737		struct ext4_proc_orphan *s = seq->private;
   738	
   739		if (s->print_title) {
   740			seq_puts(seq, "INO\tNLINK\tSIZE\tBLOCKS\tPROJID\tPATH\n");
   741			s->print_title = false;
   742		}
   743	
   744		seq_printf(seq, "%llu\t%u\t%llu\t%llu\t%u\t",
 > 745			   inode->i_ino, inode->i_nlink,
   746			   i_size_read(inode), inode->i_blocks,
   747			   __kprojid_val(EXT4_I(inode)->i_projid));
   748	
   749		ext4_show_filename(seq, inode);
   750	
   751		return 0;
   752	}
   753	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
