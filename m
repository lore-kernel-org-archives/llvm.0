Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DC6CA6E;
	Fri,  4 Aug 2023 15:37:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBCFDC433C9;
	Fri,  4 Aug 2023 15:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691163471;
	bh=mt5Ji60FAR5+8lQOk93XriwWDzDewXtQ+KCXF2/Gd6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YXPCyhATE2Czm7FwPpMaHO5sdlzqA+RADqykAsGaZLfqL6dzhnSazlho9OC+JKXnM
	 ZJwg9zihnQruLCP74+UMgHgpTEi8SSSb+YLZlVvoZSILmY6paHHlvP0cG3MEwcMId1
	 cBSTUJvYxHGkQfAHbH/a9oHqI9rxllyz9G7BlWaP8QfXBnSOIuBeYSg4Wm0SDps6Nn
	 N7CIX30HlC5aBjh4vjoMtIHII/vwqVtz7UJwXfV5/cM+NvBEOq54+VgZxEys6kS9YM
	 M8Bd+fOoItG5D4pmBVK1Y/UHftTOTyxVhoKE7mV7SAM3u1tQv4jikIrZ1fxuxY5adz
	 yxJ/kG271kd/g==
Date: Fri, 4 Aug 2023 08:37:49 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Fangrui Song <maskray@google.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nathan Chancellor <natechancellor@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [stable:linux-4.14.y 4459/9999] lib/mpi/mpih-div.c:142:20:
 error: invalid use of a cast in a inline asm context requiring an lvalue:
 remove the cast or build with -fheinous-gnu-extensions
Message-ID: <20230804153749.GA2148888@dev-arch.thelio-3990X>
References: <202308040553.nMR9oB8v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202308040553.nMR9oB8v-lkp@intel.com>

On Fri, Aug 04, 2023 at 05:32:55AM +0800, kernel test robot wrote:
> Hi Fangrui,
> 
> First bad commit (maybe != root cause):
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.14.y
> head:   60a6e3043cc8b918c989707a5eba5fd6830a08a4
> commit: 71749b1181eca12af96654a781cabcd058c37c8f [4459/9999] Makefile: Fix GCC_TOOLCHAIN_DIR prefix for Clang cross compilation
> config: mips-randconfig-r035-20230731 (https://download.01.org/0day-ci/archive/20230804/202308040553.nMR9oB8v-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> reproduce: (https://download.01.org/0day-ci/archive/20230804/202308040553.nMR9oB8v-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308040553.nMR9oB8v-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> lib/mpi/mpih-div.c:142:20: error: invalid use of a cast in a inline asm context requiring an lvalue: remove the cast or build with -fheinous-gnu-extensions
>      142 |                                         umul_ppmm(n1, n0, d0, q);
>          |                                         ~~~~~~~~~~~~~~^~~~~~~~~~
>    lib/mpi/longlong.h:652:20: note: expanded from macro 'umul_ppmm'
>      652 |         : "=l" ((USItype)(w0)), \
>          |                 ~~~~~~~~~~^~~

This is the same as [1] but the upstream solution (b0c091ae04f6) could
cause breakage in 4.14 for compilers older than GCC 4.4; 4.14 claims to
support GCC 3.2 as a minimum version. An alternative solution if we care
about fixing this issue in 4.14 without any regression possiblity would
be something like:

diff --git a/lib/mpi/longlong.h b/lib/mpi/longlong.h
index 6c5229f98c9e..42076c124e23 100644
--- a/lib/mpi/longlong.h
+++ b/lib/mpi/longlong.h
@@ -639,7 +639,7 @@ do { \
 	**************  MIPS  *****************
 	***************************************/
 #if defined(__mips__) && W_TYPE_SIZE == 32
-#if (__GNUC__ >= 5) || (__GNUC__ >= 4 && __GNUC_MINOR__ >= 4)
+#if (__GNUC__ >= 5) || (__GNUC__ >= 4 && __GNUC_MINOR__ >= 4) || defined(__clang__)
 #define umul_ppmm(w1, w0, u, v)			\
 do {						\
 	UDItype __ll = (UDItype)(u) * (v);	\

[1]: https://lore.kernel.org/20230801202602.GA2589710@dev-arch.thelio-3990X/

Cheers,
Nathan
