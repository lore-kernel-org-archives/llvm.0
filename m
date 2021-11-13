Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F60D2C85
	for <llvm@lists.linux.dev>; Sat, 13 Nov 2021 05:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636781706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LFzKqE9RVzhLRIM/wmAxW/pHpiqpuZvrpG3xcaPW7h0=;
	b=XJqya8LBhSdghaO9qBi6zU9M17lORu5zqaPzxGq6Mey93BovUDhCEAE30I7D/fTlDgOGzQ
	74Q1faMGGANXwjkWkO7hocht6G+K5mVCWTQi3p3jZ13QAy8vYhBHRq6XlgRXmq07bT5vhV
	b1Q4fke2pIVTMXbUfCDPcGU0Pb/m4Iw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-bMByNwROOgWIId28_rsLig-1; Sat, 13 Nov 2021 00:35:04 -0500
X-MC-Unique: bMByNwROOgWIId28_rsLig-1
Received: by mail-qt1-f199.google.com with SMTP id i5-20020ac85c05000000b002ae12b76e64so9016133qti.6
        for <llvm@lists.linux.dev>; Fri, 12 Nov 2021 21:35:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LFzKqE9RVzhLRIM/wmAxW/pHpiqpuZvrpG3xcaPW7h0=;
        b=C+l/6Zv7gYf1cc7b9uN3HSUxXNk2LusBcEomuZfuk1XU1JTj9PnhyHIXpqh8ekrDH3
         2NDP3I5n3YdOehIEpAyK9vSx5He1//w068I6ju+TsBcW0AYTxQcO63MO17I+WnJ6Jjtw
         0KuiKghrXIerpN0OBrjKnXhdx2auwf/n8MN78Fioa+sRjkskiMiw7HQh/gMkYTB4xY9c
         quILM0FMtqLvR64p8W+F7qkp2H3A7RzyUKlkR80JX2iy9yRRN6qszqM3/8ceZaSqltr7
         9Cw/KrYQItGJ8gQy2t/4bV3gOUSAJmFPHIuLKtYvhIWkSbGFfPYHxJ6OlKWAz8DQlNOj
         M8sw==
X-Gm-Message-State: AOAM531m6H/0PMu4IB6WGfGwTIOwCApqfulCWu2vzo1lB8kQ+i6kHyeK
	wa9wGXAzYivAmAE5OeyDJ/UIiUOH87G40TpqJRMH9fRtfrxJnHs0uVI4U6R8FaFTp0LZVyweYiL
	VCsasxn/+fYLpQw==
X-Received: by 2002:a0c:edb0:: with SMTP id h16mr19768487qvr.17.1636781704259;
        Fri, 12 Nov 2021 21:35:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwAaED6/agIG1WvqW8TcPPQ/AOthpv0DW4DNOp+JB3HSH0qASAfpU1X2C7L7y8I/SLCz/Cqcw==
X-Received: by 2002:a0c:edb0:: with SMTP id h16mr19768465qvr.17.1636781703947;
        Fri, 12 Nov 2021 21:35:03 -0800 (PST)
Received: from treble ([2600:1700:6e32:6c00::35])
        by smtp.gmail.com with ESMTPSA id ay42sm3826082qkb.40.2021.11.12.21.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 21:35:03 -0800 (PST)
Date: Fri, 12 Nov 2021 21:35:00 -0800
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: David Laight <David.Laight@aculab.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	"dvyukov@google.com" <dvyukov@google.com>,
	"seanjc@google.com" <seanjc@google.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>,
	"mbenes@suse.cz" <mbenes@suse.cz>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>,
	live-patching@vger.kernel.org
Subject: Re: [PATCH 20/22] x86,word-at-a-time: Remove .fixup usage
Message-ID: <20211113053500.jcnx5airbn7g763a@treble>
References: <YYlshkTmf5zdvf1Q@hirez.programming.kicks-ass.net>
 <CAKwvOdkFZ4PSN0GGmKMmoCrcp7_VVNjau_b0sNRm3MuqVi8yow@mail.gmail.com>
 <YYov8SVHk/ZpFsUn@hirez.programming.kicks-ass.net>
 <CAKwvOdn8yrRopXyfd299=SwZS9TAPfPj4apYgdCnzPb20knhbg@mail.gmail.com>
 <20211109210736.GV174703@worktop.programming.kicks-ass.net>
 <f6dbe42651e84278b44e44ed7d0ed74f@AcuMS.aculab.com>
 <YYuogZ+2Dnjyj1ge@hirez.programming.kicks-ass.net>
 <2734a37ebed2432291345aaa8d9fd47e@AcuMS.aculab.com>
 <20211112015003.pefl656m3zmir6ov@treble>
 <YY408BW0phe9I1/o@hirez.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YY408BW0phe9I1/o@hirez.programming.kicks-ass.net>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jpoimboe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Nov 12, 2021 at 10:33:36AM +0100, Peter Zijlstra wrote:
> On Thu, Nov 11, 2021 at 05:50:03PM -0800, Josh Poimboeuf wrote:
> 
> > Hm, I think there is actually a livepatch problem here.
> 
> I suspected as much, because I couldn't find any code dealing with it
> when I looked in a hurry.. :/
> 
> > Some ideas to fix:
> 
> > c) Update the reliable stacktrace code to mark the stack unreliable if
> >    it has a function with ".cold" in the name?
> 
> Why not simply match func.cold as func in the transition thing? Then
> func won't get patched as long as it (or it's .cold part) is in use.
> This seems like the natural thing to do.

Well yes, you're basically hinting at my first two options a and b:

a) Add a field to 'klp_func' which allows the patch module to specify a
   function's .cold counterpart?

b) Detect such cold counterparts in klp_enable_patch()?  Presumably it
   would require searching kallsyms for "<func>.cold", which is somewhat
   problematic as there might be duplicates.

It's basically a two-step process:  1) match func to .cold if it exists;
2) check for both in klp_check_stack_func().  The above two options are
proposals for the 1st step.  The 2nd step was implied.

I think something like that is probably the way to go, but the question
is where to match func to .cold:

  - patch creation;
  - klp_init_object_loaded(); or
  - klp_check_stack_func().

I think the main problem with matching them in the kernel is that you
can't disambiguate duplicate ".cold" symbols without disassembling the
function.  Duplicates are rare but they do exist.

Matching them at patch creation time (option a) may work best.  At least
with kpatch-build, the tooling already knows about .cold functions, so
explicitly matching them in new klp_func.{cold_name,cold_sympos} fields
would be trivial.

I don't know about other patch creation tooling, but I'd imagine they
also need to know about .cold functions, unless they have that
optimization disabled.  Because the func and its .cold counterpart
always need to be patched together.

-- 
Josh

