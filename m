Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE1115AB
	for <llvm@lists.linux.dev>; Mon, 26 Dec 2022 14:05:04 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id k4so6234342vsc.4
        for <llvm@lists.linux.dev>; Mon, 26 Dec 2022 06:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T6vaOrJ+SYkJ1gOWpjtkMrcHRqcXhXKFAtMHBJoyLlM=;
        b=KL57D7JhzP4KwDaRqYK1Mn6eDS+2yPPqFGBf/6gKCRI81Uqu6Skw3QMY+jUzSoMwMY
         083E53dGdrtNmqsPjrTkKWXX/1R6lzQXcnGtf/xRGmkdm8P2gwYRSCRFbF1KasgMkzsX
         mW9WKwpxmMNlIJwpfSY9oh0Su6DUF6G/iLUVYtuoQ7gdOCPhDDf8mC0gXqQNIIj2XkVO
         nBgGchnLDOL7bfN8vLa7ILGr2Dgm2QgHVOZU7NLPxYItgZpEOjKAd196RXIMbEybThfH
         m6qcJytVD9zEaBu9aSptIR41Op3NwdZSXiUHL8e4ciYpJAzPldF8jPh+tnvLDmRtsGA0
         s+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T6vaOrJ+SYkJ1gOWpjtkMrcHRqcXhXKFAtMHBJoyLlM=;
        b=dgL17y1f1kQ0urIrJfD/9QCOu8N8emogCVYXA8d3Zc6OqVsmGRxbNnvU/39k+d/mLu
         AlKCSWS5YSv7iCL1Z1fPq2i90GS6HnozGGF0S2n39CGDsjvLzbrKWSxKX2rTh4k6hdEe
         OOPS/hprDq/QCXdUqDHSFZVfRv/jSxFxyKPfjyeUBgrC71Ltu6lN+fQxBoTebPFmyMQ7
         L7OUl/+oQYfnEzaxyw6qjjUZn2uBJ48/0R/hM9Q8lADjgS3zX2BMetQLBNFx0/28anlU
         X4ZEbRqSW8tqL1KVCMsu4mSf86l26QLv8XNaosHQ006d58sDektTltLb4Hszkm1/fVDJ
         w8Ow==
X-Gm-Message-State: AFqh2krEgqseWJy8+2ZOwbnWNbbFVPG1GoLmsCLNTl4U5/geLVPs0qHK
	0Oy087Hmb3r9JWY30AbKhK4qnc8lRhgMV8WREWGIMw==
X-Google-Smtp-Source: AMrXdXsSf/T0QqbQ64gTi+sMf70r1YtmlTja9w1ffmA5vr4+z5jtrGd5rGEoP/BpN0kAD88ZjcPqxLy5dDjpBvADz28=
X-Received: by 2002:a67:ec94:0:b0:3b5:32d0:edcc with SMTP id
 h20-20020a67ec94000000b003b532d0edccmr2008099vsp.24.1672063503138; Mon, 26
 Dec 2022 06:05:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1671221596.git.josef@toxicpanda.com> <1d9deaa274c13665eca60dee0ccbc4b56b506d06.1671221596.git.josef@toxicpanda.com>
 <Y6kgR4qnb23UdAEX@dev-arch.thelio-3990X>
In-Reply-To: <Y6kgR4qnb23UdAEX@dev-arch.thelio-3990X>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 26 Dec 2022 19:34:51 +0530
Message-ID: <CA+G9fYuhZzVfxXnVRMog_yv8F17NY4vHe_iafwgxpYCGfuaJqQ@mail.gmail.com>
Subject: Re: [PATCH 8/8] btrfs: turn on -Wmaybe-uninitialized
To: Nathan Chancellor <nathan@kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org
Cc: Josef Bacik <josef@toxicpanda.com>, linux-btrfs@vger.kernel.org, kernel-team@fb.com, 
	llvm@lists.linux.dev, Filipe Manana <fdmanana@suse.com>, David Sterba <dsterba@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Dec 2022 at 09:47, Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Fri, Dec 16, 2022 at 03:15:58PM -0500, Josef Bacik wrote:
> > We had a recent bug that would have been caught by a newer compiler with
> > -Wmaybe-uninitialized and would have saved us a month of failing tests
> > that I didn't have time to investigate.
> >
> > Signed-off-by: Josef Bacik <josef@toxicpanda.com>
>
> This needs to be moved to the condflags section, as
> -Wmaybe-uninitialized is a GCC only flag, so this breaks our builds with
> clang on next-20221226:
>
>   error: unknown warning option '-Wmaybe-uninitialized'; did you mean '-Wuninitialized'? [-Werror,-Wunknown-warning-option]

LKFT test farm also noticed these build breaks with clang on next-20221226.

Regressions found on arm64, riscv, s390 and powerpc

    - build/clang-lkftconfig
    - build/clang-15-lkftconfig
    - build/clang-15-defconfig-40bc7ee5
    - build/clang-15-defconfig
    - build/clang-nightly-defconfig
    - build/clang-15-lkftconfig-compat
    - build/clang-nightly-defconfig-40bc7ee5
    - build/clang-nightly-lkftconfig

make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/build LLVM=1 LLVM_IAS=1
ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- 'HOSTCC=sccache clang'
'CC=sccache clang'

error: unknown warning option '-Wmaybe-uninitialized'; did you mean
'-Wuninitialized'? [-Werror,-Wunknown-warning-option]
make[4]: *** [/builds/linux/scripts/Makefile.build:252:
fs/btrfs/super.o] Error 1


> I can send a patch on Tuesday unless the original commit can be amended.


ref:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20221226/testrun/13818773/suite/build/test/clang-15-defconfig/details/

- Naresh
