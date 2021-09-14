Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDD03FC3
	for <llvm@lists.linux.dev>; Tue, 14 Sep 2021 12:41:09 +0000 (UTC)
Received: from fraeml739-chm.china.huawei.com (unknown [172.18.147.201])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4H82w24by1z67svF;
	Tue, 14 Sep 2021 20:38:58 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml739-chm.china.huawei.com (10.206.15.220) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 14 Sep 2021 14:41:06 +0200
Received: from localhost (10.52.125.225) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Tue, 14 Sep
 2021 13:41:06 +0100
Date: Tue, 14 Sep 2021 13:41:03 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: kernel test robot <lkp@intel.com>
CC: William Breathitt Gray <vilhelm.gray@gmail.com>, <llvm@lists.linux.dev>,
	<kbuild-all@lists.01.org>, <linux-kernel@vger.kernel.org>, David Lechner
	<david@lechnology.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Subject: Re: [iio:testing 40/43] ld.lld: error: undefined symbol: __udivdi3
Message-ID: <20210914134103.00006d23@Huawei.com>
In-Reply-To: <202109120656.fiJqCh8H-lkp@intel.com>
References: <202109120656.fiJqCh8H-lkp@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.52.125.225]
X-ClientProxiedBy: lhreml726-chm.china.huawei.com (10.201.108.77) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected

On Sun, 12 Sep 2021 06:43:58 +0800
kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
> head:   77a4a019161bcba51af1dbbeadc04795840fb3e0
> commit: f7da4339ca510e4476ea35cb9fd44f3f190706c5 [40/43] counter: Internalize sysfs interface code
> config: i386-randconfig-r022-20210911 (attached as .config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 261cbe98c38f8c1ee1a482fe76511110e790f58a)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/commit/?id=f7da4339ca510e4476ea35cb9fd44f3f190706c5
>         git remote add iio https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git
>         git fetch --no-tags iio testing
>         git checkout f7da4339ca510e4476ea35cb9fd44f3f190706c5
>         # save the attached .config to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross O=build_dir ARCH=i386 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> ld.lld: error: undefined symbol: __udivdi3  
>    >>> referenced by intel-qep.c:290 (drivers/counter/intel-qep.c:290)
>    >>>               counter/intel-qep.o:(intel_qep_spike_filter_ns_write) in archive drivers/built-in.a  
This is a result of a change to passing in a u64 instead of a string.   I've applied a fix
that uses do_div() and pushed out as testing again.

William, please sanity check that fix looks right to you.

Thanks,

Jonathan
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 

