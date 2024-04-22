Received: from mail.nfschina.com (unknown [42.101.60.195])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 273DE4C97
	for <llvm@lists.linux.dev>; Mon, 22 Apr 2024 03:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713756800; cv=none; b=WeoMqRMOrpSTmCFsO/s8hl+HLHr3P0aoCq+aIeG+IG51fYc/1ztsRJcMGmFu4ZKls+BVjnkD6BBssRyfAnIdN4+ubvsH1lOGd4LWCxIy+F+vtHpF7Npc8CGrP980e4dMLChVxo+/SdlW/RgRA9J2Hm/E7dkEEFesm5NfbSlaSOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713756800; c=relaxed/simple;
	bh=zI6AXceJfEK/L8fmn63vHcXTweS/N0utaLuM9iw/3cc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type; b=Wp2wgfE+qaLzfYEfQaYpOMqzVVK0Sz5SadlN27NmQCssFqONBI0sJe1wqitEqxPY/Voy0ckeK/viHg1dH4fmhiP8TounbN3BcUhtxsoJnsX18E0qEg2yq4LNI1dyllxOnRZED8Z1Jfx1mg84lf2J0snyieCJ7T8PX9uk/5one2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from [172.30.11.106] (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 0B5136068094E;
	Mon, 22 Apr 2024 11:32:43 +0800 (CST)
Message-ID: <6d311a40-05b9-3958-673d-e4c4d154ce4f@nfschina.com>
Date: Mon, 22 Apr 2024 11:32:43 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH wireless] wifi: ath10k: Fix an error code problem in
 ath10k_dbg_sta_write_peer_debug_trigger()
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, kvalo@kernel.org,
 jjohnson@kernel.org, nathan@kernel.org, ndesaulniers@google.com,
 morbo@google.com, justinstitt@google.com
Cc: c_mkenna@qti.qualcomm.com, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
In-Reply-To: <a4c2cb8c-dd80-457f-82b5-2eb58a9b55b5@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024/4/19 23:09, Jeff Johnson wrote:
> On 4/17/2024 1:17 AM, Su Hui wrote:
>>   	u8 peer_debug_trigger;
>> -	int ret;
>> +	int ret = 0;
> this is unnecessary since this will be written in all paths that lead to the
> return that reads it
Yes, this is my fault. I will remove this in v2 patch.
>>   
>>   	if (kstrtou8_from_user(user_buf, count, 0, &peer_debug_trigger))
>>   		return -EINVAL;
>> @@ -432,14 +432,12 @@ ath10k_dbg_sta_write_peer_debug_trigger(struct file *file,
>>   
>>   	ret = ath10k_wmi_peer_set_param(ar, arsta->arvif->vdev_id, sta->addr,
>>   					ar->wmi.peer_param->debug, peer_debug_trigger);
>> -	if (ret) {
>> +	if (ret)
>>   		ath10k_warn(ar, "failed to set param to trigger peer tid logs for station ret: %d\n",
>>   			    ret);
>> -		goto out;
>> -	}
>>   out:
>>   	mutex_unlock(&ar->conf_mutex);
>> -	return count;
>> +	return ret ?: count;
>>   }
>>   
>>   static const struct file_operations fops_peer_debug_trigger = {
> I'd suggest as an alternate solution that this function is a good candidate
> for the the cleanup.h functionality. By scoping the mutex_lock() you can
> simply return at each error location, and remove the explicit mutex_unlock().

like guard(mutex)(&ar->conf_mutex)?

Maybe I can send a separate patch for this,  because there are more than 
one candidates

for the cleanup.h functionality.

> But I'd accept this with the initializer change removed as well since I don't
> think ath10k has any cleanup.h usages yet.

I will send v2 patch soon , thanks for your reply!

Su Hui


