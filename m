Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3106A446BF
	for <llvm@lists.linux.dev>; Wed, 24 Apr 2024 22:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713997933; cv=none; b=JM2ONxFMuAneBvptDEIuaskhplX05jV22WqUqhc2QYAYWjMZiegYyp094uPVbXPwWdfVxui/qucjHowQAO8qccLZ29hnW/Ql2tVVKUdz8341roez/egfftIvRktuTS5TNPLkekXW3qJbqGtfh+7uu1gdUT6Y/u0hUNtJgGRu7vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713997933; c=relaxed/simple;
	bh=uvZEBkA/MPyDoHJ5/C9wqvZpYhJJlinnsxmUnLpv1is=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g34USzUlHnHerV0Bff2oSYU8lXkI7iLzz01Dz97e0Lqj9sFW8nctcw3Xtp4UOWQD6QrbdGfVtdiH1eaotdBy5IpMrPW3xtxTkuv7vkwAz/vKzZG6JqWEQgfRTHA2vUfNlgzW0oYu8g1lWyVIa/kFQMgxStikuqAv1VUUkIh2i68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fshm25Nx; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fshm25Nx"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6ed20fb620fso386703b3a.2
        for <llvm@lists.linux.dev>; Wed, 24 Apr 2024 15:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713997931; x=1714602731; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W5XW2EeZa2xzGai521vbraJwVDegbnZlLcrpCRyHG1Q=;
        b=fshm25Nx5I4DAIZdV5pq7mcOg76jMGByiGLlfmHjwW9A0tYvM7hxtydS8Bg1SFRhRH
         ZbeMj9ux8gj2XdUIIKW6pWuuem9Z5g+QhsJ4PEkEh4ipqa9BBMhMAZb8wgFk7/sk9fiq
         4y755wBpRtF2PaYclPgomtOFOUXKqy7NL4QiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713997931; x=1714602731;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5XW2EeZa2xzGai521vbraJwVDegbnZlLcrpCRyHG1Q=;
        b=TklCSFKR3yGTZ7MAz9eTdmQub6sT3ZJcWCDQmFjEF0Pq1+S+qAOEk2LsnFlpMY7vLf
         SSwxsvmxuPs+pXUzdMlDeACjiqSIj2sx7y3KS3MeXAYeqP9VchJGBIGWFDCzm+b40bXb
         ITEe5SIXoz4oXEm160c9vXqrIcV0COyEMqJUQYF7wV8D3Kg7yVPGIgNavL2KEqWkI2Rz
         m6KM7SY0s6heTe0wlauRrB8qDD6YcAGgeK1hCcqcns268veqsBwZtuHQEWcKL5KCnIqu
         YZuc4H0i2mF4ohV2omai0LKBLIxNuhttkY6jkUKouh9K4Hm9D+ezj/ROppRayWCeZgED
         hK5A==
X-Forwarded-Encrypted: i=1; AJvYcCUBYYYuRYgJ8pX0WXLsN4M5GiTfO7xdQEXGroFXD2FimYxQteiBvRDdWw9Z2Jqvx8r1GIkH5wN3MdvqHz/0g1x2sXBJiA==
X-Gm-Message-State: AOJu0Ywckp6ql6QY0zHgoICzHf5TMKSVQpqgdrF+LqkDCL20BHNiBC/t
	q9S0o5lESeAjYkh3v6D4P5SXsNOrS0kEtA7X61/P94oWoE8q75l/V4M6IA+mMA==
X-Google-Smtp-Source: AGHT+IFXP0SM3z7WAQFgdBp5CCxZlXZmSMJJS/NqcGG1stQP0tBD3jcLz3Jce0/lDIAfO16tzwVCPw==
X-Received: by 2002:a05:6a20:de89:b0:1a7:870a:86eb with SMTP id la9-20020a056a20de8900b001a7870a86ebmr3750218pzb.15.1713997931478;
        Wed, 24 Apr 2024 15:32:11 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id u12-20020a056a00098c00b006f09d5807ebsm11488861pfg.82.2024.04.24.15.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 15:32:10 -0700 (PDT)
Date: Wed, 24 Apr 2024 15:32:10 -0700
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev,
	kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ubsan: Avoid i386 UBSAN handler crashes with Clang
Message-ID: <202404241530.A26FA3CC2@keescook>
References: <20240424162942.work.341-kees@kernel.org>
 <20240424192652.GA3341665@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240424192652.GA3341665@dev-arch.thelio-3990X>

On Wed, Apr 24, 2024 at 12:26:52PM -0700, Nathan Chancellor wrote:
> Hi Kees,
> 
> On Wed, Apr 24, 2024 at 09:29:43AM -0700, Kees Cook wrote:
> > When generating Runtime Calls, Clang doesn't respect the -mregparm=3
> > option used on i386. Hopefully this will be fixed correctly in Clang 19:
> > https://github.com/llvm/llvm-project/pull/89707
> > but we need to fix this for earlier Clang versions today. Force the
> > calling convention to use non-register arguments.
> > 
> > Reported-by: ernsteiswuerfel
> 
> FWIW, I think this can be
> 
>   Reported-by: Erhard Furtner <erhard_f@mailbox.org>
> 
> since it has been used in the kernel before, the reporter is well known
> :)

Ah! Okay, thanks. I wasn't able to find an associated email address. :)

> 
> > Closes: https://github.com/KSPP/linux/issues/350
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> > Cc: Marco Elver <elver@google.com>
> > Cc: Andrey Konovalov <andreyknvl@gmail.com>
> > Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
> > Cc: Nathan Chancellor <nathan@kernel.org>
> > Cc: Nick Desaulniers <ndesaulniers@google.com>
> > Cc: Bill Wendling <morbo@google.com>
> > Cc: Justin Stitt <justinstitt@google.com>
> > Cc: llvm@lists.linux.dev
> > Cc: kasan-dev@googlegroups.com
> > Cc: linux-hardening@vger.kernel.org
> > ---
> >  lib/ubsan.h | 41 +++++++++++++++++++++++++++--------------
> >  1 file changed, 27 insertions(+), 14 deletions(-)
> > 
> > diff --git a/lib/ubsan.h b/lib/ubsan.h
> > index 50ef50811b7c..978828f6099d 100644
> > --- a/lib/ubsan.h
> > +++ b/lib/ubsan.h
> > @@ -124,19 +124,32 @@ typedef s64 s_max;
> >  typedef u64 u_max;
> >  #endif
> >  
> > -void __ubsan_handle_add_overflow(void *data, void *lhs, void *rhs);
> > -void __ubsan_handle_sub_overflow(void *data, void *lhs, void *rhs);
> > -void __ubsan_handle_mul_overflow(void *data, void *lhs, void *rhs);
> > -void __ubsan_handle_negate_overflow(void *_data, void *old_val);
> > -void __ubsan_handle_divrem_overflow(void *_data, void *lhs, void *rhs);
> > -void __ubsan_handle_type_mismatch(struct type_mismatch_data *data, void *ptr);
> > -void __ubsan_handle_type_mismatch_v1(void *_data, void *ptr);
> > -void __ubsan_handle_out_of_bounds(void *_data, void *index);
> > -void __ubsan_handle_shift_out_of_bounds(void *_data, void *lhs, void *rhs);
> > -void __ubsan_handle_builtin_unreachable(void *_data);
> > -void __ubsan_handle_load_invalid_value(void *_data, void *val);
> > -void __ubsan_handle_alignment_assumption(void *_data, unsigned long ptr,
> > -					 unsigned long align,
> > -					 unsigned long offset);
> > +/*
> > + * When generating Runtime Calls, Clang doesn't respect the -mregparm=3
> > + * option used on i386. Hopefully this will be fixed correctly in Clang 19:
> > + * https://github.com/llvm/llvm-project/pull/89707
> > + * but we need to fix this for earlier Clang versions today. Force the
> 
> It may be better to link to the tracking issue upstream instead of the
> pull request just in case someone comes up with an alternative fix (not
> that I think your change is wrong or anything but it seems like that
> happens every so often).
> 
> I also get leary of the version information in the comment, even though
> I don't doubt this will be fixed in clang 19.
> 
> > + * calling convention to use non-register arguments.
> > + */
> > +#if defined(__clang__) && defined(CONFIG_X86_32)
> 
> While __clang__ is what causes CONFIG_CC_IS_CLANG to get set and there
> is some existing use of it throughout the kernel, I think
> CONFIG_CC_IS_CLANG makes it easier to audit the workarounds that we
> have, plus this will be presumably covered to
> 
>   CONFIG_CLANG_VERSION < 190000

Yeah, that seems much cleaner. I will adjust it...

> 
> when the fix actually lands. This file is not expected to be used
> outside of the kernel, right? That is the only thing I could think of
> where this distinction would actually matter.
> 
> > +# define ubsan_linkage asmlinkage
> 
> Heh, clever...
> 
> > +#else
> > +# define ubsan_linkage /**/
> 
> Why is this defined as a comment rather than just nothing?

I dunno; this is a coding style glitch of mine. :P I will drop it.

Thanks for the review!

-Kees

> 
> > +#endif
> > +
> > +void ubsan_linkage __ubsan_handle_add_overflow(void *data, void *lhs, void *rhs);
> > +void ubsan_linkage __ubsan_handle_sub_overflow(void *data, void *lhs, void *rhs);
> > +void ubsan_linkage __ubsan_handle_mul_overflow(void *data, void *lhs, void *rhs);
> > +void ubsan_linkage __ubsan_handle_negate_overflow(void *_data, void *old_val);
> > +void ubsan_linkage __ubsan_handle_divrem_overflow(void *_data, void *lhs, void *rhs);
> > +void ubsan_linkage __ubsan_handle_type_mismatch(struct type_mismatch_data *data, void *ptr);
> > +void ubsan_linkage __ubsan_handle_type_mismatch_v1(void *_data, void *ptr);
> > +void ubsan_linkage __ubsan_handle_out_of_bounds(void *_data, void *index);
> > +void ubsan_linkage __ubsan_handle_shift_out_of_bounds(void *_data, void *lhs, void *rhs);
> > +void ubsan_linkage __ubsan_handle_builtin_unreachable(void *_data);
> > +void ubsan_linkage __ubsan_handle_load_invalid_value(void *_data, void *val);
> > +void ubsan_linkage __ubsan_handle_alignment_assumption(void *_data, unsigned long ptr,
> > +						       unsigned long align,
> > +						       unsigned long offset);
> >  
> >  #endif
> > -- 
> > 2.34.1
> > 
> > 

-- 
Kees Cook
