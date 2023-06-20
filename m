Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2C52AB42
	for <llvm@lists.linux.dev>; Tue, 20 Jun 2023 20:41:27 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6687466137bso1664704b3a.0
        for <llvm@lists.linux.dev>; Tue, 20 Jun 2023 13:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687293687; x=1689885687;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EF5pfw7nSexoxaL00DnHZHZZwsqD5TiJVywKTlCaMwA=;
        b=hWeNrmljP93jSxzhei/v39dLMKKk8J0YPTwSLxt5ZzC4WcVPNA2EvxRCDsFALqOObQ
         5n78ddONrxtndrMaDx2gXwTlxmmDPr2C+PDk/8GXeTc4ULf1Afo6qoU02tM404eSlicn
         tEWUGOJg+ubOS0NfeHea5dQmwj94A0cDG2vPtukz4N37AZ7CoHDWbyIBvYrV7hO6B3bs
         AH3+Wgs1WAAx2OVmkoHiglujxQjdDAgoWN0EinCzyei3djV4G7lcZIkowpVErsPfzUq8
         50+RIIc3XEt10bFk3/HdloIXez5+lzfUkiSJO3yS2bL24Ec6kqsXAM1alFmWBv3M57Ok
         6DQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687293687; x=1689885687;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EF5pfw7nSexoxaL00DnHZHZZwsqD5TiJVywKTlCaMwA=;
        b=RDgbYnrfLJ/RtmKUkkJFZIWUFk9LvkSpY+k/MNVA3c/NMqi1prTOaH9ky16EACc2xK
         oHINA9aW3a+PCORXY9uosC6HeNDS0xVYievREUt1jrObmTSS/UK7ddfnIrRjLPMkHA1S
         vrbdUvD83QgSz4XiliHJpJ6JR7me0NGuWRx2Q97vextXbGODng/DKNTgAFjeuXcSxI5w
         867kEVm0oaF6vvoFN6D+4lkNPPGuCyvJt11jRgcCWG5Nd/KROO5ouBBCqIPz6ca3akfh
         R+iqURSwx4ar8dDt6NkMhs29svToshZ0v3wE7h6V/ZsVnDXTTNPIf372OuZjJSwyJ7wO
         UgZw==
X-Gm-Message-State: AC+VfDwEFg5wx4s+a1cDiHC/elYy9rw22CO4SaiGsF/ETZo8BYspLMsg
	+W/7b7VG/bZAkvXv+ZpiK8ZVjQ==
X-Google-Smtp-Source: ACHHUZ6ffVx6Cvd8xsXtqOUfPvX7b64/KBe6+XkBWdmb3+gj5EE2y4oGpVnTGcclXeauAdY0SmiHkA==
X-Received: by 2002:a05:6a20:3d85:b0:118:a48:8977 with SMTP id s5-20020a056a203d8500b001180a488977mr10690039pzi.3.1687293686986;
        Tue, 20 Jun 2023 13:41:26 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id c21-20020a62e815000000b00668738796b6sm1677820pfi.52.2023.06.20.13.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 13:41:26 -0700 (PDT)
Date: Tue, 20 Jun 2023 13:41:26 -0700 (PDT)
X-Google-Original-Date: Tue, 20 Jun 2023 13:39:03 PDT (-0700)
Subject:     Re: [PATCH v3] RISC-V: Enable dead code elimination
In-Reply-To: <CAKwvOdnZ8+CrBGCDhzi8o8UrOjg-CyuRO=OLKpx9X4iGheV77Q@mail.gmail.com>
CC: falcon@tinylab.org, Conor Dooley <conor@kernel.org>, guoren@kernel.org,
  linux-riscv@lists.infradead.org, npiggin@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>,
  paulburton@kernel.org, vincent.chen@sifive.com, tim.bird@sony.com, llvm@lists.linux.dev
From: Palmer Dabbelt <palmer@rivosinc.com>
To: ndesaulniers@google.com
Message-ID: <mhng-fc838dfb-f78e-4a40-8c39-bdc4ddee3df8@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Tue, 20 Jun 2023 13:26:53 PDT (-0700), ndesaulniers@google.com wrote:
> On Tue, Jun 20, 2023 at 4:17 PM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>>
>> On Tue, 20 Jun 2023 13:13:06 PDT (-0700), ndesaulniers@google.com wrote:
>> > On Wed, May 17, 2023 at 04:29:36PM +0800, Zhangjin Wu wrote:
>> >> Select CONFIG_HAVE_LD_DEAD_CODE_DATA_ELIMINATION for RISC-V, allowing
>> >> the user to enable dead code elimination. In order for this to work,
>> >> ensure that we keep the alternative table by annotating them with KEEP.
>> >>
>> >
>> > Just cross referencing the report from Palmer against v2; I see orphan
>> > section warnings from the linker related to the EFI stub when building
>> > allmodconfig with this patch applied.
>> >
>> > v2: thread for reference.
>> > https://lore.kernel.org/linux-riscv/CAKwvOdmsgMN5oQpDLh12D0X-CfQDtHC-EtxHcBnADkhnyitMKQ@mail.gmail.com/
>>
>> Sorry for replying to the v2, I'm marking that as superseeded in
>> patchwork.  IIUC it is a real issue on your end too?  I'm also not 100%
>> sure about the hang, I just let LLD cook for about 10 minutes before I
>> noticed it was still running and posted.
>
> Yes; if this is merged, our CI builds of ARCH=riscv allmodconfig will go red.
>
> I assume a linker script somewhere needs to be updated, but I haven't
> found if/where the efi stub's is.
>
> drivers/firmware/efi/libstub/zboot.lds perhaps?
>
> On Tue, Jun 20, 2023 at 4:22 PM Conor Dooley <conor@kernel.org> wrote:
>>
>> Repeating myself for the sake of the archives or w/e, two different
>> submitters with differing version numbers. The v2 from Jisheng is more
>> recent than the v3 here from Zhangjin, they agreed in this mail thread
>> to merge their work.

Thanks, so we're going to jump over there.

>
> -- 
> Thanks,
> ~Nick Desaulniers
