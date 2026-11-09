Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794194191;
	b=Jlkxk3aJfQ4uKGBy+JCuwMbR9rmnE5j8ekf5R8f04ko5TYMfWBXuWbK37WNmsFHhCc4C
	 InF8Hq4QpA/bwcWzyBeH0xRqCuCGveeN+FTLCNlKbYxuCgMH/Y4OUGQCCXvHgmNvOiLy8
	 7DxjZFZIGc88cAVKc6dvHnzaX0Eb9ID3jeQpsn5iiZ7VvSYPdfzvYqQLtKACdlL+C6u6i
	 kjMgVjHy69KUTF/FX+Sbd0CGvnDesu+L7aLDG8c6yfbEC/pr3O9uZfPnqE8/72rw6PtRX
	 2DRRCI8pPR2PaWrm7KyGMGKfzu1KhpdYAiBATY0KpoyR6aGJMwcqp3rC/TjuGEZ71KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794194191;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=QG/YViCulpD98ruZqL38gu6q9b5BGoW3iloIHaWKka8=;
	b=Yacm9YsUHC04PfxVQfNkLgfLKLq8ug3Eph0oFTdtNbbzbN8NONX73w/6P1XkG6cr6DPx
	 NN1DLD+pKWjJrdY1ZpvK1DpX9K82ZTw8it2bq/1LrreYzvX0cZOyZv2fQuqRRaAC2RSif
	 tr1jZnuxdUS0Hh42wMtwbhuBBin1a+sN61DR6e/7XvcF3VWVLZU7JHjZkQ8qJ0G9QaY6e
	 JotPnk1nAHjDYrCBK+sKFeE8XKmxD4of4ByrsYMPIfPh8Iv1s/epmcybrtZoCTQ5A3VMO
	 RDk0Q5h4jIGhyZa9OPykfGXk1oVIBgSS6GMb2JMg76Wuk4lL1PPoGxXkNjKmxVUqIaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EoyjVPHX;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53191606A31C;
	Mon,  9 Nov 2026 03:16:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53191606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EoyjVPHX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794194190; x=1825730190;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LDsJ1RS4OFWocg9FvUohCPmS/HPExmi5n3dL7SUfHpw=;
  b=EoyjVPHXJIl5M66V5myAu3u9lFIppn/aumf/ADcnhVWeAMR+mu1oHOQZ
   wS178ybnoGNsQ8BzmxCZvtunjsNNMW7hTqJFkdv1D8I1YIs6hF+namyFO
   s7vfPM/D9Q0ePW+Pj2eCy6CQUGnZ3PCgKTZbtyTKS86r8cDeu2YZQXh4x
   DsQB6nq6f5GSyoFJAIdhudX62aTqAtLWtYd8vna1vU+UApWPy3UKi4e4J
   b8ZgMHX8OiQiO5ijVippsJ3N1454YUt6sqJJ1gNThsr3YDG6iKzDP9o8+
   UO4d/UDvG6nn1A6AVO95vDkREzSp7cAubSeGEFyGY+wd/QIptnE490f0r
   Q==;
X-CSE-ConnectionGUID: 839CmBF8T0q5L/BBtL6I/g==
X-CSE-MsgGUID: I0z0+rUqQFut8qXK9JgvEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2783756"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2783756"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 19:16:29 -0800
X-CSE-ConnectionGUID: TVSUkc7ARu2CxnpJwVMtYQ==
X-CSE-MsgGUID: 27e0+9G9TYOxzG3mRlyEjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7646984"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 08 Nov 2026 19:16:24 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQFrp-00000000tmt-0auN;
	Mon, 09 Nov 2026 03:16:21 +0000
Date: Mon, 9 Nov 2026 11:15:37 +0800
From: kernel test robot <lkp@intel.com>
To: Syed Saba Kareem <syed.sabakareem@amd.com>, broonie@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sunil-kumar.Dommati@amd.com, vijendar.mukunda@amd.com,
	Mario.Limonciello@amd.com, venkataprasad.potturu@amd.com,
	Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	Siva Subramanian Ravi Saravanan <sravisar@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/6] ASoC: soc-acpi: move common function topology
 helpers
Message-ID: <202611091156.3kHcYO5O-lkp@intel.com>
References: <20261108193119.2308421-4-syed.sabakareem@amd.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261108193119.2308421-4-syed.sabakareem@amd.com>

Hi Syed,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[cannot apply to linus/master v7.4-rc2 next-20261105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Syed-Saba-Kareem/ASoC-amd-acp-add-SoundWire-speaker-quirks-for-Dell-platforms/20261109-010030
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20261108193119.2308421-4-syed.sabakareem%40amd.com
patch subject: [PATCH v3 3/6] ASoC: soc-acpi: move common function topology helpers
config: s390-randconfig-1001-20261109 (https://download.01.org/0day-ci/archive/20261109/202611091156.3kHcYO5O-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611091156.3kHcYO5O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611091156.3kHcYO5O-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/soc-acpi.c:36:1: error: redefinition of 'snd_soc_acpi_find_machine'
      36 | snd_soc_acpi_find_machine(struct snd_soc_acpi_mach *machines)
         | ^
   include/sound/soc-acpi.h:40:1: note: previous definition is here
      40 | snd_soc_acpi_find_machine(struct snd_soc_acpi_mach *machines)
         | ^
>> sound/soc/soc-acpi.c:60:29: error: call to undeclared function 'acpi_fetch_acpi_dev'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      60 |         struct acpi_device *adev = acpi_fetch_acpi_dev(handle);
         |                                    ^
   sound/soc/soc-acpi.c:60:29: note: did you mean 'acpi_match_acpi_device'?
   include/linux/acpi.h:1003:44: note: 'acpi_match_acpi_device' declared here
    1003 | static inline const struct acpi_device_id *acpi_match_acpi_device(
         |                                            ^
>> sound/soc/soc-acpi.c:60:22: error: incompatible integer to pointer conversion initializing 'struct acpi_device *' with an expression of type 'int' [-Wint-conversion]
      60 |         struct acpi_device *adev = acpi_fetch_acpi_dev(handle);
         |                             ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/soc-acpi.c:66:18: error: incomplete definition of type 'struct acpi_device'
      66 |         if (adev && adev->status.present && adev->status.functional) {
         |                     ~~~~^
   include/linux/device/bus.h:222:8: note: forward declaration of 'struct acpi_device'
     222 | struct acpi_device;
         |        ^
   sound/soc/soc-acpi.c:66:42: error: incomplete definition of type 'struct acpi_device'
      66 |         if (adev && adev->status.present && adev->status.functional) {
         |                                             ~~~~^
   include/linux/device/bus.h:222:8: note: forward declaration of 'struct acpi_device'
     222 | struct acpi_device;
         |        ^
>> sound/soc/soc-acpi.c:82:12: error: call to undeclared function 'acpi_extract_package'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      82 |                 status = acpi_extract_package(myobj,
         |                          ^
   sound/soc/soc-acpi.c:97:6: error: redefinition of 'snd_soc_acpi_find_package_from_hid'
      97 | bool snd_soc_acpi_find_package_from_hid(const u8 hid[ACPI_ID_LEN],
         |      ^
   include/sound/soc-acpi.h:46:1: note: previous definition is here
      46 | snd_soc_acpi_find_package_from_hid(const u8 hid[ACPI_ID_LEN],
         | ^
   sound/soc/soc-acpi.c:111:27: error: redefinition of 'snd_soc_acpi_codec_list'
     111 | struct snd_soc_acpi_mach *snd_soc_acpi_codec_list(void *arg)
         |                           ^
   include/sound/soc-acpi.h:53:41: note: previous definition is here
      53 | static inline struct snd_soc_acpi_mach *snd_soc_acpi_codec_list(void *arg)
         |                                         ^
   8 errors generated.


vim +/acpi_fetch_acpi_dev +60 sound/soc/soc-acpi.c

8ceffd229f0ef1 sound/soc/intel/common/sst-match-acpi.c Vinod Koul           2016-02-08  56  
7feb2f786a46d3 sound/soc/soc-acpi.c                    Pierre-Louis Bossart 2017-10-12  57  static acpi_status snd_soc_acpi_find_package(acpi_handle handle, u32 level,
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  58  					     void *context, void **ret)
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  59  {
ff4865b3c8cd74 sound/soc/soc-acpi.c                    Rafael J. Wysocki    2022-01-26 @60  	struct acpi_device *adev = acpi_fetch_acpi_dev(handle);
59ce3233a538fc sound/soc/soc-acpi.c                    Pierre-Louis Bossart 2021-04-16  61  	acpi_status status;
7feb2f786a46d3 sound/soc/soc-acpi.c                    Pierre-Louis Bossart 2017-10-12  62  	struct snd_soc_acpi_package_context *pkg_ctx = context;
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  63  
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  64  	pkg_ctx->data_valid = false;
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  65  
ff4865b3c8cd74 sound/soc/soc-acpi.c                    Rafael J. Wysocki    2022-01-26 @66  	if (adev && adev->status.present && adev->status.functional) {
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  67  		struct acpi_buffer buffer = {ACPI_ALLOCATE_BUFFER, NULL};
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  68  		union acpi_object  *myobj = NULL;
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  69  
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  70  		status = acpi_evaluate_object_typed(handle, pkg_ctx->name,
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  71  						NULL, &buffer,
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  72  						ACPI_TYPE_PACKAGE);
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  73  		if (ACPI_FAILURE(status))
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  74  			return AE_OK;
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  75  
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  76  		myobj = buffer.pointer;
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  77  		if (!myobj || myobj->package.count != pkg_ctx->length) {
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  78  			kfree(buffer.pointer);
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  79  			return AE_OK;
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  80  		}
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  81  
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12 @82  		status = acpi_extract_package(myobj,
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  83  					pkg_ctx->format, pkg_ctx->state);
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  84  		if (ACPI_FAILURE(status)) {
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  85  			kfree(buffer.pointer);
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  86  			return AE_OK;
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  87  		}
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  88  
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  89  		kfree(buffer.pointer);
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  90  		pkg_ctx->data_valid = true;
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  91  		return AE_CTRL_TERMINATE;
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  92  	}
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  93  
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  94  	return AE_OK;
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  95  }
3421894765a345 sound/soc/intel/common/sst-match-acpi.c Pierre-Louis Bossart 2016-11-12  96  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
