Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17A772
	for <llvm@lists.linux.dev>; Thu,  2 Sep 2021 09:39:38 +0000 (UTC)
Received: from [192.168.1.101] (83.6.166.149.neoplus.adsl.tpnet.pl [83.6.166.149])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id A3E193F35C;
	Thu,  2 Sep 2021 11:01:31 +0200 (CEST)
Subject: Re: [linux-next:master 10841/11508]
 drivers/clk/qcom/gcc-sm6350.c:179:37: warning: unused variable
 'gcc_parent_data_2'
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Stephen Boyd <sboyd@kernel.org>
References: <202109021640.TXyMlULd-lkp@intel.com>
From: Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <85c61a79-3e83-84c8-1b75-3e4640ac3490@somainline.org>
Date: Thu, 2 Sep 2021 11:01:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202109021640.TXyMlULd-lkp@intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 02.09.2021 10:57, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   34560ced20599a01660a693f464c7c7dc83db1d9
> commit: 131abae905df99f63d825e47b4df100d34f518ce [10841/11508] clk: qcom: Add SM6350 GCC driver
> config: riscv-buildonly-randconfig-r006-20210902 (attached as .config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c9948e9254fbb6ea00f66c7b4542311d21e060be)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install riscv cross compiling tool for clang build
>         # apt-get install binutils-riscv64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=131abae905df99f63d825e47b4df100d34f518ce
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 131abae905df99f63d825e47b4df100d34f518ce
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv 
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>>> drivers/clk/qcom/gcc-sm6350.c:179:37: warning: unused variable 'gcc_parent_data_2' [-Wunused-const-variable]
>    static const struct clk_parent_data gcc_parent_data_2[] = {
>                                        ^
>    1 warning generated.
>
>
> vim +/gcc_parent_data_2 +179 drivers/clk/qcom/gcc-sm6350.c
>
>    178	
>  > 179	static const struct clk_parent_data gcc_parent_data_2[] = {
>    180		{ .fw_name = "bi_tcxo" },
>    181		{ .hw = &gpll0_out_odd.clkr.hw },
>    182	};
>    183	static const struct clk_parent_data gcc_parent_data_2_ao[] = {
>    184		{ .fw_name = "bi_tcxo_ao" },
>    185		{ .hw = &gpll0_out_odd.clkr.hw },
>    186	};
>    187	
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

Looks like this slipped through.. gcc_parent_data_2[] is in fact not used. Could you remove that array in your tree, Stephen?


Konrad

