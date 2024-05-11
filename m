Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8D9320F;
	Sat, 11 May 2024 07:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715411094; cv=none; b=KoEhCW7Ij56HeXStmLGQW6pIJGXIIH3RLxwS71PMle/dCXC0+mF1t3Ip/XMcEHlxyjHnucGceAbLFlivevMDTkzEny+LPWnezo2LX3md3KHtqLYF3yEnjwGdcvXP87jR7ZSCKXEM2q+gjokWGH4VAHLaB0yYEvDdDPY6WXIsMzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715411094; c=relaxed/simple;
	bh=mXMbegY/cGBt62u1rA3wvU+GarytUbZvfmqokkOts/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bUGW/BnNkxSgNLPdtWz7gC50HWQ0Ku+g2WYMP1C6LH9HmUMeqtfrHB9bMJqXeL4ps2pKwE1SPGzDk5MbwTKkwALE1jbxZDaCMZwOL0tp6CXRBRALLIsJSJtb+4quAzsBBF/AWqbS4IRXWo8DicaegVdzyMe7UQI/IyQXyTRGhK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iRx6LFlw; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iRx6LFlw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715411093; x=1746947093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mXMbegY/cGBt62u1rA3wvU+GarytUbZvfmqokkOts/Y=;
  b=iRx6LFlwJOWztiuSQNSHSYXqd9wbeMg6v4yu3NX/3sKLZSwSapiCoPb7
   iCKdzGKZV9+cSyn0eCvuyK04wP25ySQLopkjWRLFe6mNNexHgP40xkI9i
   cTbfuTQ+feUNSpZEEvTbluqaTwiVt15JA8+U4XNbwNaOXxNiAYKDXmTzP
   sNQLAVhrjYWYhJdKoiC97QJDB8XZ0Xl+F2rIg3aHKVg3upM/9Q3Jeu3HT
   fDai+zxXPB3VYc7XeSNQnUkUdAcPyxjZtGiaOvJ1mSA1b3jUTF8krMOlb
   4bQw0kqOuDVfQ2iKHEztV1yIi4OT3qYPn5/plUvVhZxfVB/9qWNBEQUps
   A==;
X-CSE-ConnectionGUID: 2Ig4EZDxQ7G6vvKjXzoFug==
X-CSE-MsgGUID: v5zlyFqdT+a2w8xi66H1Yg==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="28925784"
X-IronPort-AV: E=Sophos;i="6.08,153,1712646000"; 
   d="scan'208";a="28925784"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2024 00:04:53 -0700
X-CSE-ConnectionGUID: nF6uqq9hSoG4SU6fzwr6hg==
X-CSE-MsgGUID: jGSKuPdaR+G0/k1wsU9eiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,153,1712646000"; 
   d="scan'208";a="29958480"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 May 2024 00:04:52 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5gmn-00073Z-0s;
	Sat, 11 May 2024 07:04:49 +0000
Date: Sat, 11 May 2024 15:04:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [geoffreybennett-scarlett-gen2:scarlett2 1/1]
 sound/usb/mixer_scarlett2.c:7962:27: warning: result of comparison of
 constant -1 with expression of type 'const u8' (aka 'const unsigned char')
 is always true
Message-ID: <202405111415.lB7tVmMM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/geoffreybennett/scarlett-gen2.git scarlett2
head:   480eafc2d57158b29e8e5efa5b1ac8b5e5a01af8
commit: 480eafc2d57158b29e8e5efa5b1ac8b5e5a01af8 [1/1] ALSA: scarlett2: Add S/PDIF source selection controls
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240511/202405111415.lB7tVmMM-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240511/202405111415.lB7tVmMM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405111415.lB7tVmMM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/usb/mixer_scarlett2.c:7962:27: warning: result of comparison of constant -1 with expression of type 'const u8' (aka 'const unsigned char') is always true [-Wtautological-constant-out-of-range-compare]
           for (i = 0; *mode_values != -1; i++, mode_values++)
                       ~~~~~~~~~~~~ ^  ~~
>> sound/usb/mixer_scarlett2.c:8016:43: warning: result of comparison of constant -1 with expression of type 'const u8' (aka 'const unsigned char') is always false [-Wtautological-constant-out-of-range-compare]
                   if (private->info->spdif_mode_values[i] == -1) {
                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^  ~~
   2 warnings generated.


vim +7962 sound/usb/mixer_scarlett2.c

  7944	
  7945	static int scarlett2_update_spdif_mode(struct usb_mixer_interface *mixer)
  7946	{
  7947		struct scarlett2_data *private = mixer->private_data;
  7948		int err, i;
  7949		u8 mode;
  7950		const u8 *mode_values = private->info->spdif_mode_values;
  7951	
  7952		if (!private->info->spdif_mode_control_name)
  7953			return 0;
  7954	
  7955		err = scarlett2_usb_get_config(mixer, SCARLETT2_CONFIG_SPDIF_MODE,
  7956					       1, &mode);
  7957		if (err < 0)
  7958			return err;
  7959	
  7960		private->spdif_mode = 0;
  7961	
> 7962		for (i = 0; *mode_values != -1; i++, mode_values++)
  7963			if (*mode_values == mode) {
  7964				private->spdif_mode = i;
  7965				break;
  7966			}
  7967	
  7968		return 0;
  7969	}
  7970	
  7971	static int scarlett2_spdif_mode_ctl_info(struct snd_kcontrol *kctl,
  7972						   struct snd_ctl_elem_info *uinfo)
  7973	{
  7974		struct usb_mixer_elem_info *elem = kctl->private_data;
  7975		struct scarlett2_data *private = elem->head.mixer->private_data;
  7976		const char * const *mode_texts = private->info->spdif_mode_texts;
  7977		int count = 0;
  7978	
  7979		while (*mode_texts++)
  7980			count++;
  7981	
  7982		return snd_ctl_enum_info(uinfo, 1, count,
  7983					 private->info->spdif_mode_texts);
  7984	}
  7985	
  7986	static int scarlett2_spdif_mode_ctl_get(struct snd_kcontrol *kctl,
  7987						  struct snd_ctl_elem_value *ucontrol)
  7988	{
  7989		struct usb_mixer_elem_info *elem = kctl->private_data;
  7990		struct scarlett2_data *private = elem->head.mixer->private_data;
  7991	
  7992		ucontrol->value.enumerated.item[0] = private->spdif_mode;
  7993		return 0;
  7994	}
  7995	
  7996	static int scarlett2_spdif_mode_ctl_put(struct snd_kcontrol *kctl,
  7997						  struct snd_ctl_elem_value *ucontrol)
  7998	{
  7999		struct usb_mixer_elem_info *elem = kctl->private_data;
  8000		struct usb_mixer_interface *mixer = elem->head.mixer;
  8001		struct scarlett2_data *private = mixer->private_data;
  8002		int oval, val, err = 0;
  8003		int i;
  8004	
  8005		mutex_lock(&private->data_mutex);
  8006	
  8007		oval = private->spdif_mode;
  8008		val = ucontrol->value.enumerated.item[0];
  8009	
  8010		if (val < 0) {
  8011			err = -EINVAL;
  8012			goto unlock;
  8013		}
  8014	
  8015		for (i = 0; i <= val; i++)
> 8016			if (private->info->spdif_mode_values[i] == -1) {
  8017				err = -EINVAL;
  8018				goto unlock;
  8019			}
  8020	
  8021		if (oval == val)
  8022			goto unlock;
  8023	
  8024		private->spdif_mode = val;
  8025	
  8026		err = scarlett2_usb_set_config(
  8027			mixer, SCARLETT2_CONFIG_SPDIF_MODE, 0,
  8028			private->info->spdif_mode_values[val]);
  8029		if (!err)
  8030			err = 1;
  8031	
  8032	unlock:
  8033		mutex_unlock(&private->data_mutex);
  8034		return err;
  8035	}
  8036	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
