Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED5B155C82;
	Fri,  1 Nov 2024 10:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730457939; cv=none; b=k6mSfXl+rgg06fRwiVD65HN1izD/Ss8K2Hkh/9BqmfE7YcvcWd0A7YWxCPEZmW6EqYN+scHrro1bJMLuD4Yjrt8zG+6Ils3IaKREpXxFZ1haSK7qwBQTD4J58m4FgHMSftSQ5KoKAKERjbJ8MOV/TuBTljv96EuqtHFXybNhA9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730457939; c=relaxed/simple;
	bh=Ep+2b4GG9obUmNuk8R6w+peiqygqXECH9SSIIi73u38=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H/djZrfJ7afvLLqncOo/1FPwrQvmdX0GmWlK3n1aaCEnTMCmUw3eUkb7r4srhgVVg5390D2wEvHSWKdj+q8gITgzvA+4zBHg2DLogdp+VIjwVxqz2ORu+nQX5ws25AXuvnBEpoxr0xYlSgarfYg9fhLGEkhCfxwcGTqXMDs2448=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XhyZS3yG; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XhyZS3yG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730457936; x=1761993936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ep+2b4GG9obUmNuk8R6w+peiqygqXECH9SSIIi73u38=;
  b=XhyZS3yGK7k4m2VqH/e3aSJH37kVuSdvOuua63pu0sJ7n1gtjqhYwxVf
   k9FBSMTffXC0gRthWlETB72Kclnm0X0L3/zEb8v4jREC3/UD/xAt5BzZS
   fnRMcGbv5ojR1YIU5ptGf0YER63AyUkGyDlOlx5Rk5h+mmeQWmTpdNMVq
   rZ7lvRWTFYrfSTkn09hpqh4BhsO3SJ7u9ulxKiZFVRrIysbWrXOrMbA4P
   +GC/CvKPIekdf5P5AKUlbJYf60Feo/i+IugmPajoSwga78M+2dtmGU2HM
   OV/gidHgPvm+SVLEi6Y7zJ+y2flqAh0xEFqDVoveh0VRjOtHg/6UU5CW9
   w==;
X-CSE-ConnectionGUID: 8OKXp6A3S1SJojao0iuyig==
X-CSE-MsgGUID: ivDnmqGqTTWZkIzmg+GR1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="29651029"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="29651029"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 03:45:35 -0700
X-CSE-ConnectionGUID: g/msahqwScavrExDIeOuQQ==
X-CSE-MsgGUID: R0RKkkApQTmpm2G4rto9/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="83363071"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 Nov 2024 03:45:33 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6p9n-000hQb-0A;
	Fri, 01 Nov 2024 10:45:31 +0000
Date: Fri, 1 Nov 2024 18:45:23 +0800
From: kernel test robot <lkp@intel.com>
To: Angelo Dureghello <adureghello@baylibre.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Nuno Sa <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>
Subject: [jic23-iio:testing 104/113] drivers/iio/dac/ad3552r-hs.c:400:17:
 warning: variable 'goffs' is uninitialized when used here
Message-ID: <202411011810.UEGYPaMF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   b569745666d49101f7a9a2a6df122bfbd89156ff
commit: 7bb79aecbdd2f137650685ee1171575c0daa4ff9 [104/113] iio: dac: ad3552r: add high-speed platform driver
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241101/202411011810.UEGYPaMF-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411011810.UEGYPaMF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411011810.UEGYPaMF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iio/dac/ad3552r-hs.c:12:
   In file included from include/linux/iio/backend.h:6:
   In file included from include/linux/iio/iio.h:10:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iio/dac/ad3552r-hs.c:400:17: warning: variable 'goffs' is uninitialized when used here [-Wuninitialized]
     400 |                         offset = abs(goffs);
         |                                      ^~~~~
   include/linux/math.h:148:21: note: expanded from macro 'abs'
     148 |                 __abs_choose_expr(x, short,                             \
         |                                   ^
   include/linux/math.h:158:24: note: expanded from macro '__abs_choose_expr'
     158 |         ({ signed type __x = (x); __x < 0 ? -__x : __x; }), other)
         |                               ^
   include/linux/math.h:158:54: note: expanded from macro '__abs_choose_expr'
     158 |         ({ signed type __x = (x); __x < 0 ? -__x : __x; }), other)
         |                                                             ^~~~~
   include/linux/math.h:158:54: note: expanded from macro '__abs_choose_expr'
     158 |         ({ signed type __x = (x); __x < 0 ? -__x : __x; }), other)
         |                                                             ^~~~~
   include/linux/math.h:158:54: note: expanded from macro '__abs_choose_expr'
     158 |         ({ signed type __x = (x); __x < 0 ? -__x : __x; }), other)
         |                                                             ^~~~~
   drivers/iio/dac/ad3552r-hs.c:298:11: note: initialize the variable 'goffs' to silence this warning
     298 |         s16 goffs;
         |                  ^
         |                   = 0
   5 warnings generated.


vim +/goffs +400 drivers/iio/dac/ad3552r-hs.c

   295	
   296	static int ad3552r_hs_setup(struct ad3552r_hs_state *st)
   297	{
   298		s16 goffs;
   299		u16 id;
   300		u16 gain = 0, offset = 0;
   301		u32 ch, val, range;
   302		int ret;
   303	
   304		ret = ad3552r_hs_reset(st);
   305		if (ret)
   306			return ret;
   307	
   308		ret = iio_backend_ddr_disable(st->back);
   309		if (ret)
   310			return ret;
   311	
   312		ret = ad3552r_hs_scratch_pad_test(st);
   313		if (ret)
   314			return ret;
   315	
   316		ret = st->data->bus_reg_read(st->back, AD3552R_REG_ADDR_PRODUCT_ID_L,
   317					     &val, 1);
   318		if (ret)
   319			return ret;
   320	
   321		id = val;
   322	
   323		ret = st->data->bus_reg_read(st->back, AD3552R_REG_ADDR_PRODUCT_ID_H,
   324					     &val, 1);
   325		if (ret)
   326			return ret;
   327	
   328		id |= val << 8;
   329		if (id != st->model_data->chip_id)
   330			dev_info(st->dev, "Chip ID error. Expected 0x%x, Read 0x%x\n",
   331				 AD3552R_ID, id);
   332	
   333		ret = st->data->bus_reg_write(st->back,
   334					      AD3552R_REG_ADDR_SH_REFERENCE_CONFIG,
   335					      0, 1);
   336		if (ret)
   337			return ret;
   338	
   339		ret = st->data->bus_reg_write(st->back,
   340					AD3552R_REG_ADDR_TRANSFER_REGISTER,
   341					FIELD_PREP(AD3552R_MASK_MULTI_IO_MODE,
   342						   AD3552R_QUAD_SPI) |
   343					AD3552R_MASK_STREAM_LENGTH_KEEP_VALUE, 1);
   344		if (ret)
   345			return ret;
   346	
   347		ret = iio_backend_data_source_set(st->back, 0, IIO_BACKEND_EXTERNAL);
   348		if (ret)
   349			return ret;
   350	
   351		ret = iio_backend_data_source_set(st->back, 1, IIO_BACKEND_EXTERNAL);
   352		if (ret)
   353			return ret;
   354	
   355		ret = ad3552r_get_ref_voltage(st->dev, &val);
   356		if (ret < 0)
   357			return ret;
   358	
   359		val = ret;
   360	
   361		ret = ad3552r_qspi_update_reg_bits(st,
   362					AD3552R_REG_ADDR_SH_REFERENCE_CONFIG,
   363					AD3552R_MASK_REFERENCE_VOLTAGE_SEL,
   364					val, 1);
   365		if (ret)
   366			return ret;
   367	
   368		ret = ad3552r_get_drive_strength(st->dev, &val);
   369		if (!ret) {
   370			ret = ad3552r_qspi_update_reg_bits(st,
   371						AD3552R_REG_ADDR_INTERFACE_CONFIG_D,
   372						AD3552R_MASK_SDO_DRIVE_STRENGTH,
   373						val, 1);
   374			if (ret)
   375				return ret;
   376		}
   377	
   378		device_for_each_child_node_scoped(st->dev, child) {
   379			ret = fwnode_property_read_u32(child, "reg", &ch);
   380			if (ret)
   381				return dev_err_probe(st->dev, ret,
   382						     "reg property missing\n");
   383	
   384			ret = ad3552r_get_output_range(st->dev, st->model_data, child,
   385						       &range);
   386			if (ret && ret != -ENOENT)
   387				return ret;
   388			if (ret == -ENOENT) {
   389				ret = ad3552r_get_custom_gain(st->dev, child,
   390							&st->ch_data[ch].p,
   391							&st->ch_data[ch].n,
   392							&st->ch_data[ch].rfb,
   393							&st->ch_data[ch].gain_offset);
   394				if (ret)
   395					return ret;
   396	
   397				gain = ad3552r_calc_custom_gain(st->ch_data[ch].p,
   398							st->ch_data[ch].n,
   399							st->ch_data[ch].gain_offset);
 > 400				offset = abs(goffs);
   401	
   402				st->ch_data[ch].range_override = 1;
   403	
   404				ret = ad3552r_hs_setup_custom_gain(st, ch, gain,
   405								   offset);
   406				if (ret)
   407					return ret;
   408			} else {
   409				st->ch_data[ch].range = range;
   410	
   411				ret = ad3552r_hs_set_output_range(st, ch, range);
   412				if (ret)
   413					return ret;
   414			}
   415	
   416			ad3552r_calc_gain_and_offset(&st->ch_data[ch], st->model_data);
   417		}
   418	
   419		return 0;
   420	}
   421	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
