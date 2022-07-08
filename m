Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8037A7A
	for <llvm@lists.linux.dev>; Fri,  8 Jul 2022 19:22:49 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id l7so8483841ual.9
        for <llvm@lists.linux.dev>; Fri, 08 Jul 2022 12:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KjdJJnNYfFTc80MWbMvFSHF3iLrUy/06dP385MJf4EY=;
        b=RqE3+9iDIBuV9P/H/X8NorN4AxJ4pOYOR/f/Y4mCoVCJVAnsimfkUwIjfJVBfKhObh
         G9HmmWICDUMwleIvu7uAwtvi11vmcFCRo6f4Ga9e3HjAYbygRPuIt5DtBrQgmpA/7ij2
         eXYnUp2bUblbQ4NgDC2/+KgCaJN3FNYwwmj9c32m8k9C9St4hBM+NDHuNAQXmpL+jMJA
         J9Q91Qi4N/gnJzbBxmJsk+FtQxXRt/eeLBfV8/mnEnizhn2gVK3yHbsK38JhHc4JGpML
         FCiwv8Kv/UcUKVQz6TT8dgZDXCJtb2rPkrfVSzwjEEXL8/Li++LTpqo7T/cmWzBD6ski
         qgjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KjdJJnNYfFTc80MWbMvFSHF3iLrUy/06dP385MJf4EY=;
        b=MuxPr7rr/HEt96+CDnmfq46NLhscNzjgnZKJhlry8ohRRbmQ9Um5XFsx7pQT9BYnn1
         3w7XVZenX5JXqDB9Ice67EyI4aUKh4WkMaq3miELj22FKBJEk0k/hzT1zRNyDErFrwW+
         jIx642ZjAqYiLrsVi70rKgVCjDQG6WnFn+sX0D3gEO0HDCYLII9dnF6C1ByYA5tR+1Y/
         M7nBCh3NtkWzZJQY6DMD+DLfks1nLL9DKK9w4S7EHWYygt2JMgHTvcTFl6TR1RPwL1Ay
         bP0rnRV6qHjC0YJwoWQ+Ebh4jC38QhYFisXosSHFbiFw3PoUXGbXr25JHKEJUir6TB8A
         +G2A==
X-Gm-Message-State: AJIora8/cLjFHCh8Zb7xgN9TwsCh9eDRrLO1hB00a4jDd9H7ypQx0J7F
	LDSUop2J/1yEFLRp6h87cnoyXTGIH1fv7fGeksVNiaYSb+0=
X-Google-Smtp-Source: AGRyM1vPAsbiJRZN3j4VYw8owuXiI7VD+99qrkZder6QXP/hqsMAGtPzpONDtXzaPHxocbCaAEOzQXle7g/c6tLMsbM=
X-Received: by 2002:a9f:3155:0:b0:382:9191:6c4d with SMTP id
 n21-20020a9f3155000000b0038291916c4dmr2225193uab.98.1657308168246; Fri, 08
 Jul 2022 12:22:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1791141562.180.1657258946129@jenkins.jenkins> <CAKwvOdkGvW+2RJSJeraUr_Z0N2GE8PEKsMY-k6coSjWE3mXySw@mail.gmail.com>
In-Reply-To: <CAKwvOdkGvW+2RJSJeraUr_Z0N2GE8PEKsMY-k6coSjWE3mXySw@mail.gmail.com>
From: Yury Norov <yury.norov@gmail.com>
Date: Fri, 8 Jul 2022 12:22:37 -0700
Message-ID: <CAAH8bW-HeaysO46Ser4aV58Jn0a+D3fbQiMk=-fcqX0SM=z1Ew@mail.gmail.com>
Subject: Re: [TCWG CI] Regression caused by linux: lib/bitmap: Make length
 parameter `len` unsigned
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: ci_notify@linaro.org, Paul Menzel <pmenzel@molgen.mpg.de>, llvm@lists.linux.dev, 
	arnd@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 8, 2022 at 12:15 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Thanks for the report! Looks like Paul has a v2 that fixes this:
> https://lore.kernel.org/lkml/20220708075239.9057-1-pmenzel@molgen.mpg.de/
>
> On Thu, Jul 7, 2022 at 10:42 PM <ci_notify@linaro.org> wrote:
> >
> > [TCWG CI] Regression caused by linux: lib/bitmap: Make length parameter `len` unsigned:
> > commit aaa4ab5ec04480fd0c16c7452d28444c862b2b87
> > Author: Paul Menzel <pmenzel@molgen.mpg.de>
> >
> >     lib/bitmap: Make length parameter `len` unsigned
> >
> > Results regressed to
> > # reset_artifacts:
> > -10
> > # build_abe binutils:
> > -9
> > # build_kernel_llvm:
> > -5
> > # build_abe qemu:
> > -2
> > # linux_n_obj:
> > 547
> > # First few build errors in logs:
> > # 00:01:34 lib/bitmap.c:351:6: error: conflicting types for '__bitmap_set'
> > # 00:01:34 make[1]: *** [lib/bitmap.o] Error 1
> > # 00:01:37 make: *** [lib] Error 2
> >
> > from
> > # reset_artifacts:
> > -10
> > # build_abe binutils:
> > -9
> > # build_kernel_llvm:
> > -5
> > # build_abe qemu:
> > -2
> > # linux_n_obj:
> > 564
> > # linux build successful:
> > all
> >
> > THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.
> >
> > This commit has regressed these CI configurations:
> >  - tcwg_kernel/llvm-release-arm-norov-allnoconfig
> >
> > First_bad build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-allnoconfig/1/artifact/artifacts/build-aaa4ab5ec04480fd0c16c7452d28444c862b2b87/
> > Last_good build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-allnoconfig/1/artifact/artifacts/build-dc34d5036692c614eef23c1130ee42a201c316bf/
> > Baseline build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-allnoconfig/1/artifact/artifacts/build-baseline/
> > Even more details: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-allnoconfig/1/artifact/artifacts/
> >
> > Reproduce builds:
> > <cut>
> > mkdir investigate-linux-aaa4ab5ec04480fd0c16c7452d28444c862b2b87
> > cd investigate-linux-aaa4ab5ec04480fd0c16c7452d28444c862b2b87
> >
> > # Fetch scripts
> > git clone https://git.linaro.org/toolchain/jenkins-scripts
> >
> > # Fetch manifests and test.sh script
> > mkdir -p artifacts/manifests
> > curl -o artifacts/manifests/build-baseline.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-allnoconfig/1/artifact/artifacts/manifests/build-baseline.sh --fail
> > curl -o artifacts/manifests/build-parameters.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-allnoconfig/1/artifact/artifacts/manifests/build-parameters.sh --fail
> > curl -o artifacts/test.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-allnoconfig/1/artifact/artifacts/test.sh --fail
> > chmod +x artifacts/test.sh
> >
> > # Reproduce the baseline build (build all pre-requisites)
> > ./jenkins-scripts/tcwg_kernel-build.sh @@ artifacts/manifests/build-baseline.sh
> >
> > # Save baseline build state (which is then restored in artifacts/test.sh)
> > mkdir -p ./bisect
> > rsync -a --del --delete-excluded --exclude /bisect/ --exclude /artifacts/ --exclude /linux/ ./ ./bisect/baseline/
> >
> > cd linux
> >
> > # Reproduce first_bad build
> > git checkout --detach aaa4ab5ec04480fd0c16c7452d28444c862b2b87
> > ../artifacts/test.sh
> >
> > # Reproduce last_good build
> > git checkout --detach dc34d5036692c614eef23c1130ee42a201c316bf
> > ../artifacts/test.sh
> >
> > cd ..
> > </cut>
> >
> > Full commit (up to 1000 lines):
> > <cut>
> > commit aaa4ab5ec04480fd0c16c7452d28444c862b2b87
> > Author: Paul Menzel <pmenzel@molgen.mpg.de>
> > Date:   Thu Jul 7 23:50:52 2022 +0200
> >
> >     lib/bitmap: Make length parameter `len` unsigned
> >
> >     The length is non-negative, so make it unsigned, and adapt while
> >     condition accordingly.
> >
> >     Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
> >     Signed-off-by: Yury Norov <yury.norov@gmail.com>
> > ---
> >  lib/bitmap.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/lib/bitmap.c b/lib/bitmap.c
> > index b18e31ea6e66..0746beb336df 100644
> > --- a/lib/bitmap.c
> > +++ b/lib/bitmap.c
> > @@ -348,14 +348,14 @@ int __bitmap_weight(const unsigned long *bitmap, unsigned int bits)
> >  }
> >  EXPORT_SYMBOL(__bitmap_weight);
> >
> > -void __bitmap_set(unsigned long *map, unsigned int start, int len)
> > +void __bitmap_set(unsigned long *map, unsigned int start, unsigned int len)
> >  {
> >         unsigned long *p = map + BIT_WORD(start);
> >         const unsigned int size = start + len;
> >         int bits_to_set = BITS_PER_LONG - (start % BITS_PER_LONG);
> >         unsigned long mask_to_set = BITMAP_FIRST_WORD_MASK(start);
> >
> > -       while (len - bits_to_set >= 0) {
> > +       while (len >= bits_to_set) {
> >                 *p |= mask_to_set;
> >                 len -= bits_to_set;
> >                 bits_to_set = BITS_PER_LONG;
> > </cut>

Hi Nick,

I already removed this patch. It will propagate in Monday's -next
release, I think.

Thanks,
Yury
