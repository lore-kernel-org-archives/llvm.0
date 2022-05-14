Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E882F25
	for <llvm@lists.linux.dev>; Sat, 14 May 2022 21:58:23 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id d17so11146384plg.0
        for <llvm@lists.linux.dev>; Sat, 14 May 2022 14:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YHRIbwbYw+C29KUQZWgduS5aUkdozvIZ+erhj6VO6FY=;
        b=GKZwyVRiKzX72oR6iRkHNGBB4Yxe4zgbdG2bd1Amyx25B8PRAkSSWxH34c2Z8H4Nnm
         1vTmWCO/WBQS1TIQlB3jNMp8kDrLZ6n4ahAh5U+uttxpOOjQf2Tn//WLGsxXWkypgUs4
         tC2mjiqHKHosECDuo/Grwg0fKMiL1EvNVf1Io=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YHRIbwbYw+C29KUQZWgduS5aUkdozvIZ+erhj6VO6FY=;
        b=yotqQSZpHv5HINL51DN4tzkybkeTd34X9Ju3E9NJ0A/Zh465CkBiTWomvlCyQtHBCS
         +ByMQXEVI44yXnTU+Anvk9URDdO4mRsY3IAoiVq+nFXLCf65/zFp5C8FFU+Y8hjbsBun
         HPon1PYx+GoHShpXClvehVGfODP+hafjCoX6zfq0Tre6B+ipcFxrJA3gIKIbNyVDH+Ks
         n4sCbUNWkECmhQOY1Jfxo+W6nwYJAiCvWcIFLrIF6FhsENBmyR6If7L2wbs91DHPUJVX
         wRZGFEUVCN9VWV0q276xxseVNpkc3FJBVOuTycrWJ1O0uVwmddRibpyY01KI/wyLb679
         izrg==
X-Gm-Message-State: AOAM531OR4gLsFsyuWwLaqEi/hAZhfBK70pcG4bd/qj0qS5V1gHro5iO
	fb8iQ0og3/r98R/T2IWcH6yA4w==
X-Google-Smtp-Source: ABdhPJwQi9fDcAabhWlIu7XmH1XILDhZjsGUll409I75HQ6fQoXg6nsR8lupRx6Pog8YHNzHVYWXow==
X-Received: by 2002:a17:90a:db51:b0:1dc:9d7e:1e11 with SMTP id u17-20020a17090adb5100b001dc9d7e1e11mr23330312pjx.129.1652565502681;
        Sat, 14 May 2022 14:58:22 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id i1-20020a6561a1000000b003c14af5063fsm3889773pgv.87.2022.05.14.14.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 14:58:22 -0700 (PDT)
Date: Sat, 14 May 2022 14:58:21 -0700
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
Subject: Re: [RFC PATCH v2 18/21] x86/purgatory: Disable CFI
Message-ID: <202205141458.1101A071@keescook>
References: <20220513202159.1550547-1-samitolvanen@google.com>
 <20220513202159.1550547-19-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513202159.1550547-19-samitolvanen@google.com>

On Fri, May 13, 2022 at 01:21:56PM -0700, Sami Tolvanen wrote:
> Disable CONFIG_CFI_CLANG for the stand-alone purgatory.ro.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
