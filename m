Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2459139CFA;
	Tue, 13 May 2025 01:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747100393; cv=none; b=AOS7hTiBLB1vUQYF4VSVAuLJMa4HaQ7YF197e2QWj5fTQJxy1I/uZE95xQxMol3XjEeZ1KxPjWHmM81R9DCpqUBV/YoPFcQUJYkdCT+ZwxtOCJHcJ9aDQvZC1zf/UsRXvSSrNA7opBmI8vPFnxwr64BOnQ653aWXBk9KNMKQIjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747100393; c=relaxed/simple;
	bh=UJog8VoHjcfx3ovbsWzbpsVUtn63UuiaGUkF3N42F8I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GqUMjGTBjUrBpXQNAYp3m/KJEPIrIuwYwls01pZfk1Ez8s+lKGTftNazOpTJLcicUsRI+4T0YxdyaTPfL3Nr7bhWRbxqUhM45HXbeLJQcdPdm5R+cT6UgWh+N2TlwsEHBnlSFYUnAMDHZHhRLdTD7QlGfUD9ldZLKvnyCW+xSRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bAzJI+W+; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bAzJI+W+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747100391; x=1778636391;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UJog8VoHjcfx3ovbsWzbpsVUtn63UuiaGUkF3N42F8I=;
  b=bAzJI+W+IWYjvHrAA1MRnJ///0Anrqy+9F2Mx4nzJjVTu8vh4tXlGYvU
   +qs6w/Jff5/15+2mzxM9CQmbJWwT0DsXmlp+E+RjC4yVfYI/5FyD6vMXB
   IsgXqxlSWHFINHoUtn68wGpBGBaEHgDmVB1ad3cEf9PUp0h31f/fmalN5
   Fp1qfpX6AtI/JCHPv+sc5EVi0oJ8zi8DqyU1xg+BLneRK4+McWioJEJ2k
   9OVHdKNjuQAz3GhgHtvwjM3QRb8JL6nw//lm6QHxFZLgQnYuGNQ5EN77s
   +6fGyVYrk8wBdiwSOt0cfDu9N91kQeEUIQ8kquzxZmBpvxnmNyyyH8Ju1
   w==;
X-CSE-ConnectionGUID: TL7Ylt9qT4SAhK8dlu8cxQ==
X-CSE-MsgGUID: +7TmoShcS+CVvs+9Nh+DFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="49042758"
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; 
   d="scan'208";a="49042758"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:39:50 -0700
X-CSE-ConnectionGUID: ZvoBaIRkQz+qLw3q0h5s9g==
X-CSE-MsgGUID: HNZEwho3Sdu8HYw3zgEwcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; 
   d="scan'208";a="138475486"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 May 2025 18:39:48 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEecU-000FZX-0b;
	Tue, 13 May 2025 01:39:46 +0000
Date: Tue, 13 May 2025 09:38:54 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [jirislaby:devel 17/64] arch/powerpc/sysdev/fsl_msi.c:415:42: error:
 controlling expression type 'struct device' not compatible with any generic
 association type
Message-ID: <202505130927.noFfGNBZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   f060943a6971b43116b370a038e41046e9421154
commit: b14c14c5417d39a08c935f3755ae6e99f56f97d7 [17/64] irqdomain: ppc: Use dev_fwnode() TODO
config: powerpc-randconfig-003-20250513 (https://download.01.org/0day-ci/archive/20250513/202505130927.noFfGNBZ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250513/202505130927.noFfGNBZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505130927.noFfGNBZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/sysdev/fsl_msi.c:415:42: error: controlling expression type 'struct device' not compatible with any generic association type
     415 |         msi->irqhost = irq_domain_create_linear(dev_fwnode(dev->dev), NR_MSI_IRQS_MAX,
         |                                                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/property.h:35:11: note: expanded from macro 'dev_fwnode'
      35 |         _Generic((dev),                                                 \
         |                  ^~~~~
   1 error generated.


vim +415 arch/powerpc/sysdev/fsl_msi.c

   391	
   392	static const struct of_device_id fsl_of_msi_ids[];
   393	static int fsl_of_msi_probe(struct platform_device *dev)
   394	{
   395		struct fsl_msi *msi;
   396		struct resource res, msiir;
   397		int err, i, j, irq_index, count;
   398		const u32 *p;
   399		const struct fsl_msi_feature *features;
   400		int len;
   401		u32 offset;
   402		struct pci_controller *phb;
   403	
   404		features = device_get_match_data(&dev->dev);
   405	
   406		printk(KERN_DEBUG "Setting up Freescale MSI support\n");
   407	
   408		msi = kzalloc(sizeof(struct fsl_msi), GFP_KERNEL);
   409		if (!msi) {
   410			dev_err(&dev->dev, "No memory for MSI structure\n");
   411			return -ENOMEM;
   412		}
   413		platform_set_drvdata(dev, msi);
   414	
 > 415		msi->irqhost = irq_domain_create_linear(dev_fwnode(dev->dev), NR_MSI_IRQS_MAX,
   416							&fsl_msi_host_ops, msi);
   417		if (msi->irqhost == NULL) {
   418			dev_err(&dev->dev, "No memory for MSI irqhost\n");
   419			err = -ENOMEM;
   420			goto error_out;
   421		}
   422	
   423		/*
   424		 * Under the Freescale hypervisor, the msi nodes don't have a 'reg'
   425		 * property.  Instead, we use hypercalls to access the MSI.
   426		 */
   427		if ((features->fsl_pic_ip & FSL_PIC_IP_MASK) != FSL_PIC_IP_VMPIC) {
   428			err = of_address_to_resource(dev->dev.of_node, 0, &res);
   429			if (err) {
   430				dev_err(&dev->dev, "invalid resource for node %pOF\n",
   431					dev->dev.of_node);
   432				goto error_out;
   433			}
   434	
   435			msi->msi_regs = ioremap(res.start, resource_size(&res));
   436			if (!msi->msi_regs) {
   437				err = -ENOMEM;
   438				dev_err(&dev->dev, "could not map node %pOF\n",
   439					dev->dev.of_node);
   440				goto error_out;
   441			}
   442			msi->msiir_offset =
   443				features->msiir_offset + (res.start & 0xfffff);
   444	
   445			/*
   446			 * First read the MSIIR/MSIIR1 offset from dts
   447			 * On failure use the hardcode MSIIR offset
   448			 */
   449			if (of_address_to_resource(dev->dev.of_node, 1, &msiir))
   450				msi->msiir_offset = features->msiir_offset +
   451						    (res.start & MSIIR_OFFSET_MASK);
   452			else
   453				msi->msiir_offset = msiir.start & MSIIR_OFFSET_MASK;
   454		}
   455	
   456		msi->feature = features->fsl_pic_ip;
   457	
   458		/* For erratum PIC1 on MPIC version 2.0*/
   459		if ((features->fsl_pic_ip & FSL_PIC_IP_MASK) == FSL_PIC_IP_MPIC
   460				&& (fsl_mpic_primary_get_version() == 0x0200))
   461			msi->feature |= MSI_HW_ERRATA_ENDIAN;
   462	
   463		/*
   464		 * Remember the phandle, so that we can match with any PCI nodes
   465		 * that have an "fsl,msi" property.
   466		 */
   467		msi->phandle = dev->dev.of_node->phandle;
   468	
   469		err = fsl_msi_init_allocator(msi);
   470		if (err) {
   471			dev_err(&dev->dev, "Error allocating MSI bitmap\n");
   472			goto error_out;
   473		}
   474	
   475		p = of_get_property(dev->dev.of_node, "msi-available-ranges", &len);
   476	
   477		if (of_device_is_compatible(dev->dev.of_node, "fsl,mpic-msi-v4.3") ||
   478		    of_device_is_compatible(dev->dev.of_node, "fsl,vmpic-msi-v4.3")) {
   479			msi->srs_shift = MSIIR1_SRS_SHIFT;
   480			msi->ibs_shift = MSIIR1_IBS_SHIFT;
   481			if (p)
   482				dev_warn(&dev->dev, "%s: dose not support msi-available-ranges property\n",
   483					__func__);
   484	
   485			for (irq_index = 0; irq_index < NR_MSI_REG_MSIIR1;
   486			     irq_index++) {
   487				err = fsl_msi_setup_hwirq(msi, dev,
   488							  irq_index, irq_index);
   489				if (err)
   490					goto error_out;
   491			}
   492		} else {
   493			static const u32 all_avail[] =
   494				{ 0, NR_MSI_REG_MSIIR * IRQS_PER_MSI_REG };
   495	
   496			msi->srs_shift = MSIIR_SRS_SHIFT;
   497			msi->ibs_shift = MSIIR_IBS_SHIFT;
   498	
   499			if (p && len % (2 * sizeof(u32)) != 0) {
   500				dev_err(&dev->dev, "%s: Malformed msi-available-ranges property\n",
   501					__func__);
   502				err = -EINVAL;
   503				goto error_out;
   504			}
   505	
   506			if (!p) {
   507				p = all_avail;
   508				len = sizeof(all_avail);
   509			}
   510	
   511			for (irq_index = 0, i = 0; i < len / (2 * sizeof(u32)); i++) {
   512				if (p[i * 2] % IRQS_PER_MSI_REG ||
   513				    p[i * 2 + 1] % IRQS_PER_MSI_REG) {
   514					pr_warn("%s: %pOF: msi available range of %u at %u is not IRQ-aligned\n",
   515					       __func__, dev->dev.of_node,
   516					       p[i * 2 + 1], p[i * 2]);
   517					err = -EINVAL;
   518					goto error_out;
   519				}
   520	
   521				offset = p[i * 2] / IRQS_PER_MSI_REG;
   522				count = p[i * 2 + 1] / IRQS_PER_MSI_REG;
   523	
   524				for (j = 0; j < count; j++, irq_index++) {
   525					err = fsl_msi_setup_hwirq(msi, dev, offset + j,
   526								  irq_index);
   527					if (err)
   528						goto error_out;
   529				}
   530			}
   531		}
   532	
   533		list_add_tail(&msi->list, &msi_head);
   534	
   535		/*
   536		 * Apply the MSI ops to all the controllers.
   537		 * It doesn't hurt to reassign the same ops,
   538		 * but bail out if we find another MSI driver.
   539		 */
   540		list_for_each_entry(phb, &hose_list, list_node) {
   541			if (!phb->controller_ops.setup_msi_irqs) {
   542				phb->controller_ops.setup_msi_irqs = fsl_setup_msi_irqs;
   543				phb->controller_ops.teardown_msi_irqs = fsl_teardown_msi_irqs;
   544			} else if (phb->controller_ops.setup_msi_irqs != fsl_setup_msi_irqs) {
   545				dev_err(&dev->dev, "Different MSI driver already installed!\n");
   546				err = -ENODEV;
   547				goto error_out;
   548			}
   549		}
   550		return 0;
   551	error_out:
   552		fsl_of_msi_remove(dev);
   553		return err;
   554	}
   555	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
