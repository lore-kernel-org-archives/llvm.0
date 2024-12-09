Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3ED81552EE
	for <llvm@lists.linux.dev>; Mon,  9 Dec 2024 17:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733763709; cv=none; b=qQ55PdHxpxg5B9wAsojLxS8IOJK7Ch+bio0V6khEXnoOrdE7ngzldD/f+rGKcpfCrYn7nzkxh40y3cpl4l+eEkcxUms6jJIpcmMx0bRle2VfnBXGaYkO0Gj6Vh9gjALo4jUEFoy8+k0db+MXGxo4WZhu/b3HSeX9rzqMbJFybYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733763709; c=relaxed/simple;
	bh=i928oX/mpne3k+HYSwPwJdb5jtaB69wVPcl0yRy8D+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K2vFEj3eW2H+8SPX5c0KeIGZY4ccyXgiwFJR17f/pnm/+vt9hqTXNK5dSmSj1l1/l7JhbDwknK+nzdXP8futsHM3raaRxq5aTQpjz1LtGn6ibD9K8fijiCrj1w7egNBfLjnF9a0rVzB00BHi2GGZyns7TERIuNs6TJRSruhh2uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=isovalent.com; spf=pass smtp.mailfrom=isovalent.com; dkim=pass (2048-bit key) header.d=isovalent.com header.i=@isovalent.com header.b=GjLmzQgP; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=isovalent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isovalent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isovalent.com header.i=@isovalent.com header.b="GjLmzQgP"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aa543c4db92so81138066b.0
        for <llvm@lists.linux.dev>; Mon, 09 Dec 2024 09:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent.com; s=google; t=1733763706; x=1734368506; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PWY3t5+dr0QM3b3J+VJ0zV+Hq69sDwu812ujN+kk1Ho=;
        b=GjLmzQgPgukugguM15sTFEs3ciqEdoagFY9UNUd5CJ7QFN0zMhnHNglI/8Jik0ED7A
         VGvbrgDvYNr66HKxJwhodFnVFPcdCqFXOitjERyNKdT05Sp8YB21vS5eFAKGqZtnxA+i
         A5R+Q/yvpG8aIKHZGAVhgvkto15b158CVW1tpD1atRIGS0JhepBzKVX37RqObaTQdnDp
         M63+uwUDFDGbbvO4e4xsx4hq6ijorgwK+QaDYwfp5FKo3IjiGKbw8yqBIm69cyZrxWJU
         WFqKkNBAzcPi4qlpCzAZNxocOpQTcFnEdrj2/qSxyi4uX3dd4irJ3RWx3qH9etT4+A4R
         HmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733763706; x=1734368506;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PWY3t5+dr0QM3b3J+VJ0zV+Hq69sDwu812ujN+kk1Ho=;
        b=DA54mQ/1kNn6ROc5zv36q+qrMUAIrPuxiwroZ/v6VS6wfnVF0SrAJgcyPnDm0i9BAh
         K8unXXlC9iW3bBz1Va34g0EdqjfxGjWEYvW2Ievm53YsWTfTsRK94W6DTJVJ7WjlP3sP
         CtUAS/fy5nNBMdASUb1nQh1gblJ4j5up3COarha3LZfoeFXRGwg75TF2+1KYWUeC1N1b
         dmI6s8rg7ruq+qoDGNm4tYk4cjXKS26jn9ZqcnaBlrL1yx5NgbO6TmSJL9LWnt8Pmt1k
         osYSEXVBmq9cx0eEO+ajmH6+2/Jwsn6o7SVJHf1BRRsqBCTqH1tr2z1//1nII989WUrX
         /VYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgzaI3r1UvHibcEPBJirzKf8K8Zj55yq1qWaP+pED7xj1m/KAg2pLdsbAEvZPpYiuVfo3S@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1ywvqo6cnUzCi4/4b6fCZ/NRjk2wTS5BbSpY7rdedL1DjAu8s
	CWjAl9n+HFLsNDc+/QNY/MknY7Oa8DTZoEcg1tNE8FfNzDfpFzgP1ZSsVI33tJ8=
X-Gm-Gg: ASbGncsMB9ZIS6FxzAh2L8l6ZoPs/Ew6K4hkaD18UUnZnjBMKcA8s2FVnuSYWV0zGPh
	eZ/mzVWBzj3uf/ry92YnsozXJlVqBfpKbFCoLcWjMP6HX4UilCXPRIGGekVm8vzmct5R5CoCJH7
	jZWrJoo3LsJt0u9xdkDU8alFq3sxoGqgpU1w7jPTfiXxyUN/avoIcsbXJ6FnURE0w0pDi3FoUzp
	DUV5ylBAGPblcvmAg3PHAc/mKux/3QP3N3Y3dGZlMDv4rQvDAq/Yv6vXhyeUNK+
X-Google-Smtp-Source: AGHT+IFgCY0LV0E2i86E6uIyabSZKNK/6D6PE02hwvn//+8qGUtJWg0NJ0RhDHb5UusO5237JV3OiA==
X-Received: by 2002:a17:907:9557:b0:aa6:34b0:5c73 with SMTP id a640c23a62f3a-aa69cd53746mr135583666b.30.1733763706154;
        Mon, 09 Dec 2024 09:01:46 -0800 (PST)
Received: from [192.168.1.12] ([87.13.127.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa683de38fesm209821366b.108.2024.12.09.09.01.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 09:01:45 -0800 (PST)
Message-ID: <ca871055-0b4c-4380-8f32-a4a7152345c6@isovalent.com>
Date: Mon, 9 Dec 2024 18:01:44 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v2] bpftool: Probe for ISA v4 instruction set
 extension
To: Quentin Monnet <qmo@kernel.org>, bpf@vger.kernel.org
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, nathan@kernel.org,
 ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20241209102644.29880-1-simone.magnani@isovalent.com>
 <20241209145439.336362-1-simone.magnani@isovalent.com>
 <11d588c2-febe-46c4-ab49-8fb0ed80faac@kernel.org>
Content-Language: en-US
From: Simone Magnani <simone.magnani@isovalent.com>
In-Reply-To: <11d588c2-febe-46c4-ab49-8fb0ed80faac@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/12/24 16:20, Quentin Monnet wrote:
> Looking again at the probe itself, does the second instruction serve any
> practical purpose here? Don't you just need to test the BPF_JMP32_A?
> 
> Looks good otherwise, thank you!
> 
> Reviewed-by: Quentin Monnet <qmo@kernel.org>

I wanted to keep probes similar to the previous ones (especially v3
and v2), despite we never check their return codes. This means
having as 4th instruction `BPF_MOV64_IMM(BPF_REG_0, 1)`. However,
to do so, I also need the 2nd instruction, otherwise I'd hit an
`Invalid Argument` error while calling `bpf_prog_load()`: I think
that would be due to the fact that no execution paths would
execute that instruction otherwise.

An alternative approach less consistent with the others would be:

struct bpf_insn insns[3] = {
		BPF_MOV64_IMM(BPF_REG_0, 0),
		BPF_JMP32_A(0),
		BPF_EXIT_INSN()
	};

Please let me know if you have any further questions, need
additional information, or if I could improve the patch.
