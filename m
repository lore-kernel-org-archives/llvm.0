Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.75.44.102])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE6D1A23A0
	for <llvm@lists.linux.dev>; Tue, 12 Aug 2025 05:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.75.44.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754975517; cv=none; b=W3aRHBJDu4FgyCNHQFnQ/2oY5+Evi456XnZnkhWQvfiEcwoI/TDyzCNtV+oHrxYQd7ahE00gn3TIq6v9QG+KyVhJTXo7yWZ4ju2vb93ox3uge6JDLc/MCMsw0rd6N9f3Yw2V+vXo/xO6ss8n/pkHf/AEUMQJ7BPh0/8L/sxP0Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754975517; c=relaxed/simple;
	bh=+e4aQ4erJHP8iI85HC9zaagNuxNBEEFdnp0sUhqAedE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fngu2qfPmvRlVIW+VmCrinez7eGI5hkZBwa9XwnrFOWiM2HlyOeyBYgaAzqjU/HWVVrnj82UYs6gc9ce8KNuUDeooHodfkWVJ565KXcVAVtkToGsLi0GA2/cumJtdTCP3W1UofTBjBnx4llXk10v70PsRQk1wgO3R5DX6FtSrkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=13.75.44.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with SMTP id HgEQrADHSMnlzJpo7iwIAQ--.1732S2;
	Tue, 12 Aug 2025 13:11:01 +0800 (CST)
Received: from [192.168.43.195] (unknown [10.200.80.159])
	by gateway (Coremail) with SMTP id _____wCXkFPkzJpo_rrVAQ--.47500S2;
	Tue, 12 Aug 2025 13:11:01 +0800 (CST)
Message-ID: <c8a9e908-5231-4856-a722-ddc211154924@hust.edu.cn>
Date: Tue, 12 Aug 2025 13:11:00 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] scripts/checktransupdate.py: add support for scanning
 directory
To: Nathan Chancellor <nathan@kernel.org>,
 Haoyang LIU <tttturtleruss@gmail.com>, Yanteng Si <si.yanteng@linux.dev>,
 Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 hust-os-kernel-patches@googlegroups.com, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-doc@vger.kernel.org
References: <20250811170050.94997-1-tttturtleruss@gmail.com>
 <20250811212446.GA924610@ax162>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20250811212446.GA924610@ax162>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:HgEQrADHSMnlzJpo7iwIAQ--.1732S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxJr4DGFWfWFyfuw1DJF1fWFg_yoW8AF45pa
	18Kw1aka43Kr47Cwn3Kw4YyF1rAa18GFy5Grn2qwn2vFn8tr40gr4I9wn0vF4kZFWrCFW5
	XF4a9ry5KF4UZFDanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQFb7Iv0xC_Zr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_Jr
	v_JF1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxAIw2
	8IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_GFW3Jr1UJwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jy38nUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 8/12/25 5:24 AM, 'Nathan Chancellor' via HUST OS Kernel Contribution 
wrote:
> Hi Haoyang,
>
> On Tue, Aug 12, 2025 at 01:00:50AM +0800, Haoyang LIU wrote:
>> Origin script can only accept a file as parameter, this commit enables
>> it to scan a directory.
>>
>> Usage example:
>> ./scripts/checktransupdate.py Documentation/translations/zh_CN/dev-tools
>>
>> Signed-off-by: Haoyang LIU <tttturtleruss@gmail.com>
>> ---
>>
>> V1 -> V2: remove the fix of missing "f" in f-string and make it a new patch
>>
>>   scripts/checktransupdate.py | 24 ++++++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
> Thanks for the update. While this seems reasonable to me from a purely
> surface level glance over the actual Python, I have added the
> Documentation folks that Dongliang added from the previous thread, who
> really own and maintain this file (the original patch is at [1]). Please
> include them in future revisions should they be necessary. It would
> probably be good for something like this to be applied?

Thanks for the suggestion. I've submitted a patch[1].

[1] 
https://lore.kernel.org/linux-doc/20250812050711.2515173-1-dzm91@hust.edu.cn/

>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fe168477caa4..b7e3a8c8832e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7302,6 +7302,7 @@ P:	Documentation/doc-guide/maintainer-profile.rst
>   T:	git git://git.lwn.net/linux.git docs-next
>   F:	Documentation/
>   F:	scripts/check-variable-fonts.sh
> +F:	scripts/checktransupdate.py
>   F:	scripts/documentation-file-ref-check
>   F:	scripts/get_abi.py
>   F:	scripts/kernel-doc*
>
> [1]: https://lore.kernel.org/20250811170050.94997-1-tttturtleruss@gmail.com/
>
> Cheers,
> Nathan
>

