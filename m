Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B1E2C9D
	for <llvm@lists.linux.dev>; Sun, 17 Apr 2022 21:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=rPTmCZvcSQL+3vYCd36QLzQTiYFQAiItxsUtQqNbrEc=; b=KcZ3HYLTJjS2uVK13+NOtjb1q2
	eMKZ5VEyktIvfZtYTgtZ+RnCIt+0mgLvHpx+ff1g0GXgtMTBBYqjk87qiN86Hl4mQhhlIRQhaB7ib
	5eKR22v288mt9EIRYRmZFojqsWjcsmFDMJS+AxdvTXZdzwbSahS7jhCdXMZr04/ld5Mg19TXvlrQ8
	JTgRYjVb0KizzOTLUPddaDBFGV4AHVl5Bwj1bMzwu+F0m6911+77jEgsaORKVZyW1sJ0Ys8lQOVxP
	oXz+F7tgHZE1UCtqi5l0apg+BVMhFTbpHenlngFsrln1IDfUAMBREnLPx7aG0uIN96+HD8wnoJA0K
	ITzirYEA==;
Received: from [2601:1c0:6280:3f0::aa0b]
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngCZ0-001bKq-2c; Sun, 17 Apr 2022 21:36:10 +0000
Message-ID: <b5223400-c27e-166a-54a7-f01516dbf68b@infradead.org>
Date: Sun, 17 Apr 2022 14:36:06 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: drivers/cpuidle/cpuidle-riscv-sbi.c:350:5: warning: format
 specifies type 'long' but the argument has type 'int'
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, Anup Patel <anup.patel@wdc.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
References: <202204161152.YXsVu0jD-lkp@intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <202204161152.YXsVu0jD-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/15/22 20:09, kernel test robot wrote:
> Hi Anup,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   59250f8a7f3a60a2661b84cbafc1e0eb5d05ec9b
> commit: 6abf32f1d9c5009dcccded2c1e7ca899a4ab587b cpuidle: Add RISC-V SBI CPU idle driver
> date:   5 weeks ago
> config: riscv-randconfig-r026-20220416 (https://download.01.org/0day-ci/archive/20220416/202204161152.YXsVu0jD-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 8e43cbab33765c476337571e5ed11b005199dd0d)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install riscv cross compiling tool for clang build
>         # apt-get install binutils-riscv64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6abf32f1d9c5009dcccded2c1e7ca899a4ab587b
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 6abf32f1d9c5009dcccded2c1e7ca899a4ab587b
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/cpuidle/
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>

Fixed here:

https://lore.kernel.org/linux-riscv/20220403031355.20894-1-rdunlap@infradead.org/

-- 
~Randy
