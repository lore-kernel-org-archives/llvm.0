Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE2E26290;
	Fri, 14 Nov 2025 16:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763136876; cv=none; b=YIVX5LKSKHaqJyebExWZYbMfW+sICygUOWy/mVqAVmwtw9Z6TxiUMqDqo+dbtOe+lCGILJHOxVW8BErDlRtW3FQywchMisiNNtx+c5fhkypoUMATrEgBZtmRl+30BMm3LS+erewzQsjnaw00jFxE6ba6YnCVZI5B4w0OcsOIIBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763136876; c=relaxed/simple;
	bh=bvJRcxzzKLlecIpg4D1rJZr4qSHf+dC7+R6tCSry39I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZCtqy2V+p0KVljWTU9i5NGxVN866D5GJIaHPYeJQIxrCyJF9a4y1+cXf3jLfXk0l3z4aJQANYBJ6UOZd27nDVjlezr4p8zf9Z8JOfRFBOHPdpA05DyTpS9ebgYTCV1ODTpsl3H3ewBOLUZ2jgVkA1W/a9i2r0w59IJaB5EhwnZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rsDcbHSC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rsDcbHSC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C428C4CEF1;
	Fri, 14 Nov 2025 16:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763136876;
	bh=bvJRcxzzKLlecIpg4D1rJZr4qSHf+dC7+R6tCSry39I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rsDcbHSCRx3ubUvTF5wvpcX53nWt37krucurCQKf/bmwGDgAjWHSfzaaSS92j8S8W
	 BM9KWD6tNnC6WNO/YPAJR3L7Yyz8ymwvvlR3G9uDQ/l0AZMR1rqW21gZXMnQXNDE/j
	 vSHdrEBQkm11cqS1aYvIn1nv8m7+AWeP/wddttVILXaVW+oDFAIEImCcTIcrBp2aFK
	 mcD7xNOantzjwxdaXsgjYwGXUGmK1RvpF1hWu9HhiOOqVkm5A630mI8mlnWFD/DaVC
	 62gWfg8VKOIHm9pSs3lAy+X9rEYcw5VqtrwIZir01OTfJaR2o93Cd6N3PBkRVh3ocW
	 591X1RgzuGRhw==
Date: Fri, 14 Nov 2025 16:14:30 +0000
From: Will Deacon <will@kernel.org>
To: Bill Tsui <b10902118@ntu.edu.tw>
Cc: oleg@redhat.com, catalin.marinas@arm.com, nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com, morbo@google.com,
	justinstitt@google.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v4 1/1] arm64: ptrace: fix hw_break_set() to set addr and
 ctrl together
Message-ID: <aRdVZmeOHYbm24NJ@willie-the-truck>
References: <20251016154401.35799-1-b10902118@ntu.edu.tw>
 <20251018133731.42505-1-b10902118@ntu.edu.tw>
 <20251018133731.42505-2-b10902118@ntu.edu.tw>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018133731.42505-2-b10902118@ntu.edu.tw>

On Sat, Oct 18, 2025 at 09:37:31PM +0800, Bill Tsui wrote:
> This patch fixes the failure of PTRACE_SETREGSET when setting a hardware
> breakpoint on a non-4-byte aligned address with a valid control to a
> 32-bit tracee. The issue was discovered while testing LLDB.
> 
> Link: https://github.com/llvm/llvm-project/pull/152284
> 
> The failure happens because hw_break_set() checks and sets the breakpoint
> address and control separately. This can result in an check failure when
> it first validates the address to be set with old control.
> 
> For example, the control are initialized with breakpoint length of 4.
> Combining with a non-4-byte aligned address would cross a 4-byte boundary,
> which is invalid. However, the user-provided control may actually specify a
> length of 1, which should be valid.
> 
> The fix is to set the address and control together.

... but you only implement this for the native (64-bit) case, so I don't
understand how it helps with the problem above.

> For reference, the check is in
> 	arch/arm64/kernel/hw_breakpoint.c:hw_breakpoint_arch_parse()
> which is called via:
> 	modify_user_hw_breakpoint()
> 	-> modify_user_hw_breakpoint_check()
> 	-> hw_breakpoint_parse()
> 	-> hw_breakpoint_arch_parse()

You don't need to include these details here.

> @@ -524,9 +506,6 @@ static int hw_break_set(struct task_struct *target,
>  			return -EINVAL;
>  		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &addr,
>  					 offset, offset + PTRACE_HBP_ADDR_SZ);
> -		if (ret)
> -			return ret;
> -		ret = ptrace_hbp_set_addr(note_type, target, idx, addr);
>  		if (ret)
>  			return ret;
>  		offset += PTRACE_HBP_ADDR_SZ;
> @@ -537,10 +516,11 @@ static int hw_break_set(struct task_struct *target,
>  					 offset, offset + PTRACE_HBP_CTRL_SZ);
>  		if (ret)
>  			return ret;
> -		ret = ptrace_hbp_set_ctrl(note_type, target, idx, ctrl);
> +		offset += PTRACE_HBP_CTRL_SZ;
> +
> +		ret = ptrace_hbp_set(note_type, target, idx, addr, ctrl);

Doesn't this break the case where userspace tries only to set the address?
The loop will break out when !count without updating anything.

As I mentioned before, I'd prefer to leave this code as-is short of
removing the indirection through perf entirely.

Will
