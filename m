Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE923254BA;
	Sat, 21 Feb 2026 02:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771640875; cv=none; b=pxxFpNnFlMLynJTtlHYrCiwvOGJaDzgLv5fd9weJYsw9PEG+oU0CqAqgLFKlJRMM8g/mi9t5RowQAtC4/XdmI77iSY7vV6vqnggvg9yBmvN/wdOwTthVWnVoXJBVErWtkqIW1V11LdmEtwONoTvqazPBR6j3H4AnfUUV6WDU6yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771640875; c=relaxed/simple;
	bh=iXkvACumn8HUTSn6VLPjRrbXejAQ/ip1aSdXmS/Vuy4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jjXlp9z8dAvRTEG6+s8E32uxKZL3124slY0VS7eYA1xse0gw2OwoaCCABeFIfwPYuOAQAitYZhE1Kq32ZI9VjtdmS3xPugjrp5mJWYEKmWSVZagE+QDhBQMQykLuCZil2ELy6Ux/Wh5Ld/hw3cl6kkJK7ZSAj9c8ln53dJknyvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ksw/ml+K; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ksw/ml+K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771640873; x=1803176873;
  h=date:from:to:cc:subject:message-id;
  bh=iXkvACumn8HUTSn6VLPjRrbXejAQ/ip1aSdXmS/Vuy4=;
  b=ksw/ml+K3XeBb/LuikJZOhC/Wmhy3UQWPgwKOlRjtxdNJRcWJ1WX6cpL
   BKZSmqk8z9k9wDFC6Mt9OblaaKvXnRERWbquPHvoo7PY90j2ltZqXVrTr
   etHHXS/GiIem2ztJotnH5fyyqW2Ovh4iXa7/1CR1+wamfBBewjg0m2lbN
   souPNLdSUw4H7QyMR6ax67PEZrnOTqO9XQWSwwqN7Bk1UHWc4O1lSucR6
   5csLTamEnPacWFTCbY+BBtdZrTt8YwJ8g7c2EjU/+/dtQPKZXObV0ITdd
   si60JzwKdktGU375nw3IQjdtaf/pgap+PUjRPpWVMsPVmENrOtUGCtQPb
   g==;
X-CSE-ConnectionGUID: C0qj4fsVSs+r7x6UnEBhaQ==
X-CSE-MsgGUID: lId4MZLgSF+rLaOfsfZn0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="71758990"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="71758990"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 18:27:53 -0800
X-CSE-ConnectionGUID: p0YcUJ37SL6kkgWad/fH3Q==
X-CSE-MsgGUID: 6a7CO6blRTSxvlwDUP3TZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="219522956"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Feb 2026 18:27:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtcii-000000014e8-2FBJ;
	Sat, 21 Feb 2026 02:27:48 +0000
Date: Sat, 21 Feb 2026 10:27:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:exportd-netlink 14/14] fs/nfsd/export.c:385:3:
 error: use of undeclared identifier 'ret'
Message-ID: <202602211015.TmaKT3bd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git exportd-netlink
head:   abe0e15ab9e913e4fb8b26466f8a2a4089ceba44
commit: abe0e15ab9e913e4fb8b26466f8a2a4089ceba44 [14/14] nfsd: implement nfsd_nl_svc_export_get_reqs_dumpit()
config: mips-jazz_defconfig (https://download.01.org/0day-ci/archive/20260221/202602211015.TmaKT3bd-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602211015.TmaKT3bd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602211015.TmaKT3bd-lkp@intel.com/

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
