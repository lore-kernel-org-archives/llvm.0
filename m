Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D528812
	for <llvm@lists.linux.dev>; Fri,  8 Jul 2022 23:04:23 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id e12so64233lfr.6
        for <llvm@lists.linux.dev>; Fri, 08 Jul 2022 16:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2l/32KaCBo1gSq39GaNT7RII8LMqC8kr4XQZOQvnXOA=;
        b=T5uS1kD18NVnsKmEagPWyTdelnYLKtM90m6FoHdK/unrwhAVSiTrrhedEwNrVoTF0L
         zGONP9nESzjKhuWpUxxzu6HwGbN+BJnRrVTBHtH7FIosfOikPD3J7B2MB9+zpGg8/FCm
         AhaTHsKfDerEsQ1gKInRw8BHuSHKFXfzAowg4NkCn+3/Sg8fPVoKHbwo8Upcyfgn8tcH
         KSnWlUm87+uOlC31OazZU41M/gSfxcP5KFEexA4zLCZaAq0WPtYz+k+qu3cWyxyGIGxg
         krD9fb+HFwzQE+dL0o0ePR1knwoQOXnd5GiphU5rOASyN5sRDN7PKD6ryAlP+XpGkUb1
         FRNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2l/32KaCBo1gSq39GaNT7RII8LMqC8kr4XQZOQvnXOA=;
        b=8Q6BOyG2LQfOa62KP95Y4080x2E7w6nimY/2+Ta1KJN6CHDkHu6GVCrVbgTCTgG5gm
         kGCGc1KADbJCw0HloXAJi+sBXxjfrsS85PfHpNGOIaCb8Ng8R+hziv1o8nwtsvB6Da0C
         irzTD2H4RaTt97rQuhQd/fksvwCjPXz4E32HIDCpZ54IoU3nP8Qp35ehFQsqSFNnx3ze
         gT/US9soOe+Iaw4kshiwSw//i5WrLhKDvNQIQjL24sfDWsA2wqG7yCV0CrJk2DKmBnmh
         juWhkAHyvhy5s0yRUip/cA2DjdBwyF/c9ZI25Nq1+wSyT31HLeNMj7do3MmZOUhGAVGl
         kPFQ==
X-Gm-Message-State: AJIora9l328sRfdeVyp/+ppf3LM508T08KlkqW4kv+d25xe9rgWtDgcm
	Cax0zT3pRe95xxmD8f1T7igpNxsZH5iSprUU7+rmeg==
X-Google-Smtp-Source: AGRyM1tTcDEY1++IJMrqzp1Q4UfQpZq5Rn6/Yn4oIGFJw4jUkEPET+9M70VLB6Eeag4TdCWuKVPKTZkm9/RZ1yqWk9k=
X-Received: by 2002:a05:6512:1188:b0:481:2eb7:f2 with SMTP id
 g8-20020a056512118800b004812eb700f2mr3824575lfr.401.1657321461958; Fri, 08
 Jul 2022 16:04:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <17600de3-b295-ebdf-b9fa-323d2bc3cb93@arm.com> <20220623174131.3818333-1-ndesaulniers@google.com>
 <6b330119-fbf2-1c34-7ad3-0ae789658d22@arm.com> <bd4a9bad394b478f9ee0d9c0981948f8@AcuMS.aculab.com>
In-Reply-To: <bd4a9bad394b478f9ee0d9c0981948f8@AcuMS.aculab.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 8 Jul 2022 16:04:10 -0700
Message-ID: <CAKwvOd=kcROA30fmviABhfUiDX2v8QYLPPmUV0hnQ2A29tMtDQ@mail.gmail.com>
Subject: Re: [PATCH v5] coresight: etm4x: avoid build failure with unrolled loops
To: David Laight <David.Laight@aculab.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Arnd Bergmann <arnd@kernel.org>, Tao Zhang <quic_taozha@quicinc.com>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Tom Rix <trix@redhat.com>, "coresight@lists.linaro.org" <coresight@lists.linaro.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 28, 2022 at 2:40 AM David Laight <David.Laight@aculab.com> wrote:
>
> ...
> > > Regardless of which compiler or compiler options determine whether a
> > > loop can or can't be unrolled, which determines whether
> > > __builtin_constant_p evaluates to true when passed an expression using a
> > > loop induction variable, it is NEVER safe to allow the preprocessor to
> > > construct inline asm like:
> > >    asm volatile (".inst (0x160 + (i * 4))" : "=r"(__val));
> > >                                   ^ expected constant expression
>
> Can't you use (IIRC) an "=i" constraint with the C expression
> so that the compiler evaluates the expression and passes the
> correct constant value to the assembler?

Yes, though I think it may be even simpler for me to just use
__is_constexpr from include/linux/const.h here than try to rewrite the
existing macro soup to avoid calls to read_sysreg_s. Will send a
follow up.

diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h
b/drivers/hwtracing/coresight/coresight-etm4x.h
index 33869c1d20c3..a7bfea31f7d8 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -7,6 +7,7 @@
 #define _CORESIGHT_CORESIGHT_ETM_H

 #include <asm/local.h>
+#include <linux/const.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
 #include "coresight-priv.h"
@@ -515,7 +516,7 @@
        ({
         \
                u64 __val;
         \

         \
-               if (__builtin_constant_p((offset)))
         \
+               if (__is_constexpr((offset)))
         \
                        __val =
read_etm4x_sysreg_const_offset((offset));       \
                else
         \
                        __val = etm4x_sysreg_read((offset), true,
(_64bit));    \

--
Thanks,
~Nick Desaulniers
