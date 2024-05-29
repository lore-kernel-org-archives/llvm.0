Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787D7184118;
	Wed, 29 May 2024 16:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717000772; cv=none; b=HBg04JxIvZ16ZWN0Y/HI3qzzVVYeFtdF03+hJqypKKAS/KtzmWfv4/AVH1+VeKCb2jXkW3RZ8uz0eeyQNlAegnWDxTfI/YAhT9q5iLUnU0dqjZdqFXFXsg5o9DIbBNCKrlx2IQpCkVyaI7CFazVhc8Yhq7jx+kJnn3XSwLfruCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717000772; c=relaxed/simple;
	bh=ykTtw6vKDQHUEg7QWmim2oDDVh/AapNP1ApfV4SD5iQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kdrN1drUpAEovcHAYNOFoAu4yhwnrz2CoUKAJZmCuioBpUOoxylmqbcQK+4GdePtlu8BalyH+D9c2O8zGFI3JGkfv6uJnFERGBg0nh1ptClLAm1Ht5EPCXwHNnv6XMaMTLoqk9AvRdbSpIr05vcYfAwiCPbyj9ros2xRVl/iUt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FbFhJ1ps; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FbFhJ1ps"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717000770; x=1748536770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ykTtw6vKDQHUEg7QWmim2oDDVh/AapNP1ApfV4SD5iQ=;
  b=FbFhJ1psc/oShDp7uta3lBnZEpc0gnFOiOSlNWpIcdvSjZYVPNwtguDR
   /taamaRcJwICFgos/7hyQSWXhncRlmvyxAHhahTcakQVwuJ+/NTc+dFyr
   cktT9kZcYqE0+hexdjkpwdh29UT34HR0V5nllhcLfBCcd1wignCfX0Nmc
   6HAiTAPl/Fr7xv8QAepQAnjc5BuHrGdITJK2p4TfGKmZF+0VIIliYIb6g
   NcZGCxfPwo7LkSi3xidooRwDMG7ivPgobHmFuzS4V2gAcFEGFjvy3YWdA
   qOruaBCGEBvT3OFjhvGd8u1RrzXgGuXJGVkCSxtmKWwseUGju/Ha5FUjh
   Q==;
X-CSE-ConnectionGUID: 2fjqCRSXQIaZ/bPGoy/uhg==
X-CSE-MsgGUID: ujH32mCtQ3O4ImpxhD8wLQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13269263"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="13269263"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 09:39:30 -0700
X-CSE-ConnectionGUID: 7r1iJnGZRQqOCkUmzRhFrA==
X-CSE-MsgGUID: ErXgLbakTSKS+cFV2AjYBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="40390968"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 29 May 2024 09:39:29 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCMKk-000Dx7-1p;
	Wed, 29 May 2024 16:39:26 +0000
Date: Thu, 30 May 2024 00:39:01 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org
Subject: [tiwai-sound:for-next 9/10] sound/core/ump.c:694:6: warning:
 variable 'type' is uninitialized when used here
Message-ID: <202405300035.Fz3pTUG4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   e472ffe6ae48ba80461ff1a7bb40f73665a856f0
commit: 42db3930d4d7384d4e241c928e8cb2a0cdc5589c [9/10] ALSA: ump: Don't accept an invalid UMP protocol number
config: i386-randconfig-011-20240529 (https://download.01.org/0day-ci/archive/20240530/202405300035.Fz3pTUG4-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240530/202405300035.Fz3pTUG4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405300035.Fz3pTUG4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/core/ump.c:694:6: warning: variable 'type' is uninitialized when used here [-Wuninitialized]
     694 |         if (type != SNDRV_UMP_EP_INFO_PROTO_MIDI1 &&
         |             ^~~~
   sound/core/ump.c:688:19: note: initialize the variable 'type' to silence this warning
     688 |         unsigned int type;
         |                          ^
         |                           = 0
   1 warning generated.


vim +/type +694 sound/core/ump.c

   678	
   679	/**
   680	 * snd_ump_switch_protocol - switch MIDI protocol
   681	 * @ump: UMP endpoint
   682	 * @protocol: protocol to switch to
   683	 *
   684	 * Returns 1 if the protocol is actually switched, 0 if unchanged
   685	 */
   686	int snd_ump_switch_protocol(struct snd_ump_endpoint *ump, unsigned int protocol)
   687	{
   688		unsigned int type;
   689	
   690		protocol &= ump->info.protocol_caps;
   691		if (protocol == ump->info.protocol)
   692			return 0;
   693	
 > 694		if (type != SNDRV_UMP_EP_INFO_PROTO_MIDI1 &&
   695		    type != SNDRV_UMP_EP_INFO_PROTO_MIDI2)
   696			return 0;
   697	
   698		ump->info.protocol = protocol;
   699		ump_dbg(ump, "New protocol = %x (caps = %x)\n",
   700			protocol, ump->info.protocol_caps);
   701		seq_notify_protocol(ump);
   702		return 1;
   703	}
   704	EXPORT_SYMBOL_GPL(snd_ump_switch_protocol);
   705	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
