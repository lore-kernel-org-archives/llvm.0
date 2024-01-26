Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBC620335;
	Fri, 26 Jan 2024 17:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706291951; cv=none; b=ZnOBhc6st0QmsTpHPijkZAw8ccMAnm4+BS2xKL/DGNysARyhly8w+6XVzh8bwbFEJmr6z44PbEEBRzY0O4KZ5vWB3qTVf6Z6WxE3eqOmQevmGqqnRfc5Vqd+v35ZABP28wu+HeEEMLWWAIvXGW/XrMcTY8fPH6m2UFXuOvcCVhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706291951; c=relaxed/simple;
	bh=4sDsNArP+DbxlQg3IFbkQzmVRN0Zs38ei5gJJdV43Uc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fAOYdXmS4M0wTEwgGsQ6FJvylrf3Kf3TnV6p3ToH8BpTNY9uKTr322gwxfsy+F1wezIIDWSGGvoXPgSkTCb+le4Uf3X9v9ZtRKkt3TNE3LbpBv6jho/4Ushi+s3qShmoPfJqlkGleeBBBn8k6rqoPCUJ2fQlAJeCX5nO0GA695s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RpkoSZIW; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RpkoSZIW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706291949; x=1737827949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4sDsNArP+DbxlQg3IFbkQzmVRN0Zs38ei5gJJdV43Uc=;
  b=RpkoSZIW1z1asYo8YLAwwb2QTHp0Dtn3wbe9bUTUMdrLrE2iqrWhzT8G
   d1oD1ka8Hu2Kf4eaK0eSNyVfNlChULgXv8dzdrhNqlHJKkuaLRN05/USs
   8Sv/YwyyW5pYGAyndZ4orXGNsgayIRxPAtqQWwi9gPugsvW9UdtjNx/RN
   es3wT33pTyfIjsqooIFHxvWSlaQriNiaCsEyoGnEmms67uAZsNu47M/sv
   sDsRwFawAJFWm10SUhjf959GuehKuEhUEuoxXYiGY2CTSUeNpzc2IU5aX
   zsz5S3jab/h+JjSXOmvETgXrWL8EQGOCj5OUOaaRb+nSljiQTDzhfMHXB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="21075845"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="21075845"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2024 09:59:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2798072"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Jan 2024 09:59:05 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTQTn-0001Fs-0P;
	Fri, 26 Jan 2024 17:59:03 +0000
Date: Sat, 27 Jan 2024 01:58:38 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-tpm 5/6] drivers/char/tpm/tpm_tdx.c:175: warning:
 Function parameter or struct member 'tdvmcall_status' not described in
 'tdx_tpm_msg_resp'
Message-ID: <202401270147.6zANIFto-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-tpm
head:   479fce1c3eaa87d98d94d78c485d9a6f0c8dd1fa
commit: 7c617d6ef79632221c7130359d05912e2405216a [5/6] tpm: Add vTPM TDX support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240127/202401270147.6zANIFto-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240127/202401270147.6zANIFto-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401270147.6zANIFto-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/tpm/tpm_tdx.c:175: warning: Function parameter or struct member 'tdvmcall_status' not described in 'tdx_tpm_msg_resp'
>> drivers/char/tpm/tpm_tdx.c:175: warning: Function parameter or struct member 'service_cmd_status' not described in 'tdx_tpm_msg_resp'
>> drivers/char/tpm/tpm_tdx.c:175: warning: Function parameter or struct member 'rsvd' not described in 'tdx_tpm_msg_resp'
>> drivers/char/tpm/tpm_tdx.c:175: warning: Excess struct member 'rsvd1' description in 'tdx_tpm_msg_resp'
>> drivers/char/tpm/tpm_tdx.c:175: warning: Excess struct member 'rsvd2' description in 'tdx_tpm_msg_resp'


vim +175 drivers/char/tpm/tpm_tdx.c

   141	
   142	/**
   143	 * struct tdx_tpm_msg_resp - TDX TPM message response format.
   144	 * @guid: A unique GUID to identify the TDVMCALL service.
   145	 * @buf_len: Length of the response buffer.
   146	 * @rsvd1: Reserved for future use.
   147	 * @service_ver: Version of TPM TDVMCALL command.
   148	 * @service_cmd: TPM TDVMCALL command
   149	 * 		 TDVMCALL_TPM_SEND_MSG - 0x01
   150	 * 		 TDVMCALL_TPM_RECV_MSG - 0x02
   151	 * @rsvd2: Reserved for future use.
   152	 * @spdm: SPDM Message header.
   153	 * @aad: SPDM AAD data.
   154	 * @app_data: SPDM application data.
   155	 *
   156	 * For more details, refer to TDX vTPM specification, r1.0, section titled
   157	 * "SPDM Secure Session Message Format".
   158	 */
   159	struct tdx_tpm_msg_resp {
   160		/* TDVMCALL service response header */
   161		u8 guid[16];
   162		u32 buf_len;
   163		u32 tdvmcall_status;
   164	
   165		/* TDVMCALL TPM Command Buffer response */
   166		u8 service_ver;
   167		u8 service_cmd;
   168		u8 service_cmd_status;
   169		u8 rsvd;
   170	
   171		/* SPDM Message */
   172		struct spdm_msg_hdr spdm;
   173		struct spdm_aad aad;
   174		struct spdm_data app_data;
 > 175	} __packed;
   176	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
