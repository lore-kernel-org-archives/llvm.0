Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A4923C9;
	Sat, 18 Jan 2025 23:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737243681; cv=none; b=IflU5OT0Pu5vlDgMuKlxfQQ6BAFqG/JHj4jZcJH6LlchqV91/PrnlxccFhAqIWgQhiAITjVKmvEt3kbOEl1wA0QOvRACewEL/moGtwLJKAMrVcntNVXzzH7my0j541Amp4w2Sfv3L9weH8jVj4cqHtGqx0mbHofqfJJJtn44MXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737243681; c=relaxed/simple;
	bh=oa6w2JEKRhV/hebvVvDigyjxFc1RTwquDpgM3S2i344=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LgG/5eykliWXc/y/nLHfITPYwGl6DXkAlFZp+EIt7dCOR6/5C5t6a39sQV/omQn00r2RatAeqWf3YVLONJWdX3LPxaMbhBORClIhr+EiP/QsqICPsoPGIeqS3ptPpoVAqTS7dsOGwZY/VhOzgDEDbu7GmqkcEAAwzAeD1IeDCm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BzfJCcDG; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BzfJCcDG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737243680; x=1768779680;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oa6w2JEKRhV/hebvVvDigyjxFc1RTwquDpgM3S2i344=;
  b=BzfJCcDGRoFtczlNpOpq2IEr9bGzfWrMeTg/OwbNvsXTiqSYdsPGW881
   sMlxuKn9CBX3kQZnm3FERf5sp2h4+6aPXPbKMUERKqglkixPz9qCJpxFG
   tq6bTm0e91sshU9zLjY/h4a10Uk4XuI4kNwkxapS6gUODVdEeDRifduRP
   Gj/PJ1iJMkTJWKlRs50mCwPW/+PVXdHMniry6sv3hiTC32dTdHdODAu+Q
   nxb7GVTT7gTtbUf6CA4hWg2W8QfErT8AIGumnX3LhXI39vt43teWVvsMS
   BAFfa7oF2bGsg4432aAj+I2DS88M/lG+OjLPFsCIMzI7B/OYKkOfn2l9q
   g==;
X-CSE-ConnectionGUID: Lh6PkJiyTn+2K7uZgZm2KA==
X-CSE-MsgGUID: iCZkz3U8SvGkGD6eBNLeuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="37665400"
X-IronPort-AV: E=Sophos;i="6.13,216,1732608000"; 
   d="scan'208";a="37665400"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 15:41:19 -0800
X-CSE-ConnectionGUID: I//1zuMSTuGcLP9a3pZQPw==
X-CSE-MsgGUID: AF5+3RocR7un/a+tkd3jCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,216,1732608000"; 
   d="scan'208";a="136966810"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Jan 2025 15:41:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZIRH-000Uw3-0t;
	Sat, 18 Jan 2025 23:41:15 +0000
Date: Sun, 19 Jan 2025 07:41:02 +0800
From: kernel test robot <lkp@intel.com>
To: John Johansen <john.johansen@canonical.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jj-apparmor:apparmor-next 17/19] security/apparmor/file.c:544:17:
 warning: unused variable 'sock'
Message-ID: <202501190757.myuLxLyL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor.git apparmor-next
head:   e6b087676954e36a7b1ed51249362bb499f8c1c2
commit: c05e705812d179f4b85aeacc34a555a42bc4f9ac [17/19] apparmor: add fine grained af_unix mediation
config: i386-buildonly-randconfig-005-20250119 (https://download.01.org/0day-ci/archive/20250119/202501190757.myuLxLyL-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250119/202501190757.myuLxLyL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501190757.myuLxLyL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from security/apparmor/file.c:17:
   In file included from security/apparmor/include/af_unix.h:16:
   In file included from include/net/af_unix.h:9:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> security/apparmor/file.c:544:17: warning: unused variable 'sock' [-Wunused-variable]
     544 |         struct socket *sock = (struct socket *) file->private_data;
         |                        ^~~~
   2 warnings generated.
--
>> security/apparmor/af_unix.c:590: warning: Cannot understand  *
    on line 590 - I thought it was a doc line
--
>> security/apparmor/lsm.c:1130: warning: Function parameter or struct member 'sk' not described in 'apparmor_unix_stream_connect'
>> security/apparmor/lsm.c:1130: warning: Function parameter or struct member 'peer_sk' not described in 'apparmor_unix_stream_connect'
>> security/apparmor/lsm.c:1130: warning: Function parameter or struct member 'newsk' not described in 'apparmor_unix_stream_connect'
>> security/apparmor/lsm.c:1162: warning: Function parameter or struct member 'sock' not described in 'apparmor_unix_may_send'
>> security/apparmor/lsm.c:1162: warning: Function parameter or struct member 'peer' not described in 'apparmor_unix_may_send'
   security/apparmor/lsm.c:1270: warning: Function parameter or struct member 'sock' not described in 'apparmor_socket_bind'
   security/apparmor/lsm.c:1270: warning: Function parameter or struct member 'address' not described in 'apparmor_socket_bind'
   security/apparmor/lsm.c:1270: warning: Function parameter or struct member 'addrlen' not described in 'apparmor_socket_bind'


vim +/sock +544 security/apparmor/file.c

496c93196654d3 John Johansen 2017-06-09  538  
90c436a64a6e20 John Johansen 2022-09-19  539  static int __file_sock_perm(const char *op, const struct cred *subj_cred,
90c436a64a6e20 John Johansen 2022-09-19  540  			    struct aa_label *label,
56974a6fcfef69 John Johansen 2017-07-18  541  			    struct aa_label *flabel, struct file *file,
56974a6fcfef69 John Johansen 2017-07-18  542  			    u32 request, u32 denied)
56974a6fcfef69 John Johansen 2017-07-18  543  {
56974a6fcfef69 John Johansen 2017-07-18 @544  	struct socket *sock = (struct socket *) file->private_data;
56974a6fcfef69 John Johansen 2017-07-18  545  	int error;
56974a6fcfef69 John Johansen 2017-07-18  546  
56974a6fcfef69 John Johansen 2017-07-18  547  	AA_BUG(!sock);
56974a6fcfef69 John Johansen 2017-07-18  548  
56974a6fcfef69 John Johansen 2017-07-18  549  	/* revalidation due to label out of date. No revocation at this time */
56974a6fcfef69 John Johansen 2017-07-18  550  	if (!denied && aa_label_is_subset(flabel, label))
56974a6fcfef69 John Johansen 2017-07-18  551  		return 0;
56974a6fcfef69 John Johansen 2017-07-18  552  
56974a6fcfef69 John Johansen 2017-07-18  553  	/* TODO: improve to skip profiles cached in flabel */
c05e705812d179 John Johansen 2022-09-07  554  	error = aa_sock_file_perm(subj_cred, label, op, request, file);
56974a6fcfef69 John Johansen 2017-07-18  555  	if (denied) {
56974a6fcfef69 John Johansen 2017-07-18  556  		/* TODO: improve to skip profiles checked above */
56974a6fcfef69 John Johansen 2017-07-18  557  		/* check every profile in file label to is cached */
90c436a64a6e20 John Johansen 2022-09-19  558  		last_error(error, aa_sock_file_perm(subj_cred, flabel, op,
c05e705812d179 John Johansen 2022-09-07  559  						    request, file));
56974a6fcfef69 John Johansen 2017-07-18  560  	}
56974a6fcfef69 John Johansen 2017-07-18  561  	if (!error)
56974a6fcfef69 John Johansen 2017-07-18  562  		update_file_ctx(file_ctx(file), label, request);
56974a6fcfef69 John Johansen 2017-07-18  563  
56974a6fcfef69 John Johansen 2017-07-18  564  	return error;
56974a6fcfef69 John Johansen 2017-07-18  565  }
56974a6fcfef69 John Johansen 2017-07-18  566  

:::::: The code at line 544 was first introduced by commit
:::::: 56974a6fcfef69ee0825bd66ed13e92070ac5224 apparmor: add base infastructure for socket mediation

:::::: TO: John Johansen <john.johansen@canonical.com>
:::::: CC: John Johansen <john.johansen@canonical.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
