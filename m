Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794609376;
	b=lhPjv/HvUO2zoLApENCEMeLVfRCwinuRoPg6dqzUELAf6ECod/sv50AuNVaNiqDNY2yX
	 9Vv6iRd0d21thTWbdBWY8SAIW+ZUZ5gN5vo70+2B7v1ogNkDfGoy4DTDXvw6Fa6RU74iZ
	 BxAnwpy0TSsxYEBnHruWRsf5czh+L1NizOc0rBiOJRFTR3hhpOZJwItX2a8WyU0vs1oiY
	 z3wccKIQYaYK6VInDXAu+iQx6Sl0XdcvRosDB793a+3V1t7Ivn142ZTznO9trr03lAuAL
	 8uuxqjV1lpliu/7cw3lYI5TDmWK3LEldCEyUkfZOP1vCGwL7E7/5KT8DcJvLKPac6xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794609376;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Tm0KsbHdwGJF54Zx8hQsqG6F8oKBBxs/HZqcH7Y8YjI=;
	b=KJImR47AnK61PsYObAmIp+Q6JK68R9w1YM559eBc0Eq/4cuoy3C1IPN9/T7dai+f/2gj
	 xLPIb424SkCh9xbuR1XFRJjziH6TWyxQUpIaftcq0WQYtidMourEg3Dx3kpHYskMsskHt
	 5+Qz1UPaMJSumV4MExB3yQUtPdTyp1pVaflOMHVRnuAGHrpvCQxAY3on4hH6HWOf1fIgn
	 Vlo0w9FPSGELQethe0sKRaVeHE1iV16JbNasUEM+oph3un8olty/gDRRSnN6MkYqlufXk
	 r1A76lB8qcxnOtyhnlwllu/BDCHDugTp6WbppfvK0WayPF++bH2ru+5H2VNoayMc1rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nLoEHnEq;
	arc=none smtp.remote-ip=91.218.175.163
Received: from mta0.migadu.com (out-163.mta0.migadu.com [91.218.175.163])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A46A606A55A
	for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 22:36:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A46A606A55A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nLoEHnEq
X-Envelope-To: llvm@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=TtBRXW6QA+XpUjRfc2qsO4A+37Kv5TpP9BUsEKKizFQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794609370; v=1; x=1795214170;
 b=nLoEHnEq1ZQpjZzdWvaZtZme0132ShAMTCjauvoSbqTA6PsII5ve4EpcSu6HR9+7dBd2lWrE
 s6D26Efm5liWkQy9KCBW1jMgEhSdXgMNSRvodyKj95Ucclpp66VuwNcfrg/jz8k7wLhAmYWV1QS
 JDJuAjRrNzexoRuWeBYCRihQ=
X-Envelope-To: llvm@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 752cf6fae846f8b5;
	Fri, 13 Nov 2026 22:36:10 +0000
X-Mizu-Trace-ID: 752cf6fae846f8b5
X-Migadu-Flow: FLOW_OUT
Message-ID: <55b6a4f6-46bf-4edd-9da3-e9cfd48e8a5c@linux.dev>
Date: Fri, 13 Nov 2026 14:36:03 -0800
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
Subject: Re: [RFC PATCH 1/2] percpu: do not put btf_type_tag on per-cpu
 variable declarations
To: Chris Down <chris@chrisdown.name>
Cc: dennis@kernel.org, tj@kernel.org, cl@gentwo.org, peterz@infradead.org,
 mingo@redhat.com, will@kernel.org, boqun@kernel.org, longman@redhat.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 ast@kernel.org, andrii@kernel.org, daniel@iogearbox.net, acme@kernel.org,
 yonghong.song@linux.dev, eddyz87@gmail.com, martin.lau@linux.dev,
 nathan@kernel.org, ndesaulniers@google.com, morbo@google.com,
 justinstitt@google.com, llvm@lists.linux.dev
References: <20261110012235.1024461-1-vineet.gupta@linux.dev>
 <20261110012235.1024461-2-vineet.gupta@linux.dev>
 <20261113115808.87a52a7c74e293ce@chrisdown.name>
From: Vineet Gupta <vineet.gupta@linux.dev>
Content-Language: en-US
In-Reply-To: <20261113115808.87a52a7c74e293ce@chrisdown.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 11:58 AM, Chris Down wrote:
> Hi Vineet,
>
> Vineet Gupta <vineet.gupta@linux.dev> writes:
>> The message is confusing: this is a declaration, not a definition. But
>> the compiler is right to object to a type tag on the aggregate, and the
>> issue is fundamental: every variant of an aggregate shares one DIE, so
>> there is nowhere to put it. clang drops it silently and GCC warns.
> Not a big deal, but the definition in GCC's message is the definition of
> struct cpuinfo_x86, not of cpu_info. It's saying the attribute is being
> applied to the struct type after the struct was already defined, which is
> accurate. So maybe just drop that first sentence?

Oops, thanks for catching that. I misread which definition it meant. 
Dropping the first sentence in v2.

> I've tested this with clang 23 and GCC 16. With clang, the same 280 types
> and 3360 bytes of BTF go away. Likewise, with GCC, the per-cpu
> declarations no longer warn, and the non-enclosed address space errors
> are gone.

Thanks for verifying, with both the compilers.

> Once the commit message nits are fixed, please feel free to add:
>
> Reviewed-by: Chris Down <chris@chrisdown.name>
> Tested-by: Chris Down <chris@chrisdown.name>

Awesome, I'll add these in v2

Thx,
-Vineet
