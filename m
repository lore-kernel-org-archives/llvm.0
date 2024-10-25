Received: from smtpout.efficios.com (smtpout.efficios.com [167.114.26.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675831F7549
	for <llvm@lists.linux.dev>; Fri, 25 Oct 2024 12:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=167.114.26.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729860159; cv=none; b=dE5ZMzdyEf9FiEsJuA+MVzGsjE4c+JG/lv9y5bxnbBCqbwne24AnFrpb2Z4195RRZjSdx+o1wVBfwxZELUqq2o/0zL+YaoXENcQj/ltpfXMMEJNTwjExGrcBImtt8gAFPra7kyhJqs/BswSYYT5xMb+nrM1hButJhRZhEHd3yQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729860159; c=relaxed/simple;
	bh=ssFg3LEWolkyOVM9U9SrDuAw+tLUXM3PGgfKrTrbSHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=izOly330InaqSe8OUEvngOvHsj9r8RH9lGyikWIgkYIv1+BjoZHvdgYORABq5ADCblXZsYWLSkVTgPOBa8je2v9npqvXoFDU5A7LtM4YOndIKSPLbYKQubiV/eEKdzCCZQfp0WN6B2KAO+6ORGjQH6lAlZmzkzR+0kCG1VwcZCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=GwbMsP2+; arc=none smtp.client-ip=167.114.26.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="GwbMsP2+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
	s=smtpout1; t=1729860152;
	bh=ssFg3LEWolkyOVM9U9SrDuAw+tLUXM3PGgfKrTrbSHo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GwbMsP2+bp1uUPQBo63JsQaF7VLJhzuT06g3oEYMg9KRUM+PqYhsXpyh3G+Qx20AR
	 77acNVQGCHTuWQH0fgGEQX43b1ucuEoL78gX+deCSE404jYv9oJ5Z2ihEAh5iF8dNG
	 t9w0kLEKO6PUZObilUBmhXg3P4stX+N9bevdLxoi2HNkGUfpkJnmWZOElSft9bw9Ky
	 udyVdDyzpbfSWjQ8TqQ6nE00ThqN56fEb88BsWM1uBXbaWDXY7oph6H4I1G0UbZRbV
	 tXCU3MxUDola8JiGRSEMXVtgXPy8UQVUM0oUuLaA2D6x9mgxmGDOTkxY70VZWb9UKk
	 VKqGqfdp3ymcw==
Received: from [172.16.0.134] (96-127-217-162.qc.cable.ebox.net [96.127.217.162])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4XZj9M6Ytvz15sH;
	Fri, 25 Oct 2024 08:42:31 -0400 (EDT)
Message-ID: <b0e83808-3869-4233-b977-e80ba1282904@efficios.com>
Date: Fri, 25 Oct 2024 08:40:47 -0400
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/membarrier: Fix redundant load of membarrier_state
To: Michael Ellerman <mpe@ellerman.id.au>,
 "Nysal Jan K.A." <nysal@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linuxppc-dev@lists.ozlabs.org, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Vlastimil Babka <vbabka@suse.cz>, Kent Overstreet
 <kent.overstreet@linux.dev>, Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Roman Gushchin <roman.gushchin@linux.dev>, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20241007053936.833392-1-nysal@linux.ibm.com>
 <87frolja8d.fsf@mail.lhotse>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <87frolja8d.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-10-24 20:29, Michael Ellerman wrote:
> [To += Mathieu]
> 
> "Nysal Jan K.A." <nysal@linux.ibm.com> writes:
>> From: "Nysal Jan K.A" <nysal@linux.ibm.com>
>>
>> On architectures where ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
>> is not selected, sync_core_before_usermode() is a no-op.
>> In membarrier_mm_sync_core_before_usermode() the compiler does not
>> eliminate redundant branches and the load of mm->membarrier_state
>> for this case as the atomic_read() cannot be optimized away.
> 
> I was wondering if this was caused by powerpc's arch_atomic_read() which
> uses asm volatile.
> 
> But replacing arch_atomic_read() with READ_ONCE() makes no difference,
> presumably because the compiler still can't see that the READ_ONCE() is
> unnecessary (which is kind of by design).
> 
>> Here's a snippet of the code generated for finish_task_switch() on powerpc:
>>
>> 1b786c:   ld      r26,2624(r30)   # mm = rq->prev_mm;
>> .......
>> 1b78c8:   cmpdi   cr7,r26,0
>> 1b78cc:   beq     cr7,1b78e4 <finish_task_switch+0xd0>
>> 1b78d0:   ld      r9,2312(r13)    # current
>> 1b78d4:   ld      r9,1888(r9)     # current->mm
>> 1b78d8:   cmpd    cr7,r26,r9
>> 1b78dc:   beq     cr7,1b7a70 <finish_task_switch+0x25c>
>> 1b78e0:   hwsync
>> 1b78e4:   cmplwi  cr7,r27,128
>> .......
>> 1b7a70:   lwz     r9,176(r26)     # atomic_read(&mm->membarrier_state)
>> 1b7a74:   b       1b78e0 <finish_task_switch+0xcc>
>>
>> This was found while analyzing "perf c2c" reports on kernels prior
>> to commit c1753fd02a00 ("mm: move mm_count into its own cache line")
>> where mm_count was false sharing with membarrier_state.
> 
> So it was causing a noticable performance blip? But isn't anymore?

I indeed moved mm_count into its own cacheline in response to
performance regressions reports, which were caused by simply
loading the pcpu_cid pointer frequently enough. So if membarrier_state
was also sharing that cache line, it makes sense that moving
mm_count away helped there as well.

[...]

>> ---
>>   include/linux/sched/mm.h | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
>> index 07bb8d4181d7..042e60ab853a 100644
>> --- a/include/linux/sched/mm.h
>> +++ b/include/linux/sched/mm.h
>> @@ -540,6 +540,8 @@ enum {
>>   
>>   static inline void membarrier_mm_sync_core_before_usermode(struct mm_struct *mm)
>>   {
>> +	if (!IS_ENABLED(CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE))
>> +		return;
>>   	if (current->mm != mm)
>>   		return;
>>   	if (likely(!(atomic_read(&mm->membarrier_state) &

I prefer the approach above, because it requires fewer kernel
configurations to reach the same compilation code coverage.

Thanks,

Mathieu


> 
> The other option would be to have a completely separate stub, eg:
> 
>    #ifdef CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
>    static inline void membarrier_mm_sync_core_before_usermode(struct mm_struct *mm)
>    {
>            if (current->mm != mm)
>                    return;
>            if (likely(!(atomic_read(&mm->membarrier_state) &
>                         MEMBARRIER_STATE_PRIVATE_EXPEDITED_SYNC_CORE)))
>                    return;
>            sync_core_before_usermode();
>    }
>    #else
>    static inline void membarrier_mm_sync_core_before_usermode(struct mm_struct *mm) { }
>    #endif
> 
> Not sure what folks prefer.
> 
> In either case I think it's probably worth a short comment explaining
> why it's worth the trouble (ie. that the atomic_read() prevents the
> compiler from doing DCE).
> 
> cheers

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com

