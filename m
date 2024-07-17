Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3908F181316;
	Wed, 17 Jul 2024 14:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721225540; cv=none; b=chdaQeU8FWlF/NsvqXrUZJx/zIQCgkgtEBc7UnVGNmWs0jcbFEif/oNrEDcAIDtOdDMCe3pHw3qzO2Go3fGlX285rWI7OIG5OiOs02AfX33b7CJzUBCuWe/Ww1BzRuWzMZxHXBMgh2jTQeXgTOYfZKeIUHSe6wtV4hmOuZ66Blk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721225540; c=relaxed/simple;
	bh=Q5MyQH+yVVxh76EUeQMGf6MQdvj13PRQid8x5Ji99cg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aHLyOxeAiRaWpxBcrVQvOrp3CGZzbb93EWpCRd5tJQsZhOzIbdvZ+LpuGKafgbfTy5blnjyl5eAjUNXI6TjKObus+BAYonPfyag3vTd/cbOZtH+XDuYKLj6Em1Oa/+5TqzTd4gpZZOvxN28aAjFDJY4/bId3JDOiHUx/LHzKNYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g3RISodO; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g3RISodO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721225538; x=1752761538;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q5MyQH+yVVxh76EUeQMGf6MQdvj13PRQid8x5Ji99cg=;
  b=g3RISodOP00jNJZi4ksTyAoG6dTURVRcY7hs0akc3tI0VV0FV/Ni2kA8
   6Ar1xQDDHZcUjNsZS97TmiLNBK0jlCA8fmhMUbwX5HTlPpT6AEFwaUmUz
   wSUcfKGbPON1X3Gm9obv4QLeqYZjquAWNle0PQ+hL2rjbycHMHbikOyBV
   U/GS8p6F+cDbMOxKq5XYD25LyoLzC9CYPZ6ZMkexJUTFr2qNtyIez7q0Z
   dLYoIfUy6Ndh0/RlO9m0BtzYkVUUC7LJt+D8gc/w8NWqn/Xa9nhoWzukN
   xeNPZ9GT50xbJ+/MjObuos8X5pCVix7SKw7e25EdKqqwqwEh1TqsT9KZu
   Q==;
X-CSE-ConnectionGUID: F0xxH8fVRAeZvBurte75BQ==
X-CSE-MsgGUID: sTphk6+HSLOYv2gpupj2MQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18869673"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; 
   d="scan'208";a="18869673"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 07:12:16 -0700
X-CSE-ConnectionGUID: lMbBYjH4TESxk9XrMfQYWA==
X-CSE-MsgGUID: A0Db5CyKQJ2J6d9F7FAGaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; 
   d="scan'208";a="50460365"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Jul 2024 07:12:15 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sU5O8-000gNI-1g;
	Wed, 17 Jul 2024 14:12:12 +0000
Date: Wed, 17 Jul 2024 22:11:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20240710-cbc 13/13]
 ./usr/include/linux/usb/video.h:403:60: warning: type specifier missing,
 defaults to 'int'
Message-ID: <202407172246.JMnOxzX5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20240710-cbc
head:   e3597892cb471e5732700d17c2cca098f3148759
commit: 73efb8d9b6a2ba4b07021861a1760ec742ddf432 [13/13] usb: video: Avoid -Wflex-array-member-not-at-end warning
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240717/202407172246.JMnOxzX5-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240717/202407172246.JMnOxzX5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407172246.JMnOxzX5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/usb/video.h:403:60: warning: type specifier missing, defaults to 'int' [-Wimplicit-int]
     403 | static_assert(offsetof(struct uvc_input_header_descriptor, bmaControls) ==
         |                                                            ^
         |                                                            int
   ./usr/include/linux/usb/video.h:403:15: warning: type specifier missing, defaults to 'int' [-Wimplicit-int]
     403 | static_assert(offsetof(struct uvc_input_header_descriptor, bmaControls) ==
         |               ^
         |               int
   ./usr/include/linux/usb/video.h:403:73: error: expected ')'
     403 | static_assert(offsetof(struct uvc_input_header_descriptor, bmaControls) ==
         |                                                                         ^
   ./usr/include/linux/usb/video.h:403:14: note: to match this '('
     403 | static_assert(offsetof(struct uvc_input_header_descriptor, bmaControls) ==
         |              ^
   ./usr/include/linux/usb/video.h:403:1: warning: type specifier missing, defaults to 'int' [-Wimplicit-int]
     403 | static_assert(offsetof(struct uvc_input_header_descriptor, bmaControls) ==
         | ^
         | int
   3 warnings and 1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
