Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6791368
	for <llvm@lists.linux.dev>; Thu, 26 May 2022 16:42:33 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id t5so2492176edc.2
        for <llvm@lists.linux.dev>; Thu, 26 May 2022 09:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CS+0C9116uvsXBY7Qgz+7y8K9WB8FdT9j6xZ5iT4ego=;
        b=La+B/5HOPMqeQ2jcp0ah8wbzOcZKyNemQaHwQ4VCK7IBBU57xfK48vqU0oScXSzYwP
         5FnoG3FzyCWct1+Ebttkf5m6Z2FAUua2Tu7YIIk+bRLhRZQRZZpI0mB4N9bHIjQHTMOA
         Fnw2mLEgcWV/Qt2LRpttaqkCrTmAhUxy6QssE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CS+0C9116uvsXBY7Qgz+7y8K9WB8FdT9j6xZ5iT4ego=;
        b=NgzDG+62DbLNTU+ADWCb50Quzeti4i7dUaSl4vxhv795eiFLvrLl+jaxpGbJCAA1Sz
         IEZctI3hrdXzsuyYtE29TqjFfaRuhNaoWb4FIRa7ZYAPsj+s7wzJhY3sQYSDXS4qtWEv
         tkanKe4MvoDMpL1q8PRzLyO3P9GyappzT1+ivMcUctzby8EXsoPvqwhEmC534kvnKU8T
         a468CZU/Q5XaGhmWpPdW0/x4WfBW4CjMOK5UJHUKNu/WAH5iLfsQIwtE3N+q96/JeZ2r
         VTjNpAlpeQf+ljz9eQQmtTuiyxPHtShX//kxtz44UD/j9UuiTzfi8o9MjzKJLPBkGBqz
         t27Q==
X-Gm-Message-State: AOAM530rV4LMIMdA3Qfc3DvvNC84O1sgeDmKzexxSZjYPlafwhVIzEce
	LL9i+w9UOVMAPkV2lL3WRWODgdMmwOZn7otOlu8=
X-Google-Smtp-Source: ABdhPJxE8rUpL6LuDn/yF/HNi53ZdwXkdZDPa86fXNZ0Bo6XydiWtGcP/trZKWk4SmMTm+ospp9cOw==
X-Received: by 2002:a50:9b11:0:b0:42a:c1b2:b2ca with SMTP id o17-20020a509b11000000b0042ac1b2b2camr39829284edi.313.1653583351542;
        Thu, 26 May 2022 09:42:31 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id c2-20020a17090603c200b006fea59ef3a5sm673942eja.32.2022.05.26.09.42.30
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 May 2022 09:42:30 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id t13so2813668wrg.9
        for <llvm@lists.linux.dev>; Thu, 26 May 2022 09:42:30 -0700 (PDT)
X-Received: by 2002:a5d:6da6:0:b0:20f:bc8a:9400 with SMTP id
 u6-20020a5d6da6000000b0020fbc8a9400mr25553633wrs.274.1653583349904; Thu, 26
 May 2022 09:42:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220526151706.331557-1-helgaas@kernel.org>
In-Reply-To: <20220526151706.331557-1-helgaas@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 26 May 2022 09:42:13 -0700
X-Gmail-Original-Message-ID: <CAHk-=whP4fH1_ZyWFAvzBjG_Qa1U0+iAnT-iJsmM9DwvNEtWdw@mail.gmail.com>
Message-ID: <CAHk-=whP4fH1_ZyWFAvzBjG_Qa1U0+iAnT-iJsmM9DwvNEtWdw@mail.gmail.com>
Subject: Re: [PATCH v2] linux/types.h: Restore __bitwise__ definition
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	"Michael S . Tsirkin" <mst@redhat.com>, Jiri Slaby <jirislaby@kernel.org>, llvm@lists.linux.dev, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, May 26, 2022 at 8:17 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> Restore the __bitwise__ definition.

Thanks, but I already ended up applying this yesterday,

                   Linus
