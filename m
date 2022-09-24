Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE88417E6
	for <llvm@lists.linux.dev>; Sat, 24 Sep 2022 14:58:56 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id x1so2604136plv.5
        for <llvm@lists.linux.dev>; Sat, 24 Sep 2022 07:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=A4T+kyw377orQQtPiOvYt9e0D29BYPUlLzt2R5wjAss=;
        b=R1sH2TkWj77H3g/bP3nEOSG0YjWqrb+dM9Ntz02b5KBX5jfO3NsMPm5ze66YWrNR9f
         kdRjg9teybAjH55Wkx5f24ieS2aYd4fqgbCfkeFroTeLH1t3Gbef/8x5f4zvcu1YAVzo
         ABxk2hoi5oOIk4sKmgcOCR0iftwfAYJmOwySE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=A4T+kyw377orQQtPiOvYt9e0D29BYPUlLzt2R5wjAss=;
        b=T49Cd6QnXFhGt2/Npd4Fmt1IHgYKpw+y0F8tCqURqP+ftcTg78s5v7Q0zxjAvM3H2U
         Oiip4nD9TIhSDkrSzVkgTami85sMJf0h3e90LYb2XIzHO9MUF4ZxWhxl37D/uGoqcZd+
         tVILM5djTbvWevmj8j53h/w3GclSVTmlC8Q/hdfBxiPypspaj+LePhPCMZxfJyKuWzbS
         Lq7VShwW8ZtGrUpj8Qb1W2nxGdhOtkYvQLvo0nm5SW988WH2xKGa9Dktj/NMv8kKzVRB
         8pMX6618vXhVuvGVUyCr1d/oc3FOgWn2ET53v+LksOypPJ6q2rFMMbn/gsGc1Jv1Vm3p
         CKGQ==
X-Gm-Message-State: ACrzQf3hANHynmL/skALKPvr2CpIUdiNnXEkEEW3ocL0l5gWH2iLh8hR
	y3lFM9UKPb5tojGDs+eTOKIpYA==
X-Google-Smtp-Source: AMsMyM7kevo+f32kAEhGZsgaVY0iUt0RhFVuHM/4Cd8FeTJRnT4o/Efhy/oEyMRjra2SK2TrSMG3cw==
X-Received: by 2002:a17:90b:194a:b0:202:e6eb:4b62 with SMTP id nk10-20020a17090b194a00b00202e6eb4b62mr27737434pjb.33.1664031536143;
        Sat, 24 Sep 2022 07:58:56 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q5-20020a170902edc500b0017534ffd491sm7875331plk.163.2022.09.24.07.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 07:58:55 -0700 (PDT)
Date: Sat, 24 Sep 2022 07:58:54 -0700
From: Kees Cook <keescook@chromium.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Siddhesh Poyarekar <siddhesh@gotplt.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>,
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] Compiler Attributes: Introduce __access_*() function
 attribute
Message-ID: <202209240757.3AC47AC6@keescook>
References: <20220923235424.3303486-1-keescook@chromium.org>
 <CANiq72n6zK=sXn2j71bAEUUYwRse2dT9f8kLrYzncnPjN1XTow@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72n6zK=sXn2j71bAEUUYwRse2dT9f8kLrYzncnPjN1XTow@mail.gmail.com>

On Sat, Sep 24, 2022 at 12:06:31PM +0200, Miguel Ojeda wrote:
> On Sat, Sep 24, 2022 at 1:54 AM Kees Cook <keescook@chromium.org> wrote:
> >
> > are specified. While it is legal to provide only the pointer argument
> > position and access type, design the kernel macros to require also the
> > bounds (element count) argument position: if a function has no bounds
> > argument, refactor the code to include one.
> 
> Should this bit be included in the comment of the attribute? (since it
> is specific to the kernel)

Sure; good idea!

> 
> > These can be used multiple times. For example:
> >
> > __access_wo(2, 3) __access_ro(4, 5)
> > int copy_something(struct context *ctx, u32 *dst, size_t dst_count,
> >                    u8 *src, int src_len);
> >
> > (And if "dst" will also be read, it could use __access_rw(2, 3) instead.)
> 
> Also maybe the example could be nice there too, since it uses the
> syntax for the kernel and you took the time to write it :)
> 
> By the way, shouldn't `src` typically be `const u8 *`? Given it is an
> example, I would qualify it.

Yeah, I will update this.

> 
> > +#if __has_attribute(__access__)
> > +#define __access_rw(ptr, count)        __attribute__((__access__(read_write, ptr, count)))
> > +#define __access_ro(ptr, count)        __attribute__((__access__(read_only,  ptr, count)))
> > +#define __access_wo(ptr, count)        __attribute__((__access__(write_only, ptr, count)))
> > +#else
> > +#define __access_rw(ptr, count)
> > +#define __access_ro(ptr, count)
> > +#define __access_wo(ptr, count)
> > +#endif
> 
> If you do a v2 for the above, please take the chance to indent with a
> single space after the `#` (like `# define`) for consistency.

Fixed! I will send a v2.

-- 
Kees Cook
