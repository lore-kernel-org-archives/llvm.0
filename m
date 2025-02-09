Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06A54A35;
	Sun,  9 Feb 2025 00:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739060068; cv=none; b=PXuTSBJRy7UjJm2i/8Vln9VpAkdCO3U10QEtXH0lTyaT5gyZNge1r9qu5Tzly8EiCB0FGscuYiBst3gS593QRcARry8uq+DLTPYBykPwiOPc/HHzJymLcz06wTuFopinCvda+hwumlt49QHieTWNODmalvxbvzkdRosb5lEVFCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739060068; c=relaxed/simple;
	bh=QxI+x1QDOUqzx5VSV6FNvRPS+wklt4IwDjs8QOrJ0eU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VsSyBKcqROMiMAt68PD3EF4sZr4qawE83O+4f3RbYxzqMjBtCiwo6nFJfY0sH9b6kYm/fhR9m69QdEmprasEGcxdaWDCJb1sRJRL57lPo//falqNGT0XGp0LYYW0pUo47HsVs1K7KxC65XJDhg30CZh96TJc1OaTtp+uXpymDBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P9fZkrBA; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P9fZkrBA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739060066; x=1770596066;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QxI+x1QDOUqzx5VSV6FNvRPS+wklt4IwDjs8QOrJ0eU=;
  b=P9fZkrBA5KwoD7f/nOjQRbWL0aHR7ibHAD6+q2Z44tmsx7d65pbWivSu
   poCyez+squ5GFBGmwhAYyB4rg69sksrDzUTTkHgWyAOZkCS5wtbnrrh10
   f1RH6bpaZcAA9Gb4ic7ZBFJ58f96il+FHRYaGR//vtVUEWK3TkZCD9aLG
   M8SszyAbxcaNdPMiL6HZlXkAhnQhXzA48A4aO1t+pfeeBMIlQXHTTWMGc
   hZ6k8EjD283aIf6vdl63ohq7blwlAxehmOLS3nX6Bvcdcq4UVOrDyKwez
   vQvyRcu0f1nYxDPeCT1h7DmditG7vIngaMLo5lfA/9rerhSFE6rLbxPag
   g==;
X-CSE-ConnectionGUID: sA6D00NfT8Ce8dC4+fOajA==
X-CSE-MsgGUID: uR2odkyIQZup6ZskFLEmBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="39563524"
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="39563524"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 16:14:25 -0800
X-CSE-ConnectionGUID: KgRCvjjeTh2jiYg3ooD7Kw==
X-CSE-MsgGUID: T0j8rS+3Qv62EMU1HJJ4Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="111623672"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Feb 2025 16:14:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tguxo-0010nn-37;
	Sun, 09 Feb 2025 00:14:20 +0000
Date: Sun, 9 Feb 2025 08:14:14 +0800
From: kernel test robot <lkp@intel.com>
To: David Lechner <dlechner@baylibre.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v8 14/17] iio: adc: ad4695: Add support for SPI offload
Message-ID: <202502090806.KxEvxCZC-lkp@intel.com>
References: <20250207-dlech-mainline-spi-engine-offload-2-v8-14-e48a489be48c@baylibre.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207-dlech-mainline-spi-engine-offload-2-v8-14-e48a489be48c@baylibre.com>

Hi David,

kernel test robot noticed the following build errors:

[auto build test ERROR on 884697cc74d9fea0a8628c2794d0b80065ac95d1]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Lechner/spi-add-basic-support-for-SPI-offloading/20250208-041627
base:   884697cc74d9fea0a8628c2794d0b80065ac95d1
patch link:    https://lore.kernel.org/r/20250207-dlech-mainline-spi-engine-offload-2-v8-14-e48a489be48c%40baylibre.com
patch subject: [PATCH v8 14/17] iio: adc: ad4695: Add support for SPI offload
config: hexagon-randconfig-001-20250209 (https://download.01.org/0day-ci/archive/20250209/202502090806.KxEvxCZC-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 6807164500e9920638e2ab0cdb4bf8321d24f8eb)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502090806.KxEvxCZC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502090806.KxEvxCZC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iio/adc/ad4695.c:801:3: error: cannot jump from this goto statement to its label
     801 |                 goto err_offload_trigger_disable;
         |                 ^
   drivers/iio/adc/ad4695.c:803:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     803 |         guard(mutex)(&st->cnv_pwm_lock);
         |         ^
   include/linux/cleanup.h:309:15: note: expanded from macro 'guard'
     309 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:30:1: note: expanded from here
      30 | __UNIQUE_ID_guard434
         | ^
   drivers/iio/adc/ad4695.c:797:3: error: cannot jump from this goto statement to its label
     797 |                 goto err_disable_busy_output;
         |                 ^
   drivers/iio/adc/ad4695.c:803:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     803 |         guard(mutex)(&st->cnv_pwm_lock);
         |         ^
   include/linux/cleanup.h:309:15: note: expanded from macro 'guard'
     309 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:30:1: note: expanded from here
      30 | __UNIQUE_ID_guard434
         | ^
   drivers/iio/adc/ad4695.c:792:3: error: cannot jump from this goto statement to its label
     792 |                 goto err_unoptimize_message;
         |                 ^
   drivers/iio/adc/ad4695.c:803:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
     803 |         guard(mutex)(&st->cnv_pwm_lock);
         |         ^
   include/linux/cleanup.h:309:15: note: expanded from macro 'guard'
     309 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:166:29: note: expanded from macro '__UNIQUE_ID'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:30:1: note: expanded from here
      30 | __UNIQUE_ID_guard434
         | ^
   3 errors generated.


vim +801 drivers/iio/adc/ad4695.c

   723	
   724	static int ad4695_offload_buffer_postenable(struct iio_dev *indio_dev)
   725	{
   726		struct ad4695_state *st = iio_priv(indio_dev);
   727		struct spi_offload_trigger_config config = {
   728			.type = SPI_OFFLOAD_TRIGGER_DATA_READY,
   729		};
   730		struct spi_transfer *xfer = &st->buf_read_xfer[0];
   731		struct pwm_state state;
   732		u8 temp_chan_bit = st->chip_info->num_voltage_inputs;
   733		u8 num_slots = 0;
   734		u8 temp_en = 0;
   735		unsigned int bit;
   736		int ret;
   737	
   738		iio_for_each_active_channel(indio_dev, bit) {
   739			if (bit == temp_chan_bit) {
   740				temp_en = 1;
   741				continue;
   742			}
   743	
   744			ret = regmap_write(st->regmap, AD4695_REG_AS_SLOT(num_slots),
   745					   FIELD_PREP(AD4695_REG_AS_SLOT_INX, bit));
   746			if (ret)
   747				return ret;
   748	
   749			num_slots++;
   750		}
   751	
   752		/*
   753		 * For non-offload, we could discard data to work around this
   754		 * restriction, but with offload, that is not possible.
   755		 */
   756		if (num_slots < 2) {
   757			dev_err(&st->spi->dev,
   758				"At least two voltage channels must be enabled.\n");
   759			return -EINVAL;
   760		}
   761	
   762		ret = regmap_update_bits(st->regmap, AD4695_REG_TEMP_CTRL,
   763					 AD4695_REG_TEMP_CTRL_TEMP_EN,
   764					 FIELD_PREP(AD4695_REG_TEMP_CTRL_TEMP_EN,
   765						    temp_en));
   766		if (ret)
   767			return ret;
   768	
   769		/* Each BUSY event means just one sample for one channel is ready. */
   770		memset(xfer, 0, sizeof(*xfer));
   771		xfer->offload_flags = SPI_OFFLOAD_XFER_RX_STREAM;
   772		/* Using 19 bits per word to allow for possible oversampling */
   773		xfer->bits_per_word = 19;
   774		xfer->len = 4;
   775	
   776		spi_message_init_with_transfers(&st->buf_read_msg, xfer, 1);
   777		st->buf_read_msg.offload = st->offload;
   778	
   779		ret = spi_optimize_message(st->spi, &st->buf_read_msg);
   780		if (ret)
   781			return ret;
   782	
   783		/*
   784		 * NB: technically, this is part the SPI offload trigger enable, but it
   785		 * doesn't work to call it from the offload trigger enable callback
   786		 * because it requires accessing the SPI bus. Calling it from the
   787		 * trigger enable callback could cause a deadlock.
   788		 */
   789		ret = regmap_set_bits(st->regmap, AD4695_REG_GP_MODE,
   790				      AD4695_REG_GP_MODE_BUSY_GP_EN);
   791		if (ret)
   792			goto err_unoptimize_message;
   793	
   794		ret = spi_offload_trigger_enable(st->offload, st->offload_trigger,
   795						 &config);
   796		if (ret)
   797			goto err_disable_busy_output;
   798	
   799		ret = ad4695_enter_advanced_sequencer_mode(st, num_slots);
   800		if (ret)
 > 801			goto err_offload_trigger_disable;
   802	
   803		guard(mutex)(&st->cnv_pwm_lock);
   804		pwm_get_state(st->cnv_pwm, &state);
   805		/*
   806		 * PWM subsystem generally rounds down, so requesting 2x minimum high
   807		 * time ensures that we meet the minimum high time in any case.
   808		 */
   809		state.duty_cycle = AD4695_T_CNVH_NS * 2;
   810		ret = pwm_apply_might_sleep(st->cnv_pwm, &state);
   811		if (ret)
   812			goto err_offload_exit_conversion_mode;
   813	
   814		return 0;
   815	
   816	err_offload_exit_conversion_mode:
   817		/*
   818		 * We have to unwind in a different order to avoid triggering offload.
   819		 * ad4695_exit_conversion_mode() triggers a conversion, so it has to be
   820		 * done after spi_offload_trigger_disable().
   821		 */
   822		spi_offload_trigger_disable(st->offload, st->offload_trigger);
   823		ad4695_exit_conversion_mode(st);
   824		goto err_disable_busy_output;
   825	
   826	err_offload_trigger_disable:
   827		spi_offload_trigger_disable(st->offload, st->offload_trigger);
   828	
   829	err_disable_busy_output:
   830		regmap_clear_bits(st->regmap, AD4695_REG_GP_MODE,
   831				  AD4695_REG_GP_MODE_BUSY_GP_EN);
   832	
   833	err_unoptimize_message:
   834		spi_unoptimize_message(&st->buf_read_msg);
   835	
   836		return ret;
   837	}
   838	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
