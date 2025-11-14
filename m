Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4564728727C;
	Fri, 14 Nov 2025 10:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763114964; cv=none; b=R04CBfgrk0HWXHKhvj/vYw7KOzOHev6zVkTRLx6styBG0TVD9iDSqMIqTdAF71n/clbkADiPsYnRUrcVgVpJxMR5h9Vy/E0knmj0qrIQ0zLYcA/Fmdd8yGqyctLhE2GubtuxT4Pn4DYsKtH9AKtJExDEenqFnWq0b9sdc56E/zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763114964; c=relaxed/simple;
	bh=RXOu5FUifxXQjamYUsaVqU4h2YRjE6lmk2R8U0RwGQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mbGvhmSSTCgmaoRJDe9eq7F/f51pD7wIWiZ8ypLQLdyyv7EdRMd7RZWsEARgspLOWbZYuh0w/4FJPRziUyF7Mte9FE+qRRp5iFpcANZ8m7mHN8nPYuXSl1KkaCrfFvrKWykM76Aj0E8+zvLM6ri3u5s9o9VWQZF4Sn2O4ovEVXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ICQlnxzz; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ICQlnxzz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763114962; x=1794650962;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RXOu5FUifxXQjamYUsaVqU4h2YRjE6lmk2R8U0RwGQg=;
  b=ICQlnxzz5IrL2/izwIDIkzZFeVhgzZTfhrg3BvrF6lJyTiZvs/P+I03P
   4WwGSUOZ+FD91IT2/ssJZdOfM1drw2xhf8CtCJjgP3o4bWHRgSru/u63r
   94bXUBaKzsEROlA6D4kDmixeK5hJLHuvv4B9rgvdPlhLyROP5k3mPPqO0
   pk7nHYvH5SJJMDYSXC528U3qmdxciWdh5i75DiRb+HsI3gznmEg576gXM
   59YIJzU/Qo/W8xdrVjfzfWTfHc/vxdvdCvTg51fYI5wUlXC8/KKXWq5rv
   X4xxvdid4HC1eamqcplCspbXcAJigJW3KWIk5bfqrdBkV0Mk1zoa7OV6/
   Q==;
X-CSE-ConnectionGUID: wp24RxMXT8Wvy6wxYEjiqQ==
X-CSE-MsgGUID: Lr0ZVDvQQ22PXICQiD4R2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="52774912"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="52774912"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 02:09:22 -0800
X-CSE-ConnectionGUID: znDG+abFT2qrjrosi9bubQ==
X-CSE-MsgGUID: UC24LD5WSp6thQ0ywZvgLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="194186213"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 Nov 2025 02:09:20 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJqk1-0006RX-1o;
	Fri, 14 Nov 2025 10:09:17 +0000
Date: Fri, 14 Nov 2025 18:09:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jian Zhang <zhangjian.3032@bytedance.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [[RFC PATCH]] jffs2: attempt to fix "Error garbage collecting
 node"
Message-ID: <202511141750.MGEdjHtI-lkp@intel.com>
References: <20251111145609.1917969-1-zhangjian.3032@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111145609.1917969-1-zhangjian.3032@bytedance.com>

Hi Jian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on linus/master v6.18-rc5 next-20251114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jian-Zhang/jffs2-attempt-to-fix-Error-garbage-collecting-node/20251111-230509
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20251111145609.1917969-1-zhangjian.3032%40bytedance.com
patch subject: [[RFC PATCH]] jffs2: attempt to fix "Error garbage collecting node"
config: arm-randconfig-004-20251114 (https://download.01.org/0day-ci/archive/20251114/202511141750.MGEdjHtI-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511141750.MGEdjHtI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511141750.MGEdjHtI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/jffs2/scan.c:587:56: warning: more '%' conversions than data arguments [-Wformat-insufficient-args]
     587 |                         JFFS2_WARNING("Erasing block at 0x%08x error_count %d due to pre-scan errors\n",
         |                                                                            ~^
   fs/jffs2/debug.h:84:31: note: expanded from macro 'JFFS2_WARNING'
      84 |         pr_warn("warning: (%d) %s: " fmt,                               \
         |                                      ^~~
   include/linux/printk.h:565:29: note: expanded from macro 'pr_warn'
     565 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                    ^~~
   fs/jffs2/scan.c:12:41: note: expanded from macro 'pr_fmt'
      12 | #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
         |                                         ^~~
   include/linux/printk.h:512:53: note: expanded from macro 'printk'
     512 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ^~~
   include/linux/printk.h:484:11: note: expanded from macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   1 warning generated.


vim +587 fs/jffs2/scan.c

   455	
   456	static int jffs2_pre_scan_eraseblock(struct jffs2_sb_info *c, struct jffs2_eraseblock *jeb)
   457	{
   458		int ret;
   459		bool error_found = false;
   460		unsigned char *buf;
   461		uint32_t crc;
   462		struct jffs2_unknown_node *node;
   463		struct jffs2_raw_inode *ri;
   464		struct jffs2_raw_dirent *rd;
   465	
   466		uint32_t ofs = 0, buf_len = c->sector_size;
   467		uint32_t retlen;
   468	
   469		buf = kmalloc(buf_len, GFP_KERNEL);
   470		if (!buf) {
   471			JFFS2_WARNING("Unable to allocate scan buffer of size %u\n", buf_len);
   472			return -ENOMEM;
   473		}
   474	
   475		ret = jffs2_fill_scan_buf(c, buf, jeb->offset, buf_len);
   476		if (ret) {
   477			JFFS2_WARNING("Unable to read eraseblock at 0x%08x\n", jeb->offset);
   478			goto exit;
   479		}
   480	
   481		while (ofs < c->sector_size) {
   482			if (c->sector_size - ofs < sizeof(struct jffs2_unknown_node)) {
   483				/* Not enough space for a node header */
   484				break;
   485			}
   486	
   487			if (*(uint32_t *)(&buf[ofs]) == 0xffffffff) {
   488				/* Reached empty space */
   489				ofs += 4;
   490				continue;
   491			}
   492	
   493			node = (struct jffs2_unknown_node *)&buf[ofs];
   494			if (je16_to_cpu(node->magic) != JFFS2_MAGIC_BITMASK) {
   495				ofs += 4;
   496				continue;
   497			}
   498	
   499			if (jffs2_calc_node_hdr_crc(node) != je32_to_cpu(node->hdr_crc)) {
   500				JFFS2_WARNING("node header CRC failed at %#08x\n",
   501					      jeb->offset + ofs);
   502				ofs += 4;
   503				error_found = true;
   504				goto check;
   505			}
   506	
   507			if (!(je16_to_cpu(node->nodetype) & JFFS2_NODE_ACCURATE)) {
   508				/* This is an obsoleted node */
   509				ofs += PAD(je32_to_cpu(node->totlen));
   510				continue;
   511			}
   512	
   513			switch (je16_to_cpu(node->nodetype)) {
   514			case JFFS2_NODETYPE_INODE:
   515				if (c->sector_size - ofs < sizeof(struct jffs2_raw_inode)) {
   516					/* Not enough space for a full inode node */
   517					ofs += 4;
   518					goto check;
   519				}
   520	
   521				ri = (struct jffs2_raw_inode *)node;
   522				crc = crc32(0, ri, sizeof(*ri) - 8);
   523				if (crc != je32_to_cpu(ri->node_crc)) {
   524					JFFS2_WARNING("inode node CRC failed at %#08x, read=%#08x, calc=%#08x\n",
   525						      jeb->offset + ofs,
   526						      je32_to_cpu(ri->node_crc), crc);
   527					error_found = true;
   528					goto check;
   529				}
   530	
   531				if (je32_to_cpu(ri->dsize)) {
   532					crc = crc32(0, ri->data, je32_to_cpu(ri->csize));
   533					if (je32_to_cpu(ri->data_crc) != crc) {
   534						JFFS2_WARNING("Data CRC failed data node at 0x%08x: Read 0x%08x, calculated 0x%08x\n",
   535							ofs, je32_to_cpu(ri->data_crc), crc);
   536						error_found = true;
   537						goto check;
   538					}
   539				}
   540	
   541				ofs += PAD(je32_to_cpu(node->totlen));
   542				break;
   543			case JFFS2_NODETYPE_DIRENT:
   544				if (c->sector_size - ofs < sizeof(struct jffs2_raw_dirent)) {
   545					/* Not enough space for a full dirent node */
   546					ofs += 4;
   547					goto check;
   548				}
   549	
   550				rd = (struct jffs2_raw_dirent *)node;
   551				crc = crc32(0, rd, sizeof(*rd) - 8);
   552				if (je32_to_cpu(rd->node_crc) != crc) {
   553					JFFS2_WARNING("Node CRC failed dirent node at 0x%08x: Read 0x%08x, calculated 0x%08x\n",
   554						ofs, je32_to_cpu(rd->node_crc), crc);
   555					error_found = true;
   556					goto check;
   557				}
   558	
   559				if (strnlen(rd->name, rd->nsize) != rd->nsize) {
   560					JFFS2_WARNING("Name in dirent node at 0x%08x contains zeroes\n", ofs);
   561					error_found = true;
   562					break;
   563				}
   564	
   565				if (rd->nsize) {
   566					crc = crc32(0, rd->name, rd->nsize);
   567					if (je32_to_cpu(rd->name_crc) != crc) {
   568						JFFS2_WARNING("Name CRC failed dirent node at 0x%08x: Read 0x%08x, calculated 0x%08x\n",
   569							ofs, je32_to_cpu(rd->name_crc), crc);
   570						error_found = true;
   571						goto check;
   572					}
   573				}
   574	
   575				ofs += PAD(je32_to_cpu(node->totlen));
   576				break;
   577			default:
   578				ofs += PAD(je32_to_cpu(node->totlen));
   579				/* Other node types are not pre-checked */
   580				break;
   581			}
   582		}
   583	
   584	check:
   585		// find any error during pre-scan, if found, erase the block, and write back.
   586		if (error_found) {
 > 587				JFFS2_WARNING("Erasing block at 0x%08x error_count %d due to pre-scan errors\n",
   588					jeb->offset);
   589				struct erase_info instr;
   590	
   591				instr.addr = jeb->offset;
   592				instr.len = c->sector_size;
   593				ret = mtd_erase(c->mtd, &instr);
   594				if (ret) {
   595					JFFS2_ERROR("Erase at 0x%08x failed during pre-scan: errno %d\n",
   596						jeb->offset, ret);
   597					goto exit;
   598				}
   599	
   600				ret = jffs2_flash_direct_write(c, jeb->offset, buf_len, &retlen, buf);
   601				if (ret) {
   602					JFFS2_ERROR("Write back at 0x%08x failed during pre-scan: errno %d\n",
   603						jeb->offset, ret);
   604					goto exit;
   605				}
   606		}
   607	exit:
   608	
   609		kfree(buf);
   610		return ret;
   611	}
   612	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
