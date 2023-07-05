Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E43134C5
	for <llvm@lists.linux.dev>; Wed,  5 Jul 2023 21:54:03 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-55adfa61199so54590a12.2
        for <llvm@lists.linux.dev>; Wed, 05 Jul 2023 14:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688594043; x=1691186043;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Liimh1L4HJOY8OXGuengeZBXQw3nbaSrFK0qkUkfJCs=;
        b=HFFLDf1nKMBiNkEDGGknlZd0lGZnl0k4TCqvFA5zwVNWuk7IlzvTt5cWGTCU3wbezy
         3cscNV9rbOUEkZgYIm+Ix5i0RPFVtlrZHHMHBHIZXyDQ/LJ0VHfJey04tcyFGLaPbCey
         fqlj4vKpCkqvwE+zhZO4XJoF7gTzxKu8sdunI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688594043; x=1691186043;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Liimh1L4HJOY8OXGuengeZBXQw3nbaSrFK0qkUkfJCs=;
        b=JRm0Fqe8ZlOV34HVLuGOFz05nK+HZuGA+wXPceOxePNQe8k7p0SsVHKC/ATvRbFm6W
         6P5U7z+1CcXuBhzmMAvUc0k/O1Cdqqcz/7EzP3pjAJBiCb/z8lnUbQ7E/UiRmR2KSGOK
         1krwpTr2tdoZq99yWgTvH+JysAxRGukVDkM7QK0Fa9rCoFtm34n0qmxj8VwVNSSVBGUO
         6TiUOeTKiEkWSOqy1A7K/jO1A3C2ooDVME79x3K5wO+yrIWttLbguCuplShYHeuVGA8n
         BY0W4pcdrfOZUDodlGNseakZpJbtdAnW22z6MtJoqKSQVRDl4SZpcTcHnO8149EZ42rF
         NfJQ==
X-Gm-Message-State: ABy/qLYp7u6QDG7JAIr/HkSi5bbaOJgGTa4YyW/630OEh7N9Ef8S4Wbk
	BGBMf30vJs4Bbp4wEejVKbEiaA==
X-Google-Smtp-Source: APBJJlH7J8n+IUqKejrXtfTB5wxONrffa3P712Yi+AN6QPnr1lntlUu05kUEIE1E/pnCtMwAOY3vWQ==
X-Received: by 2002:a17:90b:e83:b0:263:6114:f0f9 with SMTP id fv3-20020a17090b0e8300b002636114f0f9mr16144191pjb.42.1688594043310;
        Wed, 05 Jul 2023 14:54:03 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id b12-20020a17090a550c00b00263154aab24sm45869pji.57.2023.07.05.14.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 14:54:02 -0700 (PDT)
Date: Wed, 5 Jul 2023 14:54:01 -0700
From: Kees Cook <keescook@chromium.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Jann Horn <jannh@google.com>, Kees Cook <kees@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux LLVM <llvm@lists.linux.dev>,
	the arch/x86 maintainers <x86@kernel.org>
Subject: Re: CONFIG_UBSAN_TRAP #UD error message on x86 [was: Re:
 [CRASH][BISECTED] 6.4.1 crash in boot]
Message-ID: <202307051453.007A5ED7@keescook>
References: <ed3e4315-b149-2f9e-70d4-45d7f83b9922@alu.unizg.hr>
 <202307031149.823F9A3@keescook>
 <202307031606.3FD9D0D@keescook>
 <fbf4103b-6471-1f06-34a8-4aa227f5e091@alu.unizg.hr>
 <3CDD1188-7B2A-4D53-9B8F-C07BC39844E9@kernel.org>
 <19d0e63c-db47-8f02-2f79-0923f675898c@alu.unizg.hr>
 <DA3FEB08-DF39-406B-89CC-9076CFCF597A@kernel.org>
 <CAG48ez0kmSqS_WJ1=neKpxKmMMkPYgNHfBD6ZSif_EWnso84wQ@mail.gmail.com>
 <202307051405.E746464@keescook>
 <20230705213113.GC2813335@hirez.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230705213113.GC2813335@hirez.programming.kicks-ass.net>

On Wed, Jul 05, 2023 at 11:31:13PM +0200, Peter Zijlstra wrote:
> On Wed, Jul 05, 2023 at 02:08:09PM -0700, Kees Cook wrote:
> 
> > > Even just a "WARNING: CONFIG_UBSAN_TRAP active, #UD might be caused by
> > > that" on every #UD that does not come from a known BUG() location or
> > > such might be better than nothing...
> > 
> > I've considered it, but usually CONFIG_UBSAN_TRAP isn't accidentally
> > set. Also, the crash info is something we can get help from on the
> > compiler side, to mark up where the traps are, similar to what we do
> > with KCFI, but it hasn't happened yet for x86. For example, arm64
> > already encodes the details in the trap instruction itself:
> > https://git.kernel.org/linus/25b84002afb9dc9a91a7ea67166879c13ad82422
> 
> Right, so you could easily use a different #UD instruction that has an
> immediate, something like:
> 
>   0f b9 40 ff          ud1    -0x1(%rax),%rax

Ah yeah, that would be easier, probably. It could match what arm64 does.

-- 
Kees Cook
