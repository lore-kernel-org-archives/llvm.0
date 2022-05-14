Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A0C2F25
	for <llvm@lists.linux.dev>; Sat, 14 May 2022 21:42:32 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id j14so11104355plx.3
        for <llvm@lists.linux.dev>; Sat, 14 May 2022 14:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AFfYNEwGAYrl2b1S77DLqgyE3imbGmmk2zhtDuc4ynI=;
        b=kl+nhaCiLE0304bc2Ws7byy+Zt93NbD2+JC8TxTzCPciiAnAK0kjyD+9A7Pqt/OSpz
         cwhEIIPnypOidev2krXJk0uSWujLyzMsR070AKg0DyjxHXCPDqBOwqC8CwPiOrV8gksg
         php3DyRROqICsm53xVIbeWQxek7z5RoSPRTBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AFfYNEwGAYrl2b1S77DLqgyE3imbGmmk2zhtDuc4ynI=;
        b=Xur0ga/DSxG7RM24TPjsvVkJfa9Mk95/i7OoLDnrFhrhdEdiwbNpuxVwovggXmWLbE
         7QPhkOjAZpNGLkY9MvXiGoZdxAIjdDzre7l2WYgpfznHqKkEVF9T7pcvDnjDeUh2lTPD
         qdr6EUovWTyKHaIuKSliQq2kIp8imqiM1s3dw6hfnFgjnESZDM+KQHkEeETdtkZMNHbW
         l4bHhXXzmuhAwnC9z4K4G9y2uIBpNe0geWXIE3/hqEQ7rY9RMInZzOq6WEYMw8Kg9J3E
         hcLzXMtFxp79YnVAykJBXUS0HWpBumS+pSf0N0w3591nkUnAUU4ePXilD8o3WaMSEFM/
         lhVA==
X-Gm-Message-State: AOAM532A5FVPRp2UGBdRB6IEu3rIWtI7ZP5zAZzWi8TtWHL708AvwSXI
	k3zdGO5vWqn/5KSP3Xeg3sBuxA==
X-Google-Smtp-Source: ABdhPJxop1xGmlluyC4skdT7bVdphvZ9BLwlNF0GxA/dVjB1BI12ZPD2SnJuyX+8EvOjL5/QmefH+g==
X-Received: by 2002:a17:90b:3b46:b0:1dc:b314:52e6 with SMTP id ot6-20020a17090b3b4600b001dcb31452e6mr11561361pjb.134.1652564551616;
        Sat, 14 May 2022 14:42:31 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id m4-20020a056a00080400b0050dc76281c4sm4094903pfk.158.2022.05.14.14.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 14:42:31 -0700 (PDT)
Date: Sat, 14 May 2022 14:42:30 -0700
From: Kees Cook <keescook@chromium.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: linux-kernel@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Joao Moreira <joao@overdrivepizza.com>,
	Sedat Dilek <sedat.dilek@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-hardening@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [RFC PATCH v2 01/21] efi/libstub: Filter out CC_FLAGS_CFI
Message-ID: <202205141441.C3B7CF6@keescook>
References: <20220513202159.1550547-1-samitolvanen@google.com>
 <20220513202159.1550547-2-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513202159.1550547-2-samitolvanen@google.com>

On Fri, May 13, 2022 at 01:21:39PM -0700, Sami Tolvanen wrote:
> Explicitly filter out CC_FLAGS_CFI in preparation for the flags being
> removed from CC_FLAGS_LTO.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Is it worth merging all the "existing" CC_FLAGS_LTO/CFI splits into a
single patch? Either way:

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
