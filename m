Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601EB3FC0
	for <llvm@lists.linux.dev>; Wed, 25 Aug 2021 05:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629869438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=APi59ojaXZbrr2Z3Z/wcTDIafsmLfmeiwWQFicVEKhk=;
	b=e/WY7mq/wS3FHRnYAfgdu1xTjWqqfOqRml4E4HWSlLpSfvMdPq2hRVlM/2qR14O8Sqw0fY
	dKBUyw7kfOWBTaVHEFhd3jkxLqNy2UAs6H3lzNPisu6j45q0ds//wuv0laYg6rkZKP6OhC
	wrymCgEjCygiebSasJqynqYfaSzZYn8=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-MFoc2l0gN-yldLwLIzwJ9A-1; Wed, 25 Aug 2021 01:30:34 -0400
X-MC-Unique: MFoc2l0gN-yldLwLIzwJ9A-1
Received: by mail-qt1-f200.google.com with SMTP id k4-20020ac85fc4000000b0029e6247e3edso214965qta.19
        for <llvm@lists.linux.dev>; Tue, 24 Aug 2021 22:30:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=APi59ojaXZbrr2Z3Z/wcTDIafsmLfmeiwWQFicVEKhk=;
        b=F8drS7Qh1TVuh3GPV+tV2JxM0mIBiNTA8uzE65kG5fjnSC2j6kld8zJbvXWHHt7txm
         9o2gziBIzBsXkSGSn7BoXS52hZE3QAgCfjn1XnYcYz18zQfOK4XMjFXVLCD2HHNT82Bj
         jqa3ymM4osCujSWtZpNHXZozh9l+QZ7BqAjBSSP4uQflsA1kxXrWygP6SV3aIjml+Iqs
         bRnhIpo7m0/bDKjZ7/90m6smMRVTKtiDCiJWnpNCQSxoNJ5UChp1uQvZdSZ6Krqze8+9
         8cpi4vYcrIdPdQdmFReLjuOfncA9Saz22wHPKtqNiY6PkHapVdLx5Z23kp7HfRZ1Vrwp
         PUVA==
X-Gm-Message-State: AOAM533KNjMyu2d7LkfMyrIBiJG4qBD9yxnLdJofA9K5hWg65kEBQNAt
	pg9gpmRZz2EM7zYbJ90BQHgmm0E6h1SAYopFH038aqVQbB9/UUEgedOtcIGWjb+EteqU7coReyD
	Yc+fBZmPFtOZzEw==
X-Received: by 2002:a05:620a:165a:: with SMTP id c26mr29211567qko.498.1629869434296;
        Tue, 24 Aug 2021 22:30:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMuMDEk2QlX00jEdPzFjBbSqgfb3KxV4isKSY1FNEWSj9eMIcGgf3PDVZE4GPL/fUUWoHSHA==
X-Received: by 2002:a05:620a:165a:: with SMTP id c26mr29211555qko.498.1629869434007;
        Tue, 24 Aug 2021 22:30:34 -0700 (PDT)
Received: from treble ([2600:1700:6e32:6c00::48])
        by smtp.gmail.com with ESMTPSA id u13sm2264634qki.38.2021.08.24.22.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 22:30:33 -0700 (PDT)
Date: Tue, 24 Aug 2021 22:30:30 -0700
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <keescook@chromium.org>,
	clang-built-linux@googlegroups.com, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: objtool warning in cfg80211_edmg_chandef_valid() with ThinLTO
Message-ID: <20210825053030.kal3nk3ifaj55vtu@treble>
References: <5913cdf4-9c8e-38f8-8914-d3b8a3565d73@kernel.org>
 <20210824210507.GC17784@worktop.programming.kicks-ass.net>
 <dedde693-bf1d-a35b-e858-dab1f8f65246@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <dedde693-bf1d-a35b-e858-dab1f8f65246@kernel.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jpoimboe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Aug 24, 2021 at 02:19:07PM -0700, Nathan Chancellor wrote:
> On 8/24/2021 2:05 PM, Peter Zijlstra wrote:
> > On Tue, Aug 24, 2021 at 01:08:58PM -0700, Nathan Chancellor wrote:
> > 
> > > The LLVM developers are under the impression that this is an issue with
> > > objtool; specifically quoting Eli Friedman:
> > > 
> > > "The backend can, in general, create basic blocks that don't contain any
> > > instructions, and don't fall through to another block. A jump table entry
> > > can refer to such a block. I guess certain tools could be confused by this.
> > > 
> > > If that's the issue, it should be possible to work around it using '-mllvm
> > > -trap-unreachable'."
> > 
> > So jump-tables are a weak point; ARM64 was having worse problems than
> > x86 there, they can't even locate them.
> > 
> > As to having a jump-table entry to an empty block and not falling
> > through; how are we supposed to know?
> 
> Fair enough. It does make me wonder why LLVM does that.
> 
> > Emitting them is a waste of space, so I'd say it's a compiler bug :-))
> 
> Isn't it always? :)
> 
> Turns out Nick brought up an issue very similar to this (unreachable
> conditions with switches) on LLVM's issue tracker
> (https://bugs.llvm.org/show_bug.cgi?id=50080) with the same workaround
> suggestion ('-mllvm -trap-unreachable') and there was no follow up after
> that so maybe that is one thing to look into once Nick is back online.
> 
> > It's been brought up before; but perhaps we should look at an 'informal'
> > ABI for jump-tables ?
> Not a bad idea, especially if this has come up before.

This is definitely needed.  Jump tables have always been a major thorn
in objtool's side.  I think I volunteered to write up a proposal for the
linux-toolchains list but I've just been waaay too busy.

-- 
Josh

