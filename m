Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EBC29CA
	for <llvm@lists.linux.dev>; Tue, 25 Jan 2022 08:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643098125; x=1674634125;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=3rARKrczq0kbe7goiRwTPDqPVCq68DDhD8taH5Gx47U=;
  b=iyFSH8Cc4tu+3E77bkJK7hrniyGfukRKPQNqXcBD71fnlmTyoAf+MKOu
   LDFyg+q6wu2kuGpGSeHYt74iDLUI5dvNimbFsXXyOcsRnCF4w1DsvJcBw
   VQkKLGoMc7op04ACYyalVsOqBLtSYq5NaRKB5aDC+Y4EGcyRFoLMtO3bM
   /5LefMtLN2huIor2bZV3udYjiDP50G8w/18hi7MqhVuQUVSa8Og/kwzf9
   LS7EWDAEDUih7wCEImNd66p8quEkwjdWo954A24eVnOmUlneOFNtsuwiC
   HXVPrGScbRe5T8PYG2qwgi+uiqpMBuWJQNZdWj2H1W+N2irUAeh1Tz7Ax
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="246466999"
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; 
   d="scan'208";a="246466999"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2022 00:08:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; 
   d="scan'208";a="520295331"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.255.29.83]) ([10.255.29.83])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2022 00:08:42 -0800
Subject: Re: [kbuild-all] Re: fs/ntfs3/fsntfs.c:2248:41: warning: taking
 address of packed member 'de' of class or structure 'NTFS_DE_SII' may result
 in an unaligned pointer value
To: Nathan Chancellor <nathan@kernel.org>, kernel test robot <lkp@intel.com>
Cc: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 llvm@lists.linux.dev, kbuild-all@lists.01.org, linux-kernel@vger.kernel.org
References: <202201242326.uQ3OazUi-lkp@intel.com>
 <Ye7kyA3yJupMLSD2@archlinux-ax161>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <90b97ffb-1feb-a83f-44e7-61e77b77ad6e@intel.com>
Date: Tue, 25 Jan 2022 16:08:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Ye7kyA3yJupMLSD2@archlinux-ax161>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 1/25/2022 1:41 AM, Nathan Chancellor wrote:
> On Mon, Jan 24, 2022 at 11:21:59PM +0800, kernel test robot wrote:
>> Hi Konstantin,
>>
>> FYI, the error/warning still remains.
>>
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> head:   dd81e1c7d5fb126e5fbc5c9e334d7b3ec29a16a0
>> commit: 6e5be40d32fb1907285277c02e74493ed43d77fe fs/ntfs3: Add NTFS3 in fs/Kconfig and fs/Makefile
>> date:   5 months ago
>> config: mips-buildonly-randconfig-r001-20220122 (https://download.01.org/0day-ci/archive/20220124/202201242326.uQ3OazUi-lkp@intel.com/config)
>> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7b3d30728816403d1fd73cc5082e9fb761262bce)
>> reproduce (this is a W=1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # install mips cross compiling tool for clang build
>>          # apt-get install binutils-mips-linux-gnu
>>          # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6e5be40d32fb1907285277c02e74493ed43d77fe
>>          git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>>          git fetch --no-tags linus master
>>          git checkout 6e5be40d32fb1907285277c02e74493ed43d77fe
>>          # save the config file to linux build tree
>>          mkdir build_dir
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash fs/ntfs3/
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All warnings (new ones prefixed by >>):
>>
>>     fs/ntfs3/fsntfs.c:1874:9: warning: variable 'cnt' set but not used [-Wunused-but-set-variable]
>>             size_t cnt, off;
>>                    ^
>>>> fs/ntfs3/fsntfs.c:2248:41: warning: taking address of packed member 'de' of class or structure 'NTFS_DE_SII' may result in an unaligned pointer value [-Waddress-of-packed-member]
>>             err = indx_insert_entry(indx_sii, ni, &sii_e.de, NULL, NULL);
>>                                                    ^~~~~~~~
>>     2 warnings generated.
> 
> This warning has the same root cause as
> https://lore.kernel.org/r/YenXz+RznXBuJMSR@dev-arch.archlinux-ax161/.
> 
> Intel folks, would it be possible to limit instances of
> -Waddress-of-packed-member with mips randconfigs to our mailing list for
> the reason I note in the link above?
> 
> Cheers,
> Nathan

Hi Nathan,

Thanks for the advice, will do it.

Best Regards,
Rong Chen
