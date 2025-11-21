Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E5726E71E
	for <llvm@lists.linux.dev>; Fri, 21 Nov 2025 18:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763749684; cv=none; b=m52KexCeF1iNpxcS7MwC2sfuh19gGRJ1Rdq3sAffZnk3rTP1enBwsQqjqWakEnPveTqRAMF/MqrXmDcaQ821ac2Dm03sNAs1sYYeVoUmRAYKBM5nQMSZcV8mMnbOnkug/mjzaQd6fKDfi9neGJYDI2Lmxf7VS8N5Zy+t4Jfaer8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763749684; c=relaxed/simple;
	bh=eiNvpKMX+RHgtZkQ1+h3XWmFyZEgmHdrngHRg+aKUCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=SnPBAm+npn621pLG2yr0ZUnKtAqLtlH7F1gLcwKFkjGxTIpem8GrN9NSLP/11crrmQKhZB6V9xhuEQS2ZOKWT3ICfndjRbTk4X25+KtNjWqCj9BKrb5G6vjC/31v4UP0mhFCNl7Dw8YQ1JVo+yYp4UyUUV3Cagk66oMuZSas7N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WPc4+UbP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WPc4+UbP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763749681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9F1gVEfkmOU4VbBNqbz6au89HcS75XiMRWvgttvUABM=;
	b=WPc4+UbPP73I2EwUEh1FZ/j/Cg606m8OVShbJ15eHQrmUtzH3PEYSxEAJWEAboFBzk8eoj
	GCj5KPIzem70+f/IUqTqroD149NqX6CWhrUP+W1sFI7pmM8uPL1AGQ/4KZUhAVMEk/KrKE
	O5m02Q4CrXCUw0CXH5Q9Ig3m9rEPjeg=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-jB_h-tHbPfuC9vSzG709uA-1; Fri, 21 Nov 2025 13:27:58 -0500
X-MC-Unique: jB_h-tHbPfuC9vSzG709uA-1
X-Mimecast-MFC-AGG-ID: jB_h-tHbPfuC9vSzG709uA_1763749677
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee0995fa85so77804911cf.1
        for <llvm@lists.linux.dev>; Fri, 21 Nov 2025 10:27:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763749677; x=1764354477;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9F1gVEfkmOU4VbBNqbz6au89HcS75XiMRWvgttvUABM=;
        b=RUNROaX/4TTkYwqYt5rbTdCLShfl61D9OTm1a6XQX1qQP1FvLGLXgdnTxeNLs77xQJ
         6ssQyXRvHwfkXmWIo8VzwWmj3IKkC7Qa1QV3qVawaZ5SlXkrQr5ALBcEkzJDppHPnxBJ
         pcHb0/Lk7TWSxR0AQpYOCmb0z9rq8wvy9W9JMZQg3tlJPx+zIxiiH+h9QE+jC2pJaR0J
         sbneNsQ6Gclxjtam8X5yh11bQcuEQbAX8Hg8jKbPwPesXP0624Akzk9gjWSUg9r79Gtx
         Eaz6LGldyxFy+5jkrxiSMj5JkU8oxFs6uqesDXB+hOizdWHiGXocKG27VzfHUP9X8nfc
         lC9A==
X-Forwarded-Encrypted: i=1; AJvYcCWgww3mtrVrG2NGe+YCU1TvsHejDaGg5DVK0XK+eAHa3HRK0KxU9iYHB4I4Pocg0P+HJrR5@lists.linux.dev
X-Gm-Message-State: AOJu0YxA+XSC/48yRG39zCrcQG1Bu9qqMrdb69FbVQMUbk3fy0Kngc9A
	e4DnYIh55bLAP9Fclx4klYeVmB9pwxXRKgqiF0rdxn0HWi6eTrkMNP3cxDmtXyu3glvuOtu1P7n
	XbVFo768cFYTn6mE5odzi5czq8SRPHPEnzq1oTGhCdUBxo0YIEWJ9NuI=
X-Gm-Gg: ASbGncsyhD0Doqawi7zkzETmNBcRyO1afGib1ruTnQX0aQC2yS1fDXyLMF8QgiPzsGE
	CcCBUX7PxKepIjdVYqfpXw3h3ePQLnZ3TRAW+ILeR0asA5ffuCk/5mcMC+LBoBNPCHwcgUTHB4S
	Ftu0u6uGBq7ttqR/o+bUsKZIvOleAvwDbT7MsYLYgCHM5O7jS9REV84JkaIue3ONoR2AJYyN6HH
	0AA5FmOMuIqAb2m9R/NIfO/JnHL9zIQL7a9qQaKK5fzE/YhF8nhlIc8GUGoz2sVxuPFVI/kRUs1
	HZXWoHGLdedUbjntCZ4V8cMP6aktGonmTMfpPsrqJ6egKZkSSw/VV9UQl6j21hzuqiBQRpBBQpQ
	Ah7yl/jVH6w==
X-Received: by 2002:a05:622a:155:b0:4ed:da56:7a96 with SMTP id d75a77b69052e-4ee58af100cmr45387571cf.60.1763749677512;
        Fri, 21 Nov 2025 10:27:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFkOzQWoZuQdAiXMy2SX7/W3kkLRTcNrhy9ckhF61k6Ze2u2Lmzw86pdU9Kf7yewixDrfgpEg==
X-Received: by 2002:a05:622a:155:b0:4ed:da56:7a96 with SMTP id d75a77b69052e-4ee58af100cmr45387001cf.60.1763749676867;
        Fri, 21 Nov 2025 10:27:56 -0800 (PST)
Received: from localhost ([2607:f2c0:b141:ac00:2fb1:d1df:b122:3b2c])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4ee48d571d0sm41831021cf.12.2025.11.21.10.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 10:27:56 -0800 (PST)
Date: Fri, 21 Nov 2025 13:27:55 -0500
From: Peter Colberg <pcolberg@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 1/8] rust: pci: add is_virtfn(), to check for VFs
Message-ID: <aSCvKy64s-LBrM85@earendel>
Mail-Followup-To: kernel test robot <lkp@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
	Jason Gunthorpe <jgg@ziepe.ca>
References: <20251119-rust-pci-sriov-v1-1-883a94599a97@redhat.com>
 <202511211008.jgLuTcrQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202511211008.jgLuTcrQ-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: H1Qf7H9-7r204XU3qkej8bgVZLn_s6YFSji2MF4AVRU_1763749677
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 21, 2025 at 11:00:32AM +0800, kernel test robot wrote:
> Hi Peter,
> 
> kernel test robot noticed the following build errors:

This appears to be a generic issue with UML, unrelated to this series.

https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/CONFIG_UML.20maybe.20broken.3F/with/558611169

Thanks,
Peter

> 
> [auto build test ERROR on e4addc7cc2dfcc19f1c8c8e47f3834b22cb21559]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Colberg/rust-pci-add-is_virtfn-to-check-for-VFs/20251120-062302
> base:   e4addc7cc2dfcc19f1c8c8e47f3834b22cb21559
> patch link:    https://lore.kernel.org/r/20251119-rust-pci-sriov-v1-1-883a94599a97%40redhat.com
> patch subject: [PATCH 1/8] rust: pci: add is_virtfn(), to check for VFs
> config: um-randconfig-001-20251121 (https://download.01.org/0day-ci/archive/20251121/202511211008.jgLuTcrQ-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511211008.jgLuTcrQ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511211008.jgLuTcrQ-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> error[E0599]: no method named `is_virtfn` found for struct `bindings::pci_dev` in the current scope
>    --> rust/kernel/pci.rs:415:35
>    |
>    415 |         unsafe { (*self.as_raw()).is_virtfn() != 0 }
>    |                                   ^^^^^^^^^ method not found in `pci_dev`
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 

