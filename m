Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92D5335BA8;
	Fri,  9 Jan 2026 23:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768002663; cv=none; b=Eo5hgjnecvrSy96xSRyaJB55HxLtClsJ03GZ8BX+SQVz3ug0c8T+Q94gItOKmzB3RJ5vi8KongJa7zzUdyJ9Cl0BV3GQXWyPiDtUb4eVHIK1fQDzlu3aigST77ja49SuiBSG8g00nCWeatcweW4lE61XrdzBg0f95tYU3nLYqZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768002663; c=relaxed/simple;
	bh=YDUj4B+QwqZXCXesA+SYwb9Zcmb2p3X2TvwDVNFn/GQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UyO2TZWfA4C1R9+/xdU1bHE9esQCv+aUbOkioC31SbXIDA0M+oS1uCkKMYvxmIAwBC8aAAYOlaqQyJCCzGx7GaNzQ1CGt1N9cmkIGiqjRLE8kDogxouxbzRCsll96hOFUk15pcra9+8c7Mbg8nQQLUYN+9qhEhiDSbt58YuELGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I4AVPu98; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I4AVPu98"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768002662; x=1799538662;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YDUj4B+QwqZXCXesA+SYwb9Zcmb2p3X2TvwDVNFn/GQ=;
  b=I4AVPu98USkyaPIIvi7dNAeu1NMjbIDug4CacEn3IE5KsKVSzx3YVx4S
   omFoHVy4YTPFIS9c58182GVxMxvXiFXz4ExSzHr6qLtkC85sX1Dgn+5Ga
   7qm9M83XEfjZHrvjc5JafHIU7lapQ/YIAvXmZ1RTAYXTICdXEOhc78ag5
   N2ONwnFEBIOPrkU4NIdt5h9Em/VAKTDDrBFnFoZtigZzAh3NTh7J4aNvF
   6Ix6b547wNQxk3zmsemgZCpDji6cWqTlsfjZG7EKRE9RMGXLV07KJBjYl
   3L1RQ1YNkFoTIjzGqeD9TK7NI4HLXuCvVgATD4QmL/anKOfNtm1hPqNHk
   w==;
X-CSE-ConnectionGUID: X2ltMjy6QaSWxiPgl2ideg==
X-CSE-MsgGUID: MBRfAIz+SluN9sHeDpRKIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69314550"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="69314550"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 15:50:59 -0800
X-CSE-ConnectionGUID: zVRr1xBDQSio9MKx9+9KGA==
X-CSE-MsgGUID: 8DODvtV1Rx2xtbtjXXrH2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="226938784"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Jan 2026 15:50:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veMFr-000000007qy-2Wq6;
	Fri, 09 Jan 2026 23:50:55 +0000
Date: Sat, 10 Jan 2026 07:50:45 +0800
From: kernel test robot <lkp@intel.com>
To: rick.macklem@gmail.com, linux-nfs@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Rick Macklem <rmacklem@uoguelph.ca>
Subject: Re: [PATCH v1 5/7] Make nfs4_server_supports_acls() global
Message-ID: <202601100751.PT89Ryd4-lkp@intel.com>
References: <20260102232934.1560-6-rick.macklem@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260102232934.1560-6-rick.macklem@gmail.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on trondmy-nfs/linux-next]
[also build test ERROR on linus/master v6.19-rc4 next-20260109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/rick-macklem-gmail-com/Add-entries-to-the-predefined-client-operations-enum/20260103-073239
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/20260102232934.1560-6-rick.macklem%40gmail.com
patch subject: [PATCH v1 5/7] Make nfs4_server_supports_acls() global
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260110/202601100751.PT89Ryd4-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260110/202601100751.PT89Ryd4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601100751.PT89Ryd4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/nfs/nfs4proc.c:6083:36: error: use of undeclared identifier 'FATTR4_WORD2_POSIX_DEFAULT_ACL'
    6083 |                 return server->attr_bitmask[2] & FATTR4_WORD2_POSIX_DEFAULT_ACL;
         |                                                  ^
>> fs/nfs/nfs4proc.c:6085:36: error: use of undeclared identifier 'FATTR4_WORD2_POSIX_ACCESS_ACL'
    6085 |                 return server->attr_bitmask[2] & FATTR4_WORD2_POSIX_ACCESS_ACL;
         |                                                  ^
   2 errors generated.


vim +/FATTR4_WORD2_POSIX_DEFAULT_ACL +6083 fs/nfs/nfs4proc.c

  6071	
  6072	bool nfs4_server_supports_acls(const struct nfs_server *server,
  6073					      enum nfs4_acl_type type)
  6074	{
  6075		switch (type) {
  6076		default:
  6077			return server->attr_bitmask[0] & FATTR4_WORD0_ACL;
  6078		case NFS4ACL_DACL:
  6079			return server->attr_bitmask[1] & FATTR4_WORD1_DACL;
  6080		case NFS4ACL_SACL:
  6081			return server->attr_bitmask[1] & FATTR4_WORD1_SACL;
  6082		case NFS4ACL_POSIXDEFAULT:
> 6083			return server->attr_bitmask[2] & FATTR4_WORD2_POSIX_DEFAULT_ACL;
  6084		case NFS4ACL_POSIXACCESS:
> 6085			return server->attr_bitmask[2] & FATTR4_WORD2_POSIX_ACCESS_ACL;
  6086		}
  6087	}
  6088	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
