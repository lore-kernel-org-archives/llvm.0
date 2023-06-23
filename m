Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734D3100D8;
	Fri, 23 Jun 2023 19:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687549161; x=1719085161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C0OCDbKtMBf0UrjLUm+vZksqXDd2f96Ac+0SmxATfmk=;
  b=ZwZF2jjs++DO5xJfcuoIKnoOn9g8jFtQIVT3g008Du8q1n76xL+Tljkm
   y5IuDuX2r7GDId9lSYSqba3oua3IQSeZWeoxgSSUfRr4bl9x9YFi/wLNQ
   irVt9BOEdMCPVVfRFgl4L5ZjhDus4v7gPwB7+94KyuzNfaGfpaUqKyZ/B
   wg4E7PINVQAjhSTzK7MH1gGJGwXZ7Cui5Oi5B6CWJnMUZ18Rs9TehiYSw
   pmy4ngT+Yvxwyvwk6Ec3HVJVQaSgrnyK/IwlBHNCaU+1/8/ItFqdmIF70
   yW9pH4zQ1DsS4VbTwSpfMlHanw1rfiNT1WvBXl3qxm3WBivibOXBAuXO5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="359711399"
X-IronPort-AV: E=Sophos;i="6.01,152,1684825200"; 
   d="scan'208";a="359711399"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2023 12:39:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="889580506"
X-IronPort-AV: E=Sophos;i="6.01,152,1684825200"; 
   d="scan'208";a="889580506"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 23 Jun 2023 12:39:18 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCmcn-0008VT-1q;
	Fri, 23 Jun 2023 19:39:17 +0000
Date: Sat, 24 Jun 2023 03:38:53 +0800
From: kernel test robot <lkp@intel.com>
To: Shyam Prasad N <sprasad@microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
	Steve French <stfrench@microsoft.com>
Subject: [cifs:for-next 13/13] fs/smb/client/cifs_debug.c:167:1: error:
 expected statement
Message-ID: <202306240307.Q3coT9og-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.samba.org/sfrench/cifs-2.6.git for-next
head:   33bc5dec2b4fd8d00fed51183615d91badf607d6
commit: 33bc5dec2b4fd8d00fed51183615d91badf607d6 [13/13] cifs: display the endpoint IP details in DebugData
config: i386-randconfig-r001-20230622 (https://download.01.org/0day-ci/archive/20230624/202306240307.Q3coT9og-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230624/202306240307.Q3coT9og-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306240307.Q3coT9og-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/smb/client/cifs_debug.c:167:1: error: expected statement
   }
   ^
   1 error generated.


vim +167 fs/smb/client/cifs_debug.c

33bc5dec2b4fd8 fs/smb/client/cifs_debug.c Shyam Prasad N 2023-06-09  166  
85150929a15b4e fs/cifs/cifs_debug.c       Aurelien Aptel 2019-11-20 @167  }
85150929a15b4e fs/cifs/cifs_debug.c       Aurelien Aptel 2019-11-20  168  

:::::: The code at line 167 was first introduced by commit
:::::: 85150929a15b4e0a225434d5970bba14ebdf31f1 cifs: dump channel info in DebugData

:::::: TO: Aurelien Aptel <aaptel@suse.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
