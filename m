Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD74D512;
	Wed, 31 Jul 2024 01:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722391033; cv=none; b=rYNU8r87PJETVrPyjTeFBbvpVkPqsnE7eOLk2GXiEr6CWVZvkcgdnkrDhKgzIDhZGMhdtwBhZ2fin9QyFPG//oZ80O+PktK0PGwhQK8hhO2dLm0blG5/uTabrEdceS3O1+SpQmFXBp5kobvOhUMME7VwImP8clqFi2khOiQB1/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722391033; c=relaxed/simple;
	bh=RCdNowIwLLOvGeo7UOW1THxlROaOWcSUiiLBHtq2S5o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TKi6E4A111XFuZsN1sPugU0wVzVA8pF5JdMiBj44zw7f2TaHWsom0xDoTkQDyTEwPrKYNPXSHXArd88nfJGuoCabGMV5T0m4gOcdtm8uVyP5yDfhHk4ILfb6jgExrZkosXx5rKEn22BriL6b9X7xW07VXdtesZH05+orDO8PZ7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ecgcw19M; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ecgcw19M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722391032; x=1753927032;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RCdNowIwLLOvGeo7UOW1THxlROaOWcSUiiLBHtq2S5o=;
  b=ecgcw19MJ977cuK6Xw9UWL13kc0liBnRNV365xDBZNCzUjcDh/IliZSC
   wWHfi8u01cQRRUaG4VAxcxkyU5LCrv9dTFjUaJVsUb//UDDDLGGttXoP5
   IC/V3g3IEU2jNfxMxq5CEfUumIAFVDfPtb0g96SR8T/H++ObD/yayWvx9
   PTG3E97JqvJNhmTy7MX0kEd6dGr1KCwt3m6Yry7zV95bbk41nuOw0Rhff
   uF7tEIMbBHo7OI3o6COtM/3S23UHhosLZRJikxdSGH2uPIpeq36WAkGSV
   ye5gEwt2yEzcb/vdjFBO6Z2wvdI5Ld6YFzz614oCk0oiHzV2S3IRI0mnp
   A==;
X-CSE-ConnectionGUID: rg6GijVPTkq5EByFpG6TGA==
X-CSE-MsgGUID: maUXBe9MRWmstzfOY0rcXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="20372907"
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; 
   d="scan'208";a="20372907"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 18:57:11 -0700
X-CSE-ConnectionGUID: c3yEIM8kS+uVhdm8NzgN7w==
X-CSE-MsgGUID: uSAYfPr9TZGm098+B58eNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; 
   d="scan'208";a="54779947"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 30 Jul 2024 18:57:08 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYyaQ-000tcJ-29;
	Wed, 31 Jul 2024 01:57:06 +0000
Date: Wed, 31 Jul 2024 09:56:27 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20240729-cbc 8/9]
 include/uapi/scsi/fc/fc_els.h:1131:15: error: expected parameter declarator
Message-ID: <202407310922.Mkw2WfT2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20240729-cbc
head:   303f7de5e5f60dfc378b9a32a201110936b43d83
commit: d9b68641e04510cbd540f81b8ef4379e4d26e201 [8/9] scsi: fc: Avoid -Wflex-array-member-not-at-end warnings
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240731/202407310922.Mkw2WfT2-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project ccae7b461be339e717d02f99ac857cf0bc7d17fc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407310922.Mkw2WfT2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407310922.Mkw2WfT2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/scsi/libfc/fc_elsct.c:16:
>> include/uapi/scsi/fc/fc_els.h:1131:15: error: expected parameter declarator
    1131 | static_assert(offsetof(struct fc_df_desc_fpin_reg, desc_tags) == sizeof(struct fc_df_desc_fpin_reg_hdr),
         |               ^
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^
   In file included from drivers/scsi/libfc/fc_elsct.c:16:
>> include/uapi/scsi/fc/fc_els.h:1131:15: error: expected ')'
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^
   include/uapi/scsi/fc/fc_els.h:1131:14: note: to match this '('
    1131 | static_assert(offsetof(struct fc_df_desc_fpin_reg, desc_tags) == sizeof(struct fc_df_desc_fpin_reg_hdr),
         |              ^
>> include/uapi/scsi/fc/fc_els.h:1131:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
    1131 | static_assert(offsetof(struct fc_df_desc_fpin_reg, desc_tags) == sizeof(struct fc_df_desc_fpin_reg_hdr),
         | ^
         | int
>> include/uapi/scsi/fc/fc_els.h:1131:14: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
    1131 | static_assert(offsetof(struct fc_df_desc_fpin_reg, desc_tags) == sizeof(struct fc_df_desc_fpin_reg_hdr),
         |              ^
    1132 |               "struct member likely outside of __struct_group()");
         |                                                                 
         |                                                                 void
   include/uapi/scsi/fc/fc_els.h:1149:15: error: expected parameter declarator
    1149 | static_assert(offsetof(struct fc_els_rdf, desc) == sizeof(struct fc_els_rdf_hdr),
         |               ^
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^
   In file included from drivers/scsi/libfc/fc_elsct.c:16:
   include/uapi/scsi/fc/fc_els.h:1149:15: error: expected ')'
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^
   include/uapi/scsi/fc/fc_els.h:1149:14: note: to match this '('
    1149 | static_assert(offsetof(struct fc_els_rdf, desc) == sizeof(struct fc_els_rdf_hdr),
         |              ^
   include/uapi/scsi/fc/fc_els.h:1149:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
    1149 | static_assert(offsetof(struct fc_els_rdf, desc) == sizeof(struct fc_els_rdf_hdr),
         | ^
         | int
   include/uapi/scsi/fc/fc_els.h:1149:14: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
    1149 | static_assert(offsetof(struct fc_els_rdf, desc) == sizeof(struct fc_els_rdf_hdr),
         |              ^
    1150 |               "struct member likely outside of __struct_group()");
         |                                                                 
         |                                                                 void
   In file included from drivers/scsi/libfc/fc_elsct.c:17:
   In file included from include/scsi/libfc.h:16:
   In file included from include/scsi/scsi_transport.h:10:
   In file included from include/linux/transport_class.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:168:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/scsi/libfc/fc_elsct.c:17:
   In file included from include/scsi/libfc.h:16:
   In file included from include/scsi/scsi_transport.h:10:
   In file included from include/linux/transport_class.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:168:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/scsi/libfc/fc_elsct.c:17:
   In file included from include/scsi/libfc.h:16:
   In file included from include/scsi/scsi_transport.h:10:
   In file included from include/linux/transport_class.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:168:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/scsi/libfc/fc_elsct.c:17:
   In file included from include/scsi/libfc.h:16:
   In file included from include/scsi/scsi_transport.h:10:
   In file included from include/linux/transport_class.h:11:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:168:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:


vim +1131 include/uapi/scsi/fc/fc_els.h

  1110	
  1111	/* Diagnostic Function Descriptor - FPIN Registration */
  1112	struct fc_df_desc_fpin_reg {
  1113		/* New members MUST be added within the __struct_group() macro below. */
  1114		__struct_group(fc_df_desc_fpin_reg_hdr, hdr, /* no attrs */,
  1115			__be32		desc_tag; /* FPIN Registration (0x00030001) */
  1116			__be32		desc_len; /* Length of Descriptor (in bytes).
  1117						   * Size of descriptor excluding
  1118						   * desc_tag and desc_len fields.
  1119						   */
  1120			__be32		count;	  /* Number of desc_tags elements */
  1121		);
  1122		__be32		desc_tags[];	/* Array of Descriptor Tags.
  1123						 * Each tag indicates a function
  1124						 * supported by the N_Port (request)
  1125						 * or by the  N_Port and Fabric
  1126						 * Controller (reply; may be a subset
  1127						 * of the request).
  1128						 * See ELS_FN_DTAG_xxx for tag values.
  1129						 */
  1130	};
> 1131	static_assert(offsetof(struct fc_df_desc_fpin_reg, desc_tags) == sizeof(struct fc_df_desc_fpin_reg_hdr),
  1132		      "struct member likely outside of __struct_group()");
  1133	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
