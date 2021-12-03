Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7452C9E
	for <llvm@lists.linux.dev>; Fri,  3 Dec 2021 14:15:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10186"; a="223852223"
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; 
   d="scan'208";a="223852223"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2021 06:15:24 -0800
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; 
   d="scan'208";a="610414696"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2021 06:15:22 -0800
Date: Fri, 3 Dec 2021 16:07:43 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
cc: kernel test robot <lkp@intel.com>, Hui Wang <hui.wang@canonical.com>, 
    "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>, 
    kbuild-all@lists.01.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
    llvm@lists.linux.dev, Linux Memory Management List <linux-mm@kvack.org>, 
    Mark Brown <broonie@kernel.org>, Bard Liao <bard.liao@intel.com>
Subject: Re: [linux-next:master 3956/5128] sound/soc/sof/intel/hda-codec.c:132:35:
 error: use of undeclared identifier 'CODEC_PROBE_RETRIES'
In-Reply-To: <a93302d2-d76f-95a2-2a7c-bcf34db7bfd6@linux.intel.com>
Message-ID: <alpine.DEB.2.22.394.2112031605380.3554566@eliteleevi.tm.intel.com>
References: <202112031943.Twg19fWT-lkp@intel.com> <a93302d2-d76f-95a2-2a7c-bcf34db7bfd6@linux.intel.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hey,


On Fri, 3 Dec 2021, Pierre-Louis Bossart wrote:

> >    127		do {
> >    128			mutex_lock(&hbus->core.cmd_mutex);
> >    129			snd_hdac_bus_send_cmd(&hbus->core, hda_cmd);
> >    130			snd_hdac_bus_get_response(&hbus->core, address, &resp);
> >    131			mutex_unlock(&hbus->core.cmd_mutex);
> >  > 132		} while (resp == -1 && retry++ < CODEC_PROBE_RETRIES);
> 
> Indeed, something's not right here.
> 
> CODEC_PROBE_RETRIES is defined conditionally
> 
> #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
> #define IDISP_VID_INTEL	0x80860000
> #define CODEC_PROBE_RETRIES 3
> 
> but it's used unconditionally.

yup, the definition needs to be moved out.

> We could define this constant unconditionally as a quick fix, but this
> compilation problem might expose a larger problem.
> 
> Kai, I wonder if this is code from lines 120 to 139 that we didn't
> update when we moved to support HDMI with the generic HDaudio parts? I
> don't see why we could even try to send a command on the bus is there's
> no audio codec support?
> 
> hda_codec_use_common_hdmi should be the default assumption now, I don't
> think we support the old solution, do we?

We do still support the hdac-hdmi as well, albeit only for select old
hardware to maintain backwards compatibility.

I'll send the quick fix.

Br, Kai
