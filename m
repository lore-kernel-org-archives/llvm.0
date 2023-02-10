Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56AC63AB;
	Fri, 10 Feb 2023 16:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PIJ0eiwfFC1GcgQRe2pQ3GvN25J7vzagLnLLu75el5k=; b=aRbizo8R1YCqdlZkx3H4Md57rz
	7rGHnY3xgNI5bMqgSqllNpyBYPxo45kX2INBwQtPauIuM4gpNX0yhXgVatbhMibek/kO3dSjFrXlm
	nPa08dieeFYxe91EVhmwK9HMW+I1SVkHYJ6PW9m3MlYeqYN/TRceZujurEYhAPsVaNjbnj7gCXltw
	gnabn4Qxwi/hdtX9TjouFI49tJFQw/WiTLI6cZWNj3pTueje/wpUSwoCG4IvC+bCfSEYJAmpgiZ2d
	iIfot5NLndR7MbNs44y710y9VrjkIYekN0SvoakB+bp9jCiG2IZ53XavkynjNYkvo/NigP8yt7bCC
	NPa4LCkg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQWjE-003HNs-4D; Fri, 10 Feb 2023 16:58:28 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id F3F8D30030F;
	Fri, 10 Feb 2023 17:58:27 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id DCB8D2083D40F; Fri, 10 Feb 2023 17:58:27 +0100 (CET)
Date: Fri, 10 Feb 2023 17:58:27 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [peterz-queue:objtool/shrink-reloc 6/9]
 tools/objtool/include/objtool/elf.h:85:92: error: '_Static_assert' with no
 message is a C2x extension
Message-ID: <Y+Z3s8RJhkWjg32L@hirez.programming.kicks-ass.net>
References: <202302110008.pUtcZnVo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202302110008.pUtcZnVo-lkp@intel.com>

On Sat, Feb 11, 2023 at 12:50:43AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git objtool/shrink-reloc
> head:   6aedb7889b9dbd5094ff15b388ac2d2f6663148c
> commit: 371de6c485805b337819a1a5f4a2f37ec739f328 [6/9] objtool: Remove reloc::offset
> config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20230211/202302110008.pUtcZnVo-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=371de6c485805b337819a1a5f4a2f37ec739f328
>         git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
>         git fetch --no-tags peterz-queue objtool/shrink-reloc
>         git checkout 371de6c485805b337819a1a5f4a2f37ec739f328
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 prepare
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202302110008.pUtcZnVo-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from weak.c:10:
>    In file included from tools/objtool/include/objtool/objtool.h:13:
> >> tools/objtool/include/objtool/elf.h:85:92: error: '_Static_assert' with no message is a C2x extension [-Werror,-Wc2x-extensions]
>    static_assert(offsetof(struct reloc, rela.r_offset) == offsetof(struct reloc, rel.r_offset));
>                                                                                               ^

Boo, I included build_bug.h which has:

tools/include/linux/build_bug.h:#define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)

I'll go dig out me clang I suppose.
