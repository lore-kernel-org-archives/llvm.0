Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0351C2C89
	for <llvm@lists.linux.dev>; Mon,  1 Nov 2021 22:34:08 +0000 (UTC)
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www62.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92.3)
	(envelope-from <daniel@iogearbox.net>)
	id 1mhfsG-000GQI-75; Mon, 01 Nov 2021 23:33:52 +0100
Received: from [85.1.206.226] (helo=linux.home)
	by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <daniel@iogearbox.net>)
	id 1mhfsG-000Qbz-0w; Mon, 01 Nov 2021 23:33:52 +0100
Subject: Re: [linux-next:master 11539/12851] ld.lld: error: undefined symbol:
 rv_bpf_fixup_exception
To: kernel test robot <lkp@intel.com>, Tong Tiangen <tongtiangen@huawei.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 Linux Memory Management List <linux-mm@kvack.org>, bjorn@kernel.org,
 ast@kernel.org
References: <202111020610.9oy9Rr0G-lkp@intel.com>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <5e9622c3-9ee1-6693-5eea-805c5eee2047@iogearbox.net>
Date: Mon, 1 Nov 2021 23:33:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202111020610.9oy9Rr0G-lkp@intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.3/26340/Mon Nov  1 09:21:46 2021)

Tong, please fix this up ASAP; already pinged you once about it last Thursday.

Thanks!

On 11/1/21 11:15 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   9febf119430617d18e1b6ee4b41ce7b07965e21f
> commit: 252c765bd764a246a8bd516fabf6d6123df4a24f [11539/12851] riscv, bpf: Add BPF exception tables
> config: riscv-randconfig-r036-20211101 (attached as .config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 82ed106567063ea269c6d5669278b733e173a42f)
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # install riscv cross compiling tool for clang build
>          # apt-get install binutils-riscv64-linux-gnu
>          # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=252c765bd764a246a8bd516fabf6d6123df4a24f
>          git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>          git fetch --no-tags linux-next master
>          git checkout 252c765bd764a246a8bd516fabf6d6123df4a24f
>          # save the attached .config to linux build tree
>          mkdir build_dir
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>>> ld.lld: error: undefined symbol: rv_bpf_fixup_exception
>     >>> referenced by extable.c
>     >>>               mm/extable.o:(fixup_exception) in archive arch/riscv/built-in.a
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 

