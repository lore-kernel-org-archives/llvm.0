Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C1117F8
	for <llvm@lists.linux.dev>; Mon, 30 May 2022 08:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653900744; x=1685436744;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=F1zZaD9pmXbd3mYt25x7qc88DmH1k0luONBgEixrLZE=;
  b=iB8WIIRIzQOxFFD0B8HgtBRL9eVd94InoYsh3XYlY4jHsfwY2npmgwNj
   riyAfldu5xCoaC4AwIaH3GSML3PM0OPhOErs45wgUnrey9N7zv34EhAhY
   Il7S4/btjBoVXnDAka0vFVn11WVhMptN6FkHLiULL49V6HvaSOBZ0TfIj
   c1sZf0a4UbIW/IAiBxYMIW4xqegr1GV/SJdnl7CG+y5OlDzs3eUz97UoA
   3rcSAKXmUc8PHHgL3QF48whwrIFnetx9hXyk3AdVqdyCRimdaSPV+yA4N
   aBuib5D/SoAPUI/F3O07o915OGDIYOk26reOm+RGKN2DBs/0R62DMQONr
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10362"; a="335589332"
X-IronPort-AV: E=Sophos;i="5.91,262,1647327600"; 
   d="scan'208";a="335589332"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2022 01:52:24 -0700
X-IronPort-AV: E=Sophos;i="5.91,262,1647327600"; 
   d="scan'208";a="605086342"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.255.31.170]) ([10.255.31.170])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2022 01:52:22 -0700
Subject: Re: [kbuild-all] Re: llvm-objcopy: error: invalid output format:
 'elf64-s390'
To: Nathan Chancellor <nathan@kernel.org>, kernel test robot <lkp@intel.com>
Cc: Heiko Carstens <hca@linux.ibm.com>, llvm@lists.linux.dev,
 kbuild-all@lists.01.org, linux-kernel@vger.kernel.org
References: <202205290045.gOvUOkt3-lkp@intel.com>
 <YpJMIz/QjDW5IQGr@dev-arch.thelio-3990X>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <fd819888-844f-1a76-fee2-02e89faee090@intel.com>
Date: Mon, 30 May 2022 16:52:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YpJMIz/QjDW5IQGr@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/29/2022 12:21 AM, Nathan Chancellor wrote:
> On Sun, May 29, 2022 at 12:04:48AM +0800, kernel test robot wrote:
>> Hi Heiko,
>>
>> FYI, the error/warning still remains.
>>
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> head:   9d004b2f4fea97cde123e7f1939b80e77bf2e695
>> commit: adda746629b4a3950f313bc645fa0e54daee871c s390/purgatory: workaround llvm's IAS limitations
>> date:   11 days ago
>> config: s390-randconfig-c005-20220527 (https://download.01.org/0day-ci/archive/20220529/202205290045.gOvUOkt3-lkp@intel.com/config)
>> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0fbe3f3f486e01448121f7931a4ca29fac1504ab)
>> reproduce (this is a W=1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # install s390 cross compiling tool for clang build
>>          # apt-get install binutils-s390x-linux-gnu
>>          # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=adda746629b4a3950f313bc645fa0e54daee871c
>>          git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>>          git fetch --no-tags linus master
>>          git checkout adda746629b4a3950f313bc645fa0e54daee871c
>>          # save the config file
>>          mkdir build_dir && cp config build_dir/.config
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash
>>
>> If you fix the issue, kindly add following tag where applicable
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>>> llvm-objcopy: error: invalid output format: 'elf64-s390'
> 
> This is expected, as llvm-objcopy needs support for s390:
> https://github.com/ClangBuiltLinux/linux/issues/1530
> 
> Please use GNU objcopy for the time being by explicitly providing
> OBJCOPY=${CROSS_COMPILE}objcopy to make.

Hi Nathan,

Thanks for your reminding, will update it.

Best Regards,
Rong Chen

> 
> Cheers,
> Nathan
> _______________________________________________
> kbuild-all mailing list -- kbuild-all@lists.01.org
> To unsubscribe send an email to kbuild-all-leave@lists.01.org
> 
