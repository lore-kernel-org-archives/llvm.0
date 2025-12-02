Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EFE284B25;
	Tue,  2 Dec 2025 21:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764709325; cv=none; b=HdKSTck2BOxdUUcz3ytsfBcKo1MzCBhc4gQ0BbAPZP1f9ZVGBqP4KTv+xLnIhP2MhbOk7uXWfSBP5ukQ7TycDooBs+OSvPnHvtmCC3R/soKgYeEDqhYrllBgbhCz0mEWodbx+nEfC3xcO/TKNAprKReHk/az+Vigv6+/TUSLX7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764709325; c=relaxed/simple;
	bh=+4Wjf5/tvkfcNaHMnxJOkU6cLkTlP2V+XNGZf231ezM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LtQ9JuffqoP1uovidPYpiMc4sPqpyBuWBI3QESQ94Q9K6oI4dlYDay8vINugHo6nAaWzbtYWH4YdVahR+5z6PpF9HE5Au0RfQQ5U+5Bz8vutvohqKeGjaRcrStUepVtlC1zb+Emgi2QUCdLYuaUXMLQR5nnxTQcyS3wnGFNckpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sPnruIBM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sPnruIBM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 337F6C4CEF1;
	Tue,  2 Dec 2025 21:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764709325;
	bh=+4Wjf5/tvkfcNaHMnxJOkU6cLkTlP2V+XNGZf231ezM=;
	h=Date:Reply-To:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sPnruIBMcVC5iPE8sAS6XVE8QAuH/o46LtIXaNJ9ZU1JAn3OzU6NIyvJYsQsz0v+R
	 WGilOCd8bTa5GJ9mvkvX2NUxzmk2iFmIsEj78ZOKxNPm8nTY2w5sHxWbqKWdVGhNl4
	 oDt2xSLP3j2dpypvRUbecT70tuXInp7iiQGUG9mq+rc5xRdkXWjj59Q32IlfC2iaXV
	 tjzLMDHPMjRwGzKpXOw53HrX8f7Tts6Rpakf+bV4AHGo8tgspoPDj0VRUkZkanZ5ns
	 9/9j2jbrySWsChCfSJgF4hjx+sC/1h1hykNzd5k8KtQSML0a2PJzR90+uT/1N/6sQk
	 uMbgkupzbu42Q==
Message-ID: <3447801b-95f7-4368-a433-e79669b5d22e@kernel.org>
Date: Tue, 2 Dec 2025 22:02:02 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Daniel Gomez <da.gomez@kernel.org>
Subject: Re: [linux-next:master 4752/13171] error[E0609]: no field
 `__bindgen_anon_1` on type `bindings::kernel_param`
To: kernel test robot <lkp@intel.com>,
 Andreas Hindborg <a.hindborg@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Benno Lossin <lossin@kernel.org>
References: <202512020454.Tf36WHw5-lkp@intel.com>
Content-Language: en-US
From: Daniel Gomez <da.gomez@kernel.org>
Organization: kernel.org
In-Reply-To: <202512020454.Tf36WHw5-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 01/12/2025 21.20, kernel test robot wrote:
> Hi Andreas,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a
> commit: 0b08fc292842a13aa496413b48c1efb83573b8c6 [4752/13171] rust: introduce module_param module
> config: arm64-randconfig-001-20251202 (https://download.01.org/0day-ci/archive/20251202/202512020454.Tf36WHw5-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020454.Tf36WHw5-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202512020454.Tf36WHw5-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> error[E0609]: no field `__bindgen_anon_1` on type `bindings::kernel_param`
>    --> rust/kernel/module_param.rs:78:46
>    |
>    78 |         let container = unsafe { &*((*param).__bindgen_anon_1.arg.cast::<SetOnce<T>>()) };
>    |                                              ^^^^^^^^^^^^^^^^ unknown field
>    |
>    = note: available field is: `_address`
> 

I can't replicate this issue either.

I've added these patches to fix other unrelated build issues, so, I'm not sure
how 0day ended up skipping them? Perhaps it uses head 95cb2fd6c? + bisect?

a74b6c0e53a6d um: Don't rename vmap to kernel_vmap
f74cf399e02e2 rust: debugfs: Replace the usage of Rust native atomics 
013f912eb5fa7 rust: sync: atomic: Implement Debug for Atomic<Debug> 
14e9a18b07ec4 rust: sync: atomic: Make Atomic*Ops pub(crate)

My testing branch:
https://git.kernel.org/pub/scm/linux/kernel/git/da.gomez/linux.git/log/?h=20251202-0day-test-0b08fc292842-with-fixes

FWIW, this is what I've tried:

rustc --version --verbose
rustc 1.88.0 (6b00bc388 2025-06-23)
binary: rustc
commit-hash: 6b00bc3880198600130e1cf62b8f8a93494488cc
commit-date: 2025-06-23
host: x86_64-unknown-linux-gnu
release: 1.88.0
LLVM version: 20.1.5

bindgen --version --verbose
bindgen 0.72.1
Clang: Debian clang version 21.1.5 (1)

rm -rfv build_dir/
mkdir -p build_dir/
wget https://download.01.org/0day-ci/archive/20251202/202512020454.Tf36WHw5-lkp@intel.com/config -O build_dir/.config

COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang-22 ~/lkp-tests/kbuild/make.cross W=1 O=build_dir ARCH=arm64 rustavailable
COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang-22 ~/lkp-tests/kbuild/make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang-22 ~/lkp-tests/kbuild/make.cross W=1 O=build_dir ARCH=arm64 prepare
COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang-22 ~/lkp-tests/kbuild/make.cross W=1 O=build_dir ARCH=arm64 -j$(nproc)

grep -i "bindgen\|rustc\|llv\|clang" build_dir/.config
CONFIG_CC_VERSION_TEXT="ClangBuiltLinux clang version 22.0.0git (https://github.com/llvm/llvm-project.git e19fa930ca838715028c00c234874d1db4f93154)"
CONFIG_CC_IS_CLANG=y
CONFIG_CLANG_VERSION=220000
CONFIG_AS_IS_LLVM=y
CONFIG_RUSTC_VERSION=108800
CONFIG_RUSTC_LLVM_VERSION=200105
CONFIG_RUSTC_HAS_COERCE_POINTEE=y
CONFIG_RUSTC_HAS_SPAN_FILE=y
CONFIG_RUSTC_HAS_UNNECESSARY_TRANSMUTES=y
CONFIG_RUSTC_VERSION_TEXT="rustc 1.88.0 (6b00bc388 2025-06-23)"
CONFIG_BINDGEN_VERSION_TEXT="bindgen 0.72.1"
CONFIG_RUSTC_SUPPORTS_ARM64=y
CONFIG_CLANG_SUPPORTS_DYNAMIC_FTRACE_WITH_ARGS=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=y
CONFIG_HAS_LTO_CLANG=y
# CONFIG_LTO_CLANG_THIN is not set
CONFIG_HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC=y

Build succeeds without issues (warnings, yes).
