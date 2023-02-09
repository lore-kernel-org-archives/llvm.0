Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04906A94B
	for <llvm@lists.linux.dev>; Thu,  9 Feb 2023 21:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675979348; x=1707515348;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NoqEpFoUL5d6Nc9ZguuUCJqwt+fia9YkIka8An7cQKQ=;
  b=YaGT3+UTCd+DouCKPvj7ou+KxTJ4b+grWwyxcaHxMmHR6jXBe+YV1L8l
   O/FjkO2hMumuDhZ3bFjh6w2v19/to0wtu0Vn30RGTUq79camSf56ZfKZU
   zDikHvqvMQ4qRUn1ZxhbJo0poXlKecbGAYKWXbltCsw0EqxW62koImzqz
   rmuwtJ5971kOmo4azg9XpcXilURgPql7ahsnWeZR3aW8+k6xaBjcvd7xU
   MfQqQ3umb1AaCEW23yUS0vXEEMfuu1jMmRlcn3hdN/gjX3+536Y4bh58x
   jcp3BCAXPGkjOvS7c4EQpIFPPvhZoMSP0ce8XYmSf5FdnfiC8mnJfARi5
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="331554737"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000"; 
   d="scan'208";a="331554737"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 13:49:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="913299005"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000"; 
   d="scan'208";a="913299005"
Received: from rchatre-ws.ostc.intel.com ([10.54.69.144])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 13:49:05 -0800
From: Reinette Chatre <reinette.chatre@intel.com>
To: bhelgaas@google.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	trix@redhat.com
Cc: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	tglx@linutronix.de,
	kevin.tian@intel.com,
	darwi@linutronix.de,
	reinette.chatre@intel.com
Subject: [PATCH] PCI: Fix build error when CONFIG_PCI_MSI disabled
Date: Thu,  9 Feb 2023 13:49:00 -0800
Message-Id: <158e40e1cfcfc58ae30ecb2bbfaf86e5bba7a1ef.1675978686.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pci_msix_alloc_irq_at() and pci_msix_free_irq() are not
declared when CONFIG_PCI_MSI is disabled.

Users of these two calls do not yet exist but when users
do appear (shown below is an attempt to use the new API
in vfio-pci) the following errors will be encountered when
compiling with CONFIG_PCI_MSI disabled:
drivers/vfio/pci/vfio_pci_intrs.c:461:4: error: implicit declaration of\
        function 'pci_msix_free_irq' is invalid in C99\
        [-Werror,-Wimplicit-function-declaration]
                           pci_msix_free_irq(pdev, msix_map);
                           ^
   drivers/vfio/pci/vfio_pci_intrs.c:461:4: note: did you mean 'pci_ims_free_irq'?
   include/linux/pci.h:2516:6: note: 'pci_ims_free_irq' declared here
   void pci_ims_free_irq(struct pci_dev *pdev, struct msi_map map);
        ^
drivers/vfio/pci/vfio_pci_intrs.c:511:15: error: implicit declaration of\
        function 'pci_msix_alloc_irq_at' is invalid in C99\
        [-Werror,-Wimplicit-function-declaration]
                   msix_map = pci_msix_alloc_irq_at(pdev, vector, NULL);
                                      ^
   drivers/vfio/pci/vfio_pci_intrs.c:511:15: note: did you mean 'pci_ims_alloc_irq'?
   include/linux/pci.h:2514:16: note: 'pci_ims_alloc_irq' declared here
   struct msi_map pci_ims_alloc_irq(struct pci_dev *pdev,\
                                    union msi_instance_cookie *icookie,

Provide definitions for pci_msix_alloc_irq_at() and pci_msix_free_irq() in
preparation for users that need to compile when CONFIG_PCI_MSI is
disabled.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
---

checkpatch.pl warns about the usage of -ENOSYS but it does appear
to be the custom.

 include/linux/pci.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/linux/pci.h b/include/linux/pci.h
index adffd65e84b4..448482d1c4fe 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1621,6 +1621,19 @@ pci_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
 					      flags, NULL);
 }
 
+static inline struct msi_map
+pci_msix_alloc_irq_at(struct pci_dev *dev, unsigned int index,
+		      const struct irq_affinity_desc *affdesc)
+{
+	struct msi_map map = { .index = -ENOSYS };
+
+	return map;
+}
+
+static inline void pci_msix_free_irq(struct pci_dev *pdev, struct msi_map map)
+{
+}
+
 static inline void pci_free_irq_vectors(struct pci_dev *dev)
 {
 }
-- 
2.34.1

