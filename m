Received: from zg8tmtu5ljy1ljeznc42.icoremail.net (zg8tmtu5ljy1ljeznc42.icoremail.net [159.65.134.6])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A24E4175A
	for <llvm@lists.linux.dev>; Sat, 27 Apr 2024 05:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.65.134.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714195809; cv=none; b=emZyx2gUS1l2PjJpYaQyWxHWK8m5YVvuorR/aICqF80g4Uz5tiOOnIAn1msprumDhZGk85kT3Wq3N4xEK5Cd7goLSvrMkbOm0EDcMK2ICHDbStOFYOTjv28OQngg8eh9zv0rEU79pZFJ/xTaZZIT1l4GAXaoNxWsB7KREYT32kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714195809; c=relaxed/simple;
	bh=AyiRAE9yyigsWEtsZu2aQom5utJgcjUcYFict6b+lus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AVtFKpq078jiFREJOOoAUPQ3UrpPuRywiEzw/VKy533HIHP14/4jzZv96R4NFtAA6gvF/YYkX6fxdr2quUXE50HBDhhDJ0fU21u42u9+nqrK3mvS6kvVa7xzkOUSz40nRwHqp1aJcW+ltJcy+1gT4zJs7Wiu2SJrVQeoCT9YCeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=159.65.134.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with SMTP id HgEQrABHKKlVjSxmm8B7BQ--.1084S2;
	Sat, 27 Apr 2024 13:29:57 +0800 (CST)
Received: from [192.168.130.49] (unknown [61.242.129.158])
	by gateway (Coremail) with SMTP id _____wBXQyxNjSxmjmc7AQ--.59220S2;
	Sat, 27 Apr 2024 13:29:52 +0800 (CST)
Message-ID: <b13c30e0-b8eb-4d48-b937-1d7c11aedcde@hust.edu.cn>
Date: Sat, 27 Apr 2024 13:29:49 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] docs/zh_CN/rust: Update the translation of
 coding-guidelines to 6.9-rc4
To: Yanteng Si <siyanteng@loongson.cn>, ojeda@kernel.org, corbet@lwn.net,
 alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@samsung.com, aliceryhl@google.com, nathan@kernel.org,
 ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
 alexs@kernel.org
Cc: linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev
References: <cover.1714113680.git.siyanteng@loongson.cn>
 <e83b5dd929371d42889b19750e5e0385544e170f.1714113680.git.siyanteng@loongson.cn>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <e83b5dd929371d42889b19750e5e0385544e170f.1714113680.git.siyanteng@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HgEQrABHKKlVjSxmm8B7BQ--.1084S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWrtFWDJw13Aw45JF48Aw4kCrg_yoW8Jry7pF
	Wqkry5G3W3A3W2kFWxGF1fZr1UWFZ3Ca1rGa12qw1vvF4DtFn2v3srKr45KFZ2vr48tFWY
	qr1S9Fy3C3yjya7anT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQCb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_Jr
	v_JF1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxAIw2
	8IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_GFW3Jr1UJwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkvb40E47kJMIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E
	87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUBDDGUUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 2024/4/26 14:59, Yanteng Si wrote:
> Update to commit bc2e7d5c298a ("rust: support `srctree`-relative links")
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Looks good to me.

Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>

> ---
>   .../translations/zh_CN/rust/coding-guidelines.rst    | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/Documentation/translations/zh_CN/rust/coding-guidelines.rst b/Documentation/translations/zh_CN/rust/coding-guidelines.rst
> index 6c0bdbbc5a2a..419143b938ed 100644
> --- a/Documentation/translations/zh_CN/rust/coding-guidelines.rst
> +++ b/Documentation/translations/zh_CN/rust/coding-guidelines.rst
> @@ -157,6 +157,18 @@ https://commonmark.org/help/
>   
>   	https://doc.rust-lang.org/rustdoc/how-to-write-documentation.html
>   
> +此外，内核支持通过在链接目标前添加 ``srctree/`` 来创建相对于源代码树的链接。例如:
> +
> +.. code-block:: rust
> +
> +       //! C header: [`include/linux/printk.h`](srctree/include/linux/printk.h)
> +
> +或者:
> +
> +.. code-block:: rust
> +
> +       /// [`struct mutex`]: srctree/include/linux/mutex.h
> +
>   
>   命名
>   ----

