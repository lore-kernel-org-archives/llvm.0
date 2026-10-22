Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.71.93.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792631967;
	b=tuS+AWC9kaV2A+v+ydx3MZ4iRknV6/FTjfB1hHKP6taniRKrrW7/BBhrNcl+DVzWJukb
	 SaC0LD6l/J8VPXwFKPaudiCcj9FKOqLm9ygSIBwEO1AJ8DsP1nXdH98lszJfKkHlBw9DA
	 YrYtDExKUuMYEJsHXgVXxatQXfB6bSh76DIuElxzqu7/F/U1sg0DwTPAxqtt/Xo564Ngm
	 VTTGlx8N5lOTynkg5g8/u3UHJTvGSK7f2/LcHmoNV3OrlQjKIzPY+my2SORG0ZDuGvOai
	 yjAEMy2dUU0aZZ92iROYyHdwMVurwyqrw2YvxRock0a72jw/ik8hiJJBjG6fDeRXKUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792631967;
	h=DMARC-Filter:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=oWDWqU+fwBcVPLNxqHFARcWr0x+nxDFPaG05KLIUslA=;
	b=PbyeQyYIJleUv6XP8Yx+SuJ1Kcmn0LGRrqDjh7H3qslh5ZtS0HSNkXke+NV3GzeCZA51
	 cCRXr6re8uAhseWMAUaOHlS6IiCmxXqWPH7Vfpcs6rS+We7lDVQF/5ni4HOyrHtx0XL+8
	 YrghD3DP2dJ7hLxq05NG9eFLJgLA6NGNevRKs/bvqk5IoLnH91BqVPAsg5H8g3N1q2cXG
	 viXdP2BOpl3+DTwgtfHZ4YJeF53L1pgJOujbpQhhFrrKcid4Zu74xNokgf8SYKLxIRa99
	 C+1WIC9uX9Fa8IX7PQzrJmN2JECexK4ag9O34NWGM6S/fWKhfMpTm963mu5Rhmson8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=huaweicloud.com;
	spf=pass smtp.mailfrom=huaweicloud.com;
	arc=none smtp.remote-ip=124.71.93.112
Received: from dggmsgout12.his.huawei.com (dggmsgout12.his.huawei.com [124.71.93.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4536B606A319
	for <llvm@lists.linux.dev>; Thu, 22 Oct 2026 01:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4536B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggmsgout12.his.huawei.com (SkyGuard) with ESMTP id 4j97bQ2P1Tz1yRJ
	for <llvm@lists.linux.dev>; Thu, 22 Oct 2026 09:19:14 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 34F0D4056B
	for <llvm@lists.linux.dev>; Thu, 22 Oct 2026 09:19:16 +0800 (CST)
Received: from [10.67.110.36] (unknown [10.67.110.36])
	by APP3 (Coremail) with UTF8SMTPA id _Ch0CgC3ufySZNlqx8pXBQ--.12560S2;
	Thu, 22 Oct 2026 09:19:15 +0800 (CST)
Message-ID: <b6c0b7b2-3ffa-4dd6-a4e0-23333e9b7d92@huaweicloud.com>
Date: Thu, 22 Oct 2026 09:19:14 +0800
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/15] perf annotate arm64: Support instruction
 tracking for data type profiling
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>, james.clark@linaro.org,
 xueshuai@linux.alibaba.com, Peter Zijlstra <peterz@infradead.org>,
 leo.yan@linux.dev, Li Huafei <lihuafei1@huawei.com>,
 Ian Rogers <irogers@google.com>, Kim Phillips <kim.phillips@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Ingo Molnar <mingo@redhat.com>,
 Bill Wendling <morbo@google.com>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Zecheng Li <zli94@ncsu.edu>,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <cover.1791629326.git.wutengda@huaweicloud.com>
 <atFdpZG-b2JPS1St@google.com>
 <8fdf2566-bbac-4854-8faf-0276af5f936e@huaweicloud.com> <atkzKm_TPnhyzgx3@x2>
 <atlO6EJswVvj76rN@google.com>
Content-Language: en-US
From: Tengda Wu <wutengda@huaweicloud.com>
In-Reply-To: <atlO6EJswVvj76rN@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_Ch0CgC3ufySZNlqx8pXBQ--.12560S2
X-Coremail-Antispam: 1UD129KBjvJXoW7JryfXrykZrWUGFW7XFy3twb_yoW8JrW5pF
	Z5J3W8tF4kXF4Iyrs5tr1UZF1FqFyxWr15W34rJw1FkFyq9r1Sgry2grWjg3s8Kr95Gr4I
	9rya93WavFyDAa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x
	0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8C
	rVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4
	IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kK
	e7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
	02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_
	WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
	CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v2
	6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07
	jIksgUUUUU=
X-CM-SenderInfo: pzxwv0hjgdqx5xdzvxpfor3voofrz/



On 2026/10/22 7:46, Namhyung Kim wrote:
> On Wed, Oct 21, 2026 at 06:48:26PM -0300, Arnaldo Carvalho de Melo wrote:
>> On Fri, Oct 16, 2026 at 09:18:38AM +0800, Tengda Wu wrote:
>>> On 2026/10/16 7:11, Namhyung Kim wrote:
>>>>> Please let me know if you have any feedback.
>>>>
>>>> Thanks a lot for your work!  Assuming you'll fix the issues from Sashiko
>>>> in the next version, you can add my:
>>>>
>>>> Reviewed-by: Namhyung Kim <namhyung@kernel.org>
>>>>
>>>
>>> Yes, I'll address the issues reported by Sashiko and send a v8.
>>> Most of them are minor, and I'll fix them accordingly (or explain
>>> in the v8 thread if I think any of them is a false positive).
>>> I'll carry your Reviewed-by in the next version as agreed.
>>
>> I applied the first 5 patches that are sashiko-clean, will push soon to
>> tmp.perf-tools-next and then to perf-tools next after test building on
>> my containers.
> 
> There is v8 already which should have addressed the concerns.
> 
> https://lore.kernel.org/r/cover.1792411435.git.wutengda@huaweicloud.com
> 

Yes, applying based on v8 would be better. All Sashiko comments have been
addressed in v8, so the whole series can be applied and tested as-is.

Thanks a lot.

Best regards,
Tengda

> Thanks,
> Namhyung
> 

