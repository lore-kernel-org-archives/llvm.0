Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F4AA488206
	for <llvm@lists.linux.dev>; Wed,  7 Oct 2026 10:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369684; cv=none; b=ZR7uJ0sawuV4eRGO2RclR1HmsFx5ZQUJGga+8iLFqBiQgrDbJ6UHLg3JhKHNFVE0zpYK7rWoEx9HWDVzkF/OPVnT9ZPQDTaFOHrzflVcblk23LbNK8dg6DaQeFbqJIv6AiJAqBpsfcUahdXEuHJL2hLBgCXxRoqi51ClEBNDr1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369684; c=relaxed/simple;
	bh=+F/9OZO/aZ5xfG9xyxkGlHXRyzNQp168Xt0vScQpKew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D4xHjzdy3K9j0Xq8Ci8XwrMRRSfOS8djtdzYthbT/N3VWsLCLyn2ZM8FyTcA4ies3qkbkTLSoAiyCuoe+Wfuhy2M6hxnf2+UE9NAthEjOhabp0mGCSHVvx+xejHTi7OZgPLlvS2vxvLTuA32HuM9hN/85924SHGF6bWb+cEoyyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Xunggp8f; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Xunggp8f"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 12477152B;
	Wed,  7 Oct 2026 03:40:48 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE5EF3F86F;
	Wed,  7 Oct 2026 03:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791369651; bh=+F/9OZO/aZ5xfG9xyxkGlHXRyzNQp168Xt0vScQpKew=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Xunggp8fRg8SY1Ank32l2ofzcNfDVSm4vHDRvYHTjASnNNtDU4KN7ESQMzSuavU0i
	 5sWDUFnM38lXq3ve3FT171Mz65F/aK07oBI0e1YOKX4meNEdm5o4dZIWqLIg2Jw0y5
	 l/hiN+pNmlJddW05178Ty4VsAliHKs7MpgH/vzTE=
Message-ID: <b370a7c3-73e1-4a2c-875b-c2f0b496b96a@arm.com>
Date: Wed, 7 Oct 2026 12:40:47 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: make the mon_sel guard conditional only
To: Sasha Levin <sashal@kernel.org>, James Morse <james.morse@arm.com>,
 Ben Horgan <ben.horgan@arm.com>, Nathan Chancellor <nathan@kernel.org>,
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
 Gavin Shan <gshan@redhat.com>
Cc: "kernelci.org bot" <bot@kernelci.org>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu
 <fenghuay@nvidia.com>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20261003121251.3942666-1-sashal@kernel.org>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261003121251.3942666-1-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sasha,

many thanks for doing this!

On 10/3/26 14:12, Sasha Levin wrote:
> Building arm64 allmodconfig with clang fails:
> 
>    drivers/resctrl/mpam_internal.h:207:7: error: ignoring return value
>    of function declared with 'warn_unused_result' attribute
>    [-Werror,-Wunused-result]
>      207 |              mpam_mon_sel_lock(_T), mpam_mon_sel_unlock(_T));

Ooops, I indeed tested this only with GCC.

> mpam_mon_sel_lock() is __must_check and can fail: for an MSC accessed
> through the MPAM-Fb firmware interface it returns false when called
> from a context that cannot sleep. The mon_sel guard was defined with
> DEFINE_GUARD(), which calls it unconditionally and discards the
> result, so a guard(mon_sel) user would carry on without the lock and
> release it on scope exit. The unconditional guard only exists as the
> base for the conditional mon_sel_lock variant, which is the one
> actually used.

Yes, that was the idea I had to model this particular lock, though I 
wasn't entirely happy with it, but didn't dare to create a whole new 
class. Turns out my solution was not only slightly less elegant, but 
also broken ;-) So many thanks for pointing this out and providing the 
proper solution.

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
>   drivers/resctrl/mpam_internal.h | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index ee7c3953a9b6c..be1795b29aca2 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -203,9 +203,10 @@ static inline int mpam_mon_sel_lock_init(struct device *dev,
>   	return devm_mutex_init(dev, &msc->mon_sel_mutex);
>   }
>   
> -DEFINE_GUARD(mon_sel, struct mpam_msc *,
> -	     mpam_mon_sel_lock(_T), mpam_mon_sel_unlock(_T));
> -DEFINE_GUARD_COND(mon_sel, _lock, mpam_mon_sel_lock(_T), _RET);
> +DEFINE_CLASS(mon_sel_lock, struct mpam_msc *,
> +	     _T ? mpam_mon_sel_unlock(_T) : (void)0,
> +	     mpam_mon_sel_lock(msc) ? msc : NULL, struct mpam_msc *msc);
> +DEFINE_CLASS_IS_COND_GUARD(mon_sel_lock);

Ah, that's ... nice, I guess, though I share that headache argument with 
Nathan ;-)
So that looks superficially right, but the details go a bit above my 
head, although I tested it to both still work and to fix the LLVM build 
error, so:

Tested-by: Andre Przywara <andre.przywara@arm.com>

Thanks,
Andre

>   
>   /* Bits for mpam features bitmaps */
>   enum mpam_device_features {

