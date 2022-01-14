Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211D5168
	for <llvm@lists.linux.dev>; Fri, 14 Jan 2022 16:29:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A07ECC36AE5;
	Fri, 14 Jan 2022 16:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642177750;
	bh=yXvKRHzb5B3RUpCqG1Tqdd2cjnWxwJXNHkuQFu0N6KE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aKn4eP9I0HtLLZcQOGtWjNKdBLbr/vIeU93h3cYlqWNwFt3XciihXnB7VP3zti4u6
	 ktS7xI0Zb3UqRZ/W6u6w6snlfnqXc7tB7W/lxZb7HsAz7cd0RG9ZAdnnuUgyYcJX1x
	 xARkHFDqlpG7aqbV7SfVkOGx/GnisExN1NqXyd6d+fWHUq3okSQjUfeBj3ocChYwnU
	 3LIFTv/yuiiJ85fE9e1cHK5V24ENOuM5uSG47k+itycRSt50a/La+42OA26T5VRAfo
	 UqLEvcRu4bhfluZ7bfdrDi1kyFfLziYWq7obAIwAAiXUZW2Gq4bpFMW4BfMKNjfI/s
	 qJsvirjmgXAyw==
Date: Fri, 14 Jan 2022 09:29:06 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Beau Belgrave <beaub@linux.microsoft.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v9 01/12] user_events: Add minimal support for
 trace_event into ftrace
Message-ID: <YeGk0nIH9x91k01I@archlinux-ax161>
References: <20220111172602.2513-2-beaub@linux.microsoft.com>
 <202201142322.DpkhCCS2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202201142322.DpkhCCS2-lkp@intel.com>

On Fri, Jan 14, 2022 at 11:30:05PM +0800, kernel test robot wrote:
> Hi Beau,
> 
> Thank you for the patch! Perhaps something to improve:
> 
> [auto build test WARNING on 85c62c8c3749eec02ba81217bdcac26867dc262e]
> 
> url:    https://github.com/0day-ci/linux/commits/Beau-Belgrave/user_events-Enable-user-processes-to-create-and-write-to-trace-events/20220112-014042
> base:   85c62c8c3749eec02ba81217bdcac26867dc262e
> config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20220114/202201142322.DpkhCCS2-lkp@intel.com/config)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 82c8aca93488730ce8f66101e0f3538f14b551dd)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/a5a2d34cbaeb90d281d8c13c753f4aaaa447ec11
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Beau-Belgrave/user_events-Enable-user-processes-to-create-and-write-to-trace-events/20220112-014042
>         git checkout a5a2d34cbaeb90d281d8c13c753f4aaaa447ec11
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash kernel/trace/ sound/soc/sof/
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
> >> kernel/trace/trace_events_user.c:1027:14: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            return NULL + (*pos == 0);
>                   ~~~~ ^
>    1 warning generated.
> 
> 
> vim +1027 kernel/trace/trace_events_user.c
> 
>   1024	
>   1025	static void *user_seq_start(struct seq_file *m, loff_t *pos)
>   1026	{
> > 1027		return NULL + (*pos == 0);
>   1028	}
>   1029	
> 

Arnd, it looks like [1] never got picked up? That would help solve
this, as this function is the same as single_start(). Should it be
resent or pinged?

[1]: https://lore.kernel.org/r/20201028151202.3074398-1-arnd@kernel.org/

Cheers,
Nathan
