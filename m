Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD45C23A6;
	Sat, 27 Apr 2024 21:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714254838; cv=none; b=nlPRQdXLycbA0KE6vmxLOtgfvCd5K5cKKd4XbdjE55nmN2hGjN2VXWwCr/VDBSx5PKg82VC7Z6x2gCRqKaGeVF+z+nJ75DvWb4dLl6YXgFoR0pAHha6Y3KVffyScE68m8k0rtBPMCMkCcLtpon/6JH7YZRGyKYkmhdXaqwFow0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714254838; c=relaxed/simple;
	bh=j2UDwrOW3W/qVifAdFPVU3GwjpIl8MzICt5TYduy950=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nk5jbHoyaYBzu2XUSgKcDyiIycmenLrtDzWEx4CfAyqDHIJv6OFksey7H9H2Z1uddd2f8i9+sEz+lInBCVfva6Ai0FDNBzY8P5j0hmgNSpzUg8KGf2jZMGaL+RRB9D2c/JEtc8SY4F996yiJE4OwtyT6U4+tZMzbWkkSLrX3Kyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DCyk9a/l; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DCyk9a/l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714254836; x=1745790836;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j2UDwrOW3W/qVifAdFPVU3GwjpIl8MzICt5TYduy950=;
  b=DCyk9a/l9rMco5n6Xyy1ouBgi7ucKpKL/d44z5a7ft+qqCj5CE4oVpmT
   IvfekHhgmALU8ot0d7+NimjrotUmIOasNn0hfLuBlXEZNvjZ5AEsgDLNn
   YLIfRa3hOMkeNi9MkFQJIvnXA7cI9lTaRye/49TYZI57XG2lrglMhDnoC
   umLTWkDZuylEW9pD9aucQ9QX4BznvIiXufvHkD+zV2faglCs/z6vBv9is
   oTR7oq0QG4DRhCn/gcUEFgc7/gGTA2ZnOJipocLWDLaTjQi8x2Fl/K+55
   ekMc64REkOPT3dzoM0BuYOaU9Naen4O4L6axYj8IKlzlzKsLAUAnb1/k1
   g==;
X-CSE-ConnectionGUID: IPi2FSCsQriWJoBG4tfIoA==
X-CSE-MsgGUID: ZW3O8poVSTaORptemXgGfw==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="21109788"
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="21109788"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 14:53:56 -0700
X-CSE-ConnectionGUID: 38w/ZQvLSR2kz4XR50yUmg==
X-CSE-MsgGUID: c3DJWoWIQ5GNhYpGX81eUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="30200670"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Apr 2024 14:53:53 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0pzT-0005Wq-0G;
	Sat, 27 Apr 2024 21:53:51 +0000
Date: Sun, 28 Apr 2024 05:53:48 +0800
From: kernel test robot <lkp@intel.com>
To: Min Li <min.li.xe@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS 984/991]
 drivers/misc/rsmu_cm.c:333:53: warning: implicit conversion from 'int' to
 'u16' (aka 'unsigned short') changes value from 537972560 to 53072
Message-ID: <202404280514.Od8Q8l1B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS
head:   08ceadacc1da15a77045dee6654f9cd906906271
commit: 7d3c0f27dc86aab8e1ddd1683691633e72f28174 [984/991] misc: rsmu: add rsmu cdev driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240428/202404280514.Od8Q8l1B-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404280514.Od8Q8l1B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404280514.Od8Q8l1B-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/misc/rsmu_cm.c:15:
   In file included from drivers/misc/rsmu_cdev.h:13:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/misc/rsmu_cm.c:15:
   In file included from drivers/misc/rsmu_cdev.h:13:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/misc/rsmu_cm.c:15:
   In file included from drivers/misc/rsmu_cdev.h:13:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   drivers/misc/rsmu_cm.c:172:6: warning: variable 'err' set but not used [-Wunused-but-set-variable]
     172 |         int err;
         |             ^
>> drivers/misc/rsmu_cm.c:333:53: warning: implicit conversion from 'int' to 'u16' (aka 'unsigned short') changes value from 537972560 to 53072 [-Wconstant-conversion]
     333 |         u16 scratch = IDTCM_FW_REG(rsmu->fw_version, V520, SCRATCH);
         |             ~~~~~~~                                        ^~~~~~~
   include/linux/mfd/idt8a340_reg.h:503:43: note: expanded from macro 'SCRATCH'
     503 | #define SCRATCH                           0x2010cf50
         |                                           ^~~~~~~~~~
   include/linux/mfd/idt8a340_reg.h:744:55: note: expanded from macro 'IDTCM_FW_REG'
     744 | #define IDTCM_FW_REG(FW, VER, REG)      (((FW) < (VER)) ? (REG) : (REG##_##VER))
         |                                                            ^~~
   drivers/misc/rsmu_cm.c:333:16: warning: implicit conversion from 'int' to 'u16' (aka 'unsigned short') changes value from 537972556 to 53068 [-Wconstant-conversion]
     333 |         u16 scratch = IDTCM_FW_REG(rsmu->fw_version, V520, SCRATCH);
         |             ~~~~~~~   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mfd/idt8a340_reg.h:744:63: note: expanded from macro 'IDTCM_FW_REG'
     744 | #define IDTCM_FW_REG(FW, VER, REG)      (((FW) < (VER)) ? (REG) : (REG##_##VER))
         |                                                                    ^~~~~~~~~~~
   <scratch space>:62:1: note: expanded from here
      62 | SCRATCH_V520
         | ^~~~~~~~~~~~
   include/linux/mfd/idt8a340_reg.h:504:43: note: expanded from macro 'SCRATCH_V520'
     504 | #define SCRATCH_V520                      0x2010cf4c
         |                                           ^~~~~~~~~~
   9 warnings generated.


vim +333 drivers/misc/rsmu_cm.c

   165	
   166	static int rsmu_cm_set_output_tdc_go(struct rsmu_cdev *rsmu, u8 tdc, u8 enable)
   167	{
   168		/* This function enables or disables output tdc alignment. */
   169		u8 tdc_ctrl4_offset;
   170		u32 tdc_n;
   171		u8 reg;
 > 172		int err;
   173	
   174		tdc_ctrl4_offset = IDTCM_FW_REG(rsmu->fw_version, V520, OUTPUT_TDC_CTRL_4);
   175	
   176		switch (tdc) {
   177		case 0:
   178			tdc_n = OUTPUT_TDC_0;
   179			break;
   180		case 1:
   181			tdc_n = OUTPUT_TDC_1;
   182			break;
   183		case 2:
   184			tdc_n = OUTPUT_TDC_2;
   185			break;
   186		case 3:
   187			tdc_n = OUTPUT_TDC_3;
   188			break;
   189		default:
   190			return -EINVAL;
   191		}
   192	
   193		err = regmap_bulk_read(rsmu->regmap, tdc_n + tdc_ctrl4_offset,
   194				       &reg, sizeof(reg));
   195	
   196		if (enable)
   197			reg |= 0x01;
   198		else
   199			reg &= ~0x01;
   200	
   201		return regmap_bulk_write(rsmu->regmap, tdc_n + tdc_ctrl4_offset,
   202					 &reg, sizeof(reg));
   203	}
   204	
   205	static int rsmu_cm_get_dpll_state(struct rsmu_cdev *rsmu, u8 dpll, u8 *state)
   206	{
   207		u8 reg;
   208		int err;
   209	
   210		/* 8 is sys dpll */
   211		if (dpll > 8)
   212			return -EINVAL;
   213	
   214		err = regmap_bulk_read(rsmu->regmap, STATUS + DPLL0_STATUS + dpll, &reg, sizeof(reg));
   215		if (err)
   216			return err;
   217	
   218		switch (reg & DPLL_STATE_MASK) {
   219		case DPLL_STATE_FREERUN:
   220			*state = E_SRVLOUNQUALIFIEDSTATE;
   221			break;
   222		case DPLL_STATE_LOCKACQ:
   223		case DPLL_STATE_LOCKREC:
   224			*state = E_SRVLOLOCKACQSTATE;
   225			break;
   226		case DPLL_STATE_LOCKED:
   227			*state = E_SRVLOTIMELOCKEDSTATE;
   228			break;
   229		case DPLL_STATE_HOLDOVER:
   230			*state = E_SRVLOHOLDOVERINSPECSTATE;
   231			break;
   232		default:
   233			*state = E_SRVLOSTATEINVALID;
   234			break;
   235		}
   236	
   237		return 0;
   238	}
   239	
   240	static int rsmu_cm_get_dpll_ffo(struct rsmu_cdev *rsmu, u8 dpll,
   241					struct rsmu_get_ffo *ffo)
   242	{
   243		u8 buf[8] = {0};
   244		s64 fcw = 0;
   245		u16 dpll_filter_status;
   246		int err;
   247	
   248		switch (dpll) {
   249		case 0:
   250			dpll_filter_status = DPLL0_FILTER_STATUS;
   251			break;
   252		case 1:
   253			dpll_filter_status = DPLL1_FILTER_STATUS;
   254			break;
   255		case 2:
   256			dpll_filter_status = DPLL2_FILTER_STATUS;
   257			break;
   258		case 3:
   259			dpll_filter_status = DPLL3_FILTER_STATUS;
   260			break;
   261		case 4:
   262			dpll_filter_status = DPLL4_FILTER_STATUS;
   263			break;
   264		case 5:
   265			dpll_filter_status = DPLL5_FILTER_STATUS;
   266			break;
   267		case 6:
   268			dpll_filter_status = DPLL6_FILTER_STATUS;
   269			break;
   270		case 7:
   271			dpll_filter_status = DPLL7_FILTER_STATUS;
   272			break;
   273		case 8:
   274			dpll_filter_status = DPLLSYS_FILTER_STATUS;
   275			break;
   276		default:
   277			return -EINVAL;
   278		}
   279	
   280		err = regmap_bulk_read(rsmu->regmap, STATUS + dpll_filter_status, buf, 6);
   281		if (err)
   282			return err;
   283	
   284		/* Convert to frequency control word (FCW) */
   285		fcw = sign_extend64(get_unaligned_le64(buf), 47);
   286	
   287		/* FCW unit is 2 ^ -53 = 1.1102230246251565404236316680908e-16 */
   288		ffo->ffo = fcw * 111;
   289	
   290		return 0;
   291	}
   292	
   293	static int rsmu_cm_get_fw_version(struct rsmu_cdev *rsmu)
   294	{
   295		int err;
   296		u8 major;
   297		u8 minor;
   298		u8 hotfix;
   299	
   300		err = regmap_bulk_read(rsmu->regmap, GENERAL_STATUS + MAJ_REL,
   301				       &major, sizeof(major));
   302		if (err)
   303			return err;
   304		major >>= 1;
   305	
   306		err = regmap_bulk_read(rsmu->regmap, GENERAL_STATUS + MIN_REL,
   307				       &minor, sizeof(minor));
   308		if (err)
   309			return err;
   310	
   311		err = regmap_bulk_read(rsmu->regmap, GENERAL_STATUS + HOTFIX_REL,
   312				       &hotfix, sizeof(hotfix));
   313		if (err)
   314			return err;
   315	
   316		if (major >= 5 && minor >= 2) {
   317			rsmu->fw_version = V520;
   318			return 0;
   319		}
   320	
   321		if (major == 4 && minor >= 8) {
   322			rsmu->fw_version = V487;
   323			return 0;
   324		}
   325	
   326		rsmu->fw_version = V_DEFAULT;
   327		return 0;
   328	}
   329	
   330	static int rsmu_cm_load_firmware(struct rsmu_cdev *rsmu,
   331					 char fwname[FW_NAME_LEN_MAX])
   332	{
 > 333		u16 scratch = IDTCM_FW_REG(rsmu->fw_version, V520, SCRATCH);
   334		char fname[FW_NAME_LEN_MAX] = FW_FILENAME;
   335		const struct firmware *fw;
   336		struct idtcm_fwrc *rec;
   337		u32 regaddr;
   338		int err;
   339		s32 len;
   340		u8 val;
   341		u8 loaddr;
   342	
   343		if (fwname) /* Module parameter */
   344			snprintf(fname, sizeof(fname), "%s", fwname);
   345	
   346		dev_info(rsmu->dev, "requesting firmware '%s'", fname);
   347	
   348		err = request_firmware(&fw, fname, rsmu->dev);
   349		if (err) {
   350			dev_err(rsmu->dev, "Loading firmware %s failed !!!", fname);
   351			return err;
   352		}
   353	
   354		dev_dbg(rsmu->dev, "firmware size %zu bytes", fw->size);
   355	
   356		rec = (struct idtcm_fwrc *) fw->data;
   357	
   358		for (len = fw->size; len > 0; len -= sizeof(*rec)) {
   359			if (rec->reserved) {
   360				dev_err(rsmu->dev,
   361					"bad firmware, reserved field non-zero");
   362				err = -EINVAL;
   363			} else {
   364				regaddr = rec->hiaddr << 8;
   365				regaddr |= rec->loaddr;
   366	
   367				val = rec->value;
   368				loaddr = rec->loaddr;
   369	
   370				rec++;
   371	
   372				err = check_and_set_masks(rsmu, regaddr, val);
   373			}
   374	
   375			if (err != -EINVAL) {
   376				err = 0;
   377	
   378				/* Top (status registers) and bottom are read-only */
   379				if (regaddr < SCSR_ADDR(GPIO_USER_CONTROL) || regaddr >= scratch)
   380					continue;
   381	
   382				/* Page size 128, last 4 bytes of page skipped */
   383				if ((loaddr > 0x7b && loaddr <= 0x7f) || loaddr > 0xfb)
   384					continue;
   385	
   386				err = regmap_bulk_write(rsmu->regmap, SCSR_BASE + regaddr,
   387						       &val, sizeof(val));
   388			}
   389	
   390			if (err)
   391				goto out;
   392		}
   393	
   394	out:
   395		release_firmware(fw);
   396		return err;
   397	}
   398	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
