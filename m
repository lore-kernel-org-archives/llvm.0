Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C85612C474
	for <llvm@lists.linux.dev>; Thu, 18 Jul 2024 15:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721316751; cv=none; b=TJBzyVn2wIrCw8ZDAoLItOuclEy+L3BIW8+GM36SZbXJTmta2xLkqhLmxpE1dLWvdnbjlpWwnn62qzcUpSulo0LmCPsD/WZyzoUiFWmAAeCsITCmHwHL+4b8kKp4CmsZEIhESGCVyRti/0BHUH5ZcWdymk0f6QfV/zlWl00BY/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721316751; c=relaxed/simple;
	bh=SxG1ASYLsMrU0kDyDUipqhlJ9B6sVkkOS47Rc8N5N5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cYBk7VYdzmz++pdRu6guLJtTXrisLZsWEY1IgPzb/OabwR8/+m6qZfUl4LC6sy7qgiiTBA5swcHt7lMotSw74yJXsWysdVqOW89jieYfJT2zPIPeS/3lFhC9WKgjzfyTzX6VJ6+5FK26Be2a64GCxDmyGfDfnkZP+/+s0hBRh34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AkO6UOJP; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AkO6UOJP"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-70b2a0542c2so834718b3a.3
        for <llvm@lists.linux.dev>; Thu, 18 Jul 2024 08:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721316749; x=1721921549; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bkRar3slz7hJZqaXjGSF9G7hp2Ej2xf1+rvgWJbYK7s=;
        b=AkO6UOJP3giLXG7C6rH6/Srl1zXsLYBfmFmzn4AEYfMSGxTnot2RVH+/gAybiZx4tR
         Vh2QCPBfav3oUmP3ZqXOosDlhTWZmw5BA2B2XwqCfTCAXgPZINjDiSETK5c4wDz2diN9
         bh+iys+oD8HLcH7GTgwASrl7Xi1hp4aKUX/dpYVcgfEAIqcCOLY3vp2WC8FRimDo20J8
         4DUo/aisU/MpCTXvwrLgR4alboakwOM+CspuGUnE6jTHalSXhM2VdTzkVrkAczhdKGWu
         a7nlrXW4jJ4biu7lwvFGPwqQfcGbqWp+1KtzWI3gLJRcTT3hrbodKuP3O8aBV5zzeGwP
         QOIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721316749; x=1721921549;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bkRar3slz7hJZqaXjGSF9G7hp2Ej2xf1+rvgWJbYK7s=;
        b=MPezo8f8Ak6a0wLnKPVoOhYWYaedkUQjdSR5+BUMy/S1iEupS9mT5krtmN4zjmiG3/
         V+NQSGgXpPQeMvXk1QeUELujgvhfxOkdRZLzM1ahKPZRzQIizAEMAsz/7uCCatgB64H9
         M6rpIGOLoVtloMH/951vFkFiywB3ueU3qK+uu22mSZVTzmmk79Xh5xprjDL8mD5fY2fC
         5J3JYZKxqkc+H+Nqc1KYfW/MA6XZ3WUgKhLjEoigCjT1pyEfhOih5Ka6cJk+lsDOBJ4l
         l8V/R2TVKkVYEyoBpLQWCn2TJXXIMi4ZJly+P9NLPeFYGvGuRx2oTYQNx90KDWzFWvGM
         C3fQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeIJ4BFTSq3LrC1FFzV/pYkz8bxSdwCJ7mEcYxCfG/22N4zvHN90xDt5occ8mAryc3/PzF0J9LmXU9234XpGKLi+LzqA==
X-Gm-Message-State: AOJu0YxirrZFXtlWXF313Ka+p5ZZL4AHfIH9dFwM9h2tyIy4nKuyfaTN
	zDvAqPwe4AYrlkT4arzapr2O0JuTndlTxhBRMHphskeO3iYMU5w6/vxbeDUHVA==
X-Google-Smtp-Source: AGHT+IHwqe0qbmW64lMeNZxU2073BikrKx2fkaL5ub30I0frTef3EcqycRabEGKv1T6KPokdE7NW+Q==
X-Received: by 2002:a05:6a00:17a1:b0:70b:152:331 with SMTP id d2e1a72fcca58-70ce50fd642mr6633828b3a.21.1721316749427;
        Thu, 18 Jul 2024 08:32:29 -0700 (PDT)
Received: from thinkpad ([120.56.207.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7eca75a6sm10149750b3a.164.2024.07.18.08.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 08:32:29 -0700 (PDT)
Date: Thu, 18 Jul 2024 21:02:23 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: kernel test robot <lkp@intel.com>
Cc: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 05/13] PCI: endpoint: Assign PCI domain number for
 endpoint controllers
Message-ID: <20240718153223.GB2499@thinkpad>
References: <20240717-pci-qcom-hotplug-v2-5-71d304b817f8@linaro.org>
 <202407182239.m0d1pKRB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <202407182239.m0d1pKRB-lkp@intel.com>

On Thu, Jul 18, 2024 at 11:04:04PM +0800, kernel test robot wrote:
> Hi Manivannan,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 91e3b24eb7d297d9d99030800ed96944b8652eaf]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Manivannan-Sadhasivam-via-B4-Relay/PCI-qcom-ep-Drop-the-redundant-masking-of-global-IRQ-events/20240718-010848
> base:   91e3b24eb7d297d9d99030800ed96944b8652eaf
> patch link:    https://lore.kernel.org/r/20240717-pci-qcom-hotplug-v2-5-71d304b817f8%40linaro.org
> patch subject: [PATCH v2 05/13] PCI: endpoint: Assign PCI domain number for endpoint controllers
> config: i386-buildonly-randconfig-004-20240718 (https://download.01.org/0day-ci/archive/20240718/202407182239.m0d1pKRB-lkp@intel.com/config)
> compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240718/202407182239.m0d1pKRB-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407182239.m0d1pKRB-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/pci/endpoint/pci-epc-core.c:843:3: error: call to undeclared function 'pci_bus_release_domain_nr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      843 |                 pci_bus_release_domain_nr(NULL, &epc->dev);
>          |                 ^

Hmm, should've used #ifdef as compiler can still access the statements under
'if(IS_ENABLED())' condition.

- Mani

>    drivers/pci/endpoint/pci-epc-core.c:843:3: note: did you mean 'pci_bus_release_busn_res'?
>    include/linux/pci.h:1142:6: note: 'pci_bus_release_busn_res' declared here
>     1142 | void pci_bus_release_busn_res(struct pci_bus *b);
>          |      ^
>    drivers/pci/endpoint/pci-epc-core.c:911:20: error: call to undeclared function 'pci_bus_find_domain_nr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      911 |                 epc->domain_nr = pci_bus_find_domain_nr(NULL, dev);
>          |                                  ^
>    2 errors generated.
> 
> 
> vim +/pci_bus_release_domain_nr +843 drivers/pci/endpoint/pci-epc-core.c
> 
>    830	
>    831	/**
>    832	 * pci_epc_destroy() - destroy the EPC device
>    833	 * @epc: the EPC device that has to be destroyed
>    834	 *
>    835	 * Invoke to destroy the PCI EPC device
>    836	 */
>    837	void pci_epc_destroy(struct pci_epc *epc)
>    838	{
>    839		pci_ep_cfs_remove_epc_group(epc->group);
>    840		device_unregister(&epc->dev);
>    841	
>    842		if (IS_ENABLED(CONFIG_PCI_DOMAINS_GENERIC))
>  > 843			pci_bus_release_domain_nr(NULL, &epc->dev);
>    844	}
>    845	EXPORT_SYMBOL_GPL(pci_epc_destroy);
>    846	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

-- 
மணிவண்ணன் சதாசிவம்
