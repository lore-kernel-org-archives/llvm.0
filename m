Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556007C
	for <llvm@lists.linux.dev>; Fri, 14 Apr 2023 06:15:33 +0000 (UTC)
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0A89D3F229
	for <llvm@lists.linux.dev>; Fri, 14 Apr 2023 06:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1681452926;
	bh=4x1ielA7OU/wWOjnJ79+3XpTDh/ue6rRtFlaiIdzFqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=sp8NFKR0WVWNSxzwl8t/Z7wv67+DCFWLEt1BlxgCnymjBuOAfDiY5phhgCgv+eywi
	 XzhkuV5Er5e6S1xEMChnbny1z38T2C52/czd8jGV6gSFZlJsorqfxr8y2BbGCPFmKK
	 vr6aTo9ShgQQ07IeKAcNRbdrXWyeACf0V4UKOWhPgU/PdQlikNX9Nzwt/pYvCSj+Gq
	 dKXYLObIA8kzLgjMq+La1HVjHNrx4PIbXhh89TjE9mQrxE798n4hGjEZMbtL4T+M4l
	 RvHST1zyoeW1qTrqo72ko0UN30ijTkedYNcWrtdfp/Tp343FI0xlJpS6BKSuH8t7pV
	 cDv2LawFFH7LA==
Received: by mail-lf1-f72.google.com with SMTP id g28-20020a19e05c000000b004edaf554a64so1246489lfj.20
        for <llvm@lists.linux.dev>; Thu, 13 Apr 2023 23:15:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681452925; x=1684044925;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4x1ielA7OU/wWOjnJ79+3XpTDh/ue6rRtFlaiIdzFqA=;
        b=Rhqo8Y/6ShvsQHopHYFbNDxQS4/K9RHq4GL7H7J34SPCoS0aKANybDW1zPAY0ckcM6
         oxRqfVwkTdhbuZegaCSOB2vdgUcpKygXVH3ijJGWcBUFN5vMYpWEI1Kkw0EkBaAhLBuK
         x6D/YFQGe7ei3c1Mjx0NTM0YcsfAtPAc+fEAdtXvTsDako2kKlM3EHmhJbI4LlBpB6UK
         18DPo4OHC23kj8Ck6Tw3jeq3cA+GAufkRPW4gCO7ZDiYDHaZPRvHtMjKsaEc6zxEyCzN
         +jvCOUgh/VUhPVqCLZCaoCMAWAhx5g94xcjz8Jsnqd5c0O8NADkS1Im84ZBYEWXEb0e3
         sLgQ==
X-Gm-Message-State: AAQBX9elaJQc24SzD8oIThZmR5mAtrxOccuQ9msCQVOeuoF9/U9im9va
	XfyBwItlB24LOU/y9RV/lZHPLS756D596zM+rE/mlwfKU7Wo2Mb65SdheerNAvnUXefTk5jZKUM
	Ejw4yLPmQnunPq8M2yUepM0VQJDlMZEQ=
X-Received: by 2002:a5d:4949:0:b0:2ef:b977:ee3a with SMTP id r9-20020a5d4949000000b002efb977ee3amr3214598wrs.34.1681452904877;
        Thu, 13 Apr 2023 23:15:04 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZMWU0obXURDtM8C4VH2fQ+FRH6qv3QJQSMmxiEYCANgKRxwrF1qmRXzaL3awQ3sa15QW1Pzg==
X-Received: by 2002:a5d:4949:0:b0:2ef:b977:ee3a with SMTP id r9-20020a5d4949000000b002efb977ee3amr3214570wrs.34.1681452904560;
        Thu, 13 Apr 2023 23:15:04 -0700 (PDT)
Received: from localhost (uk.sesame.canonical.com. [185.125.190.60])
        by smtp.gmail.com with ESMTPSA id x17-20020a5d4911000000b002e55cc69169sm2794289wrq.38.2023.04.13.23.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 23:15:04 -0700 (PDT)
Date: Fri, 14 Apr 2023 08:15:03 +0200
From: Andrea Righi <andrea.righi@canonical.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>, Mykola Lysenko <mykolal@fb.com>,
	Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Paolo Pisati <paolo.pisati@canonical.com>,
	bpf <bpf@vger.kernel.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	clang-built-linux <llvm@lists.linux.dev>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] selftests/bpf: ignore pointer types check with clang
Message-ID: <ZDjvZ7mx7+IsSCCO@righiandr-XPS-13-7390>
References: <20230412095912.188453-1-andrea.righi@canonical.com>
 <CAADnVQJ00Npkp=+XYaTybzaPnrcfK0nKrePAktVNBt2-YqWdEg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAADnVQJ00Npkp=+XYaTybzaPnrcfK0nKrePAktVNBt2-YqWdEg@mail.gmail.com>

On Thu, Apr 13, 2023 at 09:56:00PM -0700, Alexei Starovoitov wrote:
> On Wed, Apr 12, 2023 at 2:59 AM Andrea Righi <andrea.righi@canonical.com> wrote:
> >
> > Building bpf selftests with clang can trigger errors like the following:
> >
> >   CLNG-BPF [test_maps] bpf_iter_netlink.bpf.o
> > progs/bpf_iter_netlink.c:32:4: error: incompatible pointer types assigning to 'struct sock *' from 'struct sock___17 *' [-Werror,-Wincompatible-pointer-types]
> >         s = &nlk->sk;
> >           ^ ~~~~~~~~
> > 1 error generated.
> 
> I cannot reproduce this and BPF CI doesn't complain about it either.
> What kind of clang do you use?
> Some special version and build flags?

I'm using Ubuntu clang version 15.0.7 (Ubuntu 23.04), no special build
flag (unless Ubuntu enables some different default flags, but it
shouldn't be the case... I'll double check).

-Andrea
