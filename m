Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7965A12
	for <llvm@lists.linux.dev>; Tue,  1 Mar 2022 11:57:25 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id m22so13906143pja.0
        for <llvm@lists.linux.dev>; Tue, 01 Mar 2022 03:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iCNKzMB3zJY1Cup+wCHOA/6XbdbbVPqzoSV520MdTO8=;
        b=Ff4ktQ5KKJx0s8HRLGCt+7cwr4HZd5dVVI6ZlaD8l2kVHCHHlvldF3E1lB7CE3UGap
         phvojgHmyqstT7jawaqzDljvLk0NWdX61QfHG1U/mzvDzRLty8l5hgR9C+XLHrjf/QvQ
         W5gFBIjIjpHm/KMBdpI9aJXa1/H5vCmx97V72UleBgH5x9YKBZ75YcuXwBUzVMDE84lm
         /Z2u9aObPkXdetor6TeUgRhoZQbY2xLKEAtkjLyahJYllbqt77pxH31+FyU+dhzabNr2
         9Oo3mBfKL535y12p7vZ5uQQB1sjfhAweyj2T+vh49soqhmlStabH67TGez6yTDfcSglV
         hWBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iCNKzMB3zJY1Cup+wCHOA/6XbdbbVPqzoSV520MdTO8=;
        b=dnRSKUqCcCtivEtCzh+ycR0H7R10Uo+T3YMwbpavONLcmkmE7T7dX6OC1JABJEAwQU
         VGgmsUkxdqye6xGdNxM5lGtOM5ixg+hhJpXROuO+KBEnoTqoVZV61r4KJax31kOvSkpK
         +f0lFfDuv5UPh3lV3/8qt1iTEmFMJg+5lahzjAIq+kXrdYU5pkkUQDx6Lk9Q12opTY65
         JdjrqfCw2aQYoDz7NAHVLG2CiVpkNTU7IPpiNi09ggYNd7IEYyejNL7lcMYwf/CS+vtw
         LGZRp1OcVaszEeA2pGz70j6NlQgiJXRXj+jg4/hfSSxyVwV34dYl+yKmNp31Q3IvZI1j
         EueQ==
X-Gm-Message-State: AOAM531CpDRWkjQW8sjfxubhJ/9L/avDqcEsiCxQKBfGAljKdO39F0lW
	B4oFr2Xkv5bBRp/qs7oPzJ4=
X-Google-Smtp-Source: ABdhPJz4aYN7GN3SvS8gGUwUqQMzUEWprZzc/s97hxL6yA/ucBXFi9OJLcTohT81Ul8Eyf1pAhBqQg==
X-Received: by 2002:a17:90a:bb8d:b0:1bc:72a9:a07d with SMTP id v13-20020a17090abb8d00b001bc72a9a07dmr21284515pjr.9.1646135845014;
        Tue, 01 Mar 2022 03:57:25 -0800 (PST)
Received: from localhost ([2405:201:6014:d0c0:6243:316e:a9e1:adda])
        by smtp.gmail.com with ESMTPSA id e30-20020a056a0000de00b004ef299a4f89sm17380511pfj.180.2022.03.01.03.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 03:57:24 -0800 (PST)
Date: Tue, 1 Mar 2022 17:27:22 +0530
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: bpf@vger.kernel.org, llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>
Subject: Re: [PATCH bpf-next v1 6/6] selftests/bpf: Add tests for kfunc
 register offset checks
Message-ID: <20220301115722.jjklznmjsbnkdsf2@apollo.legion>
References: <20220301065745.1634848-7-memxor@gmail.com>
 <202203011937.wMLpkfU3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202203011937.wMLpkfU3-lkp@intel.com>

On Tue, Mar 01, 2022 at 05:10:31PM IST, kernel test robot wrote:
> Hi Kumar,
>
> Thank you for the patch! Perhaps something to improve:
>
> [auto build test WARNING on bpf-next/master]
>
> url:    https://github.com/0day-ci/linux/commits/Kumar-Kartikeya-Dwivedi/Fixes-for-bad-PTR_TO_BTF_ID-offset/20220301-150010
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
> config: s390-randconfig-r021-20220301 (https://download.01.org/0day-ci/archive/20220301/202203011937.wMLpkfU3-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)

The same warning is emitted on clang for all existing definitions, so I can
respin with a fix for the warning like we do for GCC, otherwise it can also
be a follow up patch.

> [...]

--
Kartikeya
