Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532FF11C8D;
	Sat, 18 Nov 2023 16:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cguor5Fb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700323703; x=1731859703;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ILfsu45co8OmzuHL/mx44YErC0YygLhCx9RbSR0txtI=;
  b=Cguor5FbSYm6Hav1BJcBscWDYAKxtRdsBxxQ8xNjXZtrWGpYPNKhzGga
   z1lqW9OHi4XSyLri3ISeCgBAnzxZokG/G8WNNF0l4aC2S0oGRQC6FgfE+
   ior/9CvoGz1m/B+vqImaletan+vY8SPiSWxqCiop9aJTZiHeMLj5z7V7K
   C8yqL3CTUf2q9ibdPVitb6mtFgBEW5BHdEzs7SPlwqFSeSZ2vclqmH4lj
   S6HxblIPhTK/NNHaw4W7ApB9zf/oogRkLOuKPXsT5Zagg16tSHUPuJILM
   jZnBrmTEL0v2EHWMepPRswlGdQ6+bjXyGIwVO0V0Tz0qdlaHkdwPT3ZXU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="388587848"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="388587848"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2023 08:08:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="759430390"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="759430390"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 18 Nov 2023 08:08:21 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4NrZ-00042p-20;
	Sat, 18 Nov 2023 16:08:13 +0000
Date: Sun, 19 Nov 2023 00:06:55 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-lib 22/51] ld.lld: error: undefined symbol:
 fscache_n_updates
Message-ID: <202311182310.vt9v8xif-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-lib
head:   63aa4c69f32c9443f9e93ca8cbbdd692c5970119
commit: 4608e9f5acd32ce6dbd092e33467fee9155fa27f [22/51] netfs: Provide func to copy data to pagecache for buffered write
config: hexagon-randconfig-001-20231118 (https://download.01.org/0day-ci/archive/20231118/202311182310.vt9v8xif-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231118/202311182310.vt9v8xif-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311182310.vt9v8xif-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: fscache_n_updates
   >>> referenced by buffered_write.c
   >>>               fs/netfs/buffered_write.o:(netfs_perform_write) in archive vmlinux.a
   >>> referenced by buffered_write.c
   >>>               fs/netfs/buffered_write.o:(netfs_perform_write) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
