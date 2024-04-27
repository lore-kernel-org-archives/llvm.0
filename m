Received: from hust.edu.cn (mail.hust.edu.cn [202.114.0.240])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 657A24175A
	for <llvm@lists.linux.dev>; Sat, 27 Apr 2024 05:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.114.0.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714195868; cv=none; b=W1tHiMMmAJOCt7SDbOPCz5TLZm0Yb6BsKPjeO0mkH/KC7DiVQCHWDtOzaBPxSfFO0+6ASNSiMk/vDmzP7p0iRyklMqphtJcuZtxrEAMWkyZY6ok79zHX4fvtVsil7hx5IS5ydcmma9SHBI+8Ta4TraqKDCoAg+TSSPSFnnxMky0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714195868; c=relaxed/simple;
	bh=gQ6pd6HdpasYOkUVAxHjo4/nz/0yNQyTuFD3C0k7BR0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TlhcAj7TQ3fA3g1rUrPWKqt5g7VG14bDDEfiMFKObXr0qxXstYLBcTdPh9+x1wHGRPJ9jKdetMdU78nwNVbxL/WKjgvsSzO9X1aqo63fT6H1bQL0FNny2mUpR0ZvrMeD4bzaHc4zT93hGMkOuxtLAPCHLlHk1/ou4gdcyn70u2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=202.114.0.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with SMTP id HwEQrACH38d4jSxmt0gKAQ--.35112S2;
	Sat, 27 Apr 2024 13:30:32 +0800 (CST)
Received: from [192.168.130.49] (unknown [61.242.129.158])
	by gateway (Coremail) with SMTP id _____wA3IS90jSxmG2g7AQ--.3489S2;
	Sat, 27 Apr 2024 13:30:30 +0800 (CST)
Message-ID: <9a17a6ba-d398-40ff-957a-a7c0e6123d07@hust.edu.cn>
Date: Sat, 27 Apr 2024 13:30:28 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] docs/zh_CN/rust: Update the translation of
 quick-start to 6.9-rc4
To: Yanteng Si <siyanteng@loongson.cn>, ojeda@kernel.org, corbet@lwn.net,
 alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, nathan@kernel.org,
 ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
 alexs@kernel.org
Cc: linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev
References: <cover.1714113680.git.siyanteng@loongson.cn>
 <aff560c262f255e873c07cc66891cf8140ad433d.1714113680.git.siyanteng@loongson.cn>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <aff560c262f255e873c07cc66891cf8140ad433d.1714113680.git.siyanteng@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrACH38d4jSxmt0gKAQ--.35112S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW3Jw17CFW7urW7Aw4kuFyUZFb_yoW7tr4kpF
	1q9r93ua1fAFy8ZryxCFyUZF15Ca1rZa4Iqw1DXay2krs5JFZ7Kw4Iyry3Gw43Z3yxArW2
	gF1Uury29rs3CFDanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQSb7Iv0xC_Zr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	1Y6r17M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04
	k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7Cj
	xVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxU3ZjjDUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 2024/4/26 15:02, Yanteng Si wrote:
> Update to commit 711cbfc71765 ("docs: rust: Clarify that 'rustup
> override' applies to build directory")
> commit 7583ce66ddf7 ("docs: rust: remove `CC=clang` mentions")
> commit 2285eb2f2429 ("docs: rust: clarify what 'rustup override' does")
> commit 8cb40124cf92 ("docs: rust: update instructions for obtaining
> 'core' source")
> commit b603c6cc405a ("docs: rust: add command line to rust-analyzer
> section")
> commit 08ab786556ff ("rust: bindgen: upgrade to 0.65.1")
> commit eae90172c5b8 ("docs: rust: add paragraph about finding a
> suitable `libclang`")
> commit 6883b29c6cae ("docs: rust: point directly to the standalone
> installers")
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Looks good to me.

Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>

> ---
>   .../translations/zh_CN/rust/quick-start.rst   | 50 +++++++++++++------
>   1 file changed, 34 insertions(+), 16 deletions(-)
>
> diff --git a/Documentation/translations/zh_CN/rust/quick-start.rst b/Documentation/translations/zh_CN/rust/quick-start.rst
> index a4b8e8a50a89..8616556ae4d7 100644
> --- a/Documentation/translations/zh_CN/rust/quick-start.rst
> +++ b/Documentation/translations/zh_CN/rust/quick-start.rst
> @@ -37,13 +37,18 @@ rustc
>   需要一个特定版本的Rust编译器。较新的版本可能会也可能不会工作，因为就目前而言，内核依赖
>   于一些不稳定的Rust特性。
>   
> -如果使用的是 ``rustup`` ，请进入检出的源代码目录并运行::
> +如果使用的是 ``rustup`` ，请进入内核编译目录（或者用 ``--path=<build-dir>`` 参数
> +来 ``设置`` sub-command)并运行::
>   
>   	rustup override set $(scripts/min-tool-version.sh rustc)
>   
> -或者从以下网址获取一个独立的安装程序或安装 ``rustup`` ：
> ++这将配置你的工作目录使用正确版本的 ``rustc``，而不影响你的默认工具链。
>   
> -	https://www.rust-lang.org
> +请注意覆盖应用当前的工作目录（和它的子目录）。
> +
> +如果你使用 ``rustup``， 可以从下面的链接拉取一个单独的安装程序:
> +
> +	https://forge.rust-lang.org/infra/other-installation-methods.html#standalone
>   
>   
>   Rust标准库源代码
> @@ -57,21 +62,23 @@ Rust标准库的源代码是必需的，因为构建系统会交叉编译 ``core
>   
>   这些组件是按工具链安装的，因此以后升级Rust编译器版本需要重新添加组件。
>   
> -否则，如果使用独立的安装程序，可以将Rust仓库克隆到工具链的安装文件夹中::
> +否则，如果使用独立的安装程序，可以将Rust源码树下载到安装工具链的文件夹中::
>   
> -	git clone --recurse-submodules \
> -		--branch $(scripts/min-tool-version.sh rustc) \
> -		https://github.com/rust-lang/rust \
> -		$(rustc --print sysroot)/lib/rustlib/src/rust
> +       curl -L "https://static.rust-lang.org/dist/rust-src-$(scripts/min-tool-version.sh rustc).tar.gz" |
> +               tar -xzf - -C "$(rustc --print sysroot)/lib" \
> +               "rust-src-$(scripts/min-tool-version.sh rustc)/rust-src/lib/" \
> +               --strip-components=3
>   
> -在这种情况下，以后升级Rust编译器版本需要手动更新这个克隆的仓库。
> +在这种情况下，以后升级Rust编译器版本需要手动更新这个源代码树（这可以通过移除
> +``$(rustc --print sysroot)/lib/rustlib/src/rust`` ，然后重新执行上
> +面的命令做到）。
>   
>   
>   libclang
>   ********
>   
>   ``bindgen`` 使用 ``libclang`` （LLVM的一部分）来理解内核中的C代码，这意味着需要安
> -装LLVM；同在开启 ``CC=clang`` 或 ``LLVM=1`` 时编译内核一样。
> +装LLVM；同在开启``LLVM=1`` 时编译内核一样。
>   
>   Linux发行版中可能会有合适的包，所以最好先检查一下。
>   
> @@ -94,7 +101,20 @@ bindgen
>   
>   通过以下方式安装它（注意，这将从源码下载并构建该工具）::
>   
> -	cargo install --locked --version $(scripts/min-tool-version.sh bindgen) bindgen
> +	cargo install --locked --version $(scripts/min-tool-version.sh bindgen) bindgen-cli
> +
> +``bindgen`` 需要找到合适的 ``libclang`` 才能工作。如果没有找到（或者找到的
> +``libclang`` 与应该使用的 ``libclang`` 不同），则可以使用 ``clang-sys``
> +理解的环境变量（Rust绑定创建的 ``bindgen`` 用来访问 ``libclang``）:
> +
> +
> +* ``LLVM_CONFIG_PATH`` 可以指向一个 ``llvm-config`` 可执行文件。
> +
> +* 或者 ``LIBCLANG_PATH`` 可以指向 ``libclang`` 共享库或包含它的目录。
> +
> +* 或者 ``CLANG_PATH`` 可以指向 ``clang`` 可执行文件。
> +
> +详情请参阅 ``clang-sys`` 的文档:
>   
>   
>   开发依赖
> @@ -163,7 +183,9 @@ rust-analyzer
>   一起使用，以实现语法高亮、补全、转到定义和其他功能。
>   
>   ``rust-analyzer`` 需要一个配置文件， ``rust-project.json``, 它可以由 ``rust-analyzer``
> -Make 目标生成。
> +Make 目标生成::
> +
> +       make LLVM=1 rust-analyzer
>   
>   
>   配置
> @@ -189,10 +211,6 @@ Rust支持（CONFIG_RUST）需要在 ``General setup`` 菜单中启用。在其
>   
>   	make LLVM=1
>   
> -对于不支持完整LLVM工具链的架构，使用::
> -
> -	make CC=clang
> -
>   使用GCC对某些配置也是可行的，但目前它是非常试验性的。
>   
>   

