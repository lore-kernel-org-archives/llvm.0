Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677191DD0F6;
	Thu, 16 Jan 2025 11:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737025667; cv=none; b=sCwUXYMZGA2w3uBdiVSdqj/v7ae7/LMvbE1zz8m9bX7iRqZyAlFeTA/WJ+8qeclYMapkXTiFYn3eNaqOgVT88keWM3sSJMAW7hln0LVdaRm01MUllMebcrvVmKYbc3b2NBEPg8ouItvH4uoNsDiBPoq+XSpvHY8v6PbaANQEZuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737025667; c=relaxed/simple;
	bh=FhLSfuFaODj5QQJUBOabVUyskFfIVClvcac34yjZe0U=;
	h=Subject:To:References:CC:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=I67Qcrz8CvuQdSS78FlwhCttWp7iI+10O6OR+xIJTKavP6iZnN7UVmorWfuShuQYVdpj3EF0BhM9XGMGqju3QDh9JqIPbQcohfL8SArTz9TdtoZhUlq9tNLFTDiMwVeoJlpqriGH4IvbeWVd436QMIUiRAxv4QI6OAeEwx2xO5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4YYg5h15R0zrRhP;
	Thu, 16 Jan 2025 19:06:00 +0800 (CST)
Received: from kwepemh100016.china.huawei.com (unknown [7.202.181.102])
	by mail.maildlp.com (Postfix) with ESMTPS id 24D5A1401E9;
	Thu, 16 Jan 2025 19:07:40 +0800 (CST)
Received: from [10.174.179.93] (10.174.179.93) by
 kwepemh100016.china.huawei.com (7.202.181.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 16 Jan 2025 19:07:39 +0800
Subject: Re: [sysctl:sysctl-testing 8/16] mm/nommu.c:394:12: error: static
 declaration of 'sysctl_nr_trim_pages' follows non-static declaration
To: Joel Granados <joel.granados@kernel.org>
References: <202501150216.3RVz44uS-lkp@intel.com>
 <34e7c573-8af8-dab9-d435-ffa50e9efea2@huawei.com>
 <CANiq72n6jb62PzgP-3T6sBQRZCDb4Mi1wq6X8vEwRDT-2OvKrg@mail.gmail.com>
 <20250115142355.GA519100@ax162>
 <bd3d1c4d-a2e9-67ec-0106-4876853c86e1@huawei.com>
 <ivw43eqdebbz3w36yjxawb47jy2slopqxtw2b7jkthkaz4yih6@jos3xyo2s34h>
CC: Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda
	<miguel.ojeda.sandonis@gmail.com>, <llvm@lists.linux.dev>,
	<oe-kbuild-all@lists.linux.dev>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
From: yukaixiong <yukaixiong@huawei.com>
Message-ID: <b426ad5e-6e0a-2d4c-4012-c26aa3c317ab@huawei.com>
Date: Thu, 16 Jan 2025 19:07:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ivw43eqdebbz3w36yjxawb47jy2slopqxtw2b7jkthkaz4yih6@jos3xyo2s34h>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggpeml100006.china.huawei.com (7.185.36.169) To
 kwepemh100016.china.huawei.com (7.202.181.102)



On 2025/1/16 18:58, Joel Granados wrote:
> On Thu, Jan 16, 2025 at 10:05:27AM +0800, yukaixiong wrote:
>>
>> On 2025/1/15 22:23, Nathan Chancellor wrote:
>>> On Wed, Jan 15, 2025 at 11:55:02AM +0100, Miguel Ojeda wrote:
>>>> On Wed, Jan 15, 2025 at 9:14 AM yukaixiong <yukaixiong@huawei.com> wrote:
>>>>>            I have deleted the line : "extern int sysctl_nr_trim_pages;" in
>>>>> patch8 of v5. Why still produce this error? I don't understand!
>>>> As far as I understand, the report is against the tree mentioned in
>>>> the report, not against a patch series. So I would recommend checking
>>>> the tree to see what it contains (e.g. what version).
>>> This is the key. The version of the patch in the tree:
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/sysctl/sysctl.git/commit/?id=0450345eca3ca45264db9ab09d31281e001236b7
>>>
>>> is missing the hunk from include/linux/mm.h that was in the patch on the
>>> mailing list:
>>>
>>> https://lore.kernel.org/20250111070751.2588654-9-yukaixiong@huawei.com/
>>>
>>> Was there a conflict at application time? Seems like this is something
>>> Joel will likely need to sort out.
>>>
>>> Cheers,
>>> Nathan
>>> .
>> Right！Waiting for Joel's reply.
> Should be OK now.
>
>
Thx

Best ...

