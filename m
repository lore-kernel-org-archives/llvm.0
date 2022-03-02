Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C756153
	for <llvm@lists.linux.dev>; Wed,  2 Mar 2022 23:20:46 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id w37so2937597pga.7
        for <llvm@lists.linux.dev>; Wed, 02 Mar 2022 15:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ko8Es7ZJtjVO3NP/5pMNlDyCEfQwQh9f4P4oN5F0HKc=;
        b=SIwBw7VfRJCPINYHm+4ZQG49baQ2QQzZw/6oLDNyfJbsP9VSKSJOgcutBtl16/ONib
         v9rVLRHi1UvEC36pENc5cBM3B7nY9MX4zH6RFSX3jC9SmRri966+OUPOmKZHarWV3Uw0
         5M649Cn8MRv7IH2ezL4bOPwsoTljQ9kPDox+ra0Q7Fc26uWpFdqC6AzT2ff5Q94OzdD4
         2WtpNX+5It8m70KrT/+9QeISFJMJhn5mNKT8SF7dZ59a1SOAQZFfbGuoTfiKkc8opyl8
         2kztRDiMntQneVxCc7xuOBUohDiYmapFs85wlPgaCOFFz4Mn9mJ2I6Ti43JEgZjke2CW
         ft2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ko8Es7ZJtjVO3NP/5pMNlDyCEfQwQh9f4P4oN5F0HKc=;
        b=XoM+wWJ7YpXIbQ4OrzQtu8zQbe4GF9fgu3SlhYmCogmUOioa8B3k70UfqeJiRoDYX+
         LMMd0AWZcx3cXEBVOguzDqbwGXNikBHh4BaaE5cNIIMYbziRsLfJDobwNXjT7GW7Oleh
         jk4J99gALRaquR+OdLQvSGgBLfookZdra9kkD9ngYMbWxj+y/LtR1w7Jj1Ft5pmBcOCw
         pYtkrNl1rdA8OXMyL6Phw1uTAKrhK4i6s3g92LaQJzOhFMrEI8LNrtU6pD4Yi+e0NY/M
         ZFGpylSsmm+TuCfowTNpMplAVAZPLClqwG41943SYpZ+wSI0JFATmGuoT4rcgwsRJUoX
         VbBw==
X-Gm-Message-State: AOAM530biX0M3k+3OYdyNAbG2g74zuXyxdIxsogHtXdp8GTEqsiyKv18
	TKs7Mq3FZP4SnmUe7J2ASC/G9m7zBYapbGLEhSU=
X-Google-Smtp-Source: ABdhPJxkdMgxHAjuiogfMST1u3t0aIc/vYODaa/J5QdPoKTjpSqgeZq2FVS4GEx8TicBrzyXEefoxDhkr/5SN1LAYsk=
X-Received: by 2002:a05:6a00:1146:b0:4c9:ede0:725a with SMTP id
 b6-20020a056a00114600b004c9ede0725amr35832067pfm.35.1646263246087; Wed, 02
 Mar 2022 15:20:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220301065745.1634848-7-memxor@gmail.com> <202203011937.wMLpkfU3-lkp@intel.com>
 <20220301115722.jjklznmjsbnkdsf2@apollo.legion> <CAADnVQL-sSMacA8S-gvKTAz-CAdTaDgX=4ZZrwFL=zZKYC0-Aw@mail.gmail.com>
 <20220302231401.bvtffkq3oz7g4mxj@apollo.legion>
In-Reply-To: <20220302231401.bvtffkq3oz7g4mxj@apollo.legion>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 2 Mar 2022 15:20:34 -0800
Message-ID: <CAADnVQJucT4+Q7Yu=vcR0b+a1bkZv024UEm9Z=24gt_NrV1KVA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1 6/6] selftests/bpf: Add tests for kfunc
 register offset checks
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: kernel test robot <lkp@intel.com>, bpf <bpf@vger.kernel.org>, llvm@lists.linux.dev, 
	kbuild-all@lists.01.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 2, 2022 at 3:14 PM Kumar Kartikeya Dwivedi <memxor@gmail.com> wrote:
>
> On Thu, Mar 03, 2022 at 04:17:25AM IST, Alexei Starovoitov wrote:
> > On Tue, Mar 1, 2022 at 3:57 AM Kumar Kartikeya Dwivedi <memxor@gmail.com> wrote:
> > >
> > > On Tue, Mar 01, 2022 at 05:10:31PM IST, kernel test robot wrote:
> > > > Hi Kumar,
> > > >
> > > > Thank you for the patch! Perhaps something to improve:
> > > >
> > > > [auto build test WARNING on bpf-next/master]
> > > >
> > > > url:    https://github.com/0day-ci/linux/commits/Kumar-Kartikeya-Dwivedi/Fixes-for-bad-PTR_TO_BTF_ID-offset/20220301-150010
> > > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
> > > > config: s390-randconfig-r021-20220301 (https://download.01.org/0day-ci/archive/20220301/202203011937.wMLpkfU3-lkp@intel.com/config)
> > > > compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
> > >
> > > The same warning is emitted on clang for all existing definitions, so I can
> > > respin with a fix for the warning like we do for GCC, otherwise it can also
> > > be a follow up patch.
> >
> > Separate patch is fine.
> > How do you plan on fixing it?
> > What is __diag_ignore equivalent for clang?
>
> Hmm, looks like I'll have to add those in include/linux/compiler-clang.h. Quick
> local testing suggests it will work with _Pragma("clang diagnostic ignored ...").

Make a generic llvm/gcc #define for
__diag_ignore(GCC, 8, "-Wmissing-prototypes" ?
We need it in two places so far.
