Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F412C85
	for <llvm@lists.linux.dev>; Thu,  7 Oct 2021 12:33:18 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id x4so3849297pln.5
        for <llvm@lists.linux.dev>; Thu, 07 Oct 2021 05:33:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zcIvFiYhRKMqQujItHi+qZ6KPUhilr5DfP6u2dQO6Ww=;
        b=FA/d0oHhSdiVE37OSoIXVt++WgeWxB43WdFUfud24FcsIrlFsma2Jiq5wfmVANWnEQ
         DjQObAjskEO1eh/JGDTS4luAULL9A4XusmNMfcUdiFU7OcJ9dljPMAQ9heE+RwEPRB/K
         SsK3TLbweDsoEa/KUPgLzE0zxYCedhlKffPihTujI8liB3ZEYl4ZeM2y+PZFga/FytXp
         6TlyH3Si/h0KEaLjghCcmq162CwQTNR8z+p3zUiMqFrJzooDT0lHJ7Mc6keI/HPbncuB
         xw8yxzfXnv9ikrwvskA7pWvb9n298d/k90y20cWb7PEQygffCj9kTGVC7FQrc+qbuYBs
         /DRA==
X-Gm-Message-State: AOAM5308HQtHH5PqiNx8CIcsT+6K8pD7TydnO5XdxGqI8SBqPsoRsq3e
	IoSHf0QMrOcXktH+EyzYX7E=
X-Google-Smtp-Source: ABdhPJyifAhQo/jxxY6dX3/EePc6wFk1HhVlaqEbomvt9llg9gLGujMpVCGCxaB2r5anI+c90c7abg==
X-Received: by 2002:a17:90a:bf91:: with SMTP id d17mr5163332pjs.158.1633609997934;
        Thu, 07 Oct 2021 05:33:17 -0700 (PDT)
Received: from rocinante ([95.155.85.46])
        by smtp.gmail.com with ESMTPSA id u17sm8090786pjn.30.2021.10.07.05.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 05:33:17 -0700 (PDT)
Date: Thu, 7 Oct 2021 14:33:07 +0200
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Bjorn Helgaas <helgaas@kernel.org>, linux-kernel@vger.kernel.org,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [lpieralisi-pci:pci/dwc 5/7]
 drivers/pci/controller/dwc/pcie-visconti.c:282:17: error: unused variable
 'dev'
Message-ID: <YV7pA/gPpS8v3AUm@rocinante>
References: <202110072056.ZVezTzRp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202110072056.ZVezTzRp-lkp@intel.com>

Hello,

[...]
> >> drivers/pci/controller/dwc/pcie-visconti.c:282:17: error: unused variable 'dev' [-Werror,-Wunused-variable]
>            struct device *dev = &pdev->dev;
>                           ^

Doh!  This has been since fixed in v2.

	Krzysztof
