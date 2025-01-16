Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAFC1EA90;
	Thu, 16 Jan 2025 02:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736993153; cv=none; b=MjpNPytVSVcq2dgqDgQH0ggC1GD/yoAH3pCz/AnJ6gqT2PUADsOE7QlmFcYOLzhvqIY5pA6v0X+HO6Kmw7Urjuw3cH0Jol/kV/q/jbi7Qxch8AFsfEGhkc7uMvbgxRJhd9aNkdBHOgtDAVS6SNPxyJmc8DD5F+S1C2g7epjNwUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736993153; c=relaxed/simple;
	bh=kzaEmOFQzWi5a5Bx/fOzdh7huv4jh3BoItITT8sAlLc=;
	h=Subject:To:References:CC:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=f5gQlfWHTTCAGYog+09DFe3lGxkLMfftCzk7reMkMjoPt2vwzd/UByfDNicW+S6E5J9OG2H8k/0CHgXx30SdC3ZSsSAoEO5KjvHRqcHFbNr9Fk5H0v57rjBlV7PgpMrXO3oqN3+0joVCpIN9ByAco+aTvun/OmThhmBMBpt5MVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4YYR2V3P2Rz11ScH;
	Thu, 16 Jan 2025 10:02:26 +0800 (CST)
Received: from kwepemh100016.china.huawei.com (unknown [7.202.181.102])
	by mail.maildlp.com (Postfix) with ESMTPS id 8418F1800D9;
	Thu, 16 Jan 2025 10:05:29 +0800 (CST)
Received: from [10.174.179.93] (10.174.179.93) by
 kwepemh100016.china.huawei.com (7.202.181.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 16 Jan 2025 10:05:28 +0800
Subject: Re: [sysctl:sysctl-testing 8/16] mm/nommu.c:394:12: error: static
 declaration of 'sysctl_nr_trim_pages' follows non-static declaration
To: Nathan Chancellor <nathan@kernel.org>, Joel Granados
	<joel.granados@kernel.org>
References: <202501150216.3RVz44uS-lkp@intel.com>
 <34e7c573-8af8-dab9-d435-ffa50e9efea2@huawei.com>
 <CANiq72n6jb62PzgP-3T6sBQRZCDb4Mi1wq6X8vEwRDT-2OvKrg@mail.gmail.com>
 <20250115142355.GA519100@ax162>
CC: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, <llvm@lists.linux.dev>,
	<oe-kbuild-all@lists.linux.dev>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
From: yukaixiong <yukaixiong@huawei.com>
Message-ID: <bd3d1c4d-a2e9-67ec-0106-4876853c86e1@huawei.com>
Date: Thu, 16 Jan 2025 10:05:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250115142355.GA519100@ax162>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggpeml100002.china.huawei.com (7.185.36.130) To
 kwepemh100016.china.huawei.com (7.202.181.102)



On 2025/1/15 22:23, Nathan Chancellor wrote:
> On Wed, Jan 15, 2025 at 11:55:02AM +0100, Miguel Ojeda wrote:
>> On Wed, Jan 15, 2025 at 9:14 AM yukaixiong <yukaixiong@huawei.com> wrote:
>>>           I have deleted the line : "extern int sysctl_nr_trim_pages;" in
>>> patch8 of v5. Why still produce this error? I don't understand!
>> As far as I understand, the report is against the tree mentioned in
>> the report, not against a patch series. So I would recommend checking
>> the tree to see what it contains (e.g. what version).
> This is the key. The version of the patch in the tree:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/sysctl/sysctl.git/commit/?id=0450345eca3ca45264db9ab09d31281e001236b7
>
> is missing the hunk from include/linux/mm.h that was in the patch on the
> mailing list:
>
> https://lore.kernel.org/20250111070751.2588654-9-yukaixiong@huawei.com/
>
> Was there a conflict at application time? Seems like this is something
> Joel will likely need to sort out.
>
> Cheers,
> Nathan
> .
Right！Waiting for Joel's reply.

Best ...

