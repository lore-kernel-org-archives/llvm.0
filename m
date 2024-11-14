Received: from mail.nfschina.com (unknown [42.101.60.213])
	by smtp.subspace.kernel.org (Postfix) with SMTP id A659B1F583B
	for <llvm@lists.linux.dev>; Thu, 14 Nov 2024 08:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731572023; cv=none; b=N9mLids6YrTN5hQKtUGuxMNGqB8R4CoFuD+pzdFlP7d6hJ4ik0xQw8pW4VIb+B8AvlGDXPT7OApbP7BRuZ8Oy57NOn3UtOTQzufld/3vHvk9h54xJ2lyFHV/Q4swTizxJAN8CHPSUmW8j1jcpLBRCbM/ZLD+n9F6Z418UEit4sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731572023; c=relaxed/simple;
	bh=iVSflHEF2KmEAYyfDJdBBLMDuX6sDNJ0CAq9FnJaI+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type; b=SKMQkLnPzWtdg+X2O17RS5Ul2/NdIA1ghfOpFHcRLopV+y8jhTuaXv2ems+16pHT3oNowY9sYsOo8kpq2zKxG5u4RyoXTKWdpBSgUeet9FdRrVjAYAeHu9oKE7ZLMrDQHwpLCKpioy0GqVHKOZP7NyDB2yaAEQJssjIKEiRbLns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from [172.30.20.101] (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id 1ED046123B6B3;
	Thu, 14 Nov 2024 16:13:20 +0800 (CST)
Message-ID: <fafb6cbb-67d5-f55f-5fb3-ea159683904e@nfschina.com>
Date: Thu, 14 Nov 2024 16:13:19 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] drm/xe/hw_engine_group: Fix bad free in
 xe_hw_engine_setup_groups()
Content-Language: en-US
To: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 nathan@kernel.org, ndesaulniers@google.com, morbo@google.com,
 justinstitt@google.com
Cc: matthew.brost@intel.com, francois.dugast@intel.com,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 kernel-janitors@vger.kernel.org
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <ZzWqnIGZEv-_-Lbc@bvivekan-mobl1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024/11/14 15:45, Vivekanandan, Balasubramani wrote:
> On 14.11.2024 14:39, Su Hui wrote:
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/xe/xe_hw_engine_group.c
>> index 82750520a90a..ee2cb32817fa 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
>> @@ -51,7 +51,7 @@ static struct xe_hw_engine_group *
>>   hw_engine_group_alloc(struct xe_device *xe)
>>   {
>>   	struct xe_hw_engine_group *group;
>> -	int err;
>> +	int err = -ENOMEM;
>>   
>>   	group = kzalloc(sizeof(*group), GFP_KERNEL);
>>   	if (!group)
>> @@ -59,7 +59,7 @@ hw_engine_group_alloc(struct xe_device *xe)
>>   
>>   	group->resume_wq = alloc_workqueue("xe-resume-lr-jobs-wq", 0, 0);
>>   	if (!group->resume_wq)
>> -		return ERR_PTR(-ENOMEM);
>> +		goto free_group;
> kfree can be directly called from here followed by return, instead of a
> goto.
Agreed.
>>   
>>   	init_rwsem(&group->mode_sem);
>>   	INIT_WORK(&group->resume_work, hw_engine_group_resume_lr_jobs_func);
>> @@ -67,9 +67,15 @@ hw_engine_group_alloc(struct xe_device *xe)
>>   
>>   	err = drmm_add_action_or_reset(&xe->drm, hw_engine_group_free, group);
>>   	if (err)
>> -		return ERR_PTR(err);
>> +		goto destroy_wq;
> There is no need to clear the resources on failure, because
> drmm_add_action_or_reset takes care of freeing the resources on
> failure.
Oh, my fault, I missed this function.
>>   
>>   
>>   /**
>> @@ -87,21 +93,19 @@ int xe_hw_engine_setup_groups(struct xe_gt *gt)
>>   	int err;
>>   
>>   	group_rcs_ccs = hw_engine_group_alloc(xe);
>> -	if (IS_ERR(group_rcs_ccs)) {
>> -		err = PTR_ERR(group_rcs_ccs);
>> -		goto err_group_rcs_ccs;
>> -	}
>> +	if (IS_ERR(group_rcs_ccs))
>> +		return PTR_ERR(group_rcs_ccs);
>>   
>>   	group_bcs = hw_engine_group_alloc(xe);
>>   	if (IS_ERR(group_bcs)) {
>>   		err = PTR_ERR(group_bcs);
>> -		goto err_group_bcs;
>> +		goto free_group_rcs_ccs;
> No need of freeing the memory here and in the following lines as we have
> managed it through the drmm_add_action_or_reset call in
> hw_engine_group_alloc.
> We can simply return the error code.
Got it.
>
>>   
>> -err_group_vcs_vecs:
>> -	kfree(group_vcs_vecs);
>> -err_group_bcs:
>> +free_group_bcs:
>> +	destroy_workqueue(group_bcs->resume_wq);
>>   	kfree(group_bcs);
>> -err_group_rcs_ccs:
>> +free_group_rcs_ccs:
>> +	destroy_workqueue(group_rcs_ccs->resume_wq);
>>   	kfree(group_rcs_ccs);
>> -
> All these kfree statements are not required.
Agreed too. Thanks for your review.
I will send a v2 patch to remove these kfree if there are no further 
suggestions.

Regards,
Su Hui


