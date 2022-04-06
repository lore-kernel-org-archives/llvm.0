Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC9317EC
	for <llvm@lists.linux.dev>; Wed,  6 Apr 2022 06:56:00 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id z16so1665414pfh.3
        for <llvm@lists.linux.dev>; Tue, 05 Apr 2022 23:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=9Z4BOcghgYJt/UcEuNrRXOBiUSkPtt2CnMnyjNQSLrE=;
        b=zOCRT07xlrrviKVnyXuyw3rZsoEvMLiC1Kv0/g91aZjFRKaa2m4o39mcjkonEii6H3
         uf3bfBja/Vk5R+mogEqHihktLaqGlzTrc0fuQpyH72UcZzRi+52Ewd7k2us34yD8I1YE
         cFmZa50SvsyERr3Yo3TuQvF13i8W8iCnmd7YuJBiIQ1OIOKoZruasXoSiYGkHax26l6e
         IyEE3Z9cfl+lxn8TT5v8faJEGi0IDn+qgxpiLwnSfvcKwh0uyHnQZZ6OBMO1l/gS+NCY
         B8PNHXsnoKZVkwXF2SW8LRTX0uTEQ4DJlEJ7lE7jENzEcIsVoPySQSuytvVQ+3+VQQMO
         NZrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9Z4BOcghgYJt/UcEuNrRXOBiUSkPtt2CnMnyjNQSLrE=;
        b=yb631/XkwqZAWKqbdPbcisT6JSZnDJ794mkOCeQGCHmrsPORsRU+5mPlNZVSZv47X6
         r/AtcN1sjreJYeahuDbXNSQIf2HkzHgBItpl2VfZqdq2p8/As1hEu4DsPAPtOw1n2cY/
         cjRaJ+u3SGtjYi+EOfbt6o6XU71t2KjLI9Z9zkjB0IE3qQa2dO9RgNUMZFbgIBe5bfbY
         zYzuzk8WvwAInnkg328EcW9wYgajgdfmoTrg0bbapZG1eliCJ5bLuwZ6HzDfRwyziSxC
         /CeYlTBa+k3KIoCgKbIzGKitSZFLglJX//Lu5VEB2ibWzPV6LoGFFNrPmsEQKtseuaxL
         BdrQ==
X-Gm-Message-State: AOAM5330CLdNu/fg56y0ftk79by4OTPRpH8hSR61HGpTW7bHKwX+9Xfk
	I/2zw0gDUYVIB9fHUK1SEOz98w==
X-Google-Smtp-Source: ABdhPJz0OLlEZo6i2QxGNWJR3z1nmt+BSkMIjVHZuNt+VSqLTtPHyqR0FxDE80kv1Ii4XoL83M/Kxg==
X-Received: by 2002:a63:6204:0:b0:399:dea:3d20 with SMTP id w4-20020a636204000000b003990dea3d20mr6084066pgb.152.1649228159904;
        Tue, 05 Apr 2022 23:55:59 -0700 (PDT)
Received: from [10.61.2.177] (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.gmail.com with ESMTPSA id f15-20020a056a0022cf00b004fb32b9e000sm18308157pfj.1.2022.04.05.23.55.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Apr 2022 23:55:59 -0700 (PDT)
Message-ID: <2255e430-94dc-84b2-626d-c4a488ad9728@ozlabs.ru>
Date: Wed, 6 Apr 2022 16:55:54 +1000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:99.0) Gecko/20100101
 Thunderbird/99.0
Subject: Re: [PATCH kernel v2] powerpc/boot: Stop using RELACOUNT
Content-Language: en-US
To: Gabriel Paubert <paubert@iram.es>
Cc: linuxppc-dev@lists.ozlabs.org, Nick Desaulniers
 <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, llvm@lists.linux.dev
References: <20220406040148.3608400-1-aik@ozlabs.ru>
 <Yk0d54t8MPn3ocrO@lt-gp.iram.es>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <Yk0d54t8MPn3ocrO@lt-gp.iram.es>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/6/22 14:58, Gabriel Paubert wrote:
> On Wed, Apr 06, 2022 at 02:01:48PM +1000, Alexey Kardashevskiy wrote:
>> So far the RELACOUNT tag from the ELF header was containing the exact
>> number of R_PPC_RELATIVE/R_PPC64_RELATIVE relocations. However the LLVM's
>> recent change [1] make it equal-or-less than the actual number which
>> makes it useless.
>>
>> This replaces RELACOUNT in zImage loader with a pair of RELASZ and RELAENT.
>> The vmlinux relocation code is fixed in commit d79976918852
>> ("powerpc/64: Add UADDR64 relocation support").
>>
>> To make it more future proof, this walks through the entire .rela.dyn
>> section instead of assuming that the section is sorter by a relocation
>> type. Unlike d79976918852, this does not add unaligned UADDR/UADDR64
>> relocations as we are likely not to see those in practice - the zImage
>> is small and very arch specific so there is a smaller chance that some
>> generic feature (such as PRINK_INDEX) triggers unaligned relocations.
>>
>> [1] https://github.com/llvm/llvm-project/commit/da0e5b885b25cf4
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>> ---
>> Changes:
>> v2:
>> * s/divd/divwu/ for ppc32
>> * updated the commit log
>> * named all new labels instead of numbering them
>> (s/101f/.Lcheck_for_relaent/ and so on)
>> ---
>>   arch/powerpc/boot/crt0.S | 45 ++++++++++++++++++++++++++--------------
>>   1 file changed, 29 insertions(+), 16 deletions(-)
>>
>> diff --git a/arch/powerpc/boot/crt0.S b/arch/powerpc/boot/crt0.S
>> index feadee18e271..e9306d862f8d 100644
>> --- a/arch/powerpc/boot/crt0.S
>> +++ b/arch/powerpc/boot/crt0.S
>> @@ -8,7 +8,8 @@
>>   #include "ppc_asm.h"
>>   
>>   RELA = 7
>> -RELACOUNT = 0x6ffffff9
>> +RELASZ = 8
>> +RELAENT = 9
>>   
>>   	.data
>>   	/* A procedure descriptor used when booting this as a COFF file.
>> @@ -75,34 +76,39 @@ p_base:	mflr	r10		/* r10 now points to runtime addr of p_base */
>>   	bne	11f
>>   	lwz	r9,4(r12)	/* get RELA pointer in r9 */
>>   	b	12f
>> -11:	addis	r8,r8,(-RELACOUNT)@ha
>> -	cmpwi	r8,RELACOUNT@l
>> +11:	cmpwi	r8,RELASZ
>> +	bne	.Lcheck_for_relaent
>> +	lwz	r0,4(r12)       /* get RELASZ value in r0 */
>> +	b	12f
>> +.Lcheck_for_relaent:
>> +	cmpwi	r8,RELAENT
>>   	bne	12f
>> -	lwz	r0,4(r12)	/* get RELACOUNT value in r0 */
>> +	lwz     r14,4(r12)      /* get RELAENT value in r14 */
>>   12:	addi	r12,r12,8
>>   	b	9b
>>   
>>   	/* The relocation section contains a list of relocations.
>>   	 * We now do the R_PPC_RELATIVE ones, which point to words
>> -	 * which need to be initialized with addend + offset.
>> -	 * The R_PPC_RELATIVE ones come first and there are RELACOUNT
>> -	 * of them. */
>> +	 * which need to be initialized with addend + offset */
>>   10:	/* skip relocation if we don't have both */
>>   	cmpwi	r0,0
>>   	beq	3f
>>   	cmpwi	r9,0
>>   	beq	3f
>> +	cmpwi	r14,0
>> +	beq	3f
>>   
>>   	add	r9,r9,r11	/* Relocate RELA pointer */
>> +	divwu   r0,r0,r14       /* RELASZ / RELAENT */
>>   	mtctr	r0
>>   2:	lbz	r0,4+3(r9)	/* ELF32_R_INFO(reloc->r_info) */
>>   	cmpwi	r0,22		/* R_PPC_RELATIVE */
>> -	bne	3f
>> +	bne	.Lnext
>>   	lwz	r12,0(r9)	/* reloc->r_offset */
>>   	lwz	r0,8(r9)	/* reloc->r_addend */
>>   	add	r0,r0,r11
>>   	stwx	r0,r11,r12
>> -	addi	r9,r9,12
>> +.Lnext:	add	r9,r9,r14
>>   	bdnz	2b
>>   
>>   	/* Do a cache flush for our text, in case the loader didn't */
>> @@ -160,32 +166,39 @@ p_base:	mflr	r10		/* r10 now points to runtime addr of p_base */
>>   	bne	10f
>>   	ld	r13,8(r11)       /* get RELA pointer in r13 */
>>   	b	11f
>> -10:	addis	r12,r12,(-RELACOUNT)@ha
>> -	cmpdi	r12,RELACOUNT@l
>> -	bne	11f
>> -	ld	r8,8(r11)       /* get RELACOUNT value in r8 */
>> +10:	cmpwi   r12,RELASZ
>> +	bne	.Lcheck_for_relaent
>> +	lwz	r8,8(r11)	/* get RELASZ pointer in r8 */
>> +	b	11f
>> +.Lcheck_for_relaent:
>> +	cmpwi	r12,RELAENT
>> +	bne     11f
>> +	lwz     r14,8(r11)      /* get RELAENT pointer in r14 */
>>   11:	addi	r11,r11,16
>>   	b	9b
>>   12:
>> -	cmpdi	r13,0            /* check we have both RELA and RELACOUNT */
>> +	cmpdi	r13,0            /* check we have both RELA, RELASZ, RELAENT*/
>>   	cmpdi	cr1,r8,0
>>   	beq	3f
>>   	beq	cr1,3f
>> +	cmpdi	r14,0
>> +	beq	3f
>>   
>>   	/* Calcuate the runtime offset. */
>>   	subf	r13,r13,r9
>>   
>>   	/* Run through the list of relocations and process the
>>   	 * R_PPC64_RELATIVE ones. */
>> +	divd    r8,r8,r14       /* RELASZ / RELAENT */
> 
> While you are at it, this one should also be divdu.
> 
> I really wished IBM had used explicit signed/unsigned indication in the
> mnemonics (divds, divdu, divws, divwu) instead. Fortunately very little
> assemby code uses these instructions nowadays.


Fair enough, v3 is coming. Thanks,

> 
> 
>>   	mtctr	r8
>>   13:	ld	r0,8(r9)        /* ELF64_R_TYPE(reloc->r_info) */
>>   	cmpdi	r0,22           /* R_PPC64_RELATIVE */
>> -	bne	3f
>> +	bne	.Lnext
>>   	ld	r12,0(r9)        /* reloc->r_offset */
>>   	ld	r0,16(r9)       /* reloc->r_addend */
>>   	add	r0,r0,r13
>>   	stdx	r0,r13,r12
>> -	addi	r9,r9,24
>> +.Lnext:	add	r9,r9,r14
>>   	bdnz	13b
>>   
>>   	/* Do a cache flush for our text, in case the loader didn't */
>> -- 
>> 2.30.2
> 
> 	Cheers,
> 	Gabriel
>   
> 
