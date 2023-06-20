Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE09717FFF
	for <llvm@lists.linux.dev>; Tue, 20 Jun 2023 20:17:27 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-39ea511930eso3358214b6e.1
        for <llvm@lists.linux.dev>; Tue, 20 Jun 2023 13:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687292246; x=1689884246;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j61lPz1ySH8VrcE5kFsDOYTdEi2FoYJLs1a7W9C6KgU=;
        b=GiwlIgQPYygCWhdB2eZ1JY5cMATuumlvdNVT9RL36gMQrzlqUkSxnJwQWw51VyF/uf
         jas2j1KhAiMkCTHiUfurwIbQYqs2vZl+OEKey7XXa05FVh+SOF37ZfiEwzDusksrNPEq
         i5M6zy2rZoNk3PW83CrWH1um1gq7tVlyEC7FL0KGI5IGaHT3Vn9ZKhbh1gq/zK86T+x/
         4XBcbit2aBfoMb60DGRgu0WAZDY8iXzdXFJv1/yZr2FkWvuEY9mbfEkk66KgyMZc/h9N
         SmxzrebYgAgSiY3hY2mm1+PaNZv9qOZJSH58m0+mz/hlbt47qu7LXkuDWqDKzrn7kEXH
         sv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687292246; x=1689884246;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j61lPz1ySH8VrcE5kFsDOYTdEi2FoYJLs1a7W9C6KgU=;
        b=bnilNFM97yBlYMc+NfMPht1yntHpfZScD5mg4CCn/qWQyfE8kMhqUrcsOvQH5fLzRk
         YkkN8SdzBoEWnaMssmXUoL+c/PrAd52Pq79twWfj02FRJM/47ES/vp03MNu6o+SkmSND
         gCOILk0jQ+bYw+NHvA6euIxs/+3/HbuqpCqCkZNqpaO5sMiz1C7oJc9iheEbpBdjwMIR
         CBIfvGkoj7VXuKk2bIrwXtUSq/j5hl97f66+VeUEdZLnHR7k/WDJKi4Yl2Gs7YrDncfg
         N+VYRHKe+2AqBsFs+jpec5FmypvTszX/0yZRkt4GZuahxqcAG90NAENFcG0c/h+rFJrB
         siDQ==
X-Gm-Message-State: AC+VfDwqYhuJurb6oWr7Ui33fmg4yBhaY/EapcPTZBLPiQRB4x2usbFA
	5X95+R8Ml1mDoPD8fYJiez3+UQ==
X-Google-Smtp-Source: ACHHUZ48+YUD2VZh8/4myxORawpTx1nMloZt9tP8SC5pqwZ2kn4iEdNtzxofzmWvJJqDA3VO0aH/UA==
X-Received: by 2002:a05:6808:2393:b0:397:fbe7:a0fb with SMTP id bp19-20020a056808239300b00397fbe7a0fbmr17793969oib.18.1687292246737;
        Tue, 20 Jun 2023 13:17:26 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id o17-20020a634e51000000b0052c3f0ae381sm1771597pgl.78.2023.06.20.13.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 13:17:26 -0700 (PDT)
Date: Tue, 20 Jun 2023 13:17:26 -0700 (PDT)
X-Google-Original-Date: Tue, 20 Jun 2023 13:16:47 PDT (-0700)
Subject:     Re: [PATCH v3] RISC-V: Enable dead code elimination
In-Reply-To: <ZJIIUn8Da15neIwI@google.com>
CC: falcon@tinylab.org, Conor Dooley <conor@kernel.org>, guoren@kernel.org,
  linux-riscv@lists.infradead.org, npiggin@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>,
  paulburton@kernel.org, vincent.chen@sifive.com, tim.bird@sony.com, llvm@lists.linux.dev
From: Palmer Dabbelt <palmer@rivosinc.com>
To: ndesaulniers@google.com
Message-ID: <mhng-ae249af7-37cc-400c-be0d-c1fa6f75c8ef@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Tue, 20 Jun 2023 13:13:06 PDT (-0700), ndesaulniers@google.com wrote:
> On Wed, May 17, 2023 at 04:29:36PM +0800, Zhangjin Wu wrote:
>> Select CONFIG_HAVE_LD_DEAD_CODE_DATA_ELIMINATION for RISC-V, allowing
>> the user to enable dead code elimination. In order for this to work,
>> ensure that we keep the alternative table by annotating them with KEEP.
>>
>
> Just cross referencing the report from Palmer against v2; I see orphan
> section warnings from the linker related to the EFI stub when building
> allmodconfig with this patch applied.
>
> v2: thread for reference.
> https://lore.kernel.org/linux-riscv/CAKwvOdmsgMN5oQpDLh12D0X-CfQDtHC-EtxHcBnADkhnyitMKQ@mail.gmail.com/

Sorry for replying to the v2, I'm marking that as superseeded in 
patchwork.  IIUC it is a real issue on your end too?  I'm also not 100% 
sure about the hang, I just let LLD cook for about 10 minutes before I 
noticed it was still running and posted.
