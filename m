Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE6572
	for <llvm@lists.linux.dev>; Wed, 20 Oct 2021 19:11:30 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id g5so16837987plg.1
        for <llvm@lists.linux.dev>; Wed, 20 Oct 2021 12:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VT1ZnTWZw0jMkeN3fDOrnC1r/jUp1V3OZwD2nwImWMk=;
        b=nre93T6MzHelf00EfakHYDHtu00QJEKItoSAkKHGP3gUTjHdigzheidpN0Cn+ghvKd
         LKWv2/OIotRWfXs/WCG7an5/vs5KygZtizL39PVLhD9YZOfqaFwrzigVA2RIjTye4bHE
         OWKNrjwp2iiSwr71nYKpU9JH0SPNhhNIbBfEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VT1ZnTWZw0jMkeN3fDOrnC1r/jUp1V3OZwD2nwImWMk=;
        b=YLMchIOWF1owIgnl4L4VbmDyiqIz3Y3A3bM4SOXAm+MqURXrWccM5zDeUzF4c9OzRr
         3zSI4/czXHhN4I3eLust1GXtygCHNkdqO16b6nBu04qZpxoFkwXBIvQLv7bwNoWeB2ci
         pwOAqznkYH9obkbVzgSYAUEFF7cKE1nHIA46ET/AY/futkjBPa64Q1eENZpP7hw8GxHR
         XhXhqkleKSGQXT2EI4QjyrGrMM0odeC6mMxI+Gw/JytwSOrk/n2KZ6wzojZfkrMBzsfT
         oDLkRQ8qRt1XO7XJn3/XRyBuMAx1V68yibUNHoBHOvIZCSng7m+ZxQpBJ6KaPf0WEZFK
         5m8w==
X-Gm-Message-State: AOAM530Aw0qCIfZ46Ol3hiVBkCcKDgs4cD0L9ipQIcuTJWAu4JBxuGzJ
	qF4e/F479gppoQaFrA0WlyREikWOy7SyYA==
X-Google-Smtp-Source: ABdhPJyVMN7MoPGQBIowKQmEG8vN3pK31aaAQUVHuBVZpxjnw8chkJkUkW744OD0Z5Ryu083zYUf6Q==
X-Received: by 2002:a17:90a:e54d:: with SMTP id ei13mr950751pjb.65.1634757090342;
        Wed, 20 Oct 2021 12:11:30 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x13sm2869108pge.37.2021.10.20.12.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 12:11:29 -0700 (PDT)
Date: Wed, 20 Oct 2021 12:11:29 -0700
From: Kees Cook <keescook@chromium.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Emese Revfy <re.emese@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Michal Marek <michal.lkml@markovi.net>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-hardening@vger.kernel.org,
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Dan Li <ashimida@linux.alibaba.com>,
	Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-security-module <linux-security-module@vger.kernel.org>,
	llvm@lists.linux.dev
Subject: Re: [PATCH 2/2] gcc-plugins: Remove cyc_complexity
Message-ID: <202110201210.1F70546@keescook>
References: <20211020173554.38122-1-keescook@chromium.org>
 <20211020173554.38122-3-keescook@chromium.org>
 <CANiq72kveT40jX8GWjs1dy0o3YjowUGtGTddPb+da114sb+4iA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72kveT40jX8GWjs1dy0o3YjowUGtGTddPb+da114sb+4iA@mail.gmail.com>

On Wed, Oct 20, 2021 at 07:48:55PM +0200, Miguel Ojeda wrote:
> On Wed, Oct 20, 2021 at 7:35 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > - * Copyright 2011-2016 by Emese Revfy <re.emese@gmail.com>
> 
> Perhaps we should Cc this address to give them notice.

Good point; I'm in the habit of that happening automatically as Emese
was a co-maintainer of the gcc-plugins. Sorry for the oversight here.

> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

-- 
Kees Cook
