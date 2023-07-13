Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6010E18017;
	Thu, 13 Jul 2023 16:26:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6456DC433C7;
	Thu, 13 Jul 2023 16:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1689265579;
	bh=CXJ4LHCRgZVINIqOiLY7Tb7XJ2dummoBkrQWHA5wWBg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DZH2CZ12yHKdhkI1jcIV+ig3Svp4NPXmXo6tmkocIzn0DAEsNiyRJw00H3B+M5/0M
	 zOgQd91aUuaAtpgYnlPDHK8jCfa3wIchxd6oz+L3GItADPf4IwZo65qhh6foVhKuIr
	 jpaVX56zJWUCmOSrcJD5BoM49Lk47SiTgd5QQstI=
Date: Thu, 13 Jul 2023 09:26:18 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Baoquan He <bhe@redhat.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, Niklas Schnelle <schnelle@linux.ibm.com>, Christoph
 Hellwig <hch@lst.de>, "Mike Rapoport (IBM)" <rppt@kernel.org>
Subject: Re: [akpm-mm:mm-unstable 93/173] drivers/clk/clk-fixed-mmio.c:33:2:
 error: call to undeclared function 'iounmap'; ISO C99 and later do not
 support implicit function declarations
Message-Id: <20230713092618.9a25417dc886b4f61660fe17@linux-foundation.org>
In-Reply-To: <202307131033.JgvCSVz4-lkp@intel.com>
References: <202307131033.JgvCSVz4-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 13 Jul 2023 10:57:34 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   e726c62e70a70ae5536caa0aa131c5dce5c6f764
> commit: 827057ff3ce7554741d431145c3b93f1a54125fc [93/173] s390: mm: convert to GENERIC_IOREMAP
> config: s390-randconfig-r033-20230713 (https://download.01.org/0day-ci/archive/20230713/202307131033.JgvCSVz4-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> reproduce: (https://download.01.org/0day-ci/archive/20230713/202307131033.JgvCSVz4-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307131033.JgvCSVz4-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from drivers/clk/clk-fixed-mmio.c:13:
>    In file included from include/linux/io.h:13:
>    In file included from arch/s390/include/asm/io.h:78:
>    include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      547 |         val = __raw_readb(PCI_IOBASE + addr);
>          |                           ~~~~~~~~~~ ^

Thanks.  When I tried that config I got

In file included from ./include/linux/io.h:13,
                 from drivers/clk/clk-fixed-mmio.c:13:
drivers/clk/clk-fixed-mmio.c: In function 'fixed_mmio_clk_setup':
./arch/s390/include/asm/io.h:29:17: error: implicit declaration of function 'iounmap'; did you mean 'vunmap'? [-Werror=implicit-function-declaration]
   29 | #define iounmap iounmap
      |                 ^~~~~~~
drivers/clk/clk-fixed-mmio.c:33:9: note: in expansion of macro 'iounmap'
   33 |         iounmap(base);
      |         ^~~~~~~

I'll drop the series.
