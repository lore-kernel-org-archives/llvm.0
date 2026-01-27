Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477532E973F;
	Tue, 27 Jan 2026 04:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769489824; cv=none; b=UFzJY3tL07vPkFkZHzjrLIemWZXfLcfaac8RHVuzH5CyiKY7RkT62RZ9xSx2CFhXjSSmUTPAm7+TQ7fk56y7XysaLt58S24a30z/TaiqhFCaS+lIE9JRRx8llRZBRnzEiI62PyunKd41mpKCWeXtJwnQfUDBAxqmMdm1xBDwa6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769489824; c=relaxed/simple;
	bh=iCCD613JRllm9h3TTRIOf9U7yT/wcqwphBj87uNAy8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QUy58629mpiaLJ0lauMNL/Hs49Vucy2egJra3ZGnhbGgoudYvtxKwg0vP3nLi6bt7kyYo5UPOrfB/031DrTw5iW99uebsG4CGN/SjfJGxQanktAixH8S8/twKPYtPw3V6GiIW8ynJR2K51YG7KMMYSKfdNt8XRVIcgEpL2OjjNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=daMYg1oO; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="daMYg1oO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769489822; x=1801025822;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iCCD613JRllm9h3TTRIOf9U7yT/wcqwphBj87uNAy8M=;
  b=daMYg1oObe3BtsAcjqu4hJbAQZ+aO9xYkIOjL9v+MTTk/J33nOpzXKBB
   sb1vovTy4Pk0IsaogJid6MVc0hya1ohg24y++tiIN+VChLMisG3Iy9Ts9
   3s1GLZ4Tvkh+NUiuQX73NijyTeN38IiZpHC/scUCO4C9NjiasHIWqws+v
   4hbQ95sZk5W28Ayh2eSx6T5JQ+R28FqOv3oskE1/i7Lc2lcpHVF0QchLd
   OSfLzcndsvXrr0C+C75aqS4J3tIyZL8wYuEzIM/bkHyRYMTfX6w11U+WE
   P0JqvoD+tVUJ7WRu2O8c1h0x6AhL+Eklplb7RMwHyg+WDgM5KPFLyWC7X
   A==;
X-CSE-ConnectionGUID: vDbg3AJhSbit2P61U+QY7Q==
X-CSE-MsgGUID: 7iKEi2AZSVSskq35pupcpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70576409"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="70576409"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 20:56:56 -0800
X-CSE-ConnectionGUID: RnL5XyQ0TyifckmNW9deyg==
X-CSE-MsgGUID: BjAW/y1nS+OoBpGBNWqn3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="207103829"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Jan 2026 20:56:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkb8E-00000000Y0S-2WGC;
	Tue, 27 Jan 2026 04:56:50 +0000
Date: Tue, 27 Jan 2026 12:56:47 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <cel@kernel.org>, NeilBrown <neilb@ownmail.net>,
	Jeff Layton <jlayton@kernel.org>,
	Olga Kornievskaia <okorniev@redhat.com>,
	Dai Ngo <dai.ngo@oracle.com>, Tom Talpey <tom@talpey.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-nfs@vger.kernel.org, Chuck Lever <chuck.lever@oracle.com>
Subject: Re: [PATCH v3 11/14] lockd: Move xdr.h from include/linux/lockd/ to
 fs/lockd/
Message-ID: <202601271247.TFeb5MO5-lkp@intel.com>
References: <20260126195535.154697-12-cel@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126195535.154697-12-cel@kernel.org>

Hi Chuck,

kernel test robot noticed the following build warnings:

[auto build test WARNING on trondmy-nfs/linux-next]
[also build test WARNING on brauner-vfs/vfs.all linus/master v6.19-rc7 next-20260126]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chuck-Lever/lockd-Simplify-cast_status-in-svcproc-c/20260127-035838
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/20260126195535.154697-12-cel%40kernel.org
patch subject: [PATCH v3 11/14] lockd: Move xdr.h from include/linux/lockd/ to fs/lockd/
config: s390-defconfig (https://download.01.org/0day-ci/archive/20260127/202601271247.TFeb5MO5-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601271247.TFeb5MO5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601271247.TFeb5MO5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/nfsd/lockd.c:11:
>> include/linux/lockd/bind.h:76:64: warning: declaration of 'struct file_lock' will not be visible outside of this function [-Wvisibility]
      76 | extern int      nlmclnt_proc(struct nlm_host *host, int cmd, struct file_lock *fl, void *data);
         |                                                                     ^
   1 warning generated.


vim +76 include/linux/lockd/bind.h

b1ece737f44f91d Benjamin Coddington  2017-04-11  75  
b1ece737f44f91d Benjamin Coddington  2017-04-11 @76  extern int	nlmclnt_proc(struct nlm_host *host, int cmd, struct file_lock *fl, void *data);
40373b125de6bab Trond Myklebust      2019-04-09  77  extern int	lockd_up(struct net *net, const struct cred *cred);
e3f70eadb7dddfb Stanislav Kinsbursky 2012-03-29  78  extern void	lockd_down(struct net *net);
^1da177e4c3f415 Linus Torvalds       2005-04-16  79  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
