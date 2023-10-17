Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B7D2D784
	for <llvm@lists.linux.dev>; Tue, 17 Oct 2023 17:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g+W74yYp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697565407; x=1729101407;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IiT0T9urHaaLctpoYEo5u8bWJoCO3zZAAlG/vZHqHnU=;
  b=g+W74yYplLwyiHX7YcF/KyDO2nn2q6HE8BcCAwYoyGnAXlueU4kYTNlV
   6kNJzMKco6hEk2BkKFkIMwe6uAtJijw7SCOTjHHJusQm3aHbNnJu4nWmP
   2T7VLPP9QyWQybN/7ZtNZmRihLOMmAPHVppTtuT8Ivnipv507s2mpeIYD
   PQnsoB0PD7JrgPr55Xsa9xD9cValW/6jBHwKJMCQe7k5TmfF3iygOROrL
   KLACXpNWWIosP+kCn104wiea/cxI8FHmvpYwYglVnV+GEOsa4xv3OCQRJ
   nY6+kws1s6AYes3sCf9i/qKQVhG4lOOLkb1YEdC+5Jk8ErV2UDl4z13xI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="472073930"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="472073930"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 10:56:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="929848920"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="929848920"
Received: from rchatre-ws.ostc.intel.com ([10.54.69.144])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 10:56:45 -0700
From: Reinette Chatre <reinette.chatre@intel.com>
To: bhelgaas@google.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	trix@redhat.com,
	tglx@linutronix.de
Cc: kevin.tian@intel.com,
	reinette.chatre@intel.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] PCI/MSI: Provide stubs for IMS functions
Date: Tue, 17 Oct 2023 10:56:38 -0700
Message-Id: <14ff656899a3757453f8584c1109d7a9b98fa258.1697564731.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IMS related functions (pci_create_ims_domain(),
pci_ims_alloc_irq(), and pci_ims_free_irq()) are not declared
when CONFIG_PCI_MSI is disabled.

Provide definitions of these functions for use when callers
are compiled with CONFIG_PCI_MSI disabled.

Fixes: 0194425af0c8 ("PCI/MSI: Provide IMS (Interrupt Message Store) support")
Fixes: c9e5bea27383 ("PCI/MSI: Provide pci_ims_alloc/free_irq()")
Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
Cc: stable@vger.kernel.org      # v6.2+
---

This is a preparatory patch for the first caller of these
functions (VFIO) for which work is in progress:
https://lore.kernel.org/lkml/cover.1696609476.git.reinette.chatre@intel.com/

checkpatch.pl complains about the usage of ENOSYS but
it does appear to be the custom.

 include/linux/pci.h | 34 ++++++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/include/linux/pci.h b/include/linux/pci.h
index 8c7c2c3c6c65..b56417276042 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1624,6 +1624,8 @@ struct msix_entry {
 	u16	entry;	/* Driver uses to specify entry, OS writes */
 };
 
+struct msi_domain_template;
+
 #ifdef CONFIG_PCI_MSI
 int pci_msi_vec_count(struct pci_dev *dev);
 void pci_disable_msi(struct pci_dev *dev);
@@ -1656,6 +1658,11 @@ void pci_msix_free_irq(struct pci_dev *pdev, struct msi_map map);
 void pci_free_irq_vectors(struct pci_dev *dev);
 int pci_irq_vector(struct pci_dev *dev, unsigned int nr);
 const struct cpumask *pci_irq_get_affinity(struct pci_dev *pdev, int vec);
+bool pci_create_ims_domain(struct pci_dev *pdev, const struct msi_domain_template *template,
+			   unsigned int hwsize, void *data);
+struct msi_map pci_ims_alloc_irq(struct pci_dev *pdev, union msi_instance_cookie *icookie,
+				 const struct irq_affinity_desc *affdesc);
+void pci_ims_free_irq(struct pci_dev *pdev, struct msi_map map);
 
 #else
 static inline int pci_msi_vec_count(struct pci_dev *dev) { return -ENOSYS; }
@@ -1719,6 +1726,25 @@ static inline const struct cpumask *pci_irq_get_affinity(struct pci_dev *pdev,
 {
 	return cpu_possible_mask;
 }
+
+static inline bool pci_create_ims_domain(struct pci_dev *pdev,
+					 const struct msi_domain_template *template,
+					 unsigned int hwsize, void *data)
+{ return false; }
+
+static inline struct msi_map pci_ims_alloc_irq(struct pci_dev *pdev,
+					       union msi_instance_cookie *icookie,
+					       const struct irq_affinity_desc *affdesc)
+{
+	struct msi_map map = { .index = -ENOSYS, };
+
+	return map;
+}
+
+static inline void pci_ims_free_irq(struct pci_dev *pdev, struct msi_map map)
+{
+}
+
 #endif
 
 /**
@@ -2616,14 +2642,6 @@ static inline bool pci_is_thunderbolt_attached(struct pci_dev *pdev)
 void pci_uevent_ers(struct pci_dev *pdev, enum  pci_ers_result err_type);
 #endif
 
-struct msi_domain_template;
-
-bool pci_create_ims_domain(struct pci_dev *pdev, const struct msi_domain_template *template,
-			   unsigned int hwsize, void *data);
-struct msi_map pci_ims_alloc_irq(struct pci_dev *pdev, union msi_instance_cookie *icookie,
-				 const struct irq_affinity_desc *affdesc);
-void pci_ims_free_irq(struct pci_dev *pdev, struct msi_map map);
-
 #include <linux/dma-mapping.h>
 
 #define pci_printk(level, pdev, fmt, arg...) \
-- 
2.34.1

