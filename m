Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557453F9F3B;
	Thu,  9 Jul 2026 10:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783593205; cv=none; b=NldsjeZQ7NEABEZjq6fCbjqq+QwW/0oQAdtk15aNCK0TK2Wdv16+0MdZIQl6y1UmMagZrr7WR8LjApFI/Odk2cTpZCMxj9PbbdbWZmRNbZ64vp/+vYeWFJpgZONE2zFCNpXJOFJz8+Az2hKlNyXDwAee+03PedZVSzlcwIXqK9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783593205; c=relaxed/simple;
	bh=Tl5Vdvw4+K4gcbt3f3cppUmiHH89J3NUhYF9ZJqnEyI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AByr3qCRw8jLc84BSmN0Nmx9Adsz/jcDQe0dcintLTYx71JMU9XknNwdAnb+4s/uKAOgD1PVeMXrV2eTcAsYdQp55lsjwULQ/XUnhFeHsvDfTgDkzkMJFs3zkzUHsJR/dg8BV9w+vqF93LiPv0ANB1uQH1ZOu0WlU5MgyZ4DAt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kyXhWJ9p; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kyXhWJ9p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783593204; x=1815129204;
  h=date:from:to:cc:subject:message-id;
  bh=Tl5Vdvw4+K4gcbt3f3cppUmiHH89J3NUhYF9ZJqnEyI=;
  b=kyXhWJ9pB0DXcjJMYFmJZmGrjwUfmVokvHbsIXF0HwbfimKECuOqZpAj
   SHdp2h3uwlMQeOyT9i9GIra3JxR7UdtYJnqv5qkaCYadXmmJ/NJI729ai
   KZ4Ims47rd+i7bXJ6g+v9zbDTDa5w76OQdZarZkCk0Mcz8m8agBhys9/J
   KTaeERYzd2oK+dZR4zCez1c8ejFHUd/RW5qVC3/yq+h53oEfFiEtsHoww
   5UlF03JmCuPs+80CTHdgjd9YOsOkN3deaAEpyBdBPBoQm/DSSORz2h9gu
   h0MyAedRb/h1IoDWCPw4uH5sQ+Bcyud5XnvFP3m45VdIM02djmJSWmkIH
   w==;
X-CSE-ConnectionGUID: bmuV4El3RcyeseNb/VUaBg==
X-CSE-MsgGUID: lBNBQ21KQA+3wEIZQ41t+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88097378"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="88097378"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 03:33:24 -0700
X-CSE-ConnectionGUID: IJj1xcI4REqXtfnI/gYJYg==
X-CSE-MsgGUID: 9Z6cbZbGQlaZKy4doa2C0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="292739549"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 09 Jul 2026 03:33:22 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whm45-00000000HZB-3RD6;
	Thu, 09 Jul 2026 10:33:13 +0000
Date: Thu, 09 Jul 2026 18:32:15 +0800
From: kernel test robot <lkp@intel.com>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [vbabka:objext_split 10/14] mm/kasan/../slab.h:702:47:
 error: no member named '_ctref' in 'struct slabobj_ext'
Message-ID: <202607091829.wC2chgp4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Vlastimil,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git objext_split
head:   8bd682e28958694beba958e2a3af94c6e1789819
commit: 510dc45196b1495bba6f15a6f3348ace5c983136 [10/14] mm/slab: abstract slabobj_ext.ref access
config: x86_64-buildonly-randconfig-006-20260709 (https://download.01.org/0day-ci/archive/20260709/202607091829.wC2chgp4-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607091829.wC2chgp4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607091829.wC2chgp4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/kasan/generic.c:37:
>> mm/kasan/../slab.h:702:47: error: no member named '_ctref' in 'struct slabobj_ext'
     702 |         return &slab_obj_ext(slab, obj_exts, index)->_ctref;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ^
   1 error generated.


vim +702 mm/kasan/../slab.h

   694	
   695	static inline union codetag_ref *slab_obj_ext_codetag_ref(struct slab *slab,
   696						unsigned long obj_exts, const void *obj)
   697	{
   698		unsigned int index;
   699	
   700		index = obj_to_index(slab->slab_cache, slab, obj);
   701	
 > 702		return &slab_obj_ext(slab, obj_exts, index)->_ctref;
   703	}
   704	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
