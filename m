Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7692D64D;
	Sat, 19 Oct 2024 02:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729305682; cv=none; b=BpyIYZBjApXpxv9j2oiCVi6LDAwWm5lvT/lY+v243Q0mGtX3ItbkdZIF1zCzY9akfQKMwbHeElgG4qmRsG2HuKAPz/M7So/OSbbrSJkzHfAuphU5h5lhcJY+b4ksrpsT4MNsq/iujZp/3BGS+e43YSULowacr+SCFLhLbiqtE2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729305682; c=relaxed/simple;
	bh=l/QXmEkRKjH5+9K00i68wlu8qyxLFVYwAdbMMEzdJy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iwcWNT+sRsa/loIWCbxdiUJGaJE+IE63xRVU3EmciOtAlyU3vV2zsPzyskkf4/aFppx8foiowA1C8HMZ7fHkhlB/RAmn5U2TzGCpGkChU52MFyh+BE/20ZhsP7ueUVt5BcdAPnwy23/WTvWk2p3LDXS5iUlv0vc5nC/jWaN43pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MwFWXbT9; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MwFWXbT9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729305681; x=1760841681;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l/QXmEkRKjH5+9K00i68wlu8qyxLFVYwAdbMMEzdJy8=;
  b=MwFWXbT9yGmYkiCyNE9JkuCw+z3oHObVEe+SqoDUKtj5f40YxKkSMqcg
   eCcCrmdUGDJXIfFnf04YsTani/sERl0XtA1bejtwomZIYVkwxHUF8ir9C
   bdtD9QNIbfNRspR+o4Zht2CRPkxpXYJzA9mLk8lw4IibJrNt3jZf93eI+
   kLOXIy3I+mjsMdUV7U/USKEXy+vyaCKn06e6ZPCvpchTU88jPn1y7ORjg
   EsAosy/CgyiF3z0/QhpVStyvLqMLSbbjRgqGHpNdxViOMnNeJ5JKdRDk9
   yHw3BOsQCAQyXvb32aES36gHBB00DUfDz6QnGYMSt149qcP7S+1/gf4JU
   A==;
X-CSE-ConnectionGUID: gNWOdb7iQVarfKt/uKFtVw==
X-CSE-MsgGUID: tOtyB0pdTt2mBvGdTWFGfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32537484"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="32537484"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 19:41:20 -0700
X-CSE-ConnectionGUID: /egPeNXvSwOISJPtHJD1UA==
X-CSE-MsgGUID: iCRBiJxjRqaoZoG9L4bYgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,215,1725346800"; 
   d="scan'208";a="109789238"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Oct 2024 19:41:19 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1zP2-000OcP-1m;
	Sat, 19 Oct 2024 02:41:16 +0000
Date: Sat, 19 Oct 2024 10:40:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 3/5] initramfs: Use existing module signing infrastructure
Message-ID: <202410191016.5Ab0y2vu-lkp@intel.com>
References: <20241015222235.71040-4-jeremy.linton@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015222235.71040-4-jeremy.linton@arm.com>

Hi Jeremy,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on herbert-cryptodev-2.6/master]
[also build test ERROR on herbert-crypto-2.6/master akpm-mm/mm-everything linus/master v6.12-rc3 next-20241018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeremy-Linton/initramfs-Add-initramfs-signature-checking/20241016-062404
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20241015222235.71040-4-jeremy.linton%40arm.com
patch subject: [RFC 3/5] initramfs: Use existing module signing infrastructure
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241019/202410191016.5Ab0y2vu-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410191016.5Ab0y2vu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410191016.5Ab0y2vu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: mod_check_sig
   >>> referenced by initramfs.c:715 (init/initramfs.c:715)
   >>>               vmlinux.o:(initrd_signature_check)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
