Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC816AAC
	for <llvm@lists.linux.dev>; Tue, 12 Jul 2022 21:30:33 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id eq6so11771132edb.6
        for <llvm@lists.linux.dev>; Tue, 12 Jul 2022 14:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uu5ujFc12aNN3GGgqs6/6TW5s77fyJHq00hImXE08gI=;
        b=jp/YuOF9u9ixWxX/FaasM7zJIZ22SD11WXANkZsA2SXcXAqk7mL9xH4XlWADqdZPQ9
         oOQSf0lzznnLakgMnSuhLJAHL6h8LmBH5RFTFVE6i3vmTSJQkDTtJkgqnZP0ltTOMkVl
         ST/MvgqZCH1gUrAc4tD0hrC0e9TNkZ/NCqz2NhpOMuqMDbejg++UlauSXwid1e1gHrTC
         DcF6qNCmyGdBFU9Gub4Og+XCanv/trY/27bEp/WlQZJkJv5pNNkFJMvovd74SzZ9eX+d
         LqkD2bo/bPUDdUTus90upuXoRy7WZrDFsfWjHjOCNBzuDLWHnw3cAsn7QT9XWddnwwV3
         kBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uu5ujFc12aNN3GGgqs6/6TW5s77fyJHq00hImXE08gI=;
        b=kTyLMTZ+wWBVlQfBLVCwuNc3xz8hNRqhc5/oFZuv86dAaV4/DYDHTvE4ECBREXApS8
         D9BU5X++vx+Au+UIttujhqKizpjWPKqSjeFMc7DDs8NI+CFSOqV5l4VRRxUOLGGkrvD9
         2r06c29IEG9VxhxLp3zRpXb0aAaWxF5xgswV+L+e0Pf4F01QnWtUEY1f0iobWrNn8k3L
         C9++gbsAbUm9XBeOknwEUCxZBHk+dGdQR1CPn/y5wOeHqlT+27Elx49gxI7tMivOJY55
         eeaIWTvW4LXleujtnKiCdvftMbuSz+dKH7vrQJDhzrS7tGoJzTfBSq8yL05qJ6ELMixB
         kN+A==
X-Gm-Message-State: AJIora/nUaVqoi6sSPRhLqtLpERdrYA/YzeflOF1zVMgUJYk68R1CHMv
	vqtwSQEJXRKlAJ8Suto0qtqsaSNsP9Wo4/eDeYTRjg==
X-Google-Smtp-Source: AGRyM1u5z01hy3Db/V7yac0AKg4gJxLrEynC/5VZC4/iEhjgrrd8swu9Ogii71DuH6u8AeBeQIY6BBvqQvxRat1WNZA=
X-Received: by 2002:a05:6402:4488:b0:43a:7b6e:4b04 with SMTP id
 er8-20020a056402448800b0043a7b6e4b04mr199448edb.202.1657661431987; Tue, 12
 Jul 2022 14:30:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220712095627.1770312-1-davidgow@google.com>
In-Reply-To: <20220712095627.1770312-1-davidgow@google.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 12 Jul 2022 17:30:20 -0400
Message-ID: <CAFd5g46eTf_9i-JosUKiL5MQ_iTGNw5eO-TpokVh7PJevMztcQ@mail.gmail.com>
Subject: Re: [PATCH] kunit: executor: Fix a memory leak on failure in kunit_filter_tests
To: David Gow <davidgow@google.com>
Cc: Daniel Latypov <dlatypov@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	kernel test robot <yujie.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 12, 2022 at 5:56 AM David Gow <davidgow@google.com> wrote:
>
> It's possible that memory allocation for the copy will fail, but for the
> copy of the suite to succeed. In this case, the copy could be leaked.
>
> Properly free 'copy' in the error case for the allocation of 'filtered'
> failing.
>
> Note that there may also have been a similar issue in
> kunit_filter_subsuites, before it was removed in "kunit: flatten
> kunit_suite*** to kunit_suite** in .kunit_test_suites".
>
> This was reported by clang-analyzer via the kernel test robot, here:
> https://lore.kernel.org/all/c8073b8e-7b9e-0830-4177-87c12f16349c@intel.com/
>
> Fixes: a02353f49162 ("kunit: bail out of test filtering logic quicker if OOM")
> Reported-by: kernel test robot <yujie.liu@intel.com>
> Signed-off-by: David Gow <davidgow@google.com>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
