Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664193FD6
	for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 09:56:11 +0000 (UTC)
Received: from [192.168.0.4] (ip5f5aef84.dynamic.kabel-deutschland.de [95.90.239.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 7107561E5FE00;
	Mon, 13 Sep 2021 11:48:21 +0200 (CEST)
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: LLVM/clang ias build fails with unsupported arguments '-mpower4' and
 '-many' to option 'Wa,'
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Cc: linuxppc-dev@lists.ozlabs.org, Derek Parker <parkerderek86@gmail.com>,
 Dmitrii Okunev <xaionaro@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev
Message-ID: <62cc7e62-d072-7b16-8b6c-006f067b1ed7@molgen.mpg.de>
Date: Mon, 13 Sep 2021 11:48:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Dear Linux folks,


Building Linux with LLVM’s integrated assembler fails with the error 
below [1].

```
$ ARCH=powerpc CROSS_COMPILE=powerpc64le-linux-gnu- make LLVM=1 
LLVM_IAS=1 -j72 pseries_defconfig arch/powerpc/kernel/vdso32/gettimeofday.o
...
arch/powerpc/kernel/vdso32/gettimeofday.S:72:8: error: unsupported 
directive '.stabs'
.stabs "_restgpr_31_x:F-1",36,0,0,_restgpr_31_x; .globl _restgpr_31_x; 
_restgpr_31_x:
        ^
arch/powerpc/kernel/vdso32/gettimeofday.S:73:8: error: unsupported 
directive '.stabs'
.stabs "_rest32gpr_31_x:F-1",36,0,0,_rest32gpr_31_x; .globl 
_rest32gpr_31_x; _rest32gpr_31_x:
        ^
```

The LLVM developers are not planning on implementing this, as Stab has 
been succeeded by DWARF [2].


Kind regards,

Paul


[1]: https://github.com/ClangBuiltLinux/linux/issues/1418
[2]: https://bugs.llvm.org/show_bug.cgi?id=31134
