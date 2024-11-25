Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C522500CB;
	Mon, 25 Nov 2024 16:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732553076; cv=none; b=OyxLrIIALvloZyse+gh699bb0g9+2/JaIk6OpiZ0gCtFrseR0ouesoSRv/JFYZtD7KZPItbH3oHYRkvZeRXUk+8MKM2mgk+QkthNC3FzCcQfqGfcUKLPhXLwHE2oGU+/gjsItc9yPykCb42QkMHVuJToD2rkj/e8Esw4hq65oqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732553076; c=relaxed/simple;
	bh=qGZQS7FcAB/UyIGtfCnfdxY4J+dkVBrjNgPot3Tg9UU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tjl3erPJUTOXnZC7RGdsq/Pt8NTPzJ2grXAqk9qSAzDWptLxCWW+MGsDP1Ax2OGySUhNtCB2cqvpgNzyhsaEsyPG+5SZ0lMQ2erqoGvHUqPcFxe36qbQ4kdp+SoEY9mE6yFQQNzQHQbzRcLAsWiYgaP5GOlj9WpYwWkTnkHKh48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AAMloT0p; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AAMloT0p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732553073; x=1764089073;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qGZQS7FcAB/UyIGtfCnfdxY4J+dkVBrjNgPot3Tg9UU=;
  b=AAMloT0puq/vl6PK0+3ZzeCRzuSxCrKLkz7/ybvpt8Kcyn79JsgUQfCS
   yJFa4r5we+vf0E2LrNhMq/VT+GSC763+GQYirUBYJfCYRkKVTeIZYAzyi
   UVS0R290qjxP+246567PIRXFMH/PMeJzVbyeyaZUMV5A1qQZBK/u4Fgdn
   4nDPiboFQAOHLRtvRF0gP3PhaE6PU6hvqUtEOzHmf5nNkiVl2U8QVEDKp
   GZ1Ps4ookr0EqWbyJnM4MjnYN6JxQZR6xGI9dDjnb2/FBWOxz2mz970hg
   MiZGURGmWUbi7na81z8+87BjJnQwyfb4mrUxYmDP3JsaswPWBa1TE7KpA
   Q==;
X-CSE-ConnectionGUID: 6bfri2JZQnK82FB+BZyVXQ==
X-CSE-MsgGUID: LUZLsf/0Te6MnNJNHA36IA==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32800242"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="32800242"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 08:44:29 -0800
X-CSE-ConnectionGUID: qRb3L2/GQ/CikwDougXocg==
X-CSE-MsgGUID: gLFjNOJaQL2e6gP9WmUCGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="91221279"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 25 Nov 2024 08:44:28 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFcCH-0006bt-12;
	Mon, 25 Nov 2024 16:44:25 +0000
Date: Tue, 26 Nov 2024 00:43:44 +0800
From: kernel test robot <lkp@intel.com>
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, mpe@ellerman.id.au,
	npiggin@gmail.com, maddy@linux.ibm.com, msuchanek@suse.de,
	tyreld@linux.ibm.com, hbabu@us.ibm.com, haren@linux.ibm.com
Subject: Re: [PATCH] powerpc/pseries: Add papr-platform-dump character driver
 for dump retrieval
Message-ID: <202411260057.wrWAIl67-lkp@intel.com>
References: <20241124052040.239813-1-haren@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241124052040.239813-1-haren@linux.ibm.com>

Hi Haren,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes linus/master v6.12 next-20241125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haren-Myneni/powerpc-pseries-Add-papr-platform-dump-character-driver-for-dump-retrieval/20241125-112816
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20241124052040.239813-1-haren%40linux.ibm.com
patch subject: [PATCH] powerpc/pseries: Add papr-platform-dump character driver for dump retrieval
config: powerpc64-randconfig-001-20241125 (https://download.01.org/0day-ci/archive/20241126/202411260057.wrWAIl67-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241126/202411260057.wrWAIl67-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411260057.wrWAIl67-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/platforms/pseries/papr-platform-dump.c:51: warning: Function parameter or struct member 'dump_tag_hi' not described in 'ibm_platform_dump_params'
>> arch/powerpc/platforms/pseries/papr-platform-dump.c:51: warning: Function parameter or struct member 'dump_tag_lo' not described in 'ibm_platform_dump_params'
>> arch/powerpc/platforms/pseries/papr-platform-dump.c:51: warning: Function parameter or struct member 'sequence_hi' not described in 'ibm_platform_dump_params'
>> arch/powerpc/platforms/pseries/papr-platform-dump.c:51: warning: Function parameter or struct member 'sequence_lo' not described in 'ibm_platform_dump_params'
>> arch/powerpc/platforms/pseries/papr-platform-dump.c:51: warning: Function parameter or struct member 'bytes_ret_hi' not described in 'ibm_platform_dump_params'
>> arch/powerpc/platforms/pseries/papr-platform-dump.c:51: warning: Function parameter or struct member 'bytes_ret_lo' not described in 'ibm_platform_dump_params'
>> arch/powerpc/platforms/pseries/papr-platform-dump.c:51: warning: Excess struct member 'dump_tag' description in 'ibm_platform_dump_params'
>> arch/powerpc/platforms/pseries/papr-platform-dump.c:51: warning: Excess struct member 'sequence' description in 'ibm_platform_dump_params'
>> arch/powerpc/platforms/pseries/papr-platform-dump.c:51: warning: Excess struct member 'written' description in 'ibm_platform_dump_params'


vim +51 arch/powerpc/platforms/pseries/papr-platform-dump.c

    25	
    26	/**
    27	 * struct ibm_platform_dump_params - Parameters (in and out) for
    28	 *                                              ibm,platform-dump
    29	 * @work_area:	In: work area buffer for results.
    30	 * @buf_length:	In: work area buffer length in bytes
    31	 * @dump_tag:	In: Dump_Tag representing an id of the dump being processed
    32	 * @sequence:	In: Sequence number. Out: Next sequence number.
    33	 * @written:	Out: Bytes written by ibm,platform-dump to @work_area.
    34	 * @status:	Out: RTAS call status.
    35	 * @list:	Maintain the list of dumps are in progress. Can retrieve
    36	 *		multiple dumps with different dump IDs at the same time,
    37	 *		but not with the same dump ID. This list is used to
    38	 *		determine whether the dump for the same ID is in progress.
    39	 */
    40	struct ibm_platform_dump_params {
    41		struct rtas_work_area	*work_area;
    42		u32			buf_length;
    43		u32			dump_tag_hi;
    44		u32			dump_tag_lo;
    45		u32			sequence_hi;
    46		u32			sequence_lo;
    47		u32			bytes_ret_hi;
    48		u32			bytes_ret_lo;
    49		s32			status;
    50		struct list_head	list;
  > 51	};
    52	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
