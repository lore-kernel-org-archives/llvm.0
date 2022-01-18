Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D7B168
	for <llvm@lists.linux.dev>; Tue, 18 Jan 2022 23:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642546891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=imSbjfG3HpJVgHUztBteAKnTWeE4AQAds5w4lniIVaU=;
	b=JjrdY7syLxAs813NukDRZQrI09x0KHgxeVf3kDfGhCQdagEPvqP8k6dBYDJ9maO9trylYq
	hiwS0PH/HFpVLhikdEl/J8SSZ+Y8BsxtXaaG93v3Sn8qNG+btRfdEXKvZNaw0cyNvKmY1i
	6tbPI8MHSVOGZ9ugPw+ZvvpWPQlQ+4Y=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-GncstkAAMnmdEKtU2E0lfQ-1; Tue, 18 Jan 2022 18:01:25 -0500
X-MC-Unique: GncstkAAMnmdEKtU2E0lfQ-1
Received: by mail-qv1-f70.google.com with SMTP id ib7-20020a0562141c8700b0040812bc4425so698292qvb.16
        for <llvm@lists.linux.dev>; Tue, 18 Jan 2022 15:01:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=imSbjfG3HpJVgHUztBteAKnTWeE4AQAds5w4lniIVaU=;
        b=2OiVSfV77XJtmKrGedmyPiu2eK95gICbUcjHTDYG5VR4A7CJRlJioAKJYNzFzU7V+6
         7yxClres7M7akEz3wOSjije7lJ+V2xHHwhRd0ls8N65ddUgmf31LMPOucs7bK3B24FPd
         Cu3kdIyjEiXvtrVkCvQZx8ijyTwCoZtBmhztW2S7k9dORKVf6CED64AdoEmQlZnvZLnN
         RzyoMgcWodVlU7yyzxtD88+ozc26oOoT+4FNlmjcJWAAOwkxejCgBWYfjLa3E8VP7Fve
         zOJXCmTAA9rdVlejYb6ho40MrrNakmHGjgGW3gKagigGNSYyQQfnTQlq1XiQdS16lex5
         DwcA==
X-Gm-Message-State: AOAM530ZnGJ1ByOfvR0mGvfzFejRqOx5LOc1ZBHgJuSTT2yV0HORtn+I
	1YxHwil2r7tc0eZ//RTTCOZZ+z8ishNqtBVPzytgHR4JV5Vwr857Eyl2hFxdkUT1tcUC+oRPHQW
	7dAASzRV3DpB1/g==
X-Received: by 2002:ac8:57d6:: with SMTP id w22mr9729196qta.167.1642546884605;
        Tue, 18 Jan 2022 15:01:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxyQ926lYNQFaaESs3XDeB0TGuTp5YmiFt/PM6FFwVllm13rgEx76LTNmglnZnmxg9ERdqTBA==
X-Received: by 2002:ac8:57d6:: with SMTP id w22mr9729170qta.167.1642546884378;
        Tue, 18 Jan 2022 15:01:24 -0800 (PST)
Received: from treble ([2600:1700:6e32:6c00::c])
        by smtp.gmail.com with ESMTPSA id i5sm4598139qkn.19.2022.01.18.15.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 15:01:23 -0800 (PST)
Date: Tue, 18 Jan 2022 15:01:20 -0800
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Ingo Molnar <mingo@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, x86@kernel.org,
	llvm@lists.linux.dev, linux-sparse@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] objtool: prefer memory clobber & %= to volatile &
 __COUNTER__
Message-ID: <20220118230120.pivvson7qekfiqic@treble>
References: <20220114010526.1776605-1-ndesaulniers@google.com>
 <YeQei0xNzMq7bFdg@zn.tnic>
 <20220118192256.jzk5dnceeusq7x7u@treble>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220118192256.jzk5dnceeusq7x7u@treble>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jpoimboe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Jan 18, 2022 at 11:22:59AM -0800, Josh Poimboeuf wrote:
> On Sun, Jan 16, 2022 at 02:32:59PM +0100, Borislav Petkov wrote:
> > so I like the local label and how it is more readable this way.
> > 
> > So, provided the memory clobber works (I wonder here if Josh has some
> > concrete failing cases which could be tested with your version) and
> > after the nitpicks have been addressed
> > 
> > Acked-by: Borislav Petkov <bp@suse.de>
> 
> I think Nick was already able to recreate the original issue.  I'll run
> it through some more testing.
> 
> I wanted to make this change years ago, but couldn't because of legacy
> toolchains.  Here's hoping this is the final solution for those @#$%^
> macros.
> 
> Boris, thanks for looping Nick in, I should have done so to begin with.

Apparently this patch isn't going to work after all :-(

  https://lkml.kernel.org/r/202201190632.lhlaiCBk-lkp@intel.com

With the two WARN_ONs in media_request_object_complete(), GCC apparently
considers the two reachable() asm statements as duplicates, and it
removes the second one.

-- 
Josh

