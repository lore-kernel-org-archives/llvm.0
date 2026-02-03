Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3091509AB;
	Tue,  3 Feb 2026 03:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770090968; cv=none; b=o0Mp8S3Zb1X9kyajZBSMzPU54qkGTgtj9UF7WEWPOpvAgU0UdyGPdq9WxA3vjshCyy4rG0wVe9iJaeni8QKv2eS3u1szHhHoipbugOP814xSO05RndeI7WMWtGgbz9tii6/H9ys7ZwbVsZaysZWl3HM3KVuGSYcSI0dbXAtb8ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770090968; c=relaxed/simple;
	bh=eA+hkGu1GKtp/CM+ELiCEta8OruAjZJBV29cs/fedSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RUhtj1SD0dEuDLhr9Q6e63h1RJmmXFUmDvSttAIGy7Va0V+TTzyyxlF9W0xRJE9Gn7ZinOnLShuqFus9FiZFk6C/zJ1fn2VsfMcS7baSaxuFUprkUQWw0F1kUB0a2kOPK9eIVevs1RhdivsNC5WGsCDRUAHTY+H0L36Px8jVjqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BoB+dEKh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BoB+dEKh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15F13C116D0;
	Tue,  3 Feb 2026 03:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770090967;
	bh=eA+hkGu1GKtp/CM+ELiCEta8OruAjZJBV29cs/fedSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BoB+dEKhynBTcCBBOJQbRFe4J+IXQE+sPqp47Okc6wTh4BXUxwyZLpniIlcXopb0B
	 DfRxXrJ93vGqaEk4str64mMdpXTgPza1nSefK09O/NegIQuZNOEXyoUNIA0/HL1RLf
	 sNTPBGr2O1QoH7DYFzeeu62uMj+QuEAtb1zBGsuV3pp/w4PV4CQ6JyaeJQV8NsRPq8
	 E9ilWdrmLP4GMQNtjNqTPZjI/aGt1ptiKQUgQ1aRlOE6XPDp0rUcVJp/IH9Y8x53pU
	 QKjaxJRFo4xMqAI6Y9zksCoZmgisoB56ZP7MpoBhN3GTfSruTkEfThKG6x6K0NMu2A
	 ZopWV+lPpvKzw==
Date: Mon, 2 Feb 2026 20:56:03 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: Re: kernel/futex/core.c:604:23: error: cannot jump from this asm
 goto statement to one of its possible targets
Message-ID: <20260203035603.GC52989@ax162>
References: <202602030343.HVSlSqJ1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202602030343.HVSlSqJ1-lkp@intel.com>

On Tue, Feb 03, 2026 at 03:34:29AM +0800, kernel test robot wrote:
> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   18f7fcd5e69a04df57b563360b88be72471d6b62
> commit: e4e28fd6986e8cf963ec4137e6c0b95403f636ab futex: Convert to get/put_user_inline()
> date:   3 months ago
> config: powerpc64-randconfig-001-20260203 (https://download.01.org/0day-ci/archive/20260203/202602030343.HVSlSqJ1-lkp@intel.com/config)
> compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260203/202602030343.HVSlSqJ1-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602030343.HVSlSqJ1-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> kernel/futex/core.c:604:23: error: cannot jump from this asm goto statement to one of its possible targets
>                    if (node_updated && put_user_inline(node, naddr))
>                                        ^
>    include/linux/uaccess.h:870:3: note: expanded from macro 'put_user_inline'
>                    unsafe_put_user(val, _tmpdst, efault);          \
>                    ^
>    include/linux/uaccess.h:616:2: note: expanded from macro 'unsafe_put_user'
>            arch_unsafe_put_user(x, ptr, local_label);      \
>            ^
>    arch/powerpc/include/asm/uaccess.h:463:2: note: expanded from macro 'arch_unsafe_put_user'
>            __put_user_size_goto((__typeof__(*(p)))(x), (p), sizeof(*(p)), e)
>            ^
>    arch/powerpc/include/asm/uaccess.h:127:10: note: expanded from macro '__put_user_size_goto'
>            case 1: __put_user_asm_goto(x, __pus_addr, label, "stb"); break;        \
>                    ^
>    arch/powerpc/include/asm/uaccess.h:87:2: note: expanded from macro '__put_user_asm_goto'
>            asm goto(                                       \
>            ^
>    kernel/futex/core.c:604:23: note: possible target of asm goto statement
>    include/linux/uaccess.h:870:3: note: expanded from macro 'put_user_inline'
>                    unsafe_put_user(val, _tmpdst, efault);          \
>                    ^
>    include/linux/uaccess.h:618:2: note: expanded from macro 'unsafe_put_user'
>            local_label:                                    \
>            ^
>    kernel/futex/core.c:604:23: note: jump exits scope of variable with __attribute__((cleanup))
>    include/linux/uaccess.h:869:2: note: expanded from macro 'put_user_inline'
>            scoped_user_write_access(_tmpdst, efault)               \
>            ^
>    include/linux/uaccess.h:803:2: note: expanded from macro 'scoped_user_write_access'
>            scoped_user_write_access_size(udst, sizeof(*(udst)), elbl)
>            ^
>    include/linux/uaccess.h:791:2: note: expanded from macro 'scoped_user_write_access_size'
>            __scoped_user_access(write, udst, size, elbl)
>            ^
>    include/linux/uaccess.h:755:36: note: expanded from macro '__scoped_user_access'
>                    for (CLASS(user_##mode##_access, scope)(_tmpptr); !done; done = true)   \
>                                                     ^
>    kernel/futex/core.c:604:23: note: jump bypasses initialization of variable with __attribute__((cleanup))
>    include/linux/uaccess.h:869:2: note: expanded from macro 'put_user_inline'
>            scoped_user_write_access(_tmpdst, efault)               \
>            ^
>    include/linux/uaccess.h:803:2: note: expanded from macro 'scoped_user_write_access'
>            scoped_user_write_access_size(udst, sizeof(*(udst)), elbl)
>            ^
>    include/linux/uaccess.h:791:2: note: expanded from macro 'scoped_user_write_access_size'
>            __scoped_user_access(write, udst, size, elbl)
>            ^
>    include/linux/uaccess.h:755:36: note: expanded from macro '__scoped_user_access'
>                    for (CLASS(user_##mode##_access, scope)(_tmpptr); !done; done = true)   \
>                                                     ^

This appears to be the same error that necessitated e2ffa15b9baa ("kbuild:
Disable CC_HAS_ASM_GOTO_OUTPUT on clang < 17") upstream but this is just
regular 'asm goto', not 'asm goto' with outputs. I had noted during
review that change might not be sufficient to avoid the error in all
cases:

  https://lore.kernel.org/20250916184440.GA1245207@ax162/

This is not the only recent instance of this error because cleanup
macros are becoming quite popular so I think it is getting to the point
where we will need to raise the minimum supported version of LLVM for
building the kernel to 17.0.1 or newer to ensure that we have this
fixed. LLVM 22.1.0 should be released in a month or so, so I can look at
crafting a series for 7.1/7.2 that does this bump.

Cheers,
Nathan
