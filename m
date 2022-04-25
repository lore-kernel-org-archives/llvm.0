Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F307E
	for <llvm@lists.linux.dev>; Mon, 25 Apr 2022 17:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650907526; x=1682443526;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jGcTuSTntuAHYCdhP0sz0aVcA3gK8ccr+Nxg4lSLwFk=;
  b=UxW8QRB3aCrixjuV0spoliXtSvS6kAp/EhqNBEkra1XvR6opuhRKQQ9+
   3sv+1z9+hOU4zLIq5Dwun1CgJVEgf20eVmHREZV2sYA+a11KAc3zan1zv
   kipVDiXAekwVWBut0Ko7Si5MKCS2mPcLV8kTECrYicNEATKEfwEIUBYR2
   KAGmzB1wannrng6w0kv+JpqqmRQCFAL2fKNvCm3O8bn3jTRbm2/yHisgN
   bKPrCL5VKjHDMi2uVYHw9mT3CrsGnxwb0EKK/kRVF6aCEUZY0eSQhmeG8
   7uk8/duMnupHOI85cMDton8EpHvWtJ0wNAuVgUOMEmpg9j1ASIXFZjMQB
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="328254066"
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; 
   d="scan'208";a="328254066"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2022 10:25:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,289,1643702400"; 
   d="scan'208";a="579392827"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 25 Apr 2022 10:25:23 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nj2Sh-0002jU-0O;
	Mon, 25 Apr 2022 17:25:23 +0000
Date: Tue, 26 Apr 2022 01:24:46 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Kaehn <kaehndan@gmail.com>, tiwai@suse.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] Add generic serial MIDI driver using serial bus API
Message-ID: <202204260120.TIXTqkq1-lkp@intel.com>
References: <20220420194747.490542-3-kaehndan@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220420194747.490542-3-kaehndan@gmail.com>

Hi Daniel,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on v5.18-rc4 next-20220422]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Kaehn/Add-generic-serial-MIDI-driver-using-serial-bus-API/20220421-035024
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20220426/202204260120.TIXTqkq1-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcfdc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/65e00db0913a4019c3158e31aa6b2fd2c28ba03f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Daniel-Kaehn/Add-generic-serial-MIDI-driver-using-serial-bus-API/20220421-035024
        git checkout 65e00db0913a4019c3158e31aa6b2fd2c28ba03f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kernel/ drivers/acpi/arm64/ sound/drivers/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/drivers/serial-generic.c:192:6: warning: no previous prototype for function 'snd_serial_generic_write_wakeup' [-Wmissing-prototypes]
   void snd_serial_generic_write_wakeup(struct serdev_device *serdev)
        ^
   sound/drivers/serial-generic.c:192:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void snd_serial_generic_write_wakeup(struct serdev_device *serdev)
   ^
   static 
   1 warning generated.


vim +/snd_serial_generic_write_wakeup +192 sound/drivers/serial-generic.c

   191	
 > 192	void snd_serial_generic_write_wakeup(struct serdev_device *serdev)
   193	{
   194		struct snd_serial_generic *drvdata = serdev_device_get_drvdata(serdev);
   195	
   196		if (!snd_rawmidi_transmit_empty(drvdata->midi_output))
   197			snd_serial_generic_output_write(drvdata->midi_output);
   198	}
   199	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
