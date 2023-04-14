Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF2E2C9A
	for <llvm@lists.linux.dev>; Fri, 14 Apr 2023 16:28:36 +0000 (UTC)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E66E63F438
	for <llvm@lists.linux.dev>; Fri, 14 Apr 2023 16:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1681489705;
	bh=wpNANq/ilARy9t0/XyiBw7GR8Agt/QoZqRUEJ1Ibgks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=c2j2Q6/HZlI5ipuEmFJ8gOtisV8uzDgZj2+splkD8b7I7PWbBtHdQKJQzn9EEkcee
	 t9d8bQK1ncC2FCCxy2mhaCOUjFIHdA2c+RUqX+DnR3k5IdXyO5ffplXhkSTad1yGmH
	 LZeVyEqKmuRkjGMxYVf6TeW3iLSL5qAN7ovlwR4WvM5ZtrEOFDQCgDVRjEDUX4OtZK
	 +lMNLWQWD0+1bU1jDCG34Ry7LZLxZLGcsehkgoCc8D2iynus04lzETYTi9gV45I+MM
	 +vryDuZWBv/EBL/V0t3lODZGUozx3EF2V5Y+AB8CyV6QkZj2W/JvZPFD7B+CplsIMu
	 0O/qsP/km+QPQ==
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-504728f9332so3699173a12.2
        for <llvm@lists.linux.dev>; Fri, 14 Apr 2023 09:28:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681489705; x=1684081705;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wpNANq/ilARy9t0/XyiBw7GR8Agt/QoZqRUEJ1Ibgks=;
        b=ZIls/tnCa3kwbbB+lx/DuwYqWBZtb1DJgbBLymFxreu7cy9k0JjtkUUKQCd9cfA1ea
         wh2KbStImqc+ARkLYPgmJkHM6NXStzLvmJrms1xr8g5uh9qjcGfGZx03YGm5QRFEfMGX
         6oNb2NP+vO08e1UF1DRVj7S0gid1fRZdTjDbHKiveLVAmZ9D+z5pWua9xqhJ/pvAcEIH
         xBWc05nEZnKNFnffbwYF62BStHQEOHrj/+wwzWrFoz7+mp1pDrhJUd/QM+WBsM/jgW0m
         +gMoSSiUSBATGTUoSAz9yIQNZc8v4fjGJ/5sYKVp7KF0inINZXRb7ZxQqWEtxkBonHMF
         BOcA==
X-Gm-Message-State: AAQBX9fWoCfgkLPcJO0ZpFgjZT8h+RNpKSMMHTrE+NjRN/tsyhVZm74Z
	3s99lH5zAfaEuAhpw1LcvSvU2O6CU1JqH2sUV6C0a4iM7izoj1dYmAnFXhZMlG0FegELs1XyEvE
	Arfd5se7sacaGm54Bc3V1h3gJ304cnR0=
X-Received: by 2002:aa7:c954:0:b0:505:513f:3d2d with SMTP id h20-20020aa7c954000000b00505513f3d2dmr7043302edt.40.1681489705618;
        Fri, 14 Apr 2023 09:28:25 -0700 (PDT)
X-Google-Smtp-Source: AKy350YbGpRAixvk9knTsT5HdyKaFpVZaQIhjKQceN8mlrIOVuzQAKt2/2mI4XtLorXKKGVk3XV8Jg==
X-Received: by 2002:aa7:c954:0:b0:505:513f:3d2d with SMTP id h20-20020aa7c954000000b00505513f3d2dmr7043286edt.40.1681489705339;
        Fri, 14 Apr 2023 09:28:25 -0700 (PDT)
Received: from localhost (uk.sesame.canonical.com. [185.125.190.60])
        by smtp.gmail.com with ESMTPSA id q10-20020a056402032a00b004bd1fe2cc02sm2281873edw.16.2023.04.14.09.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 09:28:25 -0700 (PDT)
Date: Fri, 14 Apr 2023 18:28:24 +0200
From: Andrea Righi <andrea.righi@canonical.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
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
Message-ID: <ZDl/KFLy7wOBa2tj@righiandr-XPS-13-7390>
References: <20230412095912.188453-1-andrea.righi@canonical.com>
 <CAADnVQJ00Npkp=+XYaTybzaPnrcfK0nKrePAktVNBt2-YqWdEg@mail.gmail.com>
 <ZDjvZ7mx7+IsSCCO@righiandr-XPS-13-7390>
 <q5rj72tmwlpzx6qgkromem5t7q6xmen52aavfr65olnuv52f3z@wzs4p3xz3635>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <q5rj72tmwlpzx6qgkromem5t7q6xmen52aavfr65olnuv52f3z@wzs4p3xz3635>

On Fri, Apr 14, 2023 at 06:15:38PM +0200, Ilya Leoshkevich wrote:
> On Fri, Apr 14, 2023 at 08:15:03AM +0200, Andrea Righi wrote:
> > On Thu, Apr 13, 2023 at 09:56:00PM -0700, Alexei Starovoitov wrote:
> > > On Wed, Apr 12, 2023 at 2:59 AM Andrea Righi <andrea.righi@canonical.com> wrote:
> > > >
> > > > Building bpf selftests with clang can trigger errors like the following:
> > > >
> > > >   CLNG-BPF [test_maps] bpf_iter_netlink.bpf.o
> > > > progs/bpf_iter_netlink.c:32:4: error: incompatible pointer types assigning to 'struct sock *' from 'struct sock___17 *' [-Werror,-Wincompatible-pointer-types]
> > > >         s = &nlk->sk;
> > > >           ^ ~~~~~~~~
> > > > 1 error generated.
> > > 
> > > I cannot reproduce this and BPF CI doesn't complain about it either.
> > > What kind of clang do you use?
> > > Some special version and build flags?
> > 
> > I'm using Ubuntu clang version 15.0.7 (Ubuntu 23.04), no special build
> > flag (unless Ubuntu enables some different default flags, but it
> > shouldn't be the case... I'll double check).
> > 
> > -Andrea
> 
> Hi,
> 
> FWIW, I see similar errors when I don't use recent pahole.

I'm using pahole v1.24.

-Andrea
