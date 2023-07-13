Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562311DDE4;
	Thu, 13 Jul 2023 14:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689260279; x=1720796279;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q3zUjDeG6yji0bYc4z/vrq3M5idQemea6aUfWcM/iKA=;
  b=m7/qcGXlIwtVt4gOrFCz0kAUOGoFzU7jf6CLwOSskEsuig8Rs36+bayI
   tcKjR1uFNEN1P5L8vG2czAt1QntBy+1mR+7AEaSb7PGHJ9RFkjokkStM/
   IhrqKPRQqnWXr4LgYdzwkEFWLwOQqc+fyvj0dWYwekJg2k+2+pFbBr7wT
   IoFGUl0zEMP3qg13pgoNWXTplZ10VMpxMY8u0AbPkzfDH1fHi8l9VMcFp
   AskctN81kOaGQJYWhTgR5zapRC3fwDKoBkX9ussU80XhuSCiDP2JZUwWc
   bErwweSi8iiCO3R2zogT0W2+uVWbnjZjRanZWdyAUKs/9wShjThGxXz9S
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="367853790"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="367853790"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 07:57:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="699282288"
X-IronPort-AV: E=Sophos;i="6.01,203,1684825200"; 
   d="scan'208";a="699282288"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 13 Jul 2023 07:57:57 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJxlU-0006hZ-1J;
	Thu, 13 Jul 2023 14:57:56 +0000
Date: Thu, 13 Jul 2023 22:57:08 +0800
From: kernel test robot <lkp@intel.com>
To: Mukul Joshi <mukul.joshi@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>
Subject: [linux-next:master 753/2369]
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c:834:5: error: stack frame size
 (1124) exceeds limit (1024) in 'amdgpu_amdkfd_unmap_hiq'
Message-ID: <202307132214.zi4xL3jo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e3262265625831348cfb3128d35907ead75d8bf7
commit: 9041b53a59d77039c69fa61be8575fa232cd3bcd [753/2369] drm/amdkfd: Use KIQ to unmap HIQ
config: i386-buildonly-randconfig-r004-20230713 (https://download.01.org/0day-ci/archive/20230713/202307132214.zi4xL3jo-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230713/202307132214.zi4xL3jo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307132214.zi4xL3jo-lkp@intel.com/

Note: the linux-next/master HEAD e3262265625831348cfb3128d35907ead75d8bf7 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c:834:5: error: stack frame size (1124) exceeds limit (1024) in 'amdgpu_amdkfd_unmap_hiq' [-Werror,-Wframe-larger-than]
   int amdgpu_amdkfd_unmap_hiq(struct amdgpu_device *adev, u32 doorbell_off,
       ^
   1 error generated.


vim +/amdgpu_amdkfd_unmap_hiq +834 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c

   833	
 > 834	int amdgpu_amdkfd_unmap_hiq(struct amdgpu_device *adev, u32 doorbell_off,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
