Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7028512BF31
	for <llvm@lists.linux.dev>; Thu, 25 Apr 2024 11:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714045093; cv=none; b=B16dTC5iu0edRQIKS7FZ9mqsnr49i8CMaBKY71WL1pP5HtH7yQOpkzxezuUSk9E1jC30L1CNV4d6Vqzp4MSea0ODWXGjz6Sc5IHZiE/ndoexs58GCLw3V3DDl7TFraZPEFJ0qHWfv5X/82nwoZzDjSP2r3mw7snsiybwqZpKPUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714045093; c=relaxed/simple;
	bh=SEEboE4HgIvagkThC673hmqW82GFljpr7iCck/ZAUSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HLQbROjTbprvuQcre25iZFm+1VEWRYI3gF3G7xMOqtzosh3m6a+aHrlxSirys2IZzCu9yNeyOlvAkUhHPw68QaPGc8Hoo3QQNV9Jt3/Q/vd44py/a4Uf8FZ9c/YizDS42a0kG1VO1E7OXmBWlW+WAoA16siI+ijb7VDxRSXfNaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.112.218])
	by gateway (Coremail) with SMTP id _____8CxR+meQCpmvccCAA--.624S3;
	Thu, 25 Apr 2024 19:38:06 +0800 (CST)
Received: from [192.168.100.8] (unknown [112.20.112.218])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxlFacQCpmuwUFAA--.1256S3;
	Thu, 25 Apr 2024 19:38:05 +0800 (CST)
Message-ID: <df40d243-63b9-4fa5-bc06-de5d67ccb073@loongson.cn>
Date: Thu, 25 Apr 2024 19:38:03 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] docs/zh_CN/rust: Update the translation of
 arch-support to 6.9-rc4
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: ojeda@kernel.org, corbet@lwn.net, alex.gaynor@gmail.com,
 wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com,
 aliceryhl@google.com, nathan@kernel.org, ndesaulniers@google.com,
 morbo@google.com, justinstitt@google.com, alexs@kernel.org,
 dzm91@hust.edu.cn, linux-doc@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
References: <cover.1713875158.git.siyanteng@loongson.cn>
 <81ab8f4ee8eea1d7a67de0595ec964614c5e2e00.1713875158.git.siyanteng@loongson.cn>
 <CANiq72mdhwadg_PCBkz6fTcYBTr-gHFY9N9JFL2B_uFuMgtzXg@mail.gmail.com>
Content-Language: en-US
From: Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <CANiq72mdhwadg_PCBkz6fTcYBTr-gHFY9N9JFL2B_uFuMgtzXg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxlFacQCpmuwUFAA--.1256S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUBKb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x02
	67AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E
	87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2
	Ij64vIr41l4c8EcI0En4kS14v26r1Y6r17MxAqzxv26xkF7I0En4kS14v26r126r1DMxC2
	0s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
	W8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAI
	cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8vApUUUUUU==


在 2024/4/25 17:01, Miguel Ojeda 写道:
> On Tue, Apr 23, 2024 at 3:07 PM Yanteng Si <siyanteng@loongson.cn> wrote:
>> +``loongarch``  Maintained        -
> We had a recent rendering fix here that you may want to consider:
>
> https://lore.kernel.org/rust-for-linux/20240324010915.3089934-1-tim.chenbw@gmail.com/
>
> Thanks for this Yanteng!
>
Okay!


Thanks,

Yanteng

