Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A989D20690
	for <llvm@lists.linux.dev>; Thu, 22 Jun 2023 21:42:05 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-51452556acdso21009a12.2
        for <llvm@lists.linux.dev>; Thu, 22 Jun 2023 14:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687470125; x=1690062125;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jceW0LefNLIMcdHkXOkHyrZ6hyhvAWI/rnJOWQTlRkU=;
        b=ir6ofxvHhRbxfpKb5tlLnQm2vqASmGbQrhU2aaNbUwdUqiHClocflNrOjfMKmUCDmc
         HY8ZWaV3y3lsUyonNzjpzPQNTOqx1/xpDI79l6COM49RMMPzygpLFxNjuIGX6KFzJlYl
         fMy+IqSex0XilMVkDQAT2P42JJmfFjprfJxcNZiop47QajWyVyGorI/at1DL1KLtm3tZ
         RYZgS4Agbb02afaoTEHcoeOrvqQ7bQkdR9ivL0PZ66d6ZXN/HC49IJMpu2ycyath9ECc
         g5plpTU/pfW7o1cTdufSQMMbiHSyWOyZlGtoA3Y0WWt80oh9rwggm0zw5NLUMVqRDnUB
         PQKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687470125; x=1690062125;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jceW0LefNLIMcdHkXOkHyrZ6hyhvAWI/rnJOWQTlRkU=;
        b=REYArSn6WA1MeiJ2aNn4jN2R6i041XDthZRH2/xMOptUEuTUyrXjfmvXGHI8AcslTm
         ZICJI/3o8KJSo0MJaBQHESzA/lCxFRj29K2pS2yzeX7LZgUrAZj8PCnKYpYaEmgOOsoO
         DQlkuhk9zp0IrgBz4LZOpP7Ca8DN3SJyh7lB8Vbr5pYqg1PTjStNHRzwY/et8LYo5nEm
         ou51ed965hqdf6qL3YiV09ID6+bBMmLa64k8D7SGiYKCuwc8PHBS/RmwoixPTGoR7AFk
         f2FlRIZ2+EXpfTX/Vr3XmmYaVtPtoiIjkrJy0wbCg5Ij2Os5Q36HdFCfoOz08BUNo6Ki
         qnDw==
X-Gm-Message-State: AC+VfDxFLfI685zecFiXUqK42wQ+elbrqWgPezq9PZjyubQyWrS4Of4v
	U2vtZNaLB5EwX/+Rr3AYdAvnsQ==
X-Google-Smtp-Source: ACHHUZ4pOcAQElXv15ZXkTtOi9qORFEI0aktifpMt2TmQ2FdKT4p3ACtlIIRsH02h3ehHwsN8DtdSg==
X-Received: by 2002:a05:6a00:174d:b0:64c:c5f9:1533 with SMTP id j13-20020a056a00174d00b0064cc5f91533mr16483486pfc.33.1687470124730;
        Thu, 22 Jun 2023 14:42:04 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id m2-20020aa79002000000b0064d1d8fd24asm4944130pfo.60.2023.06.22.14.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 14:42:04 -0700 (PDT)
Date: Thu, 22 Jun 2023 14:42:04 -0700 (PDT)
X-Google-Original-Date: Thu, 22 Jun 2023 14:41:24 PDT (-0700)
Subject:     Re: [PATCH v2 0/4] riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
In-Reply-To: <CAKwvOd=bHe07O=eBimOg5G-XxXgs6=h5OXzkfS+ayfuAHGOUew@mail.gmail.com>
CC: nathan@kernel.org, bjorn@kernel.org, Conor Dooley <conor@kernel.org>,
  jszhang@kernel.org, llvm@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ndesaulniers@google.com
Message-ID: <mhng-3f62072d-7b42-4fa0-9076-3899054749cc@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Thu, 22 Jun 2023 14:40:59 PDT (-0700), ndesaulniers@google.com wrote:
> On Wed, Jun 21, 2023 at 12:46 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> On Wed, 21 Jun 2023 11:19:31 PDT (-0700), Palmer Dabbelt wrote:
>> > On Wed, 21 Jun 2023 10:51:15 PDT (-0700), bjorn@kernel.org wrote:
>> >> Conor Dooley <conor@kernel.org> writes:
>> >>
>> >> [...]
>> >>
>> >>>> So I'm no longer actually sure there's a hang, just something slow.
>> >>>> That's even more of a grey area, but I think it's sane to call a 1-hour
>> >>>> link time a regression -- unless it's expected that this is just very
>> >>>> slow to link?
>> >>>
>> >>> I dunno, if it was only a thing for allyesconfig, then whatever - but
>> >>> it's gonna significantly increase build times for any large kernels if LLD
>> >>> is this much slower than LD. Regression in my book.
>> >>>
>> >>> I'm gonna go and experiment with mixed toolchain builds, I'll report
>> >>> back..
>> >>
>> >> I took palmer/for-next (1bd2963b2175 ("Merge patch series "riscv: enable
>> >> HAVE_LD_DEAD_CODE_DATA_ELIMINATION"")) for a tuxmake build with llvm-16:
>> >>
>> >>   | ~/src/tuxmake/run -v --wrapper ccache --target-arch riscv \
>> >>   |     --toolchain=llvm-16 --runtime docker --directory . -k \
>> >>   |     allyesconfig
>> >>
>> >> Took forever, but passed after 2.5h.
>> >
>> > Thanks.  I just re-ran mine 17/trunk LLD under time (rather that just
>> > checking top sometimes), it's at 1.5h but even that seems quite long.
>> >
>> > I guess this is sort of up to the LLVM folks: if it's expected that DCE
>> > takes a very long time to link then I'm not opposed to allowing it, but
>> > if this is probably a bug in LLD then it seems best to turn it off until
>> > we sort things out over there.
>> >
>> > I think maybe Nick or Nathan is the best bet to know?
>>
>> Looks like it's about 2h for me.  I'm going to drop these from my
>> staging tree in the interest of making progress on other stuff, but if
>> this is just expected behavior them I'm OK taking them (though that's
>> too much compute for me to test regularly):
>>
>> $ time ../../../../llvm/install/bin/ld.lld -melf64lriscv -z noexecstack -r -o vmlinux.o --whole-archive vmlinux.a --no-whole-archive --start-group ./drivers/firmware/efi/libstub/lib.a --end-group
>>
>> real    111m50.678s
>> user    111m18.739s
>> sys     1m13.147s
>
> Ah, I think you meant s/allmodconfig/allyesconfig/ in your initial
> report.  That makes more sense, and I can reproduce.  Let me work on a
> report.

Awesome, thanks!

>
>>
>> >> CONFIG_CC_VERSION_TEXT="Debian clang version 16.0.6 (++20230610113307+7cbf1a259152-1~exp1~20230610233402.106)"
>> >>
>> >>
>> >> Björn
