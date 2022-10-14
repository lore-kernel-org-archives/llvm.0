Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCEB20F8
	for <llvm@lists.linux.dev>; Fri, 14 Oct 2022 13:54:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A10C5C43143;
	Fri, 14 Oct 2022 13:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665755655;
	bh=tZ8r0nEm9ww6pagcy3WIdi9jBPme7+ILd/BnEUv8f0g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tM+TL5FJ4QDGIaaHt8NuB0tALyo9w6LyO3smq6n2PZ1waQWFbTVNS08kA6EvgFjz1
	 d1/ZpwYd+t9hNWcrnq4NRp336XlvBDsjnFrBVTTVr4ykSCRrHFSy71kewUeRcIfVP8
	 eN73lNM0SsWHXPOweIkLhg8jS96DZuLHF0EnU6R4mNXZ2kP+AkXX6f0ywjV0tdz7u3
	 vWnqLA+FDfGLmgt19qIC6SRu05KFCyxWCQLUOHNEDVhrxNdCXKvkSxArD/8bLqSnYB
	 gbdSpGNTRYNtGSBRDvlxNBKo9gB1KyLq+KZ7IQJ0pXPqoCeqcD9XebIfwfmIYw6FwI
	 dXV2nYJVbiNKg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	kernel test robot <lkp@intel.com>,
	Kees Cook <keescook@chromium.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Sasha Levin <sashal@kernel.org>,
	oss@buserror.net,
	nathan@kernel.org,
	ndesaulniers@google.com,
	joel@jms.id.au,
	nick.child@ibm.com,
	christophe.leroy@csgroup.eu,
	Julia.Lawall@inria.fr,
	linuxppc-dev@lists.ozlabs.org,
	llvm@lists.linux.dev
Subject: [PATCH AUTOSEL 5.4 3/7] powerpc/85xx: Fix fall-through warning for Clang
Date: Fri, 14 Oct 2022 09:53:56 -0400
Message-Id: <20221014135402.2109942-3-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221014135402.2109942-1-sashal@kernel.org>
References: <20221014135402.2109942-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: "Gustavo A. R. Silva" <gustavoars@kernel.org>

[ Upstream commit d4d944ff68cb1f896d3f3b1af0bc656949dc626a ]

Fix the following fallthrough warning:

arch/powerpc/platforms/85xx/mpc85xx_cds.c:161:3: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://github.com/KSPP/linux/issues/198
Link: https://lore.kernel.org/lkml/202209061224.KxORRGVg-lkp@intel.com/
Link: https://lore.kernel.org/r/Yxe8XTY5C9qJLd0Z@work
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/platforms/85xx/mpc85xx_cds.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/85xx/mpc85xx_cds.c b/arch/powerpc/platforms/85xx/mpc85xx_cds.c
index 6b1436abe9b1..ee2e6906250c 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_cds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_cds.c
@@ -158,6 +158,7 @@ static void __init mpc85xx_cds_pci_irq_fixup(struct pci_dev *dev)
 			else
 				dev->irq = 10;
 			pci_write_config_byte(dev, PCI_INTERRUPT_LINE, dev->irq);
+			break;
 		default:
 			break;
 		}
-- 
2.35.1

