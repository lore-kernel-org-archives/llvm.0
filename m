Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEB6375
	for <llvm@lists.linux.dev>; Wed,  5 Oct 2022 02:20:11 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id k6so16535682vsc.8
        for <llvm@lists.linux.dev>; Tue, 04 Oct 2022 19:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=7YhJILkPdF1rs3gTPMB66dOMeDGdUKnSuDcjosHDwHM=;
        b=NQ2HSnnhyNHZKU65OVDnPAlcAl0VOiWBfVHf18IW3s2NTWnBWCSXi7JCTY02V1EKmZ
         W5W4glVa+g4HifUjg3962KPJA9QU2m7cczJeMhrk4TdDzj2Ie0O7/su23ITHMEQ+WcLt
         enA2HbScCbiM81lIrBOqUhwQ7tU53U7cZnLgQWNQz/RKHJrwVaMLjvl2+oEkYRY03/U5
         wi31YIufdWADwPLARAGexHlgaPZWa+4vUVHSYm6nP0brTSqojzzno2yrkThEs5Lqeeh/
         CmXqtbbEcOxo6uuN6m/uj/M1kBAocnH8nl7Mj/wlOwT+oGxFCwtB1jxGRh8dxh/kDfOi
         7XZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=7YhJILkPdF1rs3gTPMB66dOMeDGdUKnSuDcjosHDwHM=;
        b=quuc5Jb8RcTiIJaOpmj+tx0fx1oUXolhAUpgp/448K15F6F43eF+PL1xymqb1RwVhP
         xZ59+jTDVoAwyWNZpodHGvY9A/9guzpRJdgM+S1L0rTf0bdXh95p4Bbx+2kvj1VWHefW
         ygc5AHGFXdQKQ1uBAXOpPsNkvrioiKdXJtkVVyVz5iNQQcl16FUDnBcyB6X2w3Kpt1hY
         2GiS0YZey//exCVJMDZ2TJruXvvZUUlAAsdScSdnJlIC5JABt9/I+vgGNVJXcUkw6p0s
         u15Lb36iVXwXPfwmL+nrzicjue+elKt3WMWG6IatOUaWshzSAbWBWYfp+XcSeieF0+J0
         Hf3A==
X-Gm-Message-State: ACrzQf2QAPffQ3QrfUPtlPbet2ik5YZB4pR6u4D9J0bPmtL+v4EV3kt7
	4Q+U9Phiyedq6/16llVXURugWEFPPsyK/7KYxzI=
X-Google-Smtp-Source: AMsMyM46HGMnYHX9QyCDHjGsaX1PQWqUqZF5PSSi3MZ7vRUBRgtkrmR1VbmXCkeVBUetVx9BJt8naZPRFVDR6/R59cM=
X-Received: by 2002:a67:fd04:0:b0:3a6:d796:2291 with SMTP id
 f4-20020a67fd04000000b003a6d7962291mr363116vsr.64.1664936410064; Tue, 04 Oct
 2022 19:20:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220512205545.992288-1-twd2.me@gmail.com> <mhng-e9b5bd39-0929-487c-a761-6a3ff508d969@palmer-ri-x1c9>
In-Reply-To: <mhng-e9b5bd39-0929-487c-a761-6a3ff508d969@palmer-ri-x1c9>
From: Wende Tan <twd2.me@gmail.com>
Date: Wed, 5 Oct 2022 10:19:56 +0800
Message-ID: <CAJzt7PV0n8ybwVgMOAjsDTVardRBN6PCrZuW_4u6fTV-qPkaEQ@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: build: Allow LTO to be selected
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, nathan@kernel.org, 
	ndesaulniers@google.com, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Never mind. Thanks for your reply!

But I find Nick's Tested-by tag is missing?
 https://lore.kernel.org/all/CAKwvOdmJ26h4L=3+42xeWG0_mZmZXkye=+mNWgFOHbo59ZVz1w@mail.gmail.com/

On Wed, 5 Oct 2022 at 09:57, Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> > Allow LTO to be selected for RISC-V, only when LLD >= 14, since there is an
> > issue [1] in prior LLD versions that prevents LLD to generate proper
> > machine code for RISC-V when writing `nop`s.
> >
> > I have tested enabling LTO for `defconfig`. The LLD took ~2m21s and ~3GiB
> > on our Intel Xeon Gold 6140 server and produced an 18MiB Image. The image
> > can boot to shell using an archriscv rootfs on QEMU.
> >
> > I have also tested it for `allyesconfig` without COMPILE_TEST, FTRACE,
> > KASAN, and GCOV. The LLD took ~7h03m and ~335GiB on the server,
> > successfully producing a 1.7GiB Image. Unfortunately, we cannot boot this
> > image because the `create_kernel_page_table()` -> `alloc_pmd_early()` ->
> > `BUG_ON()` logic limits the image to be < 1GiB. Maybe we can fix it in a
> > separate patch further.
> >
> > [1] https://github.com/llvm/llvm-project/issues/50505, resolved by LLVM
> >     commit e63455d5e0e5 ("[MC] Use local MCSubtargetInfo in writeNops")
> >
> > Tested-by: Wende Tan <twd2.me@gmail.com>
> > Signed-off-by: Wende Tan <twd2.me@gmail.com>
>
> Sorry for missing this, the v2 never made it to my inbox.  Not sure
> exactly what happened, but an off-list ping made it through.  I've put
> this on for-next, I don't have any way to test it because I don't have
> clang setup yet.
