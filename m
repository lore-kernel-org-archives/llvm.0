Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BC92C80
	for <llvm@lists.linux.dev>; Mon, 15 Nov 2021 13:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636981279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nats6Tb5h/tFfC8AybE1A4hOx07KzU2pOLvXBwr1UEU=;
	b=PSBWf7rujbsSt5DOLBlhz/xoelo5Z09znsy+IpxYLWY7nonij+n3coZiDR8b7J/UXbfwLy
	wNS/DCocMOC9FcfZ5YMLyWSBzzhTypPt+dDghKbvRMnbFQba8Ch96sYyfw23ZhSeKOU4hN
	E1+yWSKOAsjnXp5iqbXrN1H8Rb9iooA=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-u8OPfOdsPdCheAidqpSfFA-1; Mon, 15 Nov 2021 08:01:18 -0500
X-MC-Unique: u8OPfOdsPdCheAidqpSfFA-1
Received: by mail-qt1-f199.google.com with SMTP id p7-20020a05622a00c700b002b2f6944e7dso53914qtw.10
        for <llvm@lists.linux.dev>; Mon, 15 Nov 2021 05:01:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Nats6Tb5h/tFfC8AybE1A4hOx07KzU2pOLvXBwr1UEU=;
        b=VfMOqc+4ip4/tzkvyQa7pkfu3IWkVj8mzGWeRApzCwVUmCVtFSnHGPjCNPIV0ZhcZk
         220IAxsSKiqrVG0OZ0+UYCuTtxNxyHKWEcCquUo4Npekkxc5ZHZAsc9Mtv31X15ys6WV
         JbJ3q8fVTh2VDoob/b1qacerlmyW746M/o08m7EebNVUfH9OA4GNhQ23Dr6etATlfjOo
         673HRlZtzXbOqiLHKDTShibNUnhqaTsoLg/1w+/FcIU+wwfX8BpSjx9ws8IwEyZFN3j1
         657j2XPBHn3Wwd8ZcvxBXOdMYC/6MaXUKPas3ukifrRwBVh+eS/4FJz3kMyikD40g4lV
         jxfg==
X-Gm-Message-State: AOAM53113VUD30saTzkMgzbqAOm+2RfVm1efOGRSHF600ijOD5MF7dwp
	NqhTTvVYtIMtuQX36YUEZNrt3gFJ22K9zo2E0LEXXNwD05ItJJ8Fxp/lKnkUB79mjTN+MzQU/tI
	PjZhrKnwez1PfZg==
X-Received: by 2002:ac8:7f4d:: with SMTP id g13mr29560465qtk.215.1636981277154;
        Mon, 15 Nov 2021 05:01:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzxo1TcK9VaFtc0WGUCxGECNqw3DyHE06QastGf5ME9Y9wH8of7nS6CgIuc4ZtPxY+OPzSVtg==
X-Received: by 2002:ac8:7f4d:: with SMTP id g13mr29560174qtk.215.1636981275470;
        Mon, 15 Nov 2021 05:01:15 -0800 (PST)
Received: from [192.168.1.9] (pool-68-163-101-245.bstnma.fios.verizon.net. [68.163.101.245])
        by smtp.gmail.com with ESMTPSA id e13sm1816470qte.56.2021.11.15.05.01.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Nov 2021 05:01:15 -0800 (PST)
To: Miroslav Benes <mbenes@suse.cz>, Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
 David Laight <David.Laight@aculab.com>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "dvyukov@google.com" <dvyukov@google.com>,
 "seanjc@google.com" <seanjc@google.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 "linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>,
 live-patching@vger.kernel.org
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
 <20211113053500.jcnx5airbn7g763a@treble>
 <alpine.LSU.2.21.2111151325390.29981@pobox.suse.cz>
From: Joe Lawrence <joe.lawrence@redhat.com>
Subject: Re: [PATCH 20/22] x86,word-at-a-time: Remove .fixup usage
Message-ID: <68b37450-d4bd-fa46-7bad-08d237e922b1@redhat.com>
Date: Mon, 15 Nov 2021 08:01:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <alpine.LSU.2.21.2111151325390.29981@pobox.suse.cz>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=joe.lawrence@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11/15/21 7:36 AM, Miroslav Benes wrote:
> On Fri, 12 Nov 2021, Josh Poimboeuf wrote:
> 
>> On Fri, Nov 12, 2021 at 10:33:36AM +0100, Peter Zijlstra wrote:
>>> On Thu, Nov 11, 2021 at 05:50:03PM -0800, Josh Poimboeuf wrote:
>>>
>>>> Hm, I think there is actually a livepatch problem here.
>>>
>>> I suspected as much, because I couldn't find any code dealing with it
>>> when I looked in a hurry.. :/
>>>
>>>> Some ideas to fix:
>>>
>>>> c) Update the reliable stacktrace code to mark the stack unreliable if
>>>>    it has a function with ".cold" in the name?
>>>
>>> Why not simply match func.cold as func in the transition thing? Then
>>> func won't get patched as long as it (or it's .cold part) is in use.
>>> This seems like the natural thing to do.
>>
>> Well yes, you're basically hinting at my first two options a and b:
>>
>> a) Add a field to 'klp_func' which allows the patch module to specify a
>>    function's .cold counterpart?
>>
>> b) Detect such cold counterparts in klp_enable_patch()?  Presumably it
>>    would require searching kallsyms for "<func>.cold", which is somewhat
>>    problematic as there might be duplicates.
>>
>> It's basically a two-step process:  1) match func to .cold if it exists;
>> 2) check for both in klp_check_stack_func().  The above two options are
>> proposals for the 1st step.  The 2nd step was implied.
> 
> This reminded me... one of the things I have on my todo list for a long 
> time is to add an option for a live patch creator to specify functions 
> which are not contained in the live patch but their presence on stacks 
> should be checked for. It could save some space in the final live patch 
> when one would add functions (callers) just because the consistency 
> requires it.
> 

Yea, I've used this technique once (adding a nop to a function so
kpatch-build would detect and include in klp_funcs[]) to make a set of
changes safer with respect to the consistency model.  Making it simpler
to for the livepatch author to say, "I'm not changing foo(), but I don't
want it doing anything while patching a task" sounds reasonable.

> I took as a convenience feature with a low priority and forgot about it. 
> The problem above changes it. So should we take the opportunity and 
> implement both in one step? I wanted to include a list of functions in 
> on a patch level (klp_patch structure) and klp_check_stack() would just 
> have more to check.
> 

As far as I read the original problem, I think it would solve for that,
too, so I would say go for it.

-- 
Joe

