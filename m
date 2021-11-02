Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB822C8E
	for <llvm@lists.linux.dev>; Tue,  2 Nov 2021 03:57:03 +0000 (UTC)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HjwWT6rF6zZcg6;
	Tue,  2 Nov 2021 11:34:45 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Tue, 2 Nov 2021 11:36:49 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Tue, 2 Nov 2021 11:36:48 +0800
Subject: Re: [linux-next:master 11539/12851] ld.lld: error: undefined symbol:
 rv_bpf_fixup_exception
To: Daniel Borkmann <daniel@iogearbox.net>, kernel test robot <lkp@intel.com>
References: <202111020610.9oy9Rr0G-lkp@intel.com>
 <5e9622c3-9ee1-6693-5eea-805c5eee2047@iogearbox.net>
CC: <llvm@lists.linux.dev>, <kbuild-all@lists.01.org>, "Linux Memory
 Management List" <linux-mm@kvack.org>, <bjorn@kernel.org>, <ast@kernel.org>
From: tongtiangen <tongtiangen@huawei.com>
Message-ID: <ad29c5af-338e-c56d-f227-8a5c0a63bc24@huawei.com>
Date: Tue, 2 Nov 2021 11:36:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <5e9622c3-9ee1-6693-5eea-805c5eee2047@iogearbox.net>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600017.china.huawei.com (7.193.23.234)
X-CFilter-Loop: Reflected

Hi Daniel:
I'll confirm and fix this issue later.

On 2021/11/2 6:33, Daniel Borkmann wrote:
> Tong, please fix this up ASAP; already pinged you once about it last Thursday.
>
> Thanks!
>
> On 11/1/21 11:15 PM, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> head:   9febf119430617d18e1b6ee4b41ce7b07965e21f
>> commit: 252c765bd764a246a8bd516fabf6d6123df4a24f [11539/12851] riscv, bpf: Add BPF exception tables
>> config: riscv-randconfig-r036-20211101 (attached as .config)
>> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 82ed106567063ea269c6d5669278b733e173a42f)
>> reproduce (this is a W=1 build):
>>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # install riscv cross compiling tool for clang build
>>          # apt-get install binutils-riscv64-linux-gnu
>>          # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=252c765bd764a246a8bd516fabf6d6123df4a24f
>>          git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>>          git fetch --no-tags linux-next master
>>          git checkout 252c765bd764a246a8bd516fabf6d6123df4a24f
>>          # save the attached .config to linux build tree
>>          mkdir build_dir
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>>> ld.lld: error: undefined symbol: rv_bpf_fixup_exception
>>     >>> referenced by extable.c
>>     >>>               mm/extable.o:(fixup_exception) in archive arch/riscv/built-in.a
>>
>> ---
>> 0-DAY CI Kernel Test Service, Intel Corporation
>> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
>>
>
> .
>
