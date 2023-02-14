Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00224CB8C
	for <llvm@lists.linux.dev>; Tue, 14 Feb 2023 23:02:25 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1676415738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1TZyqrcMFCLessiMncscuzYoYIAD62aNI8vRDgUPP3k=;
	b=jMzPtUH8cOaAWtyVHBIQ2BbS0NZpRPb60KzK5K9SRz5L30HSvrbDWT7l995RFz+0BgwERa
	zsieuBAGYveJQl1cxKykS1g74XZGSdJj1hjpERTUqX89YohcB3BrnA/YTGBAD1drcQdgFc
	n8TD1RE4LAOGJV0XURmMIc3bhUPB4uJM5MelYIphtPFHJr2whhkMjkgV+y6k/8sMfUNIt1
	7ozxNEn5Cy/OPFBuKy7ZJLnkGn+pXH25WQr0zZdBXza+2PifozLHut8kwcsMa9lqDQ0jZW
	rXTMjyGHT0/e0ymqr77qM5vcA0SDlSUSYFNq7mg84/JGaHBlrbVUh3fx+77xLA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1676415738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1TZyqrcMFCLessiMncscuzYoYIAD62aNI8vRDgUPP3k=;
	b=giWIrphHr/qvN3KE3qcAtDFYG0NVvPtd6fRhLnGlV4NUj+LGCINAQ7Utf3Z0PnZ/wApjc7
	9BXt+4Ii3Ay/WuAA==
To: Bjorn Helgaas <helgaas@kernel.org>, Reinette Chatre
 <reinette.chatre@intel.com>
Cc: bhelgaas@google.com, nathan@kernel.org, ndesaulniers@google.com,
 trix@redhat.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, kevin.tian@intel.com, darwi@linutronix.de
Subject: Re: [PATCH] PCI: Fix build error when CONFIG_PCI_MSI disabled
In-Reply-To: <20230214222400.GA3089902@bhelgaas>
References: <20230214222400.GA3089902@bhelgaas>
Date: Wed, 15 Feb 2023 00:02:17 +0100
Message-ID: <87v8k3rgue.ffs@tglx>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Feb 14 2023 at 16:24, Bjorn Helgaas wrote:
>> Provide definitions for pci_msix_alloc_irq_at() and pci_msix_free_irq() in
>> preparation for users that need to compile when CONFIG_PCI_MSI is
>> disabled.
>
> I think this should have a "Fixes:" tag to connect it with the commit
> that added pci_msix_alloc_irq_at() and pci_msix_free_irq().
>
> Looks like 34026364df8e ("PCI/MSI: Provide post-enable dynamic
> allocation interfaces for MSI-X").
>
> Thomas merged 34026364df8e, so it would be best if he took the fixup
> as well.

I did and miserably failed to Cc you on the notification. Sorry about that.

  https://lore.kernel.org/r/167628749774.4906.17069524905880641563.tip-bot2@tip-bot2

Thanks,

        tglx
