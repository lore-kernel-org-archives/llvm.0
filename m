Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4629618DF6B;
	Thu, 10 Oct 2024 21:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728596259; cv=none; b=lJ++EOBtySThjeG2ub+PH2C8YJNqJpkkLCtX9RIh7w4F5XLFG8QW33JqD2upiCEz360VjmFxjHCey4WU1nQks3DJvpOdtKybiVEq901ub1aUTLw26ivADw1xpIdf4sLHDT3b8U/X6D3qZfW8GCeHm4lqokMijvHVwlZrLpVlBVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728596259; c=relaxed/simple;
	bh=SLZqQHIpuy44l7TODZ0AsF0NBKbbpZ17pjjnSsywpJo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PP91jTdJoUOgXRnVpZGpHeeV7Bg4MvLqtmW6HxlRI9AOU3FTovw385KU/DzpNoVTaU97y2STXOa4lrjWIjd8U7QXPjBhzzpPFitISNGZzcOQjlmTTRqLqIZ/F6K8dud1nS4qi09C0UVm9Vqc1174e9rudFTLBzYW28f7rVCG7Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cqvat53A; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cqvat53A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728596257; x=1760132257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SLZqQHIpuy44l7TODZ0AsF0NBKbbpZ17pjjnSsywpJo=;
  b=Cqvat53AQNxX5Yky9ZuB7OhkrGKEBkk0+hA/6VoKm3h7uYwa40HmT/qY
   PQWKYRWpFk7rdwp35fxcmVrhaelk/JsOdQpHpcZI0NXQ/FyInP53MVp6P
   SodPUjae2LUDol7uvN/x7sT6MurSPN3Nf/dCpXR6FFoU2MIjVj9/jUN3Z
   oFA5EN71Rqf74elmEALf7aCAndLeicOKQc0SZupFnrllKCM7H5fn0p29g
   ongImNa+Y8TCc1L+eI4DozTVQnpsZd0PhgdZact2ty3RWDXOHZWkWUJFK
   EPRim2kNqz17alaLUnjgw+fi2coo/WtzLvTJHapgbJJt2yvmhUP/uphRI
   w==;
X-CSE-ConnectionGUID: /SAR5ylBSX6ERjFFXg0Dsw==
X-CSE-MsgGUID: LFRMoC9HQmKJ63RBFXUm7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="39352063"
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="39352063"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 14:37:37 -0700
X-CSE-ConnectionGUID: +td5tqgDRwKIIMEwk4RqGQ==
X-CSE-MsgGUID: hFPMtXb5S7Co0CL1ve3qhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="107578356"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Oct 2024 14:37:35 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sz0qj-000BJ3-0W;
	Thu, 10 Oct 2024 21:37:33 +0000
Date: Fri, 11 Oct 2024 05:37:25 +0800
From: kernel test robot <lkp@intel.com>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [pali:cifs 11/24] fs/smb/client/reparse.c:403:6: warning: variable
 'rc' is used uninitialized whenever 'if' condition is true
Message-ID: <202410110534.k2mApKIH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pali/linux.git cifs
head:   2b0da3456d145b506e29f872d257062b4e61c2f8
commit: 0bc721443b34290f9c1b6f57013708602f59e5ea [11/24] cifs: Add support for creating native Windows sockets
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241011/202410110534.k2mApKIH-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410110534.k2mApKIH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410110534.k2mApKIH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/smb/client/reparse.c:403:6: warning: variable 'rc' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     403 |         if (!IS_ERR(new))
         |             ^~~~~~~~~~~~
   fs/smb/client/reparse.c:408:9: note: uninitialized use occurs here
     408 |         return rc;
         |                ^~
   fs/smb/client/reparse.c:403:2: note: remove the 'if' if its condition is always false
     403 |         if (!IS_ERR(new))
         |         ^~~~~~~~~~~~~~~~~
     404 |                 d_instantiate(dentry, new);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
     405 |         else
         |         ~~~~
     406 |                 rc = PTR_ERR(new);
   fs/smb/client/reparse.c:399:8: note: initialize the variable 'rc' to silence this warning
     399 |         int rc;
         |               ^
         |                = 0
   1 warning generated.


vim +403 fs/smb/client/reparse.c

   381	
   382	static int create_native_socket(const unsigned int xid, struct inode *inode,
   383					struct dentry *dentry, struct cifs_tcon *tcon,
   384					const char *full_path)
   385	{
   386		struct cifs_open_info_data data = {
   387			.reparse_point = true,
   388			.reparse = { .tag = IO_REPARSE_TAG_AF_UNIX, },
   389		};
   390		struct reparse_data_buffer buf = {
   391			.ReparseTag = cpu_to_le32(IO_REPARSE_TAG_AF_UNIX),
   392			.ReparseDataLength = 0,
   393		};
   394		struct kvec iov = {
   395			.iov_base = &buf,
   396			.iov_len = sizeof(buf),
   397		};
   398		struct inode *new;
   399		int rc;
   400	
   401		new = smb2_get_reparse_inode(&data, inode->i_sb, xid,
   402					     tcon, full_path, false, &iov, NULL);
 > 403		if (!IS_ERR(new))
   404			d_instantiate(dentry, new);
   405		else
   406			rc = PTR_ERR(new);
   407		cifs_free_open_info(&data);
   408		return rc;
   409	}
   410	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
