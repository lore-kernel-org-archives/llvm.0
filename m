Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31886489FAC
	for <llvm@lists.linux.dev>; Thu,  8 Oct 2026 09:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791451079; cv=none; b=j1f9PZay919LwIR9fd344CYWaYf4b397XwrGkI7e9Ft0fNf8TJl/nb/aTry2N5it2eT2REqNn4Wly7+QpnSnkFCQOcmZSnvGWlvz7KdobaaydEQ283l3tjqiPlhnPnunkkJxdQpLPwHWju/CuQTjtTJbULst7jCLhd/tpr4B/lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791451079; c=relaxed/simple;
	bh=BythzgJZcCsED2Q0dVtAj8TkAWAh4Q0vRRYNVZq7wi8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SnfUy0D+Vis0ZFMeXnwFDXjMcQ0kgZWqoXK1KHyJ5altTTWnppY+iVahB3jV0+8wWu1qeO90VYNMOVpPgpJqTBE/YPF46AA/bJ0IMI8kj32LN6QPO1ZYEoUM0708FlEL+G6YfLzaJckXZujUo+/C1RZdIXYgH+tRx0raC+Rt98k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=C4HJQnHZ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="C4HJQnHZ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A3121477;
	Thu,  8 Oct 2026 02:17:42 -0700 (PDT)
Received: from [10.211.55.3] (unknown [10.57.55.7])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0DDD83F959;
	Thu,  8 Oct 2026 02:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791451065; bh=BythzgJZcCsED2Q0dVtAj8TkAWAh4Q0vRRYNVZq7wi8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=C4HJQnHZA+/S0SAYFkSRCDzEWC0XS1yVIvox5ZhV0zkchd1+inr9I9jZSEyjrQZrP
	 2Kaa1b8L1T7/yFaJ2sPVT3jKJqDcLhQTf5PkJgj1Tp38m/fjOWckzEbz3WIBPZeBMk
	 lqfnAo95OEYylCQitjOkr5e03w61sDRZ8hr7ZMoc=
Message-ID: <7490d5e6-ac9b-4f23-b58d-60eec2882e60@arm.com>
Date: Thu, 8 Oct 2026 10:17:33 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH] arm_mpam: make the mon_sel guard conditional only
To: Sasha Levin <sashal@kernel.org>, James Morse <james.morse@arm.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
 Andre Przywara <andre.przywara@arm.com>, Gavin Shan <gshan@redhat.com>
Cc: "kernelci.org bot" <bot@kernelci.org>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu
 <fenghuay@nvidia.com>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20261003121251.3942666-1-sashal@kernel.org>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261003121251.3942666-1-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sasha,

Thanks for the report and fix.

On 03/10/2026 13:12, Sasha Levin wrote:
> Building arm64 allmodconfig with clang fails:
> 
>   drivers/resctrl/mpam_internal.h:207:7: error: ignoring return value
>   of function declared with 'warn_unused_result' attribute
>   [-Werror,-Wunused-result]
>     207 |              mpam_mon_sel_lock(_T), mpam_mon_sel_unlock(_T));
> 
> mpam_mon_sel_lock() is __must_check and can fail: for an MSC accessed
> through the MPAM-Fb firmware interface it returns false when called
> from a context that cannot sleep. The mon_sel guard was defined with
> DEFINE_GUARD(), which calls it unconditionally and discards the
> result, so a guard(mon_sel) user would carry on without the lock and
> release it on scope exit. The unconditional guard only exists as the
> base for the conditional mon_sel_lock variant, which is the one
> actually used.
> 
> Define mon_sel_lock directly as a conditional guard class instead, as
> posix-timers does for lock_timer: the constructor returns NULL when
> the lock cannot be taken, and the destructor only releases a lock
> that was taken. ACQUIRE(mon_sel_lock, ...) works as before, including
> ACQUIRE_ERR() returning -EBUSY on failure, and there is no
> unconditional variant left to misuse.
> 
> Reported-by: kernelci.org bot <bot@kernelci.org>
> Closes: https://d.kernelci.org/i/maestro:66f869ecbbb5b8592562ffd89f049c5ddf682547
> Closes: https://d.kernelci.org/i/maestro:647269216758644837afcaac8e67d8dbe713a0e2
> Fixes: 0db1715e4c9c ("arm_mpam: propagate MSC access errors for hw_probe functions")
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/resctrl/mpam_internal.h | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index ee7c3953a9b6c..be1795b29aca2 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -203,9 +203,10 @@ static inline int mpam_mon_sel_lock_init(struct device *dev,
>  	return devm_mutex_init(dev, &msc->mon_sel_mutex);
>  }
>  
> -DEFINE_GUARD(mon_sel, struct mpam_msc *,
> -	     mpam_mon_sel_lock(_T), mpam_mon_sel_unlock(_T));
> -DEFINE_GUARD_COND(mon_sel, _lock, mpam_mon_sel_lock(_T), _RET);
> +DEFINE_CLASS(mon_sel_lock, struct mpam_msc *,
> +	     _T ? mpam_mon_sel_unlock(_T) : (void)0,

Could this line be an if statement? That looks to be common in other
users of DEFINE_CLASS().

if (_T) mpam_mon_sel_unlock(_T)

Thanks,

Ben

> +	     mpam_mon_sel_lock(msc) ? msc : NULL, struct mpam_msc *msc);
> +DEFINE_CLASS_IS_COND_GUARD(mon_sel_lock);
>  
>  /* Bits for mpam features bitmaps */
>  enum mpam_device_features {

