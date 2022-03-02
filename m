Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F8033CA
	for <llvm@lists.linux.dev>; Wed,  2 Mar 2022 22:47:37 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id mg21-20020a17090b371500b001bef9e4657cso2724730pjb.0
        for <llvm@lists.linux.dev>; Wed, 02 Mar 2022 14:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MXwMgtp7aGEPftELBgU0R9BW5PS1bdwaZuOl3PeKffE=;
        b=AzeIDbYGU2d70QwtB9OxBXk29BbHNhJ18jUJKXFdS0hEXmD69ERbiMhaiwtqluqy4T
         kvB6opMLayDp0v5Fldmk5ZH7RpfoKR0TrWDQZeZ5ReuwuRDUG8XodbS0jK/g7KMtKYK+
         GWYxNKVggS5rYXrLuFnA0CeqiT20AMkbelfsCybd4WEDgBvRPUjpC0lk/1ich5HwoaAk
         xn+VhJio0M+ZoNi+izLxM28d54rIAkxMoiUehJWQCcmPMF0W1IMD8C/MNY2POSlrHNoo
         6qdxJfhhdu1Std0lzRjosLurnUpZn1ThPWJ4dcbtJcqb6AitglZl5QXHd9DSa5VT4cXU
         Jf0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MXwMgtp7aGEPftELBgU0R9BW5PS1bdwaZuOl3PeKffE=;
        b=exhVEZPiwnSxMIxrzZOMDJnp80pmydehA4UIPqmJOJDH1pCYp5u5aF/K+jLGH0OYye
         tP+BFl2fU3HSZHlOItjqxsB4q4fLt3Y6GNNan5GmGWJdLv3XjdRbEsJcKpqzTPahXpV+
         L0Qg0Onrf35MzgQb1Z5wR3tpYNeJiabVq9tiz50WADsBQ0pEuQK+2uYzKfG3sDswrN4n
         Sx767b7ygs1NLJUo7FDtX9IcClWVkB/GO7o0jcRAebo7Iy02x5H9+ZyYn9KlwFqPwo/L
         advhgjDQ44xVp5YWAvvUPkVUAroXIM+RNXJ07GuIw7v2anx1bKDvp3nyWTksgmwBE64q
         ZKwg==
X-Gm-Message-State: AOAM5339bgKQsL1trHrd/JrfOR7SLsIwBhcPoUb030y1d2VO4RfoUI3Z
	wtNAOZeLD5uqPEYM3WrBMKE+bp20pSCHlIIPWKQ=
X-Google-Smtp-Source: ABdhPJyOepaybsFAjIqZBxBAS7LOzKn/LEr98q2LFGXsGjk+ATwurexPlAX6WWWEw4pqyyPpBhxOlZ5fxOKG5yZB2/o=
X-Received: by 2002:a17:90b:1a81:b0:1bc:c3e5:27b2 with SMTP id
 ng1-20020a17090b1a8100b001bcc3e527b2mr2146407pjb.20.1646261257086; Wed, 02
 Mar 2022 14:47:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220301065745.1634848-7-memxor@gmail.com> <202203011937.wMLpkfU3-lkp@intel.com>
 <20220301115722.jjklznmjsbnkdsf2@apollo.legion>
In-Reply-To: <20220301115722.jjklznmjsbnkdsf2@apollo.legion>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 2 Mar 2022 14:47:25 -0800
Message-ID: <CAADnVQL-sSMacA8S-gvKTAz-CAdTaDgX=4ZZrwFL=zZKYC0-Aw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1 6/6] selftests/bpf: Add tests for kfunc
 register offset checks
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: kernel test robot <lkp@intel.com>, bpf <bpf@vger.kernel.org>, llvm@lists.linux.dev, 
	kbuild-all@lists.01.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 1, 2022 at 3:57 AM Kumar Kartikeya Dwivedi <memxor@gmail.com> wrote:
>
> On Tue, Mar 01, 2022 at 05:10:31PM IST, kernel test robot wrote:
> > Hi Kumar,
> >
> > Thank you for the patch! Perhaps something to improve:
> >
> > [auto build test WARNING on bpf-next/master]
> >
> > url:    https://github.com/0day-ci/linux/commits/Kumar-Kartikeya-Dwivedi/Fixes-for-bad-PTR_TO_BTF_ID-offset/20220301-150010
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
> > config: s390-randconfig-r021-20220301 (https://download.01.org/0day-ci/archive/20220301/202203011937.wMLpkfU3-lkp@intel.com/config)
> > compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
>
> The same warning is emitted on clang for all existing definitions, so I can
> respin with a fix for the warning like we do for GCC, otherwise it can also
> be a follow up patch.

Separate patch is fine.
How do you plan on fixing it?
What is __diag_ignore equivalent for clang?
