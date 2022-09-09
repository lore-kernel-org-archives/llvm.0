Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897B4612F
	for <llvm@lists.linux.dev>; Fri,  9 Sep 2022 21:57:51 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id 9so2973284plj.11
        for <llvm@lists.linux.dev>; Fri, 09 Sep 2022 14:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=c1+vpScgxz7LgNGPJG7lEjY1wB2yXVvLAK09Ff0klGU=;
        b=JWl4mixpo5S1Nzb63cnamgw5jSxQC256Z4VHcZ5K+QlytCPl5BD/7CiBJV4pmivT+i
         7/h4czq5In76eMrUgefGI7jGTEiJ4EeRFLCAZ1HWW4Vx97eK7zGv5cRwBdJuyIG36zMC
         MsPstpiNj+Y3f7qzxiSSIrT1OE2tuwjttCXUNjlwzEu0wfDgr3krFfe4Lx6EZtpwBYOr
         hZcubbEgBlzJgQwwrD2WQR7hohjc018iVVmXLZRStytYDikwPAI9l7c89nYRhWLb6wvR
         uSBUGElkoiAMw3yXxjZeG9NWlSIT2NsYfT7jY4zMqXSvSBv0BGYL5JGYk0rBLzIgCD1A
         z9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=c1+vpScgxz7LgNGPJG7lEjY1wB2yXVvLAK09Ff0klGU=;
        b=qyca2WBnAlsWq1Yh3DZA/Zqui76AkS96ZVdZyiYq4ZqGv1uhtyDjpfPgU06wsFVtHi
         3Mb92bLi4z2laT7/ukHsrYorZalvMaDDphy/38YnwAhsZptw5Vh904ebwOX+7ZLa/9EI
         8J+GBUIrXSKSNgqkJsq4yFnVnWs9gW/MGoFSgGAwvnVcDPVR7+eY/CejqXgeGMmbQzlG
         FfUfy3RTrc9YKHwvZNwZ8Jh43EgCIUOaN+oyhSLVgwQ3gowNH5v1wm7AYNfQFMM0IdVY
         CLZ0oUQWxMSyNk2gpwoi+dU4S5LfQHa5QQZFow0YhRg3jbUdwYJF2pHlUgtXZlYd2ZER
         jd2g==
X-Gm-Message-State: ACgBeo2l1H6r/pRscKT9XPockMjmg0rVurPTwY+zn74cYxjqBGvlMnWN
	pnpGM/XSSvSuMNxdy3kCIw==
X-Google-Smtp-Source: AA6agR5tZX5pGBAfNhBUfW8VkhuwRC43GNl4gbZOGyhkitad6WZb6xlvBWLFrZxL0p9KhQmSv9iRng==
X-Received: by 2002:a17:90a:a415:b0:1fa:749f:ecfb with SMTP id y21-20020a17090aa41500b001fa749fecfbmr11868649pjp.112.1662760670997;
        Fri, 09 Sep 2022 14:57:50 -0700 (PDT)
Received: from bytedance ([74.199.177.246])
        by smtp.gmail.com with ESMTPSA id d23-20020a170902aa9700b00174849e6914sm920386plr.191.2022.09.09.14.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 14:57:50 -0700 (PDT)
Date: Fri, 9 Sep 2022 14:57:46 -0700
From: Peilin Ye <yepeilin.cs@gmail.com>
To: sdf@google.com
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>, bpf <bpf@vger.kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>, davem@davemloft.net,
	haoluo@google.com, hawk@kernel.org,
	John Fastabend <john.fastabend@gmail.com>, jolsa@kernel.org,
	KP Singh <kpsingh@kernel.org>, kuba@kernel.org,
	lkml <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev,
	martin.lau@linux.dev, nathan@kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Networking <netdev@vger.kernel.org>, Song Liu <song@kernel.org>,
	syzkaller-bugs@googlegroups.com, Tom Rix <trix@redhat.com>,
	Yonghong Song <yhs@fb.com>, Peilin Ye <peilin.ye@bytedance.com>
Subject: Re: [syzbot] WARNING in bpf_verifier_vlog
Message-ID: <20220909215746.GA12232@bytedance>
References: <000000000000e506e905e836d9e7@google.com>
 <YxtrrG8ebrarIqnc@google.com>
 <CAO-hwJJyrhmzWY4fth5miiHd3QXHvs4KPuPRacyNp8xrTxOucA@mail.gmail.com>
 <YxuZ3j0PE0cauK1E@google.com>
 <20220909211540.GA11304@bytedance>
 <YxuzdhmaHeyycyRi@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxuzdhmaHeyycyRi@google.com>

On Fri, Sep 09, 2022 at 02:43:18PM -0700, sdf@google.com wrote:
> On 09/09, Peilin Ye wrote:
> > On Fri, Sep 09, 2022 at 12:54:06PM -0700, sdf@google.com wrote:
> > > On 09/09, Benjamin Tissoires wrote:
> > > Yeah, good point. I've run the repro. I think the issue is that
> > > syzkaller is able to pass btf with a super long random name which
> > > then hits BPF_VERIFIER_TMP_LOG_SIZE while printing the verifier
> > > log line. Seems like a non-issue to me, but maybe we need to
> > > add some extra validation..
> 
> > In btf_func_proto_check_meta():
> 
> > 	if (t->name_off) {
> > 		btf_verifier_log_type(env, t, "Invalid name");
> > 		return -EINVAL;
> > 	}
> 
> > In the verifier log, maybe we should just say that BTF_KIND_FUNC_PROTO
> > "must
> > not have a name" [1], instead of printing out the user-provided
> > (potentially very long) name and say it's "Invalid" ?
> 
> > Similarly, for name-too-long errors, should we truncate the name to
> > KSYM_NAME_LEN bytes (see __btf_name_valid()) in the log ?
> 
> Both suggestions sound good to me. Care to cook and send a patch with a
> fix?

Sure, I will work on it.

Thanks,
Peilin Ye

