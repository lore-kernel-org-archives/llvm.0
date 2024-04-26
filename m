Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B531585624
	for <llvm@lists.linux.dev>; Fri, 26 Apr 2024 10:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714127752; cv=none; b=sU49vsvGP0lUbn/79f2upvn5G1QETrWQo6zq/LClko6lFHoLYjp6Rl6eaPmruq/kXrwnJozmDoTVu+63Nnum8Q7SrnhFPLiWOFFDzOLpStB0ILB0/CWYRYqSOQXppU68CIbJeNiZb+0VsOjqyxkfJr7ciboYEsfe/sEpCulQBBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714127752; c=relaxed/simple;
	bh=KbTAaCOP23RX4cDVyVC1f0gyN8yb6XO4hy9Vw4aJ848=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fZ0v91OlB3uEzclNZr5QcnAkjo3TpVYpIk/wm8OUwaeocrB0vQmJJ0CtBGm5mtA+cw0nBbCICUmYjC+s69YOQi/rcewWF4CMkluBqqOLyKrxD6FQk3xHZpI89G0HXmMlZyglafqi8e4zF0xfj2/2pV/KJ4NOno0BmM/sl7Xfvo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.112.218])
	by gateway (Coremail) with SMTP id _____8CxxOqCgytmIWsDAA--.1959S3;
	Fri, 26 Apr 2024 18:35:46 +0800 (CST)
Received: from [192.168.100.8] (unknown [112.20.112.218])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxlFZ_gytm0zMGAA--.3023S3;
	Fri, 26 Apr 2024 18:35:45 +0800 (CST)
Message-ID: <9cae4c4a-55a6-4c6c-9780-866f796a52c0@loongson.cn>
Date: Fri, 26 Apr 2024 18:35:43 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] rust: docs: Update the translation of rust to
 6.9-rc4
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: ojeda@kernel.org, corbet@lwn.net, alex.gaynor@gmail.com,
 wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com,
 aliceryhl@google.com, nathan@kernel.org, ndesaulniers@google.com,
 morbo@google.com, justinstitt@google.com, alexs@kernel.org,
 dzm91@hust.edu.cn, linux-doc@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
 linux-riscv@lists.infradead.org
References: <cover.1714113680.git.siyanteng@loongson.cn>
 <CANiq72meE9txt5b09Y7cUJd-hEqcZX1ZtRc_0YYDZqWQgyo3wA@mail.gmail.com>
Content-Language: en-US
From: Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <CANiq72meE9txt5b09Y7cUJd-hEqcZX1ZtRc_0YYDZqWQgyo3wA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxlFZ_gytm0zMGAA--.3023S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7GF1kCr18AFWfKFyrtr1fuFX_yoWkXrb_Aa
	sYyay7tw1kJF4kCFWfJr43uFs7X3y8Cw1DJr1Iqw17Xr95AFZ7uFZxK34S9F4Iqw4rCr1D
	Kr10gayS9343uosvyTuYvTs0mTUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbSxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_
	Jw1lYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI4
	8JMxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxU2G-eUUUUU


在 2024/4/26 15:37, Miguel Ojeda 写道:
>> v2:
>> * As Miguel's comments, translate commit 01848eee20c6
>>    into Chinese, as well as commit 81889e8523e6. By the way,
>>    these two patches haven't appeared in the doc development
>>    tree yet, maybe we could consider merging them into the
>>    rust tree?
> The former is in `rust-fixes`, which will be sent to Linus for this
> cycle. So the English docs will be updated sooner than these updates,
> if that is what you are asking.

Well, it seems that we will have to wait for the doc tree, because the 
Chinese

translation is now carried out under the doc tree.

>
> For the other one, it is in the RISC-V tree and I assume it will be
> sent into the next merge window. I don't know how you normally handle
> that (i.e. translations being updated at the same time or after a
> cycle), but either way, I am not sure why you would want them to be
> merged into the Rust tree?

I'm thinking that I'm two commits ahead of the doc tree, it doesn't seem 
to fit

merge into the doc tree in this window, and there might be conflicts on

linux-next if I splite the patch out more.


Thanks,

Yanteng



