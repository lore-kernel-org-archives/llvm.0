Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0431B11CAF;
	Fri, 28 Nov 2025 02:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764296332; cv=none; b=svXCyxXvJBQouVPkHXpriIfCD3MLAjepExz6d56/PqTQjqo5zSb5S68drKL4OnKgoaE+abiSCWPvvnunS489s8pjoDv5s0oKLzFlPC4IBoQRa3xOEBpAKnCyZKlgwqKLqnGYeQX8cZtN79ENP4yLnn83k6qV+GkcZNJWl6nvNmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764296332; c=relaxed/simple;
	bh=pHlW/hd1JrcoH2N+9BS7xLGaI3AvAO3M2gZf+1AROPs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xmyw1S38GBXj9dQHpSPOWKDMsegdO1UxoVcLnnT4tF4xIow0WeYYaREQt0/aBgagmqftioEk2AdWOjOp7G/Y6fvUkr1tY4HCJ0vC5/an0VJswAQEo6ZKF7gEF1Zkwt8q70H61IsV6gvAfokuqn4kRAJ6UYn6RbJzpx6/YWfbDF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cjCbxOKq; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cjCbxOKq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764296331; x=1795832331;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pHlW/hd1JrcoH2N+9BS7xLGaI3AvAO3M2gZf+1AROPs=;
  b=cjCbxOKqJY2GN7rY3WYXT54jxpDh9tJrX19ZMSgCvSDCEUEb08mQmAmh
   2owazLhSccmOkVtWY91gSmsk94ch+1D9GzHOPoCaOpwqRzzWNCt27yEY3
   ubFsP4HfI3ukLdSOXU/9FZPKqSCF4/3wcb/KNcUDaX4A/q5OlrXnYyex/
   AoeTbTbpr/hXjROeilx6+PUpfSujdsgt4OsOJ0ns9vD1Fx+F3bLyGDs3B
   ekQUQMIAJWmmOgN2T/UmI059w/Vtmmma16t8Bxsh9O6nabnZGWnHt1kq7
   MbELdY4b14ZxJn2f/mih/ARfXE9kd/wAYP+XtVYz67UoIstE6ri22lBRD
   w==;
X-CSE-ConnectionGUID: oNm5/+8aQRK6e7Jaapj2EQ==
X-CSE-MsgGUID: sdHl671HT/K0jOZ7DtoKqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="53901296"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="53901296"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 18:18:50 -0800
X-CSE-ConnectionGUID: dCXZxGKrTJixPEY6p4neHg==
X-CSE-MsgGUID: bogRT/U+QpeySXaghlJVcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="198459133"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 27 Nov 2025 18:18:48 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOo4M-000000001uL-2fKP;
	Fri, 28 Nov 2025 02:18:46 +0000
Date: Fri, 28 Nov 2025 03:18:16 +0100
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:renesas-lts/v6.18-rc6-2025-11-20-x5h-ironhide-2 41/41]
 drivers/mailbox/mailbox.c:417:20: error: call to undeclared function
 'kcalloc'; ISO C99 and later do not support implicit function declarations
Message-ID: <202511280349.OU5mEu5l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-lts/v6.18-rc6-2025-11-20-x5h-ironhide-2
head:   2b4bb2b272501af9302a01713e7e35ec89d1297a
commit: 2b4bb2b272501af9302a01713e7e35ec89d1297a [41/41] mailbox: add new {fw/of}_xlate_with_name()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251128/202511280349.OU5mEu5l-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251128/202511280349.OU5mEu5l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511280349.OU5mEu5l-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mailbox/mailbox.c:417:20: error: call to undeclared function 'kcalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     417 |         mbox_name_array = kcalloc(index + 1, sizeof(char*), GFP_KERNEL);
         |                           ^
>> drivers/mailbox/mailbox.c:417:18: error: incompatible integer to pointer conversion assigning to 'const char **' from 'int' [-Wint-conversion]
     417 |         mbox_name_array = kcalloc(index + 1, sizeof(char*), GFP_KERNEL);
         |                         ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mailbox/mailbox.c:459:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     459 |         kfree(mbox_name_array);
         |         ^
   3 errors generated.


vim +/kcalloc +417 drivers/mailbox/mailbox.c

   367	
   368	/**
   369	 * mbox_request_channel - Request a mailbox channel.
   370	 * @cl: Identity of the client requesting the channel.
   371	 * @index: Index of mailbox specifier in 'mboxes' property.
   372	 *
   373	 * The Client specifies its requirements and capabilities while asking for
   374	 * a mailbox channel. It can't be called from atomic context.
   375	 * The channel is exclusively allocated and can't be used by another
   376	 * client before the owner calls mbox_free_channel.
   377	 * After assignment, any packet received on this channel will be
   378	 * handed over to the client via the 'rx_callback'.
   379	 * The framework holds reference to the client, so the mbox_client
   380	 * structure shouldn't be modified until the mbox_free_channel returns.
   381	 *
   382	 * Return: Pointer to the channel assigned to the client if successful.
   383	 *		ERR_PTR for request failure.
   384	 */
   385	struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index)
   386	{
   387		struct fwnode_reference_args fwspec;
   388		struct fwnode_handle *fwnode;
   389		struct mbox_controller *mbox;
   390		struct of_phandle_args spec;
   391		struct mbox_chan *chan;
   392		struct device *dev;
   393		const char **mbox_name_array;
   394		const char *mbox_name;
   395		unsigned int i;
   396		int ret;
   397	
   398		dev = cl->dev;
   399		if (!dev) {
   400			pr_debug("No owner device\n");
   401			return ERR_PTR(-ENODEV);
   402		}
   403	
   404		fwnode = dev_fwnode(dev);
   405		if (!fwnode) {
   406			dev_dbg(dev, "No owner fwnode\n");
   407			return ERR_PTR(-ENODEV);
   408		}
   409	
   410		ret = fwnode_property_get_reference_args(fwnode, "mboxes", "#mbox-cells",
   411							 0, index, &fwspec);
   412		if (ret) {
   413			dev_err(dev, "%s: can't parse \"%s\" property\n", __func__, "mboxes");
   414			return ERR_PTR(ret);
   415		}
   416	
 > 417		mbox_name_array = kcalloc(index + 1, sizeof(char*), GFP_KERNEL);
   418		if (!mbox_name_array)
   419			return ERR_PTR(-ENOMEM);
   420	
   421		mbox_name = NULL;
   422		ret = fwnode_property_read_string_array(fwnode, "mbox-names", mbox_name_array, index + 1);
   423		if (ret > 0)
   424			mbox_name = mbox_name_array[index];
   425	
   426		spec.np = to_of_node(fwspec.fwnode);
   427		spec.args_count = fwspec.nargs;
   428		for (i = 0; i < spec.args_count; i++)
   429			spec.args[i] = fwspec.args[i];
   430	
   431		scoped_guard(mutex, &con_mutex) {
   432			chan = ERR_PTR(-EPROBE_DEFER);
   433			list_for_each_entry(mbox, &mbox_cons, node) {
   434				if (device_match_fwnode(mbox->dev, fwspec.fwnode)) {
   435					if (mbox_name && mbox->fw_xlate_with_name)
   436						chan = mbox->fw_xlate_with_name(mbox, &fwspec, mbox_name);
   437					else if (mbox->fw_xlate)
   438						chan = mbox->fw_xlate(mbox, &fwspec);
   439					else if (mbox_name && mbox->of_xlate_with_name)
   440						chan = mbox->of_xlate_with_name(mbox, &spec, mbox_name);
   441					else if (mbox->of_xlate)
   442						chan = mbox->of_xlate(mbox, &spec);
   443	
   444					if (!IS_ERR(chan))
   445						break;
   446				}
   447			}
   448	
   449			fwnode_handle_put(fwspec.fwnode);
   450	
   451			if (IS_ERR(chan))
   452				goto end;
   453	
   454			ret = __mbox_bind_client(chan, cl);
   455			if (ret)
   456				chan = ERR_PTR(ret);
   457		}
   458	end:
 > 459		kfree(mbox_name_array);
   460	
   461		return chan;
   462	}
   463	EXPORT_SYMBOL_GPL(mbox_request_channel);
   464	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
