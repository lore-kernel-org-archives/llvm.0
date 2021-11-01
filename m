Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B7468
	for <llvm@lists.linux.dev>; Mon,  1 Nov 2021 14:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635777781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IimbsDmXt9JsV+5Ud+vfycacdBceMoawbI0yusPjM6Y=;
	b=O5CCm+KorB/Iv4PMIJAZX5QhgggEHp1jfknQlTF4ThCRIYdV4jEsLzcQsN5F7X5wlc7FKb
	ihyZObXBuEbw6aOQQqrxXYVYHgs40pU0GLnmpEjQJ4vsluhP2SMfZjhqJ1y+WkkFJUjQh0
	IpCAEfTYfRtvNLCFYTG7AYstV7FA1YQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-pwRDIOTYOOquOlVdXSBEjA-1; Mon, 01 Nov 2021 10:43:00 -0400
X-MC-Unique: pwRDIOTYOOquOlVdXSBEjA-1
Received: by mail-ed1-f71.google.com with SMTP id o22-20020a056402439600b003dd4f228451so15735844edc.16
        for <llvm@lists.linux.dev>; Mon, 01 Nov 2021 07:42:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IimbsDmXt9JsV+5Ud+vfycacdBceMoawbI0yusPjM6Y=;
        b=Qfjahm4xDZO1FkzLQ9va2TVIf8YvLqd2UYHYsKqPgnAtd5TiUzLqoLDcKzJlbveJdE
         MO//NYUatbDoRjvq7s48t3aAp14lErH85QkVoj8rqwiYBEsdBP6dryK6/AZKUNwAdMx5
         DwjU1Jp9ZrHnMpGGfcJV61yJlCpKA4A255a26vbafqhRr5I5Q45gY+jbSZYXGwylZHF9
         XjFK1x8Xd7BVygBs2hDFTHzO8Ph4oN9sY1clT80lc8iyJMRNZSwy1r62mpWKndLLaKZC
         uxqb6an1C00xzhJEmbHXw+vwN0U7jSj65IkiyHq/w1tahm5uEvztTRL8OwXmX6jCuBFw
         CJug==
X-Gm-Message-State: AOAM532BU4cVZGShaFoX9tATiYvV0gC349sFqcYmcSw2rL1dwhc8nsQv
	F0+rLT9JOu5n6p1F70S9w4JZ3ZCVDouHEjqnH5OUCxNEDQbgHroYoGkz7E2QUWPxwMHKw/BJnsL
	eChWXHSWrKB7BDg==
X-Received: by 2002:a17:906:3a0e:: with SMTP id z14mr29262255eje.111.1635777778917;
        Mon, 01 Nov 2021 07:42:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRv9BSqyeHZrkxI8HXDbJCrd6XZ9M6Vw0A2RLC8buZnu/68zqF4CSsKMaEqkwHGddkFeAclw==
X-Received: by 2002:a17:906:3a0e:: with SMTP id z14mr29262231eje.111.1635777778709;
        Mon, 01 Nov 2021 07:42:58 -0700 (PDT)
Received: from krava (nat-pool-brq-u.redhat.com. [213.175.37.12])
        by smtp.gmail.com with ESMTPSA id gs19sm3110772ejc.117.2021.11.01.07.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 07:42:58 -0700 (PDT)
Date: Mon, 1 Nov 2021 15:42:57 +0100
From: Jiri Olsa <jolsa@redhat.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, linux-kernel@vger.kernel.org
Subject: Re: [rostedt-trace:for-next 58/100]
 samples/ftrace/ftrace-direct-multi.c:8:6: warning: no previous prototype for
 function 'my_direct_func'
Message-ID: <YX/88QsleYGkt7PG@krava>
References: <202111010507.F9ud1mUL-lkp@intel.com>
 <YX/thIXtDzfhljX7@krava>
 <20211101102434.47e84754@gandalf.local.home>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20211101102434.47e84754@gandalf.local.home>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jolsa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 01, 2021 at 10:24:34AM -0400, Steven Rostedt wrote:
> On Mon, 1 Nov 2021 14:37:08 +0100
> Jiri Olsa <jolsa@redhat.com> wrote:
> 
> > > If you fix the issue, kindly add following tag as appropriate
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > 
> > > All warnings (new ones prefixed by >>):
> > >   
> > > >> samples/ftrace/ftrace-direct-multi.c:8:6: warning: no previous prototype for function 'my_direct_func' [-Wmissing-prototypes]  
> > >    void my_direct_func(unsigned long ip)
> > >         ^
> > >    samples/ftrace/ftrace-direct-multi.c:8:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
> > >    void my_direct_func(unsigned long ip)  
> > 
> > hum, that can actually be static.. I'll check
> > 
> 
> I'm not sure it can, because you call it from inline assembly, and the
> symbol may not be passed to the assembler.

yes, I just found that.. I actually could not add any input/output
arguments to asm, got a compilation error.. I think it's because
it's used outside any function

> 
> It may work with some options, but may not for all.
> 
> I think the best thing to do is just create a prototype to quiet the
> warning (with a comment).

ok, I'll send it.. should be on top of you for-next branch?

thanks,
jirka

