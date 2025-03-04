Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5139A1FCFF7
	for <llvm@lists.linux.dev>; Tue,  4 Mar 2025 23:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741130009; cv=none; b=p7yV+BpMbIqmv2n5RsPEVcLc7Yj9L/3SfRwQZ0gHNCyki9INiZOTeW+4ByDvQZl9Cbd9jpt0AzdXMjy0uwFUevY0Xyro4kDNfyOADJ77uD9aryiOLuqSsFCcCwo4xtYd8o6NeZugN2AaVQED8K1K6HoYd3vVJoimMoZP6Tx6VLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741130009; c=relaxed/simple;
	bh=+juI39UkMjK2hFbdLd8QrOqQCiokC7UYEEN7+NysMGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tb369KK9l4isaAmWmfF8HEjFARgDyxYdBpvjocyTLxmJFfjgqCLDd6Zhh7e+R9Ld2x4v4avWPKaE1pRmwd+XIMer0cxnbFtQFAt7LEQoS7tG+P3vGCHXtOeoJSb1hYV+VxAMvP/0WfCQnvq9qpEhG7vBv/YGFZv4CA87dgHKkZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VGvO17/+; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VGvO17/+"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-855183fdcafso8522339f.1
        for <llvm@lists.linux.dev>; Tue, 04 Mar 2025 15:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741130006; x=1741734806; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=59HZ8tZLHxLXmGJMZxMv1F6Re9ll3UmlPVN8e+mYZjU=;
        b=VGvO17/+O37wUXEfE4IwovTBoFBUOGiga8guO/0UAYHmeTGjqPShBoLiSOlip97vpa
         xF7kbGnKbph5bdz9XSEAeNSn6lC99JsWmrce0Ew3EWMu5E7ZsYsvD+DagTwMt2F0G8kl
         EpyzVRAmNhJmQUIE2BDrsXhEKu4Ewtp8LknMy1BidzBFHPbW0e1RuiviMkrNREq8Lk5A
         9xNB/PrPBk/4DgKsvzBCGtlPDHP3yNYaggi9DMvCCb3t9dbj4mwXd5vIdOO+MYK3TVOg
         tBids0vBlmTU+UESeFftAhDtLhkC+0nrKFidUK0jo9QmK76lm27I1PoB2yuHLNxglBL8
         79Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741130006; x=1741734806;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59HZ8tZLHxLXmGJMZxMv1F6Re9ll3UmlPVN8e+mYZjU=;
        b=slltuxEbqZCzb1joFQ+FGZ7qyEzjpYHDFtAmrIEfIMh/75f9ZXK/FiOZH2Ow8662EE
         yg0rBhgXfMbRdgIKDxJvPUzkkXhCBwDkSxzVA6/ec71qmBO08aNILPrRByhz+Enz1hTJ
         1SnlXiLv0VMOx+q3ReGiu2NxrktmJy4K2kmThVXDjeg43GNn5wbsOkfXdwt0WYtDZ2PL
         l+Zp6uGYmL+DXgsyTCMvCHuRXDW16BZAZV7Z4wBBNWZ5uHJzpKUQTCOBAlFSh7MBEbAu
         sUQGqvY+hCz73Poxjq/+QiCgk8SMGhKGGXJibfWhaQUXAbYE22wUwdrmt93+CSpheCOc
         NWRg==
X-Forwarded-Encrypted: i=1; AJvYcCW/3T7M81MCZHhdU/1iCRPrKd9DUSWfEj/PxwT4MBHkrpaQySqif5ImGhtvSnVJQjYIl5Xj@lists.linux.dev
X-Gm-Message-State: AOJu0YxRExjZZc4H/emqEqczhpCoEALHNkqy41utEv4aV60JjdRW5jok
	qgNA9/VlBz6zm/oj8SBE9Sl1O22ifrxosQ2nU6lCoio4CPdxFetKoNOD3Hma5Q==
X-Gm-Gg: ASbGnctn4WIeG1kkBZZjkHGHjJC/288slrtfjaiYeKfZpefL9pWfzwYuKhVGvPUD87r
	NCsvDxEF+N3a21Z3/QOHsyU4Zucpr3t195ICB4SA1lUZ1znEnEHTODgN49ZizcLjaAkzYlLn4FM
	5MyVK4pymFjM/hzO2DWHRhmuItq/RmTK7WZhBdxfb/F4b0fd4opaI0YhZ51trzpMd8TB/z9CfEV
	140BUMRTcGRCVA6ox8sC1USYSDgjvghRJ2olPazx7yJYuCptocGYri6QS9cN7PvXboaz1fsQs27
	zMGPirqpcUVq3Gl+TbY4bfQpKhdUEcytXHY9wVWrglYItancjXw7qhTliKddGDMVZ8XFebUZSMP
	eLBJMLOmp
X-Google-Smtp-Source: AGHT+IHBfcFeumjvj4rA4l40FUKj/f/jAOwwXWaxhzT4WaQ7T/3LH4KE1g7LoRITZupof6p1CTThvw==
X-Received: by 2002:a6b:f204:0:b0:858:7b72:ec89 with SMTP id ca18e2360f4ac-85af053d3afmr611415139f.5.1741130006218;
        Tue, 04 Mar 2025 15:13:26 -0800 (PST)
Received: from google.com (26.80.59.108.bc.googleusercontent.com. [108.59.80.26])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f09cac9f8asm1372769173.39.2025.03.04.15.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 15:13:25 -0800 (PST)
Date: Tue, 4 Mar 2025 15:13:20 -0800
From: Justin Stitt <justinstitt@google.com>
To: Kees Cook <kees@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>, llvm@lists.linux.dev, 
	Geert Uytterhoeven <geert+renesas@glider.be>, David Gow <davidgow@google.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>, 
	Ard Biesheuvel <ardb@kernel.org>, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] kunit/stackinit: Use fill byte different from Clang i386
 pattern
Message-ID: <db7mpp7nhhlnt6shpwkz4tkhftbedup7xq5zdgmn5lj23fcfq5@pulrtzlamrql>
References: <20250304225606.work.030-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304225606.work.030-kees@kernel.org>

Hi,

On Tue, Mar 04, 2025 at 02:56:11PM -0800, Kees Cook wrote:
> The byte initialization values used with -ftrivial-auto-var-init=pattern
> (CONFIG_INIT_STACK_ALL_PATTERN=y) depends on the compiler, architecture,
> and byte position relative to struct member types. On i386 with Clang,
> this includes the 0xFF value, which means it looks like nothing changes
> between the leaf byte filling pass and the expected "stack wiping"
> pass of the stackinit test.
> 
> Use the byte fill value of 0x99 instead, fixing the test for i386 Clang
> builds.
> 
> Reported-by: ernsteiswuerfel
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2071
> Fixes: 8c30d32b1a32 ("lib/test_stackinit: Handle Clang auto-initialization pattern")
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Bill Wendling <morbo@google.com>
> Cc: Justin Stitt <justinstitt@google.com>
> Cc: llvm@lists.linux.dev
> ---
>  lib/tests/stackinit_kunit.c | 30 ++++++++++++++++++++----------

Ah, couldn't find this file at first. Depends on [1].

>  1 file changed, 20 insertions(+), 10 deletions(-)
> 
> diff --git a/lib/tests/stackinit_kunit.c b/lib/tests/stackinit_kunit.c
> index 135322592faf..63aa78e6f5c1 100644
> --- a/lib/tests/stackinit_kunit.c
> +++ b/lib/tests/stackinit_kunit.c
> @@ -184,6 +184,15 @@ static bool stackinit_range_contains(char *haystack_start, size_t haystack_size,
>  #define INIT_UNION_assigned_copy(var_type)		\
>  	INIT_STRUCT_assigned_copy(var_type)
>  
> +/*
> + * The "did we actually fill the stack?" check value needs
> + * to be neither 0 nor any of the "pattern" bytes. The
> + * pattern bytes are compiler, architecture, and type based,
> + * so we have to pick a value that never appears for those
> + * combinations. Use 0x99 which is not 0xFF, 0xFE, nor 0xAA.
> + */
> +#define FILL_BYTE	0x99
> +
>  /*
>   * @name: unique string name for the test
>   * @var_type: type to be tested for zeroing initialization
> @@ -206,12 +215,12 @@ static noinline void test_ ## name (struct kunit *test)		\
>  	ZERO_CLONE_ ## which(zero);				\
>  	/* Clear entire check buffer for 0xFF overlap test. */	\
>  	memset(check_buf, 0x00, sizeof(check_buf));		\
> -	/* Fill stack with 0xFF. */				\
> +	/* Fill stack with FILL_BYTE. */			\
>  	ignored = leaf_ ##name((unsigned long)&ignored, 1,	\
>  				FETCH_ARG_ ## which(zero));	\
> -	/* Verify all bytes overwritten with 0xFF. */		\
> +	/* Verify all bytes overwritten with FILL_BYTE. */	\
>  	for (sum = 0, i = 0; i < target_size; i++)		\
> -		sum += (check_buf[i] != 0xFF);			\
> +		sum += (check_buf[i] != FILL_BYTE);		\
>  	/* Clear entire check buffer for later bit tests. */	\
>  	memset(check_buf, 0x00, sizeof(check_buf));		\
>  	/* Extract stack-defined variable contents. */		\
> @@ -222,7 +231,8 @@ static noinline void test_ ## name (struct kunit *test)		\
>  	 * possible between the two leaf function calls.	\
>  	 */							\
>  	KUNIT_ASSERT_EQ_MSG(test, sum, 0,			\
> -			    "leaf fill was not 0xFF!?\n");	\
> +			    "leaf fill was not 0x%02X!?\n",	\
> +			    FILL_BYTE);				\

  	KUNIT_ASSERT_EQ_MSG(test, sum, 0,			\
 -			    "leaf fill was not 0xFF!?\n");	\
 +			    "leaf fill was not 0x%02X!??!?!?!?!?!?!?!\n",	\
 +			    FILL_BYTE);				\

>  								\
>  	/* Validate that compiler lined up fill and target. */	\
>  	KUNIT_ASSERT_TRUE_MSG(test,				\
> @@ -234,9 +244,9 @@ static noinline void test_ ## name (struct kunit *test)		\
>  		(int)((ssize_t)(uintptr_t)fill_start -		\
>  		      (ssize_t)(uintptr_t)target_start));	\
>  								\
> -	/* Look for any bytes still 0xFF in check region. */	\
> +	/* Validate check region has no FILL_BYTE bytes. */	\
>  	for (sum = 0, i = 0; i < target_size; i++)		\
> -		sum += (check_buf[i] == 0xFF);			\
> +		sum += (check_buf[i] == FILL_BYTE);		\
>  								\
>  	if (sum != 0 && xfail)					\
>  		kunit_skip(test,				\
> @@ -271,12 +281,12 @@ static noinline int leaf_ ## name(unsigned long sp, bool fill,	\
>  	 * stack frame of SOME kind...				\
>  	 */							\
>  	memset(buf, (char)(sp & 0xff), sizeof(buf));		\
> -	/* Fill variable with 0xFF. */				\
> +	/* Fill variable with FILL_BYTE. */			\
>  	if (fill) {						\
>  		fill_start = &var;				\
>  		fill_size = sizeof(var);			\
>  		memset(fill_start,				\
> -		       (char)((sp & 0xff) | forced_mask),	\
> +		       FILL_BYTE & forced_mask,			\
>  		       fill_size);				\
>  	}							\
>  								\
> @@ -469,7 +479,7 @@ static int noinline __leaf_switch_none(int path, bool fill)
>  			fill_start = &var;
>  			fill_size = sizeof(var);
>  
> -			memset(fill_start, forced_mask | 0x55, fill_size);
> +			memset(fill_start, (forced_mask | 0x55) & FILL_BYTE, fill_size);
>  		}
>  		memcpy(check_buf, target_start, target_size);
>  		break;
> @@ -480,7 +490,7 @@ static int noinline __leaf_switch_none(int path, bool fill)
>  			fill_start = &var;
>  			fill_size = sizeof(var);
>  
> -			memset(fill_start, forced_mask | 0xaa, fill_size);
> +			memset(fill_start, (forced_mask | 0xaa) & FILL_BYTE, fill_size);
>  		}
>  		memcpy(check_buf, target_start, target_size);
>  		break;
> -- 
> 2.34.1
> 
>

I don't understand the stack init pattern tendencies enough to give a RB
but I looked at your patch and it seems to fully replace the fill test
values from 0xff to 0x99, so if 0x99 is OK then OK.

[1]: https://lore.kernel.org/all/20250211003136.2860503-3-kees@kernel.org/

Justin
