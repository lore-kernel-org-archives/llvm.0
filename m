Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F101367
	for <llvm@lists.linux.dev>; Fri,  1 Aug 2025 01:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754011768; cv=none; b=fhAePenin2PWOpqsS/GpcZjCzuDDG/ArkXFB0UXvPX6o8luzmwsTxG+vB9rlCpIP6a2q0IJfyAty2tVD4Ib1yGFJ7aA5zrwCFZY3TX0/lWmFaHqrX0XjMil0IKWpb8Fdjrw7bbz+9WFoazlAorfHAdIgOhx9va+Ag00FT8quzMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754011768; c=relaxed/simple;
	bh=bgtmNrmGz0CNFTquJDzruC0P+qlOrhrEaOzu3SVJCeU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kykQ2tySrvf95iKdfTHUf/Po6sUxHDyh5mK5H/v4npqJjI8dDUNJUAt6kikAz/RDSDMWrZiKK0lTqWaIO5U2+pmJ/i9bOehkKtMV+dVZcIbpU1Ots7TZYbF3UfXWMIwT99MTGJYGiZRytrTIU5r5AGLMVruqG6kKqwjpxDYcCDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tsTglBGz; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tsTglBGz"
Message-ID: <4c39dd4f-0aab-47b5-8424-4e0f23221623@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754011763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hlBrEOWBwp2LaUvEWBoldwdP4AZNXcY/+WkMid7j1KI=;
	b=tsTglBGz5o1X0rBNSU6dWl3EvM3PT7AtBJtkzraPB4HJaEi3NCMasCYUphTl49DWAVssva
	sK9wLscetmsNQFadxJkoOCYHNizcBLi1SfdbdXK8chsexT6VfaiFax07wsk0G7rEZUjjdQ
	3LuYGS7Lu85SBdkkRC2RPxKqSaB8ExQ=
Date: Fri, 1 Aug 2025 09:29:17 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] hung_task: fix objtool sibling call warning in
 watchdog()
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>
Cc: lkp@intel.com, akpm@linux-foundation.org, zi.li@linux.dev,
 llvm@lists.linux.dev, mhiramat@kernel.org, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250731023934.48840-1-lance.yang@linux.dev>
 <20250731175951.GC1455142@ax162>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <20250731175951.GC1455142@ax162>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 2025/8/1 01:59, Nathan Chancellor wrote:
> On Thu, Jul 31, 2025 at 10:39:34AM +0800, Lance Yang wrote:
>> From: Lance Yang <lance.yang@linux.dev>
>>
>> The kernel test robot reported an objtool warning on the loongarch
>> architecture with clang:
>>
>>          vmlinux.o: warning: objtool: watchdog+0x418: sibling call from
>> callable instruction with modified stack frame
>>
>> To resolve this, explicitly prevent the compiler from inlining or
>> performing a tail call on check_hung_uninterruptible_tasks() by marking
>> it with the noinline attribute. This ensures a standard function call
>> with a proper stack frame, satisfying objtool's validation requirements.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202507301256.cZlxQ10s-lkp@intel.com/
>> Signed-off-by: Lance Yang <lance.yang@linux.dev>
> 
> While this may solve that particular instance of the warning, the fact
> there are many, many more with that configuration indicates that there
> will need to be a more generalized fix. I have started a separate thread
> with some LoongArch folks around this issue:

Thanks for the heads-up!

Yes, you're right, a more general fix is definitely the way to go.

I'll keep an eye on that thread and see how I can help ;)

Thanks,
Lance

> 
> https://lore.kernel.org/20250731175655.GA1455142@ax162/
> 
> Cheers,
> Nathan
> 
>> ---
>>   kernel/hung_task.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/kernel/hung_task.c b/kernel/hung_task.c
>> index 8708a1205f82..a5b5a0a2c262 100644
>> --- a/kernel/hung_task.c
>> +++ b/kernel/hung_task.c
>> @@ -283,7 +283,7 @@ static bool rcu_lock_break(struct task_struct *g, struct task_struct *t)
>>    * a really long time (120 seconds). If that happens, print out
>>    * a warning.
>>    */
>> -static void check_hung_uninterruptible_tasks(unsigned long timeout)
>> +static noinline void check_hung_uninterruptible_tasks(unsigned long timeout)
>>   {
>>   	int max_count = sysctl_hung_task_check_count;
>>   	unsigned long last_break = jiffies;
>> -- 
>> 2.49.0
>>
>>

