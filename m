Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B161EA29
	for <llvm@lists.linux.dev>; Sun, 14 Aug 2022 03:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660447002; x=1691983002;
  h=date:from:cc:subject:message-id:mime-version;
  bh=oCufe8Yzj8ePqUOpIRqT8cv004NmA5G880p3jZ2SrqY=;
  b=m+X2n/4Lyr1AwxWpdW48kC1fnGkRBRK6zk0fCTxpadnCJIpPLpskG+fU
   7qsYeRE0sM0txokTzcR18EqgD5UgHozlPv0vu+hxGAjE9ro6CVPp9EbnO
   Q+2Xuz41RdndfGW7t1yWb77zO8VHlB6fhsROq34o3jfh/j8HghhIWhkPw
   qksOxCsHTkwqCT6/eOu8EuzYTQHTY5F9fzqd5Rufi0FJwN4FtQ4TICGix
   S8KYMAzCIYnagj7wySS2ViIAMeXO+gqkA8qj1qsNlGMLMSh4N7CS1Qiy+
   G4p6v6Qe7dGVDFNaGPS1XjhuYa32BepKZa+CFTTFZtIYKxLxwnVXAx1ko
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10437"; a="290546550"
X-IronPort-AV: E=Sophos;i="5.93,236,1654585200"; 
   d="scan'208";a="290546550"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2022 20:16:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,236,1654585200"; 
   d="scan'208";a="582505653"
Received: from lkp-server02.sh.intel.com (HELO 8745164cafc7) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 13 Aug 2022 20:16:40 -0700
Received: from kbuild by 8745164cafc7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oN47E-0002Qp-0X;
	Sun, 14 Aug 2022 03:16:40 +0000
Date: Sun, 14 Aug 2022 11:15:57 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android13-5.10
 8167/9999] drivers/mmc/host/toshsd.o: warning: objtool: .text: unexpected
 end of section
Message-ID: <202208141149.140EUBEV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Ammar Faizi <ammarfaizi2@gnuweeb.org>
TO: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android13-5.10
head:   aadf7ad9db2f7d93ecfb34d0e4f328519460c94e
commit: ffff118fe157b534c3244f8b300e655231dbd95c [8167/9999] BACKPORT: scripts/Makefile.clang: default to LLVM_IAS=1
config: x86_64-randconfig-a001-20220801 (https://download.01.org/0day-ci/archive/20220814/202208141149.140EUBEV-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/ffff118fe157b534c3244f8b300e655231dbd95c
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android13-5.10
        git checkout ffff118fe157b534c3244f8b300e655231dbd95c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/mmc/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/mmc/host/toshsd.o: warning: objtool: .text: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
