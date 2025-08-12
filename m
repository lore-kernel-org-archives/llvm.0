Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [207.46.229.174])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB71E1FF7C5
	for <llvm@lists.linux.dev>; Tue, 12 Aug 2025 04:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.46.229.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754973352; cv=none; b=D3uok8GPWJ8P0sXH57VictTnToxcYPA8IwB4pYvrlhTolUaxIzTCzVdamvhhSspa/8Sb8mdUNPy7womyvwB3lgwJs3kTkE0/Zimjhh+VU9ICzVGgwzE7Gd7cpTBjJ+1TQ0rRyTpN9goM1kjwzv/MlZxOjwQojFdLSA+siEKRNNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754973352; c=relaxed/simple;
	bh=3RX/FsuzoD2yb8xKJwiO3S1whcb419rTpx5L0brj2Z4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ERyRNDv2Bh01iDzNwlOPhDKzCo8YcaViLY2urrWMEFtbxN2iF7/Xus4vVgdaTuUBMuAVSL2iz/2nGS6ECYyN7q7wpp0ensNojSqL3BmfJEbyUqZB2kpWTJGqzDdxVd8t4oq43NiQizzTmk1Ddt2KxKK/ABdb+g9sPndxTKVFDQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=207.46.229.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with SMTP id HgEQrABnSXp7xJpo1MsHAQ--.47324S2;
	Tue, 12 Aug 2025 12:35:07 +0800 (CST)
Received: from [192.168.43.195] (unknown [10.200.80.159])
	by gateway (Coremail) with SMTP id _____wAXuix2xJpoRy1XAQ--.64379S2;
	Tue, 12 Aug 2025 12:35:06 +0800 (CST)
Message-ID: <cbd31e8c-4e73-42f6-bb16-ed44091a353c@hust.edu.cn>
Date: Tue, 12 Aug 2025 12:35:02 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scripts/checktransupdate.py: add support for scanning
 directory
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Haoyang LIU <tttturtleruss@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 hust-os-kernel-patches@googlegroups.com, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20250810161730.6530-1-tttturtleruss@gmail.com>
 <aJmZUJeKJ6hd_pmx@stanley.mountain>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <aJmZUJeKJ6hd_pmx@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:HgEQrABnSXp7xJpo1MsHAQ--.47324S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvdXoWrtrykJr1kXw48tw17tFW3trb_yoWktrgE9r
	y8tw1kW3yUWry7AFWkJwsYgrZ8Ww4UZFyqyrWrJanxCFn0va98CFs7Gr9Yvw4xtay5uF13
	Ar9aqrs2v3ZI9jkaLaAFLSUrUUUU8b8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbPkYjsxI4VW3JwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
	8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2
	z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2kKe7AKxVWUXV
	WUAwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AI
	YIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VACjcxG62k0Y48FwI0_Gr
	1j6F4UJwAv7VCjz48v1sIEY20_GFW3Jr1UJwAv7VCY1x0262k0Y48FwI0_Gr1j6F4UJwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82
	IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uFyUJr1UMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
	xVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU3ZjjDUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 8/11/25 3:18 PM, Dan Carpenter wrote:
> On Mon, Aug 11, 2025 at 12:17:30AM +0800, Haoyang LIU wrote:
>>   
>>   import os
>> @@ -131,7 +144,7 @@ def check_per_file(file_path):
>>       opath = get_origin_path(file_path)
>>   
>>       if not os.path.isfile(opath):
>> -        logging.error("Cannot find the origin path for {file_path}")
>> +        logging.error(f"Cannot find the origin path for {file_path}")
> Send this as a separate patch with a Fixes tag.
> Fixes: 63e96ce050e5 ("scripts: fix all issues reported by pylint")
>
> Ideally, pylint should be modified to complain about this or something...
> I have a script for kernel patches which checks these kinds of mechanical
> changes and someone could make a similar script which checks pylint
> changes.  https://github.com/error27/rename_rev

Yes, this seems really wired. We have a project - Linux Kernel Patch 
Statistic among Universities[1]. In one PR[2], Haoyang also found a 
quote string issue.

Interestingly, this PR is trying to fix issues raised by pylint.


[1] https://github.com/hust-open-atom-club/linux-edu-rank

[2] https://github.com/hust-open-atom-club/linux-edu-rank/pull/45


>
> regards,
> dan carpenter
>

