Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C5B2571
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 03:34:03 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-656307a52e8so3573676d6.1
        for <llvm@lists.linux.dev>; Thu, 14 Sep 2023 20:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694748842; x=1695353642;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iaRpWeQBHF9xrScwEaYmj1hDO7gFWhFOcR6aMt6yIR4=;
        b=Xk2EV8UX+NWwPWLSt8Fdd5WlzjR6m33bUasMXjoWjalsetrrfAjhrvuSyRpyQHXsqY
         RKK5pDvY5SoZaHLWIMj1OUcLhXweq77yN67nc4DGMbx+FTpGesjh62ruJeH8g64E9pei
         /qdvw3fsfg5FJLw2DSYSKLTOVtn7yYpbnBWP/wtLjsebFIP/az2ZRCpaW/nX2Q8JsUy6
         TvjY5/WN7RROZj+SxHwPDAzCo0Kl+4HrksdbBa1n1iBWjN6Vo50ev00hT7pbdF0HHF5G
         0k6lmWNegWd7zRcpd9eeV6PI0iEAtfU/mDPUnwnxhlC5M+fJgAsYkhhNdWVXuDHKcdVl
         y0nQ==
X-Gm-Message-State: AOJu0YxWwvEawsxb77DUcdUKc4isUg+gY6oyLq41LCcT7nokkZfGZA0S
	4pyEKcQj1sLFEeo4L8d0nEIl
X-Google-Smtp-Source: AGHT+IEBEYKRA2Zo7KXzkVVYdgYjkcKhhHD3gv62cQKEjoTRsB89tTRb5JOZnctFnGbpqENER6tIsg==
X-Received: by 2002:a0c:b4c9:0:b0:635:f899:660b with SMTP id h9-20020a0cb4c9000000b00635f899660bmr523466qvf.36.1694748842373;
        Thu, 14 Sep 2023 20:34:02 -0700 (PDT)
Received: from localhost (pool-68-160-141-91.bstnma.fios.verizon.net. [68.160.141.91])
        by smtp.gmail.com with ESMTPSA id e3-20020ad44183000000b0063d30c10f1esm781581qvp.70.2023.09.14.20.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 20:34:01 -0700 (PDT)
Date: Thu, 14 Sep 2023 23:34:00 -0400
From: Mike Snitzer <snitzer@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Joe Thornber <ejt@redhat.com>, dm-devel@redhat.com,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [device-mapper-dm:for-next 2/4]
 drivers/md/persistent-data/dm-extent-allocator.c:530:24: error: expected ';
 ' after expression
Message-ID: <ZQPQqCzlu3AUtumF@redhat.com>
References: <202309151023.QPBCNoCN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202309151023.QPBCNoCN-lkp@intel.com>

On Thu, Sep 14 2023 at 10:54P -0400,
kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git for-next
> head:   edcabec81f12dfc9b86b05084bba3232efdc5e4e
> commit: 59d814674dd66fc64ba229605174bfe0b8e566d5 [2/4] dm persistent data: Introduce extent allocator
> config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230915/202309151023.QPBCNoCN-lkp@intel.com/config)
> compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230915/202309151023.QPBCNoCN-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309151023.QPBCNoCN-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/md/persistent-data/dm-extent-allocator.c:530:24: error: expected ';' after expression
>            spin_unlock(&ea->lock)
>                                  ^
>                                  ;
>    drivers/md/persistent-data/dm-extent-allocator.c:544:24: error: expected ';' after expression
>            spin_unlock(&ea->lock)
>                                  ^
>                                  ;
>    2 errors generated.


These were my fault.. Fixed, sorry about the noise.
