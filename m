Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121006444
	for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 23:18:15 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id n15so8274481plh.2
        for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 16:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=IVcHCcBYklMVp4ZyFJpnqeq2akbdktOMbyQu0M7lWkM=;
        b=i6IuYY1bVJG39GO25gWKj5fXg0j0g3I1ecz1VrdlDqj3a1wuctE1U+LTJku3FqmExS
         hYoE0JspcExfIyvNBOQqVMKx/OJZAk+UrfOqDU34OjVg4ar9ahcpI90IRKK9TTATJyKo
         sYFPP+CrvR84SvMKeF17KtvCFS41Z8E1by0bBhZbwRaY2S4OzULATWkDBmzy+zm7+C6h
         4CbQMWoZGcn0rcnx+n8PiNK5h2UUO8Vpa8QvtHafxxmqGIiMNfDrAS6V6raO6EFhgIkX
         RmTzJ8+dtkMGdIQYTzz3OWpTXOd92HJS0/XWxD/chrQaICXkM0ThqSqoPBvCB2X9pDGS
         0wBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=IVcHCcBYklMVp4ZyFJpnqeq2akbdktOMbyQu0M7lWkM=;
        b=xotLQ4WkWbCu+ujQ+cA8obpewN04M6VyP66cLvnPJdHFvBOKnJagpkZkGihRWDl57C
         XeuVcq0CNqJE01/FnNfiq8UWtTVA1C2vyBf0TmY88zT/KAGQH2yltAHd73DwbS/waSOv
         BGrkFvZuTYo2qBGgTfZuetKFL+pPvePP8DxV194osur8bESORYaLDXrR3iXrvIk19nu/
         YvWPwCP4YjZlLkEuQts5K5f7C8N8hRUTYK/flZLjfzwWKqGPF7//KRDDmtOtwytg3YoM
         G5SbvN7vUWYWpnZ09mJ4sc+PHjayNN4TPBIHCR5Je8niqBdkATtfSep10hXn6VZYP/mu
         4nPA==
X-Gm-Message-State: AOAM5332XoolE9wLJnuzUUCxa0BPVoQNaddtY8ZR7rXGjwlcoYoQ1PpV
	JL2mzgXTj1a1GjPm9yS9O5ckEQ==
X-Google-Smtp-Source: ABdhPJxvNF2QqGdofMuiYHtC41lDTJzN93eVTLBVb+qhspMXCxsDm0j7jVlkPmTFfrsk+BhsNod8bA==
X-Received: by 2002:a17:90a:4a06:b0:1c6:d786:10a8 with SMTP id e6-20020a17090a4a0600b001c6d78610a8mr14591pjh.207.1647645495306;
        Fri, 18 Mar 2022 16:18:15 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id cd20-20020a056a00421400b004fa7d1b35b6sm562516pfb.80.2022.03.18.16.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Mar 2022 16:18:14 -0700 (PDT)
Date: Fri, 18 Mar 2022 16:18:14 -0700 (PDT)
X-Google-Original-Date: Fri, 18 Mar 2022 16:18:09 PDT (-0700)
Subject:     Re: [PATCH] riscv module: remove (NOLOAD)
In-Reply-To: <YhEelqnPDr1u4uTD@dev-arch.archlinux-ax161>
CC: Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, llvm@lists.linux.dev
From: Palmer Dabbelt <palmer@dabbelt.com>
To: maskray@google.com, nathan@kernel.org
Message-ID: <mhng-7fe2c5d9-a8e6-4123-ac5c-0c9190792520@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Sat, 19 Feb 2022 08:45:10 PST (-0800), nathan@kernel.org wrote:
> On Fri, Feb 18, 2022 at 12:26:11AM -0800, Fangrui Song wrote:
>> On ELF, (NOLOAD) sets the section type to SHT_NOBITS[1]. It is conceptually
>> inappropriate for .plt, .got, and .got.plt sections which are always
>> SHT_PROGBITS.
>>
>> In GNU ld, if PLT entries are needed, .plt will be SHT_PROGBITS anyway
>> and (NOLOAD) will be essentially ignored. In ld.lld, since
>> https://reviews.llvm.org/D118840 ("[ELF] Support (TYPE=<value>) to
>> customize the output section type"), ld.lld will report a `section type
>> mismatch` error. Just remove (NOLOAD) to fix the error.
>>
>> [1] https://lld.llvm.org/ELF/linker_script.html As of today, "The
>> section should be marked as not loadable" on
>> https://sourceware.org/binutils/docs/ld/Output-Section-Type.html is
>> outdated for ELF.
>
> Thank you for the patch! As mentioned on the arm64 patch, this needs
> your Signed-off-by tag. With that provided:
>
> Cc: stable@vger.kernel.org
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Tested-by: Nathan Chancellor <nathan@kernel.org>
>
> This needs to go to stable so that older trees with a newer toolchain do
> not warn.

Yep, just checking on that SOB line.  A 

Fixes: 596b0474d3d9 ("kbuild: preprocess module linker script")

seems appropriate as well.

Thanks!

>
>> ---
>>  arch/riscv/include/asm/module.lds.h | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/riscv/include/asm/module.lds.h b/arch/riscv/include/asm/module.lds.h
>> index 4254ff2ff049..1075beae1ac6 100644
>> --- a/arch/riscv/include/asm/module.lds.h
>> +++ b/arch/riscv/include/asm/module.lds.h
>> @@ -2,8 +2,8 @@
>>  /* Copyright (C) 2017 Andes Technology Corporation */
>>  #ifdef CONFIG_MODULE_SECTIONS
>>  SECTIONS {
>> -	.plt (NOLOAD) : { BYTE(0) }
>> -	.got (NOLOAD) : { BYTE(0) }
>> -	.got.plt (NOLOAD) : { BYTE(0) }
>> +	.plt : { BYTE(0) }
>> +	.got : { BYTE(0) }
>> +	.got.plt : { BYTE(0) }
>>  }
>>  #endif
>> --
>> 2.35.1.265.g69c8d7142f-goog
>>
>>
