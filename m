Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26663225
	for <llvm@lists.linux.dev>; Thu, 14 Apr 2022 21:44:27 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id f5so89587ljp.8
        for <llvm@lists.linux.dev>; Thu, 14 Apr 2022 14:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=Hek4RZqzkIk1fdxlTyB0ChG7pMVQZDu+dlMopCeePEo=;
        b=mfZO6Euo7V0PTNbRIBdS8rHzWPkrMjWungRKEm/EWMdshAYbl6OHK+Q+oPKksm4zAr
         42bsM3pCnbTosBLDqqtdK1k1WES2zmeCD4L6T17yxnxvL2XsniikYEHK+wzfpEAs315M
         bl/q3TjtcIV1JuGB3oOLIQjXrIXrwhpUkAzv77hLiX4pfwDucJL9lh9tT7mT04aYTRkz
         KAVzLeJWeufsyVax51rF5xA3P9K6LdCsNykULIBw7qixblLTLHDqWcpgnvurFAsXU/Rr
         2J3BixMUCybcirG7yfymuqj3xrB1s+kEd8sLYwuoghriAe4IZaCdEbO9YyU8ZVAcHYGi
         phhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=Hek4RZqzkIk1fdxlTyB0ChG7pMVQZDu+dlMopCeePEo=;
        b=31Tjw/NglOdri+0LJRK1Rhgdw5Jq4X0y0Wvp7/FS2FRUtVJhtV1hckPbFur412pdre
         sGVaOTHFUKBZU34g1+xJ1EOqvlm/3GUQx8XyFh9OZmzyG/c03dtM2q8icqK0DUqS7tcL
         h8zZ68j6H2B+joE5jna3MVhn3aYR05MhkMhw5zGoiXP4Lf0rArx91yz23IUDXX8Q1Z6V
         vs4dFZtfMfLpL/9jZESMQKUDjePjcj+FYAIAHYE2vr32YVNjMxbeJuWsPe/6otKIXDLe
         +wojKvMN0RSnVPp8AamBX6A+KhCgM0O/fWKloO/eUTKck2nbNM3EOCl7f6YZiAI8CzFi
         ICgg==
X-Gm-Message-State: AOAM530kFkf12RYslhK3H8EKFPZsMQI4m9CjpCsM5bpzV24rSj7NG5p2
	EXbRFtr4p62gjiEdRHAZnwODcBjVkFRRkysbUk/FMfyxVnvBxA==
X-Google-Smtp-Source: ABdhPJzC1+ZRz24uKBYTn5bE4zz34jaaQE1S4J9EGwA53RxyKlVHjVQxyet1IHf3CWLS/GmzvKrjDaE5u6EqH6mYJK0=
X-Received: by 2002:a05:651c:1185:b0:24d:a008:46f0 with SMTP id
 w5-20020a05651c118500b0024da00846f0mr1842748ljo.408.1649972665591; Thu, 14
 Apr 2022 14:44:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 14 Apr 2022 14:44:13 -0700
Message-ID: <CAKwvOdmumch3vnv_qL7m+h1szDgbFZj-ATrufvKKR8i-8jdkAQ@mail.gmail.com>
Subject: kernel.org binaries and sysroots
To: Arnd Bergmann <arnd@kernel.org>
Cc: "Jose E. Marchesi" <jemarch@gnu.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Saleem Abdulrasool <compnerd@compnerd.org>, LKML <linux-kernel@vger.kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,
Jose and I are currently in the planning process to put together a
Kernel+Toolchain microconference track at Linux Plumbers Conference
this year (Sept 12-14) in Dublin, Ireland.

I was curious if you (or others) would find it worthwhile to carve out
time to discuss further kernel.org binaries (and potentially even
sysroots) at such a Kernel+Toolchain MC?
-- 
Thanks,
~Nick Desaulniers
