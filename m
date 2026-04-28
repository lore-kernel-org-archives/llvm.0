Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24C937EFFD;
	Tue, 28 Apr 2026 22:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777415983; cv=none; b=AD48fzVDTAztJBpp5mALIRSXDpo9VbXbSpb0syr2yfSG4whUSZcr0nSdP9nwvijJ4C9HB6I564OHHCnuaiYZByLcz84NFxwFbGswRMmllEt9btu1AujAOb34/yEEC2aOEHmo9ICikKLpd/rqn5mdEIvovzvNiTQRd767EFAyGDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777415983; c=relaxed/simple;
	bh=YRJ6BL8Njhn3bqwg3Jq7FwxiZ0pRzrVIFp2ySYSiHfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tDuPtbqeW08I78zB8l7TREE9NSa/+buqWEM2WX6OHSpdNNbLVWdlBd68krciKxxPNq/r7EtsDncjvtYsrL7yaL4Ins679dGVd492Rw0hWbuHeMI2mgz038FcCQtFU6tn7VG6xqaN9Bn6DxQTGPEAwO8dfDBHbn6jC+LsL/Q/IZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e32IpeT+; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e32IpeT+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777415980; x=1808951980;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YRJ6BL8Njhn3bqwg3Jq7FwxiZ0pRzrVIFp2ySYSiHfU=;
  b=e32IpeT+7RXHtVyZq6EsIea3VAG5aAMdMzaZrSmbu8+vhX3H81IwMt2u
   XbjXzoW6VPmwqFuB8G39r5tXSWBe/fc/2iR3tVSu6ZdUykFtLmxg3p7z1
   ltqC6wJNTZJ1kT5taQbGYmelg/x6kJrrmZTNDtN5Sg4U2la7Li+GkQFjn
   61iqzOVb9wkh7MZoo+ZWcZptQGjKKaSI9DGBmbNBqQ4YlCDpmyUwVkrPT
   TY0a4PUG6w9MLVF0Us28Ndi6HWhHoD/BmmFpxRV7QtwyJ14i/NrIp+woS
   Y+t9NFg5w7V3/PLtSzk7EW0YBl6JwoFbj+mlB9c+15zoWs8CRd1tYvf6u
   A==;
X-CSE-ConnectionGUID: vV+xz4BpQF2xcIiXwbp83w==
X-CSE-MsgGUID: QjSqzh/GR8SS3PXZfV00pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="78322264"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="78322264"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 15:39:40 -0700
X-CSE-ConnectionGUID: oF5McbczRKyocqlm7beMcg==
X-CSE-MsgGUID: pvq82DjbQJOwN4NyhZEnYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; 
   d="scan'208";a="238059386"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 28 Apr 2026 15:39:38 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHr5a-00000000AK8-10VU;
	Tue, 28 Apr 2026 22:39:34 +0000
Date: Wed, 29 Apr 2026 06:38:40 +0800
From: kernel test robot <lkp@intel.com>
To: wangdich9700@163.com, perex@perex.cz, tiwai@suse.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, kees@kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: Re: [PATCH] ALSA: hda/conexant: Fix missing error check for jack
 detection
Message-ID: <202604290635.UqkW5dEd-lkp@intel.com>
References: <20260427070739.133369-1-wangdich9700@163.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427070739.133369-1-wangdich9700@163.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on tiwai-sound/for-linus linus/master v7.1-rc1 next-20260428]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/wangdich9700-163-com/ALSA-hda-conexant-Fix-missing-error-check-for-jack-detection/20260427-223457
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20260427070739.133369-1-wangdich9700%40163.com
patch subject: [PATCH] ALSA: hda/conexant: Fix missing error check for jack detection
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260429/202604290635.UqkW5dEd-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260429/202604290635.UqkW5dEd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604290635.UqkW5dEd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/hda/codecs/conexant.c:1193:7: error: incompatible pointer to integer conversion assigning to 'int' from 'struct hda_jack_callback *' [-Wint-conversion]
    1193 |                 err = snd_hda_jack_detect_enable_callback(codec, 0x19, cx_update_headset_mic_vref);
         |                     ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +1193 sound/hda/codecs/conexant.c

  1174	
  1175	static int cx_probe(struct hda_codec *codec, const struct hda_device_id *id)
  1176	{
  1177		struct conexant_spec *spec;
  1178		int err;
  1179	
  1180		codec_info(codec, "%s: BIOS auto-probing.\n", codec->core.chip_name);
  1181	
  1182		spec = kzalloc_obj(*spec);
  1183		if (!spec)
  1184			return -ENOMEM;
  1185		snd_hda_gen_spec_init(&spec->gen);
  1186		codec->spec = spec;
  1187	
  1188		/* init cx11880/sn6140 flag and reset headset_present_flag */
  1189		switch (codec->core.vendor_id) {
  1190		case 0x14f11f86:
  1191		case 0x14f11f87:
  1192			spec->is_cx11880_sn6140 = true;
> 1193			err = snd_hda_jack_detect_enable_callback(codec, 0x19, cx_update_headset_mic_vref);
  1194			if (err < 0)
  1195				goto error;
  1196			break;
  1197		}
  1198	
  1199		cx_auto_parse_eapd(codec);
  1200		spec->gen.own_eapd_ctl = 1;
  1201	
  1202		switch (codec->core.vendor_id) {
  1203		case 0x14f15045:
  1204			codec->single_adc_amp = 1;
  1205			spec->gen.mixer_nid = 0x17;
  1206			spec->gen.add_stereo_mix_input = HDA_HINT_STEREO_MIX_AUTO;
  1207			snd_hda_pick_fixup(codec, cxt5045_fixup_models,
  1208					   cxt5045_fixups, cxt_fixups);
  1209			break;
  1210		case 0x14f15047:
  1211			codec->pin_amp_workaround = 1;
  1212			spec->gen.mixer_nid = 0x19;
  1213			spec->gen.add_stereo_mix_input = HDA_HINT_STEREO_MIX_AUTO;
  1214			snd_hda_pick_fixup(codec, cxt5047_fixup_models,
  1215					   cxt5047_fixups, cxt_fixups);
  1216			break;
  1217		case 0x14f15051:
  1218			add_cx5051_fake_mutes(codec);
  1219			codec->pin_amp_workaround = 1;
  1220			snd_hda_pick_fixup(codec, cxt5051_fixup_models,
  1221					   cxt5051_fixups, cxt_fixups);
  1222			break;
  1223		case 0x14f15098:
  1224			codec->pin_amp_workaround = 1;
  1225			spec->gen.mixer_nid = 0x22;
  1226			spec->gen.add_stereo_mix_input = HDA_HINT_STEREO_MIX_AUTO;
  1227			snd_hda_pick_fixup(codec, cxt5066_fixup_models,
  1228					   cxt5066_fixups, cxt_fixups);
  1229			break;
  1230		case 0x14f150f2:
  1231			codec->power_save_node = 1;
  1232			fallthrough;
  1233		default:
  1234			codec->pin_amp_workaround = 1;
  1235			snd_hda_pick_fixup(codec, cxt5066_fixup_models,
  1236					   cxt5066_fixups, cxt_fixups);
  1237			break;
  1238		}
  1239	
  1240		if (!spec->gen.vmaster_mute.hook && spec->dynamic_eapd)
  1241			spec->gen.vmaster_mute.hook = cx_auto_vmaster_hook;
  1242	
  1243		snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
  1244	
  1245		err = snd_hda_parse_pin_defcfg(codec, &spec->gen.autocfg, NULL,
  1246					       spec->parse_flags);
  1247		if (err < 0)
  1248			goto error;
  1249	
  1250		err = cx_auto_parse_beep(codec);
  1251		if (err < 0)
  1252			goto error;
  1253	
  1254		err = snd_hda_gen_parse_auto_config(codec, &spec->gen.autocfg);
  1255		if (err < 0)
  1256			goto error;
  1257	
  1258		/* Some laptops with Conexant chips show stalls in S3 resume,
  1259		 * which falls into the single-cmd mode.
  1260		 * Better to make reset, then.
  1261		 */
  1262		if (!codec->bus->core.sync_write) {
  1263			codec_info(codec,
  1264				   "Enable sync_write for stable communication\n");
  1265			codec->bus->core.sync_write = 1;
  1266			codec->bus->allow_bus_reset = 1;
  1267		}
  1268	
  1269		snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PROBE);
  1270	
  1271		return 0;
  1272	
  1273	 error:
  1274		cx_remove(codec);
  1275		return err;
  1276	}
  1277	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
