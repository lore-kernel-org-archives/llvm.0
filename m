Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28729A925
	for <llvm@lists.linux.dev>; Mon, 14 Aug 2023 23:21:44 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1bdb801c667so29152245ad.1
        for <llvm@lists.linux.dev>; Mon, 14 Aug 2023 16:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692055304; x=1692660104;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zDgteNssk7bldWg1S9G58zrFCCsMMUu+wXIpurB+HOk=;
        b=f0Ak5IcltrDFdkQCDY8pIN2Q+ApDStplykSnlDyPTlJ5hOzrqc9PWJCJjuzY2a8RJ+
         g8xVrAL3nMB+kfcdXe60p9qKEe3GlaSBVzwWcARsfm76j54TnQAq99JEPb1dmu6zAVNx
         W/EJPZgrIcJBBWdgJxFVqDLwjpYw5EdzIukns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692055304; x=1692660104;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDgteNssk7bldWg1S9G58zrFCCsMMUu+wXIpurB+HOk=;
        b=dM7UoIa4un8ir/6ei1CTJD9pYKX3OE4jg8e2a13sw+ZtPP8shkZLKKOrtytPsbdeV8
         pryHvQGIEnOLZGeAiqdkV0+yJl9N13oSG0PRTmZIrwnXywgJqt2j6wvv2KKiR+veXO6h
         95gp7wlcbSEGhF6pki6eSqAKU0gelSrKGtUNOFUe/pIn4h8VmWjEsDK2rRJqEMy1cD0b
         ODhhuPjCvSYHjqXd1YVac6tTziDBrXiR15Dg5JuMniJ3pXHtD9ZxSZCgrJyb3pD7huE8
         JbIC1k6N5/wOtpbewNc46qXqlGvdN7seBY5MmhXWEBB/HLvKbW7EPfjGlIWEKyo5QlCa
         W4Xg==
X-Gm-Message-State: AOJu0YymrpruNSCWGtj/qG0A/T+B7pqFxj6ZYuRll6p0SQu0v2M40NDn
	+qFjFZB5+aZeT69pkIVNT5BiOg==
X-Google-Smtp-Source: AGHT+IHSGL8C59m4WskNFhunf6W+tABRL2W8v1BYu6fmf1+j7vX3+mrOp1twYX7SxuE7dHDeO2B60Q==
X-Received: by 2002:a17:902:e802:b0:1bc:422a:b9fd with SMTP id u2-20020a170902e80200b001bc422ab9fdmr13245083plg.13.1692055304507;
        Mon, 14 Aug 2023 16:21:44 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id c13-20020a170902d48d00b001bdcd4b1616sm5310621plg.260.2023.08.14.16.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 16:21:43 -0700 (PDT)
Date: Mon, 14 Aug 2023 16:21:43 -0700
From: Kees Cook <keescook@chromium.org>
To: Marco Elver <elver@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
	llvm@lists.linux.dev, Dmitry Vyukov <dvyukov@google.com>,
	Alexander Potapenko <glider@google.com>, kasan-dev@googlegroups.com,
	linux-toolchains@vger.kernel.org
Subject: Re: [PATCH v4 1/4] compiler_types: Introduce the Clang
 __preserve_most function attribute
Message-ID: <202308141620.E16B93279@keescook>
References: <20230811151847.1594958-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230811151847.1594958-1-elver@google.com>

On Fri, Aug 11, 2023 at 05:18:38PM +0200, Marco Elver wrote:
> [1]: "On X86-64 and AArch64 targets, this attribute changes the calling
> convention of a function. The preserve_most calling convention attempts
> to make the code in the caller as unintrusive as possible. This
> convention behaves identically to the C calling convention on how
> arguments and return values are passed, but it uses a different set of
> caller/callee-saved registers. This alleviates the burden of saving and
> recovering a large register set before and after the call in the caller.
> If the arguments are passed in callee-saved registers, then they will be
> preserved by the callee across the call. This doesn't apply for values
> returned in callee-saved registers.
> 
>  * On X86-64 the callee preserves all general purpose registers, except
>    for R11. R11 can be used as a scratch register. Floating-point
>    registers (XMMs/YMMs) are not preserved and need to be saved by the
>    caller.
> 
>  * On AArch64 the callee preserve all general purpose registers, except
>    x0-X8 and X16-X18."
> 
> [1] https://clang.llvm.org/docs/AttributeReference.html#preserve-most
> 
> Introduce the attribute to compiler_types.h as __preserve_most.
> 
> Use of this attribute results in better code generation for calls to
> very rarely called functions, such as error-reporting functions, or
> rarely executed slow paths.
> 
> Beware that the attribute conflicts with instrumentation calls inserted
> on function entry which do not use __preserve_most themselves. Notably,
> function tracing which assumes the normal C calling convention for the
> given architecture.  Where the attribute is supported, __preserve_most
> will imply notrace. It is recommended to restrict use of the attribute
> to functions that should or already disable tracing.
> 
> Note: The additional preprocessor check against architecture should not
> be necessary if __has_attribute() only returns true where supported;
> also see https://github.com/ClangBuiltLinux/linux/issues/1908. But until
> __has_attribute() does the right thing, we also guard by known-supported
> architectures to avoid build warnings on other architectures.
> 
> The attribute may be supported by a future GCC version (see
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=110899).
> 
> Signed-off-by: Marco Elver <elver@google.com>
> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> Acked-by: Mark Rutland <mark.rutland@arm.com>

Should this go via -mm, the hardening tree, or something else? I'm happy
to carry it if no one else wants it?

-Kees

-- 
Kees Cook
