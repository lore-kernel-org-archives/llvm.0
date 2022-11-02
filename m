Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4B024F4D
	for <llvm@lists.linux.dev>; Wed,  2 Nov 2022 19:21:25 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id y203so3145550pfb.4
        for <llvm@lists.linux.dev>; Wed, 02 Nov 2022 12:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B8Kb3FDF2ltCser6k2Boeu2/HvGG8fHolSWZaqKpuWo=;
        b=fCn72FEK7JqsX/hjTC/1QNdSlH+bbHzR/GBepixStWXFturm+bTiBoBMndtGCZnb5M
         XsraYqE4sBX2oDxyjcP35OrO6FQDiukWe1SSPop+KaAnoJgDPAy/i9zrWuLR4Ta6mVxW
         84EA7ip0h1VgQ0i6pTx8biZigeWK/OyGC6HfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8Kb3FDF2ltCser6k2Boeu2/HvGG8fHolSWZaqKpuWo=;
        b=ej4hVDaN81EjDN5j7N6CUQgAbxuLvMlR/IaMKAE4aQpV60hzIuOAfNdtkyO2d456a6
         x+S2RpcMLCg7pq79vbZjpRTEKcYusXjKXJvKGSQ4JjXANmqsBOUh1Ik0a8iXFRvBrCck
         H/85xoiXBvHoYuuTl0gvZgccd7YdUmNFGJhqKx46z5g1GlLjzlSGjE982E/DNbaaxsAO
         8rXPva01b9Y700mm6PylxQcLoHXCec4NImnN082IwK8+lAY+zvnlxwGDyOIxC3/txjt0
         03e03MihFZKCtczZOY4ASbSS27+tU6DsG8WUR8yuiPLfdvcH2L6gOxguvIQLR1/bSe84
         EEhw==
X-Gm-Message-State: ACrzQf0bqkJihbMLco0UToVHDy+32NVj7ceDeghnWiwe22X4E9sxOC4E
	dPI1tadIJsO1Pw2ndXHUGu2RVA==
X-Google-Smtp-Source: AMsMyM7YtHQImySKSXB+BJJLch8eWsN4QnSQHsUF3i5EKgm8DFqzAM89xVOPYsJc4pOM1Kic66vX+A==
X-Received: by 2002:a63:d845:0:b0:44b:d074:97d with SMTP id k5-20020a63d845000000b0044bd074097dmr23393938pgj.32.1667416884681;
        Wed, 02 Nov 2022 12:21:24 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id k28-20020aa7999c000000b0056bfebfa6e4sm8733255pfh.190.2022.11.02.12.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 12:21:24 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:21:23 -0700
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
Message-ID: <202211021216.FF49E84C69@keescook>
References: <20221102172217.2860740-1-nathan@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102172217.2860740-1-nathan@kernel.org>

On Wed, Nov 02, 2022 at 10:22:14AM -0700, Nathan Chancellor wrote:
> The ->signal_u32_read(), ->count_u32_read(), and ->count_u32_write()
> callbacks in 'struct counter_comp' expect the final parameter to have a
> type of 'u32' or 'u32 *' but the ops functions that are being assigned
> to those callbacks have an enumerated type as the final parameter. While
> these are compatible from an ABI perspective, they will fail the
> aforementioned CFI checks.
> 
> Adjust the type of the final parameter in the ->signal_read(),
> ->function_read(), and ->function_write() callbacks in 'struct
> counter_ops' and their implementations to match the prototypes in
> 'struct counter_comp' to clear up these warnings and CFI failures.

I don't understand these changes. Where do 'struct counter_comp'
and 'struct counter_ops' get confused? I can only find matching
ops/assignments/calls, so I must be missing something. This looks like
a loss of CFI granularity instead of having wrappers added if there is
an enum/u32 conversion needed somewhere.

-- 
Kees Cook
