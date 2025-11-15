Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D079522FE11
	for <llvm@lists.linux.dev>; Sat, 15 Nov 2025 23:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763248821; cv=none; b=onANFZduYRqiX4qiS+5E5iNKzXrf2fyzl30lYQTv0t0JE5x2Yq8RW1Zi6tquyibng6AryMsMpisJQLM7Tu1Sc2a06DPY6WHS34T7qqdK//5+Q+ybC58OLhQyvK3N7fmK6Ne2/Ul5dY/AsTMhw+5nEqbovbxhE6up02fQZoo9PDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763248821; c=relaxed/simple;
	bh=pum41SKQLkewMZV7DS9PT0wZ+5r+WBa5VedGl9TB3KI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i0fWa56gHgScWQMEgrqLKwT7HHryhN9XwId3WSscMxYCsnhk4zvDYWflJn67JEYhru4gB+yExrn7ciFFlmXPV2LqkgtEvl2KQPwD2EJoy+jlTmndVBNvUeaKhKSE7xNw8Fq37y6FVv3i8HK6GXRsprxjWnpB+jOhKwBRnZJGId4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=R6t8Xwr1; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="R6t8Xwr1"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-64175dfc338so5997461a12.0
        for <llvm@lists.linux.dev>; Sat, 15 Nov 2025 15:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763248818; x=1763853618; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1nG48T3PKR9DL3eRjQ/rPhDhCItZZXCtoC3T/QZzPjg=;
        b=R6t8Xwr1xn2l0sa4QqbOUWYcgXIkAQqaCcI1iaZu79mbdYMMvcluV4+GiGsYaXKzCU
         LRqIc+jkX3+NbiuxtKNKuy8GBq3M28trl6ZuE4Ne5uUUgGSzNizXUjz3E7c99cgWIrNR
         9UdTcnNDPk10ASdf4/00XstkTQI8R9F48Yrgl5F3zhF7jWb7TVhjrsXxGnQxfrQnJQJs
         UjjVxcTo0motmo5dGpQqH213B2b1Zodb2CcWCILaVFzy0xAO6mbJZ+fd0EVY50W9Qet0
         0miLLztJAf2UD2fRboJOGKy/Z7HE2yfG0s36Dmmg8hT18/FJ0XU+uNchvss8pqG0i9ex
         oTbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763248818; x=1763853618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1nG48T3PKR9DL3eRjQ/rPhDhCItZZXCtoC3T/QZzPjg=;
        b=a1UZG6uRNRg29un75s1Xf1PuWUCXXNphjLsRYKi7IP5iWP7D67GgOejF2zHWQLpUSB
         vEdKk6jFReRXSfeEI5s4ygllUCPPJABx3YHIu0vHTnZxJwPj/x6RVJoZfpyqo3YerfR5
         FfPDgiv0JTpUbjbbR7gFJB8CKmluOaacm6Fp9q5hawsD4HYIr3MpMIrVgADhvjw9Spsf
         5FNQ4pko8SeLHGEM2cjTTWlvzaiOr1aDTg7XwAhZX0ZYiUmGeEeEpXxmNT626RWg97f3
         yug0zer81ZbuA8caUBetFa19818VQG0EaUv26W+Y2feWjSJWmZbHocd70+XpHUEuh0c/
         gIhg==
X-Gm-Message-State: AOJu0YyjP5Pc0JMaXZtmctijYkiSoz/Ll6iuoNFzLrmqBTyMFyysTTE4
	8REPySFxyqLd+7u/QTVaTVc8qR8P+R7IFOmS6TnZ3EfriJfuOuVPnBipE0c5JsdmssIHNCUOqxw
	H1ziknZCbSpA/h0CyrGtVAd/oC+PQVz7/449gF4FJUL7CodTzRKxru6vbng==
X-Gm-Gg: ASbGncvLb0zKbuMX/GIy0BmnqtTugu+dUQKml0mlldk5elaIiAmJ3vCoQQ07uPLl88+
	IGyDsQd+V/aKbfLcHkddBN/SY6mqkGkIL42ex/FvVloqRXyzV7wYwprYUIofZXQy2ae6ccnJsJR
	uRW6m5tmZhaqSx6MA6DDLZSVmduQHtV3XkxYGYjh5hsvmZWyb0zLSohGZ9wWCAkpwoVAwH0WCxs
	qj8oZyO3t8HP8dFZs27g+2TU4s3xODKaWWZcsfBC6xG21VBlmP2f0i10gaM0HhhPmZN
X-Google-Smtp-Source: AGHT+IGTBT8Fzma+3yYPpDFd+DD3iOx1Wb7+8bSARIoAOt6jXrmqBo207u3iTo22/gyCM7A/fxHKf2NFI2kGEtC+N6w=
X-Received: by 2002:a05:6402:144d:b0:63c:533f:4b25 with SMTP id
 4fb4d7f45d1cf-64350e2091cmr7747458a12.15.1763248817815; Sat, 15 Nov 2025
 15:20:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202511160314.OK0OGRXl-lkp@intel.com>
In-Reply-To: <202511160314.OK0OGRXl-lkp@intel.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sat, 15 Nov 2025 18:19:41 -0500
X-Gm-Features: AWmQ_bkBBHTdU9EPBD3bJZ0OQv8SlD-WQo6FALKyAXAkJ9Vd56KVKAMzZ43naZo
Message-ID: <CA+CK2bBgXDhrHwTVgxrw7YTQ-0=LgW0t66CwPCgG=C85ftz4zw@mail.gmail.com>
Subject: Re: [akpm-mm:mm-nonmm-unstable 82/133] include/linux/kexec_handover.h:108:7:
 warning: no previous prototype for function 'kho_alloc_preserve'
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Pratyush Yadav <pratyush@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 15, 2025 at 2:06=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-no=
nmm-unstable
> head:   4fc88c237bfe11bde443e104428aac56e63a997f
> commit: 88316955b5b1b4cb0cb2fad416f7e8dde9b246a0 [82/133] kho: introduce =
high-level memory allocation API
> config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20251116=
/202511160314.OK0OGRXl-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0=
bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20251116/202511160314.OK0OGRXl-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511160314.OK0OGRXl-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    In file included from mm/mm_init.c:33:
> >> include/linux/kexec_handover.h:108:7: warning: no previous prototype f=
or function 'kho_alloc_preserve' [-Wmissing-prototypes]
>      108 | void *kho_alloc_preserve(size_t size)
>          |       ^
>    include/linux/kexec_handover.h:108:1: note: declare 'static' if the fu=
nction is not intended to be used outside of this translation unit
>      108 | void *kho_alloc_preserve(size_t size)
>          | ^
>          | static
> >> include/linux/kexec_handover.h:113:6: warning: no previous prototype f=
or function 'kho_unpreserve_free' [-Wmissing-prototypes]
>      113 | void kho_unpreserve_free(void *mem) { }
>          |      ^
>    include/linux/kexec_handover.h:113:1: note: declare 'static' if the fu=
nction is not intended to be used outside of this translation unit
>      113 | void kho_unpreserve_free(void *mem) { }
>          | ^
>          | static
> >> include/linux/kexec_handover.h:114:6: warning: no previous prototype f=
or function 'kho_restore_free' [-Wmissing-prototypes]
>      114 | void kho_restore_free(void *mem) { }
>          |      ^
>    include/linux/kexec_handover.h:114:1: note: declare 'static' if the fu=
nction is not intended to be used outside of this translation unit
>      114 | void kho_restore_free(void *mem) { }
>          | ^
>          | static
>    3 warnings generated.
>
>
> vim +/kho_alloc_preserve +108 include/linux/kexec_handover.h
>
>    107
>  > 108  void *kho_alloc_preserve(size_t size)
>    109  {
>    110          return ERR_PTR(-EOPNOTSUPP);
>    111  }
>    112
>  > 113  void kho_unpreserve_free(void *mem) { }
>  > 114  void kho_restore_free(void *mem) { }
>    115
>

Sorry, missed "static inline"

For, this another warnings:

diff --git a/include/linux/kexec_handover.h b/include/linux/kexec_handover.=
h
index 38a9487a1a00..dde952227b88 100644
--- a/include/linux/kexec_handover.h
+++ b/include/linux/kexec_handover.h
@@ -105,13 +105,13 @@ static inline int kho_unpreserve_vmalloc(struct
kho_vmalloc *preservation)
        return -EOPNOTSUPP;
 }

-void *kho_alloc_preserve(size_t size)
+static inline void *kho_alloc_preserve(size_t size)
 {
        return ERR_PTR(-EOPNOTSUPP);
 }

-void kho_unpreserve_free(void *mem) { }
-void kho_restore_free(void *mem) { }
+static inline void kho_unpreserve_free(void *mem) { }
+static inline void kho_restore_free(void *mem) { }

 static inline struct folio *kho_restore_folio(phys_addr_t phys)
 {



> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
