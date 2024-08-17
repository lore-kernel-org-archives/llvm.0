Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD08A78C92
	for <llvm@lists.linux.dev>; Sat, 17 Aug 2024 04:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.161.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723870790; cv=none; b=eibHQj6owbFqIF0XYN2m6O/l+m/Cz0rT3UxVAtmriSrwvPR2jpOVZDgq6qW+0FmKv3Ru9dT3lU4iOGJkqDfAHGZvgbd55FNhEzzMHskZ/zB5mnSYuelzz5WlcPBiac2R9lL03SVnHolKKyxu3J4SyGO18YA74G7NjU1CMs6FzEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723870790; c=relaxed/simple;
	bh=2S+QbEWGme4zIg1L2rhpubtJ7u7R8DG0G9w8lDVn/oA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tndmpSTPDSb/X1+rfvdUB0hlEeFVfKQzAxdIPzJX6LX00da+kyufV5MRgBaraSZwjY6UiiUVO3UkZfNFtBqsTglKwRoGPBKMi11tVGOgtulRYj7lhB+KNMzkPtmVrk+I9HDoNzp8JcOL8j6LJcwgvc07ZdVrgQzZJELcHM9h8hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=162.243.161.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with SMTP id HgEQrAC3vzspLsBmq_XPAw--.30524S2;
	Sat, 17 Aug 2024 12:59:21 +0800 (CST)
Received: from [172.20.10.4] (unknown [1.48.198.69])
	by gateway (Coremail) with SMTP id _____wCHlXglLsBmXC9KAQ--.38422S2;
	Sat, 17 Aug 2024 12:59:21 +0800 (CST)
Message-ID: <64426130-d59a-47a1-8bf2-3b72fb0cc030@hust.edu.cn>
Date: Sat, 17 Aug 2024 12:59:16 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] docs/zh_CN: Add dev-tools/kcsan Chinese translation
To: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
 Yanteng Si <siyanteng@loongson.cn>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: hust-os-kernel-patches@googlegroups.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20240810082245.5934-1-tttturtleruss@hust.edu.cn>
 <87ttfkhzl2.fsf@trenco.lwn.net>
From: Haoyang Liu <tttturtleruss@hust.edu.cn>
In-Reply-To: <87ttfkhzl2.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HgEQrAC3vzspLsBmq_XPAw--.30524S2
Authentication-Results: app1; spf=neutral smtp.mail=tttturtleruss@hust
	.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxuF1kAF4kKr43Gw4fAw4Dtwb_yoW5Ww4fpF
	WvgrySka1DZr43Cw4Ig3W8Ar1FkFZ7Gr4UGFWagw1Fqwn8Kr4Syrs0qryjgayxXrWxAan8
	Xw15KFyDWw4YyaDanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm0b7Iv0xC_Zr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I8C
	rVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxVW8Jr0_Cr1UMcIj6x8ErcxFaV
	Av8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbVWUJVW8
	JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCF04k20x
	vE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_
	Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVj
	vjDU0xZFpf9x07jgSdgUUUUU=
X-CM-SenderInfo: rxsqjiqrssiko6kx23oohg3hdfq/1tbiAQkMAmbAGjQDgwACsM


在 2024/8/17 6:28, Jonathan Corbet 写道:
> Haoyang Liu <tttturtleruss@hust.edu.cn> writes:
>
>> Translate dev-tools/kcsan commit 31f605a308e6
>> ("kcsan, compiler_types: Introduce __data_racy type qualifier")
>> into Chinese and add it in dev-tools/zh_CN/index.rst
>>
>> Signed-off-by: Haoyang Liu <tttturtleruss@hust.edu.cn>
>> Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
>> ---
>> v5 -> v6: Fix a typo.
>> v4 -> v5: Translate link into Chinese as well according to reviewer's advice.
>> v3 -> v4: Added original English text for proper nouns and modified some unclear experessions.
>> v2 -> v3: Revised some sentences based on reviewer's suggestions and updated the KTSAN url.
>> v1 -> v2: Added commit tag and fixed style problems according to reviewer's suggestions.
>>
>>   .../translations/zh_CN/dev-tools/index.rst    |   2 +-
>>   .../translations/zh_CN/dev-tools/kcsan.rst    | 321 ++++++++++++++++++
>>   2 files changed, 322 insertions(+), 1 deletion(-)
>>   create mode 100644 Documentation/translations/zh_CN/dev-tools/kcsan.rst
> So I applied this, but ended up unapplying it.  It adds a whole pile of
> docs build warnings:
>
> Documentation/translations/zh_CN/dev-tools/kcsan:223: ./include/linux/kcsan-checks.h:370: WARNING: Duplicate C declaration, also defined at dev-tools/kcsan:370.
> Declaration is '.. c:macro:: ASSERT_EXCLUSIVE_WRITER'.
> Documentation/translations/zh_CN/dev-tools/kcsan:223: ./include/linux/kcsan-checks.h:419: WARNING: Duplicate C declaration, also defined at dev-tools/kcsan:419.
> Declaration is '.. c:macro:: ASSERT_EXCLUSIVE_WRITER_SCOPED'.
> Documentation/translations/zh_CN/dev-tools/kcsan:223: ./include/linux/kcsan-checks.h:451: WARNING: Duplicate C declaration, also defined at dev-tools/kcsan:451.
> Declaration is '.. c:macro:: ASSERT_EXCLUSIVE_ACCESS'.
>
> [...]
>
> You really do need to do a build test before sending changes like this.
>
> The problem is the duplicated inclusion caused by the kernel-doc
> directive:
>
>> +.. kernel-doc:: include/linux/kcsan-checks.h
>> +    :functions: ASSERT_EXCLUSIVE_WRITER ASSERT_EXCLUSIVE_WRITER_SCOPED
>> +                ASSERT_EXCLUSIVE_ACCESS ASSERT_EXCLUSIVE_ACCESS_SCOPED
>> +                ASSERT_EXCLUSIVE_BITS
>>
> We really just can't do that with the current build system; the best
> thing is to put in a note saying to see the original document for those
> declarations.

I'm sorry for the warnings my patch introduced. I thought they were 
harmless so I ignored them. I will replace the duplicated inclusion with 
a note and a link to the original document.

I apologize for my mistake.


Thanks,

Haoyang

>
> This would be good to fix, perhaps with a variant of kernel-doc that
> doesn't generate the duplicated declarations, but until somebody does
> that we have to work around it.
>
> Thanks,
>
> jon

