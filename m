Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D34F30326;
	Mon, 20 Nov 2023 18:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fp5yPpp5"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4083740f92dso18639265e9.3;
        Mon, 20 Nov 2023 10:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700504372; x=1701109172; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IkMvHwzXha8iL76L0Ewto8Z1j8l4Dl9NfZnV40iU1Vk=;
        b=fp5yPpp5gwXeHERs5XRzIFSbufOah2o2n2zOlGUBVSk3x2fmECZv4ksA0yxBgksxVp
         oDx5VeVMqDQNpQnu49aliVubhfABHzS2nziYSD0vagi8+9xd44yToevgRwAoKT4hGYRE
         z2ItSqknp3fCY8YaHHnJpelEKFCSp4t0hjSBy4KGwEymZ3g43RXOj0CGdgSe9RZR71bg
         ZcQpavGZq/0auMnXqXs7nHEN9ldOJbbCW1MF4NI8IdNmabbmXv92RO6vlIyj+OCGC/1M
         rV5hBKtRSpM05Vak4NTEz3DOV10n5LzJE20vJCAVveMGeHJKLDaiWy+BH9bFK9ikM10A
         L6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700504372; x=1701109172;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IkMvHwzXha8iL76L0Ewto8Z1j8l4Dl9NfZnV40iU1Vk=;
        b=NYP+h5GJ6oS/XxPEVLtAOgdnI9FxdqRnX9mFVDqJ6jGUnQt2dprh2ljom1jZtzliFd
         kSAljfLYLHaNDob8nqdPEnJvMGvA+hm8D4jzh17kOv+d6sz3jFA9vtfDALHWnHz3yhqx
         hkNkEGYl5paJGdga78PFlQ/O/rXTZ0qR+s2hfhYajRarcFUFgs+AqqzVQQuE8y98IZmU
         MxO5On3epxwEc3/tOJ5CvPQfTJ5Bx1LcwcIdc96Q5XC6e+P3hPgBE5F2KcSv+t/ZfZdy
         5yBxgAwDpdppYScfMFFCkfxcezzhhcAPXg1NbZjK9RuxZL0Ind97v32qPx3GuOpPyvJI
         Ft6A==
X-Gm-Message-State: AOJu0Yxe3x0Vup63Lc1UCdDm6V0pl3oyGZCj97768desL60NeNqWy87U
	8LsPi+IQrxHP4GU0+eHczo4=
X-Google-Smtp-Source: AGHT+IEnVfPw74ig/4qTXakahTi/NeSKUczI4iDonGWjSgvVpKmp6zO81CICEUiRn86tfO1+c4SfxA==
X-Received: by 2002:a05:600c:4e87:b0:401:bcd9:4871 with SMTP id f7-20020a05600c4e8700b00401bcd94871mr6395663wmq.21.1700504372119;
        Mon, 20 Nov 2023 10:19:32 -0800 (PST)
Received: from ?IPV6:2a02:8071:b783:140:927c:82ba:d32d:99c1? ([2a02:8071:b783:140:927c:82ba:d32d:99c1])
        by smtp.gmail.com with ESMTPSA id v6-20020a05600c470600b0040a5290dceesm14553760wmo.0.2023.11.20.10.19.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 10:19:31 -0800 (PST)
Message-ID: <f7500671-812d-42ab-a16e-3325e13324ff@gmail.com>
Date: Mon, 20 Nov 2023 19:19:29 +0100
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
To: Bjorn Andersson <andersson@kernel.org>
Cc: llvm@lists.linux.dev, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 kernel test robot <lkp@intel.com>
References: <202311191654.S4wlVUrz-lkp@intel.com>
From: Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <202311191654.S4wlVUrz-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/19/23 10:13, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   037266a5f7239ead1530266f7d7af153d2a867fa
> commit: bdac188ec3c71800dd8419620224ee74ef37732a firmware: qcom: move Qualcomm code into its own directory
> date:   4 weeks ago
> config: s390-randconfig-002-20231119 (https://download.01.org/0day-ci/archive/20231119/202311191654.S4wlVUrz-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231119/202311191654.S4wlVUrz-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202311191654.S4wlVUrz-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):

[...]

>>> drivers/firmware/qcom/qcom_scm.c:1652:34: warning: unused variable 'qcom_scm_qseecom_allowlist' [-Wunused-const-variable]
>      1652 | static const struct of_device_id qcom_scm_qseecom_allowlist[] = {
>           |                                  ^

Any ideas why this is supposedly unused? It should be accessed through
qcom_scm_qseecom_init() and qcom_scm_qseecom_machine_is_allowed().
Especially if CONFIG_QCOM_QSEECOM=y.

>     13 warnings generated.
> 
> 
> vim +/qcom_scm_qseecom_allowlist +1652 drivers/firmware/qcom/qcom_scm.c
> 
> 00b1248606ba39 drivers/firmware/qcom_scm.c Maximilian Luz 2023-08-27  1647
> 00b1248606ba39 drivers/firmware/qcom_scm.c Maximilian Luz 2023-08-27  1648  /*
> 00b1248606ba39 drivers/firmware/qcom_scm.c Maximilian Luz 2023-08-27  1649   * We do not yet support re-entrant calls via the qseecom interface. To prevent
> 00b1248606ba39 drivers/firmware/qcom_scm.c Maximilian Luz 2023-08-27  1650   + any potential issues with this, only allow validated machines for now.
> 00b1248606ba39 drivers/firmware/qcom_scm.c Maximilian Luz 2023-08-27  1651   */
> 00b1248606ba39 drivers/firmware/qcom_scm.c Maximilian Luz 2023-08-27 @1652  static const struct of_device_id qcom_scm_qseecom_allowlist[] = {
> 00b1248606ba39 drivers/firmware/qcom_scm.c Maximilian Luz 2023-08-27  1653  	{ .compatible = "lenovo,thinkpad-x13s", },
> 00b1248606ba39 drivers/firmware/qcom_scm.c Maximilian Luz 2023-08-27  1654  	{ }
> 00b1248606ba39 drivers/firmware/qcom_scm.c Maximilian Luz 2023-08-27  1655  };
> 00b1248606ba39 drivers/firmware/qcom_scm.c Maximilian Luz 2023-08-27  1656
> 
> :::::: The code at line 1652 was first introduced by commit
> :::::: 00b1248606ba3979ccae30ed11df8cdc1a84245a firmware: qcom_scm: Add support for Qualcomm Secure Execution Environment SCM interface
> 
> :::::: TO: Maximilian Luz <luzmaximilian@gmail.com>
> :::::: CC: Bjorn Andersson <andersson@kernel.org>
> 

Regards
Max
