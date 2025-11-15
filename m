Received: from smtps.ntu.edu.tw (smtps.ntu.edu.tw [140.112.2.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57271DF970
	for <llvm@lists.linux.dev>; Sat, 15 Nov 2025 03:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.112.2.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763178904; cv=none; b=gVHMQxuBqDToRKtoYd9Rag9W5AlOwSaDuZJ4Nq4uSyAcqtuf1u9F0i5C4fqFopnRiSkZn20xGa7twE42YdmidMTUtaM5LOWHv7tFGUCOmzajz98GXWobF3Eg7MKZiu1KHd9214dTbrGs6FDPqV1qZ6TSCamO/t0Y5aXmK3NvSss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763178904; c=relaxed/simple;
	bh=HayoP24JUIdXoHoI/AuuwLg36CJS6e+ecOvBex+sO7I=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=oyk0WHUwouhStrAV7P19kqt6dApNAqUkKN1bcAFgo/g8jJXTHp+dsSEPGvdcsFIsEFLEuWZHAYygtokKLafHzGwQ7LwmtvAwvp5Wc62D4oLVO8qu4dJw5opEt/VRfBYRy4aWJbxVRCSjrtBOsDqzKVDgTL9neiwsoVshTbvi0R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ntu.edu.tw; spf=pass smtp.mailfrom=ntu.edu.tw; arc=none smtp.client-ip=140.112.2.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ntu.edu.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ntu.edu.tw
Received: from wmail1.cc.ntu.edu.tw (wmail1.cc.ntu.edu.tw [140.112.2.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtps.ntu.edu.tw (Postfix) with ESMTPSA id 8F153B4F4;
	Sat, 15 Nov 2025 11:44:36 +0800 (CST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Sat, 15 Nov 2025 11:44:36 +0800
From: Bill Tsui <b10902118@ntu.edu.tw>
To: Will Deacon <will@kernel.org>
Cc: oleg@redhat.com, catalin.marinas@arm.com, nathan@kernel.org,
 nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH v4 1/1] arm64: ptrace: fix hw_break_set() to set addr and
 ctrl together
In-Reply-To: <aRdVZmeOHYbm24NJ@willie-the-truck>
References: <20251016154401.35799-1-b10902118@ntu.edu.tw>
 <20251018133731.42505-1-b10902118@ntu.edu.tw>
 <20251018133731.42505-2-b10902118@ntu.edu.tw>
 <aRdVZmeOHYbm24NJ@willie-the-truck>
User-Agent: Roundcube Webmail/1.4
Message-ID: <617369509d2fa1948b8851e070dd441e@ntu.edu.tw>
X-Sender: b10902118@ntu.edu.tw
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-11-15 00:14, Will Deacon wrote:
> ... but you only implement this for the native (64-bit) case, so I 
> don't
> understand how it helps with the problem above.

Yes it is only for 64-bit tracer to debug 32-bit processes because
64-bit tracer always use 64-bit ptrace API (PTRACE_SETREGSET) regardless
of tracee, so only 64-bit code were changed.

>> @@ -524,9 +506,6 @@ static int hw_break_set(struct task_struct 
>> *target,
>>  			return -EINVAL;
>>  		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &addr,
>>  					 offset, offset + PTRACE_HBP_ADDR_SZ);
>> -		if (ret)
>> -			return ret;
>> -		ret = ptrace_hbp_set_addr(note_type, target, idx, addr);
>>  		if (ret)
>>  			return ret;
>>  		offset += PTRACE_HBP_ADDR_SZ;
>> @@ -537,10 +516,11 @@ static int hw_break_set(struct task_struct 
>> *target,
>>  					 offset, offset + PTRACE_HBP_CTRL_SZ);
>>  		if (ret)
>>  			return ret;
>> -		ret = ptrace_hbp_set_ctrl(note_type, target, idx, ctrl);
>> +		offset += PTRACE_HBP_CTRL_SZ;
>> +
>> +		ret = ptrace_hbp_set(note_type, target, idx, addr, ctrl);
> 
> Doesn't this break the case where userspace tries only to set the 
> address?
> The loop will break out when !count without updating anything.
> 

The case doesn't exist for normal use. I saw that as a validation
rather than an intended stop point. If in doubt, I can remove it.

The signature from man ptrace(2)
	ptrace(PTRACE_SETREGSET, pid, NT_foo, &iov)
requires all registers' values to be specified in iov in order. And the
unit of debug registers is the inline structure in user_hwdebug_state:
	struct {
		__u64	addr;
		__u32	ctrl;
		__u32	pad;
	}		dbg_regs[16];
and userspace uses by:
	struct user_hwdebug_state dreg_state;
	ioVec.iov_base = &dreg_state;
	ioVec.iov_len = sizeof(dreg_state.dbg_info) + sizeof(dreg_state.pad) 
+				(sizeof(dreg_state.dbg_regs[0]) * m_max_hwp_supported);

	for (uint32_t i = 0; i < m_max_hwp_supported; i++) {
		dreg_state.dbg_regs[i].addr = m_hwp_regs[i].address;
		dreg_state.dbg_regs[i].ctrl = m_hwp_regs[i].control;
	}
The only case of setting only address is to have iov length only reach
the first register's .addr, but I don't think that memory layout should
be relied on.

> As I mentioned before, I'd prefer to leave this code as-is short of
> removing the indirection through perf entirely.

I am working on that, the side effects are hard to trace, and I think
this patch can make removing perf easier by reducing calls to it and
make clearer what hardware API ptrace needs. This recurs to me and I
think it can be a separated patch.

Here is my progress on removing perf:
I tried to directly set by hw_breakpoint_control, which perf finally
use, but we also relied on perf event handling cpu interrupts when
breakpoints get triggered. This is the hardest part and I am learning
how the kernel handles it across so many others. I feel that the use
of perf has its reasons but definitely there is space to improve.

Anyway, I respect maintainer's decision. I just felt that you thought
this is complicated so I simplifed it. Now I explains the correctness
and how it relates to your final goal. If there are still concerns,
please directly reject me, then I can also stop holding on it.

Thanks,
Bill
