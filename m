Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5851940A1;
	Tue, 23 Dec 2025 10:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766486171; cv=none; b=cVKUpEXa9THCbMFCVqsqFACEZe1Kp17/pAGX583aXDe5Ujy2H9QEiuohrbawcq2MHEKLO8OXXguBn/9yfSX3gJBRCAcMzeT9+p2pz1cT47YhlRb4DN5KLYctmlx8b74HlYBYX2STfx/oL6DaMTmhLlJsXkYDXFpycalO7OFUj9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766486171; c=relaxed/simple;
	bh=Oew7yIWp1hO2Lj1NqPOJBLlJo/OJ1PqNF5DWVpffp8M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LmZGALFecdVjScnO0xftzmyDuN+EbKf/4PSvSV7tGlpV2hI63Ft5jJgUlbog3uI6U/B//B0hcVqJWAwOVM/4bkwaTnW5BOhBYqZJNBMQZ47dCpS4AkHObBxX/mzPkfEFzmHkPE0E6izdkQPD72IPQ82er0HWuaJJNkBzvMfjlcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VMuC2LCW; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VMuC2LCW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766486169; x=1798022169;
  h=date:from:to:cc:subject:message-id;
  bh=Oew7yIWp1hO2Lj1NqPOJBLlJo/OJ1PqNF5DWVpffp8M=;
  b=VMuC2LCWMM8GCm9qtLXM6pwaFzcf5XclmsFbW9UYP53O0c+KsXILhevk
   RJI6PH0YOwZRM70bNW1o/MelDwhAD7xgN9SEr2dA7S8VxC5pbaPlHkUlv
   E3N4A7ME/tV8fu0yLunFhYMzEfc7zg1CdxZAXRIvBWN3Prl+53rgRbd0n
   oYBo+KogrrW4b3es3gDPknB3mDhxPblAzr5hmygVHwknXYeqSiMzmLvlm
   5485m69oKmoctbUXgsV6ASRT2PaAg6xzD05U9B7WCVAmIuddlp4k5vtCo
   uBFCCxOv0G1uo2zJ01bOQ66lMXvjqTbgQ61LzyPSXtU97v8ZEb2UjnLTl
   g==;
X-CSE-ConnectionGUID: bHzRBlL9QFK7NZgcvgn4Jg==
X-CSE-MsgGUID: adDHTHb7Rm254wAjRHHrHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="55902602"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="55902602"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 02:36:07 -0800
X-CSE-ConnectionGUID: FZEncCvKTV2jx3nYcNfcNw==
X-CSE-MsgGUID: AZq3ueFUTZqQsErVVw130A==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 23 Dec 2025 02:36:05 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXzkJ-000000001l9-0itj;
	Tue, 23 Dec 2025 10:36:03 +0000
Date: Tue, 23 Dec 2025 18:35:12 +0800
From: kernel test robot <lkp@intel.com>
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/gicv5-full 68/82]
 arch/arm64/kvm/vgic/vgic-its-v5.c:311:13: warning: variable
 'device_id_l1_shift' is used uninitialized whenever 'if' condition is false
Message-ID: <202512231832.ACrEYhoS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/gicv5-full
head:   1426b88096b597395df4c82f089b87c62bab45da
commit: 9d01097b8baaed8cf8de6d6eece4953aa6ed71c5 [68/82] KVM: arm64: gic-v5: Add the ITS device
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251223/202512231832.ACrEYhoS-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512231832.ACrEYhoS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512231832.ACrEYhoS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/vgic/vgic-its-v5.c:311:13: warning: variable 'device_id_l1_shift' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     311 |         } else if (dt_l2sz == 2) {
         |                    ^~~~~~~~~~~~
   arch/arm64/kvm/vgic/vgic-its-v5.c:317:22: note: uninitialized use occurs here
     317 |                      (device_id >> device_id_l1_shift) * sizeof(__le64);
         |                                    ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/vgic/vgic-its-v5.c:311:9: note: remove the 'if' if its condition is always true
     311 |         } else if (dt_l2sz == 2) {
         |                ^~~~~~~~~~~~~~~~~
   arch/arm64/kvm/vgic/vgic-its-v5.c:301:29: note: initialize the variable 'device_id_l1_shift' to silence this warning
     301 |         unsigned device_id_l1_shift, l2_device_id;
         |                                    ^
         |                                     = 0
>> arch/arm64/kvm/vgic/vgic-its-v5.c:421:13: warning: variable 'itt_split_bits' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     421 |         } else if (itt_l2sz == 2) {
         |                    ^~~~~~~~~~~~~
   arch/arm64/kvm/vgic/vgic-its-v5.c:427:28: note: uninitialized use occurs here
     427 |         l1_event_id = event_id >> itt_split_bits;
         |                                   ^~~~~~~~~~~~~~
   arch/arm64/kvm/vgic/vgic-its-v5.c:421:9: note: remove the 'if' if its condition is always true
     421 |         } else if (itt_l2sz == 2) {
         |                ^~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/vgic/vgic-its-v5.c:411:25: note: initialize the variable 'itt_split_bits' to silence this warning
     411 |         unsigned itt_split_bits, l2_event_id_bits;
         |                                ^
         |                                 = 0
   arch/arm64/kvm/vgic/vgic-its-v5.c:515:5: warning: no previous prototype for function 'vgic_v5_its_look_up_lpi' [-Wmissing-prototypes]
     515 | int vgic_v5_its_look_up_lpi(struct kvm *kvm, struct vgic_v5_its *its,
         |     ^
   arch/arm64/kvm/vgic/vgic-its-v5.c:515:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     515 | int vgic_v5_its_look_up_lpi(struct kvm *kvm, struct vgic_v5_its *its,
         | ^
         | static 
   3 warnings generated.


vim +311 arch/arm64/kvm/vgic/vgic-its-v5.c

   293	
   294	static int parse_two_level_dt(struct kvm *kvm, gpa_t dt_base, unsigned dt_l2sz,
   295				      u32 device_id, gpa_t *itt_base,
   296				      bool *two_level_itt, unsigned *event_id_bits,
   297				      unsigned *itt_l2sz)
   298	{
   299		int ret;
   300		__le64 dt_l1_entry;
   301		unsigned device_id_l1_shift, l2_device_id;
   302		gpa_t dt_l2_base;
   303		gpa_t entry_addr;
   304	
   305		if (dt_l2sz == 0) {
   306			// 9 bits for L2 table (4kB)
   307			device_id_l1_shift = 9;
   308		} else if (dt_l2sz == 1) {
   309			// 11 bits for L2 table (16kB)
   310			device_id_l1_shift = 11;
 > 311		} else if (dt_l2sz == 2) {
   312			// 13 bits for L2 table (64kB)
   313			device_id_l1_shift = 13;
   314		}
   315	
   316		entry_addr = dt_base +
   317			     (device_id >> device_id_l1_shift) * sizeof(__le64);
   318	
   319		ret = kvm_read_guest_lock(kvm, entry_addr, &dt_l1_entry,
   320					  sizeof(__le64));
   321		if (ret) {
   322			kvm_err("Failed to read guest memory for L1 DT!");
   323			return ret;
   324		}
   325	
   326		if (!FIELD_GET(GICV5_DTL1E_VALID, dt_l1_entry)) {
   327			kvm_err("Guest DT L1 entry is invalid!\n");
   328			return -EINVAL;
   329		}
   330	
   331		dt_l2_base = FIELD_GET(GICV5_DTL1E_L2_ADDR_MASK, dt_l1_entry) << 3;
   332		l2_device_id = device_id % (1UL << device_id_l1_shift);
   333		if (l2_device_id >= (1UL << FIELD_GET(GICV5_DTL1E_SPAN, dt_l1_entry))) {
   334			kvm_err("DeviceID 0x%x out of range of guest DT\n", device_id);
   335			return -ENXIO;
   336		}
   337	
   338		return parse_linear_dt(kvm, dt_l2_base, l2_device_id, itt_base,
   339				       two_level_itt, event_id_bits, itt_l2sz);
   340	}
   341	
   342	/*
   343	 * Get the GPA for the ITT corresponding to device_id in the guest.
   344	 */
   345	static int get_itt(struct kvm *kvm, struct vgic_v5_its *its, u32 device_id,
   346			   gpa_t *itt_base, bool *two_level_itt,
   347			   unsigned *event_id_bits, unsigned *itt_l2sz)
   348	{
   349		gpa_t dt_base;
   350		bool two_level_dt;
   351		unsigned dt_l2sz, device_id_bits;
   352		int ret;
   353	
   354		/*
   355		 * First of all, let's make sure that we have a valid ITS_DT_BASER. This
   356		 * MMIO register doesn't have a valid bit, so we assume that it is valid
   357		 * if the guest enabled the virtual ITS. This matches the expected
   358		 * behaviour of a HW device.
   359		 */
   360		if (its->enabled == 0) {
   361			kvm_err("Cannot look up LPI; vITS is disabled!\n");
   362			return -ENXIO;
   363		}
   364	
   365		/* The physical address of the DT in the guest */
   366		dt_base = its->dt_baser.addr;
   367	
   368		two_level_dt = its->dt_cfgr.structure;
   369		dt_l2sz = its->dt_cfgr.l2sz;
   370		device_id_bits = its->dt_cfgr.device_id_bits;
   371	
   372		if (device_id >= 1UL << device_id_bits) {
   373			kvm_err("Device ID out of range!\n");
   374			return -E2BIG;
   375		}
   376	
   377		if (!two_level_dt) {
   378			ret = parse_linear_dt(kvm, dt_base, device_id, itt_base,
   379					      two_level_itt, event_id_bits, itt_l2sz);
   380		} else {
   381			ret = parse_two_level_dt(kvm, dt_base, dt_l2sz, device_id,
   382						 itt_base, two_level_itt, event_id_bits,
   383						 itt_l2sz);
   384		}
   385	
   386		return ret;
   387	}
   388	
   389	static int parse_linear_itt(struct kvm *kvm, u32 event_id, gpa_t itt_base,
   390				    __le64 *itt_l2_entry)
   391	{
   392		int ret = 0;
   393		gpa_t entry_addr = itt_base + event_id * sizeof(*itt_l2_entry);
   394	
   395		ret = kvm_read_guest_lock(kvm, entry_addr, itt_l2_entry,
   396					  sizeof(*itt_l2_entry));
   397		if (ret) {
   398			kvm_err("Failed to read guest memory for L2 ITT!");
   399			return ret;
   400		}
   401	
   402		return ret;
   403	}
   404	
   405	static int parse_two_level_itt(struct kvm *kvm, u32 event_id, gpa_t itt_base,
   406				       unsigned itt_l2sz, __le64 *itt_l2_entry)
   407	{
   408		int ret = 0;
   409		__le64 itt_l1_entry;
   410		gpa_t itt_l2_base;
   411		unsigned itt_split_bits, l2_event_id_bits;
   412		u32 l1_event_id, l2_event_id;
   413		gpa_t entry_addr;
   414	
   415		if (itt_l2sz == 0) {
   416			// 9 bits for L2 table (4kB)
   417			itt_split_bits = 9;
   418		} else if (itt_l2sz == 1) {
   419			// 11 bits for L2 table (16kB)
   420			itt_split_bits = 11;
 > 421		} else if (itt_l2sz == 2) {
   422			// 13 bits for L2 table (64kB)
   423			itt_split_bits = 13;
   424		}
   425	
   426		/* Get the bits of the EventID used for L1 indexing */
   427		l1_event_id = event_id >> itt_split_bits;
   428	
   429		entry_addr = itt_base + l1_event_id * sizeof(itt_l1_entry);
   430		ret = kvm_read_guest_lock(kvm, entry_addr, &itt_l1_entry,
   431					  sizeof(itt_l1_entry));
   432		if (ret) {
   433			kvm_err("Failed to read guest memory for L1 ITT!");
   434			return ret;
   435		}
   436	
   437		if (!FIELD_GET(GICV5_ITTL1E_VALID, itt_l1_entry)) {
   438			kvm_err("Guest ITT L1 entry is invalid!\n");
   439			return -EINVAL;
   440		}
   441	
   442		itt_l2_base = FIELD_GET(GICV5_ITTL1E_L2_ADDR_MASK, itt_l1_entry) << 3;
   443	
   444		/*
   445		 * L2 event is limited by the min value of itt_split_bits and the span
   446		 * from the L1 entry.
   447		 */
   448		l2_event_id_bits =
   449			min(FIELD_GET(GICV5_ITTL1E_SPAN, itt_l1_entry), itt_split_bits);
   450		l2_event_id = event_id % (1UL << l2_event_id_bits);
   451	
   452		/*
   453		 * If the event is unreachable because it doesn't exist at L2 (span
   454		 * smaller than the number of L2 bits), we can't continue!
   455		 */
   456		if ((itt_split_bits != l2_event_id_bits) &&
   457		    (event_id % itt_split_bits) != l2_event_id) {
   458			kvm_err("EventID is out of range of L2 ITT!");
   459			return -ENXIO;
   460		}
   461	
   462		return parse_linear_itt(kvm, l2_event_id, itt_l2_base, itt_l2_entry);
   463	
   464		return ret;
   465	}
   466	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
