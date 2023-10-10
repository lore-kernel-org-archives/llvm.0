Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr [80.12.242.15])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40C871FD2
	for <llvm@lists.linux.dev>; Tue, 10 Oct 2023 05:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="sUJg8M77"
Received: from [192.168.1.18] ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id q5HZqevR01Bgiq5HZqbsce; Tue, 10 Oct 2023 07:27:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1696915674;
	bh=UhBzoQl6b6SPgBCx3O6qpCX6Jh+GHE2nQg1Lh1Bbdvc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=sUJg8M77dK2uUmiq5tDeHAGl5t8tBzowgZDea1fMdllYtFrUVU6nFeUaWAf9Wo06Z
	 esfa5UPwLBbtN6f36c8onGpTL8vfUy1mRZ2gb+etSvA6Aftn1jYzJPSsKjBlkrveuS
	 pFMS5/QPWTbDI+j7Rtv/9XZCxOU8Ga6T2Ii+aZZ3tPw2X8ER19weJsjCL0EfxghF2s
	 MF/+yi2da4MgzK3RdkIq9ajWAPH8ZjCVv2MadKxaZ6PFiJCbzR35oNa3oZYrtOe57s
	 qCVQFEYjLL+upHzUtCo4nxDeVuiPm1aX6UgFVci7cupr5gQZY0hjXjjnQ8sTSZc8/2
	 pTNufJQc3eNww==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 10 Oct 2023 07:27:54 +0200
X-ME-IP: 86.243.2.178
Message-ID: <e9384a5a-caf6-48cd-8ba6-9bc5fa891177@wanadoo.fr>
Date: Tue, 10 Oct 2023 07:27:48 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ovs-dev] [PATCH net-next 2/2] net: openvswitch: Annotate struct
 mask_array with __counted_byUse struct_size()
To: Ilya Maximets <i.maximets@ovn.org>, keescook@chromium.org,
 Pravin B Shelar <pshelar@ovn.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "Gustavo A. R. Silva"
 <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Cc: dev@openvswitch.org, netdev@vger.kernel.org, llvm@lists.linux.dev,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <8be59c9e06fca8eff2f264abb4c2f74db0b19a9e.1696156198.git.christophe.jaillet@wanadoo.fr>
 <f66ddcf1ef9328f10292ea75a17b584359b6cde3.1696156198.git.christophe.jaillet@wanadoo.fr>
 <689fe81f-e2b4-9f99-4005-8ae330afb869@ovn.org>
Content-Language: fr
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <689fe81f-e2b4-9f99-4005-8ae330afb869@ovn.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 02/10/2023 à 18:51, Ilya Maximets a écrit :
> On 10/1/23 13:07, Christophe JAILLET wrote:
>> Prepare for the coming implementation by GCC and Clang of the __counted_by
>> attribute. Flexible array members annotated with __counted_by can have
>> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
>> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
>> functions).
>>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>> This patch is part of a work done in parallel of what is currently worked
>> on by Kees Cook.
>>
>> My patches are only related to corner cases that do NOT match the
>> semantic of his Coccinelle script[1].
>>
>> In this case, in tbl_mask_array_alloc(), several things are allocated with
>> a single allocation. Then, some pointer arithmetic computes the address of
>> the memory after the flex-array.
>>
>> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
>> ---
>>   net/openvswitch/flow_table.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/net/openvswitch/flow_table.h b/net/openvswitch/flow_table.h
>> index 9e659db78c05..8d9e83b4d62c 100644
>> --- a/net/openvswitch/flow_table.h
>> +++ b/net/openvswitch/flow_table.h
>> @@ -48,7 +48,7 @@ struct mask_array {
>>   	int count, max;
>>   	struct mask_array_stats __percpu *masks_usage_stats;
>>   	u64 *masks_usage_zero_cntr;
>> -	struct sw_flow_mask __rcu *masks[];
>> +	struct sw_flow_mask __rcu *masks[] __counted_by(size);
> 
> Did you mean 'max'?  There is no 'size' in the structure.

Hi,

Of courtse, yes. I'll resend.

'size' is the name of the variable that is written in mask_array->max in 
tbl_mask_array_alloc()

> 
> Also, the patch subject is messed up a bit.

Yes.
Will fix it as well.

CJ

> 
> Best regards, Ilya Maximets.
> 

