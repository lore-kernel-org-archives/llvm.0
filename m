Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817FB134BD;
	Sat,  4 Jan 2025 16:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736008086; cv=none; b=dJ+5vKi3VdlF2Pm6jJJqhRbd7WrqQ1BCIAjvsZ9coSq2ha3f8GDHiauCI+FbCGAhnSu1JWeJ5lseWyfA/7zmHpTNx8DpLXb6p6hNWVrbvH4YPff8WKp/RNFJappM/XdaRfYKAdviwsN73vdhbNr3rPmek/uDKgpSqa5SlTiCIm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736008086; c=relaxed/simple;
	bh=eTvQaytAuHa09mEKh0B351OqXiLyRm3jUd708PMm+Ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZrIL0Z/0dpL6MLqLcD1t2UYGqUJlHYftQPRtmMs6vlgu/DRoTiS/Y0OeCqYXcBZ2mNGj56bqFL1ZiLXy0tRcm+Hn0q8lIWhOGIvrFO5rtkT6eSIMymHqr1ZusM72yNV/NwI1KnESu+np4ZDr4CbFBmN137MrmIBjCP8CQfmLQSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DIy9xDHu; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DIy9xDHu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736008084; x=1767544084;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eTvQaytAuHa09mEKh0B351OqXiLyRm3jUd708PMm+Ng=;
  b=DIy9xDHu+k3/prA6nxru2LBn5+Lz4SftrPzQq2lxTcPEt2iKPUiG4vIg
   BTtDklt+kLaMdkBmIGBWTt8JuXDZ2xE0KDlfP7NRKLB9kwm1uCYICwqVm
   8G20QDICekWOCDcfLq+gcI2sqlsaBBizUEPyRYWjXnfycPrxml0c5s0hl
   E91syfp6TvBYPYy1R5uOrHMY/oyLeWhzdq5E1/dtZjVQf9hTzsFFbICUH
   KujiRETvzBZZnFfum4Ehq9rkFekAOlQ8myMALU7Ar9E2oLR61T+poobsc
   wbvurYb/YSTy0inV2n+y+zKXbOhC7uG2UKl7NEyiwor8SsEDfUcag2FZE
   w==;
X-CSE-ConnectionGUID: svKndh2FSuWTCwZsijFdBA==
X-CSE-MsgGUID: VKI+oUjcQweYnTV0ftkPZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11305"; a="40150425"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="40150425"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2025 08:28:04 -0800
X-CSE-ConnectionGUID: hY5avLkrRjuA5WeOArHX6Q==
X-CSE-MsgGUID: siu0CI4ASK6/oFWqjnH/tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="102509801"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Jan 2025 08:28:00 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tU70I-000B43-1t;
	Sat, 04 Jan 2025 16:27:58 +0000
Date: Sun, 5 Jan 2025 00:27:32 +0800
From: kernel test robot <lkp@intel.com>
To: Gwendal Grignou <gwendal@chromium.org>, ukaszb@chromium.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	abhishekpandit@chromium.org, bleung@chromium.org,
	chrome-platform@lists.linux.dev, dmitry.baryshkov@linaro.org,
	gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com,
	jthies@google.com, linux-usb@vger.kernel.org, pholla@chromium.org,
	tzungbi@kernel.org, Gwendal Grignou <gwendal@chromium.org>
Subject: Re: [PATCH] driver/platform/chrome: Update cros_ec_trace with new
 USCI commands
Message-ID: <202501050055.oR3g1RHJ-lkp@intel.com>
References: <20250103233407.4001046-1-gwendal@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103233407.4001046-1-gwendal@chromium.org>

Hi Gwendal,

kernel test robot noticed the following build errors:

[auto build test ERROR on chrome-platform/for-next]
[also build test ERROR on chrome-platform/for-firmware-next linus/master v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gwendal-Grignou/driver-platform-chrome-Update-cros_ec_trace-with-new-USCI-commands/20250104-073614
base:   https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next
patch link:    https://lore.kernel.org/r/20250103233407.4001046-1-gwendal%40chromium.org
patch subject: [PATCH] driver/platform/chrome: Update cros_ec_trace with new USCI commands
config: x86_64-buildonly-randconfig-005-20250104 (https://download.01.org/0day-ci/archive/20250105/202501050055.oR3g1RHJ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250105/202501050055.oR3g1RHJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501050055.oR3g1RHJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/platform/chrome/cros_ec_trace.c:217:
   In file included from drivers/platform/chrome/cros_ec_trace.h:83:
   In file included from include/trace/define_trace.h:113:
   In file included from include/trace/trace_events.h:256:
>> drivers/platform/chrome/cros_ec_trace.h:40:40: error: use of undeclared identifier 'EC_CMD_UCSI_PPM_SET'
      40 |                   __print_symbolic(__entry->command, EC_CMDS),
         |                                                      ^
   drivers/platform/chrome/cros_ec_trace.c:169:15: note: expanded from macro 'EC_CMDS'
     169 |         TRACE_SYMBOL(EC_CMD_UCSI_PPM_SET), \
         |                      ^
   In file included from drivers/platform/chrome/cros_ec_trace.c:217:
   In file included from drivers/platform/chrome/cros_ec_trace.h:83:
   In file included from include/trace/define_trace.h:113:
   In file included from include/trace/trace_events.h:256:
>> drivers/platform/chrome/cros_ec_trace.h:40:40: error: use of undeclared identifier 'EC_CMD_UCSI_PPM_GET'
   drivers/platform/chrome/cros_ec_trace.c:170:15: note: expanded from macro 'EC_CMDS'
     170 |         TRACE_SYMBOL(EC_CMD_UCSI_PPM_GET), \
         |                      ^
   In file included from drivers/platform/chrome/cros_ec_trace.c:217:
   In file included from drivers/platform/chrome/cros_ec_trace.h:83:
   In file included from include/trace/define_trace.h:113:
   In file included from include/trace/trace_events.h:256:
   drivers/platform/chrome/cros_ec_trace.h:67:40: error: use of undeclared identifier 'EC_CMD_UCSI_PPM_SET'
      67 |                   __print_symbolic(__entry->command, EC_CMDS),
         |                                                      ^
   drivers/platform/chrome/cros_ec_trace.c:169:15: note: expanded from macro 'EC_CMDS'
     169 |         TRACE_SYMBOL(EC_CMD_UCSI_PPM_SET), \
         |                      ^
   In file included from drivers/platform/chrome/cros_ec_trace.c:217:
   In file included from drivers/platform/chrome/cros_ec_trace.h:83:
   In file included from include/trace/define_trace.h:113:
   In file included from include/trace/trace_events.h:256:
   drivers/platform/chrome/cros_ec_trace.h:67:40: error: use of undeclared identifier 'EC_CMD_UCSI_PPM_GET'
   drivers/platform/chrome/cros_ec_trace.c:170:15: note: expanded from macro 'EC_CMDS'
     170 |         TRACE_SYMBOL(EC_CMD_UCSI_PPM_GET), \
         |                      ^
   4 errors generated.


vim +/EC_CMD_UCSI_PPM_SET +40 drivers/platform/chrome/cros_ec_trace.h

58a2109f6eb46b Raul E Rangel   2019-04-16  20  
205c9326fd8665 Raul E Rangel   2019-11-25  21  TRACE_EVENT(cros_ec_request_start,
58a2109f6eb46b Raul E Rangel   2019-04-16  22  	TP_PROTO(struct cros_ec_command *cmd),
58a2109f6eb46b Raul E Rangel   2019-04-16  23  	TP_ARGS(cmd),
58a2109f6eb46b Raul E Rangel   2019-04-16  24  	TP_STRUCT__entry(
58a2109f6eb46b Raul E Rangel   2019-04-16  25  		__field(uint32_t, version)
8143182426874a Gwendal Grignou 2020-08-14  26  		__field(uint32_t, offset)
58a2109f6eb46b Raul E Rangel   2019-04-16  27  		__field(uint32_t, command)
8143182426874a Gwendal Grignou 2020-08-14  28  		__field(uint32_t, outsize)
8143182426874a Gwendal Grignou 2020-08-14  29  		__field(uint32_t, insize)
58a2109f6eb46b Raul E Rangel   2019-04-16  30  	),
58a2109f6eb46b Raul E Rangel   2019-04-16  31  	TP_fast_assign(
58a2109f6eb46b Raul E Rangel   2019-04-16  32  		__entry->version = cmd->version;
3db0c9e5de7bd9 Tzung-Bi Shih   2022-06-09  33  		__entry->offset = cmd->command / EC_CMD_PASSTHRU_OFFSET(CROS_EC_DEV_PD_INDEX);
3db0c9e5de7bd9 Tzung-Bi Shih   2022-06-09  34  		__entry->command = cmd->command % EC_CMD_PASSTHRU_OFFSET(CROS_EC_DEV_PD_INDEX);
8143182426874a Gwendal Grignou 2020-08-14  35  		__entry->outsize = cmd->outsize;
8143182426874a Gwendal Grignou 2020-08-14  36  		__entry->insize = cmd->insize;
58a2109f6eb46b Raul E Rangel   2019-04-16  37  	),
8143182426874a Gwendal Grignou 2020-08-14  38  	TP_printk("version: %u, offset: %d, command: %s, outsize: %u, insize: %u",
8143182426874a Gwendal Grignou 2020-08-14  39  		  __entry->version, __entry->offset,
8143182426874a Gwendal Grignou 2020-08-14 @40  		  __print_symbolic(__entry->command, EC_CMDS),
8143182426874a Gwendal Grignou 2020-08-14  41  		  __entry->outsize, __entry->insize)
58a2109f6eb46b Raul E Rangel   2019-04-16  42  );
58a2109f6eb46b Raul E Rangel   2019-04-16  43  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
