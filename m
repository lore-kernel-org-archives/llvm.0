Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24CBB7E
	for <llvm@lists.linux.dev>; Thu, 24 Mar 2022 11:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648122673; x=1679658673;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MkKgLOGm8fzuqIUVMGedup+WyqyCao28NBMcOzgaAJM=;
  b=hAXONwtJZ3ilLpep+7tE7VFmv766cV0mUZavUEJeuTRYvdWkZ7AlAUzl
   /hmF8v67Q55plxuLMZmcNur5H5KE7wyuzsl8m63jxrbB1l+NOX6S5XfDU
   AJndEo8wS2B/SaYmtIpXuFmrAR3Ifzh2mg+q1yJU14UNgzOreO/VgakWS
   4hLdy3JjWu9y5j0agir5FvIF9A3Ch9hpnBPGLVIh4z/wKNjtCqsFoTVks
   LK/KCiav290ALezTSKDkIhxE3XCA2LSe75agwxQEBq6gq3fa627Er/v4c
   kvsttrCOUpMMQRGgxjiD9gdWBCceR8nAtg5nLYGYUG86UUM9YIHGEOgxH
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="258066779"
X-IronPort-AV: E=Sophos;i="5.90,207,1643702400"; 
   d="scan'208";a="258066779"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2022 04:51:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,207,1643702400"; 
   d="scan'208";a="649824816"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 24 Mar 2022 04:51:09 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nXLzg-000L2i-JY; Thu, 24 Mar 2022 11:51:08 +0000
Date: Thu, 24 Mar 2022 19:50:24 +0800
From: kernel test robot <lkp@intel.com>
To: David Henningsson <coding@diwic.se>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: sound/core/rawmidi.c:991:6: warning: variable 'dest_frames' set but
 not used
Message-ID: <202203241949.AXselCHw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ed4643521e6af8ab8ed1e467630a85884d2696cf
commit: 08fdced60ca08e34e316a3ab945636fcdfcbc973 ALSA: rawmidi: Add framing mode
date:   10 months ago
config: mips-mtx1_defconfig (https://download.01.org/0day-ci/archive/20220324/202203241949.AXselCHw-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=08fdced60ca08e34e316a3ab945636fcdfcbc973
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 08fdced60ca08e34e316a3ab945636fcdfcbc973
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash sound/core/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/core/rawmidi.c:991:6: warning: variable 'dest_frames' set but not used [-Wunused-but-set-variable]
           int dest_frames = 0;
               ^
   1 warning generated.


vim +/dest_frames +991 sound/core/rawmidi.c

   984	
   985	static int receive_with_tstamp_framing(struct snd_rawmidi_substream *substream,
   986				const unsigned char *buffer, int src_count, const struct timespec64 *tstamp)
   987	{
   988		struct snd_rawmidi_runtime *runtime = substream->runtime;
   989		struct snd_rawmidi_framing_tstamp *dest_ptr;
   990		struct snd_rawmidi_framing_tstamp frame = { .tv_sec = tstamp->tv_sec, .tv_nsec = tstamp->tv_nsec };
 > 991		int dest_frames = 0;
   992		int orig_count = src_count;
   993		int frame_size = sizeof(struct snd_rawmidi_framing_tstamp);
   994	
   995		BUILD_BUG_ON(frame_size != 0x20);
   996		if (snd_BUG_ON((runtime->hw_ptr & 0x1f) != 0))
   997			return -EINVAL;
   998	
   999		while (src_count > 0) {
  1000			if ((int)(runtime->buffer_size - runtime->avail) < frame_size) {
  1001				runtime->xruns += src_count;
  1002				break;
  1003			}
  1004			if (src_count >= SNDRV_RAWMIDI_FRAMING_DATA_LENGTH)
  1005				frame.length = SNDRV_RAWMIDI_FRAMING_DATA_LENGTH;
  1006			else {
  1007				frame.length = src_count;
  1008				memset(frame.data, 0, SNDRV_RAWMIDI_FRAMING_DATA_LENGTH);
  1009			}
  1010			memcpy(frame.data, buffer, frame.length);
  1011			buffer += frame.length;
  1012			src_count -= frame.length;
  1013			dest_ptr = (struct snd_rawmidi_framing_tstamp *) (runtime->buffer + runtime->hw_ptr);
  1014			*dest_ptr = frame;
  1015			runtime->avail += frame_size;
  1016			runtime->hw_ptr += frame_size;
  1017			runtime->hw_ptr %= runtime->buffer_size;
  1018			dest_frames++;
  1019		}
  1020		return orig_count - src_count;
  1021	}
  1022	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
