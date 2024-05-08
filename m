Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E304757F2
	for <llvm@lists.linux.dev>; Wed,  8 May 2024 09:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715159649; cv=none; b=JBnBs5Kcbf2MKm3jwGjVS+8S8722kcjowHlZyXPrTvfQkvRyktN9dCqx8tNFHcTmtdnOnXZwo8Ip7IuTG9WMZHhg0q6R5FYb9pVjEJUN+JkwCvRVyG95qmmTbqfx1N4Iwt48fmzACEp7MJefAieI6nm4a1Zn/ao/Uti/b2e13CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715159649; c=relaxed/simple;
	bh=tF4iPughT/n6gbDG+mQ6IlbX52BIyWj5CwATxGx4kxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MsNddl1dIpC0kb/pj/GaJvFhnoHxwbPCk+ov2uL+3tVSwZWzDn/j32yDpd2PDtTgWJeyBy2g+bP3ME3Mn/4TQaBTsUYGX5Nsqd1K4joCVel8bNOi78cNvFGk6cX1AtjZUvHu97L37Z+IOg+sBIpd+QaoZ1+Uwpr59FAc6AUiiCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 606F81063;
	Wed,  8 May 2024 02:14:33 -0700 (PDT)
Received: from [10.57.67.194] (unknown [10.57.67.194])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A8C83F6A8;
	Wed,  8 May 2024 02:14:06 -0700 (PDT)
Message-ID: <c7a1fa3a-3e0a-4da4-8bdc-8d5b98d662c0@arm.com>
Date: Wed, 8 May 2024 10:14:05 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mqueue: fix 5 warnings about signed/unsigned
 mismatches
Content-Language: en-GB
To: John Hubbard <jhubbard@nvidia.com>, Shuah Khan <shuah@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, SeongJae Park <sj@kernel.org>,
 Valentin Obst <kernel@valentinobst.de>, linux-kselftest@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
References: <20240505221359.65258-1-jhubbard@nvidia.com>
 <a340524c-15c1-4b8e-b7a9-1fad52e97f69@arm.com>
 <c8dd4b34-f49a-4929-9b14-d2cc17e0edd8@nvidia.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <c8dd4b34-f49a-4929-9b14-d2cc17e0edd8@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/05/2024 18:04, John Hubbard wrote:
> On 5/7/24 12:54 AM, Ryan Roberts wrote:
>> On 05/05/2024 23:13, John Hubbard wrote:
> ...
>>> diff --git a/tools/testing/selftests/mqueue/mq_perf_tests.c
>>> b/tools/testing/selftests/mqueue/mq_perf_tests.c
>>> index 5c16159d0bcd..fb898850867c 100644
>>> --- a/tools/testing/selftests/mqueue/mq_perf_tests.c
>>> +++ b/tools/testing/selftests/mqueue/mq_perf_tests.c
>>> @@ -323,7 +323,8 @@ void *fake_cont_thread(void *arg)
>>>   void *cont_thread(void *arg)
>>>   {
>>>       char buff[MSG_SIZE];
>>> -    int i, priority;
>>> +    int i;
>>> +    unsigned int priority;
>>>         for (i = 0; i < num_cpus_to_pin; i++)
>>>           if (cpu_threads[i] == pthread_self())
>>> @@ -425,7 +426,8 @@ struct test test2[] = {
>>>   void *perf_test_thread(void *arg)
>>>   {
>>>       char buff[MSG_SIZE];
>>> -    int prio_out, prio_in;
>>> +    int prio_out;
>>
>> It feels a bit odd for prio_out and prio_in to have different types. I don't
>> have any prior familiararity with these tests but looks like they are ultimately
>> the parameters of mq_send() and mq_receive() which both define them as unsigned
>> ints. Perhaps both should be converted?
> 
> 
> This makes sense, and I recall wondering about it. Looking at it again,
> I see why didn't go that far: there is a mini-unit test manager inside,
> passing around priorities that are signed, throughout:
> 
>         struct test {
>             char *desc; void (*func)(int *);
>         };
> 
>         ...
> 
>         void inc_prio(int *prio) {
>             if (++*prio == mq_prio_max)
>                 *prio = 0;
>         }
> 
> However, I can probably fix up everything to match up. Given that you've
> called it out, I'll go ahead with that approach. Iit will be quite a few
> changes but they will all be trivial too.     

Ahh I see. It would certainly be an improvement, but if you don't think it's
worth the effort, then don't feel you need to do it on my account.

  
> 
> 
> thanks,

