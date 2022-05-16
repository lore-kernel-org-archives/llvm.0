Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FDA138F
	for <llvm@lists.linux.dev>; Mon, 16 May 2022 20:47:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA677C385AA;
	Mon, 16 May 2022 20:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652734037;
	bh=5wO7R+yZo4gN5lTIMsqBqohYvbOxO4gvGse1hhlcptg=;
	h=Date:From:To:Cc:Subject:From;
	b=Y35VZRZ30EOlEPUaWb+FVp3fJosi92AYRAWjqVJvsXyhKD9K+IBvP/8HNkbT7yFBt
	 q5lpao2Ev+vbpmpASAeJ8o6wZKCw0qVbYnsgxhn/zBZbbIle517EKc4htb92+8Q8FU
	 Y3apr4K8prEuUHvorZgI12sZIjmJkQL/GJT264gDfL86kIMkASy1h7jXtVaQzRLcwR
	 RZ87SQ+TPJt8VWhwVDnwv2CHcp/teiX1YogK6Kd360L4zfE0igBr7unKXw3RwzWIjV
	 ZijilDizKRD0op5Qyi/w+lEzFfRXnFWkJN4POc3jIlustAdpONCXqnjKV4DJFI3VL7
	 AZd891RR3C6bA==
Date: Mon, 16 May 2022 13:47:15 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Subject: objtool "no non-local symbols" error with tip of tree LLVM
Message-ID: <YoK4U9RgQ9N+HhXJ@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Josh and Peter,

After a recent change in LLVM [1], I see warnings (errors?) from objtool
when building x86_64 allmodconfig on 5.15 and 5.17:

  $ make -skj"$(nproc)" KCONFIG_ALLCONFIG=<(echo CONFIG_WERROR) LLVM=1 allmodconfig all
  ...
  mm/highmem.o: warning: objtool: no non-local symbols !?
  mm/highmem.o: warning: objtool: gelf_update_symshndx: invalid section index
  make[2]: *** [scripts/Makefile.build:288: mm/highmem.o] Error 255
  ...
  security/tomoyo/load_policy.o: warning: objtool: no non-local symbols !?
  security/tomoyo/load_policy.o: warning: objtool: gelf_update_symshndx: invalid section index
  make[3]: *** [scripts/Makefile.build:288: security/tomoyo/load_policy.o] Error 255
  ...

I don't see the same errors on x86_64 allmodconfig on mainline so I
bisected the 5.17 branch and came upon commit 4abff6d48dbc ("objtool:
Fix code relocs vs weak symbols"). I wanted to see what 5.17 might be
missing and came to commit ed53a0d97192 ("x86/alternative: Use
.ibt_endbr_seal to seal indirect calls") in mainline, which I think just
hides the issue for allmodconfig. I can reproduce this problem with a
more selective set of config values on mainline:

  $ make -skj"$(nproc)" LLVM=1 defconfig

  $ scripts/config -e KASAN -e SECURITY_TOMOYO -e SECURITY_TOMOYO_OMIT_USERSPACE_LOADER

  $ make -skj"$(nproc)" LLVM=1 olddefconfig security/tomoyo/load_policy.o
  security/tomoyo/load_policy.o: warning: objtool: no non-local symbols !?
  security/tomoyo/load_policy.o: warning: objtool: gelf_update_symshndx: invalid section index
  make[3]: *** [scripts/Makefile.build:288: security/tomoyo/load_policy.o] Error 255
  ...

Looking at the object file, the '.text.asan.module_ctor' section has
disappeared.

Before:

  $ llvm-nm -S security/tomoyo/load_policy.o
  0000000000000000 0000000000000001 t asan.module_ctor

  $ llvm-readelf -s security/tomoyo/load_policy.o

  Symbol table '.symtab' contains 4 entries:
     Num:    Value          Size Type    Bind   Vis       Ndx Name
       0: 0000000000000000     0 NOTYPE  LOCAL  DEFAULT   UND
       1: 0000000000000000     0 FILE    LOCAL  DEFAULT   ABS load_policy.c
       2: 0000000000000000     0 SECTION LOCAL  DEFAULT     3 .text.asan.module_ctor
       3: 0000000000000000     1 FUNC    LOCAL  DEFAULT     3 asan.module_ctor

After:

  $ llvm-nm -S security/tomoyo/load_policy.o
  0000000000000000 0000000000000001 t asan.module_ctor

  $ llvm-readelf -s security/tomoyo/load_policy.o

  Symbol table '.symtab' contains 3 entries:
     Num:    Value          Size Type    Bind   Vis       Ndx Name
       0: 0000000000000000     0 NOTYPE  LOCAL  DEFAULT   UND
       1: 0000000000000000     0 FILE    LOCAL  DEFAULT   ABS load_policy.c
       2: 0000000000000000     1 FUNC    LOCAL  DEFAULT     3 asan.module_ctor

As far as I understand it, the kernel uses constructors for at least
KASAN and KCSAN, hence why that change impacts the kernel. Beyond that,
I am not really sure whether the LLVM change is problematic or objtool
just is not accounting for something that it should. I am happy to
provide any additional information that might help understand what is
going wrong here.

[1]: https://github.com/llvm/llvm-project/commit/badd088c57d7d18acd337b7868fe8c7974c88c5b

Cheers,
Nathan
