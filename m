Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09E1168
	for <llvm@lists.linux.dev>; Wed, 19 Jan 2022 00:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642550617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tVYvA6k75j8gln9tRsgy3BBh8Hq7EurwC1H6Kup6Uac=;
	b=gExhNam4AYtmen0v6gWmmyvSyQ8NIuTJvwu75AL7BD2ADE7pZqdlbgkQw8Exc/BW9YBYuC
	tba6QOb+GWu2xB3/Tk7S/czdKFHl8XQGG7efPrVJB6fT6tQptnJHzJuWAtr5F5h9wq5zQJ
	0y+hM/pYNz9HlsYSgkcuoJrjwXIGn90=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-7WVbKfBKO12OoK7BwrLKfg-1; Tue, 18 Jan 2022 19:03:36 -0500
X-MC-Unique: 7WVbKfBKO12OoK7BwrLKfg-1
Received: by mail-oi1-f200.google.com with SMTP id j126-20020acaeb84000000b002c90b1bb864so533651oih.3
        for <llvm@lists.linux.dev>; Tue, 18 Jan 2022 16:03:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tVYvA6k75j8gln9tRsgy3BBh8Hq7EurwC1H6Kup6Uac=;
        b=dETVPnZFh48N9r9IT4gTkrmfOTKtSJhpS3wQFzZUcN2yNNGlIKv9yoSKQf9XlDE0pl
         ArSHNt4A81y/kI8vFzIfKH2egxk7RLRL3jhhSXPDtLyT51QbIVUCdfIJkpMi58kDthIG
         PDQznslgM5rlL2Z53LwxDsvv7fFx0CaAMBCwJIOKDcSEgAjBTvoq7TnNTWzeE0PPOvNH
         KKiFe66nnJMPVFvQ9/oild1S1NnnkQ+8ug53X3SWu+VNRbovKKgJWNHDulUb1Ym3BuJn
         4HhJBkw9ae9lmgQcifAcKXh7xb/chfRQxQjTYJ09a+34X2koyy9ZcAPIhwAeASJbg8OF
         nRUg==
X-Gm-Message-State: AOAM531GOgKfy8xiWCLbpfNnPF975IhZj/0jWiBwoUUMvz1CwNeFbk86
	/QLUG4JewvJ55TNckKihMia76F3W6bAv5wh9HteH+YSAdH3mnsyB4+Twv2n21NkmWv1pu0RKUNQ
	mR8tehmw/JROg6Q==
X-Received: by 2002:a05:6830:2785:: with SMTP id x5mr22537877otu.187.1642550616002;
        Tue, 18 Jan 2022 16:03:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFSVupUWPVUpDZy728lBKKhw+a+1HU1Pevbh8pLavUmbWJOKEDeq0ntl5K4b6WWPcLn98w6Q==
X-Received: by 2002:a05:6830:2785:: with SMTP id x5mr22537853otu.187.1642550615767;
        Tue, 18 Jan 2022 16:03:35 -0800 (PST)
Received: from treble ([2600:1700:6e32:6c00::c])
        by smtp.gmail.com with ESMTPSA id ay40sm9106563oib.1.2022.01.18.16.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 16:03:35 -0800 (PST)
Date: Tue, 18 Jan 2022 16:03:27 -0800
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
Message-ID: <20220119000327.oapghqad4lebnsra@treble>
References: <20220114010526.1776605-1-ndesaulniers@google.com>
 <YeQei0xNzMq7bFdg@zn.tnic>
 <20220118192256.jzk5dnceeusq7x7u@treble>
 <20220118230120.pivvson7qekfiqic@treble>
 <YedOLva0zos3A1JE@zn.tnic>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YedOLva0zos3A1JE@zn.tnic>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jpoimboe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Jan 19, 2022 at 12:33:02AM +0100, Borislav Petkov wrote:
> On Tue, Jan 18, 2022 at 03:01:20PM -0800, Josh Poimboeuf wrote:
> > With the two WARN_ONs in media_request_object_complete(), GCC apparently
> > considers the two reachable() asm statements as duplicates, and it
> > removes the second one.
> 
> Could that be the same thing:
> 
> net/xfrm/xfrm_output.o: warning: objtool: xfrm_output_resume()+0x2e0: unreachable instruction
> 
> I see two WARN_ONs in asm output there too...

If one of the '__bug_table' asm snippets isn't immediately followed by
the .L[un]reachable asm, then yeah, it's the same issue.


For example it's supposed to look something like this:


# 472 "net/xfrm/xfrm_output.c" 1
	1:	.byte 0x0f, 0x0b
.pushsection __bug_table,"aw"
2:	.long 1b - 2b	# bug_entry::bug_addr
	.long .LC4 - 2b	# bug_entry::file	#
	.word 472	# bug_entry::line	#
	.word 2307	# bug_entry::flags	#
	.org 2b+12	#
.popsection
# 0 "" 2
# 472 "net/xfrm/xfrm_output.c" 1
	.Lreachable1666:
	.pushsection .discard.reachable
	.long .Lreachable1666 - .
	.popsection


NOT just this:


# 472 "net/xfrm/xfrm_output.c" 1
	1:	.byte 0x0f, 0x0b
.pushsection __bug_table,"aw"
2:	.long 1b - 2b	# bug_entry::bug_addr
	.long .LC4 - 2b	# bug_entry::file	#
	.word 472	# bug_entry::line	#
	.word 2307	# bug_entry::flags	#
	.org 2b+12	#
.popsection
# some other code here...


There's a bunch of those throughout the code base.  The current
annotate_[un]reachable() implementations are carefully written to avoid
that happening.

-- 
Josh

