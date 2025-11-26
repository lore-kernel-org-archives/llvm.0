Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF862FD661
	for <llvm@lists.linux.dev>; Wed, 26 Nov 2025 22:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764194696; cv=none; b=HnVEBcdnqaOKlrOXyaTDG1HVC4IOGjOtShLkUa7TwfDLskNO8SN+sl9H09wGBozo2gtWUdrd4jBNVRac0si5e7d9wK+5J+htAz1SeGiSfZhXYCk6J7l6MwYQeHA1cSqOfTp47DQQ6ZrjgavV9PxcW+rgKRdc7WY+HIgI7KjiE9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764194696; c=relaxed/simple;
	bh=gqLSwHsrGZkhN+aFNTbmKSZgZc3SbCkcYs3ExiI7vJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LiQ1Z47ILgDifMKsV+NsUX6xGsoUI7By0yRC8tPWjpt4yVidxjti0XXmqJyMFCLopk0SDaxEBj7n4aVEZhRrOBOfBb9uxfup63JMEfWih1ejynj4NXnr2IkiZeFaaJr9pWA475BptN1FUYLIVhtKedpg7fsjE3MMNcFqTBL3Y5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iEGOpzmD; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iEGOpzmD"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so226409b3a.2
        for <llvm@lists.linux.dev>; Wed, 26 Nov 2025 14:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764194694; x=1764799494; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ay1HyD/YXcJtqug9NBApq+fmqHdHRxdWGXWcfRUTS3Q=;
        b=iEGOpzmDKPoywbmtRpWdhQRuW2VrJj0KlbHGtPp6jL+YPRHoYCkuCKA56lRISg0ODj
         t8WFViJnPaPwlKS5OMp0spy2siMF6wAdjZX3Ik7RrnfasPt89pjc1thBYEHpnXmaaC0C
         FOL+pYSt7slVKlcO7z5Bc38eh0b2fUKg9iJc1Ed+uXBzgBCxoBgLUVLadJ/meBIsZoin
         3Ddv/f65qtLvuFZR5wBJfR4jgZX/jbjOcjslOkJl3S+r71zt7lp1xOSpB/ZAU3+r8MWh
         /AauVpOyxu0nDsbCWLfNu2WwxmmM9931OZngoAuygfYwmCQL9ttwllz9H7J0YKEet1G1
         2zEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764194694; x=1764799494;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ay1HyD/YXcJtqug9NBApq+fmqHdHRxdWGXWcfRUTS3Q=;
        b=f0M8ozt1vAKjs25e44wikfssfXSNLn9Q4IufWCt/ACpdKSNG/ZtiEc/Hcmi2cjsdAC
         dY/gtvFhNIFPz7T8EcD1fwsXwlluFYDlZM8/p7M9K5+iAPb6NSGQ4sLYOafBocUZSOH5
         glhga0jmFQ3XHZwmH3VQgI2Z6rb8+Rs+G/FkbC1CV4HqqqSkJWX4i8I/1oRRpUbblM7w
         aERpZyG67Xn1F5gxQ6k0nmh5wOBOk8hPa3Fe6pH3mZt+CUJrWg0gTXVnFmzqdDXHCNyq
         bF3h4jqpu3OPMTLPKKxxL/UXduL4ssWuB+9Gg6CJ/XXnuI0fzpnXGyO+QUgrZL6GbW4r
         L3Rw==
X-Gm-Message-State: AOJu0Yz0ttReDWOS/PADPdRE3CD5K+Lhk4DzRCPwq0rGLRqlV4WrzxeU
	+uuPLCtnmtGC3OAhNYQP5Fn2vripswXR1JlgjFQE9yum11TWl7ngi4/tvZfvMc8TEg==
X-Gm-Gg: ASbGncv/lnJg+CDRD7OumZOqr6QuhzXInuCWMKYHmLgGgDWvpgjZGeON9XxmoHhnKYo
	bPkOQM/fvtIel1S3pMmkQTVW8jcZiADPfRFU92m1xK5HGpgVJjfWlZMaTqohgeAysg2Twzg+HI7
	2CJJFx5sAxhYOhDVV19dpbtto5UwUj9HeSpyoynwcStkqoG/TLtQfbRqqJK8Yvq7rmBnwmvf6fp
	lGWmPmiL52jlcYinGtvG50XEmUXnRsuzBNSd4OqDCJiZkfg1ljy0BHN3+IAO0oYai9erf7k9oXw
	sLCzV/GyLOZD8gWvHeoWKXRD+/Dp+JyhJz2M230i7nzbL23MJSlvJkBlK86hbVN84YaZKenOd28
	j0hwil44N1t+0GozW70zSGoQZyDFy3mhfMUV6fu8XG2lPMKziJ5GrvwV8E3JpPxqlTw4q6Y1wjV
	8AxflnXzkN8LxH/JgHrjreJawTEN39q6OvnOcHYChQMgqqCOoNcWUSKyXi/BU94QlqnZLN1M8U8
	VJ9WIgm/3a90w==
X-Google-Smtp-Source: AGHT+IHgCBAVlJ/1/Oj2H+nvmtjVOEfs8Cj4GuvQ7p3t9lR/WHGAMof8mvn31hs8D+Fx43GprBkfMw==
X-Received: by 2002:a05:6a20:244d:b0:343:64dc:8cc with SMTP id adf61e73a8af0-3614eb15e9fmr24287915637.12.1764194693250;
        Wed, 26 Nov 2025 14:04:53 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:c116:b1c9:632d:a902? ([2a00:79e0:2e7c:8:c116:b1c9:632d:a902])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd75def6346sm20451772a12.4.2025.11.26.14.04.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 14:04:52 -0800 (PST)
Message-ID: <be908072-fd0a-48dc-97e0-b120539f5584@google.com>
Date: Wed, 26 Nov 2025 14:04:51 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] power: supply: max77759: add charger driver
To: kernel test robot <lkp@intel.com>,
 Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Lee Jones <lee@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
References: <20251123-max77759-charger-v1-5-6b2e4b8f7f54@google.com>
 <202511261521.hSYp4ttf-lkp@intel.com>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <202511261521.hSYp4ttf-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/25/25 11:38 PM, kernel test robot wrote:
> Hi Amit,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 39f90c1967215375f7d87b81d14b0f3ed6b40c29]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Amit-Sunil-Dhamne-via-B4-Relay/dt-bindings-power-supply-Add-Maxim-MAX77759-charger/20251123-163840
> base:   39f90c1967215375f7d87b81d14b0f3ed6b40c29
> patch link:    https://lore.kernel.org/r/20251123-max77759-charger-v1-5-6b2e4b8f7f54%40google.com
> patch subject: [PATCH 5/6] power: supply: max77759: add charger driver
> config: um-randconfig-001-20251126 (https://download.01.org/0day-ci/archive/20251126/202511261521.hSYp4ttf-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511261521.hSYp4ttf-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511261521.hSYp4ttf-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>     /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
>     /usr/bin/ld: drivers/power/supply/max77759_charger.o: in function `max77759_charger_probe':
>>> max77759_charger.c:(.ltext+0x27b): undefined reference to `devm_regulator_register'
>     /usr/bin/ld: drivers/power/supply/max77759_charger.o: in function `enable_usb_otg':
>>> max77759_charger.c:(.ltext+0x983): undefined reference to `rdev_get_drvdata'
>     /usr/bin/ld: drivers/power/supply/max77759_charger.o: in function `disable_usb_otg':
>     max77759_charger.c:(.ltext+0x9c3): undefined reference to `rdev_get_drvdata'
>     /usr/bin/ld: drivers/power/supply/max77759_charger.o: in function `usb_otg_status':
>     max77759_charger.c:(.ltext+0xa06): undefined reference to `rdev_get_drvdata'
>     clang: error: linker command failed with exit code 1 (use -v to see invocation)
I believe this is because of a missing "depends on REGULATOR". Will fix 
it in the next revision.
