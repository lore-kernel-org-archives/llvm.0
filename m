Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B67819E45
	for <llvm@lists.linux.dev>; Wed, 21 Jun 2023 18:19:33 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1b5018cb4dcso30851465ad.2
        for <llvm@lists.linux.dev>; Wed, 21 Jun 2023 11:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687371572; x=1689963572;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2N+RflCXP1PzqPiaKt451iYwf1h+9b0LuKAtNyBxB34=;
        b=vZJh1OHfFxruZ2w3nH0qXkjMYYeCkv5Ua0zyfpVuCpMtXRcvouQouNPsAdKWRXXMry
         zrn8M/JnD32mu7zYsKdevgjmGMGXzb2lX5l0oAnBUm/LsUWwpDicYlkVholIJaspBMsU
         c+q1kszWrccgcS/g9a56qdy9GEW0T9LRlDyzZYFWjLqVv2IS+qcUW9ETjUhhNPaYI9QF
         YxBNbBdJlEeGSIcfkdKq4oDUITp8UBaZdOui11Ubpm9V7h+E+4TFC1Ge8XKoYubJjSab
         X67Dz8Wo9qk5i0/fhx9xWwI4WmhH8MsGD1R1hjNTmVHT8NQKlYI5wJZDrrrY6glsnvbm
         HClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687371572; x=1689963572;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2N+RflCXP1PzqPiaKt451iYwf1h+9b0LuKAtNyBxB34=;
        b=VrwA6qAjvxm2KZ3YhO/mbS0CEDZQGM9429s+1LEmJFNsTXXXQhhOhSvcugPWP04maw
         m4K31z+tCIzhh/pcDtONXNGd10+k3uFkL+Y5+mogUxCONEXw1v3mCdPLjZdLCm3w2QHL
         vmZywoXUmQtT8MejELEGs95P4SEF9gKCi3LscEge24nNnVAfHAv1U65DTz74p+ZvClUy
         WmDxTJJquDsq6mdjvYhUqzPKpkUUKJqj4MM8nSfcZ2QRszhJZIibYzmawLzCf4gQUVsN
         iAI77ITC57Fuh4jXRM/wImCCqXyrulGOpSYixvXTFMdjepHdf7LNkpC2Fy7CJ8mOls/J
         F4Vg==
X-Gm-Message-State: AC+VfDyUNRiKHPgiKEm/ZHRYhd696U+G5hxPCsRL2t+GXQUeg2MUEQxh
	ZswgLu5jKDI75nxp5iDl8/3jxw==
X-Google-Smtp-Source: ACHHUZ5Gpf4XE8MJKO2B5K1fQ3ujoREdSQF8gdFfQ4ZRJyq7uL0zOLzLgMg+CO/3CitU/RJb7tjGJQ==
X-Received: by 2002:a17:902:d48f:b0:1af:ea40:34e6 with SMTP id c15-20020a170902d48f00b001afea4034e6mr7449439plg.60.1687371572484;
        Wed, 21 Jun 2023 11:19:32 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id jw9-20020a170903278900b001b50f35aff1sm3805118plb.140.2023.06.21.11.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 11:19:31 -0700 (PDT)
Date: Wed, 21 Jun 2023 11:19:31 -0700 (PDT)
X-Google-Original-Date: Wed, 21 Jun 2023 11:18:52 PDT (-0700)
Subject:     Re: [PATCH v2 0/4] riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
In-Reply-To: <87wmzwn1po.fsf@all.your.base.are.belong.to.us>
CC: Conor Dooley <conor@kernel.org>, jszhang@kernel.org, llvm@lists.linux.dev,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: bjorn@kernel.org, ndesaulniers@google.com, nathan@kernel.org
Message-ID: <mhng-1d790a82-44ad-4b9c-bfe4-6303f09b0705@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Wed, 21 Jun 2023 10:51:15 PDT (-0700), bjorn@kernel.org wrote:
> Conor Dooley <conor@kernel.org> writes:
>
> [...]
>
>>> So I'm no longer actually sure there's a hang, just something slow.  
>>> That's even more of a grey area, but I think it's sane to call a 1-hour 
>>> link time a regression -- unless it's expected that this is just very 
>>> slow to link?
>>
>> I dunno, if it was only a thing for allyesconfig, then whatever - but
>> it's gonna significantly increase build times for any large kernels if LLD
>> is this much slower than LD. Regression in my book.
>>
>> I'm gonna go and experiment with mixed toolchain builds, I'll report
>> back..
>
> I took palmer/for-next (1bd2963b2175 ("Merge patch series "riscv: enable
> HAVE_LD_DEAD_CODE_DATA_ELIMINATION"")) for a tuxmake build with llvm-16:
>
>   | ~/src/tuxmake/run -v --wrapper ccache --target-arch riscv \
>   |     --toolchain=llvm-16 --runtime docker --directory . -k \
>   |     allyesconfig
>
> Took forever, but passed after 2.5h.

Thanks.  I just re-ran mine 17/trunk LLD under time (rather that just 
checking top sometimes), it's at 1.5h but even that seems quite long.

I guess this is sort of up to the LLVM folks: if it's expected that DCE 
takes a very long time to link then I'm not opposed to allowing it, but 
if this is probably a bug in LLD then it seems best to turn it off until 
we sort things out over there.

I think maybe Nick or Nathan is the best bet to know?

> CONFIG_CC_VERSION_TEXT="Debian clang version 16.0.6 (++20230610113307+7cbf1a259152-1~exp1~20230610233402.106)"
>
>
> Björn
