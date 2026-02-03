Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7544F277CB8;
	Tue,  3 Feb 2026 22:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.228.1.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770158223; cv=none; b=caUggQEhZm9ELE24+RxNHgd3saqM3pvJDT9oR/nEdYzWZ/CUWuCsimr/RrbA3p2xwPXkf988P/Vyh8m2lkPJzWCxY3XR1yPxyCJZGAjBJEN3In0q1ogFFxIwrLTFsJCRJQUZ+NeY7szrZzKFn112BQZh7FWcYhrMvW++sHyOqzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770158223; c=relaxed/simple;
	bh=/9JNqvJxqlpcdDQtYvBrI3A7+yqWnivfT9JI1Rs04LQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sw/MfMI8cuSZ1kF+Oy6ZstDD/7SEy/NuPGJXcvWScpxjItMOmNeSoDmfehgl8qbTVg5LZNrOexIamGV6TIpBNTDkmo07961E3v+HUpku3sCOApz3B4ng5D5k319O4Lmzl+8FalUUyFDn4SMVc8z8CtKGKY+x0ygkErsMFOjOz94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass smtp.mailfrom=kernel.crashing.org; arc=none smtp.client-ip=63.228.1.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.crashing.org
Received: from gate.crashing.org (localhost [127.0.0.1])
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 613MSbKs3677924;
	Tue, 3 Feb 2026 16:28:37 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.18.1/8.18.1/Submit) id 613MSauR3677923;
	Tue, 3 Feb 2026 16:28:36 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Tue, 3 Feb 2026 16:28:36 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] powerpc/uaccess: Fix inline assembly for clang build on
 PPC32
Message-ID: <aYJ2lGdDd041F2SY@gate>
References: <8ca3a657a650e497a96bfe7acde2f637dadab344.1770103646.git.chleroy@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ca3a657a650e497a96bfe7acde2f637dadab344.1770103646.git.chleroy@kernel.org>

Hi!

On Tue, Feb 03, 2026 at 08:30:41AM +0100, Christophe Leroy (CS GROUP) wrote:
> Test robot reports the following error with clang-16.0.6:
> 
>    In file included from kernel/rseq.c:75:
>    include/linux/rseq_entry.h:141:3: error: invalid operand for instruction
>                    unsafe_get_user(offset, &ucs->post_commit_offset, efault);
>                    ^
>    include/linux/uaccess.h:608:2: note: expanded from macro 'unsafe_get_user'
>            arch_unsafe_get_user(x, ptr, local_label);      \
>            ^
>    arch/powerpc/include/asm/uaccess.h:518:2: note: expanded from macro 'arch_unsafe_get_user'
>            __get_user_size_goto(__gu_val, __gu_addr, sizeof(*(p)), e); \
>            ^
>    arch/powerpc/include/asm/uaccess.h:284:2: note: expanded from macro '__get_user_size_goto'
>            __get_user_size_allowed(x, ptr, size, __gus_retval);    \
>            ^
>    arch/powerpc/include/asm/uaccess.h:275:10: note: expanded from macro '__get_user_size_allowed'
>            case 8: __get_user_asm2(x, (u64 __user *)ptr, retval);  break;  \
>                    ^
>    arch/powerpc/include/asm/uaccess.h:258:4: note: expanded from macro '__get_user_asm2'
>                    "       li %1+1,0\n"                    \
>                     ^
>    <inline asm>:7:5: note: instantiated into assembly here
>            li 31+1,0
>               ^
>    1 error generated.
> 
> On PPC32, for 64 bits vars a pair of registers is used. Usually the
> lower register in the pair is the high part and the higher register is
> the low part. GCC uses r3/r4 ... r11/r12 ... r14/r15 ... r30/r31
> 
> In older kernel code inline assembly was using %1 and %1+1 to represent
> 64 bits values. However here it looks like clang uses r31 as high part,
> allthough r32 doesn't exist hence the error.
> 
> Allthoug %1+1 should work, most places now use %L1 instead of %1+1, so
> let's do the same here.
> 
> With that change, the build doesn't fail anymore and a disassembly shows
> clang uses r17/r18 and r31/r14 pair when GCC would have used r16/r17 and
> r30/r31:

This does not fix the problem that somehow LLVM thinks that GPR31/FPR0
is a valid pair for two-register integer things (well, 31+1 in
assembler is not actually valid at all).  Quite worrying.

Maybe you can fix this in a more fundamental way?  In LLVM itself?

(The kernel patch of course is a nice workaround, if it in fact works
reliably, but a big fat comment here would be useful.  Pointing to the
LLVM problem report where this is tracked, etc.)


Segher
