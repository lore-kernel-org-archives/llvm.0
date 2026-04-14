Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D873A3E7173
	for <llvm@lists.linux.dev>; Tue, 14 Apr 2026 14:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776176019; cv=none; b=My+rwSaYnfH+J0hFLKPDs9Rw3DL/bZ/CmO/92afh0OlhVKXhVBdm6aNtMyLL+M4Pekl9b09oLgesKnmQUTR2xKA86rmMEvqXaqN32W9cRvPx8S7syDC5Fgl9k/faoPpxJMshme4ZK91JoBT9AGGtz0QuxN3TTP2I75jQbRdobIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776176019; c=relaxed/simple;
	bh=D9kkciSYLlfxqhIOYnVkWaLSaW30TWuPx2vmvKos2qU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gcj9ufprbR7mXd+O8gZklGxNn8WcE4s32LPsezM7AV50yoRrRTik+3TrXRJf+Jbb2IQFdDZue2j5NMTUOZFcsrl+UfVGUswo6krOCnhZW1mmK5Fv9kU9AmpZHOw2fuTjBv8TLKy6x62/umLab/SzqyXAgYkPq/7F4WXfz6ITAYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dzVKQZU6; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dzVKQZU6"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43cfde3c3f3so5681076f8f.3
        for <llvm@lists.linux.dev>; Tue, 14 Apr 2026 07:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776176016; x=1776780816; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wszm6aLEcUiLQ1Kk0G+I9eoocPOdS7FUfJ9suaTdAkI=;
        b=dzVKQZU6Gtq6615+qSpXie7BL3jQt1ZGlctC62yv15+X7SjzNYSSC5QaJkNA3Rwx8t
         6vg5m9Wo/Wna8HOtmggIlGP6FtvmQRooiXdiWFhxny34x6MwQChwsKSDvYMMsv5bCLGU
         IywKqHkMIeBIJKJRHZndO2qJAdKxFcuOXULk5+YzYTLs3M5YA3S2exMgi/gJ4GR9UgeH
         fikrchZcQTgbx+5lPJMhgBbb+dzUdp7r4ffw+suCu0b5ooWCDLzB3egEPVaokZl1H0yE
         mMe5Z001Xp3mU9WTJMPuwbRLoNwmO/WmJ2nOwIr8tN1lNpGAQ9g5HQ5256uHEi50JO45
         BRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776176016; x=1776780816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wszm6aLEcUiLQ1Kk0G+I9eoocPOdS7FUfJ9suaTdAkI=;
        b=LSqLHyCCW0fbBzPPyMYZ0z/ZecKhbOLtX3E98q1L1+/9WUxMAJLaDgH1IozETOjvry
         J3fVSLEPugrBkhw8p6obpxTbQ2AmDqwQUsl2JJyMglNRSJ3jh8H6yABopYU6/fO5VDGI
         rhrwhYGrvYbySCicdzN258lqhMb9VoQHi9XYBeEelJyMqzgnGt5mk77BFqVW98znXytw
         /RS4ov5wLUD6aotp6xeWeNhyceJLV/ALGvFotaxPVqb4lglDN/+8vQsJovI63EpRtjTL
         ep5guDvr10qK3J15zLLkE8SYtuX7uj1b3Hr7n85VUMDHkoTxog+P6arshD80EoaI5Vtg
         iD3w==
X-Forwarded-Encrypted: i=1; AFNElJ+CmRAkiW6hgA/BrE/4/t2TteTu0iIGpouKeM6A0ilEH5eWcTiJ4isgg+FMQdT9W8Z11trj@lists.linux.dev
X-Gm-Message-State: AOJu0YwL7FsHxNLS/hOC4xSW/XbhkC+TvABf5P0oB9rpN7iKDSkPzdDE
	LaUv6J+QFWnLJjVNiVm9MyOuImgrMU4/SPqdEJqXkCSicjYYFftmIJmYLjc/MML+PFU=
X-Gm-Gg: AeBDietCSQbQ2tu6mZmIldG0hZMAzLpHrzqcaKdlu7HwRcA94pIF7IG0B0Q8ijXm1GP
	p3bicsOaZoDnZvT21R5e+uOAiCGg+gWdCAsXtWJ3s7i5eKAD+9R6Yqn8w53R7Kgr1eILjmZWSEt
	36uvQ1AYIHMvHFIftOTdonwwVMNaSkEf4OGtW87bByFSMOAUg3me682fMdnPAm89giL176yhyKj
	QFKBGC0jMcG+BemtbyMFrndb5R1c7cBj+w5jNZo9lu09q7oGhgPHukdv/ZRGZTJPQjRlCiqkYom
	DvzhyIdP0ZtMYqX74ytT5pVrhtdhfb553bWuF/nTFw7FBgVCFAhYhiUYxLdaZUemEJ8M4fp1b1Y
	8maX7ZMK4GAAanrY249LhiUztL5rYjOdDn5ge6blywDDYYqvAbPXCY4GfEXVljQQmFnL1BMg0Rq
	/OCmvw3b9GkjDAZZI4EeddqrqsqHeaxPr01MCmqKzg
X-Received: by 2002:a05:6000:1ac5:b0:439:b60a:b400 with SMTP id ffacd0b85a97d-43d642c8697mr26566959f8f.31.1776176016149;
        Tue, 14 Apr 2026 07:13:36 -0700 (PDT)
Received: from [172.17.16.20] ([213.137.22.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de2a53sm40731568f8f.5.2026.04.14.07.13.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 07:13:35 -0700 (PDT)
Message-ID: <50a6456e-fa30-447e-8b56-3d2af496fede@linaro.org>
Date: Tue, 14 Apr 2026 15:13:33 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/16] perf annotate-arm64: Generalize arm64_mov__parse
 to support standard operands
To: Namhyung Kim <namhyung@kernel.org>, Tengda Wu <wutengda@huaweicloud.com>
Cc: Peter Zijlstra <peterz@infradead.org>, leo.yan@linux.dev,
 Li Huafei <lihuafei1@huawei.com>, Ian Rogers <irogers@google.com>,
 Kim Phillips <kim.phillips@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Bill Wendling <morbo@google.com>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Zecheng Li <zli94@ncsu.edu>,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20260403094800.1418825-1-wutengda@huaweicloud.com>
 <20260403094800.1418825-4-wutengda@huaweicloud.com> <adSrL-iZna3pyDrY@z2>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <adSrL-iZna3pyDrY@z2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07/04/2026 07:58, Namhyung Kim wrote:
> On Fri, Apr 03, 2026 at 09:47:47AM +0000, Tengda Wu wrote:
>> The current arm64_mov__parse() implementation strictly requires the
>> operand to contain a symbol suffix in the "<symbol>" format. This
>> causes the parser to fail for standard instructions that only contain
>> raw immediates or registers without symbolic annotations.
>>
>> Refactor the function to make symbol matching optional. The parser now
>> correctly extracts the target operand and only attempts to parse the
>> "<symbol>" suffix if it exists. This change also introduces better
>> handling for whitespace and comments, and adds support for multi-register
>> check via arm64__check_multi_regs(), ensuring compatibility with a
>> wider range of arm64 instruction formats.
>>
>> Signed-off-by: Tengda Wu <wutengda@huaweicloud.com>
>> ---
>>   .../perf/util/annotate-arch/annotate-arm64.c  | 85 ++++++++++++++-----
>>   1 file changed, 65 insertions(+), 20 deletions(-)
>>
>> diff --git a/tools/perf/util/annotate-arch/annotate-arm64.c b/tools/perf/util/annotate-arch/annotate-arm64.c
>> index 33080fdca125..4c42323b0c18 100644
>> --- a/tools/perf/util/annotate-arch/annotate-arm64.c
>> +++ b/tools/perf/util/annotate-arch/annotate-arm64.c
>> @@ -14,12 +14,38 @@ struct arch_arm64 {
>>   	regex_t jump_insn;
>>   };
>>   
>> +static bool arm64__check_multi_regs(const char *op)
>> +{
>> +	char *comma = strchr(op, ',');
>> +
>> +	while (comma) {
>> +		char *next = comma + 1;
>> +
>> +		next = skip_spaces(next);
>> +
>> +		/*
>> +		 * Check the first valid character after the comma:
>> +		 * - If it is '#', it indicates an immediate offset (e.g., [x1, #16]).
>> +		 * - If it is an alphabetic character, it is highly likely a
>> +		 *   register name (e.g., x, w, s, d, q, v, p, z).
>> +		 * - Special cases: Alias and control registers like sp, xzr,
>> +		 *   and wzr all start with an alphabetic character.
>> +		 */
>> +		if (*next && *next != '#' && isalpha(*next))
>> +			return true;
> 
> It seems you check any alphabet charactor after a comma for multi-regs.
> Does that mean the first component before the comma should be another
> register?
> 
>> +
>> +		comma = strchr(next, ',');
>> +	}
>> +
>> +	return false;
>> +}
>> +
>>   static int arm64_mov__parse(const struct arch *arch __maybe_unused,
>>   			    struct ins_operands *ops,
>>   			    struct map_symbol *ms __maybe_unused,
>>   			    struct disasm_line *dl __maybe_unused)
>>   {
>> -	char *s = strchr(ops->raw, ','), *target, *endptr;
>> +	char *s = strchr(ops->raw, ','), *target, *endptr, *comment, prev;
>>   
>>   	if (s == NULL)
>>   		return -1;
>> @@ -31,29 +57,48 @@ static int arm64_mov__parse(const struct arch *arch __maybe_unused,
>>   	if (ops->source.raw == NULL)
>>   		return -1;
>>   
>> -	target = ++s;
>> +	target = skip_spaces(++s);
>> +	comment = strchr(s, arch->objdump.comment_char);
>> +
>> +	if (comment != NULL)
>> +		s = comment - 1;
>> +	else
>> +		s = strchr(s, '\0') - 1;
> 
> An interesting use of strchr().  Oh, I found the strchr(3) man page
> also mentions that it's a supported use case.  TIL.
> 
> 
>> +
>> +	while (s > target && isspace(s[0]))
>> +		--s;
>> +	s++;
>> +	prev = *s;
>> +	*s = '\0';
>>   	ops->target.raw = strdup(target);
>> +	*s = prev;
>> +
>>   	if (ops->target.raw == NULL)
>>   		goto out_free_source;
>>   
>> -	ops->target.addr = strtoull(target, &endptr, 16);
>> -	if (endptr == target)
>> -		goto out_free_target;
>> -
>> -	s = strchr(endptr, '<');
>> -	if (s == NULL)
>> -		goto out_free_target;
>> -	endptr = strchr(s + 1, '>');
>> -	if (endptr == NULL)
>> -		goto out_free_target;
>> -
>> -	*endptr = '\0';
>> -	*s = ' ';
>> -	ops->target.name = strdup(s);
>> -	*s = '<';
>> -	*endptr = '>';
>> -	if (ops->target.name == NULL)
>> -		goto out_free_target;
>> +	ops->target.multi_regs = arm64__check_multi_regs(ops->target.raw);
>> +
>> +	/* Parse address followed by symbol name, e.g. "addr <symbol>" */
>> +	if (strchr(target, '<') != NULL) {
>> +		ops->target.addr = strtoull(target, &endptr, 16);
>> +		if (endptr == target)
>> +			goto out_free_target;
> 
> Hmm.. shouldn't this part be executed regardless of presence of a symbol
> name?
> 
>> +
>> +		s = strchr(endptr, '<');
>> +		if (s == NULL)
>> +			goto out_free_target;
> 
> It'd be safer to check `if (*skip_spaces(endptr) == '<')` rather than
> strchr().
> 
> 
>> +		endptr = strchr(s + 1, '>');
>> +		if (endptr == NULL)
>> +			goto out_free_target;
> 
> I'm afraid C++ programs can have symbols with <> for templates.
> Probably strrchr() would work.
> 
> Thanks,
> Namhyung
> 

Maybe a test for this function would be good to make sure it still works 
the same for old and also handles the new inputs. A lot of it looks 
quite fiddly and I didn't see any dependencies in it that would make 
testing a whole list of inputs and outputs difficult.

>> +
>> +		*endptr = '\0';
>> +		*s = ' ';
>> +		ops->target.name = strdup(s);
>> +		*s = '<';
>> +		*endptr = '>';
>> +		if (ops->target.name == NULL)
>> +			goto out_free_target;
>> +	}
>>   
>>   	return 0;
>>   
>> -- 
>> 2.34.1
>>
> 

