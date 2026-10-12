Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34DA353A88
	for <llvm@lists.linux.dev>; Mon, 12 Oct 2026 15:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791817216; cv=none; b=Le6i5fhIyY/LfiD/ZrazHQFzZRikXjsxPK4uTfqrDFzioo/CX5qwwi1JCGNFsBoVS3Q+CLebkxGlmwPXedmSO2273UngBddI/muPYsI9MShWwzPZqiOlRvVXy6uHxufi/kCc2RgSwdNAVK+CHBbSo22NiUkCwOlOu0ftBL6J5MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791817216; c=relaxed/simple;
	bh=8NtkGDoD0oacwDzS0CgSBoq15Z6lRUN/PdlItQmGmFE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=hsuIPRwFpcSy0EQG1qZESQmolifQSASEQnh6mc+Tj0ODBIC6bSSVHgK/YqP7SRnwdnV52bQhV5Y+frFOw82M2QBeOqvV7DVvgPlK4LHCyWLQWfU9LRty1cU39sbX1mieCAyq+wHX6LArqtBW7kAucve/Sf2a3q5Zy86EAwlZNe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=dc17l/GJ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="dc17l/GJ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E2F87169E;
	Mon, 12 Oct 2026 08:00:10 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 337CB3F673;
	Mon, 12 Oct 2026 08:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791817214; bh=8NtkGDoD0oacwDzS0CgSBoq15Z6lRUN/PdlItQmGmFE=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=dc17l/GJ2ZpY749n5DOcZCH2iM6lV1y9aoppvsDsDO5Q3t96BV7ZQtONgXUrJ94GL
	 HRjhJjGJmEhaMn8IWNsl1H9tHqrIBVlwoZlhpbAh5RHuocxcRON/RE8au0oHu6xxQ/
	 W3zXbdIDQR7XzPffNpuU8CNM5FDlBL3Fhn3Gm8uI=
Message-ID: <d8f4fa6c-cb56-4dff-8951-ed2fdb859dfa@arm.com>
Date: Mon, 12 Oct 2026 16:00:10 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm_mpam: make the mon_sel guard conditional only
From: Ben Horgan <ben.horgan@arm.com>
To: Sasha Levin <sashal@kernel.org>
Cc: andre.przywara@arm.com, bot@kernelci.org, fenghuay@nvidia.com,
 gshan@redhat.com, james.morse@arm.com, jonathan.cameron@oss.qualcomm.com,
 justinstitt@google.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, morbo@google.com,
 nathan@kernel.org, ndesaulniers@google.com, reinette.chatre@intel.com,
 Catalin Marinas <catalin.marinas@arm.com>, "will@kernel.org"
 <will@kernel.org>
References: <7490d5e6-ac9b-4f23-b58d-60eec2882e60@arm.com>
 <20261009163235.3-1-sashal@kernel.org>
 <18df4643-4213-4e0f-94e7-b1e43adcb5c3@arm.com>
Content-Language: en-US
In-Reply-To: <18df4643-4213-4e0f-94e7-b1e43adcb5c3@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

+CC: Catalin, Will

Hi Catalin,

This is the clang build fix I mentioned. Just adding a note here as I missed to CC you before.

Thanks,
Ben

On 09/10/2026 17:59, Ben Horgan wrote:
> Hi Sasha,
> 
> On 10/9/26 17:32, Sasha Levin wrote:
>> Building arm64 allmodconfig with clang fails:
>>
>>   drivers/resctrl/mpam_internal.h:207:7: error: ignoring return value
>>   of function declared with 'warn_unused_result' attribute
>>   [-Werror,-Wunused-result]
>>     207 |              mpam_mon_sel_lock(_T), mpam_mon_sel_unlock(_T));
>>
>> mpam_mon_sel_lock() is __must_check and can fail: for an MSC accessed
>> through the MPAM-Fb firmware interface it returns false when called
>> from a context that cannot sleep. The mon_sel guard was defined with
>> DEFINE_GUARD(), which calls it unconditionally and discards the
>> result, so a guard(mon_sel) user would carry on without the lock and
>> release it on scope exit. The unconditional guard only exists as the
>> base for the conditional mon_sel_lock variant, which is the one
>> actually used.
>>
>> Define mon_sel_lock directly as a conditional guard class instead, as
>> posix-timers does for lock_timer: the constructor returns NULL when
>> the lock cannot be taken, and the destructor only releases a lock
>> that was taken. ACQUIRE(mon_sel_lock, ...) works as before, including
>> ACQUIRE_ERR() returning -EBUSY on failure, and there is no
>> unconditional variant left to misuse.
>>
>> Reported-by: kernelci.org bot <bot@kernelci.org>
>> Closes: https://d.kernelci.org/i/maestro:66f869ecbbb5b8592562ffd89f049c5ddf682547
>> Closes: https://d.kernelci.org/i/maestro:647269216758644837afcaac8e67d8dbe713a0e2
>> Fixes: 0db1715e4c9c ("arm_mpam: propagate MSC access errors for hw_probe functions")
>> Assisted-by: LLM
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
> 
> Looks good to me.
> 
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> 
> Thanks,
> 
> Ben
> 
>> ---
>> Changes in v2:
>> - Use an if statement in the destructor, as suggested by Ben Horgan.
>>
>>  drivers/resctrl/mpam_internal.h | 7 ++++---
>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
>> index ee7c3953a9b6c..1f86cc158100b 100644
>> --- a/drivers/resctrl/mpam_internal.h
>> +++ b/drivers/resctrl/mpam_internal.h
>> @@ -203,9 +203,10 @@ static inline int mpam_mon_sel_lock_init(struct device *dev,
>>  	return devm_mutex_init(dev, &msc->mon_sel_mutex);
>>  }
>>  
>> -DEFINE_GUARD(mon_sel, struct mpam_msc *,
>> -	     mpam_mon_sel_lock(_T), mpam_mon_sel_unlock(_T));
>> -DEFINE_GUARD_COND(mon_sel, _lock, mpam_mon_sel_lock(_T), _RET);
>> +DEFINE_CLASS(mon_sel_lock, struct mpam_msc *,
>> +	     if (_T) mpam_mon_sel_unlock(_T),
>> +	     mpam_mon_sel_lock(msc) ? msc : NULL, struct mpam_msc *msc);
>> +DEFINE_CLASS_IS_COND_GUARD(mon_sel_lock);
>>  
>>  /* Bits for mpam features bitmaps */
>>  enum mpam_device_features {
> 

