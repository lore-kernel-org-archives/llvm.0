Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9D43588A;
	Mon, 20 Nov 2023 19:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QO9yKx/x"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-32d895584f1so3418188f8f.1;
        Mon, 20 Nov 2023 11:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700509066; x=1701113866; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FJc2P+H4qPjnzt5JpGUrELEszaEwFiAuPe2HRvlRg1o=;
        b=QO9yKx/xvg0qrD4obfPohMsyEKZvZBTuzIc1hUkImh4jzmCV3m2VcHDZ6elDHSdhvX
         uNx+XkIbwST0M+6TgwJhqy2Qtw8WKL5n3nmI2O9zAsGatMsnzsuoakx61Andn2SAAAPp
         JSaYSBbR9HZuGdjh/nWajtaZh2g3fvfjl/E+lD0/bSzOvBODcNLXIWLr+cle+LOQZavB
         rcx8F5HW1i/Gc/Nblv0E/V0u3YnvGfDfiy1HBAXYIA0sz/YEn51Uk/hpMLV9jt9reqJD
         FjtMRUzlLtsTXJYMCHz2udHBFHO4R4WujdtmXCzDj5hNIKamT+Z1iMdfCCqZtrLwYlyA
         2GSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700509066; x=1701113866;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FJc2P+H4qPjnzt5JpGUrELEszaEwFiAuPe2HRvlRg1o=;
        b=t+nwMTFmSrlikMFR1GSgKOQ78a/VBUthuRBj7Fe+BsyogE89q1cNsMmwL9ojW7dSsv
         UDtDJ3Nu9mL6Nn9N9UqOR/R4s0cD7gBEz3M6pY+4k/VZgvYNn6BQZdeoXtmvhKFGI0vA
         Krg1l6vs0GO4+KdQr2fQSTRQBk/VYl7LsslJP1k7cscBJxh6mVtiwmP5xQ941sRqa3xc
         +I6I6c/er1p/mkxcQwVw1Llmrj6Vdo8Qx8DfBrT4w2oiIBFswldqIvM/ZvOuF97MVTs4
         voxe8roe7yoB9/CbkHpsPksF/QlFaRBB2sXLc4pIPLIqB41v8jFNkAqHkXFDqOaRAHhn
         E4mg==
X-Gm-Message-State: AOJu0YxcOgb/HGF0szp06d0WzVctg/Y3QOSPbGA8m6AifcC2A5YUbTdm
	sHbEZqB7D2SfFF9YzgiZhcE=
X-Google-Smtp-Source: AGHT+IFe18ytM1aq2L6AaKShOi/qMYrjVdBqfo/o3ScUl/4YH9tqS3A19QEE9XowLa4jOIzMF6gMMw==
X-Received: by 2002:a05:6000:1445:b0:332:ca81:4f2a with SMTP id v5-20020a056000144500b00332ca814f2amr2185283wrx.51.1700509065567;
        Mon, 20 Nov 2023 11:37:45 -0800 (PST)
Received: from ?IPV6:2a02:8071:b783:140:927c:82ba:d32d:99c1? ([2a02:8071:b783:140:927c:82ba:d32d:99c1])
        by smtp.gmail.com with ESMTPSA id c15-20020adfe70f000000b0032da8fb0d05sm12035201wrm.110.2023.11.20.11.37.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 11:37:45 -0800 (PST)
Message-ID: <9b5c1aa6-e40c-48f7-8962-ffb029a706ac@gmail.com>
Date: Mon, 20 Nov 2023 20:37:43 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drivers/firmware/qcom/qcom_scm.c:1652:34: warning: unused
 variable 'qcom_scm_qseecom_allowlist'
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: llvm@lists.linux.dev, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <202311191654.S4wlVUrz-lkp@intel.com>
 <f7500671-812d-42ab-a16e-3325e13324ff@gmail.com>
 <220a0b53-14eb-445a-9232-f8df314a29bf@kernel.org>
From: Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <220a0b53-14eb-445a-9232-f8df314a29bf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/23 19:51, Krzysztof Kozlowski wrote:
> On 20/11/2023 19:19, Maximilian Luz wrote:
>>
>>
>> On 11/19/23 10:13, kernel test robot wrote:
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>>> head:   037266a5f7239ead1530266f7d7af153d2a867fa
>>> commit: bdac188ec3c71800dd8419620224ee74ef37732a firmware: qcom: move Qualcomm code into its own directory
>>> date:   4 weeks ago
>>> config: s390-randconfig-002-20231119 (https://download.01.org/0day-ci/archive/20231119/202311191654.S4wlVUrz-lkp@intel.com/config)
>>> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231119/202311191654.S4wlVUrz-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202311191654.S4wlVUrz-lkp@intel.com/
>>>
>>> All warnings (new ones prefixed by >>):
>>
>> [...]
>>
>>>>> drivers/firmware/qcom/qcom_scm.c:1652:34: warning: unused variable 'qcom_scm_qseecom_allowlist' [-Wunused-const-variable]
>>>       1652 | static const struct of_device_id qcom_scm_qseecom_allowlist[] = {
>>>            |                                  ^
>>
>> Any ideas why this is supposedly unused? It should be accessed through
>> qcom_scm_qseecom_init() and qcom_scm_qseecom_machine_is_allowed().
>> Especially if CONFIG_QCOM_QSEECOM=y.
> 
> And in other cases? The bot reports specific failure on specific config.
> You have the config for this arch attached, so you can investigate.

Ah I see now. It's because of_match_node() is defined as macro if !OF
and not as function. I had assumed it's a regular (potentially empty)
function in either case, sorry.
  
> Anyway, short look at the code indeed tells it is unused. It's not
> referenced anywhere except of_match_node(). I can fix this.

Thanks for the fix.

Best regards,
Max
