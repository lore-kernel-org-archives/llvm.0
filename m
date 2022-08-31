Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1424A37
	for <llvm@lists.linux.dev>; Wed, 31 Aug 2022 18:24:01 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id p8-20020a17090ad30800b001fdfc8c7567so3905733pju.1
        for <llvm@lists.linux.dev>; Wed, 31 Aug 2022 11:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=QOzTr0839E3H9tR0wkETuj4b9U9VUvaitz4KI9/r73I=;
        b=EWOrlKJU+LjqRQ/uV9Xua9LvEAnJThp75klKQawBXR3MM0Z+lCfQZzsPiCp50MfMKn
         RrB3LHxP6lWHR8RQlk9SL2/wueb5grQcMqwigHiPfW8os7zYwv5SeTLb6G+whxDTtkF/
         RiTcqxJYXg7XbnnSYwkrDgauuEFFak+11Xl2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=QOzTr0839E3H9tR0wkETuj4b9U9VUvaitz4KI9/r73I=;
        b=ybLFztwtLn7tbHqj6kpJJCILYTmuZ53YOc97T5SlfWGSApUiAaIEJoIpJCsaoYzJV9
         zj5FW6qRN5Qmt1XFIKNkc6mY0FMmhjvTLmsbQWwco3NUbaJIkXobQHe9qOnowfHAdrZZ
         x1j3fAxVYfeN5OlZe+oZ21Mz0/oG1qEm+rg9jDHwJlgs20zLe7qSfoUeSDWZU/kpSwx6
         jzkjP4xMF5RvM+kbiTVBKxLdL/CjoW1mjSGGz1V4rv3vFWxaLqDBdjQ//N0EZZ1RArfz
         mkf9LSh0bkbuvSgsCXGKpcpIDibYGublLEdZs0epxVCslNdmkXcDIEObRk8LuOUbyUOi
         YNkQ==
X-Gm-Message-State: ACgBeo0xjNjmUUmYl+yuRJngmYj6RjzVHJBKEDGb7kklOmVeIMt1iQQb
	VTlHIJ/Uf9NbWU/nHEs7alskSw==
X-Google-Smtp-Source: AA6agR7ryAbaJQVqp1mJEckyrIip9baCtObI7dR5faSXw3AEvsfrQpKGzAcIiDq8Eww2LkxtypaSAQ==
X-Received: by 2002:a17:902:b68d:b0:172:e973:82b9 with SMTP id c13-20020a170902b68d00b00172e97382b9mr27132898pls.120.1661970241179;
        Wed, 31 Aug 2022 11:24:01 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z24-20020aa79f98000000b00537f9e32b00sm9156524pfr.37.2022.08.31.11.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 11:24:00 -0700 (PDT)
Date: Wed, 31 Aug 2022 11:23:59 -0700
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
Subject: Re: [PATCH v4 17/21] kallsyms: Drop CONFIG_CFI_CLANG workarounds
Message-ID: <202208311123.B3B651E@keescook>
References: <20220830233129.30610-1-samitolvanen@google.com>
 <20220830233129.30610-18-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220830233129.30610-18-samitolvanen@google.com>

On Tue, Aug 30, 2022 at 04:31:25PM -0700, Sami Tolvanen wrote:
> With -fsanitize=kcfi, the compiler no longer renames static
> functions with CONFIG_CFI_CLANG + ThinLTO. Drop the code that cleans
> up the ThinLTO hash from the function names.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
