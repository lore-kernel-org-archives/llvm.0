Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840BE64C;
	Mon, 11 Mar 2024 01:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710120450; cv=none; b=V6YgAzJHeZOct5r3et/J53XkUcIhPINxVje6ZaDYxIEHs7VOnS6xbbonpU0tyvAwvVqF4YD8CUvNvohIPiptYGybrpyyka5FJ0ASepraXhEvG4HZElX81LqEoaPMEFELo9FBGvhXiEZrW+aLrPR0zwnZrYrKzvCKwFxdffwvQYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710120450; c=relaxed/simple;
	bh=DPlvQk9zd2cnDLglIDXa9D5mPS2edGQIqm28pKQmbng=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sdg97dMV1apAYYSvgtiKK8gh7rLzTilq/UspSt8bXYcAdy4I4pbauOsj+qT1Glc1u3Y0b6fVbmea1ZppJTSTzH8vQmSPMVRtnxeVSbgpsZU5MJS/QSzkM1hnHqf38Um/i0d2LHTb/NoUS+SserfXvA4eLX88vHtUHI88Xd/2CfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FOc1ZtoB; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FOc1ZtoB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710120449; x=1741656449;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DPlvQk9zd2cnDLglIDXa9D5mPS2edGQIqm28pKQmbng=;
  b=FOc1ZtoBjdiQwl1Ltk8Y5cbFyp6FwQCBuVcXzpApXSdzW/afm6Z3/B+0
   Va/SWUP46k8WRbhLfPftXlhb30HatH6AsaQIyD9Od5QAF5LOpSXp+dp9/
   ZQqKD9pOOMcd1yoz3DC1PcLoKWFJHw5gX0QdDhVXZn+4lVlM3RrDbS/y2
   bNA6rIHCSkzwYsR1WNGyHNPyNFe8eGec+tPY5cxr6RtUxm1yhiqma9oa7
   a1jKNPpV/DqQjvlYaNjDRiGqb7TessfWp4h7d3jIXCcJBjAR+RbJQU94/
   0M6dMHIEkRH82wSUSPgTngU/RpIF4E6huGvRw+VPEZfoblY6wFew8rhVC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="16205174"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="16205174"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 18:27:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; 
   d="scan'208";a="11020414"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Mar 2024 18:27:26 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjURo-0008ml-17;
	Mon, 11 Mar 2024 01:27:24 +0000
Date: Mon, 11 Mar 2024 09:27:23 +0800
From: kernel test robot <lkp@intel.com>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [geoffreybennett-scarlett-gen2:vocaster 12/14]
 sound/usb/mixer_scarlett2.c:5064:6: warning: variable 'err' is used
 uninitialized whenever 'if' condition is true
Message-ID: <202403110957.naszvdIe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/geoffreybennett/scarlett-gen2.git vocaster
head:   ce1668580ca3badaca4f8350f738ae5e91ee50c1
commit: dd8657c33cf1b8145bab99aba647a8791f8f81f2 [12/14] ALSA: scarlett2: Add DSP controls
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240311/202403110957.naszvdIe-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240311/202403110957.naszvdIe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403110957.naszvdIe-lkp@intel.com/

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

>> sound/usb/mixer_scarlett2.c:5064:6: warning: variable 'err' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
if (oval == val)
^~~~~~~~~~~
sound/usb/mixer_scarlett2.c:5078:9: note: uninitialized use occurs here
return err;
^~~
sound/usb/mixer_scarlett2.c:5064:2: note: remove the 'if' if its condition is always false
if (oval == val)
^~~~~~~~~~~~~~~~
sound/usb/mixer_scarlett2.c:5052:20: note: initialize the variable 'err' to silence this warning
int oval, val, err;
^
= 0
sound/usb/mixer_scarlett2.c:5099:6: warning: variable 'err' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
if (oval == val)
^~~~~~~~~~~
sound/usb/mixer_scarlett2.c:5113:9: note: uninitialized use occurs here
return err;
^~~
sound/usb/mixer_scarlett2.c:5099:2: note: remove the 'if' if its condition is always false
if (oval == val)
^~~~~~~~~~~~~~~~
sound/usb/mixer_scarlett2.c:5087:20: note: initialize the variable 'err' to silence this warning
int oval, val, err;
^
= 0
2 warnings generated.
--
WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/arm/crypto/aes-arm-bs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/arm/crypto/crc32-arm-ce.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/af_alg.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/algif_hash.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/algif_skcipher.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/ecc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/crypto_simd.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/crypto/libarc4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/crypto/libdes.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/crypto/libsha256.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-samsung.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dma/ti/cppi41.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/bridge/sii9234.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-ac97.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/misc/fastrpc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/spi/spi-qup.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/phy/phy-am335x-control.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/phy/phy-am335x.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/host/ohci-exynos.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/storage/uas.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_acm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_ss_lb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/u_serial.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_serial.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_obex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/u_ether.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_ncm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_ecm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_eem.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_ecm_subset.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_rndis.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_mass_storage.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_fs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_uac1.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_uac1_legacy.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_uac2.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_uvc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_midi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_hid.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_printer.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/libcomposite.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/tuners/tda9887.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/common/uvc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/platform/marvell/mmp_camera.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/platform/marvell/mcam-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/platform/samsung/exynos4-is/exynos-fimc-lite.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/platform/samsung/exynos4-is/exynos-fimc-is.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/platform/samsung/exynos4-is/exynos4-is-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/dvb-frontends/au8522_decoder.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/dvb-frontends/mb86a16.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/v4l2-core/v4l2-async.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/v4l2-core/v4l2-fwnode.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rpmsg/rpmsg_char.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-hub.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-aspeed.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-scom.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/core/snd-pcm-dmaengine.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/fsl/imx-pcm-fiq.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/fsl/imx-pcm-dma.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/qcom/snd-soc-qcom-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/ac97_bus.o
>> ERROR: modpost: "__aeabi_ldivmod" [sound/usb/snd-usb-audio.ko] undefined!


vim +5064 sound/usb/mixer_scarlett2.c

  5045	
  5046	static int scarlett2_precomp_flt_switch_ctl_put(
  5047		struct snd_kcontrol *kctl, struct snd_ctl_elem_value *ucontrol)
  5048	{
  5049		struct usb_mixer_elem_info *elem = kctl->private_data;
  5050		struct usb_mixer_interface *mixer = elem->head.mixer;
  5051		struct scarlett2_data *private = mixer->private_data;
  5052		int oval, val, err;
  5053	
  5054		mutex_lock(&private->data_mutex);
  5055	
  5056		if (private->hwdep_in_use) {
  5057			err = -EBUSY;
  5058			goto unlock;
  5059		}
  5060	
  5061		oval = private->precomp_flt_switch[elem->control];
  5062		val = ucontrol->value.integer.value[0];
  5063	
> 5064		if (oval == val)
  5065			goto unlock;
  5066	
  5067		private->precomp_flt_switch[elem->control] = val;
  5068	
  5069		/* Send change to the device */
  5070		err = scarlett2_usb_set_config(
  5071			mixer, SCARLETT2_CONFIG_PRECOMP_FLT_SWITCH,
  5072			elem->control, val);
  5073		if (err == 0)
  5074			err = 1;
  5075	
  5076	unlock:
  5077		mutex_unlock(&private->data_mutex);
  5078		return err;
  5079	}
  5080	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
