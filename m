Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9387929CA
	for <llvm@lists.linux.dev>; Fri,  1 Oct 2021 17:18:34 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id e15so41449966lfr.10
        for <llvm@lists.linux.dev>; Fri, 01 Oct 2021 10:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eaKHWjFuwyKvxPTNwNYn3BuRwzDh6/0sQ7VogCTPG8s=;
        b=j2KIPK1abEQDmLX+us5yk2H9k7jh1igya3VQ/oN9xVeP/qTGNtdxRNyctZTVU85ui4
         xJIne31y6CyFJpieB6eP/2bh3PDy2m50SAmRYu/ijUYYq/iLj/yL5d/M3vedeb2FDDBi
         4M4zEQTrzvyjXCojCxFwNvT+AIyJQ+AbJKDcjVtL4fyBBIxqFtpMz+OuKpDXtE/4WDyj
         aj81I2Q052BvWtna4cBQGC+BcoNJcbiQKs+8whfG71t9o3RN64MYTrBs6Wf3/x1Cdjem
         fpYF8ocFQNb/dSQ/fnx2U8zZijmANqJ+ivamgVGDnPWtYQWXmPz/QMBvaFB44GKew4qr
         1ykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eaKHWjFuwyKvxPTNwNYn3BuRwzDh6/0sQ7VogCTPG8s=;
        b=UIsYuAcRJTH/C/U2SCXvWc2Kfcy35w3oXr+U3+/3I+ySLdfR//zhRqS5VLqSAlqz5k
         fwgff3EXYgaqg7t7fX7PSOYLeNngxhfevlc10imJxuVBFvGgpJZWWYnkfkQzCWbnJc9r
         vtMO5KwCBs82/2ThI9lOt9w5p96XB1+2MiuEjnD4lU4Wx8Ge+/FFo+a3z2AV8RAJ6nPG
         W/Ba1WCaePNZDLzw1Mly6tQ8a8EU5/RWdFZbmb/7uOcu1GgaKEg8TY1HBgaOb0HoigMr
         +Bm9D+LNJvX3+ZNEGn6dh/fldy991LHMHDkuQ6Yc0fRuNvbTIN0xsdDsRjNxnrVM8/qX
         aFzA==
X-Gm-Message-State: AOAM533C7NONqeZt6UkoslUJSUQ5FtMeViekS0OoUnx7m8n63ZHor6ms
	AO17qWTPsnfHORkim1zQm+1miSSj4DEE7kSMCm9+SA==
X-Google-Smtp-Source: ABdhPJziBYyBg1MdhYdRfe+e6ZE01VBv+2vQ9vu2x8Ts5SH8U70CKxzXlOdmOq32hDBm3FqbdLKCLOzfyMCGxpPbV9g=
X-Received: by 2002:a05:6512:110a:: with SMTP id l10mr6525108lfg.550.1633108712320;
 Fri, 01 Oct 2021 10:18:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210827153409.GV1721383@nvidia.com> <878rzdt3a3.fsf@intel.com>
In-Reply-To: <878rzdt3a3.fsf@intel.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 1 Oct 2021 10:18:20 -0700
Message-ID: <CAKwvOdkVAKOCH1hfSqNphKco8rLOmyAg0PVGzmpMRu6Svs1hSQ@mail.gmail.com>
Subject: Re: [vfio:next 33/38] drivers/gpu/drm/i915/i915_pci.c:975:2: warning:
 missing field 'override_only' initializer
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, kernel test robot <lkp@intel.com>, Max Gurtovoy <mgurtovoy@nvidia.com>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, Alex Williamson <alex.williamson@redhat.com>, 
	Yishai Hadas <yishaih@nvidia.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 1, 2021 at 4:04 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> Anyway, we've got
>
> subdir-ccflags-y += $(call cc-disable-warning, missing-field-initializers)
> subdir-ccflags-y += $(call cc-disable-warning, initializer-overrides)
>
> in drivers/gpu/drm/i915/Makefile, so I wonder why they're not respected.

You do have to be super careful with `:=` assignment in Make;
generally folks mean to use `+=` and end up overwriting the existing
KBUILD_CFLAGS.  I'm not sure if that's the issue here, but it's worth
an audit of your Makefiles.
-- 
Thanks,
~Nick Desaulniers
