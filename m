Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794599895;
	b=HpHsD+EsrHL7Ep2hW3XkX8boSJh5G25X0q0aCQ5d4NFCJXj3Fyu9HQpQ2X9Fkc0ILsKm
	 zvnXnl0AQy8v3bINk4YwM3fELOQXrWRFEFD4cBbUParsUDXMZLbh4S7G3F2i4DTeai29p
	 O8922qqXoCqUyhCiZ8ngbryv5BweBDDtwoo6fOFWAH/zTUCGIUva643o4jFBRjpPQdQ81
	 gA/YBx41x+l4bSLY4JsJPhV5+HdSCRZWQXUSUfyu8xsYmXznGZNt6Lj/bfUnSCbNYuWWt
	 AbM/Mgv4FLTcGkqX5Y1dHZeMNHRKR0kiygMv1g+y1ooHst4lLphvpyndcTSwI9+DTEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794599895;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=SA/I1XcNdOqWCHpHPoabvJbPaHjQpV93aW+4lUY75XM=;
	b=hC8VSAfX71BvGPPq4Efn5f7Tz7B2eXOPDQKzMpDYahzgEaPCBP4YrAHJ4m9DqojraMxC
	 eviWCkrlOv+1zUUzvSt/SBtTunzUioNRHCwaLUi+sRU4cTL1Vwxheg7CcuG/dqukO6w+G
	 wzGJCH2O38C76uFwHEgmt4FjYmx+2fPqC9KDYbPxenXdCFIr8TB5ck71Sv6VlSAOqF2JH
	 fwSnbnP4yB8nR4GFx8/mQ50wk3a7it0BBaqu2dGixyhlfKD+regAHedBHsrKTMqj7yKQ5
	 mOrFDevXdhz7CypNUt7zIizo75xPkjQ7VTfy1qVlcIhlvh0Cl6JA7BJGB6j6B1OY+SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=X+n2NrFp;
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA555606C940
	for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 19:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA555606C940
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=X+n2NrFp
Received: by mail-pj2-f2.google.com with SMTP id 98e67ed59e1d1-3b14c80b210so310223a91.0
        for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 11:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794599894; x=1795204694; darn=lists.linux.dev;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SA/I1XcNdOqWCHpHPoabvJbPaHjQpV93aW+4lUY75XM=;
        b=X+n2NrFpcQxVWCetjdj8qKBghArUkxvkHd0OUlkRmyx9eEI19Fa5Px/rmxlhxir7eM
         7xZ/VkBQL2qiQPkpLVnXfB63UbmuIujmPrG1V6edDBKGrKZLrl4xqTRdRYfEpa08ngfH
         T7PIeV/Bud6ddSPD4UxqXmgHul5AV1FU0tvss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794599894; x=1795204694;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SA/I1XcNdOqWCHpHPoabvJbPaHjQpV93aW+4lUY75XM=;
        b=k8i+jNGiEKdSfg+ssfbt4BG/Vxq1EBc+2lng9leWjWJ+Chm2xXlJdQ5vLvvPuy1/r4
         3xjMqcfFyFWhQo179FdKKbWC0s99GaUXxJ7cts8G1BYl7iq8zgyL+bik3sUv07C05lW5
         0cn6G9NK1VOy4/mU3ud5TcYPxWJd+FjYjJoJaq38jxjHBWtKmZMKxqiMMJdaUOvL+/qs
         iM7nIk5rbQ+ixiOA1Y0qFtn+GzxdpgwpR4IRq29H4DqibhwYxs/2PkQYD/a6dK0ukQjf
         BvZaUyQA/8XIPti/jiBTbTfJPzSPGFTxyw1A+nLuBSi6Jd8YaJJOLNK6jWFqtAtUcXmq
         3Xdg==
X-Forwarded-Encrypted: i=1; AL+hErFWj0otpnayT/YJT+8bqfwaRyWQQoGcceL8y+88/dtF4DcghplhlycyWQzygDbacaPcA6dm@lists.linux.dev
X-Gm-Message-State: APuU4Z+6mP7JtKfOcYglSWitTWUDnlQ1rm7RWPbSeWcnR8TADHIEIpdK
	sfXlOf5fHcbhSBsSPNMfKxVsVHewi+5ENE+ObcVpAFt2Vt0tPZeggSXgnjp3dW2k0vTp6g1jHir
	qG+3dIqVN8wb8oypLJA==
X-Gm-Gg: AYBFou1ib5uza0lEQEq87x+lMO6Al6H7tMwe13xQFt+WrhdwHo2MPJvwx8QDb2+czyX
	dEyEZa71kY9icB2jgA7ppHeVRol8it6hBy5zLIX/iotHh8opnDrKFN2O/zbFPFr1JDMrS85CAkr
	ZKXIERhZmPktsk5sqU0RyFa5YAYgDYIOTr5T1ySq47JdpzJbhtgAfJ02BC09RaOAotiwNluNkJy
	i+578z5zihFRpbLdCu2GoQ1ibm4hvB/om0eWBV4vsg6IsgQI/ee7s853OG+2Y2djxI9p16QDjF8
	mJ6xhd2Ip236J3ji8LdDIa0xqZz8EDEKwyKBa1fzu0wSqiYgIOqUUpJG26CB1lXHeQkm7rlblGh
	0H2WCjdDW8xInz/0OejG4l8zKJ9j3bpeeTBZCd+EJhI+axyAYuITDqvBcTYe6UFYJuXhSjF2I5t
	QrbgTs7YgDdAfrkyjDthClQxqHY/bPUqnJ0u9csSF9VnLuaJO4RrfK+Yu7lVLRDh05vqWMK+TGK
	5SgbgtAaRIX0Hs8F6/M0VOHTN17GMdwudT37+5ti2HKKJDZmO5lKbVprQd14iM2zLXgZu3tfsGG
	ZhRTfpOj73rpxjthQ6PyqS7zO9/2GAEGGggmvyJGTJBz4dv2P6I73Xz3tEKn5bJiTKZZCefjqyf
	6uCNv1Lms6cSamS9tzaMfQ4HkpDylyotLLfUfMXItgtuc+Qld9foIEDikCQOT4pxqafuPh8XIdq
	2FA91FxLo7o2eeUem83tZPvP2aUiQd2rXQr4zb+n2tkx3TaDnD8ysoB3GFyF8QElYeyXEGroP0s
	Uo9yoyG
X-Received: by 2002:a17:90b:394e:b0:3ab:be66:ddbf with SMTP id 98e67ed59e1d1-3b1b0b60493mr3259630a91.54.1794599894079;
        Fri, 13 Nov 2026 11:58:14 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec66f4csm5853480a91.14.2026.11.13.11.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:58:13 -0800 (PST)
Date: Fri, 13 Nov 2026 11:58:10 -0800
From: Chris Down <chris@chrisdown.name>
To: Vineet Gupta <vineet.gupta@linux.dev>
Cc: dennis@kernel.org, tj@kernel.org, cl@gentwo.org, peterz@infradead.org, mingo@redhat.com, will@kernel.org, boqun@kernel.org, longman@redhat.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, ast@kernel.org, andrii@kernel.org, daniel@iogearbox.net, acme@kernel.org, yonghong.song@linux.dev, eddyz87@gmail.com, martin.lau@linux.dev, nathan@kernel.org, ndesaulniers@google.com, morbo@google.com, justinstitt@google.com, llvm@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] local_lock: do not put btf_type_tag on the lock guard type
In-Reply-To: <20261110012235.1024461-3-vineet.gupta@linux.dev>
References: <20261110012235.1024461-1-vineet.gupta@linux.dev> <20261110012235.1024461-3-vineet.gupta@linux.dev>
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
Message-ID: <20261113115810.cd33f9ed58c02dd9@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Vineet,

Vineet Gupta <vineet.gupta@linux.dev> writes:
>	typedef local_lock_t __seg_gs
>	__attribute__((btf_type_tag("percpu"))) lock_local_lock_t;
>
>	typedef struct { local_lock_t __seg_gs
>	__attribute__((btf_type_tag("percpu"))) *lock; } class_local_lock_t;
>
>Both put the tag on local_lock_t, an aggregate: the first on a typedef of
>it, the second on the pointee of the guard's member.

The typedef is the aggregate case, and it's the only one of the two that
GCC warns about. But the second one is just the "T __percpu *p" spelling
that 1/2 keeps the tag for. _T->lock really is a pointer to per-cpu memory,
since local_lock() passes it to this_cpu_ptr(). So the tag is correct
there. This patch drops it from the guard's lock member and the
constructor's argument as well, not only from the typedef. I think it
should keep the tag on those two and only drop it from the typedef.

>Every variant of an
>aggregate shares one DIE, so there is nowhere to record it, exactly as for
>DECLARE_PER_CPU() of a struct. clang writes the annotation into DWARF
>without complaint, but pahole does not translate it from that position,
>so with today's toolchains it reaches BTF from neither compiler.

That's true of the typedef, but not of the member. With clang 23 and
pahole 1.32 the lock member comes out as PTR -> TYPE_TAG 'percpu' ->
local_lock_t, the same as any other per-cpu pointer.

For the typedef, clang 23 puts the annotation on the typedef's own DIE, as
you say, so there is somewhere to record it. It's only pahole that doesn't
pick it up yet. You also mentioned GCC patches for type tags on typedefs
in the pahole thread [0]. Once those land, does this warning go away?

>Unlike the per-cpu declarations this changes no BTF at all. A tag in that
>position was never recorded, so there is nothing to remove, and the one
>percpu TYPE_TAG that does reach a local_lock type comes from those casts,
>which keep it. An x86 defconfig built with clang is identical with and
>without this patch: 152551 BTF types and a 6828300 byte .BTF either way,
>and .text is unchanged. The patch removes a GCC diagnostic and no more.

The defconfig BTF only stays the same because nothing in a defconfig uses
these guards. lib/test_context-analysis.c is the only user in the tree.
With CONFIG_CONTEXT_ANALYSIS_TEST=y, class_local_lock_t,
class_local_lock_irq_t, class_local_lock_irqsave_t and
class_local_lock_nested_bh_t all lose the percpu tag on lock with this
patch applied.

Nothing in BPF looks at those types today, so this doesn't break anything.
But it does remove correct annotations to get rid of a warning that is
only ever caused by the typedef itself. When the guards were added, the
type was only ever used as _type *. The typedef came later with
3931d4b98039 ("cleanup: Basic compatibility with context analysis"). If
GCC isn't going to accept the tag on a typedef, could this be limited to
that typedef in cleanup.h instead, so the guard's pointer keeps its tag?
As far as I can see, lock_##_name##_t is only ever used through a
pointer, in DECLARE_LOCK_GUARD_1_ATTRS().

[0] https://lore.kernel.org/r/252c53f3-3f06-40f4-9cd3-795eb298687c@linux.dev

Thanks!

Chris
