Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A2D223301
	for <llvm@lists.linux.dev>; Wed, 27 Aug 2025 10:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756290121; cv=none; b=KX5qBBtmTd7pBDIE7VHeEQ+aKa1fvOe3bPKyD+7GAem+JKuVNekb4eW5YUYJC1RcfZzWzIZIl4abirp0oDtf+lR63WDzQHQ0bLZgm6ch1Ik+VivGO5rT7QTkCOMW6Y7tpv/1xRzvICaMJ2bK2aXkQpdnAI5yYhS5ktzISvDzuaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756290121; c=relaxed/simple;
	bh=lWGnrKUEhpYeD21CuLeEotP8PCBIr3/OuRbGU8QS7F8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=COijYhU4UPZrrQ3CceiHln+0Q/LYhEicALGHekFQKRTe1uMd31QfIXdt4tlfZg7pAd+GJ9aW4ab+NX4JAYZdYNidyisT7gnpm0dvHrZduGC0WG/IFXQwXDuTeNyCAD3B428udygOjxKRLXWxmVKgxsNwfSz7lLPtTyH6slrLbsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bmv4fDh5; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bmv4fDh5"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-77057266cb8so2749802b3a.0
        for <llvm@lists.linux.dev>; Wed, 27 Aug 2025 03:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756290119; x=1756894919; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aq3fc6aO1OdCHOdewiqMtQD6LH39KbeVaeZG01Zb1Dc=;
        b=Bmv4fDh5HVdiId5pcFsJX0W5If/onTu8lxlulpGq0q2ftceMrngSRHOsZYGuzi1uey
         NEFB/W6h6ZclqcQvW38UmjB/qEV8rt0S96c2uK5DKs61Xid0nOHmHtCMjeZy2bx3vmxB
         OiIrcaQ7y8/ZqHSyqDFydt+60f25Hmvr+Lgex+dnhkbeUlrQ2JbkKeDKCCC9aSSZofww
         3Jee8YGKMt1lG55YeYmqkG/updBi5D1j98R8/lF0INEgj57aWWw3nXpk6Uuh/MTe1ZFi
         K1cbMT8FSJfu5DKyoaRLCl2Pa6qZmIkB9wFL6B0v3nkCNkhYY/iZZdVTZXxqIsjqkGfV
         sLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756290119; x=1756894919;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aq3fc6aO1OdCHOdewiqMtQD6LH39KbeVaeZG01Zb1Dc=;
        b=peGNCDbeyrLddl6nzbYt/k0ZzkeDnvrDqCUs4wglOaSCywB8ZsxntX+inX1KYl0VUu
         nL8SODyPdV3rmxBxQ+4VHS5AIOCCOwg7S3OlneN/j5tKxg9JZTkrkfkitW3owANeGL9q
         U6t+r+IZZlNaIKT/01NR7FNkFKD3lSfugJ3qLCm/i8aNGWA2ivg0zeCU0Fl8iSLOwbzl
         6LT+Tfhc/V+tXXg7YPHHMWvurE0E0e7SAb2bYOLlyQemRgfAiJTYR1GbI+7F/UNo66JA
         08yVzoLh/JgkhhRiCIpwn45f6/dgnLU6oUn4i1lFze9QvXR8Mtj5AMV1QZE3YQzt+b3A
         6Qzg==
X-Forwarded-Encrypted: i=1; AJvYcCUSGign8zY6RGedqm+qJvTARuVFPb9oFPFftpfDe3w97pBO5sop6pTF9e7h5q4S5vqFtcKm@lists.linux.dev
X-Gm-Message-State: AOJu0YxFgocp/R6ngxQPwdMhMLbTGD2mgVylQ4TF3zjLfmOd45QIjo6I
	bx8Ag/0TYKdTF4OfA4+nXzhrbpOUvQwe1jG1oIUkOJNAFoW0drYNFmyO
X-Gm-Gg: ASbGncuc9n40Jzx1ak5RSHn/VuKKrRZ4yzZCRoLFFBLNu20149O4gTgC9ZeOGHv4+fq
	wT2P/wCV0NVDi1bRNHEAoDltT4DILmsXIHggTKOSiNvL9yjvDTQ7stu3WdayZthznUe6yGuoALx
	k0T95rU0OKM70F4ZVkyDdDZjzlz/dAS0qNUztmDiy3Oe1q8jrIC6DkUjdY0JrKnVpELp8NPRxau
	eZPPdjUhUS6rj4iRGuTigiPcV0+dHPdQ11RhriZRPgvg3PkDsm8tA6fVW0jVcsnOUzStI5dPQW6
	2exU1O5re/SOTwfjc1r1EnunsQMoicuPj633AlvDN9MlSQobY+NMWrMKz4eZL+thd6w/+q8fqEn
	iuXfHD8VifzUlR35seQ==
X-Google-Smtp-Source: AGHT+IH3WNUVmPqMTukxtKHvHigKxqb3p981KugKiFvNM38h1dKzUOMN7hkmjUIfx2XFxBTJ/6RQWQ==
X-Received: by 2002:a05:6a00:4095:b0:771:e434:6c80 with SMTP id d2e1a72fcca58-771e43485c6mr10159776b3a.11.1756290118544;
        Wed, 27 Aug 2025 03:21:58 -0700 (PDT)
Received: from [192.168.0.56] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-771fc26aa82sm3865371b3a.104.2025.08.27.03.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 03:21:58 -0700 (PDT)
Message-ID: <79d0e1894ffbfe4945ccf6aff7aa6564334e2600.camel@gmail.com>
Subject: Re: [PATCH bpf-next] selftests/bpf: Fix the invalid operand for
 instruction issue
From: Eduard Zingerman <eddyz87@gmail.com>
To: Feng Yang <yangfeng59949@163.com>
Cc: andrii@kernel.org, ast@kernel.org, bpf@vger.kernel.org,
 daniel@iogearbox.net, 	haoluo@google.com, john.fastabend@gmail.com,
 jolsa@kernel.org, kpsingh@kernel.org, 	linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, 	llvm@lists.linux.dev,
 martin.lau@linux.dev, sdf@fomichev.me, song@kernel.org, 
	yonghong.song@linux.dev
Date: Wed, 27 Aug 2025 03:21:54 -0700
In-Reply-To: <20250827082452.1381181-1-yangfeng59949@163.com>
References: <2e20aea407140c22d12f89cdf07605c31c61d0fa.camel@gmail.com>
	 <20250827082452.1381181-1-yangfeng59949@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2025-08-27 at 16:24 +0800, Feng Yang wrote:

[...]

> I don't know much about assembly language. Could you tell me if the follo=
wing changes are correct?

Looks correct, should be similar to verifier_search_pruning.c:short_loop1()=
.

Unfortunately, I'm afraid that the best source for assembly syntax doc
are llvm backend tests and sources, e.g.:
- https://github.com/llvm/llvm-project/blob/main/llvm/test/CodeGen/BPF/asse=
mbler-disassembler.s
- https://github.com/llvm/llvm-project/blob/main/llvm/test/CodeGen/BPF/asse=
mbler-disassembler-v4.s
- https://github.com/llvm/llvm-project/blob/main/llvm/lib/Target/BPF/BPFIns=
trInfo.td

The directives should gas compatible (subset supported by llvm):
- https://sourceware.org/binutils/docs/as/8byte.html

> diff --git a/tools/testing/selftests/bpf/progs/compute_live_registers.c b=
/tools/testing/selftests/bpf/progs/compute_live_registers.c
> index 6884ab99a421..01d73ad76faf 100644
> --- a/tools/testing/selftests/bpf/progs/compute_live_registers.c
> +++ b/tools/testing/selftests/bpf/progs/compute_live_registers.c
> @@ -249,11 +249,13 @@ __naked void if3_jset_bug(void)
>  	asm volatile (
>  		"r0 =3D 1;"
>  		"r2 =3D 2;"
> -		"if r1 & 0x7 goto +1;"
> +		".8byte %[jset];" /* same as 'if r1 & 0x7 goto +1;' */
>  		"exit;"
>  		"r0 =3D r2;"
>  		"exit;"
> -		::: __clobber_all);
> +		:
> +		: __imm_insn(jset, BPF_JMP_IMM(BPF_JSET, BPF_REG_1, 0x7, 1))
> +		: __clobber_all);
>  }
>=20
