Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F6A26462E
	for <llvm@lists.linux.dev>; Tue, 10 Jun 2025 20:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749586046; cv=none; b=qaImT7HFu7DiAedQEJ+irCNZ9V7BzkQDdgnXguFQ4zmc+Ugjut+xpCru3n2R9XWZ2/y9w0udwmqAYq5xBk2tkwuLEGnfPDCrTcYXzX01ap5XsJqBJLnA8Ufldhz/FIsE6Vwu8Q9HFrOFSouFkq23L5xfNSuZfCCxEg6kp4WPoNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749586046; c=relaxed/simple;
	bh=cyniiTjRd17/axtqY1LXsVxllwk2gLonVeQz+TEtSOI=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=ZNxlN3w+roY3YNEEJ93DAgV6DwuoHYQ7FRwaLSD/7bczC0Ndf80sh1mm39qQ9JhEHt+EmzJTIku9VtY5n7NbqPiHS4Xz1RNGJLJ0Bpco1NZ4pJGeSwixnIx1nWtV2YQoCG0O55EC2/uNwkoewEKIaqqBHU7ix5Mj4AwY2A8Um5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=yWlbinlc; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="yWlbinlc"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-23636167afeso15157895ad.3
        for <llvm@lists.linux.dev>; Tue, 10 Jun 2025 13:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1749586044; x=1750190844; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d9ivsrx9S86u8HBiaynDXVu9vEEgacXBDB8VknWbxl8=;
        b=yWlbinlcAROgMrZQb0ImngijD7jI8xJW3xnIRtXFu0jnHhT6akHuDOK3PosKlfLbSt
         X0vAZ/kz8M8SsGKwcVLImwVZZPXVoBrbaNH05m6xRhOorVnhkwim4goYvA7WePHFgl6R
         PSvxqFZMQtRNUsFPcfEhyY2JPuqLM4kpnqs81QvGIkhzQXNxwh706WBjHB9dD37rhuya
         SaZi4IHJC7eeeZSrH6/jZGatJAsAUsUu7vgI/HLBausblmpGQiufNMi0qCbw0AQKACcA
         5TuqAsKGTZ0sfCLoD6wKO2tbuCZ7bODUNSSeIxFQ3IsYhHFpWMWggKhy0O1ilfkD4xZj
         zziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749586044; x=1750190844;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9ivsrx9S86u8HBiaynDXVu9vEEgacXBDB8VknWbxl8=;
        b=fVve2vjbKOhPdiXbLY5Iw6hbW7x78VsG9GqG6TjQ8uYMdT7mRL9YlyoEVFcAMo6jHh
         k1iCBfCIo6CYx3x199W/spCpL4dIIbIGIioIFKvOF9w5BjJbYInbpzi7IGsICmtJ1Ega
         l7BZlM1NlzG2PevYAdqmG3B/3FSHdnxEQXdMmVeA6egIy1zivVBQJXz7X/GPYpepeBHZ
         u4CFxJOK1uHibrtt0kxX6ACNmSM/3GknGUHowqs6X4JLgoE5YRVTDm07lKt7aRnRFYTi
         Nc8NkiYMi5non3L/iKOjDEUIv3M0Qb74rhE3kCQcq/JTRUmSx9/brXNziLom1eOhdaRY
         4ePg==
X-Forwarded-Encrypted: i=1; AJvYcCXSuKGmTI96pCPz35Xn/85mo+w/6xQHte+LcjNmyMBROkKOc8eanY92k5oFHtreGvJxT+67@lists.linux.dev
X-Gm-Message-State: AOJu0YwE5RHVboqWNEcZlC6SgQL/H8lN5MuSj3S840krs/yoh5J8/8dp
	AworGFPpXmfZAH18ho99RQUVIVXK5ve4loG5PSJZLrm3T9N8gZ4/JVJWiBesQ6VZ/gw=
X-Gm-Gg: ASbGncuEynakZKvpIxmVoSm/HC8H/MxmLF2hQTQdSc4avJjUxejoqa9g+bpLXcVkTvQ
	PJ41SAr8aIooxhuTiQkQvH1RH56eF8shEoQIgp3V3o9oBMlN+BRxn7fiNv4iYNUsZPIMz9lHRi9
	GXBTjhBEtLUeCJWcjM4ZOLZiJh/EnUsKvLxBo12gfWPArzG1yIkLUBdO/Jq12t/pwa/XI/SXbgz
	ag3Z9ZI7TKenO0gTEgSjATag0Apjr4bM4VONNPXVH9EsVLqTVrNGCjpKRsUEChN34Wfx3DoN2/Q
	Ne2rnjOLhnbH/Fey94JeYR+GQsKQ3ZVwdtF0okDUBcCpnTtPKarubmgbKZiU
X-Google-Smtp-Source: AGHT+IHEbTLkjhkPgVR7LBY0WE0PQew4VX94TRVLTFzVkKHWIErfOlXv0qU9OV/7D6BdyLmWtWCVwA==
X-Received: by 2002:a17:902:cf11:b0:234:8a4a:adac with SMTP id d9443c01a7336-23641a99f5fmr7343495ad.20.1749586043748;
        Tue, 10 Jun 2025 13:07:23 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::7:116a])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23603078121sm75380565ad.27.2025.06.10.13.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 13:07:23 -0700 (PDT)
Date: Tue, 10 Jun 2025 13:07:23 -0700 (PDT)
X-Google-Original-Date: Tue, 10 Jun 2025 13:07:21 PDT (-0700)
Subject:     Re: [PATCH] riscv: vdso: Exclude .rodata from the PT_DYNAMIC segment
In-Reply-To: <20250603215218.GA3631276@ax162>
CC: i@maskray.me, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Alexandre Ghiti <alex@ghiti.fr>, nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
From: Palmer Dabbelt <palmer@dabbelt.com>
To: nathan@kernel.org
Message-ID: <mhng-417C3662-1666-4A7D-9800-0F68016C1D9C@palmerdabbelt-mac>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Tue, 03 Jun 2025 14:52:18 PDT (-0700), nathan@kernel.org wrote:
> On Mon, Jun 02, 2025 at 08:48:44PM -0700, Fangrui Song wrote:
>> .rodata is implicitly included in the PT_DYNAMIC segment due to
>> inheriting the segment of the preceding .dynamic section (in both GNU ld
>> and LLD).  When the .rodata section's size is not a multiple of 16
>> bytes on riscv64, llvm-readelf will report a "PT_DYNAMIC dynamic table
>> is invalid" warning.  Note: in the presence of the .dynamic section, GNU
>> readelf and llvm-readelf's -d option decodes the dynamic section using
>> the section.
>>
>> This issue arose after commit 8f8c1ff879fab60f80f3a7aec3000f47e5b03ba9
>> ("riscv: vdso.lds.S: remove hardcoded 0x800 .text start addr"), which
>> placed .rodata directly after .dynamic by removing .eh_frame.
>>
>> This patch resolves the implicit inclusion into PT_DYNAMIC by explicitly
>> specifying the :text output section phdr.
>>
>> Reported-by: Nathan Chancellor <nathan@kernel.org>
>> Closes: https://github.com/ClangBuiltLinux/linux/issues/2093
>> Signed-off-by: Fangrui Song <i@maskray.me>
>
> Tested-by: Nathan Chancellor <nathan@kernel.org>

Thanks, I'll pick it up (might take a bit to show up on fixes, I'm 
trying to sort out another amdgpu stack warning...)

>
>> ---
>>  arch/riscv/kernel/vdso/vdso.lds.S | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
>> index abc69cda0445b1f500a89b47deefa31349103f08..62e0410f69f09e2bbf27101c000d604193f525cb 100644
>> --- a/arch/riscv/kernel/vdso/vdso.lds.S
>> +++ b/arch/riscv/kernel/vdso/vdso.lds.S
>> @@ -30,7 +30,7 @@ SECTIONS
>>  		*(.data .data.* .gnu.linkonce.d.*)
>>  		*(.dynbss)
>>  		*(.bss .bss.* .gnu.linkonce.b.*)
>> -	}
>> +	}						:text
>>
>>  	.note		: { *(.note.*) }		:text	:note
>>
>>
>> ---
>> base-commit: 1a3f6980889df3fc90ad3e4a525061d2c138adba
>> change-id: 20250602-riscv-vdso-13efdee34a24
>>
>> Best regards,
>> --
>> Fangrui Song <i@maskray.me>
>>
