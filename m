Received: from www62.your-server.de (www62.your-server.de [213.133.104.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F29872
	for <llvm@lists.linux.dev>; Thu, 28 Oct 2021 20:16:50 +0000 (UTC)
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www62.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92.3)
	(envelope-from <daniel@iogearbox.net>)
	id 1mgBXc-0001Ta-Ik; Thu, 28 Oct 2021 21:58:24 +0200
Received: from [85.1.206.226] (helo=linux.home)
	by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <daniel@iogearbox.net>)
	id 1mgBXc-000TSU-AP; Thu, 28 Oct 2021 21:58:24 +0200
Subject: Re: [linux-next:master 11855/12471]
 arch/riscv/net/bpf_jit_comp64.c:462:5: warning: no previous prototype for
 function 'rv_bpf_fixup_exception'
To: kernel test robot <lkp@intel.com>, Tong Tiangen <tongtiangen@huawei.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 Linux Memory Management List <linux-mm@kvack.org>, bjorn@kernel.org
References: <202110290334.2zdMyRq4-lkp@intel.com>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <0d291bf9-af19-9658-8b58-0ec814dba6d6@iogearbox.net>
Date: Thu, 28 Oct 2021 21:58:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202110290334.2zdMyRq4-lkp@intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.3/26336/Thu Oct 28 10:21:55 2021)

[ +Bjorn ]

On 10/28/21 9:45 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   503f375baa99edff894eb1a534d2ac0b4f799573
> commit: 252c765bd764a246a8bd516fabf6d6123df4a24f [11855/12471] riscv, bpf: Add BPF exception tables
> config: riscv-randconfig-r042-20211028 (attached as .config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5db7568a6a1fcb408eb8988abdaff2a225a8eb72)
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
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=riscv
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>>> arch/riscv/net/bpf_jit_comp64.c:462:5: warning: no previous prototype for function 'rv_bpf_fixup_exception' [-Wmissing-prototypes]
>     int rv_bpf_fixup_exception(const struct exception_table_entry *ex,
>         ^
>     arch/riscv/net/bpf_jit_comp64.c:462:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>     int rv_bpf_fixup_exception(const struct exception_table_entry *ex,
>     ^
>     static
>     1 warning generated.

Tong, Bjorn, ptal

> vim +/rv_bpf_fixup_exception +462 arch/riscv/net/bpf_jit_comp64.c
> 
>     461	
>   > 462	int rv_bpf_fixup_exception(const struct exception_table_entry *ex,
>     463					struct pt_regs *regs)
>     464	{
>     465		off_t offset = FIELD_GET(BPF_FIXUP_OFFSET_MASK, ex->fixup);
>     466		int regs_offset = FIELD_GET(BPF_FIXUP_REG_MASK, ex->fixup);
>     467	
>     468		*(unsigned long *)((void *)regs + pt_regmap[regs_offset]) = 0;
>     469		regs->epc = (unsigned long)&ex->fixup - offset;
>     470	
>     471		return 1;
>     472	}
>     473	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 

