Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8DC168
	for <llvm@lists.linux.dev>; Thu, 13 Jan 2022 03:52:42 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id pj2so8945454pjb.2
        for <llvm@lists.linux.dev>; Wed, 12 Jan 2022 19:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=r9QyflpgjEtFsGD0y6UQIHwiwSsCeZuAWvAVlYRq76A=;
        b=o2TD16brmx4S02l2pFZqsiBYzFH65EenDO+ORWDUE+5kcT+lEQTu4d1roltstnue27
         M5zs3qtJNhBXleYhLjtIMUXOTktzesJsa9VwNx5WOVKKcj5OuniuOVRWHpiadYfsPvBi
         46cn5pUM3/plxEivE1gW0dd6CCvZ4cpJnDpSFbMuvBylCatqrGvYo7sEdLYPwCR2eGEb
         MPvV3meJYJBJcQxa5KNzI7ZwuUG/0lyRCW8Nols+ZXiUOL21o5NTHcnFy1gqE4tR/GFY
         zKevZIh3elUOsyc4e5a1i5Q/WvbY3287y+fBnNwAn5bgsWKkeoeevYKfF+rEGo43p+k7
         0N9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=r9QyflpgjEtFsGD0y6UQIHwiwSsCeZuAWvAVlYRq76A=;
        b=HiZfpJqa4WTnPE7yD6RE5jtAMh3J1dCZxXaJWuYlwSeX0s0aVYU0N39Fnjwk16G62Q
         OppcRYslgfE9WlhcuTxwqdBC9XVLQCZ4whxfoIjnzZw5Ddnr3Di6/wpW1c8yA8Sz6NDj
         Qjf0Q3Y7Fit81dFFTzoY7uHzR3DSCP/D5HI03320K+wPb050IlesZ5JaR8xp2GWiFC/p
         7wyIgfRtDlYbl+oqm2f4I5z4a/ny4Oofnu9+7ZmDVByra1gquludws1IZLgc638p/8Wx
         9GM4bLdz6sseCQ7tEdkgvmW8gV2EzILJFeBaYGbax7db2t4lKw3Hcr0LVnhCdN6PhJ/w
         tbuA==
X-Gm-Message-State: AOAM533TQ2EFz0kMrAawAkktGXQBxTd8w95pyQZX0KwVeze5PNDHJDS4
	RZNuX2iXZHPKVO6Pdo1PJBI=
X-Google-Smtp-Source: ABdhPJwwWxoslApxFsiVtYkuwtL5ZI8XxhQh1o2v9BwAZLlmJGlowY9EZcAj4B1Kz4+4xJPU44qXaQ==
X-Received: by 2002:a17:90b:1e4f:: with SMTP id pi15mr10138378pjb.154.1642045962415;
        Wed, 12 Jan 2022 19:52:42 -0800 (PST)
Received: from [172.20.120.1] ([61.16.102.70])
        by smtp.gmail.com with ESMTPSA id q43sm6650023pja.29.2022.01.12.19.52.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jan 2022 19:52:41 -0800 (PST)
Message-ID: <99bc0b86-0f57-e827-3f7a-33385f4f5003@gmail.com>
Date: Thu, 13 Jan 2022 11:52:36 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH 01/13] blk: make blk-rq-qos support pluggable and modular
 policy
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, axboe@kernel.dk
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, jbacik@fb.com,
 tj@kernel.org, bvanassche@acm.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220110091046.17010-2-jianchao.wan9@gmail.com>
 <202201130903.7ZvBIOs4-lkp@intel.com>
From: Wang Jianchao <jianchao.wan9@gmail.com>
In-Reply-To: <202201130903.7ZvBIOs4-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 2022/1/13 9:49 上午, kernel test robot wrote:
> ll warnings (new ones prefixed by >>):
> 
>    block/blk-iocost.c:1244:6: warning: variable 'last_period' set but not used [-Wunused-but-set-variable]
>            u64 last_period, cur_period;
>                ^
>>> block/blk-iocost.c:3348:7: warning: variable 'ioc' is uninitialized when used here [-Wuninitialized]
>            if (!ioc) {

Thanks so much
I will fix this in next patch version.

Jianchao
