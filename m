Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947DE1851;
	Wed, 29 Nov 2023 00:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V+K6rZNy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8A4AC433C7;
	Wed, 29 Nov 2023 00:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701218130;
	bh=26SSnZSSETp7eVbPvKHzOWJHKw4MBNIhszf05HlWXkc=;
	h=From:Date:Subject:To:Cc:From;
	b=V+K6rZNyvxtZId8LLzbT4IPGYG0x11He3gKZ3TzcL0EU1JzVQWXeSrAtHrUuYD1WI
	 L4JLe4pDIv6jj99P3Egna1rpsgRRDKkH6wkS2bH7JFkJSH9JVpFY25uTm0K8bCihDt
	 mCKZjazCvIrEnopQKkz8hZAG5i/5Qj+GmmDiBILKstuRhcc26abPv6wt0ipR3R/Nq/
	 KKo1Z2htxEp1QoBcxcc1/2duGhJEHXvl1uw4dIc7eZGQAiC0Kd7Zhm9PRMik6RjTKD
	 9iCaT/vexyKFVAWBdZFGOfFbgg4MhBTAhjZPjJAQJ8QrLnzaCYdpaCU5LjN8MSwt53
	 nEknu5OxrDXWg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 28 Nov 2023 17:35:17 -0700
Subject: [PATCH 5.4] PCI: keystone: Drop __init from
 ks_pcie_add_pcie_{ep,port}()
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231128-5-4-fix-pci-keystone-modpost-warning-v1-1-a999b944ac81@kernel.org>
X-B4-Tracking: v=1; b=H4sIAESHZmUC/x2NQQqDMBAAvyJ77oqJCtavlB6WuNpFuglZaSvi3
 w09zmFmDjDOwgZjdUDmj5hELeBuFYQX6cIoU2HwjW+d8wP22OEsP0xBcOXdtqiM7zilaBt+Kav
 ogp4Guod2JhcISiplLs5/84C+7uB5nhf9mrKvewAAAA==
To: gregkh@linuxfoundation.org, sashal@kernel.org
Cc: u.kleine-koenig@pengutronix.de, bhelgaas@google.com, 
 llvm@lists.linux.dev, stable@vger.kernel.org, 
 Naresh Kamboju <naresh.kamboju@linaro.org>, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3257; i=nathan@kernel.org;
 h=from:subject:message-id; bh=26SSnZSSETp7eVbPvKHzOWJHKw4MBNIhszf05HlWXkc=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDKlp7YGVnk1T5rOqeLPeiT3vsnOSwofjHasd1eQfmrafs
 fEsXFzaUcrCIMbFICumyFL9WPW4oeGcs4w3Tk2CmcPKBDKEgYtTACaywIPhn2G40PmPy5wOKmWZ
 yjro3irWCXlwRbfg8ecMZb1Fh90OH2NkuGGkv1FuakWI59Ev32N4M15IdVVtNN79VetIzK2bE32
 /cAMA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

This commit has no upstream equivalent.

After commit 012dba0ab814 ("PCI: keystone: Don't discard .probe()
callback") in 5.4, there are two modpost warnings when building with
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
---
This is not an issue in mainline but I still cc'd the author and
committer of 7994db905c0f in case they would like to check my analysis.
---
 drivers/pci/controller/dwc/pci-keystone.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index ddbb2b3db74a..920444b1cfc7 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -861,8 +861,8 @@ static irqreturn_t ks_pcie_err_irq_handler(int irq, void *priv)
 	return ks_pcie_handle_error_irq(ks_pcie);
 }
 
-static int __init ks_pcie_add_pcie_port(struct keystone_pcie *ks_pcie,
-					struct platform_device *pdev)
+static int ks_pcie_add_pcie_port(struct keystone_pcie *ks_pcie,
+				 struct platform_device *pdev)
 {
 	struct dw_pcie *pci = ks_pcie->pci;
 	struct pcie_port *pp = &pci->pp;
@@ -992,8 +992,8 @@ static const struct dw_pcie_ep_ops ks_pcie_am654_ep_ops = {
 	.get_features = &ks_pcie_am654_get_features,
 };
 
-static int __init ks_pcie_add_pcie_ep(struct keystone_pcie *ks_pcie,
-				      struct platform_device *pdev)
+static int ks_pcie_add_pcie_ep(struct keystone_pcie *ks_pcie,
+			       struct platform_device *pdev)
 {
 	int ret;
 	struct dw_pcie_ep *ep;

---
base-commit: 8e221b47173d59e1b2877f6d8dc91e8be2031746
change-id: 20231128-5-4-fix-pci-keystone-modpost-warning-2a8a9c3fa1ca

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

