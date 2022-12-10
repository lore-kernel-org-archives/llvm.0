Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E83BEBC
	for <llvm@lists.linux.dev>; Sat, 10 Dec 2022 04:13:57 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-3c090251d59so76756757b3.4
        for <llvm@lists.linux.dev>; Fri, 09 Dec 2022 20:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ulh9++McEWHTOB6P5Ka9efyv+3TP8QPl365askkEGq0=;
        b=mvrQxKIdQOElepQpJg4WS4ziBVtlbOrqfbO4vOBulo9R1mBEsanZDv0fE32SVgrfkS
         2rE22wEBnTwI/hCNIj9UF3eIEZ648J4344ps9vRQYcO6Nv01JmEibNn1PJ8gRH4ZBYYe
         rVX4sVNuPaqB4S9Pb+DDF1aahut0DIf9+pcbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ulh9++McEWHTOB6P5Ka9efyv+3TP8QPl365askkEGq0=;
        b=QJGDysct7JERHACTk/wQYAYzUSLkW4aW88jCrtMY5Ee1t/Trt4Qzz2zH8aN1II3XPI
         dmBfKLCUTg1MXVp200CwbvDK2oHZ/6lJfBNzIKTwl/WKx+4gaz4P00DYpZzv9OJF7V2a
         7/yLXXhdC0ORfm3WoZ/MeNfxg4PX0Zxnnh8VFfOza7oJ6XCkCQI/0lh7ucO1tne1wSs9
         G4eQ3oSxzfi95XJ1ujJm+XNI6OKsJ8D4+N023I2BQIFnPCuIpYOkI6pw3vzmr6L8FDwP
         vrexajxL7RQIbNHHnpQngC7S+T2iMTdk6XSNksMK5BGfgrv0LBjFyc6LtNKXMgqFb8bO
         hKSA==
X-Gm-Message-State: ANoB5pkiqsyqBiYgGyFhhGJeYcCvmNZ0MbCVXa98DaHVJ3mZnMDTMEV4
	4D9L0GR17V2Et25ZGuzD1cpTfispaQW5I9Pjyh0IUg==
X-Google-Smtp-Source: AA0mqf7dx5jjunaFJZjtrPR2XLjbxLbkIeL3qmdNqILQwcA/YZNLbCMwbWD2LXY2kj/nq4/AC3BtcFd5bvgudEYX2/E=
X-Received: by 2002:a0d:d988:0:b0:3eb:447b:6840 with SMTP id
 b130-20020a0dd988000000b003eb447b6840mr17744763ywe.307.1670645636141; Fri, 09
 Dec 2022 20:13:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221202184525.gonna.423-kees@kernel.org>
In-Reply-To: <20221202184525.gonna.423-kees@kernel.org>
From: Daniel Palmer <daniel@thingy.jp>
Date: Sat, 10 Dec 2022 13:13:45 +0900
Message-ID: <CAFr9PXngqDMYNOsNSLNEq=sRY0JDhAn5H5vuMVZD2o1=W1iU_Q@mail.gmail.com>
Subject: Re: [PATCH v2] rtc: msc313: Fix function prototype mismatch in msc313_rtc_probe()
To: Kees Cook <keescook@chromium.org>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, kernel test robot <lkp@intel.com>, 
	Romain Perier <romain.perier@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Kees,

On Sat, 3 Dec 2022 at 03:45, Kees Cook <keescook@chromium.org> wrote:
> msc313_rtc_probe() was passing clk_disable_unprepare() directly, which
> did not have matching prototypes for devm_add_action_or_reset()'s
> callback argument. Refactor to use devm_clk_get_enabled() instead.

I didn't know devm_clk_get_enabled() existed. Learned something new. :)
Really nice that it fixes an issue and gets rid of a bunch of lines.

Anyhow, the change looks good to me, I build, boot and "does RTC still
work?" tested this so:

Reviewed-by: Daniel Palmer <daniel@thingy.jp>
Tested-by: Daniel Palmer <daniel@thingy.jp>

Cheers,

Daniel
