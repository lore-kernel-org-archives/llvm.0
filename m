Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C517A
	for <llvm@lists.linux.dev>; Thu, 10 Mar 2022 00:30:42 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id w12so6644037lfr.9
        for <llvm@lists.linux.dev>; Wed, 09 Mar 2022 16:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+bEaQ5W7/uwxuPOhbs7aFS9WiQFjr1dAU1fc+RFzx3w=;
        b=GO1t2zd3diCLOfc1GR/4QHxRBwrXV3/Ri2DyCkq4E1Njl+mjDqufI33kutF5DdEGbM
         gwB9uJ0GOTZZadP1Tx+ogWkrvDnn+qqvel7Ys+vdsRnsIM9i3ysfWrJ4HXUr8JdUKcrm
         8A2f7TXgUf1IHxsom0VuQZ+muNjQGSsk5YvC8JFZvHiaS81hWoKbwhk3n+AEmcByhmI2
         3xtNdmnsv5psAM65huJgPO0CxRkkDVJDB4Sjet93q4qclZOwmw6QnjR5wd7Yv/wnoodE
         3FRZGLdaYleo426aRw5WO3nGJPErBzgC1aGr/9IMEZoxny2/W4khl7VKOy0p1ToVzBr3
         HfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+bEaQ5W7/uwxuPOhbs7aFS9WiQFjr1dAU1fc+RFzx3w=;
        b=i3H6P1vDMVbLjI+9YxCqmZKI57o3QrzBza/fOmVwDaFkECyCBLZRO3Vvq8cyhBJD0s
         Ns2ggwT7n067pFyLbUPpPhpOswx1310O3WliGwxQVwMwh6PnmnFyQZ6MzhoSyNEiHwD0
         a8IB7MzLMjGX7u6tfOAZMQaRKHS4lyVsyjf0QzDnQIy7pGlb2cg9WzJfaxjt5nTzNo2d
         ni1gAma/nixkDkopcHf/vnntmdpu623Gjgg0FiQZufV/OgKJCogH5nReVLR6hjy1mDwn
         2on5Kqg1zd2THfCKMBQvsVhHUmRlDpM5nOLit4BbjQSYr/SudJ8ETvszTiBAH7MWBK95
         eQyg==
X-Gm-Message-State: AOAM533cbAZXAYLM2wIUmCZSByEt8FeVvng7f3vgHQOQA6NvLwjGU/GV
	RuZ4CjWfbEa7OS1SN/7iBYM0bgCTVAvDN6zuXnKmrw==
X-Google-Smtp-Source: ABdhPJzUUdb5H/LMWsKDBHyHNBeZMnD/yO8aJ/W7N28+TxUIsfQLa/4g1x3U6w4mi39mlp++/YJ9Y98gdyc+MF3LGG0=
X-Received: by 2002:a05:6512:308e:b0:448:3826:6d68 with SMTP id
 z14-20020a056512308e00b0044838266d68mr1329592lfd.184.1646872240210; Wed, 09
 Mar 2022 16:30:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220308153011.021123062@infradead.org> <20220308200052.rpr4vkxppnxguirg@ast-mbp.dhcp.thefacebook.com>
 <YifSIDAJ/ZBKJWrn@hirez.programming.kicks-ass.net> <YifZhUVoHLT/76fE@hirez.programming.kicks-ass.net>
In-Reply-To: <YifZhUVoHLT/76fE@hirez.programming.kicks-ass.net>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 9 Mar 2022 16:30:28 -0800
Message-ID: <CAKwvOdk0ROSOSDKHcyH0kP+5MFH5QnasD6kbAu8gG8CCXO7OmQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/45] x86: Kernel IBT
To: Peter Zijlstra <peterz@infradead.org>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, x86@kernel.org, joao@overdrivepizza.com, 
	hjl.tools@gmail.com, jpoimboe@redhat.com, andrew.cooper3@citrix.com, 
	linux-kernel@vger.kernel.org, keescook@chromium.org, samitolvanen@google.com, 
	mark.rutland@arm.com, alyssa.milburn@intel.com, mbenes@suse.cz, 
	rostedt@goodmis.org, mhiramat@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 8, 2022 at 2:32 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Tue, Mar 08, 2022 at 11:01:04PM +0100, Peter Zijlstra wrote:
> > On Tue, Mar 08, 2022 at 12:00:52PM -0800, Alexei Starovoitov wrote:
> > > On Tue, Mar 08, 2022 at 04:30:11PM +0100, Peter Zijlstra wrote:
> > > > Hopefully last posting...
> > > >
> > > > Since last time:
> > > >  - verified clang-14-rc2 works
> > > >   git://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/wip.ibt

I observed the following error when building with
CONFIG_LTO_CLANG_FULL=y enabled:

ld.lld: error: ld-temp.o <inline asm>:7:2: symbol 'ibt_selftest_ip' is
already defined
        ibt_selftest_ip:
        ^

Seems to come from
commit a802350ba65a ("x86/ibt: Add IBT feature, MSR and #CP handling")

Commenting out the label in the inline asm, I then observed:
vmlinux.o: warning: objtool: identify_cpu()+0x6d0: sibling call from
callable instruction with modified stack frame
vmlinux.o: warning: objtool: identify_cpu()+0x6e0: stack state
mismatch: cfa1=4+64 cfa2=4+8
These seemed to disappear when I kept CONFIG_LTO_CLANG_FULL=y but then
disabled CONFIG_X86_KERNEL_IBT. (perhaps due to the way I hacked out
the ibt_selftest_ip label).

Otherwise defconfig and CONFIG_LTO_CLANG_THIN=y both built and booted
in a vm WITHOUT IBT support.

Any idea what's the status of IBT emulation in QEMU, and if it exists,
what's the necessary `-cpu` flag to enable it?
-- 
Thanks,
~Nick Desaulniers
