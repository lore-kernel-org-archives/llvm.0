Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3042DF8F;
	Wed,  6 Dec 2023 10:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oColBY4k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701858753; x=1733394753;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZsVi6uSCYpOJ4jJhyJ89s15+CFNs1N9LsP1t6wP79YM=;
  b=oColBY4kNX2WE10Zwk+KFUs0hiLku2E+AAYXGTNVdIKJTt0VlwOKPNr2
   02jFEoKrMTer1DMf2CcpXhIHVj59VrwIJaa9tDTaBVcDTYeBsk/WVi3ps
   Dy3YW2g//HGpEdH3NRarOUaXu5zXkErTmrrdi8/kl2kimGgBdJP/WBZ2l
   njKzKUzGFuAlcPSKsHkhNyDKrajIq3RKy4MhMiVl9e/2cvl4feX2AarQa
   EkocNRPnpERu/sSWNjaoFNrPsX7SsmVDE+8qcs+hwShPozMvTtcO9yodo
   NhxqJcU1TxB/mDP84CAgZWYm39SfpU66M7C6ppbL8Oq+U+BALJQTmRTAs
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="373502958"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="373502958"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 02:32:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="19282551"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 06 Dec 2023 02:32:31 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rApCd-000AdO-2b;
	Wed, 06 Dec 2023 10:32:27 +0000
Date: Wed, 6 Dec 2023 18:32:21 +0800
From: kernel test robot <lkp@intel.com>
To: Chandrakanth patil <chandrakanth.patil@broadcom.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Sathya Prakash <sathya.prakash@broadcom.com>
Subject: [mkp-scsi:for-next 69/86] drivers/scsi/mpi3mr/mpi3mr_app.c:951:23:
 warning: format specifies type 'unsigned long long' but the argument has
 type 'dma_addr_t' (aka 'unsigned int')
Message-ID: <202312061817.PnTCKZE3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
head:   e78e59acfb6972aba9c3da86099760ca662054e7
commit: 9536af615dc9ded0357341e8bd0efc8b34b2b484 [69/86] scsi: mpi3mr: Support for preallocation of SGL BSG data buffers part-3
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20231206/202312061817.PnTCKZE3-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312061817.PnTCKZE3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312061817.PnTCKZE3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/mpi3mr/mpi3mr_app.c:951:23: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
                                          __func__,  dma_addr, dev_pgsz);
                                                     ^~~~~~~~
   drivers/scsi/mpi3mr/mpi3mr_debug.h:126:39: note: expanded from macro 'dprint_bsg_err'
                           pr_info("%s: " fmt, (ioc)->name, ##__VA_ARGS__); \
                                          ~~~                 ^~~~~~~~~~~
   include/linux/printk.h:528:34: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
                                   ~~~     ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   drivers/scsi/mpi3mr/mpi3mr_app.c:1114:24: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
                                                          __func__, length);
                                                                    ^~~~~~
   drivers/scsi/mpi3mr/mpi3mr_debug.h:126:39: note: expanded from macro 'dprint_bsg_err'
                           pr_info("%s: " fmt, (ioc)->name, ##__VA_ARGS__); \
                                          ~~~                 ^~~~~~~~~~~
   include/linux/printk.h:528:34: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
                                   ~~~     ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   2 warnings generated.


vim +951 drivers/scsi/mpi3mr/mpi3mr_app.c

   863	
   864	/**
   865	 * mpi3mr_build_nvme_prp - PRP constructor for NVME
   866	 *			       encapsulated request
   867	 * @mrioc: Adapter instance reference
   868	 * @nvme_encap_request: NVMe encapsulated MPI request
   869	 * @drv_bufs: DMA address of the buffers to be placed in SGL
   870	 * @bufcnt: Number of DMA buffers
   871	 *
   872	 * This function places the DMA address of the given buffers in
   873	 * proper format as PRP entries in the given NVMe encapsulated
   874	 * request.
   875	 *
   876	 * Return: 0 on success, -1 on failure
   877	 */
   878	static int mpi3mr_build_nvme_prp(struct mpi3mr_ioc *mrioc,
   879		struct mpi3_nvme_encapsulated_request *nvme_encap_request,
   880		struct mpi3mr_buf_map *drv_bufs, u8 bufcnt)
   881	{
   882		int prp_size = MPI3MR_NVME_PRP_SIZE;
   883		__le64 *prp_entry, *prp1_entry, *prp2_entry;
   884		__le64 *prp_page;
   885		dma_addr_t prp_entry_dma, prp_page_dma, dma_addr;
   886		u32 offset, entry_len, dev_pgsz;
   887		u32 page_mask_result, page_mask;
   888		size_t length = 0, desc_len;
   889		u8 count;
   890		struct mpi3mr_buf_map *drv_buf_iter = drv_bufs;
   891		u64 sgemod_mask = ((u64)((mrioc->facts.sge_mod_mask) <<
   892				    mrioc->facts.sge_mod_shift) << 32);
   893		u64 sgemod_val = ((u64)(mrioc->facts.sge_mod_value) <<
   894				  mrioc->facts.sge_mod_shift) << 32;
   895		u16 dev_handle = nvme_encap_request->dev_handle;
   896		struct mpi3mr_tgt_dev *tgtdev;
   897		u16 desc_count = 0;
   898	
   899		tgtdev = mpi3mr_get_tgtdev_by_handle(mrioc, dev_handle);
   900		if (!tgtdev) {
   901			dprint_bsg_err(mrioc, "%s: invalid device handle 0x%04x\n",
   902				__func__, dev_handle);
   903			return -1;
   904		}
   905	
   906		if (tgtdev->dev_spec.pcie_inf.pgsz == 0) {
   907			dprint_bsg_err(mrioc,
   908			    "%s: NVMe device page size is zero for handle 0x%04x\n",
   909			    __func__, dev_handle);
   910			mpi3mr_tgtdev_put(tgtdev);
   911			return -1;
   912		}
   913	
   914		dev_pgsz = 1 << (tgtdev->dev_spec.pcie_inf.pgsz);
   915		mpi3mr_tgtdev_put(tgtdev);
   916		page_mask = dev_pgsz - 1;
   917	
   918		if (dev_pgsz > MPI3MR_IOCTL_SGE_SIZE) {
   919			dprint_bsg_err(mrioc,
   920				       "%s: NVMe device page size(%d) is greater than ioctl data sge size(%d) for handle 0x%04x\n",
   921				       __func__, dev_pgsz,  MPI3MR_IOCTL_SGE_SIZE, dev_handle);
   922			return -1;
   923		}
   924	
   925		if (MPI3MR_IOCTL_SGE_SIZE % dev_pgsz) {
   926			dprint_bsg_err(mrioc,
   927				       "%s: ioctl data sge size(%d) is not a multiple of NVMe device page size(%d) for handle 0x%04x\n",
   928				       __func__, MPI3MR_IOCTL_SGE_SIZE, dev_pgsz, dev_handle);
   929			return -1;
   930		}
   931	
   932		/*
   933		 * Not all commands require a data transfer. If no data, just return
   934		 * without constructing any PRP.
   935		 */
   936		for (count = 0; count < bufcnt; count++, drv_buf_iter++) {
   937			if (drv_buf_iter->data_dir == DMA_NONE)
   938				continue;
   939			length = drv_buf_iter->kern_buf_len;
   940			break;
   941		}
   942	
   943		if (!length || !drv_buf_iter->num_dma_desc)
   944			return 0;
   945	
   946		for (count = 0; count < drv_buf_iter->num_dma_desc; count++) {
   947			dma_addr = drv_buf_iter->dma_desc[count].dma_addr;
   948			if (dma_addr & page_mask) {
   949				dprint_bsg_err(mrioc,
   950					       "%s:dma_addr 0x%llx is not aligned with page size 0x%x\n",
 > 951					       __func__,  dma_addr, dev_pgsz);
   952				return -1;
   953			}
   954		}
   955	
   956		dma_addr = drv_buf_iter->dma_desc[0].dma_addr;
   957		desc_len = drv_buf_iter->dma_desc[0].size;
   958	
   959		mrioc->prp_sz = 0;
   960		mrioc->prp_list_virt = dma_alloc_coherent(&mrioc->pdev->dev,
   961		    dev_pgsz, &mrioc->prp_list_dma, GFP_KERNEL);
   962	
   963		if (!mrioc->prp_list_virt)
   964			return -1;
   965		mrioc->prp_sz = dev_pgsz;
   966	
   967		/*
   968		 * Set pointers to PRP1 and PRP2, which are in the NVMe command.
   969		 * PRP1 is located at a 24 byte offset from the start of the NVMe
   970		 * command.  Then set the current PRP entry pointer to PRP1.
   971		 */
   972		prp1_entry = (__le64 *)((u8 *)(nvme_encap_request->command) +
   973		    MPI3MR_NVME_CMD_PRP1_OFFSET);
   974		prp2_entry = (__le64 *)((u8 *)(nvme_encap_request->command) +
   975		    MPI3MR_NVME_CMD_PRP2_OFFSET);
   976		prp_entry = prp1_entry;
   977		/*
   978		 * For the PRP entries, use the specially allocated buffer of
   979		 * contiguous memory.
   980		 */
   981		prp_page = (__le64 *)mrioc->prp_list_virt;
   982		prp_page_dma = mrioc->prp_list_dma;
   983	
   984		/*
   985		 * Check if we are within 1 entry of a page boundary we don't
   986		 * want our first entry to be a PRP List entry.
   987		 */
   988		page_mask_result = (uintptr_t)((u8 *)prp_page + prp_size) & page_mask;
   989		if (!page_mask_result) {
   990			dprint_bsg_err(mrioc, "%s: PRP page is not page aligned\n",
   991			    __func__);
   992			goto err_out;
   993		}
   994	
   995		/*
   996		 * Set PRP physical pointer, which initially points to the current PRP
   997		 * DMA memory page.
   998		 */
   999		prp_entry_dma = prp_page_dma;
  1000	
  1001	
  1002		/* Loop while the length is not zero. */
  1003		while (length) {
  1004			page_mask_result = (prp_entry_dma + prp_size) & page_mask;
  1005			if (!page_mask_result && (length >  dev_pgsz)) {
  1006				dprint_bsg_err(mrioc,
  1007				    "%s: single PRP page is not sufficient\n",
  1008				    __func__);
  1009				goto err_out;
  1010			}
  1011	
  1012			/* Need to handle if entry will be part of a page. */
  1013			offset = dma_addr & page_mask;
  1014			entry_len = dev_pgsz - offset;
  1015	
  1016			if (prp_entry == prp1_entry) {
  1017				/*
  1018				 * Must fill in the first PRP pointer (PRP1) before
  1019				 * moving on.
  1020				 */
  1021				*prp1_entry = cpu_to_le64(dma_addr);
  1022				if (*prp1_entry & sgemod_mask) {
  1023					dprint_bsg_err(mrioc,
  1024					    "%s: PRP1 address collides with SGE modifier\n",
  1025					    __func__);
  1026					goto err_out;
  1027				}
  1028				*prp1_entry &= ~sgemod_mask;
  1029				*prp1_entry |= sgemod_val;
  1030	
  1031				/*
  1032				 * Now point to the second PRP entry within the
  1033				 * command (PRP2).
  1034				 */
  1035				prp_entry = prp2_entry;
  1036			} else if (prp_entry == prp2_entry) {
  1037				/*
  1038				 * Should the PRP2 entry be a PRP List pointer or just
  1039				 * a regular PRP pointer?  If there is more than one
  1040				 * more page of data, must use a PRP List pointer.
  1041				 */
  1042				if (length > dev_pgsz) {
  1043					/*
  1044					 * PRP2 will contain a PRP List pointer because
  1045					 * more PRP's are needed with this command. The
  1046					 * list will start at the beginning of the
  1047					 * contiguous buffer.
  1048					 */
  1049					*prp2_entry = cpu_to_le64(prp_entry_dma);
  1050					if (*prp2_entry & sgemod_mask) {
  1051						dprint_bsg_err(mrioc,
  1052						    "%s: PRP list address collides with SGE modifier\n",
  1053						    __func__);
  1054						goto err_out;
  1055					}
  1056					*prp2_entry &= ~sgemod_mask;
  1057					*prp2_entry |= sgemod_val;
  1058	
  1059					/*
  1060					 * The next PRP Entry will be the start of the
  1061					 * first PRP List.
  1062					 */
  1063					prp_entry = prp_page;
  1064					continue;
  1065				} else {
  1066					/*
  1067					 * After this, the PRP Entries are complete.
  1068					 * This command uses 2 PRP's and no PRP list.
  1069					 */
  1070					*prp2_entry = cpu_to_le64(dma_addr);
  1071					if (*prp2_entry & sgemod_mask) {
  1072						dprint_bsg_err(mrioc,
  1073						    "%s: PRP2 collides with SGE modifier\n",
  1074						    __func__);
  1075						goto err_out;
  1076					}
  1077					*prp2_entry &= ~sgemod_mask;
  1078					*prp2_entry |= sgemod_val;
  1079				}
  1080			} else {
  1081				/*
  1082				 * Put entry in list and bump the addresses.
  1083				 *
  1084				 * After PRP1 and PRP2 are filled in, this will fill in
  1085				 * all remaining PRP entries in a PRP List, one per
  1086				 * each time through the loop.
  1087				 */
  1088				*prp_entry = cpu_to_le64(dma_addr);
  1089				if (*prp_entry & sgemod_mask) {
  1090					dprint_bsg_err(mrioc,
  1091					    "%s: PRP address collides with SGE modifier\n",
  1092					    __func__);
  1093					goto err_out;
  1094				}
  1095				*prp_entry &= ~sgemod_mask;
  1096				*prp_entry |= sgemod_val;
  1097				prp_entry++;
  1098				prp_entry_dma += prp_size;
  1099			}
  1100	
  1101			/* decrement length accounting for last partial page. */
  1102			if (entry_len >= length) {
  1103				length = 0;
  1104			} else {
  1105				if (entry_len <= desc_len) {
  1106					dma_addr += entry_len;
  1107					desc_len -= entry_len;
  1108				}
  1109				if (!desc_len) {
  1110					if ((++desc_count) >=
  1111					   drv_buf_iter->num_dma_desc) {
  1112						dprint_bsg_err(mrioc,
  1113							       "%s: Invalid len %ld while building PRP\n",
  1114							       __func__, length);
  1115						goto err_out;
  1116					}
  1117					dma_addr =
  1118					    drv_buf_iter->dma_desc[desc_count].dma_addr;
  1119					desc_len =
  1120					    drv_buf_iter->dma_desc[desc_count].size;
  1121				}
  1122				length -= entry_len;
  1123			}
  1124		}
  1125	
  1126		return 0;
  1127	err_out:
  1128		if (mrioc->prp_list_virt) {
  1129			dma_free_coherent(&mrioc->pdev->dev, mrioc->prp_sz,
  1130			    mrioc->prp_list_virt, mrioc->prp_list_dma);
  1131			mrioc->prp_list_virt = NULL;
  1132		}
  1133		return -1;
  1134	}
  1135	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
