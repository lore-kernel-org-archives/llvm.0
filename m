Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C6A2194BA
	for <llvm@lists.linux.dev>; Tue, 12 Nov 2024 19:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731440222; cv=none; b=eU0C2yVIXDwlR7+B9B+owl0P6ykYo2TZahjOiJuvzlZM/Fqh9cplQCnAwRWXBr5DinIvVSuHxNLuH6estqVv25i9eUeXEXto6roYC6xnDvbInEHdXcnKCsGJL3wbEJyxCcNE59ynCb427I6IaSSO3Zi9tPAICFpsPD9NZ0tvsHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731440222; c=relaxed/simple;
	bh=O7DCfxLNIjwrCueTIP4Z+l3hI1xzaNRDEQ+l2VDaSOM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=itmHgIAWN8ZV7UYLVDT01LdcHlGB/EC+N/eVChOo2FGmTtmiqEk0ZxznJBSOnwSEPV9ieBLdCpgrJZKWwhwpTs+fmc+LaNHhCkiL4hunPvpmjiuwpfFJe+TXM+gN9REo6V0ROGY4nJmKZC7rjbrM8wixDAVyXbg1pBEqLcEobOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a+2CH45v; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a+2CH45v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731440219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CjDs1uVD5LcAdcMcEag2yGHlBTAQ4ZFwPkuS7Zep/7A=;
	b=a+2CH45vLGTaSMLfbBW0oHeBkhAtbwTB+qHwTZUwWM4CNumXhki3f92sqKlN38tWhMASDL
	axLVcbTNcG2SmB9KbxzNUKrniRpmvYu3OGTSHuGMr1QWzmR+6dv9IMkP6oYdzADr2z5mHu
	30jIwve9rngNFC8X8bov7xC+cMMSBgg=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-340-Sgk_EptINd2nnODTo5-GOw-1; Tue, 12 Nov 2024 14:36:56 -0500
X-MC-Unique: Sgk_EptINd2nnODTo5-GOw-1
X-Mimecast-MFC-AGG-ID: Sgk_EptINd2nnODTo5-GOw
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6cbebfc1725so105313176d6.1
        for <llvm@lists.linux.dev>; Tue, 12 Nov 2024 11:36:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731440216; x=1732045016;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CjDs1uVD5LcAdcMcEag2yGHlBTAQ4ZFwPkuS7Zep/7A=;
        b=a2Yuj9ylsLYSCLmsA6FYN7j/fQuX14mMu+5f/tI7F3kOo6vJ0JsnVCl/XHOmydU5F2
         J83ElUpUWG2PAs+86tPMGilKvCtXsSvF2Mp2GV3+5aGo8Ct1RuQijKND5nodstODtPkg
         6IsDlmRE1qt4cORt5GqIBKmZrNQ27xtTjL4T7gHnGghroKX0cO8UgpRwh9IwWMw9DwuQ
         11+xl+ICoq56zw9H74bMo3yMt2UQxUgtmpD5wMy8GptT40FQaX9enXgDfTNPM+wpvAsn
         kb2fBdfe/x02rnaIVv/w/32nITTCdppIdN8O80t+JaX6IbjVAj7l19oZC6P+eSNJPbN+
         RfdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHOMa624XQIwVvyG/hU7cfWoF1yD8F5Xuu8nXr3sDFD8D7gTHSf/4hR2mT+gHk+NQ86X6P@lists.linux.dev
X-Gm-Message-State: AOJu0YxmMT4BTdIaTRin0labMWWp/hM3+tEF1y0CgVtsVA69abbuW2JX
	YNEwK8w9ssgGLhZgrPjHdyO1VkoGB9LT/3NXHskUfdPhGpkVZUCtC9QaPoMHRPZ8G5H3f/ggTfc
	Dgldp4oAKO+O0K5xadwjok7AdL7tSH8RgfqDUJ2S5gp++8eXBDsk=
X-Received: by 2002:a05:6214:4909:b0:6cb:d512:e6e6 with SMTP id 6a1803df08f44-6d39e12e459mr225840346d6.23.1731440216269;
        Tue, 12 Nov 2024 11:36:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1EIIGXTnIdaiArjVBMT7oIJoOZkcHkKo0u0kUztGcBK1Xhlva/oXoFZG4eDiT0EjZb8zefA==
X-Received: by 2002:a05:6214:4909:b0:6cb:d512:e6e6 with SMTP id 6a1803df08f44-6d39e12e459mr225840066d6.23.1731440216031;
        Tue, 12 Nov 2024 11:36:56 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-141-166.abo.bbox.fr. [213.44.141.166])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3961f4d37sm74519616d6.51.2024.11.12.11.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 11:36:55 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra
 <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent
 Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann
 <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben
 Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt
 <justinstitt@google.com>
Subject: Re: [PATCH v1 1/1] sched/fair: Mark cfs_bandwidth_used() and
 m*_vruntime() with __maybe_unused
In-Reply-To: <ZzNx4D5lWVhTG7bk@smile.fi.intel.com>
References: <20240905171210.267626-1-andriy.shevchenko@linux.intel.com>
 <xhsmh7c98d65h.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <ZzNx4D5lWVhTG7bk@smile.fi.intel.com>
Date: Tue, 12 Nov 2024 20:36:52 +0100
Message-ID: <xhsmh1pzgckh7.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vq_HyBamZ1AFotdxpVqNO6Qh5BArLzVLJw03QW80RhE_1731440216
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

On 12/11/24 17:18, Andy Shevchenko wrote:
> On Tue, Nov 12, 2024 at 12:48:42PM +0100, Valentin Schneider wrote:
>> On 05/09/24 20:12, Andy Shevchenko wrote:
>> > When cfs_bandwidth_used() is unused, it prevents kernel builds
>> > with clang, `make W=1` and CONFIG_WERROR=y:
>> >
>> > kernel/sched/fair.c:526:19: error: unused function 'max_vruntime' [-Werror,-Wunused-function]
>> >   526 | static inline u64 max_vruntime(u64 max_vruntime, u64 vruntime)
>> >       |                   ^~~~~~~~~~~~
>> > kernel/sched/fair.c:6580:20: error: unused function 'cfs_bandwidth_used' [-Werror,-Wunused-function]
>> >  6580 | static inline bool cfs_bandwidth_used(void)
>> >       |                    ^~~~~~~~~~~~~~~~~~
>> >
>> > Fix this by marking them with __maybe_unused (all cases for the sake of
>> > symmetry).
>> >
>> 
>> I assume that's with CONFIG_CFS_BANDWIDTH=n? Looks like
>> cfs_bandwidth_used() uses are tucked away under helpers that themselves
>> only really do something for CONFIG_CFS_BANDWIDTH=y, so you could remove
>> the CONFIG_CFS_BANDWIDTH=n definition of cfs_bandwidth_used() directly.
>
> Thanks for looking into this!
>
>> This compiles:
>
> okay, consider then my patch as a report. Can you submit your version as you
> seems much more familiar with this code than me?

Sure, I'll add this to my todolist.

