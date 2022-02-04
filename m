Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9252F21
	for <llvm@lists.linux.dev>; Fri,  4 Feb 2022 00:28:02 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id l13so3689824plg.9
        for <llvm@lists.linux.dev>; Thu, 03 Feb 2022 16:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1vhgypBVUxatDQA2t/PEFyJq1Dz/oV4D6TAQvVZv0u8=;
        b=W0bGQxU2pU33Ei4vTMwb4LxDzrWE0EXjvMUkCBocmmMUvkaM2UsgQk5t3PALzqMv7A
         lwPd32y7m9eeQCbpVad3GG1/067X3mSlbKgu/pUqoqJwnR6nFSBetJG6JYl6+G+RMZX1
         qQ5u/9a9tlXqQzT9hGubw9MgAX/XtNzYaS4xc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1vhgypBVUxatDQA2t/PEFyJq1Dz/oV4D6TAQvVZv0u8=;
        b=ODUxswsxWQ1RG5onYmioWxZ2bO4MiQw6GneKfisdMlQVA1tmBX2M1Hrx/yWBHL6pdp
         W17hZ7H4bIqLKJ0BBwb2N/uKpEZ+iOW1h6fyN/TVnsbenSwwv1q4PAr/jAZj6XIvd0Pp
         a1uUV+avmDhKEzJIA0/9IE8Cs0dKzaEBtwA1XlzUuBSJkhlbf25eKS4eSFbKGLTQG8+W
         z2HbKYokBL+hMtVQFWoo96wJ1qL+4nWGvJMxXG0o3Jh537yBTWaXrq5i9aRYvDQyA6GD
         hmAeyTf/p3teasfY2XBHNX8YoqiqactpWMNMn4c78FcPorQWQHM7UfkJ3MoUPJNh3VWh
         E1Qw==
X-Gm-Message-State: AOAM531BTcjjxgITbhuQk6hXHE7lVNuwt8+te00tuz7aaLWigPSJS3po
	+6kPpadjFMSi/K2kbj4uaHsCaQ==
X-Google-Smtp-Source: ABdhPJzclz2hHFHcinwuT36MxYy5C66IRul1bzvGhtdzdI25zojLs1J2oEC8VA4G/XwZL8ZwyaFSNQ==
X-Received: by 2002:a17:903:183:: with SMTP id z3mr380439plg.127.1643934482295;
        Thu, 03 Feb 2022 16:28:02 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q16sm162686pfu.194.2022.02.03.16.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 16:28:01 -0800 (PST)
Date: Thu, 3 Feb 2022 16:28:01 -0800
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	George Burgess IV <gbiv@google.com>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: Re: [PATCH 4/4 v5] fortify: Add Clang support
Message-ID: <202202031627.0EEB393@keescook>
References: <20220202003033.704951-1-keescook@chromium.org>
 <20220202003033.704951-5-keescook@chromium.org>
 <CAKwvOdkvd=2DcwEpQWBtS3p-hKB6Rvp4YXB4k+81Me6E5H+mqQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdkvd=2DcwEpQWBtS3p-hKB6Rvp4YXB4k+81Me6E5H+mqQ@mail.gmail.com>

On Thu, Feb 03, 2022 at 02:13:33PM -0800, Nick Desaulniers wrote:
> On Tue, Feb 1, 2022 at 4:30 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > diff --git a/include/linux/fortify-string.h b/include/linux/fortify-string.h
> > index c45159dbdaa1..5482536d3197 100644
> > --- a/include/linux/fortify-string.h
> > +++ b/include/linux/fortify-string.h
> > @@ -2,7 +2,9 @@
> >  #ifndef _LINUX_FORTIFY_STRING_H_
> >  #define _LINUX_FORTIFY_STRING_H_
> >
> > -#define __FORTIFY_INLINE extern __always_inline __attribute__((gnu_inline))
> > +#include <linux/const.h>
> > +
> > +#define __FORTIFY_INLINE extern __always_inline __attribute__((gnu_inline)) __overloadable
> 
> Sorry, I just noticed this line (already) uses a mix of open coding
> __attribute__ and not. Would you mind also please changing the open
> coded gnu_inline to simply __gnu_inline to make the entire line
> consistent?

Ah yeah, thanks. Fixed.

-- 
Kees Cook
