Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5A98C1F
	for <llvm@lists.linux.dev>; Fri, 19 Jun 2026 22:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781908539; cv=none; b=NSfqygRFTEXrAfwgONm7eKEiT+W5VWe5WhqQU98AfyCBX/ryNr0PI6cr7BBNA2Y7pk803DGJDoix77OkyaOr+uFCnM6ahEnDhgpxRb/8pZMUxsYFkx2GE4EE4jW94rQooy0OM5tRBrkZI4oME/UrYMqBF00jkJg9jFJZO5A28CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781908539; c=relaxed/simple;
	bh=9ffCqLtNbJdKGh1xajVRrsJdDWYbKvi7OF7TmsQgpOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EgeHP1/PMxf2AscblLpOyLNIqvzV0rgHFULuM5zbeKjAF+y3WmLM5kOr0UY2KlKIOoovddZ4hmYF10PK1Wo12SVctNgeRXAhYrnrdlFrLgg0BMXIAkHFMv2YST1NxskG7vPpr6c5eRd+Nu4tIRpCWVadqKOWyXHC5LimxExGsJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 65JMYx82045259;
	Sat, 20 Jun 2026 07:34:59 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 65JMYxqW045243
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Sat, 20 Jun 2026 07:34:59 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <8971cc3f-c0dc-49ab-a278-690a676cd5a9@I-love.SAKURA.ne.jp>
Date: Sat, 20 Jun 2026 07:34:58 +0900
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rseq: fix using an uninitialized stack variable in
 rseq_exit_user_update
To: Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
        Qing Wang <wangqing7171@gmail.com>
Cc: mathieu.desnoyers@efficios.com, dvyukov@google.com, justinstitt@google.com,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        mark.rutland@arm.com, mingo@kernel.org, morbo@google.com,
        nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
        syzbot+185a631927096f9da2fc@syzkaller.appspotmail.com
References: <20260601143934.GT3493090@noisy.programming.kicks-ass.net>
 <20260602030854.574038-1-wangqing7171@gmail.com>
 <20260602104255.GG4149641@noisy.programming.kicks-ass.net>
 <249b8ebd-1ef8-4c17-bc9c-a63c051c2369@I-love.SAKURA.ne.jp>
 <8733yiconb.ffs@fw13>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <8733yiconb.ffs@fw13>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav101.rs.sakura.ne.jp
X-Virus-Status: clean

On 2026/06/20 4:32, Thomas Gleixner wrote:
> %On Fri, Jun 19 2026 at 21:45, Tetsuo Handa wrote:
>> On 2026/06/02 19:42, Peter Zijlstra wrote:
>>> On Tue, Jun 02, 2026 at 11:08:54AM +0800, Qing Wang wrote:
>>>> There is an bug which is an uninitialized stack variable use in
>>>> `rseq_exit_user_update()` reported by syzbot:
>>>>
>>>> BUG: KMSAN: kernel-infoleak in rseq_set_ids_get_csaddr include/linux/rseq_entry.h:502 [inline]
>>>>
>>>> The local variable:
>>>> ```c
>>>> 	struct rseq_ids ids = {
>>>> 		.cpu_id	 = task_cpu(t),
>>>> 		.mm_cid	 = task_mm_cid(t),
>>>> 		.node_id = cpu_to_node(ids.cpu_id),
>>>> 	};
>>>> ```
>>>
>>> FWIW, I've no idea what that ``` nonsense is, but it does not belong in
>>> Changelogs. I've removed it.
>>>
>>
>> It seems that this problem is still happening after
>> commit 6d99479799c6 ("rseq: Fix using an uninitialized stack variable
>> in rseq_exit_user_update()") was applied. Please check.
> 
> It seems is not really helpful. If you observe the problem can you
> please provide the full debug splat?

Please fetch the full debug splat from https://syzkaller.appspot.com/bug?extid=185a631927096f9da2fc .
This problem is still happening as of commit 9ecfb2f7287a which includes commit 6d99479799c6.

