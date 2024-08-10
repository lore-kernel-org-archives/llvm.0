Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [20.231.56.155])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 091CE4779F
	for <llvm@lists.linux.dev>; Sat, 10 Aug 2024 06:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=20.231.56.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723273144; cv=none; b=oSaGyohW3Xcxwvt0tC1VEQyxjbfuArSQ8KDdAW5MEr0dB2Rhqa4QG00ZRd5vQ8Dpn0YGF8ybQz0dkaFjK+Sq+JuM37g9P0m3n4oKzyJE5aejnfIAzBNtaFpVsSMd+qEwGaumM5UVtmk3BjE7bN/sNp7Rloy3fIxvZgELv6fDEZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723273144; c=relaxed/simple;
	bh=cIqDN/pSY+8JChTZBiL1uAX4CFKJE+LpR8rYOQwaJp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gZ2Cs0NIAo2at0ieoqFMAJrtokWTCyjqB56ESrqx52DyUh7CZqZ8SKa6GN/DZyqLJ8qlN87stFxaYmlCRUAsqeN/GROEpySYH1oT5u0Qjb21Ofs9LjnKWuKJ8j2CLYz57cboc6lByuUHhhPUzJ+a09cTOSGGh4kvc5qGCj/Q5PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=20.231.56.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with SMTP id HgEQrACXnHybD7dmOAIpAw--.13472S2;
	Sat, 10 Aug 2024 14:58:35 +0800 (CST)
Received: from [192.168.1.111] (unknown [10.12.177.116])
	by gateway (Coremail) with SMTP id _____wDn77+ZD7dmlpoEAA--.7043S2;
	Sat, 10 Aug 2024 14:58:34 +0800 (CST)
Message-ID: <aeebfd95-200c-4856-9067-6cf49931d840@hust.edu.cn>
Date: Sat, 10 Aug 2024 14:58:28 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] docs/zh_CN: Add dev-tools/kcsan Chinese translation
To: YanTeng Si <si.yanteng@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
 Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: hust-os-kernel-patches@googlegroups.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20240807162720.46588-1-tttturtleruss@hust.edu.cn>
 <d6eec1da-0e79-432f-a5cf-7dc8c59f28c1@hust.edu.cn>
 <87r0b0th7l.fsf@trenco.lwn.net>
 <c4ffaae1-59a0-4837-a965-441af4851d2a@hust.edu.cn>
 <25b4c3e0-784d-41ea-8ff3-8cb175983676@linux.dev>
 <2e27c607-713f-48f2-9a2e-41f7c61f7e73@linux.dev>
Content-Language: en-US
From: Haoyang Liu <tttturtleruss@hust.edu.cn>
In-Reply-To: <2e27c607-713f-48f2-9a2e-41f7c61f7e73@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HgEQrACXnHybD7dmOAIpAw--.13472S2
Authentication-Results: app1; spf=neutral smtp.mail=tttturtleruss@hust
	.edu.cn;
X-Coremail-Antispam: 1UD129KBjvdXoWrtFWxuFW3tF1rKry3Xr15twb_yoWDCFg_Cw
	1ay3Z2kr4DAr409Fn7Gw45Jw4DWa98Wa13Gw1rJa1rJwnxZF4UCr1DWwn3Xwn3Aa10krs0
	qF1UuF1Utry7WjkaLaAFLSUrUUUU8b8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbm8YjsxI4VWxJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM280x2IEY4vEnII2IxkI6r1a6r45M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxV
	AFwI0_GcCE3s1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04
	k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jN2-5UUUUU=
X-CM-SenderInfo: rxsqjiqrssiko6kx23oohg3hdfq/1tbiAQsFAma237IJvQAAsE


On 8/9/24 10:57 AM, YanTeng Si wrote:
>
> 在 2024/8/9 18:44, YanTeng Si 写道:
>> Hi Haoyang,
>>
>> 在 2024/8/8 0:48, Haoyang Liu 写道:
>>>
>>> 在 2024/8/8 0:45, Jonathan Corbet 写道:
>>>> Haoyang Liu <tttturtleruss@hust.edu.cn> writes:
>>>>
>>>>> This is a mistake but I missed it before sending this patch.
>>>>>
>>>>> What should I do to revert or correct this patch?
>>>>>
>>>>> Thanks for your help and patience.
>>>> Send a v6 with the correction made - but wait a while for other 
>>>> reviews
>>>> first.
>>>
>>> OK.
>>>
>> The doc is good enough for me, so you can send a v6 after fix the typo.
>>
>>
>> Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
>
> I am Sorry! It seems that I've permanently lost access to 
> siyanteng@loongson.cn account,
>
> So you need use  --suppress-cc=sob when you send-email and pick my 
> Reviewed-by tag.

Hi Yanteng,


OK, I will send a v6 soon.


Thanks,

Haoyang

>
>
> Thanks,
>
> Yanteng
>
>>
>>
>> Thanks,
>>
>> Yanteng
>>
>>>
>>> Thank you,
>>>
>>> Haoyang
>>>
>>>>
>>>> Thanks,
>>>>
>>>> jon
>>>
>>>
>>

