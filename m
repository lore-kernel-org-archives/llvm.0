Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B071F3FDC;
	Tue, 18 Mar 2025 20:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742331008; cv=none; b=lBjt6GMmhHNuVXGy0r3dzlewNCXvULxMRAjCEVUg0cxtbNo49dNQttpbsBvWUFX3a7NB+H/AWs2uY1BFl/Wcsa3jhFqg7lkS0Fwh9Ofz+75BZJxdCvJZQlEfwTvtze/YUVePH+zzBoeKFEHNXeoaTaTL0otvJD9jjJHJxGkjRlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742331008; c=relaxed/simple;
	bh=TvuaJ8vmKh2fNTfgJMFIl541cAjv4KVgIJ7ilNWbm0g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hdz4VE5EVJS8ix0liYgBhYUgdlEcoPiAntgscZr57oQr0VF7xHTOnHq8P7s/19zMG+iprLQBE4/uC2SWLwqvC529MMVciM/2Dqrix+2Hy8hjyAmH9RyFe1t7OmN02Wit/8sIBoYHCObEy/3HzExWlwulQmCN51MqMNogbpnB7V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ltfkPuNc; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ltfkPuNc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742331007; x=1773867007;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TvuaJ8vmKh2fNTfgJMFIl541cAjv4KVgIJ7ilNWbm0g=;
  b=ltfkPuNcav4QiyaQxkeM6TYUzZjoMXZBcJV5qeHVNIQqbuHO4rGqJTtF
   i7Q/OdDY6KOk4YXaGR3ZR2z/QE3JrH1Lr8ZEQUL/3K5vmBgsmwXaMopRI
   JYi8Y/FxRlWS8PzguNx/6TMkIrnLn3ZudjAS4Qf/OrsM9ct97omc/xOFC
   kfKm3eRvWK639+CYessI9w1epdOKBLb9rneDXJ/Emnzhwh8KNx6v959QL
   U+Csy9ZPoGkGXkb1R28iRv0FzvoS+S4tSmE/SYR1j3JTMnIaVdT00a3p9
   T48BeOXM/9d8/jFZ+2lSeQaDVV5OZFBLMReKeKTqah2BlPSUFCRzXX6am
   w==;
X-CSE-ConnectionGUID: j64BiqRDTzu2B9HRilS0WA==
X-CSE-MsgGUID: N7BJR/WfQamSrT2VxPPiow==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="43630888"
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; 
   d="scan'208";a="43630888"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 13:50:05 -0700
X-CSE-ConnectionGUID: b5k+mi4xQcyiHFQbPQ4BrA==
X-CSE-MsgGUID: 6r1LALw3Qy6rqQn4rwqMww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; 
   d="scan'208";a="122858912"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 18 Mar 2025 13:50:02 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tudsu-000EAa-2P;
	Tue, 18 Mar 2025 20:50:00 +0000
Date: Wed, 19 Mar 2025 04:49:51 +0800
From: kernel test robot <lkp@intel.com>
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Wei Liu <wei.liu@kernel.org>,
	Anirudh Rayabharam <anrayabh@linux.microsoft.com>,
	Jinank Jain <jinankjain@microsoft.com>,
	Mukesh Rathor <mrathor@linux.microsoft.com>,
	Muminul Islam <muislam@microsoft.com>,
	Praveen K Paladugu <prapal@linux.microsoft.com>,
	Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>,
	Roman Kisel <romank@linux.microsoft.com>
Subject: [linux-next:master 11611/12094] drivers/hv/mshv_root_main.c:597:8:
 warning: variable 'schednm' set but not used
Message-ID: <202503190403.qLewkFbn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c4d4884b67802c41fd67399747165d65c770621a
commit: 3ee7bc04bd48f70b6a37ad7d63b7d5202569ec68 [11611/12094] Drivers: hv: Introduce mshv_root module to expose /dev/mshv to VMMs
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250319/202503190403.qLewkFbn-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250319/202503190403.qLewkFbn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503190403.qLewkFbn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hv/mshv_root_main.c:597:8: warning: variable 'schednm' set but not used [-Wunused-but-set-variable]
     597 |         char *schednm;
         |               ^
   1 warning generated.


vim +/schednm +597 drivers/hv/mshv_root_main.c

   590	
   591	static_assert(sizeof(struct hv_message) <= MSHV_RUN_VP_BUF_SZ,
   592		      "sizeof(struct hv_message) must not exceed MSHV_RUN_VP_BUF_SZ");
   593	
   594	static long mshv_vp_ioctl_run_vp(struct mshv_vp *vp, void __user *ret_msg)
   595	{
   596		long rc;
 > 597		char *schednm;
   598	
   599		schednm = hv_scheduler_type == HV_SCHEDULER_TYPE_ROOT ? "root" : "hv";
   600	
   601		if (hv_scheduler_type == HV_SCHEDULER_TYPE_ROOT)
   602			rc = mshv_run_vp_with_root_scheduler(vp);
   603		else
   604			rc = mshv_run_vp_with_hyp_scheduler(vp);
   605	
   606		if (rc)
   607			return rc;
   608	
   609		if (copy_to_user(ret_msg, vp->vp_intercept_msg_page,
   610				 sizeof(struct hv_message)))
   611			rc = -EFAULT;
   612	
   613		return rc;
   614	}
   615	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
