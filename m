Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1E233EE;
	Wed,  8 Feb 2023 15:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675868890; x=1707404890;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xcR4IxQzOrtlOfHxtnzpSWH5XmEl84XgLOuRQWiDKpo=;
  b=cRpcIgwnJuJfgHXKfMvDKtL7xb5F7jGcECqgLga3Bi1HcwBJYNQpZ1tl
   89hNAdlC/++6yzofdFDc/uz1a3COzWbVQNr/pAUKMflD6+tjhIb09MvJg
   1j6NjAAziD9qbd90XnRYQ9LAUEujvoOaj4rpKD2KN8TpgNECn0mrEVa0C
   UgJegcHsxnDNgS0g6Raj5PuUCM1IZ2bZ7jyRLsFONfSHpZ1GrJ9FMBncZ
   j5wbeppH5w5j15d167+iepwvqQ+/08gWstLGr/UPwThHYrH9cS7H9Ydog
   xvfxqjAZPeu45/07BiDgGWHOlGZCFvLTzCYdz9jhNlV/ShogeEbH72czG
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="309468611"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="309468611"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 07:08:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="644884648"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="644884648"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 Feb 2023 07:08:07 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPm3L-0004Vk-06;
	Wed, 08 Feb 2023 15:08:07 +0000
Date: Wed, 8 Feb 2023 23:07:11 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split 30/31]
 fs/binfmt_elf.c:1397:47: error: no member named 'name' in 'struct file'
Message-ID: <202302082259.0BQXsMro-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split
head:   e6fc25ec2770c9db62486fb1f291b99531f86533
commit: 269949ccfda3ce7d938f14116dbd903b0216c98b [30/31] debug prints
config: i386-randconfig-a004-20230206 (https://download.01.org/0day-ci/archive/20230208/202302082259.0BQXsMro-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=269949ccfda3ce7d938f14116dbd903b0216c98b
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split
        git checkout 269949ccfda3ce7d938f14116dbd903b0216c98b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> fs/binfmt_elf.c:1397:47: error: no member named 'name' in 'struct file'
           pr_info("trying %s on %s\n", __func__, file->name);
                                                  ~~~~  ^
   include/linux/printk.h:530:34: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
                                           ^~~~~~~~~~~
   include/linux/printk.h:457:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:429:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   1 error generated.


vim +1397 fs/binfmt_elf.c

  1385	
  1386	#ifdef CONFIG_USELIB
  1387	/* This is really simpleminded and specialized - we are loading an
  1388	   a.out library that is given an ELF header. */
  1389	static int load_elf_library(struct file *file)
  1390	{
  1391		struct elf_phdr *elf_phdata;
  1392		struct elf_phdr *eppnt;
  1393		unsigned long elf_bss, bss, len;
  1394		int retval, error, i, j;
  1395		struct elfhdr elf_ex;
  1396	
> 1397		pr_info("trying %s on %s\n", __func__, file->name);
  1398		error = -ENOEXEC;
  1399		retval = elf_read(file, &elf_ex, sizeof(elf_ex), 0);
  1400		if (retval < 0)
  1401			goto out;
  1402	
  1403		if (memcmp(elf_ex.e_ident, ELFMAG, SELFMAG) != 0)
  1404			goto out;
  1405	
  1406		/* First of all, some simple consistency checks */
  1407		if (elf_ex.e_type != ET_EXEC || elf_ex.e_phnum > 2 ||
  1408		    !elf_check_arch(&elf_ex) || !file->f_op->mmap)
  1409			goto out;
  1410		if (elf_check_fdpic(&elf_ex))
  1411			goto out;
  1412	
  1413		/* Now read in all of the header information */
  1414	
  1415		j = sizeof(struct elf_phdr) * elf_ex.e_phnum;
  1416		/* j < ELF_MIN_ALIGN because elf_ex.e_phnum <= 2 */
  1417	
  1418		error = -ENOMEM;
  1419		elf_phdata = kmalloc(j, GFP_KERNEL);
  1420		if (!elf_phdata)
  1421			goto out;
  1422	
  1423		eppnt = elf_phdata;
  1424		error = -ENOEXEC;
  1425		retval = elf_read(file, eppnt, j, elf_ex.e_phoff);
  1426		if (retval < 0)
  1427			goto out_free_ph;
  1428	
  1429		for (j = 0, i = 0; i<elf_ex.e_phnum; i++)
  1430			if ((eppnt + i)->p_type == PT_LOAD)
  1431				j++;
  1432		if (j != 1)
  1433			goto out_free_ph;
  1434	
  1435		while (eppnt->p_type != PT_LOAD)
  1436			eppnt++;
  1437	
  1438		/* Now use mmap to map the library into memory. */
  1439		error = vm_mmap(file,
  1440				ELF_PAGESTART(eppnt->p_vaddr),
  1441				(eppnt->p_filesz +
  1442				 ELF_PAGEOFFSET(eppnt->p_vaddr)),
  1443				PROT_READ | PROT_WRITE | PROT_EXEC,
  1444				MAP_FIXED_NOREPLACE | MAP_PRIVATE,
  1445				(eppnt->p_offset -
  1446				 ELF_PAGEOFFSET(eppnt->p_vaddr)));
  1447		if (error != ELF_PAGESTART(eppnt->p_vaddr))
  1448			goto out_free_ph;
  1449	
  1450		elf_bss = eppnt->p_vaddr + eppnt->p_filesz;
  1451		if (padzero(elf_bss)) {
  1452			error = -EFAULT;
  1453			goto out_free_ph;
  1454		}
  1455	
  1456		len = ELF_PAGEALIGN(eppnt->p_filesz + eppnt->p_vaddr);
  1457		bss = ELF_PAGEALIGN(eppnt->p_memsz + eppnt->p_vaddr);
  1458		if (bss > len) {
  1459			error = vm_brk(len, bss - len);
  1460			if (error)
  1461				goto out_free_ph;
  1462		}
  1463		error = 0;
  1464	
  1465	out_free_ph:
  1466		kfree(elf_phdata);
  1467	out:
  1468		return error;
  1469	}
  1470	#endif /* #ifdef CONFIG_USELIB */
  1471	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
