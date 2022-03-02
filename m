Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD132104
	for <llvm@lists.linux.dev>; Wed,  2 Mar 2022 03:06:27 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id z15so672521pfe.7
        for <llvm@lists.linux.dev>; Tue, 01 Mar 2022 19:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4uQWZ5eZTfa9okHYlvMe6xuV/p7mWvmKZNg/Hz4Am3Y=;
        b=BIaD9FNraSb6wiOQFQhZ5ISIkGwvyd5VR6/NcjkrFX7S08TfqnMNK8YIUrpyLk6U44
         rtYy1wOKPCpGN7mmdUvzI9MlXebh+Gv2VLlAMbgAnJyOyDtdEl/yEP9ZfjuA5+9OLCf2
         6fA1aYcN79lwfDOWzpZONi3fA7tNpVXfGIZGi0mEjMygD9qi1kPfxhBxr6XXxsVu9Fuy
         32Ts+4tMk0GaetgE1nkkf/UFswX+wVmYIwO6S6NmtdgJ4eHQHgAU935WvAvX7uPV+pCO
         sZNeZAxfXwX5AuNs36WFYFvX+blKS8ruRyeVpgraWFnYVKJYZaH6i7Acqk7EQ77Mm6Rw
         vNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4uQWZ5eZTfa9okHYlvMe6xuV/p7mWvmKZNg/Hz4Am3Y=;
        b=SAoqa/pA/EEubVhcjw6C+KrA5Laj6Cf2nRygbTHp9Es4bZZ2RSxFITOLJgyI/H7ys9
         LrkOeQkHHfJDbieZGQ5TAJxPNooLf5yFKj0VZ144u883c+bhKGpU94ZdXpzXV9L7aWzH
         lPgAxhh0UsqRvg6HmqNlY+FEQ9QTj3yet0mBxmQN54x2nDnnURPFOWOf0cgVGAOT8Zvb
         7og8z6NFNBS5KveeQycB1p2S4FSvyYU+qcM6rnfLmHydUXRrEdMjQ0fLl370VDEuBIcf
         Ed/LGoH/ZjALOLuvQDlQ0zT14T6p+YROaczfDIUwSBgXMxxjFToOTv7h1m8x54RFUtrX
         g2sQ==
X-Gm-Message-State: AOAM532qTro3X3k47ezwjcYVUehrkAyvWsdUSkkFNh/tgs5PH8Js/PO1
	oSZSkMKTXQV3mL4JcqlM/aH/RQ==
X-Google-Smtp-Source: ABdhPJzjrpjpwq6XNmCzDIGQ61zH5fVSYvT9ToczJ0xSUPOr+Yek7VBUiQzg6UrMFKqjHvd+z9+CPg==
X-Received: by 2002:a63:d443:0:b0:364:51b7:c398 with SMTP id i3-20020a63d443000000b0036451b7c398mr24417257pgj.511.1646190387158;
        Tue, 01 Mar 2022 19:06:27 -0800 (PST)
Received: from google.com ([2620:15c:2ce:200:367d:623c:c89d:99ef])
        by smtp.gmail.com with ESMTPSA id f9-20020a056a00228900b004f3ba7d177csm19396666pfe.54.2022.03.01.19.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 19:06:26 -0800 (PST)
Date: Tue, 1 Mar 2022 19:06:21 -0800
From: Peter Collingbourne <pcc@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Joao Moreira <joao@overdrivepizza.com>,
	Kees Cook <keescook@chromium.org>, x86@kernel.org,
	hjl.tools@gmail.com, jpoimboe@redhat.com, andrew.cooper3@citrix.com,
	linux-kernel@vger.kernel.org, ndesaulniers@google.com,
	samitolvanen@google.com, llvm@lists.linux.dev
Subject: Re: [RFC][PATCH 6/6] objtool: Add IBT validation / fixups
Message-ID: <Yh7fLRYl8KgMcOe5@google.com>
References: <20211122170301.764232470@infradead.org>
 <20211122170805.338489412@infradead.org>
 <6ebb0ab131c522f20c094294d49091fc@overdrivepizza.com>
 <202202081541.900F9E1B@keescook>
 <ad6c2633f39e39583bc5c5eaf7ccbe52@overdrivepizza.com>
 <202202082003.FA77867@keescook>
 <9ea50c51ee8db366430c9dc697a83923@overdrivepizza.com>
 <20220211133803.GV23216@worktop.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220211133803.GV23216@worktop.programming.kicks-ass.net>

Hi Peter,

One issue with this call sequence is that:

On Fri, Feb 11, 2022 at 02:38:03PM +0100, Peter Zijlstra wrote:
> caller:
> 	cmpl	$0xdeadbeef, -0x4(%rax)		# 7 bytes

Because this instruction ends in the constant 0xdeadbeef, it may
be used as a "gadget" that would effectively allow branching to an
arbitrary address in %rax if the attacker can arrange to set ZF=1.

> 	je	1f				# 2 bytes
> 	ud2					# 2 bytes
> 1:	call	__x86_indirect_thunk_rax	# 5 bytes
> 
> 
> 	.align 16
> 	.byte 0xef, 0xbe, 0xad, 0xde		# 4 bytes
> func:
> 	endbr					# 4 bytes
> 	...
> 	ret

I think we can avoid this problem with a slight tweak to your
instruction sequence, at the cost of 2 bytes per function prologue.
First, change the call sequence like so:

 	cmpl	$0xdeadbeef, -0x6(%rax)		# 6 bytes
	je	1f				# 2 bytes
	ud2					# 2 bytes
1:	call	__x86_indirect_thunk_rax	# 5 bytes

The key difference is that we've changed 0x4 to 0x6.

Then change the function prologue to this:

	.align 16
	.byte 0xef, 0xbe, 0xad, 0xde		# 4 bytes
	.zero 2					# 2 bytes
func:

The end result of the above is that the constant embedded in the cmpl
instruction may only be used to reach the following ud2 instruction,
which will "harmlessly" terminate execution in the same way as if
the prologue signature did not match.

Peter
