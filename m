Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A09B7E7
	for <llvm@lists.linux.dev>; Wed, 31 Aug 2022 08:54:02 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-12243fcaa67so3582fac.8
        for <llvm@lists.linux.dev>; Wed, 31 Aug 2022 01:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=kbwQHOUbQlR2/mm4JOyIlKOeCQ9N4lWFC645O8AgNso=;
        b=gWIE9RhdeOCDBJtLJCy1XVNrbAt1QEQNcT07eNtDEH8QP7EiVD9C/KlBVzImYNkXP/
         5NbpegxB/4gnzxWoXRiltGyRH/9CSvUP8yYjYXUodceWmVAgCThud9abMMSJmEStzRPd
         wMSIDWWD35TY8VCadpb9/pARVc7nl+t+jbv7o4Adysz/L4L5HWQaVsdasosTf2KxaSOd
         P54BAtUPm8mSHhim/ZT8JLitAkfZ0gPLjWTw+qU3ygdkz/xaYgAHP1ElLmDe/iw5HViM
         RluvYeTSYb/flZUMNyjn7jwlwUPcAJR5lwC72rMBUoJw8X4de87t8xe3T7IfKR3Ivg0A
         ZepA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=kbwQHOUbQlR2/mm4JOyIlKOeCQ9N4lWFC645O8AgNso=;
        b=KmwbyUvw68hq/tKNuUpfZHm1qY89ulkuSk7f+OYXEgDqLqhLCzeTAG1faduJHZkxo3
         X4qDOEJBP6zHu1mwEd0FZVUteTG7VjVNCFPb0NZB7MdUZVFY1h3KC00CktTDft3q+Ja4
         QLPHwtojO39KIFk5bLgeANUlA9g4rEFTkXSVHDJjbnG6lrNTp68o5DTZC8rBMRzViIkM
         YDxvKJwpDEDXLjqZQFCs9u7woAxbaJcN+zN8CSUNpUirMtONt/XBxOO7n98NX2yZwFcW
         iIOWgfZl1xgqrUCN/A5h8N9FX2UGyRCt/Gn8rzQN6412uSWnM0jUNqsCMOpivRCR+Ark
         yH1g==
X-Gm-Message-State: ACgBeo04Q4oUWKAjRHFQkA0CBm5xR9bUMK5w3ZoQAClK4rnwwrwhKLCR
	PhlSxktnYdaghj2AX8aRh3A=
X-Google-Smtp-Source: AA6agR5a1ByJW1wvGG66gF57NFjg4g2yXXwvd903j2PM6zbyv5lIeFnwvL+0yibjTq7ehcwtYfUQ1g==
X-Received: by 2002:a05:6808:d4d:b0:344:863a:36fb with SMTP id w13-20020a0568080d4d00b00344863a36fbmr793701oik.235.1661936041628;
        Wed, 31 Aug 2022 01:54:01 -0700 (PDT)
Received: from localhost ([12.97.180.36])
        by smtp.gmail.com with ESMTPSA id r7-20020acac107000000b003352223a14asm7201510oif.15.2022.08.31.01.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 01:54:01 -0700 (PDT)
Date: Wed, 31 Aug 2022 01:51:49 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: Borislav Petkov <bp@alien8.de>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, x86@kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	David Howells <dhowells@redhat.com>,
	Jan Beulich <JBeulich@suse.com>,
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
	Joe Perches <joe@perches.com>, Josh Poimboeuf <jpoimboe@kernel.org>
Subject: Re: [PATCH v6 0/2] x86/asm/bitops: optimize ff{s,z} functions for
 constant expressions
Message-ID: <Yw8hJS9f6SofG4/6@yury-laptop>
References: <20220511160319.1045812-1-mailhol.vincent@wanadoo.fr>
 <20220831075742.295-1-mailhol.vincent@wanadoo.fr>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220831075742.295-1-mailhol.vincent@wanadoo.fr>

On Wed, Aug 31, 2022 at 04:57:40PM +0900, Vincent Mailhol wrote:
> The compilers provide some builtin expression equivalent to the ffs(),
> __ffs() and ffz() functions of the kernel. The kernel uses optimized
> assembly which produces better code than the builtin
> functions. However, such assembly code can not be folded when used
> with constant expressions.
> 
> This series relies on __builtin_constant_p to select the optimal solution:
> 
>   * use kernel assembly for non constant expressions
> 
>   * use compiler's __builtin function for constant expressions.
> 
> 
> ** Statistics **
> 
> Patch 1/2 optimizes 26.7% of ffs() calls and patch 2/2 optimizes 27.9%
> of __ffs() and ffz() calls (details of the calculation in each patch).

Hi Vincent,

Can you please add a test for this? We've recently added a very similar
test_bitmap_const_eval() in lib/test_bitmap.c.

dc34d5036692c ("lib: test_bitmap: add compile-time optimization/evaluations
assertions")

Would be nice to have something like this for ffs() and ffz() in
lib/test_bitops.c.

Please keep me in loop in case of new versions.

Thanks,
Yury

