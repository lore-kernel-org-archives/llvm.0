Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA681E493
	for <llvm@lists.linux.dev>; Tue, 26 Dec 2023 00:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="f21kGUfi"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d430bac207so10686965ad.0
        for <llvm@lists.linux.dev>; Mon, 25 Dec 2023 16:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1703548980; x=1704153780; darn=lists.linux.dev;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2hfvv+swjba6mg+pRtlk7kiaUfMDuo3bGE0uQDlvTgI=;
        b=f21kGUfieqUHXY49DSntKTK9tJdJAcGJvtusQjk0sthyF0C+Cv82uMT7KobuDLJiOx
         +GdjMSXT/L6O4xbf11tL3DFwdnJcqjwruxEzUdeNu/wx52HQzLELyTo1Blx88DvsHlKV
         lRimN6lceqDnX2E1YTRtbu5yPa6AOZEk5iPJiboPY09Se4W1azvrq8dvgLxeDbpjla0T
         nKrBP1gPDN/qc6cwh/Dm+4cD2ePCrssMxIj6KCLbiQRGj6BpMsusFD2fSgRWJcrnHh1Z
         Ldol9F2v8Wk+bctafNosH83276Q++L+AWtcWstKW8OG7h4H4tB8KtisUWKs8uLVgjoqN
         9A+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703548980; x=1704153780;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2hfvv+swjba6mg+pRtlk7kiaUfMDuo3bGE0uQDlvTgI=;
        b=fDohbktSc0wk2frmVmlGU6/AMR69AH89/68Fes0wt+oIou4l2dANwn6hzAsIUyLy9J
         TlcDOXu3mPVlEGEv9kroD5B+IZrmaLvKJ3+NMmRQIoqVAo3C/1fNXjwc1wQx1UJYayIM
         Z03Up0Sz8Kvljrfa672YHIN/BESrNS+u178ImUNMMnMWIT1w/tjr4noDSFdLVr/NArrD
         rSxrayR+Za3K+1RhObrfYuvr09zZh4sbrApmQRecqpMzDwnkJwDkboY7rp372tQnp4MT
         bST3mDHvKMA6020a4eF41oSoy1Lutji9TXL/qKDCNtZpvmsIcvFrs5sUgQYRLUKvHb95
         J+og==
X-Gm-Message-State: AOJu0YyYvFHIMKlrDYkhPsq0+NRHt4aH1JL2DPXkk1iUvFFqbZnc37N7
	oYYa+Zt+L476J5G3VrV+8vUt3gQwYd/xrg==
X-Google-Smtp-Source: AGHT+IHn/FZCRK+EMtS92euiGxoVA3cXvrwT2tA9UAJLzNKOBroWCsL2sDSJFHdfeo7sg5N2nJB6/w==
X-Received: by 2002:a17:90b:4b07:b0:286:6cd8:ef07 with SMTP id lx7-20020a17090b4b0700b002866cd8ef07mr7853048pjb.31.1703548979636;
        Mon, 25 Dec 2023 16:02:59 -0800 (PST)
Received: from dev-mattc2.dev.purestorage.com ([208.88.159.129])
        by smtp.googlemail.com with ESMTPSA id y31-20020a17090a53a200b0028649b84907sm14082296pjh.16.2023.12.25.16.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Dec 2023 16:02:59 -0800 (PST)
From: Matthew W Carlis <mattc@purestorage.com>
To: lkp@intel.com
Cc: bhelgaas@google.com,
	helgaas@kernel.org,
	linux-pci@vger.kernel.org,
	llvm@lists.linux.dev,
	mattc@purestorage.com,
	mika.westerberg@linux.intel.com,
	oe-kbuild-all@lists.linux.dev,
	sathyanarayanan.kuppuswamy@linux.intel.com
Subject: [PATCH 1/1] PCI/portdrv: Allow DPC if the OS controls AER natively.
Date: Mon, 25 Dec 2023 17:02:51 -0700
Message-Id: <20231226000251.3182-1-mattc@purestorage.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <202312260431.ZXppQZ1I-lkp@intel.com>
References: <202312260431.ZXppQZ1I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

I guess we don't build aer_cap into pci_dev without CONFIG_PCIEAER...
Wonder if I should just drop the check for aer_cap since its likely
not necessary anyways.
