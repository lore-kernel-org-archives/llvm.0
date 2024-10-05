Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4C114C5B5;
	Sat,  5 Oct 2024 19:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728156629; cv=none; b=hOiyPBrimkanGa0DZ40Z855TfbjD+awgOJEOJenK99POmSgVbEIOYEdisPyxUXg5UI30n6EHPikMIC2j8bApQXY3TfIyJkezZfwpyuenisgqcMGQIp7XNwpjGn1O49YLlw6kDF19VQ49SqJ0fwBoE+hOjCub13OJ4Q2/5WMBkrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728156629; c=relaxed/simple;
	bh=5P06dq+TvWBfznD7ETjNwrNzeQiFZ4Sc5rEvgffHhTw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rg+Awb84A7ptn15KpgMQMr3LivwXm09AzaGDhZNowcS4mnagGSe+UgbO/GA9detVGVrGHhLYoK1Try0GPI5tRznNF2bNGPIxmKPrLEC16K2+Ygf6ApXhTG8oomJWZAs6A+1NrCMt2O/vR1LuN6fnETYGGhwRxfDb2LssGevAu+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kR7OiimW; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kR7OiimW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728156627; x=1759692627;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5P06dq+TvWBfznD7ETjNwrNzeQiFZ4Sc5rEvgffHhTw=;
  b=kR7OiimWrQ1akIshh84ef1YG9G8QuxAs+vDQJ80SRjZJWi6On37MxrC5
   wsJt80WtvyJkajwkjlI0PShJGM4aSybhsFUfq4q1OL/9uNzKScWNCw/n/
   znNy8A+SjAOdDSFvVNFtxEajmqG7QiMtB6rIB84q9ff4G6ELpabqksVjq
   VIi/klhKf4kaBzwe67SaFQ14I1/7Y4CGr0aMnTbZU7VNgsbkR1I6R8/p/
   iA5aq5ZbFj6LTTzI1BSHe2x2WEfSAYKTu4L4Ro6evV7bvHJJaMv3IZ82/
   OlqWfvjj5qeIfpxNjhWhvRtQEluTjfCdUPWmiIo5T6PtOd895QJbeUhNu
   Q==;
X-CSE-ConnectionGUID: z5ekX2aeQmy1DMj65Mbz7w==
X-CSE-MsgGUID: qH5/vv9qS2m2qzpP2UoClA==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="38008293"
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="38008293"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 12:30:26 -0700
X-CSE-ConnectionGUID: nUlgAJFzRvOkyb/pwytiag==
X-CSE-MsgGUID: H3TIXbCTStS5wPGaEbcF9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="105796574"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Oct 2024 12:30:25 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxATu-0003IV-33;
	Sat, 05 Oct 2024 19:30:22 +0000
Date: Sun, 6 Oct 2024 03:29:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-tpm 5/6] drivers/char/tpm/tpm_tdx.c:685:6: warning:
 variable 'ret' is used uninitialized whenever 'if' condition is true
Message-ID: <202410060310.PMUz8eIJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-tpm
head:   2e411a732a435e867d000fe01aa5c1380c9630c8
commit: 6d4ad81993ed6f40f1f82c07cfe9fedf4b4d4722 [5/6] tpm: Add vTPM TDX support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241006/202410060310.PMUz8eIJ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241006/202410060310.PMUz8eIJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410060310.PMUz8eIJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/char/tpm/tpm_tdx.c:26:
   In file included from drivers/char/tpm/tpm.h:28:
   include/linux/tpm_eventlog.h:167:6: warning: variable 'mapping_size' set but not used [-Wunused-but-set-variable]
     167 |         int mapping_size;
         |             ^
>> drivers/char/tpm/tpm_tdx.c:685:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     685 |         if (spdm->trans_ver != TDX_SESS_SPDM_TRANS_VER ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     686 |             spdm->aead_algo != TDX_AEAD_ALGO_AES_256) {
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm_tdx.c:716:9: note: uninitialized use occurs here
     716 |         return ret;
         |                ^~~
   drivers/char/tpm/tpm_tdx.c:685:2: note: remove the 'if' if its condition is always false
     685 |         if (spdm->trans_ver != TDX_SESS_SPDM_TRANS_VER ||
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     686 |             spdm->aead_algo != TDX_AEAD_ALGO_AES_256) {
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     687 |                 dev_err(tdev->dev, "Invalid SPDM version or Algo\n");
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     688 |                 goto unmap_addr;
         |                 ~~~~~~~~~~~~~~~~
     689 |         }
         |         ~
>> drivers/char/tpm/tpm_tdx.c:685:6: warning: variable 'ret' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
     685 |         if (spdm->trans_ver != TDX_SESS_SPDM_TRANS_VER ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm_tdx.c:716:9: note: uninitialized use occurs here
     716 |         return ret;
         |                ^~~
   drivers/char/tpm/tpm_tdx.c:685:6: note: remove the '||' if its condition is always false
     685 |         if (spdm->trans_ver != TDX_SESS_SPDM_TRANS_VER ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm_tdx.c:658:9: note: initialize the variable 'ret' to silence this warning
     658 |         int ret;
         |                ^
         |                 = 0
>> drivers/char/tpm/tpm_tdx.c:884:32: warning: unused variable 'tdx_guest_ids' [-Wunused-const-variable]
     884 | static const struct x86_cpu_id tdx_guest_ids[] = {
         |                                ^~~~~~~~~~~~~
   4 warnings generated.
--
>> drivers/char/tpm/tpm_tdx.c:175: warning: Function parameter or member 'tdvmcall_status' not described in 'tdx_tpm_msg_resp'
>> drivers/char/tpm/tpm_tdx.c:175: warning: Function parameter or member 'service_cmd_status' not described in 'tdx_tpm_msg_resp'
>> drivers/char/tpm/tpm_tdx.c:175: warning: Function parameter or member 'rsvd' not described in 'tdx_tpm_msg_resp'


vim +685 drivers/char/tpm/tpm_tdx.c

   648	
   649	/* Parse TDTK ACPI table and initialize the session object */
   650	static int tdx_tpm_init_session(struct tdx_tpm_dev *tdev)
   651	{
   652		struct tdx_tpm_session *info = &tdev->session;
   653		struct acpi_tdtk_aes_256_gcm *aes_gcm;
   654		struct acpi_tdtk_spdm *spdm;
   655		struct acpi_table_tdtk *tdtk;
   656		void __iomem *addr;
   657		acpi_status status;
   658		int ret;
   659	
   660		status = acpi_get_table(ACPI_SIG_TDTK, 1,
   661					(struct acpi_table_header **)&tdtk);
   662		if (ACPI_FAILURE(status) || tdtk->header.length < sizeof(*tdtk)) {
   663			dev_err(tdev->dev, FW_BUG "Failed to get TDTK ACPI table\n");
   664			return -EINVAL;
   665		}
   666	
   667		if (tdtk->version != TDX_SESS_INFO_VER ||
   668		    tdtk->protocol != TDX_SESS_PROT_SPDM) {
   669			dev_err(tdev->dev, "Unsupported TDTK protocol or version\n");
   670			ret = -EINVAL;
   671			goto put_table;
   672		}
   673	
   674		addr = ioremap(tdtk->info_address, tdtk->info_len);
   675		if (!addr) {
   676			dev_err(tdev->dev, "Failed to remap SPDM table %llx\n",
   677				tdtk->info_address);
   678			ret = -EINVAL;
   679			goto put_table;
   680		}
   681	
   682		spdm = (struct acpi_tdtk_spdm *)addr;
   683		aes_gcm = (struct acpi_tdtk_aes_256_gcm *)(addr + sizeof(*spdm));
   684	
 > 685		if (spdm->trans_ver != TDX_SESS_SPDM_TRANS_VER ||
   686		    spdm->aead_algo != TDX_AEAD_ALGO_AES_256) {
   687			dev_err(tdev->dev, "Invalid SPDM version or Algo\n");
   688			goto unmap_addr;
   689		}
   690	
   691		info->ver = spdm->trans_ver;
   692		info->algo = spdm->aead_algo;
   693		info->sess_id = spdm->sess_id;
   694	
   695		ret = tdx_aes_256_init(&info->send_crypto, aes_gcm->req_key,
   696				       TDX_AEAD_AES_256_KEY_LEN, aes_gcm->req_iv,
   697				       TDX_AEAD_AES_256_IV_LEN,
   698				       TDX_AEAD_AES_256_ATAG_LEN, aes_gcm->req_seq);
   699		if (ret)
   700			goto unmap_addr;
   701	
   702		ret = tdx_aes_256_init(&info->recv_crypto, aes_gcm->resp_key,
   703				       TDX_AEAD_AES_256_KEY_LEN, aes_gcm->resp_iv,
   704				       TDX_AEAD_AES_256_IV_LEN,
   705				       TDX_AEAD_AES_256_ATAG_LEN, aes_gcm->resp_seq);
   706		if (ret)
   707			goto aes_deinit;
   708	
   709		goto unmap_addr;
   710	aes_deinit:
   711		tdx_aes_256_deinit(&info->send_crypto);
   712	unmap_addr:
   713		iounmap(addr);
   714	put_table:
   715		acpi_put_table((struct acpi_table_header *)tdtk);
   716		return ret;
   717	}
   718	
   719	static void free_shared_pages(void *buf, size_t len)
   720	{
   721		unsigned int count = PAGE_ALIGN(len) >> PAGE_SHIFT;
   722	
   723		set_memory_encrypted((unsigned long)buf, count);
   724	
   725		free_pages_exact(buf, PAGE_ALIGN(len));
   726	}
   727	
   728	static void *alloc_shared_pages(size_t len)
   729	{
   730		unsigned int count = PAGE_ALIGN(len) >> PAGE_SHIFT;
   731		void *addr;
   732		int ret;
   733	
   734		addr = alloc_pages_exact(len, GFP_KERNEL);
   735		if (!addr)
   736			return NULL;
   737	
   738		ret = set_memory_decrypted((unsigned long)addr, count);
   739		if (ret) {
   740			free_pages_exact(addr, PAGE_ALIGN(len));
   741			return NULL;
   742		}
   743	
   744		return addr;
   745	}
   746	
   747	static void tdx_tpm_free_buf(struct tdx_tpm_dev *tdev)
   748	{
   749		free_shared_pages((void *)tdev->req, tdev->msg_len);
   750		free_shared_pages((void *)tdev->resp, tdev->msg_len);
   751	}
   752	
   753	static int tdx_tpm_alloc_buf(struct tdx_tpm_dev *tdev)
   754	{
   755		tdev->msg_len = TDX_TPM_MSG_LEN;
   756	
   757		tdev->req = (struct tdx_tpm_msg_req *)alloc_shared_pages(tdev->msg_len);
   758		if (!tdev->req)
   759			goto alloc_failed;
   760	
   761		tdev->resp = (struct tdx_tpm_msg_resp *)alloc_shared_pages(tdev->msg_len);
   762		if (!tdev->resp)
   763			goto alloc_failed;
   764	
   765		return 0;
   766	
   767	alloc_failed:
   768		dev_err(tdev->dev, "Buffer allocation failed\n");
   769		tdx_tpm_free_buf(tdev);
   770		return -ENOMEM;
   771	}
   772	
   773	static int tdx_tpm_alloc_irq(struct tdx_tpm_dev *tdev)
   774	{
   775		int ret, irq;
   776	
   777		/* Allocate an IRQ vector for service callback */
   778		irq = tdx_alloc_event_irq();
   779		if (irq <= 0)
   780			return -EIO;
   781	
   782		/*
   783		 * VMM will use the same CPU that makes the TDX service call for
   784		 * event notification. Set the IRQ with IRQF_NOBALANCING to prevent
   785		 * its affinity from being changed.
   786		 */
   787		ret = request_irq(irq, tdx_service_irq_handler, IRQF_NOBALANCING | IRQF_SHARED,
   788	                          "tdx_service_irq", tdev);
   789	        if (ret) {
   790	                pr_err("Event notification IRQ request failed ret:%d\n", ret);
   791	                return -EIO;
   792	        }
   793	
   794	
   795		tdev->irq = irq;
   796	
   797		return ret;
   798	}
   799	
   800	static void tdx_tpm_free_irq(struct tdx_tpm_dev *tdev)
   801	{
   802		if (tdev->irq <= 0)
   803			return;
   804	
   805		free_irq(tdev->irq, tdev);
   806		tdx_free_event_irq(tdev->irq);
   807	}
   808	
   809	static int tdx_tpm_probe(struct platform_device *pdev)
   810	{
   811		struct tdx_tpm_dev *tdev;
   812		struct tpm_chip *chip;
   813		int err;
   814	
   815		tdev = kzalloc(sizeof(*tdev), GFP_KERNEL);
   816		if (!tdev)
   817			return -ENOMEM;
   818	
   819		tdev->dev = &pdev->dev;
   820		mutex_init(&tdev->tpm_req_lock);
   821	
   822		err = tdx_tpm_alloc_buf(tdev);
   823		if (err)
   824			goto free_tdev;
   825	
   826		err = tdx_tpm_init_session(tdev);
   827		if (err)
   828			goto free_buf;
   829	
   830		init_completion(&tdev->service.compl);
   831	
   832		err = tdx_tpm_alloc_irq(tdev);
   833		if (err)
   834			goto free_session;
   835	
   836		chip = tpmm_chip_alloc(&pdev->dev, &tpm_chip_ops);
   837		if (IS_ERR(chip)) {
   838			err = PTR_ERR(chip);
   839			goto free_cb;
   840		}
   841	
   842		tdev->chip = chip;
   843		dev_set_drvdata(&chip->dev, tdev);
   844	
   845		chip->flags |= TPM_CHIP_FLAG_IRQ;
   846		err = tpm2_probe(chip);
   847		if (err)
   848			goto free_cb;
   849	
   850		err = tpm_chip_register(chip);
   851		if (err)
   852			goto free_cb;
   853	
   854		dev_info(&pdev->dev, "TDX vTPM %s device\n",
   855			 (chip->flags & TPM_CHIP_FLAG_TPM2) ? "2.0" : "1.2");
   856	
   857		return 0;
   858	
   859	free_cb:
   860		tdx_tpm_free_irq(tdev);
   861	free_session:
   862		tdx_tpm_deinit_session(tdev);
   863	free_buf:
   864		tdx_tpm_free_buf(tdev);
   865	free_tdev:
   866		kfree(tdev);
   867	
   868		return err;
   869	}
   870	
   871	static int tdx_tpm_remove(struct platform_device *pdev)
   872	{
   873		struct tpm_chip *chip = dev_get_drvdata(&pdev->dev);
   874		struct tdx_tpm_dev *tdev = dev_get_drvdata(&chip->dev);
   875	
   876		tdx_tpm_free_irq(tdev);
   877		tdx_tpm_deinit_session(tdev);
   878		tdx_tpm_free_buf(tdev);
   879		tpm_chip_unregister(tdev->chip);
   880		kfree(tdev);
   881		return 0;
   882	}
   883	
 > 884	static const struct x86_cpu_id tdx_guest_ids[] = {
   885		X86_MATCH_FEATURE(X86_FEATURE_TDX_GUEST, NULL),
   886		{}
   887	};
   888	MODULE_DEVICE_TABLE(x86cpu, tdx_guest_ids);
   889	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
