Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13778CB80
	for <llvm@lists.linux.dev>; Tue, 14 Feb 2023 22:24:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BEFBC433D2;
	Tue, 14 Feb 2023 22:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676413441;
	bh=r6CdMG3yJAhW1VAs+mJFgRbcKZm1i4B1alhutZnLipE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=nVW9Uwk6Zixetm2lwJDWjXN5tCq7VgaEhjKOthktCW35jAPkOZqx2B93Y8rC9DEYK
	 gWP+hQXKkskd5GcK/CQjw6Z3wZ7FTCb6ZPY9Vd7++wew6sBsLsDOngIf8JGaprtB9W
	 gMjY+JQ2FECEqyxuNQzPbhVL9aih0ZOzj+t2dawi3FLYMd9biPbgDjZ0tmaYL01ZFT
	 /S+7Lpk8mPVNJpx/RGPx09ZSQc//gIZTGpwZP872MXklQlSSWadIVgkM5N4KcAa+1h
	 w+RlV7y90L41b5lJcrTo+JxdQtRdF29MzA/cixp4rwsBG0l4PSmd40Dnwt/nlWafba
	 DBHKl9cIXV/Iw==
Date: Tue, 14 Feb 2023 16:24:00 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: bhelgaas@google.com, nathan@kernel.org, ndesaulniers@google.com,
	trix@redhat.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	tglx@linutronix.de, kevin.tian@intel.com, darwi@linutronix.de
Subject: Re: [PATCH] PCI: Fix build error when CONFIG_PCI_MSI disabled
Message-ID: <20230214222400.GA3089902@bhelgaas>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <158e40e1cfcfc58ae30ecb2bbfaf86e5bba7a1ef.1675978686.git.reinette.chatre@intel.com>

On Thu, Feb 09, 2023 at 01:49:00PM -0800, Reinette Chatre wrote:
> pci_msix_alloc_irq_at() and pci_msix_free_irq() are not
> declared when CONFIG_PCI_MSI is disabled.
> 
> Users of these two calls do not yet exist but when users
> do appear (shown below is an attempt to use the new API
> in vfio-pci) the following errors will be encountered when
> compiling with CONFIG_PCI_MSI disabled:
> drivers/vfio/pci/vfio_pci_intrs.c:461:4: error: implicit declaration of\
>         function 'pci_msix_free_irq' is invalid in C99\
>         [-Werror,-Wimplicit-function-declaration]
>                            pci_msix_free_irq(pdev, msix_map);
>                            ^
>    drivers/vfio/pci/vfio_pci_intrs.c:461:4: note: did you mean 'pci_ims_free_irq'?
>    include/linux/pci.h:2516:6: note: 'pci_ims_free_irq' declared here
>    void pci_ims_free_irq(struct pci_dev *pdev, struct msi_map map);
>         ^
> drivers/vfio/pci/vfio_pci_intrs.c:511:15: error: implicit declaration of\
>         function 'pci_msix_alloc_irq_at' is invalid in C99\
>         [-Werror,-Wimplicit-function-declaration]
>                    msix_map = pci_msix_alloc_irq_at(pdev, vector, NULL);
>                                       ^
>    drivers/vfio/pci/vfio_pci_intrs.c:511:15: note: did you mean 'pci_ims_alloc_irq'?
>    include/linux/pci.h:2514:16: note: 'pci_ims_alloc_irq' declared here
>    struct msi_map pci_ims_alloc_irq(struct pci_dev *pdev,\
>                                     union msi_instance_cookie *icookie,
> 
> Provide definitions for pci_msix_alloc_irq_at() and pci_msix_free_irq() in
> preparation for users that need to compile when CONFIG_PCI_MSI is
> disabled.

I think this should have a "Fixes:" tag to connect it with the commit
that added pci_msix_alloc_irq_at() and pci_msix_free_irq().

Looks like 34026364df8e ("PCI/MSI: Provide post-enable dynamic
allocation interfaces for MSI-X").

Thomas merged 34026364df8e, so it would be best if he took the fixup
as well.

> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
> ---
> 
> checkpatch.pl warns about the usage of -ENOSYS but it does appear
> to be the custom.
> 
>  include/linux/pci.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index adffd65e84b4..448482d1c4fe 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -1621,6 +1621,19 @@ pci_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
>  					      flags, NULL);
>  }
>  
> +static inline struct msi_map
> +pci_msix_alloc_irq_at(struct pci_dev *dev, unsigned int index,
> +		      const struct irq_affinity_desc *affdesc)
> +{
> +	struct msi_map map = { .index = -ENOSYS };
> +
> +	return map;
> +}
> +
> +static inline void pci_msix_free_irq(struct pci_dev *pdev, struct msi_map map)
> +{
> +}
> +
>  static inline void pci_free_irq_vectors(struct pci_dev *dev)
>  {
>  }
> -- 
> 2.34.1
> 
