Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE6B27719
	for <llvm@lists.linux.dev>; Wed,  2 Nov 2022 22:02:46 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id gw22so4581805pjb.3
        for <llvm@lists.linux.dev>; Wed, 02 Nov 2022 15:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tDdQ76HTuetM+x0U50OZVmoiEGjK/pNJ2DGCTRImjr8=;
        b=KQiJkZtePhI2flEsUJPvJWcVFKJ+OroKKLIqrw7gi+MX+q2049MD3JdT/HnYDFu9WR
         zLFsSCKGQMStyQIn1lzgksLz8eM0HdHrRUXnS3XiBPbgf+cvVwhSqUXkg1CPQQjS8peH
         VqixHIIJaqwe+pLijCFPO7sKai856yU/ibvqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDdQ76HTuetM+x0U50OZVmoiEGjK/pNJ2DGCTRImjr8=;
        b=wdmEsnHVrNt1vLDLFBmCIPUkgHeM1m2kLCr05RgSmeKFBC1gPqX2gbvE5j5JGiOOO6
         VAHmkXexbC9wvr/m7Ie+oRSHJgJzp7na3D4eNdH5Ixk8OQaq6J2WTrkjKKn0EEIBf+vi
         DelyR38ZWrAIC1uQ9z1Kj9mZGK3q9clVW/LMjDOVrdqZxEe/+SCoW6AM86zFzd66tUX6
         0037RwDnPUidqFJIhGp5jbIObPyuIKAUmx9mzeT2xt2iegfxBhnthrsIhtRLUpH/TsCo
         xBTd3q9ycJH9vObcxrSoOji1zcIJgkW+EKTO9MPCDSEvvXwtBl329tw+2KNUSRQE6PJS
         oeDA==
X-Gm-Message-State: ACrzQf1UN/MunMxCxhu9THVCjjP5+JFnwERJiRqbXA4+dejXH4LaMZOA
	QZcdmekUAP92MsaR+0MikJ+u/A==
X-Google-Smtp-Source: AMsMyM4WkfzMykXnG15VA0dkbaFs2pJjZSHDWxSbgybvMUsbX2OvhgJaXXTBVFr7hoOw8Zjy6TVn2g==
X-Received: by 2002:a17:90b:1095:b0:213:ee6a:f268 with SMTP id gj21-20020a17090b109500b00213ee6af268mr16266724pjb.213.1667426566071;
        Wed, 02 Nov 2022 15:02:46 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a20-20020a621a14000000b0056c6e59fb69sm8926019pfa.83.2022.11.02.15.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 15:02:45 -0700 (PDT)
Date: Wed, 2 Nov 2022 15:02:44 -0700
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: William Breathitt Gray <william.gray@linaro.org>,
	linux-iio@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Sami Tolvanen <samitolvanen@google.com>,
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Patrick Havelange <patrick.havelange@essensium.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Oleksij Rempel <linux@rempel-privat.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Julien Panis <jpanis@baylibre.com>,
	David Lechner <david@lechnology.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH 1/4] counter: Adjust final parameter type in function and
 signal callbacks
Message-ID: <202211021501.88D8147@keescook>
References: <20221102172217.2860740-1-nathan@kernel.org>
 <202211021216.FF49E84C69@keescook>
 <Y2LR13xrrauVmeXP@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2LR13xrrauVmeXP@dev-arch.thelio-3990X>

On Wed, Nov 02, 2022 at 01:23:51PM -0700, Nathan Chancellor wrote:
> Right, I am not the biggest fan of this change myself and it is entirely
> possible that I am misreading the warnings from the commit message but I
> do not see how
> 
>         comp_node.comp.signal_u32_read = counter->ops->signal_read;
> 
> and
> 
>         comp_node.comp.count_u32_read = counter->ops->function_read;
> 
> in counter_add_watch(),
> 
>         comp.signal_u32_read = counter->ops->signal_read;
> 
> in counter_signal_attrs_create(), and
> 
>         comp.count_u32_read = counter->ops->function_read;
>         comp.count_u32_write = counter->ops->function_write;
> 
> in counter_count_attrs_create() are currently safe under kCFI, since the
> final parameter type of the prototypes in 'struct counter_ops' does not
> match the final parameter type of the prototypes in 'struct
> counter_comp'. I would expect the indirect calls in counter_get_data()
> and counter_comp_u32_show() to fail currently.

Ah! Thank you -- those were the places I couldn't find.

-- 
Kees Cook
