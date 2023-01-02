Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E795691
	for <llvm@lists.linux.dev>; Mon,  2 Jan 2023 20:15:35 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id z8-20020a05600c220800b003d33b0bda11so15618391wml.0
        for <llvm@lists.linux.dev>; Mon, 02 Jan 2023 12:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nnA4MtPzVXj83EtEWBnqLYWTGe3+2ecag8jqt62Sxp0=;
        b=moVcv0FeBZxqZaG9Te6OONuUIQ+3dG/Xq7KXkYzsKABw3MAGzHH7yHfh+ZLRB27AX7
         QM5d3oOfxdozS0g9yl0O7JrZeRl/5+zJUFDEQ2OQgFMHimBmefAYjM+2WyaeQmtsOBk3
         T216V8gXokWsuQtFuvsb0lgmaRkDT2HVEe+x67qmZ1QafNSfS4w9lMLtOzKyViNF7pcD
         HlgQc/H4hWrXsHDUA1vW1mbaEdN+GZ5o6KTkxOyAlhQzj0b6sYjJSxbcN4C63hK8xFjB
         T9bqQAodRaKjVGuhZHqCKNgAg3wEemdlYqpNHPSr2WFnHeepQhVeTRgpm0empufehEim
         Qxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nnA4MtPzVXj83EtEWBnqLYWTGe3+2ecag8jqt62Sxp0=;
        b=0sXCCGWY7PQgPQJoJgjvrlyC2QtQSYviQ27q0+CuLXDPymxQza8hqkExcbunzWCCKA
         MomUlU4Ne+8lVoR8SHAxiDLoUa3z5Sl2BIRI6Y/CwZASa0Z3NxfkuqrIG3UNy1xkahpp
         pt8FMMko/Gf3ZLxYm2gtwkEQcevwCDUWUCi5VkK5eG3qFJWw76wWkSIXYvSrd6u/kPMc
         RRe6Ky4oAmHMMNf1FZyIdBTQ8UsKFwSdnOQBnRqxvmXwIkyUeY4sKyaOylaYATDSDjoM
         1gLYMYig9I9Kmqxn4h1WhV0z3qpyNaqX6JoRTB/jxevm472pqtnpvY47I1HTA9/ZsB88
         0qxg==
X-Gm-Message-State: AFqh2kqYSpJHymScw3NE2M4CuPVUDLq4PrTLYLrOk6GGO4Iw+ZID9Eo/
	Jlh7355AZqjZv3YdEX/xTRmbe+8ivzJnJabp
X-Google-Smtp-Source: AMrXdXv9kZrm9xHrztYmPiV4vAWV8QzkbdL+pjDA6nrGZy/acL6+OREtYTCCOcaueXo49XVcnF34hQ==
X-Received: by 2002:a7b:ce06:0:b0:3cf:a483:3100 with SMTP id m6-20020a7bce06000000b003cfa4833100mr29609216wmc.3.1672690533571;
        Mon, 02 Jan 2023 12:15:33 -0800 (PST)
Received: from elver.google.com ([2a00:79e0:9c:201:6950:757d:cd6e:92aa])
        by smtp.gmail.com with ESMTPSA id m22-20020a05600c4f5600b003d995a704fdsm23095070wmq.33.2023.01.02.12.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 12:15:33 -0800 (PST)
Date: Mon, 2 Jan 2023 21:15:26 +0100
From: Marco Elver <elver@google.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	Sasha Levin <sashal@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [ammarfaizi2-block:stable/linux-stable-rc/queue/5.15 54/54]
 kernel/kcsan/core.c:1076:49: error: too many arguments to function call,
 expected 3, have 4
Message-ID: <Y7M7Xo7NJEy7Yucr@elver.google.com>
References: <202301030233.rZPMiNh1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="gpGndaiEQHGR3Z5V"
Content-Disposition: inline
In-Reply-To: <202301030233.rZPMiNh1-lkp@intel.com>
User-Agent: Mutt/2.2.7 (2022-08-07)


--gpGndaiEQHGR3Z5V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 03, 2023 at 02:44AM +0800, kernel test robot wrote:
> tree:   https://github.com/ammarfaizi2/linux-block stable/linux-stable-rc/queue/5.15
> head:   6b61636f89bfa685895515e024c7d07c0fdebaa9
> commit: 6b61636f89bfa685895515e024c7d07c0fdebaa9 [54/54] kcsan: Instrument memcpy/memset/memmove with newer Clang
> config: s390-randconfig-r021-20230102
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 7a8cb6cd4e3ff8aaadebff2b9d3ee9e2a326d444)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install s390 cross compiling tool for clang build
>         # apt-get install binutils-s390x-linux-gnu
>         # https://github.com/ammarfaizi2/linux-block/commit/6b61636f89bfa685895515e024c7d07c0fdebaa9
>         git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
>         git fetch --no-tags ammarfaizi2-block stable/linux-stable-rc/queue/5.15
>         git checkout 6b61636f89bfa685895515e024c7d07c0fdebaa9
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash kernel/kcsan/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> kernel/kcsan/core.c:1076:49: error: too many arguments to function call, expected 3, have 4
>            check_access(s, check_len, KCSAN_ACCESS_WRITE, _RET_IP_);
>            ~~~~~~~~~~~~                                   ^~~~~~~~
>    include/linux/kernel.h:57:19: note: expanded from macro '_RET_IP_'
>    #define _RET_IP_                (unsigned long)__builtin_return_address(0)
>                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:601:29: note: 'check_access' declared here
>    static __always_inline void check_access(const volatile void *ptr, size_t size,
>                                ^
>    kernel/kcsan/core.c:1090:51: error: too many arguments to function call, expected 3, have 4
>            check_access(dst, check_len, KCSAN_ACCESS_WRITE, _RET_IP_);
>            ~~~~~~~~~~~~                                     ^~~~~~~~
>    include/linux/kernel.h:57:19: note: expanded from macro '_RET_IP_'
>    #define _RET_IP_                (unsigned long)__builtin_return_address(0)
>                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:601:29: note: 'check_access' declared here
>    static __always_inline void check_access(const volatile void *ptr, size_t size,
>                                ^
>    kernel/kcsan/core.c:1091:34: error: too many arguments to function call, expected 3, have 4
>            check_access(src, check_len, 0, _RET_IP_);
>            ~~~~~~~~~~~~                    ^~~~~~~~
>    include/linux/kernel.h:57:19: note: expanded from macro '_RET_IP_'
>    #define _RET_IP_                (unsigned long)__builtin_return_address(0)
>                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:601:29: note: 'check_access' declared here
>    static __always_inline void check_access(const volatile void *ptr, size_t size,
>                                ^
>    kernel/kcsan/core.c:1105:51: error: too many arguments to function call, expected 3, have 4
>            check_access(dst, check_len, KCSAN_ACCESS_WRITE, _RET_IP_);
>            ~~~~~~~~~~~~                                     ^~~~~~~~
>    include/linux/kernel.h:57:19: note: expanded from macro '_RET_IP_'
>    #define _RET_IP_                (unsigned long)__builtin_return_address(0)
>                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:601:29: note: 'check_access' declared here
>    static __always_inline void check_access(const volatile void *ptr, size_t size,
>                                ^
>    kernel/kcsan/core.c:1106:34: error: too many arguments to function call, expected 3, have 4
>            check_access(src, check_len, 0, _RET_IP_);
>            ~~~~~~~~~~~~                    ^~~~~~~~
>    include/linux/kernel.h:57:19: note: expanded from macro '_RET_IP_'
>    #define _RET_IP_                (unsigned long)__builtin_return_address(0)
>                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    kernel/kcsan/core.c:601:29: note: 'check_access' declared here
>    static __always_inline void check_access(const volatile void *ptr, size_t size,
>                                ^
>    5 errors generated.
> 
> 
> vim +1076 kernel/kcsan/core.c
> 
>   1065	
>   1066	#ifdef __HAVE_ARCH_MEMSET
>   1067	void *__tsan_memset(void *s, int c, size_t count);
>   1068	noinline void *__tsan_memset(void *s, int c, size_t count)
>   1069	{
>   1070		/*
>   1071		 * Instead of not setting up watchpoints where accessed size is greater
>   1072		 * than MAX_ENCODABLE_SIZE, truncate checked size to MAX_ENCODABLE_SIZE.
>   1073		 */
>   1074		size_t check_len = min_t(size_t, count, MAX_ENCODABLE_SIZE);
>   1075	
> > 1076		check_access(s, check_len, KCSAN_ACCESS_WRITE, _RET_IP_);
>   1077		return memset(s, c, count);
>   1078	}
>   1079	#else
>   1080	void *__tsan_memset(void *s, int c, size_t count) __alias(memset);
>   1081	#endif
>   1082	EXPORT_SYMBOL(__tsan_memset);
>   1083	

For 5.10 and 5.15 stable kernels we require a separate backport (see
attached), because check_access() was changed in commit 55a55fec5015b.

Thanks,
-- Marco

--gpGndaiEQHGR3Z5V
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-kcsan-Instrument-memcpy-memset-memmove-with-newer-Cl.patch"

From 460f24b2b74f507d100d3f09ab81c7b089477bb3 Mon Sep 17 00:00:00 2001
From: Marco Elver <elver@google.com>
Date: Mon, 12 Sep 2022 11:45:40 +0200
Subject: [PATCH] kcsan: Instrument memcpy/memset/memmove with newer Clang

commit 7c201739beef1a586d806463f1465429cdce34c5 upstream.

With Clang version 16+, -fsanitize=thread will turn
memcpy/memset/memmove calls in instrumented functions into
__tsan_memcpy/__tsan_memset/__tsan_memmove calls respectively.

Add these functions to the core KCSAN runtime, so that we (a) catch data
races with mem* functions, and (b) won't run into linker errors with
such newer compilers.

[ elver@google.com: adjust check_access() call for v5.15 and earlier. ]

Cc: stable@vger.kernel.org # v5.10+
Signed-off-by: Marco Elver <elver@google.com>
Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
---
 kernel/kcsan/core.c | 50 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/kernel/kcsan/core.c b/kernel/kcsan/core.c
index 76e67d1e02d4..526510b3791e 100644
--- a/kernel/kcsan/core.c
+++ b/kernel/kcsan/core.c
@@ -14,10 +14,12 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
+#include <linux/minmax.h>
 #include <linux/moduleparam.h>
 #include <linux/percpu.h>
 #include <linux/preempt.h>
 #include <linux/sched.h>
+#include <linux/string.h>
 #include <linux/uaccess.h>
 
 #include "encoding.h"
@@ -1060,3 +1062,51 @@ EXPORT_SYMBOL(__tsan_atomic_thread_fence);
 void __tsan_atomic_signal_fence(int memorder);
 void __tsan_atomic_signal_fence(int memorder) { }
 EXPORT_SYMBOL(__tsan_atomic_signal_fence);
+
+#ifdef __HAVE_ARCH_MEMSET
+void *__tsan_memset(void *s, int c, size_t count);
+noinline void *__tsan_memset(void *s, int c, size_t count)
+{
+	/*
+	 * Instead of not setting up watchpoints where accessed size is greater
+	 * than MAX_ENCODABLE_SIZE, truncate checked size to MAX_ENCODABLE_SIZE.
+	 */
+	size_t check_len = min_t(size_t, count, MAX_ENCODABLE_SIZE);
+
+	check_access(s, check_len, KCSAN_ACCESS_WRITE);
+	return memset(s, c, count);
+}
+#else
+void *__tsan_memset(void *s, int c, size_t count) __alias(memset);
+#endif
+EXPORT_SYMBOL(__tsan_memset);
+
+#ifdef __HAVE_ARCH_MEMMOVE
+void *__tsan_memmove(void *dst, const void *src, size_t len);
+noinline void *__tsan_memmove(void *dst, const void *src, size_t len)
+{
+	size_t check_len = min_t(size_t, len, MAX_ENCODABLE_SIZE);
+
+	check_access(dst, check_len, KCSAN_ACCESS_WRITE);
+	check_access(src, check_len, 0);
+	return memmove(dst, src, len);
+}
+#else
+void *__tsan_memmove(void *dst, const void *src, size_t len) __alias(memmove);
+#endif
+EXPORT_SYMBOL(__tsan_memmove);
+
+#ifdef __HAVE_ARCH_MEMCPY
+void *__tsan_memcpy(void *dst, const void *src, size_t len);
+noinline void *__tsan_memcpy(void *dst, const void *src, size_t len)
+{
+	size_t check_len = min_t(size_t, len, MAX_ENCODABLE_SIZE);
+
+	check_access(dst, check_len, KCSAN_ACCESS_WRITE);
+	check_access(src, check_len, 0);
+	return memcpy(dst, src, len);
+}
+#else
+void *__tsan_memcpy(void *dst, const void *src, size_t len) __alias(memcpy);
+#endif
+EXPORT_SYMBOL(__tsan_memcpy);
-- 
2.39.0.314.g84b9a713c41-goog


--gpGndaiEQHGR3Z5V--
