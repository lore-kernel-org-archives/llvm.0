Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A692C9E
	for <llvm@lists.linux.dev>; Fri,  3 Dec 2021 14:00:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10186"; a="237201518"
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; 
   d="scan'208";a="237201518"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2021 06:00:40 -0800
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; 
   d="scan'208";a="561726932"
Received: from hkagda-mobl2.amr.corp.intel.com (HELO [10.212.71.79]) ([10.212.71.79])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2021 06:00:40 -0800
Subject: Re: [linux-next:master 3956/5128]
 sound/soc/sof/intel/hda-codec.c:132:35: error: use of undeclared identifier
 'CODEC_PROBE_RETRIES'
To: kernel test robot <lkp@intel.com>, Hui Wang <hui.wang@canonical.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bard.liao@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>
References: <202112031943.Twg19fWT-lkp@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a93302d2-d76f-95a2-2a7c-bcf34db7bfd6@linux.intel.com>
Date: Fri, 3 Dec 2021 08:00:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202112031943.Twg19fWT-lkp@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

[adding alsa-devel]

On 12/3/21 5:25 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   7afeac307a9561e3a93682c1e7eb22f918aa1187
> commit: 046aede2f847676f93a2ea4f48b77909c51dba40 [3956/5128] ASoC: SOF: Intel: Retry codec probing if it fails
> config: i386-randconfig-r033-20211202 (https://download.01.org/0day-ci/archive/20211203/202112031943.Twg19fWT-lkp@intel.com/config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4b553297ef3ee4dc2119d5429adf3072e90fac38)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=046aede2f847676f93a2ea4f48b77909c51dba40
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 046aede2f847676f93a2ea4f48b77909c51dba40
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>>> sound/soc/sof/intel/hda-codec.c:132:35: error: use of undeclared identifier 'CODEC_PROBE_RETRIES'
>            } while (resp == -1 && retry++ < CODEC_PROBE_RETRIES);
>                                             ^
>    1 error generated.
> 
> 
> vim +/CODEC_PROBE_RETRIES +132 sound/soc/sof/intel/hda-codec.c
> 
>    110	
>    111	/* probe individual codec */
>    112	static int hda_codec_probe(struct snd_sof_dev *sdev, int address,
>    113				   bool hda_codec_use_common_hdmi)
>    114	{
>    115	#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
>    116		struct hdac_hda_priv *hda_priv;
>    117		struct hda_codec *codec;
>    118		int type = HDA_DEV_LEGACY;
>    119	#endif
>    120		struct hda_bus *hbus = sof_to_hbus(sdev);
>    121		struct hdac_device *hdev;
>    122		u32 hda_cmd = (address << 28) | (AC_NODE_ROOT << 20) |
>    123			(AC_VERB_PARAMETERS << 8) | AC_PAR_VENDOR_ID;
>    124		u32 resp = -1;
>    125		int ret, retry = 0;
>    126	
>    127		do {
>    128			mutex_lock(&hbus->core.cmd_mutex);
>    129			snd_hdac_bus_send_cmd(&hbus->core, hda_cmd);
>    130			snd_hdac_bus_get_response(&hbus->core, address, &resp);
>    131			mutex_unlock(&hbus->core.cmd_mutex);
>  > 132		} while (resp == -1 && retry++ < CODEC_PROBE_RETRIES);

Indeed, something's not right here.

CODEC_PROBE_RETRIES is defined conditionally

#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
#define IDISP_VID_INTEL	0x80860000
#define CODEC_PROBE_RETRIES 3

but it's used unconditionally.

We could define this constant unconditionally as a quick fix, but this
compilation problem might expose a larger problem.

Kai, I wonder if this is code from lines 120 to 139 that we didn't
update when we moved to support HDMI with the generic HDaudio parts? I
don't see why we could even try to send a command on the bus is there's
no audio codec support?

hda_codec_use_common_hdmi should be the default assumption now, I don't
think we support the old solution, do we?

>    133	
>    134		if (resp == -1)
>    135			return -EIO;
>    136		dev_dbg(sdev->dev, "HDA codec #%d probed OK: response: %x\n",
>    137			address, resp);
>    138	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 
