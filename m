Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E074433CB
	for <llvm@lists.linux.dev>; Wed,  6 Apr 2022 12:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649247495; x=1680783495;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=vpeaBNFJ8bi32s8uz2suHlQE9vUFaSrLNcDvSlSdlKg=;
  b=ex5l2NMORnb96Xg+tw3yQWR66nh1X2hOJk1cRoxUnEPY+gQkg7DtOkaT
   ab5tpo+K0AOZ56ALM6Bo+qQM+uivsp1hBYMwqZTU8OEmeWRgHcJ1NTEnI
   zibdq0MRnXwb3JNqznp7nv8fQFSjH4f2zh8n072TLXDx6HC4mVPULH8uM
   YJ4wpl/IwWB+IQp7Rxkjkkn4hvR31ruhPbSpXasKUSKeG1F+ZdvEeFCcE
   3C0CnFUdpYsqYCDXlIQ29awjPNJZm495oLsl+TqWYYMu6inIrokX6xHCY
   Bx1Z6u9hbphatOckD3ARdkjrTELBhjOVYN7BIFN+Ai0InKPCbewrOTQRt
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10308"; a="259864903"
X-IronPort-AV: E=Sophos;i="5.90,239,1643702400"; 
   d="scan'208";a="259864903"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2022 05:18:15 -0700
X-IronPort-AV: E=Sophos;i="5.90,239,1643702400"; 
   d="scan'208";a="570489282"
Received: from rongch2-mobl.ccr.corp.intel.com (HELO [10.249.173.64]) ([10.249.173.64])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2022 05:18:13 -0700
Subject: Re: [kbuild-all] Re: [PATCH 01/10] mm/slab: Decouple
 ARCH_KMALLOC_MINALIGN from ARCH_DMA_MINALIGN
To: Catalin Marinas <catalin.marinas@arm.com>,
 kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
References: <20220405135758.774016-2-catalin.marinas@arm.com>
 <202204060957.sHGvCxYf-lkp@intel.com> <Yk1VrlIi/eN7fc7d@arm.com>
From: "Chen, Rong A" <rong.a.chen@intel.com>
Message-ID: <78500ce0-ead3-5c58-414a-65b973b732b9@intel.com>
Date: Wed, 6 Apr 2022 20:18:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Yk1VrlIi/eN7fc7d@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Catalin,

On 4/6/2022 4:56 PM, Catalin Marinas wrote:
> On Wed, Apr 06, 2022 at 10:01:45AM +0800, kernel test robot wrote:
>> [auto build test WARNING on hnaz-mm/master]
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/Catalin-Marinas/mm-arm64-Reduce-ARCH_KMALLOC_MINALIGN-below-the-cache-line-size/20220405-220827
>> base:   https://github.com/hnaz/linux-mm master
>> config: riscv-buildonly-randconfig-r004-20220405 (https://download.01.org/0day-ci/archive/20220406/202204060957.sHGvCxYf-lkp@intel.com/config)
>> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c4a1b07d0979e7ff20d7d541af666d822d66b566)
>> reproduce (this is a W=1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # install riscv cross compiling tool for clang build
>>          # apt-get install binutils-riscv64-linux-gnu
>>          # https://github.com/intel-lab-lkp/linux/commit/4b3dfcfcd58dc57d321559e467e85ce909539755
>>          git remote add linux-review https://github.com/intel-lab-lkp/linux
>>          git fetch --no-tags linux-review Catalin-Marinas/mm-arm64-Reduce-ARCH_KMALLOC_MINALIGN-below-the-cache-line-size/20220405-220827
>>          git checkout 4b3dfcfcd58dc57d321559e467e85ce909539755
>>          # save the config file to linux build tree
>>          mkdir build_dir
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>>
>>>> WARNING: modpost: vmlinux.o(.text+0xf8244): Section mismatch in reference from the function perf_swevent_set_period() to the function .init.text:set_reset_devices()
>> The function perf_swevent_set_period() references
>> the function __init set_reset_devices().
>> This is often because perf_swevent_set_period lacks a __init
>> annotation or the annotation of set_reset_devices is wrong.
> 
> I don't see how this relates to the patch which just defines
> ARCH_DMA_MINALIGN. It may be something wrong in the tree you used as a
> base. My patches are based on 5.18-rc1.
> 

Sorry for the noise, we have received some feedback that the warning is
not related to the commit, we are going to add it to the ignore list.

Best Regards,
Rong Chen
