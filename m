Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03331A0BD0;
	Tue, 12 May 2026 01:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778547629; cv=none; b=B6RH4/vnkq64zRDxiQtFosUN+nX+acQ6PFI+zeuWue3LCImwGxwD9Z0bSt1t23a7zG60Y3cG3HLfUxQU6FlQBd0F/l99F5mTRp9/atQzJuZUiTypJs5LNJNROcXte1LIpR0/MqWBmuxWivwdOCr2MVA89wtAgvlMbJDGTkrGr1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778547629; c=relaxed/simple;
	bh=51JdYZgRBed+R8yfkO4LYaNkNdGILyBHnQ4nJm8PO+Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qjocUjXalf9USTFhzeTEs2TKAp/qM/oF4mNQYY2qlc0EZTNyXT+/tKecfLYCDKeTmTRZGd356NZf+hbRWmFMYzKXq8q/rHeB1utuIgSglcGJHNrniDYMd3NsR/xW5FXc3UDl7ma1IcYbry0jznIU3RRpF8M7TjELIzSVcYqWEhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mIdkB7pt; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mIdkB7pt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778547628; x=1810083628;
  h=date:from:to:cc:subject:message-id;
  bh=51JdYZgRBed+R8yfkO4LYaNkNdGILyBHnQ4nJm8PO+Q=;
  b=mIdkB7pt+YPGui44wIj8rc8K9cdFGBhpFBjXvCX52cMlPOfGp9fxXltS
   lBkPzSdwv+Id2M6Vt9ITB4ckOQHq9tINe/V0B3mRYAY2+M3YMlnBnX90B
   HaGjIdLt8HPZVTZ6c0LEoAKukWnEaEc2Ai9HUxjpYMCxxJ+LwkGP4OTf2
   sfq60TLXvRNDuK44SDo8RNcH3NySN6DeIh4J5cAvIWDrRA4BQKe2mUtEd
   Pmgub0URX2L5J1Bt2RCbgsojJBE+vpBBQdCTbgYSA8tHPevrG7k4aAFaH
   dP/5QFOWTibGC6HihThI4SiXdAesiiqj6Rale1VfGdFoXQ0soca0UqmU6
   w==;
X-CSE-ConnectionGUID: aanBhUiqSX2WkkD/VqwCyg==
X-CSE-MsgGUID: 16piCw1UQO+OETPyFDnCMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90912911"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="90912911"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 18:00:28 -0700
X-CSE-ConnectionGUID: mO4QIxEXQa2fYr2QmlxmDw==
X-CSE-MsgGUID: GL4FeiXKRluEQAnhN2henA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="231216254"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 May 2026 18:00:26 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMbTz-000000001Nh-2i7o;
	Tue, 12 May 2026 01:00:23 +0000
Date: Tue, 12 May 2026 08:59:50 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:rxrpc-fixes 3/3] net/rxrpc/conn_event.c:254:10:
 warning: variable 'ret' is uninitialized when used here
Message-ID: <202605120837.hzpSAALd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git rxrpc-fixes
head:   e9d335dc719f98e1964c57fd1f5f92b6fd1c0c52
commit: e9d335dc719f98e1964c57fd1f5f92b6fd1c0c52 [3/3] rxrpc: Fix RESPONSE packet verification to extract skb to a linear buffer
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260512/202605120837.hzpSAALd-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605120837.hzpSAALd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605120837.hzpSAALd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/rxrpc/conn_event.c:254:10: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     254 |                 return ret;
         |                        ^~~
   net/rxrpc/conn_event.c:250:9: note: initialize the variable 'ret' to silence this warning
     250 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +254 net/rxrpc/conn_event.c

   242	
   243	static int rxrpc_verify_response(struct rxrpc_connection *conn,
   244					 struct sk_buff *skb)
   245	{
   246		struct xdr_buffer response = {
   247			.len = skb->len - sizeof(struct rxrpc_wire_header),
   248		};
   249		void *buffer;
   250		int ret;
   251	
   252		buffer = kmalloc(response.len, GFP_NOFS);
   253		if (!buffer)
 > 254			return ret;
   255	
   256		ret = skb_copy_bits(skb, sizeof(struct rxrpc_wire_header), buffer, response.len);
   257		if (ret < 0)
   258			goto out;
   259	
   260		response.p = buffer;
   261		ret = conn->security->verify_response(conn, skb, &response);
   262	
   263	out:
   264		kfree(buffer);
   265		return ret;
   266	}
   267	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
