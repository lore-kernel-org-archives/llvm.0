Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC533C0A14;
	Thu,  9 Jul 2026 07:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783580778; cv=none; b=Hm2K7Mn0JnmXqdIc1LB8+6oeCReIRZDN8PEvnX6QHJeP8VfVR7z65C2HKs7eHL0W8Aj5jybyr9sZq+kEsCOSA3SICqjkaiLUOFdeFcb1vNUxJnzEbLUx117Pn6EWYK3et2xknwdHvIIrzJnYl+UMa/hYucu4AnMBD/RJcd4eMe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783580778; c=relaxed/simple;
	bh=GYu8WwhXjfAEzcyvNQ7sT0eQNE20tC3baHdzeoY540c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qcLob/jCzA6F+2G6oX5XSf6YHwi30mxAZz3DgH/wyu+a7+GSGRAsxrJl6IIFwl/P6+lDum5T7WCKgTz98VYABANKjhDggkykF54lwM03Wb5V4ypRdlsbtl5d/lkBCtQQ7AGr7zcnDrB84JPpqDT5Tdkbl6dcjkjSQ+jJpF54Q0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SaABgji3; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SaABgji3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783580776; x=1815116776;
  h=date:from:to:cc:subject:message-id;
  bh=GYu8WwhXjfAEzcyvNQ7sT0eQNE20tC3baHdzeoY540c=;
  b=SaABgji3crcEmxTqMGLwdSgVg3YNaZ/hmo0DcD8H4dL+onUNYa1cBZcH
   pN4puvYNYhG1o3gvfWURy8eXPUY2LfJbo+Mva5OtIXRTbJjsuWhZPfcD2
   y2HFb/L3N4N43taH8aFHJkorM9rkL0l7yVjcbYOljGXCcPFyQFfHs7bjm
   vF2IBqf+I/e0Io0aOtdlkC/Yj1Pa9a3CH2Xa27L2v8TICzG6hw5RyDovm
   nnlPSPJIvB6FEu1LGgDTixOX4jRKcEusQI+xWnRROqP3D72GsHQ0Ne2PB
   MKXHGiIpGIALwz3F5JhGv10Ir0jCbRcIgRqHGiYaXqO3QJN7r0tuvOnH1
   w==;
X-CSE-ConnectionGUID: pNO8Jm2qRmyZXHT/q9OlIw==
X-CSE-MsgGUID: YNhKuhnoS2yC/Kw7hmVrIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="109801625"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="109801625"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 00:06:16 -0700
X-CSE-ConnectionGUID: O8D7Mp9fTHK0AxTmdbmNRw==
X-CSE-MsgGUID: +Bb0YREkSlua+DzEV1jp+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="248136928"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 09 Jul 2026 00:06:14 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whipn-00000000HNX-1I3n;
	Thu, 09 Jul 2026 07:06:11 +0000
Date: Thu, 09 Jul 2026 15:04:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [vbabka:objext_split 11/14] mm/slub.c:1201:6: error: call to
 undeclared function 'obj_exts_in_object'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202607091431.vgj70nrG-lkp@intel.com>
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
commit: 0923358e166406daf2533102ff371c4ba7f93bf3 [11/14] mm/slab: replace stride with obj_exts_in_object flag
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20260709/202607091431.vgj70nrG-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607091431.vgj70nrG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607091431.vgj70nrG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/slub.c:1201:6: error: call to undeclared function 'obj_exts_in_object'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1201 |         if (obj_exts_in_object(slab))
         |             ^
   mm/slub.c:1201:6: note: did you mean 'obj_exts_in_slab'?
   mm/slub.c:865:20: note: 'obj_exts_in_slab' declared here
     865 | static inline bool obj_exts_in_slab(struct kmem_cache *s, struct slab *slab)
         |                    ^
   mm/slub.c:1406:6: error: call to undeclared function 'obj_exts_in_object'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1406 |         if (obj_exts_in_object(slab))
         |             ^
   mm/slub.c:1434:36: error: call to undeclared function 'obj_exts_in_object'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1434 |         if (obj_exts_in_slab(s, slab) && !obj_exts_in_object(slab)) {
         |                                           ^
   mm/slub.c:6502:11: error: call to undeclared function 'obj_exts_in_object'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    6502 |         else if (obj_exts_in_object(slab))
         |                  ^
   4 errors generated.


vim +/obj_exts_in_object +1201 mm/slub.c

  1166	
  1167	static void print_trailer(struct kmem_cache *s, struct slab *slab, u8 *p)
  1168	{
  1169		unsigned int off;	/* Offset of last byte */
  1170		u8 *addr = slab_address(slab);
  1171	
  1172		print_tracking(s, p);
  1173	
  1174		print_slab_info(slab);
  1175	
  1176		pr_err("Object 0x%p @offset=%tu fp=0x%p\n\n",
  1177		       p, p - addr, get_freepointer(s, p));
  1178	
  1179		if (s->flags & SLAB_RED_ZONE)
  1180			print_section(KERN_ERR, "Redzone  ", p - s->red_left_pad,
  1181				      s->red_left_pad);
  1182		else if (p > addr + 16)
  1183			print_section(KERN_ERR, "Bytes b4 ", p - 16, 16);
  1184	
  1185		print_section(KERN_ERR,         "Object   ", p,
  1186			      min_t(unsigned int, s->object_size, PAGE_SIZE));
  1187		if (s->flags & SLAB_RED_ZONE)
  1188			print_section(KERN_ERR, "Redzone  ", p + s->object_size,
  1189				s->inuse - s->object_size);
  1190	
  1191		off = get_info_end(s);
  1192	
  1193		if (s->flags & SLAB_STORE_USER)
  1194			off += 2 * sizeof(struct track);
  1195	
  1196		if (slub_debug_orig_size(s))
  1197			off += sizeof(unsigned long);
  1198	
  1199		off += kasan_metadata_size(s, false);
  1200	
> 1201		if (obj_exts_in_object(slab))
  1202			off += sizeof(struct slabobj_ext);
  1203	
  1204		if (off != size_from_object(s))
  1205			/* Beginning of the filler is the free pointer */
  1206			print_section(KERN_ERR, "Padding  ", p + off,
  1207				      size_from_object(s) - off);
  1208	}
  1209	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
