Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3E94BEE37;
	Fri, 18 Sep 2026 10:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789728236; cv=none; b=jcXPIihlXSVaLTxiOAcAsq4yzSXXBR9kvAchcOqZiXRTYoaIOW9QZ/72BJGGlOJdkuznfHSLey6Ww2fWpTECkKN2C4zAzMLyVPrFUV2e6yK+PmqMbNFblc2Wuu1L0Fwq+9hCp97hyS9tH6Y/cEgW4wM9ea9+ERlEb6n7N6jFUu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789728236; c=relaxed/simple;
	bh=H90OXW+xJ8y/ZyagLrAORG+a2SeSyOt74HFyBBNlOig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G0uS7FOkQJOMh9aTnrhPyz9htJnVh4W1pAh5+DJKVnfzlmTSwDEwqME7GL4i8QQ+tGbCvQOuKbbuzMSyNxNY2Lt8jbGRiDycpRyrSj8byMOl5hwY5O59htuXVNyE47NwO6UmQbDbaJ0pf5+XWxJRWPuRHgLUtV3N2MClLI41wbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MbKbthlC; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MbKbthlC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789728233; x=1821264233;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H90OXW+xJ8y/ZyagLrAORG+a2SeSyOt74HFyBBNlOig=;
  b=MbKbthlCVBZ+79bMBrH5jHSe+Btdu0ywhzZkFLUaw0N16dOL8YRogp5w
   2pdCfaqug73eK+dZJIiVHGyOYCcVDNlLNGDgXWlvNRUwl0yp5kWqgeTG7
   5G+Th4GjzsJRMU0+6hg/oP+Kt6ajThf0HvlTRrJVmjHAD7g4O1ZjIZztg
   t5ASve8mxkHUvhAnbupdHDNFt5KqHZlCFHlUS0IsAra3h3l+/nP1ch6Jl
   /DhmGADeZG4X2mfwuTw8aMUj7qtFthl4YO/A1R9psIM6ytOYE9r28hUb3
   7A9uHw3ZPuH2YoEY7s2mAsIJ/n0et69ZrUTvWYZLucCGkN+MOV0hsBwn8
   A==;
X-CSE-ConnectionGUID: hvf94+A+R9GKqWHePoBpFg==
X-CSE-MsgGUID: ugYi3Os+S9SgNBJehrHRvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107728494"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="107728494"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 03:43:52 -0700
X-CSE-ConnectionGUID: JjzWsOnCTZmgebUGheKsxQ==
X-CSE-MsgGUID: 52R3AJ4MQKmn38JKMk591A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271657035"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 Sep 2026 03:43:50 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7W4G-000000009cb-3mDT;
	Fri, 18 Sep 2026 10:43:44 +0000
Date: Fri, 18 Sep 2026 18:43:18 +0800
From: kernel test robot <lkp@intel.com>
To: Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	intel-wired-lan@lists.osuosl.org, anthony.l.nguyen@intel.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: From: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
Message-ID: <202609181819.j6XGVZPa-lkp@intel.com>
References: <20260917094312.1567881-3-aleksandr.loktionov@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917094312.1567881-3-aleksandr.loktionov@intel.com>

Hi Aleksandr,

kernel test robot noticed the following build errors:

[auto build test ERROR on tnguy-next-queue/dev-queue]
[also build test ERROR on tnguy-net-queue/dev-queue linus/master v7.3-rc3 next-20260916]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aleksandr-Loktionov/From-Aleksandr-Loktionov-aleksandr-loktionov-intel-com/20260917-114312
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
patch link:    https://lore.kernel.org/r/20260917094312.1567881-3-aleksandr.loktionov%40intel.com
patch subject: From: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260918/202609181819.j6XGVZPa-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 7252edd9aa82ef1c570ff6694ef7f4763a8a5d2f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260918/202609181819.j6XGVZPa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609181819.j6XGVZPa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/intel/ice/ice_fw_update.c:255:37: error: use of undeclared identifier 'ICE_F_EROT'
     255 |                 if (!ice_is_feature_supported(pf, ICE_F_EROT)) {
         |                                                   ^~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_fw_update.c:680:42: error: use of undeclared identifier 'ICE_F_EROT'
     680 |         if (!ice_is_feature_supported(priv->pf, ICE_F_EROT))
         |                                                 ^~~~~~~~~~
   2 errors generated.


vim +/ICE_F_EROT +255 drivers/net/ethernet/intel/ice/ice_fw_update.c

   213	
   214	/**
   215	 * ice_send_component_table - Send PLDM component table to firmware
   216	 * @context: PLDM fw update structure
   217	 * @component: the component to process
   218	 * @transfer_flag: relative transfer order of this component
   219	 *
   220	 * Read relevant data from the component and forward it to the device
   221	 * firmware. Check the response to determine if the firmware indicates that
   222	 * the update can proceed.
   223	 *
   224	 * This function sends AdminQ commands related to the NVM, and assumes that
   225	 * the NVM resource has been acquired.
   226	 *
   227	 * Returns: zero on success, or a negative error code on failure.
   228	 */
   229	static int
   230	ice_send_component_table(struct pldmfw *context, struct pldmfw_component *component,
   231				 u8 transfer_flag)
   232	{
   233		struct ice_fwu_priv *priv = container_of(context, struct ice_fwu_priv, context);
   234		struct netlink_ext_ack *extack = priv->extack;
   235		struct ice_aqc_nvm_comp_tbl *comp_tbl;
   236		u8 comp_response, comp_response_code;
   237		struct device *dev = context->dev;
   238		struct ice_pf *pf = priv->pf;
   239		struct ice_hw *hw = &pf->hw;
   240		size_t length;
   241		u8 comp_bit;
   242		int status;
   243	
   244		switch (component->identifier) {
   245		case NVM_COMP_ID_OROM:
   246			comp_bit = ICE_FWU_COMP_OROM;
   247			break;
   248		case NVM_COMP_ID_NVM:
   249			comp_bit = ICE_FWU_COMP_NVM;
   250			break;
   251		case NVM_COMP_ID_NETLIST:
   252			comp_bit = ICE_FWU_COMP_NETLIST;
   253			break;
   254		case NVM_COMP_ID_MANIFEST:
 > 255			if (!ice_is_feature_supported(pf, ICE_F_EROT)) {
   256				dev_err(dev, "Unable to update due to a firmware component with unknown ID %u\n",
   257					component->identifier);
   258				NL_SET_ERR_MSG_MOD(extack,
   259						   "Unable to update due to unknown firmware component");
   260				return -EOPNOTSUPP;
   261			}
   262			comp_bit = ICE_FWU_COMP_MANIFEST;
   263			break;
   264		default:
   265			dev_err(dev, "Unable to update due to a firmware component with unknown ID %u\n",
   266				component->identifier);
   267			NL_SET_ERR_MSG_MOD(extack, "Unable to update due to unknown firmware component");
   268			return -EOPNOTSUPP;
   269		}
   270	
   271		if (priv->seen_components & comp_bit) {
   272			dev_err(dev, "Duplicate component in PLDM image: component ID 0x%02x\n",
   273				component->identifier);
   274			NL_SET_ERR_MSG_MOD(extack, "Duplicate component in PLDM image");
   275			return -EOPNOTSUPP;
   276		}
   277		priv->seen_components |= comp_bit;
   278	
   279		length = struct_size(comp_tbl, cvs, component->version_len);
   280		comp_tbl = kzalloc(length, GFP_KERNEL);
   281		if (!comp_tbl)
   282			return -ENOMEM;
   283	
   284		comp_tbl->comp_class = cpu_to_le16(component->classification);
   285		comp_tbl->comp_id = cpu_to_le16(component->identifier);
   286		comp_tbl->comp_class_idx = FWU_COMP_CLASS_IDX_NOT_USE;
   287		comp_tbl->comp_cmp_stamp = cpu_to_le32(component->comparison_stamp);
   288		comp_tbl->cvs_type = component->version_type;
   289		comp_tbl->cvs_len = component->version_len;
   290		memcpy(comp_tbl->cvs, component->version_string, component->version_len);
   291	
   292		dev_dbg(dev, "Sending component table to firmware:\n");
   293	
   294		status = ice_nvm_pass_component_tbl(hw, (u8 *)comp_tbl, length,
   295						    transfer_flag, &comp_response,
   296						    &comp_response_code, NULL);
   297	
   298		kfree(comp_tbl);
   299	
   300		if (status) {
   301			dev_err(dev, "Failed to transfer component table to firmware, err %d aq_err %s\n",
   302				status, libie_aq_str(hw->adminq.sq_last_status));
   303			NL_SET_ERR_MSG_MOD(extack, "Failed to transfer component table to firmware");
   304			return -EIO;
   305		}
   306	
   307		return ice_check_component_response(pf, component->identifier, comp_response,
   308						    comp_response_code, extack);
   309	}
   310	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
