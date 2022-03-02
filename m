Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BEF33CA
	for <llvm@lists.linux.dev>; Wed,  2 Mar 2022 23:14:04 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id h17so2917387plc.5
        for <llvm@lists.linux.dev>; Wed, 02 Mar 2022 15:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6MZZKg76Uu6fTeP2WHxUNaLYjEwH0+kMrpeM8QvcEII=;
        b=U4dIHcJcXSEFAeFXkdMSfZz/MtfWZqMJXt9E25MWjxZMEeP1k6D06SGlMKkd9CtCPs
         Ork45JxwruKDiYOjZx9EEq/jLWS9GxZE12P8QrMJpYidS/1SUj4XG0QYnOmJ08klyn04
         tJPflyEjVYIfQ3GFloTEt0vZ7XXT3twXQS+lJPCetvjCr6Lc6SGtx0cNLTsDX+1+gLz6
         A0PRZFAS+ICMrw4fF/Jq1ntJfnByBBvufk+Qf5mf1YQO5TtBbJlIFxr64f1VSJgxbBOT
         zJQglD2O2ut9yFY3QSt99TofTcAH/TSHpdQOK+f1eFoL6Th/n+qDqcDVJd6nfyhOHJO4
         bEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6MZZKg76Uu6fTeP2WHxUNaLYjEwH0+kMrpeM8QvcEII=;
        b=TZaLcwRS5WGCaBvkd/WsdbbOSzZck3prKDgbQWdYUnYo+643t8kGXvzOPw0zqViZ8h
         DuQ6glOiYUNIFXiWYynFjsMeQ9JZwpbPIo5n9GwPbC7vWMpm0+StMWCj9dBu+Uc3Ybt7
         OCeJocszso7tS54SZpcfaEYUSz2aVTOsPmUyy9W2++X74l+rB8mx8KE9N5ue6hgq3UB3
         f5r422kcyA/mOO5rZVjMGb5iXb6kR78FdyfbibOBtnVf4DlXlmkIvUIPBg9VLeh79qR+
         U+7e0eN2fIu0/M2moD6aqt3NhFwRLcaV3cE1bX817PJbkwH/RnidYtnqn6L/NWzkgQOp
         SpPQ==
X-Gm-Message-State: AOAM532dAMKBEMLn0e0kjD3PJTSYsreqo7OmA5DG9qOMPUE+r+912sHc
	zuIZ0kel9Hna+5qCjsoCV70=
X-Google-Smtp-Source: ABdhPJwsMinvFGIELcISd8wwBPadUVTyfGzpYvf/+AaFc3t1W920rGxSNlDx2+/+eEZEVK+j+VdEPQ==
X-Received: by 2002:a17:902:7b8d:b0:14f:1aca:d95e with SMTP id w13-20020a1709027b8d00b0014f1acad95emr32781546pll.122.1646262843965;
        Wed, 02 Mar 2022 15:14:03 -0800 (PST)
Received: from localhost ([2405:201:6014:d0c0:6243:316e:a9e1:adda])
        by smtp.gmail.com with ESMTPSA id bh3-20020a056a02020300b00378b62df320sm182683pgb.73.2022.03.02.15.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 15:14:03 -0800 (PST)
Date: Thu, 3 Mar 2022 04:44:01 +0530
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: kernel test robot <lkp@intel.com>, bpf <bpf@vger.kernel.org>,
	llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>
Subject: Re: [PATCH bpf-next v1 6/6] selftests/bpf: Add tests for kfunc
 register offset checks
Message-ID: <20220302231401.bvtffkq3oz7g4mxj@apollo.legion>
References: <20220301065745.1634848-7-memxor@gmail.com>
 <202203011937.wMLpkfU3-lkp@intel.com>
 <20220301115722.jjklznmjsbnkdsf2@apollo.legion>
 <CAADnVQL-sSMacA8S-gvKTAz-CAdTaDgX=4ZZrwFL=zZKYC0-Aw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAADnVQL-sSMacA8S-gvKTAz-CAdTaDgX=4ZZrwFL=zZKYC0-Aw@mail.gmail.com>

On Thu, Mar 03, 2022 at 04:17:25AM IST, Alexei Starovoitov wrote:
> On Tue, Mar 1, 2022 at 3:57 AM Kumar Kartikeya Dwivedi <memxor@gmail.com> wrote:
> >
> > On Tue, Mar 01, 2022 at 05:10:31PM IST, kernel test robot wrote:
> > > Hi Kumar,
> > >
> > > Thank you for the patch! Perhaps something to improve:
> > >
> > > [auto build test WARNING on bpf-next/master]
> > >
> > > url:    https://github.com/0day-ci/linux/commits/Kumar-Kartikeya-Dwivedi/Fixes-for-bad-PTR_TO_BTF_ID-offset/20220301-150010
> > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
> > > config: s390-randconfig-r021-20220301 (https://download.01.org/0day-ci/archive/20220301/202203011937.wMLpkfU3-lkp@intel.com/config)
> > > compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
> >
> > The same warning is emitted on clang for all existing definitions, so I can
> > respin with a fix for the warning like we do for GCC, otherwise it can also
> > be a follow up patch.
>
> Separate patch is fine.
> How do you plan on fixing it?
> What is __diag_ignore equivalent for clang?

Hmm, looks like I'll have to add those in include/linux/compiler-clang.h. Quick
local testing suggests it will work with _Pragma("clang diagnostic ignored ...").

--
Kartikeya
