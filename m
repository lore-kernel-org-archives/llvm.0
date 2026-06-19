Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7C8388895
	for <llvm@lists.linux.dev>; Fri, 19 Jun 2026 12:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781873154; cv=none; b=c8tDVB4BwZ7tHG8emPmGBeBJAsUmVkzFC+0mgtJp9OsdKNTfpLTqrztbBkfHh2RWnwBLakRAFFA6k+xmQR2tN86Hhec4Scz6Dj9qvxi1SbSANKo3wTi2qULFGQAhFICAxsVKvWKpimbrVuzrhELt2dtGlAQveCQUPhtKAbOHFyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781873154; c=relaxed/simple;
	bh=xivFutCZ2EfyWJDK6alMYZk0Fv95CRsTRtwsuuv6g+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QaafzNY5VmEawB6FXC4oBadoDPJGpSSHka48W433aZPTQCcF0/LA8jvZXGfHrQZIEcCG21y5iuu2M/ACfGs/zu8OnQInRs2RWNprWYzIxeSAP9SY8Jf4wM++JAwrs1v1xMxzA5IyBSO0p+s4g3FTKD+ZKV5e01l5XvmmOQpQeBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 65JCjNe5011843;
	Fri, 19 Jun 2026 21:45:23 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 65JCjN6R011838
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 19 Jun 2026 21:45:23 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <249b8ebd-1ef8-4c17-bc9c-a63c051c2369@I-love.SAKURA.ne.jp>
Date: Fri, 19 Jun 2026 21:45:20 +0900
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rseq: fix using an uninitialized stack variable in
 rseq_exit_user_update
To: Peter Zijlstra <peterz@infradead.org>, Qing Wang <wangqing7171@gmail.com>
Cc: mathieu.desnoyers@efficios.com, dvyukov@google.com, justinstitt@google.com,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        mark.rutland@arm.com, mingo@kernel.org, morbo@google.com,
        nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
        syzbot+185a631927096f9da2fc@syzkaller.appspotmail.com, tglx@kernel.org
References: <20260601143934.GT3493090@noisy.programming.kicks-ass.net>
 <20260602030854.574038-1-wangqing7171@gmail.com>
 <20260602104255.GG4149641@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <20260602104255.GG4149641@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav101.rs.sakura.ne.jp
X-Virus-Status: clean

On 2026/06/02 19:42, Peter Zijlstra wrote:
> On Tue, Jun 02, 2026 at 11:08:54AM +0800, Qing Wang wrote:
>> There is an bug which is an uninitialized stack variable use in
>> `rseq_exit_user_update()` reported by syzbot:
>>
>> BUG: KMSAN: kernel-infoleak in rseq_set_ids_get_csaddr include/linux/rseq_entry.h:502 [inline]
>>
>> The local variable:
>> ```c
>> 	struct rseq_ids ids = {
>> 		.cpu_id	 = task_cpu(t),
>> 		.mm_cid	 = task_mm_cid(t),
>> 		.node_id = cpu_to_node(ids.cpu_id),
>> 	};
>> ```
> 
> FWIW, I've no idea what that ``` nonsense is, but it does not belong in
> Changelogs. I've removed it.
> 

It seems that this problem is still happening after
commit 6d99479799c6 ("rseq: Fix using an uninitialized stack variable
in rseq_exit_user_update()") was applied. Please check.

