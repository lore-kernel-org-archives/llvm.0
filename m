Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69581841
	for <llvm@lists.linux.dev>; Fri, 29 Apr 2022 22:53:14 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id p12so8107296pfn.0
        for <llvm@lists.linux.dev>; Fri, 29 Apr 2022 15:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=JrJ5Up6tIRRW5Mxs+/9PXH6BK6Q48YyALZseWmr3avA=;
        b=esBlUhglB9jCI2Ncth42eo2IMjtAy4YW4mTLvt3OzArSE3z90VovKH/o+BFbP3EssP
         JaCdFvrUUP7i40tzjcYF0lquuriKN1llnUUyvzwFwrGkI7j8MjvoA0RgJ17uWCOe5j77
         +igUVwBVzTTxT7qU1IAL9BiZ2pi/eoIAUusFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=JrJ5Up6tIRRW5Mxs+/9PXH6BK6Q48YyALZseWmr3avA=;
        b=3V3sYVnfJjN6Qtqxp3SUMNbkEGBdZEFfwbYZoESkzdNdJe/gdhcXizxzIENvQqVIeD
         Hml9rSb+44goZpr4pudRHNXwfpQYilkpPjOUctm+byOo2xohR/qNSXIG/ReVF4S8yX4x
         5jNMsuHU2+7GevWWJJa6lMrF9P/eqKPSZJe66kXysZBxViDK8Qm68t/waWK2K7Iw51gV
         9wYnO8uA0AEEwanS+3MrWfGrCJNJomTsutnQ1IqCrpX8KF8oIeb3h8KFh6Ok+kvzlMZ8
         vNiL57D2LWKgIWb0UkOooVw+ilioy0ZIwcebX2VnxO/Xt7ucngdqfuDtb9US1J7fFkck
         ge7A==
X-Gm-Message-State: AOAM530TBhX5klX/MP7BthfvVg4mXQMrp7ZkELmTswdGYx7OUZp0a0sh
	5wcgGiUWsB2uRlMcKhKb7dDTfg==
X-Google-Smtp-Source: ABdhPJxRF8uHZoIH/chjk/MDQLywii0fw4j6ZVHcIMULfWZu1kPW+qVQqzNUfgv+DrkE51BUzUaAxQ==
X-Received: by 2002:a63:dd54:0:b0:3a8:f358:5b3f with SMTP id g20-20020a63dd54000000b003a8f3585b3fmr1141335pgj.97.1651272794165;
        Fri, 29 Apr 2022 15:53:14 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c8-20020aa78808000000b0050dc7628172sm200051pfo.76.2022.04.29.15.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 15:53:13 -0700 (PDT)
Date: Fri, 29 Apr 2022 15:53:12 -0700
From: Kees Cook <keescook@chromium.org>
To: Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Josh Poimboeuf <jpoimboe@redhat.com>, Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Cc: Sami Tolvanen <samitolvanen@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Joao Moreira <joao@overdrivepizza.com>,
	Sedat Dilek <sedat.dilek@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
	x86@kernel.org, linux-hardening@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [RFC PATCH 00/21] KCFI support
Message-ID: <202204291545.47C6A97EA2@keescook>
References: <20220429203644.2868448-1-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220429203644.2868448-1-samitolvanen@google.com>

On Fri, Apr 29, 2022 at 01:36:23PM -0700, Sami Tolvanen wrote:
> KCFI is a proposed forward-edge control-flow integrity scheme for
> Clang, which is more suitable for kernel use than the existing CFI
> scheme used by CONFIG_CFI_CLANG. KCFI doesn't require LTO, doesn't
> alter function references to point to a jump table, and won't break
> function address equality.

🎉 :)

> The latest LLVM patches are here:
> 
>   https://reviews.llvm.org/D119296
>   https://reviews.llvm.org/D124211
> 
> [...]
> To test this series, you'll need to compile your own Clang toolchain
> with the patches linked above. You can also find the complete source
> tree here:
> 
>   https://github.com/samitolvanen/llvm-project/commits/kcfi-rfc

And note that this RFC is seeking to break a bit of a circular dependency
with regard to the design of __builtin_kcfi_call_unchecked (D124211
above), as the implementation has gone around a few times in review within
LLVM, and we want to make sure that kernel folks are okay with what was
settled on. If there are no objections on the kernel side, then we can
land the KCFI patches, as this is basically the only remaining blocker.

-Kees

-- 
Kees Cook
