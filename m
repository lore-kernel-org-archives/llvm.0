Received: from zg8tmja2lje4os43os4xodqa.icoremail.net (zg8tmja2lje4os43os4xodqa.icoremail.net [206.189.79.184])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38C181531F2
	for <llvm@lists.linux.dev>; Sat, 31 Aug 2024 09:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.79.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725096886; cv=none; b=aQps5fP5AXhlrK7oI3jBg5mt8diJSdofkSATnOOnTRTqXSdIzilWugULg53lvDueSyxMZa0uEX4tiv9DRwBmTX2NPp62mX724V3RV4P7aIE/0l57k5uXql+QBwqEFwlPNd6pb3EN5yy5+RnZ3Fe9JNhXSlUmFuxbN1uYjdSOgxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725096886; c=relaxed/simple;
	bh=MR/bquMwAShwkaSAxEEYJ2hCVPOGKucoQiT9IMkWJuQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R+Q5y85EeIoXRo28i63N4rKCL8STIHhEX2pJvV76mIUKQbH+7YBDophAbpolTyK/fjZyPfl0WU9O299w8IkTld6r+uqDXxip/HpEkg1JfXA381y5jkqm6Yug+j/NyTgKFecWV2a7Vc5lW+h5dALkcU+MDxiYVKX0rwOQsUEtYWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=206.189.79.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app2 (Coremail) with SMTP id HwEQrAA34BSW49JmqDiiAA--.37814S2;
	Sat, 31 Aug 2024 17:34:14 +0800 (CST)
Received: from [192.168.1.4] (unknown [183.94.69.228])
	by gateway (Coremail) with SMTP id _____wBnb7+T49JmZZ3bAA--.26820S2;
	Sat, 31 Aug 2024 17:34:14 +0800 (CST)
Message-ID: <35904aa5-9851-4894-b953-689904bf33ca@hust.edu.cn>
Date: Sat, 31 Aug 2024 17:34:11 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/zh_CN: add the translation of
 kbuild/gcc-plugins.rst
To: Alex Shi <seakeel@gmail.com>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <siyanteng@loongson.cn>, Jonathan Corbet <corbet@lwn.net>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: hust-os-kernel-patches@googlegroups.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20240831034924.3729507-1-dzm91@hust.edu.cn>
 <0a434542-b207-4bb6-886e-74eff6cc9f39@gmail.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <0a434542-b207-4bb6-886e-74eff6cc9f39@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrAA34BSW49JmqDiiAA--.37814S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUOJ7k0a2IF6r1UM7kC6x804xWl1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
	x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8
	Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCF04k20x
	vE74AGY7Cv6cx26r4fZr1UJr1l4c8EcI0En4kS14v26r1Y6r17MxAqzxv26xkF7I0En4kS
	14v26r126r1DMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I
	0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
	tVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
	CY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAF
	wI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa
	7sRdnYzUUUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 2024/8/31 12:11, Alex Shi wrote:
>
> On 8/31/24 11:48 AM, Dongliang Mu wrote:
>> +目的
>> +=======
>> +
> there are still a lots of sign incorrect. Please be sure everything looks fine in a web browser after you 'make htmldocs'

What do you mean by "sign incorrect"? I check the html rendering in the 
vscode. It seems fine to me.

Dongliang Mu

>
> Thanks
>   

