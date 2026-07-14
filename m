Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A7C4D8DAB
	for <llvm@lists.linux.dev>; Tue, 14 Jul 2026 16:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784047309; cv=none; b=Cwm44n1HKSMGA6LOmjxaQ88tyRxS0L7S78MPMS8dNAguvd7yR6WCCjATplUBQEkAcuVny5OfECPtAWLtUI+qM3ukWmyAYPHbdFZjuJ6EYHs/o35HgWL/egdQeyKvjCLM0abdT9arzjHJEmAUwnKwRgeVQ6JSAa6jQu/umMISVBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784047309; c=relaxed/simple;
	bh=+UZ2C/SIqj6Dtle1yIQ62BUp8tDwxi+DEhc0LgCFf7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HJ+1alNnddpU61J3n/LL8b8gSmN7IDsIoqNXHmwaI0S9vi28tPAYltX69lNWMRaJZTLSIdD4CoD09pOxFR9H08RBDV29BLs1TFCUcbAKxH8M0nAh8DvLTDX/sJuhzuVuxn9uRI/aDwrWe3oMCOoKAl7/byLXPjqO6I4szLygw9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u8+1CMmI; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u8+1CMmI"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4758bd3731bso931373f8f.0
        for <llvm@lists.linux.dev>; Tue, 14 Jul 2026 09:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784047305; x=1784652105; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dAGdTmKiRz8gSXgEL0AxMvGfkn4LlPlutVrGbCWXhWI=;
        b=u8+1CMmIiwV/2hluMtZQoamo61fIPq/wBMuyLiRRUFEFsUggervbUtmK3zoshi91pP
         SG3q2ok5vYCProDCNM3POoK1yvo/tJVLLKE6P/rkVqLHBvpyJZE/VRnKCiP/SWOR0mQc
         ZOpx9xFJxbUisMK5j21VdrD+b4H8E6QUgE53MGA9OjVS6dwXNwRx39fOTLuMxmAwrnf5
         fTr2dzaX1i+B8grXNJWECyVk0TnrYuIdo2aLefwGDFFbrQyyy+lJek/xzmdxdE5zE4H2
         ezERwbqlHtxJpgE9puUbmTbITGUmSuWCjkAZyPD4+OC9YRYqqHcP5R4FZC0RvCl5nml4
         onfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784047305; x=1784652105;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dAGdTmKiRz8gSXgEL0AxMvGfkn4LlPlutVrGbCWXhWI=;
        b=mGn15Cvtp46883WnTBzCXgc9d1/9gp4V/eUmGGPoD1BoNAUus8d02HLkof3FuNhE14
         TzNpMKgAezQcg+XX6oARSbL7WSK3IPW4sAhVxEwPOSDxC49Csn8HP3bd4QN0aReESoIC
         HnU3R2HmtszN0IyuiAfPHathVmmVw9RBsYyRBJYYSX3/aGx6f8PvLND3sTMADJgmoqSK
         Ua8FYP6e/FrgdgEq6n9G9WkQcSASh83cd+4KND5EiDNcQGwxgJ1mhcPdHcPJUie/ysV/
         QyPSYOqxgKizazqt8aQgp3bjlmzYbd3ptR3y5RNBSOcMixrrD2A7Ye4cRT/IlM8QAilg
         Tp7g==
X-Forwarded-Encrypted: i=1; AHgh+RqTBODWIl7txFPPhZN31iCSR/G9x+pgX0LTsKEE2H2Ag2+OGZ1ZLnXg6xpmeBknMw2+7Lvo@lists.linux.dev
X-Gm-Message-State: AOJu0YyLs0UJcHYaUE26EPBYxsqjNzprPLJYoSvDePGZlctk2sly2+F3
	1DKDrlOzN1bmOslK49DZU/zAN+KrPTa84bNIOtKa28r/F2PN/y0Znz9OrddJqEfSuMo=
X-Gm-Gg: AfdE7cmmLhGe00BMDJJ4XVxS/EqRHIsh0kkX91eekEmEauOQASwuZG37kclboQG3mxL
	t4z1ZRXzxhegXzLrl8YciOi9sPJbLZa+rRdd1bngHkV5MNpWFxd0pU2ooOXgqnFtmsfMLqxpXdo
	cmaxuIBR7cPOZpGjTSRlaTF1WnUiBczVuTbfvR4nF5mWNF509hPUxhx2LhwlkQ6UEAkxFdvHVJj
	mVbO3lOTia7i0Xy0/uBfgK1xX3fl54VPihZL4ZwUeV+t53uVzqtRk0AMIEsRIgLEhHxTiX60JRG
	VbICc8ZM3mY2+gQbRQg4fXVGy5O4Z6U4cNoN55HDs8LsNoOmnf8n9sRC+swji4yw7EgEv0j1yhI
	aeP1fc6VjfARr84ImtvwjThNfZBVVOWXl8MdpdoCYKqbWiRj41QqpCFf6usLrlcB7GeduLUtJ5A
	2RS1fMJ4VPAKG7WAH3yq2m8A==
X-Received: by 2002:a05:6000:184d:b0:474:3708:c8 with SMTP id ffacd0b85a97d-47f2dcc0d79mr17004061f8f.15.1784047305565;
        Tue, 14 Jul 2026 09:41:45 -0700 (PDT)
Received: from [172.27.236.80] ([212.187.182.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635aa34sm8766325f8f.15.2026.07.14.09.41.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 09:41:45 -0700 (PDT)
Message-ID: <a8d4ab9b-b2e3-407c-9898-1b9f7339f448@linaro.org>
Date: Tue, 14 Jul 2026 17:41:43 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] tools/build: Allow versioning LLVM readelf
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-input@vger.kernel.org, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Andrii Nakryiko
 <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>
References: <20260518-james-perf-llvm-version-v2-0-f12cc4f031d8@linaro.org>
 <20260518-james-perf-llvm-version-v2-4-f12cc4f031d8@linaro.org>
 <c366293c-7bcd-4e28-b3c4-575203403489@linux.dev>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <c366293c-7bcd-4e28-b3c4-575203403489@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/07/2026 23:29, Ihor Solodrai wrote:
> On 5/18/26 2:03 AM, James Clark wrote:
>> Documentation/kbuild/llvm.rst mentions that readelf is included in the
>> LLVM toolchain, but it's not currently included in this block.
>>
>> Add it so that LLVM=... options also apply to readelf. Users in tools/
>> were Perf which was hardcoding it, and another was the BPF makefile.
>> Both already include Makefile.include so convert them to use the new
>> variable.
>>
>> It also didn't have the cross compile prefix, so either readelf didn't
>> mind opening cross binaries, or it wasn't working for cross builds.
> 
> I'm pretty sure it's the former. readelf/llvm-readelf are only used
> libbpf makefile to read ELF symbol tables, which should be arch-independent.
> 
> We've been cross-compiling the kernel (and libbpf) on BPF CI for a
> long time. So the unprefixed readelf is already working, and adding

I think "working" isn't technically correct when you take into account 
the documented behavior of the versioned LLVM= option [1]. You would get 
one version of the toolchain used for some of the build and a different 
version used here. That's what caused the build failure in Perf that 
resulted in the tidyup, because they're not always compatible.

[1]: Documentation/kbuild/llvm.rst

> the $(CROSS_COMPILE) prefix only adds a new requirement.
> 
> I don't think this change in tools/lib/bpf/Makefile is a good idea,
> we could potentially break some environments. Even though hardcoded
> readelf doesn't look nice.
> 
> 

IMO it's worth the risk for the cleanup, it also helps to stop 
propagating it with future copy pastes.

Do you think it's likely that someone has CROSS_COMPILE set but doesn't 
have that readelf installed? Installing gcc-aarch64-linux-gnu on 
Debian/Ubuntu gives you aarch64-linux-gnu-readelf, so it would have to 
be a unique setup to not have it.

It sounds like maybe you want this bpf makefile to explicitly use 
'HOSTREADELF', if you're really sure it never requires arch specific 
stuff? If we added that it would fit better with the rest of the 
cleanup. But I think 'READELF' is less confusing and take the risk of 
some build breakages.

>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   tools/lib/bpf/Makefile         | 8 ++++----
>>   tools/perf/Makefile.perf       | 1 -
>>   tools/scripts/Makefile.include | 2 ++
>>   3 files changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/tools/lib/bpf/Makefile b/tools/lib/bpf/Makefile
>> index 168140f8e646..180dca9c57c8 100644
>> --- a/tools/lib/bpf/Makefile
>> +++ b/tools/lib/bpf/Makefile
>> @@ -114,12 +114,12 @@ PC_FILE		:= $(addprefix $(OUTPUT),$(PC_FILE))
>>   
>>   TAGS_PROG := $(if $(shell which etags 2>/dev/null),etags,ctags)
>>   
>> -GLOBAL_SYM_COUNT = $(shell readelf -s --wide $(BPF_IN_SHARED) | \
>> +GLOBAL_SYM_COUNT = $(shell $(READELF) -s --wide $(BPF_IN_SHARED) | \
>>   			   cut -d "@" -f1 | sed 's/_v[0-9]_[0-9]_[0-9].*//' | \
>>   			   sed 's/\[.*\]//' | \
>>   			   awk '/GLOBAL/ && /DEFAULT/ && !/UND|ABS/ {print $$NF}' | \
>>   			   sort -u | wc -l)
>> -VERSIONED_SYM_COUNT = $(shell readelf --dyn-syms --wide $(OUTPUT)libbpf.so | \
>> +VERSIONED_SYM_COUNT = $(shell $(READELF) --dyn-syms --wide $(OUTPUT)libbpf.so | \
>>   			      sed 's/\[.*\]//' | \
>>   			      awk '/GLOBAL/ && /DEFAULT/ && !/UND|ABS/ {print $$NF}' | \
>>   			      grep -Eo '[^ ]+@LIBBPF_' | cut -d@ -f1 | sort -u | wc -l)
>> @@ -182,12 +182,12 @@ check_abi: $(OUTPUT)libbpf.so $(VERSION_SCRIPT)
>>   		     "versioned symbols in $^ ($(VERSIONED_SYM_COUNT))." \
>>   		     "Please make sure all LIBBPF_API symbols are"	 \
>>   		     "versioned in $(VERSION_SCRIPT)." >&2;		 \
>> -		readelf -s --wide $(BPF_IN_SHARED) |			 \
>> +		$(READELF) -s --wide $(BPF_IN_SHARED) |			 \
>>   		    cut -d "@" -f1 | sed 's/_v[0-9]_[0-9]_[0-9].*//' |	 \
>>   		    sed 's/\[.*\]//' |					 \
>>   		    awk '/GLOBAL/ && /DEFAULT/ && !/UND/ {print $$NF}'|  \
>>   		    sort -u > $(OUTPUT)libbpf_global_syms.tmp;		 \
>> -		readelf --dyn-syms --wide $(OUTPUT)libbpf.so |		 \
>> +		$(READELF) --dyn-syms --wide $(OUTPUT)libbpf.so |		 \
> 
>>   		    sed 's/\[.*\]//' |					 \
>>   		    awk '/GLOBAL/ && /DEFAULT/ && !/UND|ABS/ {print $$NF}'|  \
>>   		    grep -Eo '[^ ]+@LIBBPF_' | cut -d@ -f1 |		 \
>> diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
>> index 0aba14f22a06..63276bf55856 100644
>> --- a/tools/perf/Makefile.perf
>> +++ b/tools/perf/Makefile.perf
>> @@ -215,7 +215,6 @@ FLEX    ?= flex
>>   BISON   ?= bison
>>   STRIP   = strip
>>   AWK     = awk
>> -READELF ?= readelf
>>   
>>   # include Makefile.config by default and rule out
>>   # non-config cases
>> diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.include
>> index e81e5b479c56..380ad84ac51e 100644
>> --- a/tools/scripts/Makefile.include
>> +++ b/tools/scripts/Makefile.include
>> @@ -73,6 +73,7 @@ ifneq ($(LLVM),)
>>     $(call allow-override,LLC,$(LLVM_PREFIX)llc$(LLVM_SUFFIX))
>>     $(call allow-override,LLVM_CONFIG,$(LLVM_PREFIX)llvm-config$(LLVM_SUFFIX))
>>     $(call allow-override,LLVM_OBJCOPY,$(LLVM_PREFIX)llvm-objcopy$(LLVM_SUFFIX))
>> +  $(call allow-override,READELF,$(LLVM_PREFIX)llvm-readelf$(LLVM_SUFFIX))
>>   else
>>     # Allow setting various cross-compile vars or setting CROSS_COMPILE as a prefix.
>>     $(call allow-override,CC,$(CROSS_COMPILE)gcc)
>> @@ -80,6 +81,7 @@ else
>>     $(call allow-override,LD,$(CROSS_COMPILE)ld)
>>     $(call allow-override,CXX,$(CROSS_COMPILE)g++)
>>     $(call allow-override,STRIP,$(CROSS_COMPILE)strip)
>> +  $(call allow-override,READELF,$(CROSS_COMPILE)readelf)
>>   
>>     # Host versions aren't prefixed
>>     $(call allow-override,HOSTAR,ar)
>>
> 

