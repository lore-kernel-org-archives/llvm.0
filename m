Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6290B470EB1;
	Fri,  2 Oct 2026 13:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790948473; cv=none; b=niw7WXYtmfj5LaKN3XDnbwxtxh3GsQC/ROrAiJzN3sCTaP7zLWhFOUJaCq1tyHwoRJfoLZYAewvIzqmxGlou83P5DJm1EzQwZnVU0sqkDvpGL6y68KUF410C2k3l8XqBv4LL7G+6k1bRaj22tjap+xexRcmEfTM/B7l8J+/dm18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790948473; c=relaxed/simple;
	bh=/xDkvlh5pUUk66Tu4SclvOxqA0SlPbhGAdFW0Qiiv9w=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qzly1Ui/G6A6x+Rw3ILDMIk20jMoBPG7LKKGkDoaZ0OUkJ+0s2H0brSXAmIo5UtwVkKywYWbp5j+iimMbVGg1YndxOhkmsLVB0zYpJBDqk8WuLFqnwEL5iaJLEIjJEkdUksqfDOLB9LYR+XO59tGgMMG8J/4rHVo4m2NhvWknIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=chhPuW+i; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="chhPuW+i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790948470; x=1822484470;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=/xDkvlh5pUUk66Tu4SclvOxqA0SlPbhGAdFW0Qiiv9w=;
  b=chhPuW+iN5gKqtpkxCfG5PDcHS+npTqtQBknKIkNLVyFrB+Ua2NX4q+F
   xg8H+Okn6QrTO/23FNKWbnF8msC9r6/cBPoW9kv9W/8ynmHsTutOFD/Od
   C4vF9OkYM66wsdB4J9APNXeeB4uIugJeLOp1lbr3fjaU572ZYCe3BzSAo
   0iH6QRM3sSSmodizuhqE62YxUYLBfxcdxhns8jtzpkdrIBo2BBp3pJ9Iu
   FzMYrcvlPqk8BIABOBdYX+DK/9gB7V+E0q21ymj8a5mNUk/FnbrUuNmzD
   VltU/XDDbJAwbohpxlAWIGiMyOXk9Xor6+Me2cUSXlL+ifBhuJgRkk2s1
   Q==;
X-CSE-ConnectionGUID: RldwDYuTQlK3/lvu6/YYGA==
X-CSE-MsgGUID: otqujt4UQkOQ2nPiMuJExw==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="102235827"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="102235827"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 06:41:09 -0700
X-CSE-ConnectionGUID: dHoA7//bSxKUJ14v1yFTZg==
X-CSE-MsgGUID: MwAFSdB+SqOAZ6+UTyuCMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="274341163"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Oct 2026 06:41:08 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCdVZ-00000000T5p-3qCf;
	Fri, 02 Oct 2026 13:41:05 +0000
Date: Fri, 2 Oct 2026 21:40:13 +0800
From: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: staging: greybus: audio: Fix no terminating newline in sysfs emit
Message-ID: <202610022114.wXqBfrwZ-lkp@intel.com>
References: <202610022114.wXqBfrwZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610022114.wXqBfrwZ-lkp@intel.com>

Hi Raiden,

kernel test robot noticed the following build errors:



url:    https://github.com/intel-lab-lkp/linux/commits/Raiden-Horner/staging-greybus-audio-Fix-no-terminating-newline-in-sysfs-emit/20261001-111458
base:   
patch link:    https://lore.kernel.org/r/202610022114.wXqBfrwZ-lkp%40intel.com
config: x86_64-randconfig-1006-20261002 (https://download.01.org/0day-ci/archive/20261002/202610022114.wXqBfrwZ-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610022114.wXqBfrwZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610022114.wXqBfrwZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/greybus/audio_manager_module.c:180:46: error: passing 'char *const[7]' to parameter of type 'char **' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     180 |         kobject_uevent_env(&module->kobj, KOBJ_ADD, envp);
         |                                                     ^~~~
   include/linux/kobject.h:283:10: note: passing argument to parameter 'envp' here
     283 |                         char *envp[]);
         |                               ^
   1 error generated.


vim +180 drivers/staging/greybus/audio_manager_module.c

8db00736d365b7 Svetlin Ankov    2016-01-13  151  
8db00736d365b7 Svetlin Ankov    2016-01-13  152  static void send_add_uevent(struct gb_audio_manager_module *module)
8db00736d365b7 Svetlin Ankov    2016-01-13  153  {
8db00736d365b7 Svetlin Ankov    2016-01-13  154  	char name_string[128];
8db00736d365b7 Svetlin Ankov    2016-01-13  155  	char vid_string[64];
8db00736d365b7 Svetlin Ankov    2016-01-13  156  	char pid_string[64];
d0af1bd5f6f449 Pankaj Bharadiya 2016-10-16  157  	char intf_id_string[64];
a9234bfd6cec44 Vaibhav Agarwal  2016-03-30  158  	char ip_devices_string[64];
a9234bfd6cec44 Vaibhav Agarwal  2016-03-30  159  	char op_devices_string[64];
8db00736d365b7 Svetlin Ankov    2016-01-13  160  
757f49b7d08da4 Raiden Horner    2026-10-01  161  	char * const envp[] = {
8db00736d365b7 Svetlin Ankov    2016-01-13  162  		name_string,
8db00736d365b7 Svetlin Ankov    2016-01-13  163  		vid_string,
8db00736d365b7 Svetlin Ankov    2016-01-13  164  		pid_string,
d0af1bd5f6f449 Pankaj Bharadiya 2016-10-16  165  		intf_id_string,
a9234bfd6cec44 Vaibhav Agarwal  2016-03-30  166  		ip_devices_string,
a9234bfd6cec44 Vaibhav Agarwal  2016-03-30  167  		op_devices_string,
8db00736d365b7 Svetlin Ankov    2016-01-13  168  		NULL
8db00736d365b7 Svetlin Ankov    2016-01-13  169  	};
8db00736d365b7 Svetlin Ankov    2016-01-13  170  
8db00736d365b7 Svetlin Ankov    2016-01-13  171  	snprintf(name_string, 128, "NAME=%s", module->desc.name);
8db00736d365b7 Svetlin Ankov    2016-01-13  172  	snprintf(vid_string, 64, "VID=%d", module->desc.vid);
8db00736d365b7 Svetlin Ankov    2016-01-13  173  	snprintf(pid_string, 64, "PID=%d", module->desc.pid);
d0af1bd5f6f449 Pankaj Bharadiya 2016-10-16  174  	snprintf(intf_id_string, 64, "INTF_ID=%d", module->desc.intf_id);
a9234bfd6cec44 Vaibhav Agarwal  2016-03-30  175  	snprintf(ip_devices_string, 64, "I/P DEVICES=0x%X",
a9234bfd6cec44 Vaibhav Agarwal  2016-03-30  176  		 module->desc.ip_devices);
a9234bfd6cec44 Vaibhav Agarwal  2016-03-30  177  	snprintf(op_devices_string, 64, "O/P DEVICES=0x%X",
a9234bfd6cec44 Vaibhav Agarwal  2016-03-30  178  		 module->desc.op_devices);
8db00736d365b7 Svetlin Ankov    2016-01-13  179  
8db00736d365b7 Svetlin Ankov    2016-01-13 @180  	kobject_uevent_env(&module->kobj, KOBJ_ADD, envp);
8db00736d365b7 Svetlin Ankov    2016-01-13  181  }
8db00736d365b7 Svetlin Ankov    2016-01-13  182  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
