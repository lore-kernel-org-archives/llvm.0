Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A9E1867
	for <llvm@lists.linux.dev>; Wed, 20 Apr 2022 18:14:55 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-e5e8523fcbso2809265fac.10
        for <llvm@lists.linux.dev>; Wed, 20 Apr 2022 11:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=Aeun89AbIezXrfDdIt+YaeWMoDF1kxccdnwQFEnnj18=;
        b=Wrp200wsDIrmmMXrnvcerlksFLuIzM6xiTFSrVXUbwkq9jcaXTqKwqM3c2qMahgOuk
         FDpUclGA2swBeffzjPS6YXM8rMdaMXHliR1x1WMSftvPkojKml0uXrGTY/bEpReLdiXe
         bWz3RNyqmZYKGt9Mj/nZ8qNNSDaA0e6I441TBKZBtyaHJETZ/rDSVEMeAjfeptLMySSm
         KDhpAn9G0B58fkKYaphWGNw9Kkp8BhKUt3pFGJO9SVv+BUBTYITYe1uRsGgdJmFPQEuj
         chG34tAcHF72ytRKfzSGfYq3tUSjZQ0zCxR6gmkcFDk5MgHSY8qN4wIc7IvFLQe6FYHG
         37uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=Aeun89AbIezXrfDdIt+YaeWMoDF1kxccdnwQFEnnj18=;
        b=0XYOR+wETC9niXmtH5ZgusB90k4V4OvWfav4Gbjo6rMb21NeB1+aTU4G09gdqkpLUs
         jmMMoLyL/HAf9fblI4gKKpLp9zGLfINk+BT8+JGIL5on885sXviwHBifTlsw0TTxHr4C
         yZdZ+Czbl71bziAJAAzPNYGh3AUnkAbwP3f/GSRiUwNvtpRVSAsNbSbDkfO24cZ34uKU
         Lijgj2CjaicK5WMuVEZ4E49uxc+W1sEE5Nc3moXf2HxNSciD2eDRf2hm8P57Ln3u+OCX
         PhyCvJ9iSjOKHgz88uLkPozDmqRtC5gybjvue3tGOYruvmx/WN0oEEsD67HaXrcymvYE
         GCnA==
X-Gm-Message-State: AOAM530/PHdM3zQD9sCJCMM3p1VQcR04pLd00e3dDxJJar8ltEkripF7
	AHngdHYCdVTSpN/E0bP9d+ny1tJvkn7ckEU+TqghjA==
X-Google-Smtp-Source: ABdhPJyFOzkGagGtzOCMreGveolweWFdGEHZFUqCsob2xUXn37YIG7GdWajfOFgADT+acsUDRYcg/jwVY9yWkopT2c0=
X-Received: by 2002:a05:6870:315:b0:e6:15d1:11a8 with SMTP id
 m21-20020a056870031500b000e615d111a8mr2260548oaf.289.1650478494062; Wed, 20
 Apr 2022 11:14:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 20 Apr 2022 11:14:43 -0700
Message-ID: <CAKwvOd=nEddFaTVQ80JrHcpjVv34=EhxJ9bb7rUFrRapuGFj2A@mail.gmail.com>
Subject: Fast Kernel Headers talk @ Plumbers?
To: Ingo Molnar <mingo@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	"Jose E. Marchesi" <jemarch@gnu.org>, clang-built-linux <llvm@lists.linux.dev>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Ingo,
Jose and I are currently in the planning process to put together a
Kernel+Toolchain microconference track at Linux Plumbers Conference
this year (Sept 12-14) in Dublin, Ireland.

We were very excited to see numbers posted about improvements to
kernel build times from your work.  If you're planning on attending
plumbers and our MC gets approved, would you be able to present on
this work?

Would others be interested in such a topic?
-- 
Thanks,
~Nick Desaulniers
