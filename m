Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A34369B
	for <llvm@lists.linux.dev>; Sat, 26 Feb 2022 04:58:05 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id bd1so6398116plb.13
        for <llvm@lists.linux.dev>; Fri, 25 Feb 2022 20:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5WDq2AfJRdEk3uwNCX9CCL0Qxk/1zT3oEVQ37zTBxiQ=;
        b=c3aDV/sWGC8Aav0gTokKYXKTVE9bAzdOg/VodTQkI1ZuWDFLBaAapUK41ly/1s3IY/
         W+Z6/i2+AiHX1zTPTIWN0fxwS7weXUa9htEgesB3a3/aUvLro2QbUvmJvb7PuCo8MDxY
         cWLiWBjaqvM9w53HJp7E2yo9+WCoeGP3wPwnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5WDq2AfJRdEk3uwNCX9CCL0Qxk/1zT3oEVQ37zTBxiQ=;
        b=R4fiXtcpa1zbzm6Jb7DHiHHQAo7ZdBGrA2Ko9zycWgJtU74SL3jFMaydqmM+wLVuSa
         1qGgTS5kjAhNnvpn0mudF4kSuXoiqI1eSzOHXvsn+y0Od127aiu5X8YcGYpt21tpnj/V
         bj/WGk2UNFLRphsRaF97sg/IcRRYmINEbsWJ5wbTKuyDGX7Olg0H85X2ExYQSeMibLKQ
         dUsEzPKfa6oFiNw+SsXCliBmdTZwA7IG1gGwYGH3Zc52usnlisDQduKl4hHYT9iBd6hf
         qo3QKMy1crpoKm8eS2JUqh1OQ9LJpCa5eTOzKPWy/nfNCHO+g39zJdJfkTMGUJstIGSW
         yG/g==
X-Gm-Message-State: AOAM532kXpx0ctC1JnOCAWdClLRvKUDMtolcolagtlXCWSP3BbalfMxL
	1k0Kh7W+pqZKJ3Jg0Vub4MTKRw==
X-Google-Smtp-Source: ABdhPJw+Pq5ORed8exj9wiY5jEUAPWkvWhs95qMwc9/ZjM7l7Vq7hTKWaYi8/0ifVsSFdaFo8S2A8g==
X-Received: by 2002:a17:90a:6a45:b0:1bc:5899:c960 with SMTP id d5-20020a17090a6a4500b001bc5899c960mr6431453pjm.128.1645851484628;
        Fri, 25 Feb 2022 20:58:04 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id v3-20020a17090a088300b001bc76ed4ad9sm11129598pjc.9.2022.02.25.20.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 20:58:04 -0800 (PST)
Date: Fri, 25 Feb 2022 20:58:03 -0800
From: Kees Cook <keescook@chromium.org>
To: Joao Moreira <joao@overdrivepizza.com>,
	Fangrui Song <maskray@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
	hjl.tools@gmail.com, jpoimboe@redhat.com, andrew.cooper3@citrix.com,
	linux-kernel@vger.kernel.org, ndesaulniers@google.com,
	samitolvanen@google.com, mark.rutland@arm.com,
	alyssa.milburn@intel.com, mbenes@suse.cz, rostedt@goodmis.org,
	mhiramat@kernel.org, alexei.starovoitov@gmail.com,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2 05/39] x86: Base IBT bits
Message-ID: <202202252055.AB16A4B8@keescook>
References: <20220224145138.952963315@infradead.org>
 <20220224151322.307406918@infradead.org>
 <202202241627.EEF3D5D2@keescook>
 <YhgnA8O4Bp19hfse@dev-arch.archlinux-ax161>
 <YhlTRhh7qj538ygM@dev-arch.archlinux-ax161>
 <605731324a76f36aafa87bd9390808c3@overdrivepizza.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <605731324a76f36aafa87bd9390808c3@overdrivepizza.com>

On Fri, Feb 25, 2022 at 04:29:49PM -0800, Joao Moreira wrote:
> > https://github.com/ClangBuiltLinux/linux/issues/1606
> 
> Candidate fix: https://reviews.llvm.org/D120600

And landed! Thanks!

Since this is a pretty small change, do you think it could be backported
to the clang-14 branch?

-- 
Kees Cook
