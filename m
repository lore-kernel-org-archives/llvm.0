Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87DA1A9F9D;
	Sun, 30 Nov 2025 08:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764489651; cv=none; b=mqfNAN0H8SQ4XJBZSWp3RZ+s7bQN6P3LmcVAVnHTY7EEhfDCF74vgUz7sVqpfgqVn7bl73YYwz4EXYHAh0U9paGGU1RK3C6aA8U5ox2AotPSy89vLWZsbaoHhgxW0EpnQ+GB0D6lZ/W7YQvz5gV8h12SgmriEcifQEfIbEw772Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764489651; c=relaxed/simple;
	bh=53cztIzlR2Ass5gqJ+++MZ3YpGg8zrLQ1dSHG6KF/oQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ka5QtRJLC4EA0FH3jgN5kJnkVVMW2CXKcs4rfka2SRztlPdmi49uBHi2A9SJ0xdyV8dTQYgDzFYbNqz7pB0MjlfFfGpAziz7o8klXmjJpLZk2R7a34pCMIQHwQhwuDOwZVrnWYu9ikCpRRt5MtzgfYac53obujsJD5rioYkMPgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UwM0cIOS; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UwM0cIOS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764489649; x=1796025649;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=53cztIzlR2Ass5gqJ+++MZ3YpGg8zrLQ1dSHG6KF/oQ=;
  b=UwM0cIOS1BK6teuXe0GcBkqjvihe+HxWCy19nLVpQV6KWwpbefWClOJT
   dCXLhKjpl+K/yiAGL36ra4FljuPbpvCyLkNAR3/hSgwpIfnED02vGY6Do
   SpNJxDo/wZ/M7BbyF7QtJYaTgXUVuCZHWttk+Jx/Yl/wP2iE3BmJBswUD
   dTHHPPiZztE68nW4tnqju7i3fAW2aXE723YES5jMIRkXN/OF9qhlJY786
   M5Vd5CuegqfpCE8cijsS+f/W+6lpKeROJr9wGzyFtMutYGbQOPkgBIrFQ
   BzjK6NCRSUI0qPFFu1awJ8a8uOZ6s9UlJ53rs5nKeQ7+YCt98w7IR8GsS
   g==;
X-CSE-ConnectionGUID: JSW63VeUQom+q1PDcOCKew==
X-CSE-MsgGUID: cR2JfxLFS0ScH9M72Wz0mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="70063576"
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="70063576"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 00:00:49 -0800
X-CSE-ConnectionGUID: vPPpO0dzSfWfeuSowRltqg==
X-CSE-MsgGUID: UCSxGn1kQdO7pu9J4oepaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="224751411"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Nov 2025 00:00:47 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPcMP-000000007qr-0PlY;
	Sun, 30 Nov 2025 08:00:45 +0000
Date: Sun, 30 Nov 2025 16:00:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:renesas-lts/v6.18-rc7-2025-11-28-x5h-ironhide 28/47]
 drivers/mailbox/mailbox.c:417:20: error: call to undeclared function
 'kcalloc'; ISO C99 and later do not support implicit function declarations
Message-ID: <202511301557.HTwLWXXf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-lts/v6.18-rc7-2025-11-28-x5h-ironhide
head:   dac97751f6745ddc03959e82044a8fb87b887d80
commit: 92dabc48c39c54d73848ab0de6e901c844dbc954 [28/47] mailbox: add new {fw/of}_xlate_with_name()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251130/202511301557.HTwLWXXf-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251130/202511301557.HTwLWXXf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511301557.HTwLWXXf-lkp@intel.com/

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
