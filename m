Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E40720F8
	for <llvm@lists.linux.dev>; Fri, 14 Oct 2022 13:53:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE7CAC433D6;
	Fri, 14 Oct 2022 13:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665755627;
	bh=4hQpTDpd1K9WqK9XyDTFRW2d2jeqa1ZI2a7SGGKYSUY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g8SfUfnBdLcenTSS3HRkjjavRbcnNpKPu1qu04Uv2bcyqE/fPE2s7CsnTZXEFGBSh
	 T5bvcpNpgc6XoHSvo/6L0Z2D/Rp2Ms0RtWsogvK9kUjmQxSpFwO+zksxpAOa7tidFD
	 YmlVg936RDxNLcUsXfS9M7VTsE65ozxJxCWmf5NUwuGeVG375FY7m22kz6jIrA9ZyV
	 IbzDxCpRYDv41yIe0o8nZabBgSJSDcjdxH/KIjJeqVhP/ljd+pEeHX8KqUuxmO7Hel
	 KkAGMQF2DMSO6APZEC6LJQMnEhliorrYHvCTVjbr4YnWddQL26rK+6zJykgTLVWR/2
	 RP7wdH0Vh7wkg==
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
	nick.child@ibm.com,
	christophe.leroy@csgroup.eu,
	Julia.Lawall@inria.fr,
	linuxppc-dev@lists.ozlabs.org,
	llvm@lists.linux.dev
Subject: [PATCH AUTOSEL 5.10 3/7] powerpc/85xx: Fix fall-through warning for Clang
Date: Fri, 14 Oct 2022 09:53:29 -0400
Message-Id: <20221014135334.2109814-3-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221014135334.2109814-1-sashal@kernel.org>
References: <20221014135334.2109814-1-sashal@kernel.org>
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
index 172d2b7cfeb7..aedb2eb44b47 100644
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

