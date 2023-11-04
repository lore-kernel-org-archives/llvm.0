Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F0B33E9;
	Sat,  4 Nov 2023 05:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B59um192"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699075384; x=1730611384;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d5wsMR+k9gGVnuMpl1Y534onMry/dAtpXw1Fkdzx9Kc=;
  b=B59um192b/ZlaX81u0PsM0rysSh65aLMOi29QuSsceAsrPbirPe/CFsP
   LlBxlGMZhf/l5MEfFYyREa3fDcd42vTPYOUVo3la1AhYWq6HELhUSqs3A
   f3ZsNwsiD9ra6dM3jgGaKrJgGgk30atizauZc9WbdYMkAKVpVcLBgc93g
   xAbOkDmWLvz7eTE7govbOwD8IOyE9is4Xglk5wf4n+tRiblMOfvlaEQTz
   IhSYMv03SxtEh1g2/GtZY/5qSc0blgytEhcBGb89gKdyJMdlPCjOHrQdO
   /YBH35lPsJQU4xfsIkjyyCiWIemvTcUNeHDiIy1IXdVAavYyKt4z6ePvy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387951250"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="387951250"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 22:23:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="878860989"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="878860989"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 03 Nov 2023 22:23:02 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz97c-0003U8-16;
	Sat, 04 Nov 2023 05:23:00 +0000
Date: Sat, 4 Nov 2023 13:22:45 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:sframe 3/3] kernel/unwind/sframe.c:309:7: warning: logical
 not is only applied to the left hand side of this bitwise operator
Message-ID: <202311041307.Ee0F1UY0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git sframe
head:   32e88f45d843ad800e1ff01230eccd93849d2dda
commit: 32e88f45d843ad800e1ff01230eccd93849d2dda [3/3] todo
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20231104/202311041307.Ee0F1UY0-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041307.Ee0F1UY0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311041307.Ee0F1UY0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/unwind/sframe.c:309:7: warning: logical not is only applied to the left hand side of this bitwise operator [-Wlogical-not-parentheses]
     309 |             (!shdr.preamble.flags & SFRAME_F_FDE_SORTED) ||
         |              ^                    ~
   kernel/unwind/sframe.c:309:7: note: add parentheses after the '!' to evaluate the bitwise operator first
     309 |             (!shdr.preamble.flags & SFRAME_F_FDE_SORTED) ||
         |              ^                                         
         |               (                                        )
   kernel/unwind/sframe.c:309:7: note: add parentheses around left hand side expression to silence this warning
     309 |             (!shdr.preamble.flags & SFRAME_F_FDE_SORTED) ||
         |              ^                   
         |              (                   )
   1 warning generated.


vim +309 kernel/unwind/sframe.c

   294	
   295	int __sframe_add_section(struct sframe_file *file)
   296	{
   297		struct maple_tree *sframe_mt = &current->mm->sframe_mt;
   298		struct sframe_section *sec;
   299		struct sframe_header shdr;
   300		unsigned long header_end;
   301		int ret;
   302	
   303		if (copy_from_user(&shdr, (void *)file->sframe_addr, sizeof(shdr))) {
   304			return -EFAULT;
   305		}
   306	
   307		if (shdr.preamble.magic != SFRAME_MAGIC ||
   308		    shdr.preamble.version != SFRAME_VERSION_1 ||
 > 309		    (!shdr.preamble.flags & SFRAME_F_FDE_SORTED) ||
   310		    shdr.auxhdr_len || !shdr.num_fdes || !shdr.num_fres ||
   311		    shdr.fdes_off > shdr.fres_off) {
   312			return -EINVAL;
   313		}
   314	
   315		header_end = file->sframe_addr + SFRAME_HDR_SIZE(shdr);
   316	
   317		sec = kmalloc(sizeof(*sec), GFP_KERNEL);
   318		if (!sec)
   319			return -ENOMEM;
   320	
   321		sec->file_addr		= file->file_addr;
   322		sec->sframe_addr	= file->sframe_addr;
   323		sec->text_addr		= file->text_addr;
   324		sec->fdes_addr		= header_end + shdr.fdes_off;
   325		sec->fres_addr		= header_end + shdr.fres_off;
   326		sec->fdes_num		= shdr.num_fdes;
   327		sec->ra_off		= shdr.cfa_fixed_ra_offset;
   328		sec->fp_off		= shdr.cfa_fixed_fp_offset;
   329	
   330		//TODO error on duplicate/overlap
   331		ret = mtree_store_range(sframe_mt, sec->text_addr, file->text_end_addr,
   332					sec, GFP_KERNEL);
   333		if (ret) {
   334			kfree(sec);
   335			return ret;
   336		}
   337	
   338		return 0;
   339	}
   340	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
