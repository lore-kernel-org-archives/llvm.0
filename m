Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A939C8E0
	for <llvm@lists.linux.dev>; Mon, 24 Mar 2025 02:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742782420; cv=none; b=uLsiy6AS9UJt9IiTu8I/mpLL87vWkwKNdlNTQEhn4oXGqtCyk/KfCF+S456NGOyWzOv2gH3uYTkE2w9ItES+Qor/gM0L97f/Rv18cfi3TqE7lnWQgE+1KRFFS5tZ8HKSYuu850djDH7Masw/lfRzm0Elco6yWqhdxfiW8y/YP9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742782420; c=relaxed/simple;
	bh=2BE2IxPPQMMhXsHKXbpGoOMsNi48zxmr5E2HFB9zuvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cWUe+nQBriRYMkX6TmStmnlOnTYSi9K3ZOhvW4OG6eT47nEefMMQX9GYXplTRD7TR1IQhy8wmUa71hOZFAGSXRsX/U+avlKI/cM13p2MVj4kZ5CJ5oUq0KSq6hr7a7VcjM3kdzGNxQxXC4eUyVvl9t54Qlcy4aRgMu1qmB2Jcsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dGzFw8Vv; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dGzFw8Vv"
Message-ID: <c7408be8-52eb-4919-a60d-3cadfa185e02@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742782416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k4/tJLm3+fY5j+LgerUyhgXjA8+RDlZ48rnTRfZESKM=;
	b=dGzFw8Vv8Ymgj3/9soVLnzadth3gBcSF++sGJ96e1UXfO22V3E6lPeygUVjUDWxH9Lr5D7
	+f1cJWtLCXJN/cN2DKF51hn297RFL9Y4ncRn0sIwciPsVU8tYPrA5w4gkSMM7sOaoJHXr7
	ACtTQOiYc+p5zW5YPcnsJxD47WE2+cc=
Date: Mon, 24 Mar 2025 10:13:29 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH v2] rust: sync: optimize Rust symbol generation for
 PollCondVar
Content-Language: en-US
To: Boqun Feng <boqun.feng@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org,
 nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Kunwu Chan <kunwu.chan@hotmail.com>,
 Grace Deng <Grace.Deng006@gmail.com>
References: <20250317025205.2366518-1-kunwu.chan@linux.dev>
 <Z-BJjjEZBzwKJ9mS@Mac.home>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kunwu Chan <kunwu.chan@linux.dev>
In-Reply-To: <Z-BJjjEZBzwKJ9mS@Mac.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2025/3/24 01:49, Boqun Feng wrote:
> On Mon, Mar 17, 2025 at 10:52:05AM +0800, Kunwu Chan wrote:
>> From: Kunwu Chan <kunwu.chan@hotmail.com>
>>
>> When build the kernel using the llvm-18.1.3-rust-1.85.0-x86_64
>> with ARCH=arm64, the following symbols are generated:
>>
>> $nm vmlinux | grep ' _R'.*PollCondVar  | rustfilt
>> ... T <kernel::sync::poll::PollCondVar>::new::{closure#0}::{closure#0}::panic_cold_explicit
>> ... T <kernel::sync::poll::PollCondVar as kernel::init::PinnedDrop>::drop
>> ... T <kernel::sync::poll::PollCondVar as core::ops::drop::Drop>::drop
>>
>> This Rust symbol
>> (<kernel::sync::poll::PollCondVar as kernel::init::PinnedDrop>::drop)
>> is trivial wrappers around the C functions __wake_up_pollfree
>> and synchronize_rcu. It doesn't make sense to go through a trivial
>> wrapper for its functions,so mark it inline.
>>
>> Link: https://github.com/Rust-for-Linux/linux/issues/1145
>> Suggested-by: Alice Ryhl <aliceryhl@google.com>
>> Co-developed-by: Grace Deng <Grace.Deng006@Gmail.com>
>> Signed-off-by: Grace Deng <Grace.Deng006@Gmail.com>
>> Signed-off-by: Kunwu Chan <kunwu.chan@hotmail.com>
>>
> Queued for future tests and reviews. Thanks!
Ok, if need do testing-related work, feel free to contact me
>
> Regards,
> Boqun
>
>> ---
>> Changes in v2:
>>   - Add link and Suggested-by
>>   - Reword commit msg
>> ---
>>   rust/kernel/sync/poll.rs | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/rust/kernel/sync/poll.rs b/rust/kernel/sync/poll.rs
>> index d5f17153b424..a4f92c545fec 100644
>> --- a/rust/kernel/sync/poll.rs
>> +++ b/rust/kernel/sync/poll.rs
>> @@ -107,6 +107,7 @@ fn deref(&self) -> &CondVar {
>>   
>>   #[pinned_drop]
>>   impl PinnedDrop for PollCondVar {
>> +    #[inline]
>>       fn drop(self: Pin<&mut Self>) {
>>           // Clear anything registered using `register_wait`.
>>           //
>> -- 
>> 2.43.0
>>
-- 
Thanks,
   Kunwu.Chan(Tao.Chan)

