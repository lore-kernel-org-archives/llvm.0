Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB8CE2AF1B
	for <llvm@lists.linux.dev>; Sat, 27 Apr 2024 04:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714192707; cv=none; b=CeceaAvct7YB128gQjiPWRirVuAv25TCRqB2Rs63pYVl31y4G1GHUFloe2kfowfq9gk9kdlR57R0VbxOqCtBTNDW5V4H7gPcJ0F8qsemWurnOEO+CPB7aKGjnYmVfdA+sdXR5LIk003WD6CY7VUyZ7CZPQ2Y4HOw1qe23vVsqN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714192707; c=relaxed/simple;
	bh=1e30Vx0x9asTreYv7+Dqpx3STx93SRkQPdmPybsYLUI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XWW9etwVkxV+dzkWYY4LvLRvtFebsK5IaNLYk17LJgQN7JT3cVPt094ygzTkMZteVhRuaH+BnfGXKN6OZ/0bV86vqNZEr6KovxkDE/hNi4jiRwFVUy18DVbdhRZVs9hfMf6iWOPjMSIQLZ4/I6EwmZMyZoX/qPpWeGOeChZehac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.112.218])
	by gateway (Coremail) with SMTP id _____8CxJvA+gSxm4d0DAA--.15073S3;
	Sat, 27 Apr 2024 12:38:22 +0800 (CST)
Received: from [192.168.100.8] (unknown [112.20.112.218])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dxc1Y8gSxmpBkHAA--.4284S3;
	Sat, 27 Apr 2024 12:38:21 +0800 (CST)
Message-ID: <f49129dd-ed6f-4940-b851-0282fc320234@loongson.cn>
Date: Sat, 27 Apr 2024 12:38:20 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] rust: docs: Update the translation of rust to
 6.9-rc4
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@samsung.com, aliceryhl@google.com,
 nathan@kernel.org, ndesaulniers@google.com, morbo@google.com,
 justinstitt@google.com, alexs@kernel.org, dzm91@hust.edu.cn,
 linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev
References: <cover.1714113680.git.siyanteng@loongson.cn>
 <CANiq72meE9txt5b09Y7cUJd-hEqcZX1ZtRc_0YYDZqWQgyo3wA@mail.gmail.com>
 <87zftgnsun.fsf@meer.lwn.net>
 <CANiq72mHoh=qgOGPj29hpS7EhVcXi5Q_7GYsycKhYwj3QbsTag@mail.gmail.com>
Content-Language: en-US
From: Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <CANiq72mHoh=qgOGPj29hpS7EhVcXi5Q_7GYsycKhYwj3QbsTag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Dxc1Y8gSxmpBkHAA--.4284S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrury7tF45tFy7Ar18JF1UArc_yoWDArg_GF
	Wvyayvyw48JF48Aa12gr4rZwsrtay7uF1xZ34kJ3y2q345AF4DWFW3Krn2gw1vgrWFgF1U
	GrZ7ZaySkw429osvyTuYvTs0mTUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb3kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v2
	6r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY1x0262kKe7AKxVWUAV
	WUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWU
	tVW8ZwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
	vjDU0xZFpf9x07jFsjbUUUUU=


在 2024/4/27 00:47, Miguel Ojeda 写道:
> On Fri, Apr 26, 2024 at 3:42 PM Jonathan Corbet <corbet@lwn.net> wrote:
>> I guess I don't see any reason why the translation couldn't go through
>> docs-next as usual?  It will all even out during the merge window,
>> right?  Or am I missing something?
> Yeah, that is what I am thinking as well, although Yanteng is
> mentioning conflicts somewhere, so I may be missing something too.
>
Sorry, I may have made a mistake, there are no conflicts in this patch set.


What I mean is that if I translate these two patches as two separate 
patches,

merge them into the rust tree, and then merge the rest of the patch set into

the doc tree, it might cause a conflict in the linux-next tree, because 
in order

of order, the two patches have to be applied after this patch set. I'm 
not sure

I've understood the whole process correctly.


Now that the two patches have become part of the patch set, there will be no

conflict no matter which tree is eventually merged into.



Thanks,

Yanteng


