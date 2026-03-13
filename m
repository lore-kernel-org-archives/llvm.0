Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9B429E0FD;
	Fri, 13 Mar 2026 00:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773361429; cv=none; b=PzAas5ayDtglNLRCe32PPQjCwcfknQ/EwfXPD9s2qcgze+L9UhBbqs2g0rcuKJnpBqrxxwh9DuOYhtBthq41jkG7wFfJxdUDEfnhTZhTJQFwNPqTx+YFHzijJSiD4eYC5SdFddijPv4ViT2zELKX2lyzueDPiZf3iojByydTeSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773361429; c=relaxed/simple;
	bh=pJv7sk0hTLL6pj1U16nYDXvWWkjgOGwlVj0HKCx3xP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NOsI1RZGSLMW803SGdxyfzs3MgdgQAXueG2kUbDTHZV0WrD0jgylFEyLtBhzKkfA0sDJCqz+OUupAbxW4JcUZ/qIAp2jZ97B0+6pnsSWCT6E12tXp3CKqMNwlguPgE5350tYgStPsER5zutAbA/SltwFYnUXuBEvv0+a1UPWO7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E03f4rE1; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E03f4rE1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773361428; x=1804897428;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pJv7sk0hTLL6pj1U16nYDXvWWkjgOGwlVj0HKCx3xP0=;
  b=E03f4rE1Z3QytSrm/7W/FxXT2ttIe+7grP6+oNIKJwvMx5biPnmV/26p
   di6oUfu+eqCCCkcfA7kBwzf06b0RLGTq/A3S1ICUfStYOLOdTJCsu0osi
   enCI/aUVp+hKLTW/qEVmOcqS92N/571A2FdmzkBFCiX8t5TWb0r04+9SO
   egADKE/hoH2AFSLFMc+RoBDaUY9n/NLVJ9vkSuz5ZPe8U8jbpg+obR6UT
   TOR8nqd8I/7pK1Ygcn7irUhiRuWEFJAO0WrzkbVwfq6CZtxQlfjrgt1Yy
   1JHP+oOXGFIzUSgOlOhlaNu6K6gKoGvSUuC+ah26vbBoIC0mQaSEVWVgv
   Q==;
X-CSE-ConnectionGUID: /txe+ZEjSLeerY2vV3YogA==
X-CSE-MsgGUID: 4xXBpr0fR8Szix9xnp+J6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="78360714"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="78360714"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 17:23:48 -0700
X-CSE-ConnectionGUID: 7JQgRqj/TEidulp3xJ2H2Q==
X-CSE-MsgGUID: IPmKxs+AT6i5/DJSP6KCZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="225954292"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Mar 2026 17:23:39 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0qJU-000000003GX-1hL7;
	Fri, 13 Mar 2026 00:23:36 +0000
Date: Fri, 13 Mar 2026 08:23:19 +0800
From: kernel test robot <lkp@intel.com>
To: Sanjay Chitroda <sanjayembeddedse@gmail.com>, jic23@kernel.org,
	m.tretter@pengutronix.de, mchehab@kernel.org,
	p.zabel@pengutronix.de, tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
	pure.logic@nexus-software.ie
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
	kernel@pengutronix.de, kees@kernel.org,
	nabijaczleweli@nabijaczleweli.xyz, marcelo.schmitt1@gmail.com,
	maudspierings@gocontroll.com, hverkuil+cisco@kernel.org,
	ribalda@chromium.org, straube.linux@gmail.com,
	dan.carpenter@linaro.org, lukagejak5@gmail.com,
	ethantidmore06@gmail.com, samasth.norway.ananda@oracle.com,
	karanja99erick@gmail.com, s9430939@naver.com
Subject: Re: [PATCH 3/7] iio: st_sensors: simplify cleanup using __free
Message-ID: <202603130856.TRVqFtUG-lkp@intel.com>
References: <20260310200513.2162018-4-sanjayembedded@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310200513.2162018-4-sanjayembedded@gmail.com>

Hi Sanjay,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-linus]
[also build test ERROR on jic23-iio/togreg linuxtv-media-pending/master linus/master v7.0-rc3 next-20260311]
[cannot apply to staging/staging-testing staging/staging-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sanjay-Chitroda/staging-greybus-simplify-cleanup-using-__free/20260311-041028
base:   staging/staging-linus
patch link:    https://lore.kernel.org/r/20260310200513.2162018-4-sanjayembedded%40gmail.com
patch subject: [PATCH 3/7] iio: st_sensors: simplify cleanup using __free
config: riscv-randconfig-001-20260313 (https://download.01.org/0day-ci/archive/20260313/202603130856.TRVqFtUG-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 7d47b695929cc7f85eeb0f87d0189adc04c1c629)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260313/202603130856.TRVqFtUG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603130856.TRVqFtUG-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/iio/common/st_sensors/st_sensors_core.c:504:14: warning: attribute declaration must precede definition [-Wignored-attributes]
     504 |         u8 *outdata __free(kfree) = kmalloc(byte_for_channel, GFP_DMA | GFP_KERNEL);
         |                     ^
   include/linux/cleanup.h:213:23: note: expanded from macro '__free'
     213 | #define __free(_name)   __cleanup(__free_##_name)
         |                         ^
   include/linux/compiler-clang.h:15:25: note: expanded from macro '__cleanup'
      15 | #define __cleanup(func) __maybe_unused __attribute__((__cleanup__(func)))
         |                         ^
   include/linux/compiler_attributes.h:343:56: note: expanded from macro '__maybe_unused'
     343 | #define __maybe_unused                  __attribute__((__unused__))
         |                                                        ^
   drivers/iio/common/st_sensors/st_sensors_core.c:498:6: note: previous definition is here
     498 |         u8 *outdata;
         |             ^
>> drivers/iio/common/st_sensors/st_sensors_core.c:504:14: warning: attribute declaration must precede definition [-Wignored-attributes]
     504 |         u8 *outdata __free(kfree) = kmalloc(byte_for_channel, GFP_DMA | GFP_KERNEL);
         |                     ^
   include/linux/cleanup.h:213:23: note: expanded from macro '__free'
     213 | #define __free(_name)   __cleanup(__free_##_name)
         |                         ^
   include/linux/compiler-clang.h:15:55: note: expanded from macro '__cleanup'
      15 | #define __cleanup(func) __maybe_unused __attribute__((__cleanup__(func)))
         |                                                       ^
   drivers/iio/common/st_sensors/st_sensors_core.c:498:6: note: previous definition is here
     498 |         u8 *outdata;
         |             ^
>> drivers/iio/common/st_sensors/st_sensors_core.c:504:6: error: redefinition of 'outdata'
     504 |         u8 *outdata __free(kfree) = kmalloc(byte_for_channel, GFP_DMA | GFP_KERNEL);
         |             ^
   drivers/iio/common/st_sensors/st_sensors_core.c:498:6: note: previous definition is here
     498 |         u8 *outdata;
         |             ^
   2 warnings and 1 error generated.


vim +/outdata +504 drivers/iio/common/st_sensors/st_sensors_core.c

   493	
   494	static int st_sensors_read_axis_data(struct iio_dev *indio_dev,
   495					     struct iio_chan_spec const *ch, int *data)
   496	{
   497		int err;
 > 498		u8 *outdata;
   499		struct st_sensor_data *sdata = iio_priv(indio_dev);
   500		unsigned int byte_for_channel;
   501	
   502		byte_for_channel = DIV_ROUND_UP(ch->scan_type.realbits +
   503						ch->scan_type.shift, 8);
 > 504		u8 *outdata __free(kfree) = kmalloc(byte_for_channel, GFP_DMA | GFP_KERNEL);
   505		if (!outdata)
   506			return -ENOMEM;
   507	
   508		err = regmap_bulk_read(sdata->regmap, ch->address,
   509				       outdata, byte_for_channel);
   510		if (err < 0)
   511			return err;
   512	
   513		if (byte_for_channel == 1)
   514			*data = (s8)*outdata;
   515		else if (byte_for_channel == 2)
   516			*data = (s16)get_unaligned_le16(outdata);
   517		else if (byte_for_channel == 3)
   518			*data = (s32)sign_extend32(get_unaligned_le24(outdata), 23);
   519	
   520		return err;
   521	}
   522	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
