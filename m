Received: from zg8tmja2lje4os43os4xodqa.icoremail.net (zg8tmja2lje4os43os4xodqa.icoremail.net [206.189.79.184])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51BA29463
	for <llvm@lists.linux.dev>; Mon, 21 Oct 2024 02:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.79.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729476869; cv=none; b=Ull41D4LygCjlKYAmuFcPn0iXiUT1+0RwyBa9DwSRQAuPlqPk3yOqEqoJqxZ5ZYjlJhOFsVe1iutrgY9cxULtPf013SrSIDv07D1aEYy8lx+97vAom0fcgo4/+1sjbzEdTMcxS5t0YA0H3yS7DDsZM0qD4yyKAFaWNE4mKjC+/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729476869; c=relaxed/simple;
	bh=S9wUw1bR68fNWrdtpet5nL+FwFJDkASwI4GTJxVjl20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c3ffpMqt3mmwfJq4H3jsCt0F770AVBmt2orOYh2uZnGFWgU0p3Ezc1n0JLDODhCXKxE+Zw5LDg94SKkT468z4UopUKLuaDVHQ3/RrElk+3j5xyXCvDKde0OV0dJ+/SR7g1Lo8/NrOHb/0JDF1oDF/bw2A0VFxP51UcdCxDYZEwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=206.189.79.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app2 (Coremail) with SMTP id HwEQrACHjs7SuBVnw4wdAQ--.61951S2;
	Mon, 21 Oct 2024 10:13:38 +0800 (CST)
Received: from [10.12.173.122] (unknown [10.12.173.122])
	by gateway (Coremail) with SMTP id _____wCnoMfQuBVngbVuAA--.37907S2;
	Mon, 21 Oct 2024 10:13:37 +0800 (CST)
Message-ID: <f38f12cd-2ea3-444c-8fbb-15ee0471a3cb@hust.edu.cn>
Date: Mon, 21 Oct 2024 10:13:36 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add the translation of documents in kbuild
To: Alex Shi <seakeel@gmail.com>, si.yanteng@linux.dev,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>
Cc: hust-os-kernel-patches@googlegroups.com, llvm@lists.linux.dev
References: <cover.1729259177.git.dzm91@hust.edu.cn>
 <8a882bc0-7125-4036-b939-fbd9e821c041@hust.edu.cn>
 <2bf8ba2e-9c5f-4f89-9399-f6320aa32a16@gmail.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <2bf8ba2e-9c5f-4f89-9399-f6320aa32a16@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HwEQrACHjs7SuBVnw4wdAQ--.61951S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7KFWfXryrtw17uFWxGrykZrb_yoW8Cr1Upa
	18Ka4fCFnayr92yr1xKr4UAFy5JF97KwsrGw1xX3ZYqFsYvrW5Kr4Ut3s09FZ3Gr4xA3WY
	9rZ8Kas8u34fAF7anT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQFb7Iv0xC_Ar1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK
	6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1ln4kS14v26r
	1Y6r17M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI
	12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj64x0Y40En7xvr7AKxV
	W8Jr0_Cr1UMcIj6x8ErcxFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAVWUtwCF04
	k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fZr1UJr1l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_Jw0_GFylx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07Uj2NZUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 2024/10/21 09:29, Alex Shi wrote:
>
> On 10/19/24 14:19, Dongliang Mu wrote:
>> +to Jon and Alex.
>>
>> It seems that tocmd and cccmd does not work with cover letter. Any suggestions?
>>
>>      tocmd ="`pwd`/scripts/get_maintainer.pl --nogit --norolestats --nol"
>>      cccmd ="`pwd`/scripts/get_maintainer.pl --nogit --norolestats --nom"
>>
> Do you mean that to or cc cmd should give a name list for cover-letter?
> I don't know if it's common needs, since some of people don't like to get every patches, maybe only the related patch is enough for them. But in another side, full name list is may wanted for others.
>
> Another interfere like this, is the 'git am 00*.patch', it failed on 0000-cover-letter as cover-letter is empty patch. I'm also not sure it's common needs...

Yes. I realized it yesterday. And cover letter is not a patch. It seems 
there is no need to handle cover letter specially.

Dongliang Mu

>
> Thanks
> Alex
>> Dongliang Mu
>>
>> On 2024/10/18 21:47, Dongliang Mu wrote:
>>> Since llvm refers to reproducible-builds.html, so I create this patchset
>>> and add the translation of these two documents
>>>
>>> Dongliang Mu (2):
>>>     docs/zh_CN: add the translation of kbuild/kbuild.rst
>>>     docs/zh_CN: add the translations of kbuild/reproducible-builds.rst
>>>
>>>    .../translations/zh_CN/kbuild/index.rst       |   4 +-
>>>    .../translations/zh_CN/kbuild/kbuild.rst      | 304 ++++++++++++++++++
>>>    .../zh_CN/kbuild/reproducible-builds.rst      | 114 +++++++
>>>    3 files changed, 420 insertions(+), 2 deletions(-)
>>>    create mode 100644 Documentation/translations/zh_CN/kbuild/kbuild.rst
>>>    create mode 100644 Documentation/translations/zh_CN/kbuild/reproducible-builds.rst
>>>

