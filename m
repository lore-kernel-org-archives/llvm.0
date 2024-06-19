Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFCC155C94;
	Wed, 19 Jun 2024 17:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718817875; cv=none; b=EmyW5aiAeFkpTNlu+q9+qoL7CbwCSJGlEviLX+dDuTefG9Xx+ZumxRBAiQT+3xcpG/7w6KxzqyWFsGUH9j2u3gdGtgS3LAjbaS27a9pyfRvGb18jIAV4rke7ZMMKKsH9QYdQLgGfDYKALnhnrt/erlRwDwCk8YzKVjbmabwNadY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718817875; c=relaxed/simple;
	bh=JjpXN7Ttl5lVbTJwFDzb7QLEnFAXkDuUtQyQ33vN2pc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i8KUG2byCYXVHJrxoXFgQ247PRECwwjPArTs61Du6hcxKkEo7Z487QMf0JNQQxfgMuX6I14E7IMcNWRFVU7j5r3ou0FgEenDWaUbxfcVpnnIMjLswXvcm9MwywIOyEGau6Nv14kpfxbmAtmCYDviUKeMLsIDvpvk/FAIfgyX23A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RydQeQ2I; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RydQeQ2I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718817874; x=1750353874;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JjpXN7Ttl5lVbTJwFDzb7QLEnFAXkDuUtQyQ33vN2pc=;
  b=RydQeQ2IAWKJ3Nh7nJ8Is5SK1HsR9/TEim4vIG6fVKvsiWVqYUpUwPlJ
   RTzYBl1YGZIOSZOs3ofZgqlGVOnYJZCtViabVhUEEmvCZXZwktX8aFb+0
   T88hQ+xMNsuA5fXQrW4CIoXIJI4D8l83SVxGPCKXhbHXGOFB62gVZtfQp
   S599H+x0TyFuK674kEaWX9EAjjsNt/mcgDJiGAMdgcx7oxJy9CLA87YS0
   wNIcutLi4E9bOHk9kYcJXJ7mEYl0uIaqJiC1caGx5qrg0zA2vDfjil+jN
   r4N8DA4tjfTYHE3KdPBhXesaNvmybEo23ESHHR4z7vUmZKpmq7OTyOq1C
   A==;
X-CSE-ConnectionGUID: IVoFio2rRXCDu9sS3dyMFQ==
X-CSE-MsgGUID: UiOwQ1WtRiOLqHkXld6ktw==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15913174"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="15913174"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 10:24:33 -0700
X-CSE-ConnectionGUID: BD7zSZEARD+5iLOvFxM6LA==
X-CSE-MsgGUID: +6Wns4E8SRqyL4eaUzYxDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="46509863"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Jun 2024 10:24:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJz2s-0006o6-0d;
	Wed, 19 Jun 2024 17:24:30 +0000
Date: Thu, 20 Jun 2024 01:24:08 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 11/19] media: renesas: vsp1: Add and use function to
 dump a pipeline to the log
Message-ID: <202406200116.dABlTcGJ-lkp@intel.com>
References: <20240619001722.9749-12-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240619001722.9749-12-laurent.pinchart+renesas@ideasonboard.com>

Hi Laurent,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 91798162245991e26949ef62851719bb2177a9c2]

url:    https://github.com/intel-lab-lkp/linux/commits/Laurent-Pinchart/media-renesas-vsp1-Drop-vsp1_entity_get_pad_format-wrapper/20240619-081928
base:   91798162245991e26949ef62851719bb2177a9c2
patch link:    https://lore.kernel.org/r/20240619001722.9749-12-laurent.pinchart%2Brenesas%40ideasonboard.com
patch subject: [PATCH v2 11/19] media: renesas: vsp1: Add and use function to dump a pipeline to the log
config: arm-randconfig-001-20240619 (https://download.01.org/0day-ci/archive/20240620/202406200116.dABlTcGJ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406200116.dABlTcGJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406200116.dABlTcGJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/renesas/vsp1/vsp1_pipe.c:16:
   In file included from include/media/v4l2-subdev.h:15:
   In file included from include/media/v4l2-common.h:105:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/media/platform/renesas/vsp1/vsp1_pipe.c:304:43: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     304 | void __vsp1_pipeline_dump(struct _ddebug *, struct vsp1_pipeline *pipe,
         |                                           ^
   2 warnings generated.


vim +304 drivers/media/platform/renesas/vsp1/vsp1_pipe.c

   303	
 > 304	void __vsp1_pipeline_dump(struct _ddebug *, struct vsp1_pipeline *pipe,
   305				  const char *msg)
   306	{
   307		struct vsp1_device *vsp1 = pipe->output->entity.vsp1;
   308		struct vsp1_entity *entity;
   309		bool first = true;
   310	
   311		printk(KERN_DEBUG "%s: %s: pipe: ", dev_name(vsp1->dev), msg);
   312	
   313		list_for_each_entry(entity, &pipe->entities, list_pipe) {
   314			const char *name;
   315	
   316			name = strchrnul(entity->subdev.name, ' ');
   317			name = name ? name + 1 : entity->subdev.name;
   318	
   319			pr_cont("%s%s", first ? "" : ", ", name);
   320			first = false;
   321		}
   322	
   323		pr_cont("\n");
   324	}
   325	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
