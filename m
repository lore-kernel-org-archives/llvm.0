Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630976AAC
	for <llvm@lists.linux.dev>; Tue, 12 Jul 2022 21:27:22 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id y2so9139633ior.12
        for <llvm@lists.linux.dev>; Tue, 12 Jul 2022 14:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m0YyLEzw3IkHIEc6hzXGbO7iGAv4+7wdnlnG9pY25FY=;
        b=FMJNqa++kuJpdQYJXjWWJcEWpD8+YWreVG7WugTc0ennaNQ4QR7g8pXILGxJlJ45Tv
         cB4XqYlFi6xnxR63ejBJexoF9BKMSG8ivgsWYOM6F3T9eOXrFw96hdTxCtFpg7cbuCUh
         gicIFv0swNlNJPJsLTNN5Zv1Y+5d49PtpDWn+lsVJ18QnUn7vApvzDoS48Tg2ffs/qQc
         1QdwHD3kSAX8nvdErP/G3gA9yj1QcMMoijpCESLcOKunlCtGyjrVyoQEwckhS71h9RFs
         4Dl/LY0JvOXaii8UM6oYj/xSqoywoU8cnGQuqLl5j/7qYIaB6loPcnbFqanDr59ekRr+
         V0nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m0YyLEzw3IkHIEc6hzXGbO7iGAv4+7wdnlnG9pY25FY=;
        b=UuzadF9AvcVKcWg09aw7mXfIxCgIcVveRmzrlW46JS06b/i7VgLBmY8zAqXhKKsH4T
         qFksNDwZSkFCPTIxQjUStQQ4Ch1T9ljCYV+qACfVo3BlmAe8e8B4DfojI/gh38DYpjGv
         8+oQ8KrjXEvE/LC+bLNAEm6kDDGCNFmqs7m5/AsDjPmhj8gWud9cvUt+7lRd1EViQ+N/
         MWxd6LkBRvDHp5ayc0RVRtYyNcAvRe173T9OFWF9RuK25TICf7C0SZ/GnSQohfcLDoBo
         MtP6nUL7sjvbMNeLHCLj1UjatxJAr8Xur3TMfUbZ2p4e7bfOc2dQVzOX+yNfg2IYFFSA
         0wXQ==
X-Gm-Message-State: AJIora/4Bjg1sXZT0fqHDXzaTjOVAz1ZooZwo3c1SKTTrqAakIPr8cNP
	TZ/QZ6Da8edeFU8nsmRJZvXkyG9jvx20rjEDHLcsmg==
X-Google-Smtp-Source: AGRyM1tNjr8o/bDVFpbm8D9wO5b8kklpsyfdub1zcBTGrK8QXVgsSC8mlph3W82pJqOwau91MwVRx/tD9fxDqB4UnFQ=
X-Received: by 2002:a05:6602:340b:b0:67b:8189:23c5 with SMTP id
 n11-20020a056602340b00b0067b818923c5mr130294ioz.52.1657661241327; Tue, 12 Jul
 2022 14:27:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220712095627.1770312-1-davidgow@google.com>
In-Reply-To: <20220712095627.1770312-1-davidgow@google.com>
From: Daniel Latypov <dlatypov@google.com>
Date: Tue, 12 Jul 2022 14:27:10 -0700
Message-ID: <CAGS_qxrBGcz4gAtqu8QSJO8SP_a0n+18OiBVQaRXBQMwbL4w+Q@mail.gmail.com>
Subject: Re: [PATCH] kunit: executor: Fix a memory leak on failure in kunit_filter_tests
To: David Gow <davidgow@google.com>
Cc: Brendan Higgins <brendanhiggins@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	kernel test robot <yujie.liu@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 12, 2022 at 2:56 AM David Gow <davidgow@google.com> wrote:
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

Reviewed-by: Daniel Latypov <dlatypov@google.com>

Thanks for taking care of this.
