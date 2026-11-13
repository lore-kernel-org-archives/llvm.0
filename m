Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794599897;
	b=gFwWORsJUc7CLj/Rh64OGYD0+/2T3BD9+rTQc5EuOFC3kxTt2w3+TQx5joqhuYkBnYdy
	 /sUwNo6azH+l4UiWghMvIAAmxy9REFla+JrK4qKJSEjrmclKm8MPmnQ2naOW40LaF3ktV
	 m5+deIz3Bkx43w2y9t2h8KJ+tdGoXtptUPJnqjl9l/r3a2tX9d6gkC2uXh7RsyLPmC1k0
	 oQtluZUNDyjs8hyhf/er8ucGHJIK7jVemHKVWlc2zYSLyHIoY8baUBqh3Ix5UFJfZK4vI
	 7fUI41jL3Yq6E9eDWeWoX6Y7g0OrrHFqTpWvd6zVI3oBna1r+isWsCLnIQ69Oe000sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794599897;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=mK+snQ9Frl5VxzHZ6tx3RVh1smAcvo0rFgfFkfaD5gg=;
	b=rhtYbQgOiXinvjwZCNSrTd5GZ8Mj1TqXVPiuya2AH8RftMAIydr8kCSm+0fTvy7GfYaY
	 QvpnJC3nOpOzwb1DcZUk9GxaYtdre0bN6ldSQlmoyodru72Vn11SgVHz8STDLv7YD2wVo
	 +SoU3G1DF+SP9K7T9R+u5HPYEc3kWFa2LN7Kty2JN+lvDBydeSaYzBOcXn4TP9HnDsoin
	 MsUaFvkKoN3oy2qjU/JkWWPl82H7/DzKxIFG00FycCrV335s0Pi50ic8kM2RcBiQJ1I45
	 wBs1l2A984Sqd5dbmcJZecwFM1ftzCrKsRi1Uu0T79W12SBnga8Tu4J4IsYMmJ+HuMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b="q7JzD/tz";
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA20606A884
	for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 19:58:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FA20606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=q7JzD/tz
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso514776a91.2
        for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 11:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794599892; x=1795204692; darn=lists.linux.dev;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mK+snQ9Frl5VxzHZ6tx3RVh1smAcvo0rFgfFkfaD5gg=;
        b=q7JzD/tzDcobK5bvMRtDZ0ou1y3PIaZtNNOVFQTBf4qk3nIInQptvyWCaXU6FUrPkx
         yHfQ6I9At/84SOxgU9/h5ADkKXXzLxuObTIuCmEvJh1d17r7oHVMNAEem1Kyo7G+DeJO
         ml0XNE9tZZGdj590Z5+fvYM6RColz/cO2o5GU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794599892; x=1795204692;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mK+snQ9Frl5VxzHZ6tx3RVh1smAcvo0rFgfFkfaD5gg=;
        b=fLsB7bMdKpt99ucg9CbCJO4ReMqbWFDh3abZRSajkyf2HLaiwvDc+jOyNRr+FoqM7X
         f5dM5BLexpntw+wdL9mkhlYdhW+IEGOeAy2w9b7oE/opCuCit+G/r6GFo996u6+3jb/U
         7WYpkKI3Duosc0yCCTzvMW56m+y5Bm5mNVv+rg8fRX0pNQA0UyryBT0tAC0k+quGp1La
         SiaKz+vfWIc6ijQrrl062IykfiM8pbhtCgCfRDqggmMK4FkXEFRUQe0qWhQwHskG41j/
         vCSEeGTGLUye9z6LZOmZGffjuQniJHadGc0OUE//tmYxnV9KZUcXnFoqkqtWxt7rDo/a
         cXOw==
X-Forwarded-Encrypted: i=1; AL+hErHBbZ5bh3+ln8qUCoCEAjJwOdpKgi7LDGQqrqzgV9Lz34DCSOxKn7f57nKlZE4BUvaecbP7@lists.linux.dev
X-Gm-Message-State: APuU4Z+kkk4meM4VTZBRI1qVYr1nGgMNaoJ8IgtIfnXhdj3XWsQnXiP/
	4eoozpNgk7Rtegxc08PfeTm4+7PVadqhjzAF7pspRFwPC3iy5LwIrKb0xBmpDIDw/OI=
X-Gm-Gg: AYBFou2RFKppbN6F2L5ra/Pk21fG+QEJlvKi6WGmy3da9uvSmp5kzDnreA96DdcIZk1
	8dEAsWwpwPKjfOU86vp7PAydDaxjz/h6YwK2ZWttgLE3mEcZhezd2eyWV49SMWfAgtG88lEc/2C
	xiUa4qslWxTdJU2vye2D49J83E1X9+SBY0G5wWd7fpOMi469hODVP8pgFvmjrLlaQzrqddThn2u
	pRHN5eL8BF/JgObN93RZsm1ZfrMOMT2PrN1dj68s6DGh/8U1RSoTb68tgboryWV6tloNwzSrrk7
	FN/suUNu2QSdSJq8NjMUV0VWTFcGr1FjLTTzKDh+oNm1slL5pXTfAvVUbY9katAQHqQ5QT2e5XZ
	BvGt5SN4vV0WLkVkcNusXiMsWMCO1TPEVg3fMRWeo+/dO+BvbYf2S644dMnq5m1OWk5m6Te9GMj
	NSaANnXJtJdS4pQ/Eu7T8MB03c8xWTvIlnnk5hQpEIY/4cf0tdChOsa9pJW3KJ+GzSuFlv9sKZe
	ygt5Rvf+FKrNNZLBGJueZQ6c9ZyuUqvxjNBfkZXfzFxvqEgoroIODe2O/ZzaD/ByiufEEwsQfe3
	n+9C4WzGEekSUFvPXbLl8rbYfGp1xfjkExFmmIBvQngSErkGc3z4aoi0KOHf/KXrCNX5BbZjTBT
	HrF9FwZv/huaTTZCVGcNBYZih10B89RC4ngTQZjf3QN6348HxmEYzRsFpsut7DPmZhqFwxpgIRf
	GunbStyymEkhHyhMoqzwjxH+9HyIPtNKtPxlY8AjRsyPbHRe3JdC1sTAYnZuw=
X-Received: by 2002:a17:90b:17c7:b0:3ab:884b:65ab with SMTP id 98e67ed59e1d1-3b1b0ba4fd8mr3495026a91.55.1794599891728;
        Fri, 13 Nov 2026 11:58:11 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f7e5055sm14868305ad.39.2026.11.13.11.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:58:11 -0800 (PST)
Date: Fri, 13 Nov 2026 11:58:08 -0800
From: Chris Down <chris@chrisdown.name>
To: Vineet Gupta <vineet.gupta@linux.dev>
Cc: dennis@kernel.org, tj@kernel.org, cl@gentwo.org, peterz@infradead.org, mingo@redhat.com, will@kernel.org, boqun@kernel.org, longman@redhat.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, ast@kernel.org, andrii@kernel.org, daniel@iogearbox.net, acme@kernel.org, yonghong.song@linux.dev, eddyz87@gmail.com, martin.lau@linux.dev, nathan@kernel.org, ndesaulniers@google.com, morbo@google.com, justinstitt@google.com, llvm@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] percpu: do not put btf_type_tag on per-cpu variable declarations
In-Reply-To: <20261110012235.1024461-2-vineet.gupta@linux.dev>
References: <20261110012235.1024461-1-vineet.gupta@linux.dev> <20261110012235.1024461-2-vineet.gupta@linux.dev>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261113115808.87a52a7c74e293ce@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Vineet,

Vineet Gupta <vineet.gupta@linux.dev> writes:
>The message is confusing: this is a declaration, not a definition. But
>the compiler is right to object to a type tag on the aggregate, and the
>issue is fundamental: every variant of an aggregate shares one DIE, so
>there is nowhere to put it. clang drops it silently and GCC warns.

Not a big deal, but the definition in GCC's message is the definition of
struct cpuinfo_x86, not of cpu_info. It's saying the attribute is being
applied to the struct type after the struct was already defined, which is
accurate. So maybe just drop that first sentence?

I've tested this with clang 23 and GCC 16. With clang, the same 280 types
and 3360 bytes of BTF go away. Likewise, with GCC, the per-cpu
declarations no longer warn, and the non-enclosed address space errors
are gone.

Once the commit message nits are fixed, please feel free to add:

Reviewed-by: Chris Down <chris@chrisdown.name>
Tested-by: Chris Down <chris@chrisdown.name>

Thanks!

Chris
