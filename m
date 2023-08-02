Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4464A8476;
	Wed,  2 Aug 2023 16:38:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43EA2C433C8;
	Wed,  2 Aug 2023 16:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690994323;
	bh=SjvF9mfpUkMBEAjBLC1ZVHzrIHDs09gaX3bOlhkRwX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uGkwr0myRsvTZ0hItP+4W/krYkF69fmvF/oTEB94fVGKz93nlSkI1BEO7xv30D0P3
	 TCwf+3Y5lsUWx+2mkrmDFi+a252bdLGx7DI7cUBgfrMUhPf2C0JdP/zn/jfYO27rIn
	 na0+6IwLhYW23vrjeUFtuGUQdbtSdiORuIcOcdoK7tZZsb0j0Jovmr+sg4rd+S6UpN
	 GMQrUXLZuUVNnUQ2dmBdHSWhbEwXD+D2PA0ByrE5fC6rFKD3O1iMyBHv8Cc76xVc5M
	 MN16CJoN3pw44D7y594vnbajBHAv9jx+rE3r49uQjkbChSf/3khzJkYtAs8TO2sBDR
	 HEpIIVBWiuHsg==
Date: Wed, 2 Aug 2023 09:38:41 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: "Tobin C. Harding" <tobin@kernel.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Subject: Re: [stable:linux-4.19.y 5172/9999] lib/string.c:312:7: error:
 redefinition of 'stpcpy'
Message-ID: <20230802163841.GA2149436@dev-arch.thelio-3990X>
References: <202308021401.lhJd2bLx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202308021401.lhJd2bLx-lkp@intel.com>

On Wed, Aug 02, 2023 at 02:37:36PM +0800, kernel test robot wrote:
> Hi Tobin,
> 
> First bad commit (maybe != root cause):
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
> head:   767049cead76cf699707290d5aeefb3e4d0d5b43
> commit: 2a3687034e47c51cd4f01ce82ed16f1964008b9e [5172/9999] lib/string: Add strscpy_pad() function
> config: x86_64-randconfig-x003-20230731 (https://download.01.org/0day-ci/archive/20230802/202308021401.lhJd2bLx-lkp@intel.com/config)
> compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
> reproduce: (https://download.01.org/0day-ci/archive/20230802/202308021401.lhJd2bLx-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308021401.lhJd2bLx-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> lib/string.c:312:7: error: redefinition of 'stpcpy'
>    char *stpcpy(char *__restrict__ dest, const char *__restrict__ src)
>          ^
>    lib/string.c:255:7: note: previous definition is here
>    char *stpcpy(char *__restrict__ dest, const char *__restrict__ src)
>          ^
>    lib/string.c:318:1: error: redefinition of '__kstrtab_stpcpy'
>    EXPORT_SYMBOL(stpcpy);
>    ^
>    include/linux/export.h:124:2: note: expanded from macro 'EXPORT_SYMBOL'
>            __EXPORT_SYMBOL(sym, "")
>            ^
>    include/linux/export.h:120:25: note: expanded from macro '__EXPORT_SYMBOL'
>    #define __EXPORT_SYMBOL ___EXPORT_SYMBOL
>                            ^
>    include/linux/export.h:81:20: note: expanded from macro '___EXPORT_SYMBOL'
>            static const char __kstrtab_##sym[]                             \
>                              ^
>    <scratch space>:220:1: note: expanded from here
>    __kstrtab_stpcpy
>    ^
>    lib/string.c:261:1: note: previous definition is here
>    EXPORT_SYMBOL(stpcpy);
>    ^
>    include/linux/export.h:124:2: note: expanded from macro 'EXPORT_SYMBOL'
>            __EXPORT_SYMBOL(sym, "")
>            ^
>    include/linux/export.h:120:25: note: expanded from macro '__EXPORT_SYMBOL'
>    #define __EXPORT_SYMBOL ___EXPORT_SYMBOL
>                            ^
>    include/linux/export.h:81:20: note: expanded from macro '___EXPORT_SYMBOL'
>            static const char __kstrtab_##sym[]                             \
>                              ^
>    <scratch space>:202:1: note: expanded from here
>    __kstrtab_stpcpy
>    ^
>    2 errors generated.

This report/error makes no sense. At both the commit the robot bisected
to (2a3687034e47c51cd4f01ce82ed16f1964008b9e) and current linux-4.19.y,
there is only one definition of stpcpy()... Am I missing something here?

2a3687034e47c51cd4f01ce82ed16f1964008b9e:lib/string.c:240: * stpcpy - copy a string from src to dest returning a pointer to the new end
2a3687034e47c51cd4f01ce82ed16f1964008b9e:lib/string.c:247: * stpcpy differs from strcpy in a key way: the return value is a pointer
2a3687034e47c51cd4f01ce82ed16f1964008b9e:lib/string.c:252: * the compiler lowers other libcalls to stpcpy.
2a3687034e47c51cd4f01ce82ed16f1964008b9e:lib/string.c:254:char *stpcpy(char *__restrict__ dest, const char *__restrict__ src);
2a3687034e47c51cd4f01ce82ed16f1964008b9e:lib/string.c:255:char *stpcpy(char *__restrict__ dest, const char *__restrict__ src)
2a3687034e47c51cd4f01ce82ed16f1964008b9e:lib/string.c:261:EXPORT_SYMBOL(stpcpy);

767049cead76cf699707290d5aeefb3e4d0d5b43:lib/string.c:240: * stpcpy - copy a string from src to dest returning a pointer to the new end
767049cead76cf699707290d5aeefb3e4d0d5b43:lib/string.c:247: * stpcpy differs from strcpy in a key way: the return value is a pointer
767049cead76cf699707290d5aeefb3e4d0d5b43:lib/string.c:252: * the compiler lowers other libcalls to stpcpy.
767049cead76cf699707290d5aeefb3e4d0d5b43:lib/string.c:254:char *stpcpy(char *__restrict__ dest, const char *__restrict__ src);
767049cead76cf699707290d5aeefb3e4d0d5b43:lib/string.c:255:char *stpcpy(char *__restrict__ dest, const char *__restrict__ src)
767049cead76cf699707290d5aeefb3e4d0d5b43:lib/string.c:261:EXPORT_SYMBOL(stpcpy);

Cheers,
Nathan
