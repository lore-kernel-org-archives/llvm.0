Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436907A
	for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 22:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RTy/XhFfjbfRDd109gg9EIJraOMtOqiIkjkCpzcfEgc=; b=Glu8o13q4TMSd1rjIzANrpVTWb
	2jNx5xL8yQJyDN6T2HY8wPdECWpORg3qMBsd86l1hsaLXqXWZhUFPIEY3M/GwWoCrldvb0KqhpWUf
	SOsMLqgPvQnNFXjupktJn/j6Ue6fhrTH4wsuqQoMcMKAPjhzXv1DDI/NMa4yqidrshpopERqstDji
	Ij044gEhrFKFlbRW4oYijylwVEXNKziGvqXGl4AUlUBBMu36+kGGM8mk5uA/IvdKGGMM+fGpB9/Ip
	JjumCNJeFtJBRq22dEiEmireHlDO3RDZaLorQ/iYs6O035TCpTMx2pfCGIR5AEhF1WAWa5YgmmyE4
	zuVNrxXg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfUAT-00BXGO-2K; Fri, 15 Apr 2022 22:11:53 +0000
Date: Fri, 15 Apr 2022 15:11:53 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: zhanglianjie <zhanglianjie@uniontech.com>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [mcgrof:sysctl-testing 12/18] mm/page-writeback.c:93:28:
 warning: unused variable 'dirty_bytes_min'
Message-ID: <YlntqSsx17+PReMW@bombadil.infradead.org>
References: <202204081510.D41wQr6m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202204081510.D41wQr6m-lkp@intel.com>
Sender: Luis Chamberlain <mcgrof@infradead.org>

On Fri, Apr 08, 2022 at 03:38:53PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git sysctl-testing
> head:   7cde53da38a3ea00d75ef6a6ab06fa85b80bcf87
> commit: 87125d15aa3c4046e902758a39062f213b3664ad [12/18] mm: move page-writeback sysctls to their own file
> config: s390-randconfig-r034-20220406 (https://download.01.org/0day-ci/archive/20220408/202204081510.D41wQr6m-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6b306233f78876a1d197ed6e1f05785505de7c63)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install s390 cross compiling tool for clang build
>         # apt-get install binutils-s390x-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/commit/?id=87125d15aa3c4046e902758a39062f213b3664ad
>         git remote add mcgrof https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git
>         git fetch --no-tags mcgrof sysctl-testing
>         git checkout 87125d15aa3c4046e902758a39062f213b3664ad
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):

I'll post a fix.

 Luis
