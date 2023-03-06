Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D0553A6
	for <llvm@lists.linux.dev>; Mon,  6 Mar 2023 23:52:28 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id d10so6606027pgt.12
        for <llvm@lists.linux.dev>; Mon, 06 Mar 2023 15:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1678146748;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jz3wFNkjF7LXABjUJBcGMj80WDbOlcRgJbsy9urZHOw=;
        b=b1slkWsL9CSBhAfpckVrfNeYXsMtkTaqz4NO52rXSH/OP72Zd9YF6vN6QxjzWEoo43
         1gGnFa3ahKVbaoxaseTz8kdfyHxT7P5tQa0/omoVpyarcWQJ0z40/mzu+pkkVfnTMpDr
         RlB/IoWSLQqWc1cEpUJHMjb7sNkDYANC/z1VLcCJufzfDrsmrKrg+jLU005bRYNOtCd7
         DpxdeYsKH32GMKLePVxbRzdxKIfNJRIyGVXbZBpjKoU1sE6U0QrE4NCAOa/HYjE712BE
         L4Ciz1Nk193bQsfXPTzgkGS410MxUixGISg/9ldxVB1itm+iyHiAZ4k36ueB++IToWfc
         JqFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678146748;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jz3wFNkjF7LXABjUJBcGMj80WDbOlcRgJbsy9urZHOw=;
        b=QS3UvbrovHqWQNmfbY9mzBBMg1vg7yo8FkcEiKC1nPkU9hKg/ifFUWjgJB1e5axfqQ
         0b8jEOLW0QE9jze4lbww7DZpKgw6NUZ9vi/I3fAPlXWaiBKuFCLGoef8wkFUAUvr/wQF
         3brh8JQczk8I0WKCRqs9OGQc4q+gQlJZaTrJqXHm5Cc171nifMvRcTtKSc6K1b3f1eY4
         hcszKEf/9XzjHws6jYRXuvks/DVwpOLC6/VZD3VvAfTazN/PckWmEll65x3TpeYOGVDW
         spfQ7seV4BNyVbs+nuF18hP/YgoayQ5ajVJ9+IZlu39E/nB+wO211fvigvV9bfg4vkqL
         Qtjw==
X-Gm-Message-State: AO0yUKXT/uWrfNSOtuQWo0G5EmxUrhszBxU6UEO2tFfCYsII5fIJhkOd
	cUBKxf2f9VxXECF69QWBMFRG1A==
X-Google-Smtp-Source: AK7set8NzrQKsRckvFBxs/m0fs4f7x8C8j0v425ppkkJT8FxVnX6zFKiOuSesFUlDe6SQLGBehG/ew==
X-Received: by 2002:a62:5253:0:b0:5a8:4bfb:6bee with SMTP id g80-20020a625253000000b005a84bfb6beemr9462483pfb.9.1678146748111;
        Mon, 06 Mar 2023 15:52:28 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id j19-20020a62e913000000b005ae02dc5b94sm6794462pfh.219.2023.03.06.15.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 15:52:27 -0800 (PST)
Date: Mon, 06 Mar 2023 15:52:27 -0800 (PST)
X-Google-Original-Date: Mon, 06 Mar 2023 15:51:36 PST (-0800)
Subject:     Re: [PATCH v1 1/2] RISC-V: move zicsr/zifencei spec version check to Kconfig
In-Reply-To: <Y/jtGRrBfKxO6s0c@spud>
CC: nathan@kernel.org, Conor Dooley <conor.dooley@microchip.com>,
  naresh.kamboju@linaro.org, linux-riscv@lists.infradead.org, llvm@lists.linux.dev
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-5ec23642-a554-4e02-82bc-3a138a50d3ce@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Fri, 24 Feb 2023 09:00:09 PST (-0800), Conor Dooley wrote:
> On Fri, Feb 24, 2023 at 09:37:28AM -0700, Nathan Chancellor wrote:
>> On Thu, Feb 23, 2023 at 10:05:45PM +0000, Conor Dooley wrote:
>
>> > ---
>> >  arch/riscv/Kconfig  | 10 ++++++++++
>> >  arch/riscv/Makefile |  5 +----
>> >  2 files changed, 11 insertions(+), 4 deletions(-)
>> > 
>> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> > index cebf0c5f8824..4eb0ef8314b3 100644
>> > --- a/arch/riscv/Kconfig
>> > +++ b/arch/riscv/Kconfig
>> > @@ -288,6 +288,16 @@ config ARCH_RV64I
>> >  
>> >  endchoice
>> >  
>> > +config TOOLCHAIN_NEEDS_SPEC_20191213
>> 
>> This symbol's name is a little confusing to me, how does the toolchain
>> need spec version 20191213. Maybe 'SPEC_20191213' should be something
>> like 'EXPLICIT_ZICSR_ZIFENCEI'? Otherwise, maybe it should be something
>> like 'TOOLCHAIN_HAS_DEFAULT_SPEC_20191213'? Sorry for the bikeshed but I
>> think most Kconfig symbols should be self describing.
>
> Yah I can do that. I actually had this as the DEFAULT_SPEC variant
> before and changed it - I'll switch it to the EXPLICIT one.
> Thanks for taking a look Nathan :)

Another option here would be to use the `-misa-spec` argument for GCC, 
to make it match LLVM's spec version.
