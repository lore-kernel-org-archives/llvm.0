Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786C82F25
	for <llvm@lists.linux.dev>; Sat, 14 May 2022 21:50:06 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id q4so11085599plr.11
        for <llvm@lists.linux.dev>; Sat, 14 May 2022 14:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wUsCnBDPbKVJv+EaQK22IFJZJAmFRuI1WgmUtyrig2Y=;
        b=nA8vOrKYtkCzRykOxnyfADoil/vhGzEfF70wnCDaNvJJi5xuvhhAkbtAFjQwLeFpJS
         1jap5Med/qc57M9VzJiXmB/EA4QArrQBeeuX93F+CfTCQiapplPgFCGvqmsenet4C1Fo
         u8B84Aa7txzzssJbvS8cZtMj8GyAW5qEFMceU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wUsCnBDPbKVJv+EaQK22IFJZJAmFRuI1WgmUtyrig2Y=;
        b=cI9U4zFjcCOSg/eIYAUAfkqVmDyNqer6QU6IlsbS98n7EBTHHx3e7HbAOi0xFvH2Eh
         87zezvdBiJI+eoaK6jHiYGDN5YdaA6tEga6hIaXNRNAxWo+G+IZHnRq7uY3Ku+YJ14eZ
         2IPqxTA3nmT42Gl204jXsptUAsfnrxBAgw6xSvA6OI50QW9PDSMwYyDx7yBp9cWUArGz
         8ilFXXvVwG0Ax6Omg9h8BskzXuvLYXL9A4L5jOa6sJzl7bwpjj792VEy+700zwqXNCRX
         IPvZsyikWCZbdEytgY1f4EkjDL4t5xvAg50SnlYlaJDaBiW5QsG9c0kDXe2Fq399xx5X
         absQ==
X-Gm-Message-State: AOAM531JCdwEYaERjUrZAE/qhEAF+vYEqdDTmQDzg+XTg3xtOG0xxQzh
	1InsRf4RZomWNEE2qtXLH5bJ6Q==
X-Google-Smtp-Source: ABdhPJw2E4A+XrCLXCnm95DuJx6yjrgtSzMtn/EEPgJ80ptCzVUybF5Z7bgAS+rJxfbXjJ5+NcMoMw==
X-Received: by 2002:a17:90b:3d90:b0:1df:70c:c65f with SMTP id pq16-20020a17090b3d9000b001df070cc65fmr5818574pjb.238.1652565005959;
        Sat, 14 May 2022 14:50:05 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id j2-20020a056a00234200b0050dc76281a3sm4037702pfj.125.2022.05.14.14.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 14:50:05 -0700 (PDT)
Date: Sat, 14 May 2022 14:50:05 -0700
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
Subject: Re: [RFC PATCH v2 08/21] psci: Fix the function type for
 psci_initcall_t
Message-ID: <202205141449.87738FDF@keescook>
References: <20220513202159.1550547-1-samitolvanen@google.com>
 <20220513202159.1550547-9-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513202159.1550547-9-samitolvanen@google.com>

On Fri, May 13, 2022 at 01:21:46PM -0700, Sami Tolvanen wrote:
> Functions called through a psci_initcall_t pointer all have
> non-const arguments. Fix the type definition to avoid tripping
> indirect call checks with CFI_CLANG.
> 
> Reported-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

This could land separately from this series, too, yes?

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
