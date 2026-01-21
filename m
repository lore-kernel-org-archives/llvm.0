Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9E044CF4E
	for <llvm@lists.linux.dev>; Wed, 21 Jan 2026 08:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768984454; cv=pass; b=L8svMW29iyCPDjB0d1o4jVguqoqQ0kQNer/pRBbcAZIUgng7+MLQ5E5EHA1IAXrxQx7PQAgeLcEozgzpDBcp+9wsBHrwN3f9LF09L1Tn09kZG8ajuXLtYLwvmM+G1K0q4jiJPqvYKINKZtUxYeVOOvM3+1QWA7RxlT+V7NUsYjE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768984454; c=relaxed/simple;
	bh=qR8UQAhEPTcY6PXq6mSRhJOzhLXbgRU8yzc2N+B5a58=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cn+OA8xRYywrdwJYRE0mXlPrewnEqw4T84znS9cIXmUI/8Es0t/361r4l0W3vQEVmiW6Bbgg8ioU7ragVrxRLUbaj7wWXt766RqkK43Q1SFfjA5ZASpeHuxYfCJ6VEAdpI6kIlT/oiU2FWRzce/d9T/+jdZ2GRZ/BzCzkWVPDr4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=paK84o2Z; arc=pass smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="paK84o2Z"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-88fcc71dbf4so48193036d6.2
        for <llvm@lists.linux.dev>; Wed, 21 Jan 2026 00:34:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768984450; cv=none;
        d=google.com; s=arc-20240605;
        b=WiohpXfnMnxgHsGGtc8DKN6Nw+WfaS9U1kcbRZ8vb76u2lYMOMvk73vfZiV2rYTh3N
         yEyQTGZYyHL+/qcmpusA3sCCDtSti97nLOXK8/aimaBFbCFpSjGSHP7bWTExP7quE1FU
         25LKMj+lkQ+fGpLElDqH54tRwJkg1socgDnWSq/PVhePdfOAQosoEWMNUkoM+gZXqtut
         SNGli3eWmjt7j2m+p5L1vCJZoeq8s5pQtvn2ECHUFRiOmUOt+76cRMC7kYwK4i5iiWfN
         oPeliqoFkN/dvMB7CrLUxRneqgNCgEVWLIuiKSSsFiEDDUXYDZU6yG7yNllO5ggAJ2ax
         PpQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qR8UQAhEPTcY6PXq6mSRhJOzhLXbgRU8yzc2N+B5a58=;
        fh=S/HP+kUgBAOabHaoElfl34IO20T6yFe5s6cDBfm5U/w=;
        b=iXeqVxRVqTBNL6adJwT3niw2vc/GoMrc5nqVuC8dZZ4Lj2wqgrGYILol0+mOD5mB4s
         DNbqNTKxoEpNuNeV2NemslBPmAAE634D/w8wUxyoJDBGB/2H4k8ZaaFb+8Skt17T9GCe
         ZZ4x+NXdSpbww6PU8ATi2JTLuu8u8KgIa2Rt8iy7mqASwow6pJNUZR0SQ+xjKA+exskS
         aUoVB9Mbt0YG2Ll9wNbOFrGsCzVmYNqZoXns+hM0Yyyksi/PfYZOQo4gGRY7hYq9spik
         tWXcSjs8UJuZK2Pz7gsFYtbOsvQsz/GI2HNSBXmpzZsM8Jn96ehFPbemUgmK9O1hvy2W
         V1Pw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768984450; x=1769589250; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qR8UQAhEPTcY6PXq6mSRhJOzhLXbgRU8yzc2N+B5a58=;
        b=paK84o2ZVPm/zxKSv7jRwljbZQo1JpsN+r4ahZT15Ym34hDCpkjr/OhKN05E3leb1r
         Yh7waSn6nU3/3aVnwikFciA74gm1yqt85DMNPRF6svWvYTeR32gRnRBKmcEynmawRl8o
         1JdMVu3Vc95Sxx5o4FoB3cTEaz/pD7IJ6DmtLLwalqDbeTIKIUQR3AOaPFEAmflh4NpT
         LW6CFy7IQr51Ay6PhRQoeJqoK+QWzCDzGQPboiGPfGOYaCfeMBIk/UCfdR5UndtDBj41
         bGf8e59yOZs2lEUXMdFmo3XdZvr7Jyk6zyVYhTa/rgS/qaz8P1Dj6YXn4StMbocQfH75
         6VXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768984450; x=1769589250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qR8UQAhEPTcY6PXq6mSRhJOzhLXbgRU8yzc2N+B5a58=;
        b=DIDzD6uDLp/WeSeZF0QxtcbtHOaYO/zPRG2CegWmSB9BDa+rzoUZZBy19YK4KgBEqp
         Jr8mh6YuBSO5s/GjOKNDo6CRNI2dlQclrNPNrNKWtO7mMiwrg6MH1GzHyGrIwc5j1kgs
         8+QVuj50+wiu6RqAiERJkRqr6rX7qjhhoS/tPBuIwuEwOp4d8V2SAL5pRpRIJwODCeSD
         TZURdFz0Ry17YxkaCD+VLsD2T/fNUw6Sda6B0kqKK3kaLu4pK9GEu1f38M/jGYE8codz
         yy5+vZlNlxLgh3Fcm1U/mDq8JtCy8XPCWiOCB10z/KyA0Ad3DvjMzvG8rnt9qHHKj2TP
         Uz1Q==
X-Forwarded-Encrypted: i=1; AJvYcCU0obG3yJ4dK7/13zqnbUsWYlvxGYER6k935JjIxxuKD3AszN91gWms5r5h1j2wCNbQQs5J@lists.linux.dev
X-Gm-Message-State: AOJu0YxIhFP7LbBgh7tFP9RWdRxZzT7bzVT6UDFGRQffRpWhrrghcl00
	DyfT5NIfDoPQJh5iIM5P7uXvGPiQoILmIZ4uritQvMbG5ZQIaaXl+CpGHuIHmQKeanlihpmbF5u
	vUcpISmP12KAagXZYpa3fnZ6tETP+D2NWUAyzbbuc
X-Gm-Gg: AZuq6aLc00zwVnNRWTrb0Pjv97rf8Tk0dEFTkVBkSJ88H9w31HLnLp/+zakdo1e6Fgi
	RWyNZEdkHNCU3hZSQW6jrUxyMa2WjSrzLD+R+Nl71KL11avv1fFP1POboL6lklqxcaSbWhfoP1s
	q5hmvShzq4ujINH+6glRbnTtM0Zg6j5A+Vh+6ILqu/gYH4M9OJ65K54JXdc3qOgY8PZQO9BV1xX
	N0FVEXQiHz1FHbQpPudbsreEI7ZPi7Qzqbt7ceeP78nrjmA7sfP8K/ZxG6e3h8TZs1TkkgI
X-Received: by 2002:a05:622a:1a9e:b0:4ec:f26f:5aea with SMTP id
 d75a77b69052e-502d852debamr64442781cf.68.1768984450268; Wed, 21 Jan 2026
 00:34:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260121-b4-remove_cache_from_obj-v2-1-7213d36b89d5@suse.cz>
In-Reply-To: <20260121-b4-remove_cache_from_obj-v2-1-7213d36b89d5@suse.cz>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 21 Jan 2026 09:33:58 +0100
X-Gm-Features: AZwV_QikhwEzU8VLl-_D2F-UkNB_eH87BoWYdZ-Q4Ay03HF_gzeB9yWn3TofxPY
Message-ID: <CANn89iJhz9RfpG62kW1XmL1=cTKvVN5kS-KM+TpzE-mPW4WhUQ@mail.gmail.com>
Subject: Re: [PATCH v2] slab: replace cache_from_obj() with inline checks
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Harry Yoo <harry.yoo@oracle.com>, Hao Li <hao.li@linux.dev>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 7:57=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wr=
ote:
>
> Eric Dumazet has noticed cache_from_obj() is not inlined with clang and
> suggested splitting it into two functions, where the smaller inlined one
> assumes the fastpath is !CONFIG_SLAB_FREELIST_HARDENED. However most
> distros enable it these days and so this would likely add a function
> call to the object free fastpaths.
>
> Instead take a step back and consider that cache_from_obj() is a relict
> from when memcgs created their separate kmem_cache copies, as the
> outdated comment in build_detached_freelist() reminds us.
>
> Meanwhile hardening/debugging had reused cache_from_obj() to validate
> that the freed object really belongs to a slab from the cache we think
> we are freeing from.
>
> In build_detached_freelist() simply remove this, because it did not
> handle the NULL result from cache_from_obj() failure properly, nor
> validate objects (for the NULL slab->slab_cache pointer) when called via
> kfree_bulk(). If anyone is motivated to implement it properly, it should
> be possible in a similar way to kmem_cache_free().
>
> In kmem_cache_free(), do the hardening/debugging checks directly so they
> are inlined by definition and virt_to_slab(obj) is performed just once.
> In case they failed, call a newly introduced warn_free_bad_obj() that
> performs the warnings outside of the fastpath, and leak the object.
>
> As an intentional change, leak the object when slab->slab_cache differs
> from the cache given to kmem_cache_free(). Previously we would only leak
> when the object is not in a valid slab page or the slab->slab_cache
> pointer is NULL, and otherwise trust the slab->slab_cache over the
> kmem_cache_free() argument. But if those differ, it means something went
> wrong enough that it's best not to continue freeing.
>
> As a result the fastpath should be inlined in all configs and the
> warnings are moved away.
>
> Reported-by: Eric Dumazet <edumazet@google.com>
> Closes: https://lore.kernel.org/all/20260115130642.3419324-1-edumazet@goo=
gle.com/
> Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
> Reviewed-by: Hao Li <hao.li@linux.dev>
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>

Acked-by: Eric Dumazet <edumazet@google.com>

Thanks !
