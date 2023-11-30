Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6809C47A58
	for <llvm@lists.linux.dev>; Thu, 30 Nov 2023 13:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="esjL4JrH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4ACEC433C9;
	Thu, 30 Nov 2023 13:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1701350955;
	bh=hMzZXUZ73brWGQxEM2H5xRe+mPrFx/8xAyqR/oqFDi8=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=esjL4JrHLGfRBbsMdTuxMMa5Ymtb32piQjwsev/e+ji8MvjZA/vQL/RFPyIFZc3ek
	 BMqgww6CvIw5KGUt8Ml7L68bLV2HO60BfF9VCyJmfFXvoKWCq3THT9fKFvU/Oe88Wd
	 Cu4WMhwNduyo6O13Eg92mnFTr/UNizfUfJkLjvzM=
Subject: Patch "PCI: keystone: Drop __init from ks_pcie_add_pcie_{ep,port}()" has been added to the 5.10-stable tree
To: bhelgaas@google.com,gregkh@linuxfoundation.org,llvm@lists.linux.dev,naresh.kamboju@linaro.org,nathan@kernel.org,sashal@kernel.org,u.kleine-koenig@pengutronix.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 30 Nov 2023 13:29:07 +0000
In-Reply-To: <20231128-5-4-fix-pci-keystone-modpost-warning-v1-1-a999b944ac81@kernel.org>
Message-ID: <2023113007-safehouse-immortal-f148@gregkh>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore


This is a note to let you know that I've just added the patch titled

    PCI: keystone: Drop __init from ks_pcie_add_pcie_{ep,port}()

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     pci-keystone-drop-__init-from-ks_pcie_add_pcie_-ep-port.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From nathan@kernel.org  Thu Nov 30 13:23:28 2023
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 28 Nov 2023 17:35:17 -0700
Subject: PCI: keystone: Drop __init from ks_pcie_add_pcie_{ep,port}()
To: gregkh@linuxfoundation.org, sashal@kernel.org
Cc: u.kleine-koenig@pengutronix.de, bhelgaas@google.com,  llvm@lists.linux.dev, stable@vger.kernel.org,  Naresh Kamboju <naresh.kamboju@linaro.org>,  Nathan Chancellor <nathan@kernel.org>
Message-ID: <20231128-5-4-fix-pci-keystone-modpost-warning-v1-1-a999b944ac81@kernel.org>

From: Nathan Chancellor <nathan@kernel.org>

This commit has no upstream equivalent.

After commit db5ebaeb8fda ("PCI: keystone: Don't discard .probe()
callback") in 5.10.202, there are two modpost warnings when building with
clang:

  WARNING: modpost: vmlinux.o(.text+0x5aa6dc): Section mismatch in reference from the function ks_pcie_probe() to the function .init.text:ks_pcie_add_pcie_port()
  The function ks_pcie_probe() references
  the function __init ks_pcie_add_pcie_port().
  This is often because ks_pcie_probe lacks a __init
  annotation or the annotation of ks_pcie_add_pcie_port is wrong.

  WARNING: modpost: vmlinux.o(.text+0x5aa6f4): Section mismatch in reference from the function ks_pcie_probe() to the function .init.text:ks_pcie_add_pcie_ep()
  The function ks_pcie_probe() references
  the function __init ks_pcie_add_pcie_ep().
  This is often because ks_pcie_probe lacks a __init
  annotation or the annotation of ks_pcie_add_pcie_ep is wrong.

ks_pcie_add_pcie_ep() was removed in upstream commit a0fd361db8e5 ("PCI:
dwc: Move "dbi", "dbi2", and "addr_space" resource setup into common
code") and ks_pcie_add_pcie_port() was removed in upstream
commit 60f5b73fa0f2 ("PCI: dwc: Remove unnecessary wrappers around
dw_pcie_host_init()"), both of which happened before upstream
commit 7994db905c0f ("PCI: keystone: Don't discard .probe() callback").

As neither of these removal changes are really suitable for stable, just
remove __init from these functions in stable, as it is no longer a
correct annotation after dropping __init from ks_pcie_probe().

Fixes: 012dba0ab814 ("PCI: keystone: Don't discard .probe() callback")
Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/pci/controller/dwc/pci-keystone.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -865,8 +865,8 @@ static irqreturn_t ks_pcie_err_irq_handl
 	return ks_pcie_handle_error_irq(ks_pcie);
 }
 
-static int __init ks_pcie_add_pcie_port(struct keystone_pcie *ks_pcie,
-					struct platform_device *pdev)
+static int ks_pcie_add_pcie_port(struct keystone_pcie *ks_pcie,
+				 struct platform_device *pdev)
 {
 	struct dw_pcie *pci = ks_pcie->pci;
 	struct pcie_port *pp = &pci->pp;
@@ -978,8 +978,8 @@ static const struct dw_pcie_ep_ops ks_pc
 	.get_features = &ks_pcie_am654_get_features,
 };
 
-static int __init ks_pcie_add_pcie_ep(struct keystone_pcie *ks_pcie,
-				      struct platform_device *pdev)
+static int ks_pcie_add_pcie_ep(struct keystone_pcie *ks_pcie,
+			       struct platform_device *pdev)
 {
 	int ret;
 	struct dw_pcie_ep *ep;


Patches currently in stable-queue which might be from nathan@kernel.org are

queue-5.10/pci-keystone-drop-__init-from-ks_pcie_add_pcie_-ep-port.patch
