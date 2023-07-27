Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F6EC12B
	for <llvm@lists.linux.dev>; Thu, 27 Jul 2023 07:07:52 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5221cf2bb8cso794855a12.1
        for <llvm@lists.linux.dev>; Thu, 27 Jul 2023 00:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690441670; x=1691046470;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fqOQsXekD6sFK6WYy17hOsZp5/7SJav2yrMJmcsMwVY=;
        b=CkvLBbKQENAUcbdYvtjnKhFCuEDdLZPn61JZ57yc6kd0UPug8w5y/OYsJT5jKQJfWo
         TGCTVwSYh/r5zyrfgk1bSPTWA1KVfxM0K0HJsawUrnztpVaGfy0hCGnpKL4QlHaT7Ycb
         IAlmdhwQJDwzqOcPllqwITEJ8VELWlwVpImt58DEjCEPpKFUYOgKPKPua3Cgt3WvO/q8
         pJ4TMPasE5wfrHQmCkSbzKKYLDFfvn7OeEHv6qyqLxnlQlTzkiWAJeazaFO/qEvIJXnb
         pXCu1ghmG5fvaNo5bgVfStImnVYOH/8paAED3pWkCjTjuZoKZOBteInaBvGRuVe/+Wve
         eO6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690441671; x=1691046471;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fqOQsXekD6sFK6WYy17hOsZp5/7SJav2yrMJmcsMwVY=;
        b=aycg5c8CYpg4pIKcHBjg4YLB5F+/ttuZvB/Ye6lnrr8/u2UXnQUqqViJrujv0B2DMc
         kE4uYdwbNxc2gFohrhJscrQ18m12FUPXAszHirlD+noLJymuj0oPMuzcacBMKjmLnoCJ
         /Br6rY9q6yOr8ZchAma4rm2u9mIgNdQoM1SnA/vDGYAH8RwR7QgCKhECrY8S0sgwfWCJ
         LMMn+qRWJfqDx2T597HY1GUekEAZW33ouDYPsGwdMToHxVizEo5pC/M58X5qiJR3eS5R
         qFauV8WoJlJRk9Dbt/pBQfoCA2J+at8uM2g2fXFS9iyHr0/qo6kT6WQF62iZYctCZ3Ab
         OvFw==
X-Gm-Message-State: ABy/qLZKX/1o3e7YKQDHiU8dVp8bnrcSb22WFIqmDxeD54wR9v0uYa8v
	Jotvm4uz6l/ntAveZWRlY+BnZg==
X-Google-Smtp-Source: APBJJlH0jrNgLEoeZag63NmlA+d74+LDSnMgmUsHAoDTB3LniXqupxvPa61maXNWsNZ+1q5a7JpmTA==
X-Received: by 2002:aa7:c490:0:b0:522:5855:ee78 with SMTP id m16-20020aa7c490000000b005225855ee78mr953040edq.32.1690441670722;
        Thu, 27 Jul 2023 00:07:50 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id b21-20020a056402139500b005227e53cec2sm296242edv.50.2023.07.27.00.07.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 00:07:50 -0700 (PDT)
Message-ID: <5bb55bec-6a38-3a88-3fc1-79b12cfe7e02@linaro.org>
Date: Thu, 27 Jul 2023 09:07:48 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/3] input: pm8xxx-vib: refactor to easily support new
 SPMI vibrator
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, Fenglin Wu
 <quic_fenglinw@quicinc.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, agross@kernel.org, andersson@kernel.org,
 dmitry.baryshkov@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 quic_collinsd@quicinc.com, quic_subbaram@quicinc.com,
 quic_kamalw@quicinc.com, jestar@qti.qualcomm.com
References: <20230725054138.129497-2-quic_fenglinw@quicinc.com>
 <202307251741.PMtlVAgD-lkp@intel.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <202307251741.PMtlVAgD-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/07/2023 12:01, kernel test robot wrote:
> Hi Fenglin,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on dtor-input/next]
> [also build test WARNING on dtor-input/for-linus linus/master v6.5-rc3 next-20230725]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Fenglin-Wu/input-pm8xxx-vib-refactor-to-easily-support-new-SPMI-vibrator/20230725-134504
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
> patch link:    https://lore.kernel.org/r/20230725054138.129497-2-quic_fenglinw%40quicinc.com
> patch subject: [PATCH v3 1/3] input: pm8xxx-vib: refactor to easily support new SPMI vibrator
> config: x86_64-buildonly-randconfig-r002-20230725 (https://download.01.org/0day-ci/archive/20230725/202307251741.PMtlVAgD-lkp@intel.com/config)
> compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
> reproduce: (https://download.01.org/0day-ci/archive/20230725/202307251741.PMtlVAgD-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307251741.PMtlVAgD-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> drivers/input/misc/pm8xxx-vibrator.c:190:17: warning: cast to smaller integer type 'enum pm8xxx_vib_type' from 'const void *' [-Wvoid-pointer-to-enum-cast]
>            vib->hw_type = (enum pm8xxx_vib_type)of_device_get_match_data(dev);
>                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    1 warning generated.
> 

Remember to fix all the warnings.

Best regards,
Krzysztof

