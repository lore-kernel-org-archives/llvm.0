Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795664810;
	b=5jXOH9kBcRTKM5U4rgr95c8DhTOaPB0Pq22oagM+3NSa+DRA8j0paqyMXO1pMptPmyl9
	 rtmSV1hobfA+8c4KGHg9gxsw6xtWXkxHXMJAzuQJZ17PdsqfYJ+3UT5BND0pJwIKWaN18
	 TZLYaGZQPBkW4OQWVE/zMRNnq79TM1Xi7jRMV0JWCCl5KJbY+DgubJhosKlIZismwtWOj
	 k+svizq/9IhSdiFlKx+57gOSAqVUM5LKXI4nKwzZpAAb5CUBOGrKJtSCDqqJwNtUE4ulq
	 zbmw6A7UaX/QAaFimfMObcV8WX0Z0Vm8DWWa/1TvuGSM8Jtbx6QOV6T4W0E7yb+a/+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795664810;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=3kv3711g0URP9799xvbJVmL1Do+VH0bsWKn9bkh+kJk=;
	b=ouv/esmMYf4TTheuIJhH+cOIkCtSqria7SpmSGR+Qtf92XNKYuz3uG5IFsAF+gmmortm
	 FI4lh4W/0Z+Icdt2oqm/CWMrvtfstsqTO1eOrtWqOitRh934StOjnj0wL+udbncuskceW
	 8xZCpw1G05M2YZlGwt2bDOTh4GrXf3qHhY09b2GHfNBmaAAqgAcR2BbdxYPMjWRhDvjNd
	 TazZK2qAWEid2mrHWw9TQMc6m/QOnT1A2DXjFxdI/Rw8S2yo5oXyttOChOEyPpX7C+KWy
	 1y7IINq2Mn6bgNj3gx7IfWakZt/o5ATxXC9QNgGltYldha65elDdW7zK3IHGcWMLFxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h27WQ65b;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB51A606A31C;
	Thu, 26 Nov 2026 03:46:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB51A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h27WQ65b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795664810; x=1827200810;
  h=date:from:to:cc:subject:message-id;
  bh=A225Dmlty+vw+GKBXtQlx1E2juv/14s7EjisiTofwS8=;
  b=h27WQ65bS3KDmRLxszAgIEzUQZdI/GeiXGEam+/hgQUJpScWLWVSDncm
   rD0Tn/2YkiBGTvjAFitFT31akhso44j/0lgkkO7gBviKA4fFPZpTmq+ya
   NmGNrIngLCpNOiDc9GqYCv3vCFxWHZ60D8TmtsrryQFJb9vOrSmwwKLBm
   XKrD42Fm3fHTwFfktP2yOR3eFreIJ1Em95CipQ7bPQsQuwpCtiQYGMRuy
   ULEtAPc3csyVkNFiNmU9iWYHZhi068xh8NJPW+8iJnh3A3Xnsut7jLg3h
   bjd9RXxBjsJfI3+0PpZ/oI33Z73Za/OkWMsxLGQSVAF1uRYLY6+n5/uoC
   A==;
X-CSE-ConnectionGUID: c04FwJ6pR0uwjMwVuTtH2g==
X-CSE-MsgGUID: H/ZbT0XpR0CI7/ePzx/XHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4628008"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4628008"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 19:46:50 -0800
X-CSE-ConnectionGUID: GMG5/4ZXQVWjIVYIVI5Ftw==
X-CSE-MsgGUID: EhhdPbgXQ4SmnfpOhpRi/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="12061581"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Nov 2026 19:46:48 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWQRZ-00000001TEo-35a4;
	Thu, 26 Nov 2026 03:46:45 +0000
Date: Thu, 26 Nov 2026 11:46:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-11-25 214/347]
 sound/soc/codecs/rt5665.c:1255:13: warning: variable 'dev' is uninitialized
 when used here
Message-ID: <20261126114410.cgVTPQQl-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/morimoto/linux sound-cleanup-2026-11-25
head:   01a9469a2a71bf0b822559c37934d70f83aa7abf
commit: 266a6e1ae798513a8bf6e00b88cd707bf930d045 [214/347] dai
config: loongarch-randconfig-1001-20261126 (https://download.01.org/0day-ci/archive/20261126/20261126114410.cgVTPQQl-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 2012344e5da8e03ea4b8283ecd6fad6e13f09d64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126114410.cgVTPQQl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126114410.cgVTPQQl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/rt5665.c:1255:13: warning: variable 'dev' is uninitialized when used here [-Wuninitialized]
    1255 |                                 dev_err(dev, "Unexpected button code 0x%04x\n", btn_type);
         |                                         ^~~
   sound/soc/codecs/rt5665.c:1197:20: note: initialize the variable 'dev' to silence this warning
    1197 |         struct device *dev;
         |                           ^
         |                            = NULL
   1 warning generated.


vim +/dev +1255 sound/soc/codecs/rt5665.c

  1192	
  1193	static void rt5665_jack_detect_handler(struct work_struct *work)
  1194	{
  1195		struct rt5665_priv *rt5665 =
  1196			container_of(work, struct rt5665_priv, jack_detect_work.work);
  1197		struct device *dev;
  1198		struct snd_soc_card *card = snd_soc_component_to_card(rt5665->component);
  1199		int val, btn_type;
  1200	
  1201		if (!rt5665->component ||
  1202		    !snd_soc_card_is_instantiated(card) ||
  1203		    !rt5665->calibration_done) {
  1204			/* card not instantiated or calibration pending, try later */
  1205			mod_delayed_work(system_power_efficient_wq,
  1206					 &rt5665->jack_detect_work, msecs_to_jiffies(15));
  1207			return;
  1208		}
  1209	
  1210		guard(mutex)(&rt5665->calibrate_mutex);
  1211	
  1212		val = snd_soc_component_read(rt5665->component, RT5665_AJD1_CTRL) & 0x0010;
  1213		if (!val) {
  1214			/* jack in */
  1215			if (rt5665->jack_type == 0) {
  1216				/* jack was out, report jack type */
  1217				rt5665->jack_type =
  1218					rt5665_headset_detect(rt5665->component, 1);
  1219			} else {
  1220				/* jack is already in, report button event */
  1221				rt5665->jack_type = SND_JACK_HEADSET;
  1222				btn_type = rt5665_button_detect(rt5665->component);
  1223				/**
  1224				 * rt5665 can report three kinds of button behavior,
  1225				 * one click, double click and hold. However,
  1226				 * currently we will report button pressed/released
  1227				 * event. So all the three button behaviors are
  1228				 * treated as button pressed.
  1229				 */
  1230				switch (btn_type) {
  1231				case 0x8000:
  1232				case 0x4000:
  1233				case 0x2000:
  1234					rt5665->jack_type |= SND_JACK_BTN_0;
  1235					break;
  1236				case 0x1000:
  1237				case 0x0800:
  1238				case 0x0400:
  1239					rt5665->jack_type |= SND_JACK_BTN_1;
  1240					break;
  1241				case 0x0200:
  1242				case 0x0100:
  1243				case 0x0080:
  1244					rt5665->jack_type |= SND_JACK_BTN_2;
  1245					break;
  1246				case 0x0040:
  1247				case 0x0020:
  1248				case 0x0010:
  1249					rt5665->jack_type |= SND_JACK_BTN_3;
  1250					break;
  1251				case 0x0000: /* unpressed */
  1252					break;
  1253				default:
  1254					btn_type = 0;
> 1255					dev_err(dev, "Unexpected button code 0x%04x\n", btn_type);
  1256					break;
  1257				}
  1258			}
  1259		} else {
  1260			/* jack out */
  1261			rt5665->jack_type = rt5665_headset_detect(rt5665->component, 0);
  1262		}
  1263	
  1264		snd_soc_jack_report(rt5665->hs_jack, rt5665->jack_type,
  1265				SND_JACK_HEADSET |
  1266				    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
  1267				    SND_JACK_BTN_2 | SND_JACK_BTN_3);
  1268	
  1269		if (rt5665->jack_type & (SND_JACK_BTN_0 | SND_JACK_BTN_1 |
  1270			SND_JACK_BTN_2 | SND_JACK_BTN_3))
  1271			schedule_delayed_work(&rt5665->jd_check_work, 0);
  1272		else
  1273			cancel_delayed_work_sync(&rt5665->jd_check_work);
  1274	}
  1275	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
