Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E828189DC
	for <llvm@lists.linux.dev>; Wed,  7 Sep 2022 23:18:42 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id v4so14980437pgi.10
        for <llvm@lists.linux.dev>; Wed, 07 Sep 2022 16:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=SyyrjMprS3NErINjE30okKQmNuDNpwUJEMON7tAxo1Q=;
        b=mdIv4jbq82QQqnPao5mTtHiJpr/izsQpuITHl2f3R4QHTodUWY8jke2gdE2MI4irT3
         I/y8FWZyYUnJltBREmfFSrR2viS+629k1iAIRbmyiAiEkEnGnjtj+CVGD4slBy76iGI2
         GGxm0HggwzcnFy83SJIkMMp3WLFpWnOgvK/Og=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=SyyrjMprS3NErINjE30okKQmNuDNpwUJEMON7tAxo1Q=;
        b=2x4GXxAWCbpvzJ9mxpPEu2k86T5f7ljX8dmUEj7vORele/GcaQvJwV/okRuYLb3r3R
         sVoPusoxjWH585AmQntIoNT20BocX/3anBkztxQG06WD0r60YNijEmuzFvEUfzuZieQK
         cQcwC2pImCsyvIH7mfc+Vfp0V7JwdO0Vt0BgzSvLRpDTzGWzPV1k3tJ6FVPCVKS1SP9e
         1LAdm0RJ99aCgEmU/I9NSv/YCEhK2Tg6+atpxvrceEw0ENG2SfAtomIU2A8eNEsUlfDq
         YcrZffRdp+1vrxuqfnnbdsfS9wEo8kN3tgB+P4pxhbiXSwo0HN5qER9VjfanBLbaFJ0U
         MfXw==
X-Gm-Message-State: ACgBeo0lHLYcmKK+En0oYLkjvuaH9s9WXQx+cZOjwIM6AjYCs/1QzPWl
	v4vl+XX6BbsXkhFkF+L6JOIlZA==
X-Google-Smtp-Source: AA6agR5ueDUNwxeTzeEDSiLI9eh0YlYBj0jPE2hM3Z0UzjPp3FRddh3oFD9BLWUhXFyw+ilA9HsRMQ==
X-Received: by 2002:a63:e205:0:b0:435:c80:ecd0 with SMTP id q5-20020a63e205000000b004350c80ecd0mr2614435pgh.174.1662592722429;
        Wed, 07 Sep 2022 16:18:42 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id t8-20020a6564c8000000b0042c29d1610dsm11153529pgv.63.2022.09.07.16.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 16:18:41 -0700 (PDT)
Date: Wed, 7 Sep 2022 16:18:40 -0700
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	David Gow <davidgow@google.com>, Yury Norov <yury.norov@gmail.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Sander Vanheule <sander@svanheule.net>,
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Isabella Basso <isabbasso@riseup.net>,
	Eric Dumazet <edumazet@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Eric Biggers <ebiggers@google.com>, Hannes Reinecke <hare@suse.de>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] fortify: Fix __compiletime_strlen() under
 UBSAN_BOUNDS_LOCAL
Message-ID: <202209071613.A08F0F9225@keescook>
References: <20220902204351.2521805-1-keescook@chromium.org>
 <20220902204351.2521805-2-keescook@chromium.org>
 <CAKwvOdmeaUQYkd9kZPgwK0kK5BRxFi8aszyFzw8TA4JFF6y8EQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdmeaUQYkd9kZPgwK0kK5BRxFi8aszyFzw8TA4JFF6y8EQ@mail.gmail.com>

On Tue, Sep 06, 2022 at 07:36:46PM -0700, Nick Desaulniers wrote:
> On Fri, Sep 2, 2022 at 1:43 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > Co-developed-by: Nick Desaulniers <ndesaulniers@google.com>
> 
> That's overly generous of you!

Well, it was a lot of work to track down, and you wrote it up that way,
I just moved things around a little bit. :)

> Anyways, the disassembly LGTM and the bot also came back green.
> 
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Tested-by: Android Treehugger Robot
> Link: https://android-review.googlesource.com/c/kernel/common/+/2206839

Thank you!

> Another thought, Nikita suggested that you could also compare mode 1 vs mode 3:
> https://github.com/llvm/llvm-project/issues/57510#issuecomment-1235126343

Yeah, it could work (I tried this as well), but I think the better
approach is checking index 0.

> That said, since mode 3 returns 0 for "unknown" I'd imagine that
> wouldn't be pretty since it wouldn't be a direct comparison against
> __p_size.

Yeah -- it is a little weird. I might come back to this if we get more
glitches like this in the future.

-- 
Kees Cook
