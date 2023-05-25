Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A5B17C7;
	Thu, 25 May 2023 02:26:43 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.35])
	by gateway (Coremail) with SMTP id _____8DxqvJhx25kcrcAAA--.1748S3;
	Thu, 25 May 2023 10:26:41 +0800 (CST)
Received: from [10.20.42.35] (unknown [10.20.42.35])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dx_8tex25keBB2AA--.64483S3;
	Thu, 25 May 2023 10:26:39 +0800 (CST)
Subject: Re: [PATCH v11 2/2] spi: loongson: add bus driver for the loongson
 spi controller
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, zhuyinbo@loongson.cn
References: <20230522071030.5193-3-zhuyinbo@loongson.cn>
 <202305241914.oPbPV8Lz-lkp@intel.com>
From: zhuyinbo <zhuyinbo@loongson.cn>
Message-ID: <a358a5c6-f9a6-d8c0-2d2b-9a4bfe910ae6@loongson.cn>
Date: Thu, 25 May 2023 10:26:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202305241914.oPbPV8Lz-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Dx_8tex25keBB2AA--.64483S3
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxGFW3WF1fKFy3tF4kZFyUtrb_yoW5tw1rpa
	15uwsxGrs5Xr18C395Ga9rZa1Yq395JwnrXayayr45uFZFva4qqr1xKF45ArsFkF1vgFyU
	XFy8WrZ5K3WDWw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bxkFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUGVWUXwA2ocxC64
	kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28E
	F7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487
	Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l42xK82IY6x
	8ErcxFaVAv8VWrMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
	x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrw
	CI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI
	42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
	80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU1t8n5UUUUU==



在 2023/5/24 下午8:07, kernel test robot 写道:
> Hi Yinbo,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on broonie-spi/for-next]
> [also build test WARNING on robh/for-next krzk-dt/for-next]
> [cannot apply to linus/master v6.4-rc3 next-20230524]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Yinbo-Zhu/dt-bindings-spi-add-loongson-spi/20230522-151320
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
> patch link:    https://lore.kernel.org/r/20230522071030.5193-3-zhuyinbo%40loongson.cn
> patch subject: [PATCH v11 2/2] spi: loongson: add bus driver for the loongson spi controller
> config: arm-randconfig-r005-20230524
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
> reproduce (this is a W=1 build):
>          mkdir -p ~/bin
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # install arm cross compiling tool for clang build
>          # apt-get install binutils-arm-linux-gnueabi
>          # https://github.com/intel-lab-lkp/linux/commit/5be581a056498d3c9b4265dd4f3a3925b7f6b339
>          git remote add linux-review https://github.com/intel-lab-lkp/linux
>          git fetch --no-tags linux-review Yinbo-Zhu/dt-bindings-spi-add-loongson-spi/20230522-151320
>          git checkout 5be581a056498d3c9b4265dd4f3a3925b7f6b339
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/spi/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202305241914.oPbPV8Lz-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> drivers/spi/spi-loongson-core.c:80:6: warning: variable 'hz' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
>             if (t)
>                 ^
>     drivers/spi/spi-loongson-core.c:83:6: note: uninitialized use occurs here
>             if (hz && loongson_spi->hz != hz)
>                 ^~
>     drivers/spi/spi-loongson-core.c:80:2: note: remove the 'if' if its condition is always true
>             if (t)
>             ^~~~~~
>     drivers/spi/spi-loongson-core.c:78:17: note: initialize the variable 'hz' to silence this warning
>             unsigned int hz;
>                            ^
>                             = 0
>     1 warning generated.


This warning was due to hz uninitialized and I will fix it.

Thanks.
Yinbo
> 
> 
> vim +80 drivers/spi/spi-loongson-core.c
> 
>      74	
>      75	static int loongson_spi_update_state(struct loongson_spi *loongson_spi,
>      76					struct spi_device *spi, struct spi_transfer *t)
>      77	{
>      78		unsigned int hz;
>      79	
>    > 80		if (t)
>      81			hz = t->speed_hz;
>      82	
>      83		if (hz && loongson_spi->hz != hz)
>      84			loongson_spi_set_clk(loongson_spi, hz);
>      85	
>      86		if ((spi->mode ^ loongson_spi->mode) & SPI_MODE_X_MASK)
>      87			loongson_spi_set_mode(loongson_spi, spi);
>      88	
>      89		return 0;
>      90	}
>      91	
> 

