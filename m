Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DEDBA4F
	for <llvm@lists.linux.dev>; Tue,  7 Mar 2023 19:24:26 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id qa18-20020a17090b4fd200b0023750b675f5so17573471pjb.3
        for <llvm@lists.linux.dev>; Tue, 07 Mar 2023 11:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1678217066;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sjkGAq2gRiWui6dr3Gs/IFvjJr2kIkf2c1GBI4go40E=;
        b=7AcrK+WKMdHFDafgZTUb0vue+2HrCb3Jduqyrw0Sz3Db9Q1wZoFUbbfoJ8w0ZFh8Tz
         WMnFrGfAjyV5C1xJumiNGZ2S7oYQ34EbG6VdcBNzMTd0pdR6MJKOvmtiPldZbXoPXC1s
         YQLNKK4/XletmvPzKcdgOQnowSk1MyUs8wkGOPNQX1CXBNi0GmO4O4GolA6Zq8r8u8K9
         ez3YKG72ShX6/CStptcmwPwcH8E4+NoqzZJ1Yc/VNCPsCg8ltow5QxFBCfq2/c+C2AlI
         EA47dX0F9J4oE5AGbeo+Pb7O1AtiWGt28XU0wN8I9Md8pvLf6IjUpaPR9nITxqqtrqq0
         aQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678217066;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjkGAq2gRiWui6dr3Gs/IFvjJr2kIkf2c1GBI4go40E=;
        b=GCKxgiJSHdaLrsGW2Vr+PxN4ut0gir5T7rNXtB5knfqLR2nZCOmLiDq0X8Hl0QgLdG
         KU5TiJsVwzGWKv2U5guxdkjX0i0vduWHKNONlBkjPclLt02mWPSZ9Tpdot8qpRFs0qvP
         vjTMBSmZZbyhsR4jH5iKAg8CJejlqbipsIoTq24F2p5zL2EYahZ9rukUCGkf2TC2rJZp
         iLSlIFf5UeVIIfnWumxdiA/nQSp3azepyQ95/wuxPcxnZbJjp335xGINhPcVuSVo85aD
         f1I/JTCaDmyraMyv/W65856jyxjXHY54kJI7mEM1f5ISBTwQH1iZCmnn3CxoVPB2e3so
         WOsQ==
X-Gm-Message-State: AO0yUKXEMHL0RRDLIaYGCc26EwqX0eYymL5301akQfrYhpnHifkc0RVM
	nJlvwRCgf34XR5nOE5tNoaRJDQ==
X-Google-Smtp-Source: AK7set/Is4PWWXGm8vKaFd+N4Q60tAKAVCaHjO5vRpQw3R+IDYvTFr9LMpcKxvKnrQZivs1nw/nKRA==
X-Received: by 2002:a05:6a20:1613:b0:c7:60d1:81a1 with SMTP id l19-20020a056a20161300b000c760d181a1mr18519572pzj.28.1678217065845;
        Tue, 07 Mar 2023 11:24:25 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id d23-20020aa78697000000b005afda149679sm8406390pfo.179.2023.03.07.11.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 11:24:25 -0800 (PST)
Date: Tue, 07 Mar 2023 11:24:25 -0800 (PST)
X-Google-Original-Date: Tue, 07 Mar 2023 11:23:37 PST (-0800)
Subject:     Re: [PATCH v1 1/2] RISC-V: move zicsr/zifencei spec version check to Kconfig
In-Reply-To: <299f2b9c-d72b-4b2c-9f42-f5b71a9d05e6@spud>
CC: nathan@kernel.org, Conor Dooley <conor.dooley@microchip.com>,
  naresh.kamboju@linaro.org, linux-riscv@lists.infradead.org, llvm@lists.linux.dev
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-2a3f3a1d-d4ee-4227-ac5b-cc37c494372b@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Tue, 07 Mar 2023 11:14:54 PST (-0800), Conor Dooley wrote:
> On Mon, Mar 06, 2023 at 03:52:27PM -0800, Palmer Dabbelt wrote:
>> On Fri, 24 Feb 2023 09:00:09 PST (-0800), Conor Dooley wrote:
>> > On Fri, Feb 24, 2023 at 09:37:28AM -0700, Nathan Chancellor wrote:
>> > > On Thu, Feb 23, 2023 at 10:05:45PM +0000, Conor Dooley wrote:
>> > 
>> > > > ---
>> > > >  arch/riscv/Kconfig  | 10 ++++++++++
>> > > >  arch/riscv/Makefile |  5 +----
>> > > >  2 files changed, 11 insertions(+), 4 deletions(-)
>> > > > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> > > > index cebf0c5f8824..4eb0ef8314b3 100644
>> > > > --- a/arch/riscv/Kconfig
>> > > > +++ b/arch/riscv/Kconfig
>> > > > @@ -288,6 +288,16 @@ config ARCH_RV64I
>> > > >  >  endchoice
>> > > >  > +config TOOLCHAIN_NEEDS_SPEC_20191213
>> > > 
>> > > This symbol's name is a little confusing to me, how does the toolchain
>> > > need spec version 20191213. Maybe 'SPEC_20191213' should be something
>> > > like 'EXPLICIT_ZICSR_ZIFENCEI'? Otherwise, maybe it should be something
>> > > like 'TOOLCHAIN_HAS_DEFAULT_SPEC_20191213'? Sorry for the bikeshed but I
>> > > think most Kconfig symbols should be self describing.
>> > 
>> > Yah I can do that. I actually had this as the DEFAULT_SPEC variant
>> > before and changed it - I'll switch it to the EXPLICIT one.
>> > Thanks for taking a look Nathan :)
>> 
>> Another option here would be to use the `-misa-spec` argument for GCC, to
>> make it match LLVM's spec version.
>
> I'm not entirely sure what you're getting at.
> You're the toolchain guy, but my understanding was that gas and gcc have
> that option, but not ld, which rules out my initial interpretation. 
> Are you suggesting that we always pass -misa-spec=<pre-zicsr_zifencei> to
> gcc so that we are using the same misa-spec for both gnu and llvm
> toolchain bits?

Pretty much, I think just $(cc-option -misa-spec=2.2) should do it.  
That should also cover older GCC versions, as we added the argument long 
before we changed the default.

> My instinctive thought was that that is kinda fragile to things
> misaligning between gcc/llvm, but given I seem to end up looking at this
> every month, we're really fragile to changes in either camp anyway...

Pretty much, but in this case we're essentially just disabling a form of 
change by sticking to an ISA spec version.

> I can go spin an alternative v2 of this up if I have understood you
> correctly.

Thanks

>
> Thanks,
> Conor.
