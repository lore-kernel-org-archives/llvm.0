Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D934C98;
	Sat,  6 Sep 2025 08:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757147419; cv=none; b=KpfQaVPEbMCn4HCGypxPwOHUJMrt6649vhwXQk/ijjVnz41oZavoGqrr6LeQqGUaumUwma1ZpoAmg0X8CCjUrCM+m8AoerUd3tO0aH8qG//0hZZZQ1wuV1xezNTvB6xeU+33yDje6EfWORBauCzm13EldtLvk/dZ+9JbEV3FXyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757147419; c=relaxed/simple;
	bh=bXfOwuxYjk3z4bYNmZAlCaKeTG52RZ0kD4nS/oh6jdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J9l6sKUbpbZEN+fGveCsNie+LVF5LCzBhNAY4NlHyPTitalxsQfb/6m+FJkBudM686IRh0PzPS76Fb8jjVHYFQFEFndWo6FQaWKKpmsuF9PJchlYWCxs8vXNiPvUqzg6ub2n+hEekm8V6oBbSN9LS6ONzN/z+Z3FM494sGPu3aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J/hRXaY7; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J/hRXaY7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757147418; x=1788683418;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bXfOwuxYjk3z4bYNmZAlCaKeTG52RZ0kD4nS/oh6jdQ=;
  b=J/hRXaY7yJ0CFUb+iyB/eVJzLy/wVSTVG1fPFAGuwWrBUR0IFLomC1ol
   r2xVqRNUEAAIGuaFJ8qwTMeCmGfj6TXsLRtKa+oJ2YxK65vGLyo3M1H0O
   I9QRy9Kqp7Y/1M4oFX3sYVdRBgTdhLgGDq0Tnb/9pINBz5uGyBzs9iLoW
   E8fZfbvrLxWelavV87pOpBhen+6LNddMLz1JCSvKHOSlb6daTWcyyvJDm
   uPfQlSI/eZRufkGCDGLMjMTcGoSaYkGXmzrziuHGxs3U0HTRXi+QRmIet
   NqggXGSgwp98UP0O6AEvS4VNYYljGJXq/oRzex/V2onb712zBLSH/2K43
   A==;
X-CSE-ConnectionGUID: 9gA41viERLyNpHbmffU3jg==
X-CSE-MsgGUID: sDBNvvdUQbSRKftJINfl3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="70580642"
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; 
   d="scan'208";a="70580642"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 01:30:16 -0700
X-CSE-ConnectionGUID: VzQmH+bdSfGmClNUXpclKg==
X-CSE-MsgGUID: GS4Hy+66RjCn80UJgCTT2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; 
   d="scan'208";a="171536228"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 06 Sep 2025 01:30:14 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuoJH-0001JG-0f;
	Sat, 06 Sep 2025 08:30:11 +0000
Date: Sat, 6 Sep 2025 16:30:00 +0800
From: kernel test robot <lkp@intel.com>
To: Pooja Katiyar <pooja.katiyar@intel.com>, linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dmitry.baryshkov@oss.qualcomm.com, pooja.katiyar@intel.com,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v3 1/4] usb: typec: ucsi: Update UCSI structure to have
 message in and message out fields
Message-ID: <202509061553.9MqCFYMQ-lkp@intel.com>
References: <109c631547b41ce7af26a7c3e9bfd5ab87fa4587.1757024530.git.pooja.katiyar@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <109c631547b41ce7af26a7c3e9bfd5ab87fa4587.1757024530.git.pooja.katiyar@intel.com>

Hi Pooja,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-linus]
[also build test ERROR on westeri-thunderbolt/next linus/master v6.17-rc4]
[cannot apply to usb/usb-testing usb/usb-next next-20250905]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pooja-Katiyar/usb-typec-ucsi-Update-UCSI-structure-to-have-message-in-and-message-out-fields/20250906-123240
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
patch link:    https://lore.kernel.org/r/109c631547b41ce7af26a7c3e9bfd5ab87fa4587.1757024530.git.pooja.katiyar%40intel.com
patch subject: [PATCH v3 1/4] usb: typec: ucsi: Update UCSI structure to have message in and message out fields
config: x86_64-buildonly-randconfig-004-20250906 (https://download.01.org/0day-ci/archive/20250906/202509061553.9MqCFYMQ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250906/202509061553.9MqCFYMQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509061553.9MqCFYMQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/typec/ucsi/ucsi_yoga_c630.c:129:53: error: too many arguments to function call, expected 3, have 5
     129 |         ret = ucsi_sync_control_common(ucsi, command, cci, data, size);
         |               ~~~~~~~~~~~~~~~~~~~~~~~~                     ^~~~~~~~~~
   drivers/usb/typec/ucsi/ucsi.h:552:5: note: 'ucsi_sync_control_common' declared here
     552 | int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci);
         |     ^                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/typec/ucsi/ucsi_yoga_c630.c:173:18: error: incompatible function pointer types initializing 'int (*)(struct ucsi *, u64, u32 *)' (aka 'int (*)(struct ucsi *, unsigned long long, unsigned int *)') with an expression of type 'int (struct ucsi *, u64, u32 *, void *, size_t)' (aka 'int (struct ucsi *, unsigned long long, unsigned int *, void *, unsigned long)') [-Wincompatible-function-pointer-types]
     173 |         .sync_control = yoga_c630_ucsi_sync_control,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +173 drivers/usb/typec/ucsi/ucsi_yoga_c630.c

2ea6d07efe5388 Dmitry Baryshkov      2024-06-24   88  
eebd39f8a89985 Dmitry Baryshkov      2025-06-21   89  static int yoga_c630_ucsi_sync_control(struct ucsi *ucsi,
eebd39f8a89985 Dmitry Baryshkov      2025-06-21   90  				       u64 command,
eebd39f8a89985 Dmitry Baryshkov      2025-06-21   91  				       u32 *cci,
eebd39f8a89985 Dmitry Baryshkov      2025-06-21   92  				       void *data, size_t size)
eebd39f8a89985 Dmitry Baryshkov      2025-06-21   93  {
442392f98d20c5 Dmitry Baryshkov      2025-06-21   94  	int ret;
442392f98d20c5 Dmitry Baryshkov      2025-06-21   95  
442392f98d20c5 Dmitry Baryshkov      2025-06-21   96  	/*
442392f98d20c5 Dmitry Baryshkov      2025-06-21   97  	 * EC doesn't return connector's DP mode even though it is supported.
442392f98d20c5 Dmitry Baryshkov      2025-06-21   98  	 * Fake it.
442392f98d20c5 Dmitry Baryshkov      2025-06-21   99  	 */
442392f98d20c5 Dmitry Baryshkov      2025-06-21  100  	if (UCSI_COMMAND(command) == UCSI_GET_ALTERNATE_MODES &&
442392f98d20c5 Dmitry Baryshkov      2025-06-21  101  	    UCSI_GET_ALTMODE_GET_CONNECTOR_NUMBER(command) == 1 &&
442392f98d20c5 Dmitry Baryshkov      2025-06-21  102  	    UCSI_ALTMODE_RECIPIENT(command) == UCSI_RECIPIENT_CON &&
442392f98d20c5 Dmitry Baryshkov      2025-06-21  103  	    UCSI_ALTMODE_OFFSET(command) == 0) {
442392f98d20c5 Dmitry Baryshkov      2025-06-21  104  		static const struct ucsi_altmode alt = {
442392f98d20c5 Dmitry Baryshkov      2025-06-21  105  			.svid = USB_TYPEC_DP_SID,
442392f98d20c5 Dmitry Baryshkov      2025-06-21  106  			.mid = USB_TYPEC_DP_MODE,
442392f98d20c5 Dmitry Baryshkov      2025-06-21  107  		};
442392f98d20c5 Dmitry Baryshkov      2025-06-21  108  
442392f98d20c5 Dmitry Baryshkov      2025-06-21  109  		dev_dbg(ucsi->dev, "faking DP altmode for con1\n");
442392f98d20c5 Dmitry Baryshkov      2025-06-21  110  		memset(data, 0, size);
442392f98d20c5 Dmitry Baryshkov      2025-06-21  111  		memcpy(data, &alt, min(sizeof(alt), size));
442392f98d20c5 Dmitry Baryshkov      2025-06-21  112  		*cci = UCSI_CCI_COMMAND_COMPLETE | UCSI_SET_CCI_LENGTH(sizeof(alt));
442392f98d20c5 Dmitry Baryshkov      2025-06-21  113  		return 0;
442392f98d20c5 Dmitry Baryshkov      2025-06-21  114  	}
442392f98d20c5 Dmitry Baryshkov      2025-06-21  115  
eebd39f8a89985 Dmitry Baryshkov      2025-06-21  116  	/*
eebd39f8a89985 Dmitry Baryshkov      2025-06-21  117  	 * EC can return AltModes present on CON1 (port0, right) for CON2
eebd39f8a89985 Dmitry Baryshkov      2025-06-21  118  	 * (port1, left) too. Ignore all requests going to CON2 (it doesn't
eebd39f8a89985 Dmitry Baryshkov      2025-06-21  119  	 * support DP anyway).
eebd39f8a89985 Dmitry Baryshkov      2025-06-21  120  	 */
eebd39f8a89985 Dmitry Baryshkov      2025-06-21  121  	if (UCSI_COMMAND(command) == UCSI_GET_ALTERNATE_MODES &&
eebd39f8a89985 Dmitry Baryshkov      2025-06-21  122  	    UCSI_GET_ALTMODE_GET_CONNECTOR_NUMBER(command) == 2) {
eebd39f8a89985 Dmitry Baryshkov      2025-06-21  123  		dev_dbg(ucsi->dev, "ignoring altmodes for con2\n");
eebd39f8a89985 Dmitry Baryshkov      2025-06-21  124  		memset(data, 0, size);
eebd39f8a89985 Dmitry Baryshkov      2025-06-21  125  		*cci = UCSI_CCI_COMMAND_COMPLETE;
eebd39f8a89985 Dmitry Baryshkov      2025-06-21  126  		return 0;
eebd39f8a89985 Dmitry Baryshkov      2025-06-21  127  	}
eebd39f8a89985 Dmitry Baryshkov      2025-06-21  128  
e943c93333e305 Dmitry Baryshkov      2025-06-21 @129  	ret = ucsi_sync_control_common(ucsi, command, cci, data, size);
e943c93333e305 Dmitry Baryshkov      2025-06-21  130  	if (ret < 0)
e943c93333e305 Dmitry Baryshkov      2025-06-21  131  		return ret;
e943c93333e305 Dmitry Baryshkov      2025-06-21  132  
e943c93333e305 Dmitry Baryshkov      2025-06-21  133  	/* UCSI_GET_CURRENT_CAM is off-by-one on all ports */
e943c93333e305 Dmitry Baryshkov      2025-06-21  134  	if (UCSI_COMMAND(command) == UCSI_GET_CURRENT_CAM && data)
e943c93333e305 Dmitry Baryshkov      2025-06-21  135  		((u8 *)data)[0]--;
e943c93333e305 Dmitry Baryshkov      2025-06-21  136  
e943c93333e305 Dmitry Baryshkov      2025-06-21  137  	return ret;
eebd39f8a89985 Dmitry Baryshkov      2025-06-21  138  }
eebd39f8a89985 Dmitry Baryshkov      2025-06-21  139  
e0c48e42d818ab Dmitry Baryshkov      2025-06-21  140  static bool yoga_c630_ucsi_update_altmodes(struct ucsi *ucsi,
e0c48e42d818ab Dmitry Baryshkov      2025-06-21  141  					   u8 recipient,
e0c48e42d818ab Dmitry Baryshkov      2025-06-21  142  					   struct ucsi_altmode *orig,
e0c48e42d818ab Dmitry Baryshkov      2025-06-21  143  					   struct ucsi_altmode *updated)
e0c48e42d818ab Dmitry Baryshkov      2025-06-21  144  {
e0c48e42d818ab Dmitry Baryshkov      2025-06-21  145  	int i;
e0c48e42d818ab Dmitry Baryshkov      2025-06-21  146  
e0c48e42d818ab Dmitry Baryshkov      2025-06-21  147  	if (orig[0].svid == 0 || recipient != UCSI_RECIPIENT_SOP)
e0c48e42d818ab Dmitry Baryshkov      2025-06-21  148  		return false;
e0c48e42d818ab Dmitry Baryshkov      2025-06-21  149  
e0c48e42d818ab Dmitry Baryshkov      2025-06-21  150  	/* EC is nice and repeats altmodes again and again. Ignore copies. */
e0c48e42d818ab Dmitry Baryshkov      2025-06-21  151  	for (i = 1; i < UCSI_MAX_ALTMODES; i++) {
e0c48e42d818ab Dmitry Baryshkov      2025-06-21  152  		if (orig[i].svid == orig[0].svid) {
e0c48e42d818ab Dmitry Baryshkov      2025-06-21  153  			dev_dbg(ucsi->dev, "Found duplicate altmodes, starting from %d\n", i);
e0c48e42d818ab Dmitry Baryshkov      2025-06-21  154  			memset(&orig[i], 0, (UCSI_MAX_ALTMODES - i) * sizeof(*orig));
e0c48e42d818ab Dmitry Baryshkov      2025-06-21  155  			break;
e0c48e42d818ab Dmitry Baryshkov      2025-06-21  156  		}
e0c48e42d818ab Dmitry Baryshkov      2025-06-21  157  	}
e0c48e42d818ab Dmitry Baryshkov      2025-06-21  158  
e0c48e42d818ab Dmitry Baryshkov      2025-06-21  159  	return false;
e0c48e42d818ab Dmitry Baryshkov      2025-06-21  160  }
e0c48e42d818ab Dmitry Baryshkov      2025-06-21  161  
49bf6ee89ebadc Dmitry Baryshkov      2025-06-21  162  static void yoga_c630_ucsi_update_connector(struct ucsi_connector *con)
49bf6ee89ebadc Dmitry Baryshkov      2025-06-21  163  {
49bf6ee89ebadc Dmitry Baryshkov      2025-06-21  164  	if (con->num == 1)
49bf6ee89ebadc Dmitry Baryshkov      2025-06-21  165  		con->typec_cap.orientation_aware = true;
49bf6ee89ebadc Dmitry Baryshkov      2025-06-21  166  }
49bf6ee89ebadc Dmitry Baryshkov      2025-06-21  167  
da31486bf23480 Pei Xiao              2024-12-27  168  static const struct ucsi_operations yoga_c630_ucsi_ops = {
467399d989d799 Dmitry Baryshkov      2024-06-27  169  	.read_version = yoga_c630_ucsi_read_version,
467399d989d799 Dmitry Baryshkov      2024-06-27  170  	.read_cci = yoga_c630_ucsi_read_cci,
976e7e9bdc7719 Christian A. Ehrhardt 2025-02-17  171  	.poll_cci = yoga_c630_ucsi_read_cci,
467399d989d799 Dmitry Baryshkov      2024-06-27  172  	.read_message_in = yoga_c630_ucsi_read_message_in,
eebd39f8a89985 Dmitry Baryshkov      2025-06-21 @173  	.sync_control = yoga_c630_ucsi_sync_control,
13f2ec3115c845 Dmitry Baryshkov      2024-06-27  174  	.async_control = yoga_c630_ucsi_async_control,
e0c48e42d818ab Dmitry Baryshkov      2025-06-21  175  	.update_altmodes = yoga_c630_ucsi_update_altmodes,
49bf6ee89ebadc Dmitry Baryshkov      2025-06-21  176  	.update_connector = yoga_c630_ucsi_update_connector,
2ea6d07efe5388 Dmitry Baryshkov      2024-06-24  177  };
2ea6d07efe5388 Dmitry Baryshkov      2024-06-24  178  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
