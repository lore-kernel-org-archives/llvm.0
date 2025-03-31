Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096D721ADA7
	for <llvm@lists.linux.dev>; Mon, 31 Mar 2025 20:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743453709; cv=none; b=Ey6T2W2F78LY7nV0D7zB6ZHvnG9JqZZe8c2agcpyoxIe67fmYSChirq+2wJ3BNdFPk704SPn/Lltm2WiIG3oozxuYDsptHBxwrn5HO2Jh7DmtXhtbCv05Z/5gUhoyG3ZggdMtR2xeqh9g63CguLDngkFJrURHI1mdr8aLYofBW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743453709; c=relaxed/simple;
	bh=281CTHNc0Yoohn4OzLyEWIKCtbnzk6BtpsrO75OnLdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rrHDyquvdX07Q2zrYus/7AqiTcSENUmfCAEAS558HhtYIJPf5/CJ4EaH/opEWDO6vWciQKsoqy9f/JYTcDOM0Rairtwj8vCi4OLt36BadDb6yn6OxhQMDCkoNNUTJo8LlPp0tA6TGLcAgmsy13IQl3n35zJdn1Kszu47MWzM32I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=NDj808lQ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="NDj808lQ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so7265015e9.1
        for <llvm@lists.linux.dev>; Mon, 31 Mar 2025 13:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743453704; x=1744058504; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rGJAe0UQZxK4zMdJovc/1efMoUHDDD05RrKDXkqIC1k=;
        b=NDj808lQczsace3MCh2PPXTbELkMzF5w0EadzrvoJdnmmtEN9uR02wQPsSjaHbcHjk
         fQlo7IOfyj/nYV+OtcILkJSqU6T14/i0RiXYeWqEG8cxi2NL9YJzn31HACx/wqgK/Hy4
         tcIgqA/kk4U7h97lyK1VWLJ1GaPOCPc/5UbF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743453704; x=1744058504;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGJAe0UQZxK4zMdJovc/1efMoUHDDD05RrKDXkqIC1k=;
        b=JqFjh69LdvMWp6I9mQGoHop8QZfP7e/kfO/Zme5AQuOqpar3o+Eo7Q9gwAf0nN3Sbb
         4Ib3MKOQIUIC1wTpH7xotwdPyqYzLDMsYi8b9crdFfU5524vcHt1PHE8ueq5zjNEqPRq
         o9lCPh/Ih/07gjzXEGy3rsOAPrKEha4V9sEG0oUvnsZXHbXUwzYCdU8b+xmzk9hqzeSu
         kV3zMMe9nDvHt2sgbxYHohI2WlG+o1rieGZVi0EWA4CvXUNAS2HTNoIjN8YXplWtVLE2
         ta9u848uONxGVB0hFeKwc1TXED39azw+L5pFstL8sv0IOBdbYW/vb327vSzDlmC6X8j0
         nPFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXISTLnZP4Grb3UkciQ/6bhZkuBT3vffcju21qYQUpfntCPImD7LV8L8PYiwyE7Lil2mb+P@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1HepQiivB7xF6qvkuxX9vUcIZcdUXdta5y0b4CJyvd7+kliMB
	SlCP9JvypJipu65QjSZHssWEDjG9u2PkpL5cMGjHeKmYvs3Z8XpAvDqn5j9cOv4=
X-Gm-Gg: ASbGncv5ha0uL8yrnq7QE3jZ7iIdYDZhCFRfRDATtOuK6Wh4L5t4w7DLsVdfV4kdw+L
	XqTxzyewrK3ndL9ZY8Ddam0SDdUE16s/zKPKfHT8PFYIPzUFR9AW1ywGnNmUOT3Ysx8NIuAEXlo
	zoJK4X3cWkslEVGibPgxzKRIj0tec21PjO+PJIRM3xQCK0dd92WL+BHbwAYT+VnHR4xDX7xZQhI
	JgvpaH/XYyzoSFpruybtOg2cbOQ+NGjALbm9CRH4XxnR60zJzIzcKnHWkZsI3RaxlT2ugjcNo0W
	bEwfI8U4VlcF+ZXUifnnESPg0rTPeFGZTJ2vR6UMYfKdxcMBFEDEoPNY21prTiRL1DQfg7NZv78
	szmlCMP3E9A==
X-Google-Smtp-Source: AGHT+IELgOL2ZFTcYBUrFSIuo2rwMKxJQe2rD/asVJqxQr19K+w0UzLYi4yoZPeCFXyQFMNepUNBpg==
X-Received: by 2002:a05:6000:420a:b0:391:487f:2828 with SMTP id ffacd0b85a97d-39c120cd1d0mr8781705f8f.10.1743453704261;
        Mon, 31 Mar 2025 13:41:44 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e0d1sm12187246f8f.70.2025.03.31.13.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 13:41:43 -0700 (PDT)
Message-ID: <fde11fbb-4b3f-44f1-90cf-6aaefb6bb7c1@citrix.com>
Date: Mon, 31 Mar 2025 21:41:41 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 10/15] KVM: VMX: Use WRMSRNS or its immediate form
 when available
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "Xin Li (Intel)" <xin@zytor.com>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
 linux-edac@vger.kernel.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-ide@vger.kernel.org,
 linux-pm@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, jgross@suse.com,
 peterz@infradead.org, acme@kernel.org, namhyung@kernel.org,
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com,
 wei.liu@kernel.org, ajay.kaher@broadcom.com, alexey.amakhalov@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, tony.luck@intel.com,
 pbonzini@redhat.com, vkuznets@redhat.com, seanjc@google.com,
 luto@kernel.org, boris.ostrovsky@oracle.com, kys@microsoft.com,
 haiyangz@microsoft.com, decui@microsoft.com
References: <20250331082251.3171276-1-xin@zytor.com>
 <20250331082251.3171276-11-xin@zytor.com>
 <Z-r6qxmk7niRssee@char.us.oracle.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Z-r6qxmk7niRssee@char.us.oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/03/2025 9:27 pm, Konrad Rzeszutek Wilk wrote:
> On Mon, Mar 31, 2025 at 01:22:46AM -0700, Xin Li (Intel) wrote:
>> Signed-off-by: Xin Li (Intel) <xin@zytor.com>
>> ---
>>  arch/x86/include/asm/msr-index.h |  6 ++++++
>>  arch/x86/kvm/vmx/vmenter.S       | 28 ++++++++++++++++++++++++----
>>  2 files changed, 30 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
>> index e6134ef2263d..04244c3ba374 100644
>> --- a/arch/x86/include/asm/msr-index.h
>> +++ b/arch/x86/include/asm/msr-index.h
>> @@ -1226,4 +1226,10 @@
>>  						* a #GP
>>  						*/
>>  
>> +/* Instruction opcode for WRMSRNS supported in binutils >= 2.40 */
>> +#define ASM_WRMSRNS		_ASM_BYTES(0x0f,0x01,0xc6)
>> +
>> +/* Instruction opcode for the immediate form RDMSR/WRMSRNS */
>> +#define ASM_WRMSRNS_RAX		_ASM_BYTES(0xc4,0xe7,0x7a,0xf6,0xc0)
>> +
>>  #endif /* _ASM_X86_MSR_INDEX_H */
>> diff --git a/arch/x86/kvm/vmx/vmenter.S b/arch/x86/kvm/vmx/vmenter.S
>> index f6986dee6f8c..9fae43723c44 100644
>> --- a/arch/x86/kvm/vmx/vmenter.S
>> +++ b/arch/x86/kvm/vmx/vmenter.S
>> @@ -64,6 +64,29 @@
>>  	RET
>>  .endm
>>  
>> +/*
>> + * Write EAX to MSR_IA32_SPEC_CTRL.
>> + *
>> + * Choose the best WRMSR instruction based on availability.
>> + *
>> + * Replace with 'wrmsrns' and 'wrmsrns %rax, $MSR_IA32_SPEC_CTRL' once binutils support them.
>> + */
>> +.macro WRITE_EAX_TO_MSR_IA32_SPEC_CTRL
>> +	ALTERNATIVE_2 __stringify(mov $MSR_IA32_SPEC_CTRL, %ecx;		\
>> +				  xor %edx, %edx;				\
>> +				  mov %edi, %eax;				\
>> +				  ds wrmsr),					\
>> +		      __stringify(mov $MSR_IA32_SPEC_CTRL, %ecx;		\
>> +				  xor %edx, %edx;				\
>> +				  mov %edi, %eax;				\
>> +				  ASM_WRMSRNS),					\
>> +		      X86_FEATURE_WRMSRNS,					\
>> +		      __stringify(xor %_ASM_AX, %_ASM_AX;			\
>> +				  mov %edi, %eax;				\
>> +				  ASM_WRMSRNS_RAX; .long MSR_IA32_SPEC_CTRL),	\
>> +		      X86_FEATURE_MSR_IMM
>> +.endm
>> +
>>  .section .noinstr.text, "ax"
>>  
>>  /**
>> @@ -123,10 +146,7 @@ SYM_FUNC_START(__vmx_vcpu_run)
>>  	movl PER_CPU_VAR(x86_spec_ctrl_current), %esi
>>  	cmp %edi, %esi
>>  	je .Lspec_ctrl_done
>> -	mov $MSR_IA32_SPEC_CTRL, %ecx
>> -	xor %edx, %edx
>> -	mov %edi, %eax
>> -	wrmsr
> Is that the right path forward?
>
> That is replace the MSR write to disable speculative execution with a
> non-serialized WRMSR? Doesn't that mean the WRMSRNS is speculative?

MSR_SPEC_CTRL is explicitly non-serialising, even with a plain WRMSR.

non-serialising != non-speculative.

Although WRMSRNS's precise statement on the matter of
non-speculativeness is woolly, given an intent to optimise it some more
in the future.

~Andrew
