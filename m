Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FAEDDB5;
	Tue,  5 Sep 2023 18:29:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21BB3C433BA;
	Tue,  5 Sep 2023 18:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693938592;
	bh=EzRIEbv4BKtpT9yrhLhIhnZZP1SOEq4OuywrtAZErq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ollKGpq5Po9QGUTvRsmStZh+Nsxdc/p+lrcC5GkOH+12HIZJriLrgqLFRMwuj38pX
	 kKPgd/Eo00KpoME+D0ZI4P/HRMdAF/vFpH5ErIbutSgOlhk6Ma4i7k6gtdIMxNQ97E
	 bHb8o7F3ha4poOVpvZ5PG7JZlG/Qsyn7hV27h/dPYg2Wygbl+XfPU4CuslpKK/013e
	 ebYYuFje+nwpt2He64hxzOW73A0nP9rkyrdvrsQy9pPxNu0U7Cr4fuwW8ICiQKEts1
	 uWg9YrSS/Bc4qxaKRizQmORcBsQE+19pu/Fnxd5FcOicnIpl55WIayA2euF+BpiZMh
	 JHegEArLlwB5w==
Date: Tue, 5 Sep 2023 11:29:50 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Ira Weiny <ira.weiny@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [weiny2:v6.5-pks-core 17/34] include/linux/stddef.h:10:7: error:
 Expected an identifier after {
Message-ID: <20230905182950.GA2148713@dev-arch.thelio-3990X>
References: <202309051156.S7BqDAQ8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202309051156.S7BqDAQ8-lkp@intel.com>

On Tue, Sep 05, 2023 at 12:00:05PM +0800, kernel test robot wrote:
> tree:   https://github.com/weiny2/linux-kernel.git v6.5-pks-core
> head:   1333a49c014b15a2cf7584b4a3641f03e0602a40
> commit: 3ee964a4772cd93458d8dbf48f2fd97b8b65551d [17/34] FIXME x86/entry: Add auxiliary pt_regs space
> config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230905/202309051156.S7BqDAQ8-lkp@intel.com/config)
> compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230905/202309051156.S7BqDAQ8-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309051156.S7BqDAQ8-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> include/linux/stddef.h:10:7: error: Expected an identifier after {
>    enum {
>          ^
> >> include/linux/stddef.h:11:11: error: expected newline
>     false = 0,
>              ^
> >> include/linux/stddef.h:13:1: error: invalid instruction mnemonic '}'
>    };
>    ^

Odd that GCC does not complain... This error comes from
arch/x86/kernel/ftrace_64.S. It appears that stddef.h gets included into
ftrace_64.S via the container_of.h include in
arch/x86/include/asm/ptrace.h, which obviously won't work. Something
like the following diff would avoid that:

diff --git a/arch/x86/include/asm/ptrace.h b/arch/x86/include/asm/ptrace.h
index 5a9c85893459..4ea2a615c8c5 100644
--- a/arch/x86/include/asm/ptrace.h
+++ b/arch/x86/include/asm/ptrace.h
@@ -2,12 +2,12 @@
 #ifndef _ASM_X86_PTRACE_H
 #define _ASM_X86_PTRACE_H
 
-#include <linux/container_of.h>
 #include <asm/segment.h>
 #include <asm/page_types.h>
 #include <uapi/asm/ptrace.h>
 
 #ifndef __ASSEMBLY__
+#include <linux/container_of.h>
 #ifdef __i386__
 
 struct pt_regs {

Cheers,
Nathan
