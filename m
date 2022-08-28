Received: from vorpal.se (vorpal.se [151.236.221.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B303208
	for <llvm@lists.linux.dev>; Sun, 28 Aug 2022 22:50:08 +0000 (UTC)
Received: by vorpal.se (Postfix) with ESMTPSA id 3D8B9140DD;
	Sun, 28 Aug 2022 22:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vorpal.se; s=2019;
	t=1661726699; bh=nHJNcmazr8tcJXlbXro7XFfNqlC6ONrrJz4e6dIHIDE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a5U/gG+kEPjQPvxn4fkCUrT5ZVmE31PXg5bwKWFQKp8NfvZizmrPg1eoGHfDyI/G2
	 O7+L7M+jEgMAo1lXUPiHZ1G0ak594PYI/mFnQhtR4Nxk3dwojcqGi3vszivTRcqnfW
	 yxBesg/bkvLzVYPwcZUqjZIQkz7EGeWqtxsBb8IIgijDUnmnki07EP054u85VxiNiR
	 fvjiZbqA2rJimOJ7BFVNhEAOXYEJu+6k9WwZVGbfOl8EcU26w4fzeHRgQc58t7riGA
	 r4ZWTCRyPM8mvbiP5CdiaGxTVsAkiByC1j4lmeSaNBMKwsrA1oILlke2y3GGp7B0wH
	 TIZlLAk2JVqAA==
Message-ID: <90ae872b-9da6-f5a9-56e0-5a61fe3b84ed@vorpal.se>
Date: Mon, 29 Aug 2022 00:44:57 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/3] platform/x86: Battery charge mode in toshiba_acpi
 (sysfs)
Content-Language: en-GB
To: kernel test robot <lkp@intel.com>, platform-driver-x86@vger.kernel.org,
 linux-pm@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 Sebastian Reichel <sre@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Azael Avalos <coproscefalo@gmail.com>
References: <20220828192920.805253-3-lkml@vorpal.se>
 <202208290605.gE9IGbxE-lkp@intel.com>
From: Arvid Norlander <lkml@vorpal.se>
In-Reply-To: <202208290605.gE9IGbxE-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2022-08-29 00:15, kernel test robot wrote:
> Hi Arvid,
> 
> Thank you for the patch! Perhaps something to improve:
> 
> [auto build test WARNING on 1c23f9e627a7b412978b4e852793c5e3c3efc555]

<snip>

> vim +/status +2992 drivers/platform/x86/toshiba_acpi.c
> 
>   2984	
>   2985	
>   2986	/* ACPI battery hooking */
>   2987	static ssize_t charge_control_end_threshold_show(struct device *device,
>   2988							 struct device_attribute *attr,
>   2989							 char *buf)
>   2990	{
>   2991		int state;
>> 2992		int status;

Will be fixed in the next version, it should be used. Waiting for human feedback too first.

It would be nice to see these warnings locally, anyone know how to turn them on?

>   2993	
>   2994		if (toshiba_acpi == NULL) {
>   2995			pr_err("Toshiba ACPI object invalid\n");
>   2996			return -ENODEV;
>   2997		}
>   2998	
>   2999		status = toshiba_battery_charge_mode_get(toshiba_acpi, &state);
>   3000		if (state == 1)
>   3001			return sprintf(buf, "80\n");
>   3002		else
>   3003			return sprintf(buf, "100\n");
>   3004	}
>   3005	
> 

Best regards,
Arvid Norlander
