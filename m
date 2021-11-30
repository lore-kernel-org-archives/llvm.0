Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C332CA1
	for <llvm@lists.linux.dev>; Tue, 30 Nov 2021 19:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Mh8kV0SgnUkenXNL5NNc7GLp/Uzayo61Nvh9+rxqjag=; b=oTisflORZ1hb7bweOxlHYkIIhH
	J65OJLijaqm4wLvvBdISV6HRCeRVQE5o10CYYBfkHEvqhLSJksXT7eNuHA/k7+auQi/U8lpO0kdcn
	FfBPLqwYRcnj84dXK1QkpcAGY7fKoZb+65yZk6Zgi7lTIW4SVnTWykUya8HqtFk6Xa9erfmNcGbcz
	s7PzOAQXmtuOjMieQmxRu/InNN8mxZJ3zkr7GgLlcgek29M6fHpZVa6lJjlU9B/1vVkBWR/CkUfBZ
	arVcDwkbMemxWDt5Gea3Jhp4X0SOk3+yj2/4JtbOQJkqvMNFfNq6iDjad1120nkTyMnH6iO1DlxUL
	P1pdCq8A==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms8Qq-006YOb-9B; Tue, 30 Nov 2021 19:04:48 +0000
Date: Tue, 30 Nov 2021 11:04:48 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Xiaoming Ni <nixiaoming@huawei.com>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [linux-next:master 4264/4301] ERROR: modpost:
 "unregister_firmware_config_sysctl"
 [drivers/base/firmware_loader/firmware_class.ko] undefined!
Message-ID: <YaZ10NkEud6S7Mti@bombadil.infradead.org>
References: <202112010223.eu8GDIdL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202112010223.eu8GDIdL-lkp@intel.com>
Sender: Luis Chamberlain <mcgrof@infradead.org>

On Wed, Dec 01, 2021 at 02:48:53AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   34f255a1e91ab44ff8926cf8294ff9144e62e861
> commit: cf859436d0e2a12d7c3704ae09dfbf9aba14db38 [4264/4301] firmware_loader: move firmware sysctl to its own files
> config: x86_64-randconfig-r022-20211130 (https://download.01.org/0day-ci/archive/20211201/202112010223.eu8GDIdL-lkp@intel.com/config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 25eb7fa01d7ebbe67648ea03841cda55b4239ab2)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=cf859436d0e2a12d7c3704ae09dfbf9aba14db38
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout cf859436d0e2a12d7c3704ae09dfbf9aba14db38
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> >> ERROR: modpost: "unregister_firmware_config_sysctl" [drivers/base/firmware_loader/firmware_class.ko] undefined!
> >> ERROR: modpost: "register_firmware_config_sysctl" [drivers/base/firmware_loader/firmware_class.ko] undefined!

This is fixed by this patch:

https://lkml.kernel.org/r/20211130164525.1478009-1-mcgrof@kernel.org

  Luis
