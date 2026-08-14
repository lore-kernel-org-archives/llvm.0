Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0B63E0754
	for <llvm@lists.linux.dev>; Fri, 14 Aug 2026 07:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786694302; cv=none; b=HzUCLsbo+XqtjThbeyPaSybsoxGVFCl6ijcOrXdfCtreaevyadC6MKeCoGb3Z9d2f3OioNhXzNK7oj6OlzmdSs1s9VWmGCA2bIB6glemvOk1/L5YqFqrBoUOYZd5lKL55DQaU+xtkAABeBo8oxPwX7BsyHfTiOqF2VWNadV0+XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786694302; c=relaxed/simple;
	bh=5SZwYmdF1Hm7ABvq+JA+krrkXbcQ/4y818m8JYsuAGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mLzNAQET2re6dqR/OVjwiI8vEmH8Y8GKCfx2FoBFwKUewUpNO0CaJfKEnZ6UucAMbA0B2ulllf0O8ZR9bJPrEDbV1/1tUgukGX6JDLMA6b4zbusKA+S1YrKG50abc3/ISo7OFKo5FG9T4Dh3/u5z3JNUwYdzs3/0IOZ0KwQjCBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4hLvjF552RzKHN4G
	for <llvm@lists.linux.dev>; Fri, 14 Aug 2026 15:57:53 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 4F4DE40592
	for <llvm@lists.linux.dev>; Fri, 14 Aug 2026 15:58:14 +0800 (CST)
Received: from [10.67.110.36] (unknown [10.67.110.36])
	by APP4 (Coremail) with UTF8SMTPA id gCh0CgD31BmUyn5q5F8jCQ--.23572S2;
	Fri, 14 Aug 2026 15:58:14 +0800 (CST)
Message-ID: <793c2b7c-dac8-4565-9d4a-5be7e9ebea3c@huaweicloud.com>
Date: Fri, 14 Aug 2026 15:58:12 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/23] perf annotate-data: Expand type_state_reg
 imm_value to u64
To: Shuai Xue <xueshuai@linux.alibaba.com>, Namhyung Kim
 <namhyung@kernel.org>, james.clark@linaro.org,
 Li Huafei <lihuafei1@huawei.com>
Cc: Peter Zijlstra <peterz@infradead.org>, leo.yan@linux.dev,
 Ian Rogers <irogers@google.com>, Kim Phillips <kim.phillips@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Bill Wendling <morbo@google.com>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Zecheng Li <zli94@ncsu.edu>,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20260808122400.2961238-1-wutengda@huaweicloud.com>
 <20260808122400.2961238-17-wutengda@huaweicloud.com>
 <861296f2-a17e-483a-8b46-74ba777958d5@linux.alibaba.com>
Content-Language: en-US
From: Tengda Wu <wutengda@huaweicloud.com>
In-Reply-To: <861296f2-a17e-483a-8b46-74ba777958d5@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgD31BmUyn5q5F8jCQ--.23572S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAF18Kw1rur48ZrW3WryrtFb_yoWrGF4fp3
	ykKryUJry5Gr1vgwnrtw4UXFyrGw12v3WrGrn8tF1UArWavFySqry2qr4jgayUWws7Aw17
	trn0qr4qvw4UAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
	14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWr
	XwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0
	s2-5UUUUU==
X-CM-SenderInfo: pzxwv0hjgdqx5xdzvxpfor3voofrz/



On 2026/8/11 16:10, Shuai Xue wrote:
> 
> 
> On 8/8/26 8:23 PM, Tengda Wu wrote:
>> The imm_value in struct type_state_reg is defined as u32, which limits
>> the size of values it can pass.
>>
>> Promote imm_value from u32 to u64 and adjust the print format specifier
>> in pr_debug_dtp() accordingly.
>>
>> Signed-off-by: Tengda Wu <wutengda@huaweicloud.com>
>> ---
>>   tools/perf/util/annotate-arch/annotate-x86.c | 2 +-
>>   tools/perf/util/annotate-data.h              | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/tools/perf/util/annotate-arch/annotate-x86.c b/tools/perf/util/annotate-arch/annotate-x86.c
>> index ee4e3e7f3209..eec3d8ce00b8 100644
>> --- a/tools/perf/util/annotate-arch/annotate-x86.c
>> +++ b/tools/perf/util/annotate-arch/annotate-x86.c
>> @@ -540,7 +540,7 @@ static void update_insn_state_x86(struct type_state *state,
>>               tsr->offset = 0;
>>               tsr->ok = true;
>>   -            pr_debug_dtp("mov [%x] imm=%#x -> reg%d\n",
>> +            pr_debug_dtp("mov [%x] imm=%#"PRIx64" -> reg%d\n",
>>                        insn_offset, tsr->imm_value, dst->reg1);
>>               return;
>>           }
>> diff --git a/tools/perf/util/annotate-data.h b/tools/perf/util/annotate-data.h
>> index 453e13bbe3e2..91b83e94c51b 100644
>> --- a/tools/perf/util/annotate-data.h
>> +++ b/tools/perf/util/annotate-data.h
>> @@ -173,7 +173,7 @@ extern struct annotated_data_stat ann_data_stat;
>>    */
>>   struct type_state_reg {
>>       Dwarf_Die type;
>> -    u32 imm_value;
>> +    u64 imm_value;
>>       /*
> One subtlety this introduces: annotated_op_loc.offset is an int, and
> immediates are parsed into it via strtol(), so assignments like
> tsr->imm_value = src->offset now sign-extend instead of preserving
> the 32-bit bit pattern. mov $0xdeadbeef used to track 0xdeadbeef,
> now it tracks 0xffffffffdeadbeef, while the register actually holds
> the zero-extended value. (Canonical kernel addresses happen to
> sign-extend back to the right value, which masks this in the common
> case.)
> 

It appears that assignments from offset to imm_value occur in only a few places:

add/sub: (already existing)
  u64 imm_value = -1ULL;
  imm_value = src->offset;  // int to u64

mov immediate: (newly introduced)
  tsr->imm_value = src->offset;  // int to u64


> Relatedly, this widening doesn't actually help 64-bit immediates on
> the strtol() path - movabs is still truncated to int at parse time.

Indeed, for movabs instructions, the immediate value is truncated due to
the width of offset and strtol() as well.

> The real consumers that need u64 are the arm64 adrp and stack paths,
> which feed imm_value from ops.source.addr / stack state directly, so
> the change is justified. But maybe worth spelling that out, and
> considering a follow-up that parses immediates with strtoull() into a
> dedicated u64 field instead of overloading the signed offset field.
> 
> Thanks,

To summarize, there are three issues:

1. Sign-extension issue in add/sub (pre-existing)
2. Sign-extension issue in mov immediate (newly introduced)
3. Truncation issue in movabs (pre-existing)

In this patch, I'd like to fix issue #2 first by adding a type cast to
avoid the sign-extension problem:

  tsr->imm_value = (s64)src->offset;

As for issues #1 and #3, which are pre-existing, a possible solution would
be to promote offset to 64-bit as well. I'm thinking of addressing those in
a separate patch series, since it involves multiple architectures and would
need careful review.

Thanks,
Tengda

