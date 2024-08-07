Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net (zg8tmja2lje4os4yms4ymjma.icoremail.net [206.189.21.223])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAC1012C7FD
	for <llvm@lists.linux.dev>; Wed,  7 Aug 2024 16:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.21.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723049348; cv=none; b=VADNAZPkKOig+2oMT96MRrV94TYTQF03VrPjzL4X+1+QeAnieKjo5MntXiM3Q+dqw9JlPV3cek7WutTBK/pLfXfakVgvi/EwXBy8+n6Ju9mHnYCa7qYcrsZQEdopYH1BVAZDYs1AVj9fy1s57D18OAUe0A8bs+5t7dw1hY6ztWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723049348; c=relaxed/simple;
	bh=nVhnXvFpToGDoik+8OyZ2VjT0EjakHNiKOpCLt37pZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jP04qzvhiwxX2JUyY2DYDiBS1bNx2xwHGNEztahcAeLSlfwYrEVTE4AAwKeqehK34geg3M6b+P4P6kdYIJrSCICx1oYa5hBv6IGJiIL4CUPqlzZygxu/NXMYAmtZYzlKgLV8xja0kPEwZr1DxWcUwvneWLK87nOvYyusRCjECBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=206.189.21.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app2 (Coremail) with SMTP id HwEQrACXn7dTpbNmkl9uAA--.37803S2;
	Thu, 08 Aug 2024 00:48:19 +0800 (CST)
Received: from [192.168.132.127] (unknown [58.19.99.130])
	by gateway (Coremail) with SMTP id _____wCXH3JRpbNmYyjlAA--.33216S2;
	Thu, 08 Aug 2024 00:48:19 +0800 (CST)
Message-ID: <c4ffaae1-59a0-4837-a965-441af4851d2a@hust.edu.cn>
Date: Thu, 8 Aug 2024 00:48:14 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] docs/zh_CN: Add dev-tools/kcsan Chinese translation
To: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <siyanteng@loongson.cn>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: hust-os-kernel-patches@googlegroups.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20240807162720.46588-1-tttturtleruss@hust.edu.cn>
 <d6eec1da-0e79-432f-a5cf-7dc8c59f28c1@hust.edu.cn>
 <87r0b0th7l.fsf@trenco.lwn.net>
From: Haoyang Liu <tttturtleruss@hust.edu.cn>
In-Reply-To: <87r0b0th7l.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrACXn7dTpbNmkl9uAA--.37803S2
Authentication-Results: app2; spf=neutral smtp.mail=tttturtleruss@hust
	.edu.cn;
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUOq7k0a2IF6F4UM7kC6x804xWl1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
	x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8
	Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI
	0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0U
	Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VACjcxG62k0Y48FwI0_Cr1j6rxdMcIj6x8Erc
	xFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbVWU
	JVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr
	1UJr1l4c8EcI0En4kS14v26r1Y6r17MxAqzxv26xkF7I0En4kS14v26r126r1DMxC20s02
	6xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r4a6rW5MI8I3I0E5I8CrVAFwI0_Jr0_Jr
	4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxG
	rwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJw
	CI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2
	z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUjWCJPUUUUU==
X-CM-SenderInfo: rxsqjiqrssiko6kx23oohg3hdfq/1tbiAQsCAmay6zI7XAACsi


在 2024/8/8 0:45, Jonathan Corbet 写道:
> Haoyang Liu <tttturtleruss@hust.edu.cn> writes:
>
>> This is a mistake but I missed it before sending this patch.
>>
>> What should I do to revert or correct this patch?
>>
>> Thanks for your help and patience.
> Send a v6 with the correction made - but wait a while for other reviews
> first.

OK.


Thank you,

Haoyang

>
> Thanks,
>
> jon

