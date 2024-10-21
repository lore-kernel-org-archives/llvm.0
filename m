Received: from hust.edu.cn (mail.hust.edu.cn [202.114.0.240])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F17801CBEB6
	for <llvm@lists.linux.dev>; Mon, 21 Oct 2024 15:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.114.0.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729526392; cv=none; b=hPZpL5Tf+loIX77CDpkHlUskVvK6Z4AlQ7wfEqvqCB5qJOwQYgK98XcyXsHnixvgOZ6jsF6YaeVb//sEhhIygbCjgf9ZBH6bZf0aYBMR+1TlnyneQxML00Ko/Rhe9QCzaWNOIIHtDZ+bIZVozeVUYTme5my7vZhxg/dEZTCyghA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729526392; c=relaxed/simple;
	bh=NtU/4AB1lTAZ+pQ9nINBRSms9NiVC6gYsoyQPRpM65M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aIKloYjAHjNzFdL4mSzIVcWG5F9LL11tj8ntCRiI6Nl1rpxFv2dlDFkfV8GlvLjGJzXpXsXN6UNzSuZtrIrnZXk2PEcM4YyefbEcPqhqExmovQUrEqWtJhHzC90FhphOceuVvsmjBnIjM5p1h2T1GeKv0QcRDGqFVemDjO9yeeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=202.114.0.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with SMTP id HgEQrADn7ztyeBZneUBPCA--.41099S2;
	Mon, 21 Oct 2024 23:51:14 +0800 (CST)
Received: from [192.168.1.6] (unknown [183.94.68.188])
	by gateway (Coremail) with SMTP id _____wB3cA9weBZn1MqEAA--.29580S2;
	Mon, 21 Oct 2024 23:51:14 +0800 (CST)
Message-ID: <bae3c59c-39a5-4daa-b37e-bbf077d57643@hust.edu.cn>
Date: Mon, 21 Oct 2024 23:51:11 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/zh_CN: update the translation of
 process/programming-language.rst
To: Jonathan Corbet <corbet@lwn.net>, si.yanteng@linux.dev,
 Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: hust-os-kernel-patches@googlegroups.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev
References: <20241018015226.3786020-1-dzm91@hust.edu.cn>
 <87ed49tqia.fsf@trenco.lwn.net>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <87ed49tqia.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:HgEQrADn7ztyeBZneUBPCA--.41099S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7WF18XF1rWryDZr1DAw47Jwb_yoW8AryDpF
	yUtFy7Ga1rAFn8C3yUtrWrWr1rJFs7GayDtr12q3Z5tws0k3s7XrWfKFs3u34UZry8Aa1U
	XayUKF9Ygr4YvaDanT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQFb7Iv0xC_Zr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_JF
	0_Jw1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r1q6r43MxAIw2
	8IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_GFW3Jr1UJwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWrXVW3AwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jh189UUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 2024/10/21 23:38, Jonathan Corbet wrote:
> Dongliang Mu <dzm91@hust.edu.cn> writes:
>
>> Update to commit 0b02076f9953 ("docs: programming-language: add Rust
>> programming language section")
>>
>> scripts/checktransupdate.py reports:
>>
>> Documentation/translations/zh_CN/process/programming-language.rst
>> commit 0b02076f9953 ("docs: programming-language: add Rust programming
>> language section")
>> commit 38484a1d0c50 ("docs: programming-language: remove mention of the
>> Intel compiler")
>> 2 commits needs resolving in total
>>
>> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
>> ---
>> v1->v2: revise the script name
>>   .../zh_CN/process/programming-language.rst    | 78 +++++++------------
>>   1 file changed, 30 insertions(+), 48 deletions(-)
> This one adds some new build warnings:
>
> Documentation/translations/zh_CN/process/programming-language.rst:44: WARNING: duplicate citation gcc, other instance in /stuff/k/git/kernel/Documentation/process/programming-language.rst
> Documentation/translations/zh_CN/process/programming-language.rst:51: WARNING: duplicate citation rustc, other instance in /stuff/k/git/kernel/Documentation/process/programming-language.rst
>
> *Please* be sure to do a docs build before submitting your patches.

I am sorry. I am not sure why I miss this warning. I should strictly 
follow the rule - make htmldocs and checkpatch do no trigger any errors 
or warns.

A simple question: if you miss the warning in one `make htmldocs` 
building``, you rerun `make htmldocs` and still trigger the warning or 
just the warnnings do not appear until `make cleandocs` is done?

Dongliang Mu

>
> jon

