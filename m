Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903731FECCF;
	Wed,  4 Dec 2024 15:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733325231; cv=none; b=cf8D42aQkGgqX9E+XNBGGM2wRew4RK9oPPp6lpWXJG7rm8KZsNcs9B8KzrA886ECElIE/qz8qYIU0jHtaANUotKCQqKEJVfHK4p4+XEavY5g2OaGRj7piH1gjV0yRQ90YR//u+U0C39Zae/0Z/0dHQDQfUEG4P2CI6Er8C4RqE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733325231; c=relaxed/simple;
	bh=EEf76SgX/3puazt8ufia4uZKilO394GYwACgLeP/Df8=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ns/YOO+lGL3fL4XOAMKOJuHGe7pd5jirrZxMG2LbbRkE/qhPNzoDXeI5qbKEFBEGcuSW/49//dxtAKw6rkV9igHUur0hwN1Ul7Ao7mO5JIntvEtnqpfwD3PNT8by1v2ixeiJEkLq0M6X1D404j1fyYnzoBsVBdj7fD1Smsi9u2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UfVmNZ32; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UfVmNZ32"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-434ab938e37so45425435e9.0;
        Wed, 04 Dec 2024 07:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733325228; x=1733930028; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K67aLAUzSfbUuMMVxrZ7xG6js3aZNsZytWIuEf4fsUo=;
        b=UfVmNZ32EOhGI3nXcfeBr6GS/9CRDmZLU0ainoucRUNbud1APQdtMW2vkUMa0qkQQc
         6PkOby0OIq9Nmsvux92RqG0bwzZbmbNT5nJZAmlsn6RSS9PMYDW/k/DE3BfmuoYPp27n
         VltMvWvhzB6d9WAJocywFw9G/pkeX7q2jrsQDwIqBbGHdk/Hziwp2kb4PwreIghHQzbF
         zeHEEiDJUb5OGSCBJH1o1Rqo9lTj6KLtd1VZ64PNqSWWo1ph9G4KFQJZX4e9MB7gfQlm
         Cxo4RqfnGuhHE1XcRiwOfdA80Jczqbw12vn5i2OKjGmXIfC5SsxnH7oJE1xPcBuBmxAA
         j1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733325228; x=1733930028;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K67aLAUzSfbUuMMVxrZ7xG6js3aZNsZytWIuEf4fsUo=;
        b=ekazySlaHFIE6cmVWlodvVmsmz8FsCiZuO2KKAMT4jHSJfQx9z05UxYHln7n0DDLx8
         m6CCGArOTk+ZggQfxtchG6chDOodBeJ6qoqBpX2tNSpzYUxLI2znw7k3rsTLt16IFS9g
         1Gc2l+Te7fTvBFKnjpjPdxIpqSVb3HcNXV51hWP71cw5WUaUL1ltIBPr+eXK9Nyk8jRF
         hMbTdbni59tpyRjLH+0zn1+MuSZXesLIWSwf0Fh21N9RMFo4/TOy6+GR0Df1cP9iLAQz
         nqnNzco83tYvkddRWUINifMbsbKAjl2VhEbBinfy9iu5RuYmPeR9NPeU3Qv4s1/SIEas
         mJtg==
X-Forwarded-Encrypted: i=1; AJvYcCWFSPDpnUp+aj59S29iIWSPUjfyp4tFPF7qCHNfGm5/FC2Xr1XXwVGXOqEtwTNwo3QeEGPR@lists.linux.dev, AJvYcCXb2TFktw4jXirKK/t0yTxRIlddkiFlyFrdqttEtV6Zl2fIq74A4yzgbO8Ly791utwxdHbTHXFtPpRtS9El7Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzLe8CqCzsytDnANWgULqAbwBCRqcKrDScOw/6oTyMkznCMNjkQ
	zq2qo+mtePDnDOl2y1Hd/QIqqESHi9vEDaPTmjR5TjLBxBmAx7H2
X-Gm-Gg: ASbGncvmz5ZZ2aC3TACRG70ujHrNP2LJrxGOyUrrAqxIxzHzLt4KMev9+6If2lLBciA
	+ulz4TPT5WBofnprQjbnLflYDQ56vc8YbuEtnyyph/Yk9oYXgOvjokvqe64YPoX8qgrle7zAufm
	viirh0utTQQNmjwjbjdGi0jFCA0DhkBFF4S1SP9dFnJUcupLtj8DIGGfA41iHlLRi5aaiL+8LJB
	cCb7XBsn/xz9x0yOnBGjL//QyzQijEUtibUqo1KtpJWIyU7LA+ByFVl+QaC/ShwAzCxK7QYqvb3
	6hM7ug==
X-Google-Smtp-Source: AGHT+IGZWimo8j6jMFRask/atuO/zxTgFDYDzsdxIc9v2gqFWxahTgIfn6oEZjIvWK770r9mpIOd6Q==
X-Received: by 2002:a05:600c:1c1d:b0:434:932b:a44c with SMTP id 5b1f17b1804b1-434d3fe339emr38546645e9.27.1733325227755;
        Wed, 04 Dec 2024 07:13:47 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d5288e02sm27431415e9.20.2024.12.04.07.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 07:13:47 -0800 (PST)
Message-ID: <675071ab.7b0a0220.183cea.8610@mx.google.com>
X-Google-Original-Message-ID: <Z1Bxp0xQYLa6G0a6@Ansuel-XPS.>
Date: Wed, 4 Dec 2024 16:13:43 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 2/2] cpufreq: airoha: Add EN7581 CPUFreq SMCCC driver
References: <20241203163158.580-2-ansuelsmth@gmail.com>
 <202412041929.8aCqrGnO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202412041929.8aCqrGnO-lkp@intel.com>

On Wed, Dec 04, 2024 at 07:22:41PM +0800, kernel test robot wrote:
> Hi Christian,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on rafael-pm/linux-next]
> [also build test ERROR on rafael-pm/bleeding-edge robh/for-next linus/master v6.13-rc1 next-20241203]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/cpufreq-airoha-Add-EN7581-CPUFreq-SMCCC-driver/20241204-113105
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
> patch link:    https://lore.kernel.org/r/20241203163158.580-2-ansuelsmth%40gmail.com
> patch subject: [PATCH v5 2/2] cpufreq: airoha: Add EN7581 CPUFreq SMCCC driver
> config: arm-randconfig-003 (https://download.01.org/0day-ci/archive/20241204/202412041929.8aCqrGnO-lkp@intel.com/config)
> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412041929.8aCqrGnO-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412041929.8aCqrGnO-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/cpufreq/airoha-cpufreq.c:41:34: error: variable has incomplete type 'const struct arm_smccc_1_2_regs'
>       41 |         const struct arm_smccc_1_2_regs args = {
>          |                                         ^
>    drivers/cpufreq/airoha-cpufreq.c:41:15: note: forward declaration of 'struct arm_smccc_1_2_regs'
>       41 |         const struct arm_smccc_1_2_regs args = {
>          |                      ^
> >> drivers/cpufreq/airoha-cpufreq.c:45:28: error: variable has incomplete type 'struct arm_smccc_1_2_regs'
>       45 |         struct arm_smccc_1_2_regs res;
>          |                                   ^
>    drivers/cpufreq/airoha-cpufreq.c:41:15: note: forward declaration of 'struct arm_smccc_1_2_regs'
>       41 |         const struct arm_smccc_1_2_regs args = {
>          |                      ^
> >> drivers/cpufreq/airoha-cpufreq.c:47:2: error: call to undeclared function 'arm_smccc_1_2_smc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>       47 |         arm_smccc_1_2_smc(&args, &res);
>          |         ^
>    drivers/cpufreq/airoha-cpufreq.c:81:34: error: variable has incomplete type 'const struct arm_smccc_1_2_regs'
>       81 |         const struct arm_smccc_1_2_regs args = {
>          |                                         ^
>    drivers/cpufreq/airoha-cpufreq.c:81:15: note: forward declaration of 'struct arm_smccc_1_2_regs'
>       81 |         const struct arm_smccc_1_2_regs args = {
>          |                      ^
>    drivers/cpufreq/airoha-cpufreq.c:86:28: error: variable has incomplete type 'struct arm_smccc_1_2_regs'
>       86 |         struct arm_smccc_1_2_regs res;
>          |                                   ^
>    drivers/cpufreq/airoha-cpufreq.c:81:15: note: forward declaration of 'struct arm_smccc_1_2_regs'
>       81 |         const struct arm_smccc_1_2_regs args = {
>          |                      ^
>    drivers/cpufreq/airoha-cpufreq.c:88:2: error: call to undeclared function 'arm_smccc_1_2_smc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>       88 |         arm_smccc_1_2_smc(&args, &res);
>          |         ^
>    6 errors generated.
> 
> 
> vim +41 drivers/cpufreq/airoha-cpufreq.c
> 
>     37	
>     38	static unsigned long airoha_cpufreq_clk_get(struct clk_hw *hw,
>     39						    unsigned long parent_rate)
>     40	{
>   > 41		const struct arm_smccc_1_2_regs args = {
>     42			.a0 = AIROHA_SIP_AVS_HANDLE,
>     43			.a1 = AIROHA_AVS_OP_GET_FREQ,
>     44		};
>   > 45		struct arm_smccc_1_2_regs res;
>     46	
>   > 47		arm_smccc_1_2_smc(&args, &res);
>     48	
>     49		/* SMCCC returns freq in MHz */
>     50		return (int)(res.a0 * 1000 * 1000);
>     51	}
>     52	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

False positive or better say my error in the kconfig depends logic

This driver REQUIRE ARM64 bit for smccc and the target SoC is 64bit
only. The randconfig catch a situation with ARCH_AIROHA and 32bit.

-- 
	Ansuel
