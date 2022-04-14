Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633953225
	for <llvm@lists.linux.dev>; Thu, 14 Apr 2022 21:30:47 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id h11so7623430ljb.2
        for <llvm@lists.linux.dev>; Thu, 14 Apr 2022 14:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=nj37mJGFxeaaCkwLeuwqWm1g7ahychPhmNkOI5dR3ds=;
        b=SwzM+kDG244qvAlk81Kzb7jv3jo9bS70fWhEtYwXqtm+KXlXhViG7y3/nT1CB3u58z
         J7kXl/3ZGOUj1EHYa2pH4oPGmBFoKhbQuY9dXdT/K1aLSG+uwo7KbSBbNLUHEFAFm1Xk
         JXFfL/BFMbcxJW4CLX0rcWmruwDcONxWX8gpqtwbTnokGfkGnZXVcMH5sC+oGnN9x14g
         Gb+XpWC6a+vv5tq/AR2RFonjnylMv97WlZZ/sHT8xirmgWZ7AP6yX+ii+eqBk25MrMv5
         ZAAqTyRFv5arJlLD4AqBJNT48kUEj16407m5X/BfH+IB3phccmmLwYqukwMhrfAe/znY
         WCUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=nj37mJGFxeaaCkwLeuwqWm1g7ahychPhmNkOI5dR3ds=;
        b=jW6E6wiQvKEogualYdjm46aT6Xzc/S7ihJb+XSYzcl0F6ueWtNIhqlnnRQF/dhIn4r
         HJVCS33KHJi91V9QGM2JxQ5GSTG2aEHsSDrCKmcA9CeDkvFfz47vSzTtRCCfEugsoi9a
         xOz3Tzl47i9f9N42D5jWbEIIbIPywQePwp2vB2hAUUGgbWBWQtXcU8um/T8U3AHkt6u5
         ckLH/jmfQcCaQT+A/DW2fR8Fuw4/csgGlr8kV+n/jfCgOngH4DebjDzmheAPp3m/WWTa
         ryk+tc1p69ZwdrmFdX+SJeX0gd+P+vnvNJv3tnrzqyejGTqBAmWHfiyQgorRDZWuMFsB
         3d7g==
X-Gm-Message-State: AOAM532nL+oZiXCoxzERr7ZwJNnjqi5+bIrtWlZs13ejmFKqmzYGq3aL
	atIApqxj5clqe0J1l2aVfGtK6nEpRNb07/tg5D/+f/GHHXnvyw==
X-Google-Smtp-Source: ABdhPJxPS2QvyVN47bMyTQZoKgjfDFLroQlH4A7AyIN0YFxZMQTVLkXYHXNZv6tDsX2UV90960wH9W3lFhk2hVuHbQ8=
X-Received: by 2002:a05:651c:555:b0:24b:15b7:74ad with SMTP id
 q21-20020a05651c055500b0024b15b774admr2684739ljp.239.1649971845219; Thu, 14
 Apr 2022 14:30:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 14 Apr 2022 14:30:33 -0700
Message-ID: <CAKwvOdniB-+F37ygZhRytBGVFjwnukyOpmoiJTCeusMdb=6_=g@mail.gmail.com>
Subject: toolchain mitigations plumbers session
To: Qing Zhao <qing.zhao@oracle.com>, Kees Cook <keescook@chromium.org>, 
	Bill Wendling <morbo@google.com>
Cc: "Moreira, Joao" <joao.moreira@intel.com>, clang-built-linux <llvm@lists.linux.dev>, 
	LKML <linux-kernel@vger.kernel.org>, "Jose E. Marchesi" <jemarch@gnu.org>
Content-Type: text/plain; charset="UTF-8"

Hi Qing, Kees, and Bill,
Jose and I are currently in the planning process to put together a
Kernel+Toolchain microconference track at Linux Plumbers Conference
this year (Sept 12-14) in Dublin, Ireland.

Would you all be interested in leading another session on
kernel+toolchain collaboration for mitigations? Do you plan to attend
plumbers this year which will be in person?
-- 
Thanks,
~Nick Desaulniers
