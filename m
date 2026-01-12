Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB72D225788
	for <llvm@lists.linux.dev>; Mon, 12 Jan 2026 14:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768228629; cv=none; b=c31VWQE1lt2knOD9LXjqtN3HWqMpuBkDxpn0KyvLuv30ZEV/+oacmx1b0eMM5YMb3exkj1yk89yxJ3YNqEDu/p1LRJvUVv3HD0ravBp0bpXAjZ+adohNPTJLSVIeK3fWI/20uMUL01MkIHKAtqtscRruA6pHhUDqTWpS8UNlJmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768228629; c=relaxed/simple;
	bh=iyqqznUqDL99OwJCEkrsF2iVykllrm4FsNPCyAuRMwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DF1VDTtqBUN3e70yJBBtPRgiJAHrtOY2IJDqeK7VYpT2d8qQ0MQg2rp2+V35rEFVZqF3RdTnpOaxIVR+sck8k3Q9OqWWRgDAaeYi6a0TnUmhS4s+86XBBZ5SKvh+bnfSWSyi09yIuxLtjqykJDz7oCC4WC3QHZhqeEVKFcBQzPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=L7kfl3LJ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="L7kfl3LJ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso69759395e9.0
        for <llvm@lists.linux.dev>; Mon, 12 Jan 2026 06:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768228626; x=1768833426; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gusj9aT7RaX3C9uGASncaxKiTRdOev9W3ScVaZSC4iY=;
        b=L7kfl3LJ/avuNf6qXDoeG9QUG2oiHZ1Z7g4qLV6eH3qjeRvhMS9saA4ueZ/X6dGjtt
         1zJj2hCWWyMCjLhdzS+3R0u/RpMFEmojXCs6ZVpx7fDZYQBw+q6jfNWu7lA6UOEWGcr0
         zhOSlNFFiFEQ1NAKlufBzu8ogqfwOzn/WnkYPKWhSoTdVEPJn7HAwfArgBELTWPbNRR7
         adQB1/cPtidSCF69j8tn2F7dnO76NnDEst16iBkbrIj8cEG7uIR6kqwdsRl6pogAqt/h
         zQwaO2eozkVF0wyQWNr8O48gR9pWnN8nJEZY7LW77xchUnYiXh65xKyyLKGioOo6aRhE
         2p4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768228626; x=1768833426;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gusj9aT7RaX3C9uGASncaxKiTRdOev9W3ScVaZSC4iY=;
        b=OsDrNCJqvEx9jnBjYCt3xmOqYV655MWT7+K+DBraTKlj/+8xAzw856lSD0DyKr+XRE
         nfwgd57T39d6p2wMHtFy6urrsdQF2Oj165fwhwXX9BYlz1kOQu8g4YejoH/gcJn9F5em
         zW13FzXX2SkbONorwi3H7Qfzmi2jcZW9jYMwvjsYgKB8tuDUvcEINubuJTHaMTE8MpNT
         +vPcdkowNHEJ71k2V3nyteGejN65AY8RLdoN2c3lDcmJh0t4bk6gl1SOuCdE2ErjiVvP
         UC1nDUvSNuiLJOjDTRfthKUnw+7a5877stsyhJGq9WvMAlJrfAK2jLGM3vLccRzMwDY9
         PMqA==
X-Forwarded-Encrypted: i=1; AJvYcCWbXn+ZTod0famREGLwSl9tGNbYFwM1RmxZY+wk79vZJGdCrfmZ8ES6YAX6ZGBOYwX4BNo+@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9YdK8xiAlZQSLBBpJIiAgK3lGWeVsmBeavzxZ2JvprEILKyBj
	2ykv+COUzRCuL3wy6cOzzf4DYo0NgU55aovCh75PhGIvyhF/bEaEqqHp/cAzIN8ehQA=
X-Gm-Gg: AY/fxX55Ig4SmpPH7qXdDJmW3kBx25QVl8rfd4eqAalDOOkWV1TBmDc9pBy9aBb8Y/W
	AJDI5Jld53N/ny+8he4b6qheEmnR1X7p6W2SCHaYbS5XDVvUtgjUvyIf39NWupHZlS9YPGv2gJB
	wUbDVBnOoFb/+UcGOqdjlbETy24Tk6MIlGz7DItLrm8/kYsR39Hl2VjmpPO4AVECYpTF7yejhhC
	xoROQUfNUshoe1jzu2Hj3HwJlnbSCrXCnluV9NLIqwDQIdJorbNUPxvyUgnxHxJM9kqepqKVfHv
	LKDLjxO+w6tqgxeXeuIrhISpddfLISAnNGUSzqFDPHsVPzjGH+tWCdnh9r0IIjnNC+QzhzCM2Oj
	G7x9fNwhZp6gvzs1CddalkkfTSQOqP7KbXGv6F2CHV0wHYvqHl34KJuly/ux1N0GIkGDZvD5rzN
	kviXj/x93fkBY3b5RRpErYvX0zYQijyQ==
X-Google-Smtp-Source: AGHT+IFmm1oEKKdZV8ZlNXFTTJqlKJkxSdN4HcGz/P7O+LQJVZm9Zz54Me3GJnG5+SbV8c+kl57MWg==
X-Received: by 2002:a5d:5f94:0:b0:432:5bac:3915 with SMTP id ffacd0b85a97d-432c37c87e4mr21260896f8f.39.1768228625843;
        Mon, 12 Jan 2026 06:37:05 -0800 (PST)
Received: from [10.0.1.22] (109-81-1-107.rct.o2.cz. [109.81.1.107])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff0b2sm38877725f8f.42.2026.01.12.06.37.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 06:37:05 -0800 (PST)
Message-ID: <d683a5c5-51ad-4b8e-bf8e-6a0526f7c9c1@suse.com>
Date: Mon, 12 Jan 2026 15:37:04 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] module: Fix kernel panic when a symbol st_shndx is out of
 bounds
To: Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, bpf@vger.kernel.org,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
References: <20251230183208.1317279-1-ihor.solodrai@linux.dev>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20251230183208.1317279-1-ihor.solodrai@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/30/25 7:32 PM, Ihor Solodrai wrote:
> The module loader doesn't check for bounds of the ELF section index in
> simplify_symbols():
> 
>        for (i = 1; i < symsec->sh_size / sizeof(Elf_Sym); i++) {
> 		const char *name = info->strtab + sym[i].st_name;
> 
> 		switch (sym[i].st_shndx) {
> 		case SHN_COMMON:
> 
> 		[...]
> 
> 		default:
> 			/* Divert to percpu allocation if a percpu var. */
> 			if (sym[i].st_shndx == info->index.pcpu)
> 				secbase = (unsigned long)mod_percpu(mod);
> 			else
>   /** HERE --> **/		secbase = info->sechdrs[sym[i].st_shndx].sh_addr;
> 			sym[i].st_value += secbase;
> 			break;
> 		}
> 	}
> 
> A symbol with an out-of-bounds st_shndx value, for example 0xffff
> (known as SHN_XINDEX or SHN_HIRESERVE), may cause a kernel panic:
> 
>   BUG: unable to handle page fault for address: ...
>   RIP: 0010:simplify_symbols+0x2b2/0x480
>   ...
>   Kernel panic - not syncing: Fatal exception
> 
> This can happen when module ELF is legitimately using SHN_XINDEX or
> when it is corrupted.
> 
> Add a bounds check in simplify_symbols() to validate that st_shndx is
> within the valid range before using it.
> 
> This issue was discovered due to a bug in llvm-objcopy, see relevant
> discussion for details [1].
> 
> [1] https://lore.kernel.org/linux-modules/20251224005752.201911-1-ihor.solodrai@linux.dev/
> 
> Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr
