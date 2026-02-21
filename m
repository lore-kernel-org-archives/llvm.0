Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF8F28135D;
	Sat, 21 Feb 2026 00:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771633498; cv=none; b=bIapnCYuYOZdDWvLa35vCd8fPf5PxDPTBf6rRG+90LCSm58BCTVctMQd6NTxQD729+jN5e9aXUzVEyi4k0D8zFK25DwfqHM/+B5FmXtFq7CbnQa7NSd+fbimmMdJNgUmSXrkXRZnPQJHaRUYuhZ+oE5OHZb+KoCH5Tr+l0Q6IRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771633498; c=relaxed/simple;
	bh=D0J241IyTq62r4b7Mp/usNoLVuJgfajfWst2Y/nAnEU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=P/fJ6Yf3ETAdrQFQ3PDJaB10miDgoNy5yZEchWAOV66Vr02cCbhUx9nxCSgMPD9G5+tE+M002c6Y+Xi7FL3y0Iu6V16pqJN8Cy204rYa1v/GIxNBfIBg7Iey7h+AFR03lmN6njGCLN0iecyNLeVbvcnCSHTG+4oZ2lNwhs7Ndxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cTFJGb69; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cTFJGb69"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771633497; x=1803169497;
  h=date:from:to:cc:subject:message-id;
  bh=D0J241IyTq62r4b7Mp/usNoLVuJgfajfWst2Y/nAnEU=;
  b=cTFJGb69ZKevph8LpSzFuq/1Xwt09i9t4BE7abkUp2LJbW1knWe1BZZ5
   6E6nxqgJRYyLTX6JGkB/Ux/nd0sm5tZQ/hdqYdgDt8BntGr0GiZP98cbn
   WBqdYi0HNdbUZ0pv8ACsiQZWSXH2qVKaEmA2NpwOuft/tCat7Zu1XpkCc
   5NAlv0eDtbrlHMYe0MqxZoP6zV1f53IH2m7UXqbescj4Z+biDKWqlLkzk
   6FWvrmSKItlNHusEgrJgacmPkcqU5PZoZkElXjRyJhApEGplc/Xf4MrG5
   ZEIl0kfcIflZ5NHz3jUkwsAt5VP8qoi+jHdH9M9GRcQWvVkRl5k/RAujT
   g==;
X-CSE-ConnectionGUID: tEtXBkk2Qgi1UrydL8AXXQ==
X-CSE-MsgGUID: 2oKb9IbtRjauoztoe+liZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="76561970"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="76561970"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 16:24:57 -0800
X-CSE-ConnectionGUID: u28lg6XWTJmw2atDXCZx0g==
X-CSE-MsgGUID: 3gHm14LCQfyXatdNYxTGXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="214098848"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 20 Feb 2026 16:24:56 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtanl-000000004JV-1nSH;
	Sat, 21 Feb 2026 00:24:53 +0000
Date: Sat, 21 Feb 2026 01:24:20 +0100
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:exportd-netlink 14/14] fs/nfsd/export.c:385:3:
 error: use of undeclared identifier 'ret'
Message-ID: <202602210150.NdJXgFWN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git exportd-netlink
head:   abe0e15ab9e913e4fb8b26466f8a2a4089ceba44
commit: abe0e15ab9e913e4fb8b26466f8a2a4089ceba44 [14/14] nfsd: implement nfsd_nl_svc_export_get_reqs_dumpit()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260221/202602210150.NdJXgFWN-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602210150.NdJXgFWN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602210150.NdJXgFWN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/nfsd/export.c:385:3: error: use of undeclared identifier 'ret'
     385 |                 ret = -ENODEV;
         |                 ^
>> fs/nfsd/export.c:386:8: error: use of undeclared label 'out_unlock'
     386 |                 goto out_unlock;
         |                      ^
   2 errors generated.


vim +/ret +385 fs/nfsd/export.c

   378	
   379	int nfsd_nl_svc_export_get_reqs_dumpit(struct sk_buff *skb, struct netlink_callback *cb)
   380	{
   381		struct nfsd_net *nn;
   382	
   383		nn = net_generic(sock_net(skb->sk), nfsd_net_id);
   384		if (!nn->nfsd_serv) {
 > 385			ret = -ENODEV;
 > 386			goto out_unlock;
   387		}
   388	
   389		return 0;
   390	}
   391	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
