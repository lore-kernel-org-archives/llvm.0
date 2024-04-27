Received: from zg8tmja2lje4os43os4xodqa.icoremail.net (zg8tmja2lje4os43os4xodqa.icoremail.net [206.189.79.184])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D682641757
	for <llvm@lists.linux.dev>; Sat, 27 Apr 2024 05:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.79.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714195809; cv=none; b=Xt7Kn0VfqDSWWTRDtzjbR6MBnD3QBpSZtcn3clUj8DBoeC5jcXNeAYY2lnT8NxLd9ZY4BfSC1LzQ7gKXiibNctLyB0KXrofyu3AFQ0hh5zCr5SzFuwi2ZYrdNztEPq2RpbzbuzYj1E5qMeubDvfVqqWYSbSch35pf8Fe5xEf/xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714195809; c=relaxed/simple;
	bh=KTsCJMHRLKqmgeETLE/O2lS3v9IJ15G/SkJgvACXWhg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dPTnKsmW+86c2OF9w+1HkBvyeFurcWjtsmoO50kD+MVQCxFf8Nqb3HwG8o+0rey5UqyWjguV4/aGbY9472+CS0BAa8rxY3k8az+SB4crCBVf+pI733w0Sen//+4XAKcw0aSkj9msUNrFdmhtRKys/p2qiCSKkgS2+qlFpOBVzhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=206.189.79.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with SMTP id HgEQrAAHo4A5jSxmyL97BQ--.23124S2;
	Sat, 27 Apr 2024 13:29:29 +0800 (CST)
Received: from [192.168.130.49] (unknown [61.242.129.158])
	by gateway (Coremail) with SMTP id _____wC3+TU1jSxmRmc7AQ--.46385S2;
	Sat, 27 Apr 2024 13:29:28 +0800 (CST)
Message-ID: <fe4654fc-75ff-4e66-94eb-1c1cb5d5bed7@hust.edu.cn>
Date: Sat, 27 Apr 2024 13:29:25 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] docs/zh_CN/rust: Update the translation of
 arch-support to 6.9-rc4
To: Yanteng Si <siyanteng@loongson.cn>, ojeda@kernel.org, corbet@lwn.net,
 alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, nathan@kernel.org,
 ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
 alexs@kernel.org
Cc: linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev
References: <cover.1714113680.git.siyanteng@loongson.cn>
 <e61eee747275c4e258416e079315b8e23fe3fde5.1714113680.git.siyanteng@loongson.cn>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <e61eee747275c4e258416e079315b8e23fe3fde5.1714113680.git.siyanteng@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HgEQrAAHo4A5jSxmyL97BQ--.23124S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFy5Cr18XrWfJF4kJF4kXrb_yoW8tF4fp3
	WDCryxJF1UJryUGr17Wr1UXr1UGr18G34UJr18Ga47Xr4DJF18Jr1UtFn8Jr1Uur18AryU
	JF1UGryUJw4UAFUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQFb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_Jr
	v_JF1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxAIw2
	8IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_GFW3Jr1UJwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j6a0QUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 2024/4/26 14:59, Yanteng Si wrote:
> Update to commit 81889e8523e6 ("RISC-V: enable building
> 64-bit kernels with rust support")
> commit 01848eee20c6 ("docs: rust: fix improper rendering in
> Arch Supportpage")
> commit 724a75ac9542 ("arm64: rust: Enable Rust support
> for AArch64")
> commit 90868ff9cade ("LoongArch: Enable initial Rust support")
> commit e5e86572e3f2 ("rust: sort uml documentation arch support table")
> commit 04df97e150c8 ("Documentation: rust: Fix arch support table")
> commit 0438aadfa69a ("rust: arch/um: Add support for CONFIG_RUST
> under x86_64 UML")
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Looks good to me.

Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>

> ---
>   .../translations/zh_CN/rust/arch-support.rst       | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/translations/zh_CN/rust/arch-support.rst b/Documentation/translations/zh_CN/rust/arch-support.rst
> index afbd02afec45..abd708d48f82 100644
> --- a/Documentation/translations/zh_CN/rust/arch-support.rst
> +++ b/Documentation/translations/zh_CN/rust/arch-support.rst
> @@ -16,8 +16,12 @@
>   
>   下面是目前可以工作的架构的一般总结。支持程度与 ``MAINTAINERS`` 文件中的``S`` 值相对应:
>   
> -============  ================  ==============================================
> -架构          支持水平          限制因素
> -============  ================  ==============================================
> -``x86``       Maintained        只有 ``x86_64``
> -============  ================  ==============================================
> +=============  ================  ==============================================
> +架构           支持水平           限制因素
> +=============  ================  ==============================================
> +``arm64``      Maintained        只有小端序
> +``loongarch``  Maintained        \-
> +``riscv``      Maintained        只有 ``riscv64``
> +``um``         Maintained        只有 ``x86_64``
> +``x86``        Maintained        只有 ``x86_64``
> +=============  ================  ==============================================

