Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCA42C861;
	Sat, 25 Nov 2023 17:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kUNWuo1E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700933718; x=1732469718;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bmhI5kutcTAJ6FMy5WC54ZFGHyBZ4g6rKuRANO/Kjqs=;
  b=kUNWuo1Ew7ghfiUAi+lIBDBThnAmUtqdklxhaYj94RTpuxXpPkhwxgys
   ZQKdG7X1sFvBCNnkILIxyLUIIb6rNUCjVx4A6fJQCKGzPcXlOOlodQ4eZ
   VWp5/zJ1IZMqsIM9AJgYN0N6aCp/HF3NwpZ7UDod1YAKrHRMZhen0/f6f
   Ffvz0nJkVw9Upjs4ouXvL5RsRFkznk81olSm/4hE3UI1Qvn7ldltWMsVZ
   ywZ+4WQg2nsaXMp27CzU5LsHMsxyjBx9qQi4HTks/c6G1xqrcsLkj93OL
   obtuVW1gmB+GhawKsC6TAZudKXV7GPBXXjvSNwdpqLZF8Ln+vk4rL+0DW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="377570816"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="377570816"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 09:35:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="1099368302"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="1099368302"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 25 Nov 2023 09:35:16 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6wYk-0004FZ-0V;
	Sat, 25 Nov 2023 17:35:14 +0000
Date: Sun, 26 Nov 2023 01:34:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-tpm 5/6] drivers/char/tpm/tpm_tdx.c:685:6: warning:
 variable 'ret' is used uninitialized whenever 'if' condition is true
Message-ID: <202311260013.rBRWcyzN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-tpm
head:   8fc95ae74b62b245179fb0a0a84dc5f5d8ce80aa
commit: db9652ec7a5bff8428a39af5c4aa706f62550ee2 [5/6] tpm: Add vTPM TDX support
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20231126/202311260013.rBRWcyzN-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231126/202311260013.rBRWcyzN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311260013.rBRWcyzN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/char/tpm/tpm_tdx.c:26:
   In file included from drivers/char/tpm/tpm.h:28:
   include/linux/tpm_eventlog.h:167:6: warning: variable 'mapping_size' set but not used [-Wunused-but-set-variable]
           int mapping_size;
               ^
>> drivers/char/tpm/tpm_tdx.c:685:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (spdm->trans_ver != TDX_SESS_SPDM_TRANS_VER ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm_tdx.c:716:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   drivers/char/tpm/tpm_tdx.c:685:2: note: remove the 'if' if its condition is always false
           if (spdm->trans_ver != TDX_SESS_SPDM_TRANS_VER ||
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/char/tpm/tpm_tdx.c:685:6: warning: variable 'ret' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
           if (spdm->trans_ver != TDX_SESS_SPDM_TRANS_VER ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm_tdx.c:716:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   drivers/char/tpm/tpm_tdx.c:685:6: note: remove the '||' if its condition is always false
           if (spdm->trans_ver != TDX_SESS_SPDM_TRANS_VER ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm_tdx.c:658:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   3 warnings generated.


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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
