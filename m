Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3930D33FA;
	Thu,  5 Jan 2023 11:46:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A27AC433D2;
	Thu,  5 Jan 2023 11:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1672919194;
	bh=xKtbeYX661OLyG8wPfqBzfOvHUAto6fo22SMjBTwB6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vgymWFeCRtYhxBNlgZEk94ZQAxmPh2r1b0sBgatHllVlFpKEyA9OTf5PDjC8gno51
	 s+z0krLBb86/Uj1ORPnvVTqJlbb8doyAA+U4utSTfzYSf5SDIpfXPXm0jDiqr6jnIO
	 E0voC8+4vSW9/XhG0OWheAxufSwweDNSgZh91SWc=
Date: Thu, 5 Jan 2023 12:46:32 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Marco Elver <elver@google.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	Sasha Levin <sashal@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [ammarfaizi2-block:stable/linux-stable-rc/queue/5.15 54/54]
 kernel/kcsan/core.c:1076:49: error: too many arguments to function call,
 expected 3, have 4
Message-ID: <Y7a4mGimHIlW/cZ1@kroah.com>
References: <202301030233.rZPMiNh1-lkp@intel.com>
 <Y7M7Xo7NJEy7Yucr@elver.google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7M7Xo7NJEy7Yucr@elver.google.com>

On Mon, Jan 02, 2023 at 09:15:26PM +0100, Marco Elver wrote:
> On Tue, Jan 03, 2023 at 02:44AM +0800, kernel test robot wrote:
> > tree:   https://github.com/ammarfaizi2/linux-block stable/linux-stable-rc/queue/5.15
> > head:   6b61636f89bfa685895515e024c7d07c0fdebaa9
> > commit: 6b61636f89bfa685895515e024c7d07c0fdebaa9 [54/54] kcsan: Instrument memcpy/memset/memmove with newer Clang
> > config: s390-randconfig-r021-20230102
> > compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 7a8cb6cd4e3ff8aaadebff2b9d3ee9e2a326d444)
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install s390 cross compiling tool for clang build
> >         # apt-get install binutils-s390x-linux-gnu
> >         # https://github.com/ammarfaizi2/linux-block/commit/6b61636f89bfa685895515e024c7d07c0fdebaa9
> >         git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
> >         git fetch --no-tags ammarfaizi2-block stable/linux-stable-rc/queue/5.15
> >         git checkout 6b61636f89bfa685895515e024c7d07c0fdebaa9
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash kernel/kcsan/
> > 
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > 
> > All errors (new ones prefixed by >>):
> > 
> > >> kernel/kcsan/core.c:1076:49: error: too many arguments to function call, expected 3, have 4
> >            check_access(s, check_len, KCSAN_ACCESS_WRITE, _RET_IP_);
> >            ~~~~~~~~~~~~                                   ^~~~~~~~
> >    include/linux/kernel.h:57:19: note: expanded from macro '_RET_IP_'
> >    #define _RET_IP_                (unsigned long)__builtin_return_address(0)
> >                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    kernel/kcsan/core.c:601:29: note: 'check_access' declared here
> >    static __always_inline void check_access(const volatile void *ptr, size_t size,
> >                                ^
> >    kernel/kcsan/core.c:1090:51: error: too many arguments to function call, expected 3, have 4
> >            check_access(dst, check_len, KCSAN_ACCESS_WRITE, _RET_IP_);
> >            ~~~~~~~~~~~~                                     ^~~~~~~~
> >    include/linux/kernel.h:57:19: note: expanded from macro '_RET_IP_'
> >    #define _RET_IP_                (unsigned long)__builtin_return_address(0)
> >                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    kernel/kcsan/core.c:601:29: note: 'check_access' declared here
> >    static __always_inline void check_access(const volatile void *ptr, size_t size,
> >                                ^
> >    kernel/kcsan/core.c:1091:34: error: too many arguments to function call, expected 3, have 4
> >            check_access(src, check_len, 0, _RET_IP_);
> >            ~~~~~~~~~~~~                    ^~~~~~~~
> >    include/linux/kernel.h:57:19: note: expanded from macro '_RET_IP_'
> >    #define _RET_IP_                (unsigned long)__builtin_return_address(0)
> >                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    kernel/kcsan/core.c:601:29: note: 'check_access' declared here
> >    static __always_inline void check_access(const volatile void *ptr, size_t size,
> >                                ^
> >    kernel/kcsan/core.c:1105:51: error: too many arguments to function call, expected 3, have 4
> >            check_access(dst, check_len, KCSAN_ACCESS_WRITE, _RET_IP_);
> >            ~~~~~~~~~~~~                                     ^~~~~~~~
> >    include/linux/kernel.h:57:19: note: expanded from macro '_RET_IP_'
> >    #define _RET_IP_                (unsigned long)__builtin_return_address(0)
> >                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    kernel/kcsan/core.c:601:29: note: 'check_access' declared here
> >    static __always_inline void check_access(const volatile void *ptr, size_t size,
> >                                ^
> >    kernel/kcsan/core.c:1106:34: error: too many arguments to function call, expected 3, have 4
> >            check_access(src, check_len, 0, _RET_IP_);
> >            ~~~~~~~~~~~~                    ^~~~~~~~
> >    include/linux/kernel.h:57:19: note: expanded from macro '_RET_IP_'
> >    #define _RET_IP_                (unsigned long)__builtin_return_address(0)
> >                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    kernel/kcsan/core.c:601:29: note: 'check_access' declared here
> >    static __always_inline void check_access(const volatile void *ptr, size_t size,
> >                                ^
> >    5 errors generated.
> > 
> > 
> > vim +1076 kernel/kcsan/core.c
> > 
> >   1065	
> >   1066	#ifdef __HAVE_ARCH_MEMSET
> >   1067	void *__tsan_memset(void *s, int c, size_t count);
> >   1068	noinline void *__tsan_memset(void *s, int c, size_t count)
> >   1069	{
> >   1070		/*
> >   1071		 * Instead of not setting up watchpoints where accessed size is greater
> >   1072		 * than MAX_ENCODABLE_SIZE, truncate checked size to MAX_ENCODABLE_SIZE.
> >   1073		 */
> >   1074		size_t check_len = min_t(size_t, count, MAX_ENCODABLE_SIZE);
> >   1075	
> > > 1076		check_access(s, check_len, KCSAN_ACCESS_WRITE, _RET_IP_);
> >   1077		return memset(s, c, count);
> >   1078	}
> >   1079	#else
> >   1080	void *__tsan_memset(void *s, int c, size_t count) __alias(memset);
> >   1081	#endif
> >   1082	EXPORT_SYMBOL(__tsan_memset);
> >   1083	
> 
> For 5.10 and 5.15 stable kernels we require a separate backport (see
> attached), because check_access() was changed in commit 55a55fec5015b.

Thanks for this, now fixed up!

greg k-h
