Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02D57C
	for <llvm@lists.linux.dev>; Mon, 28 Feb 2022 15:27:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE0D7C340E7;
	Mon, 28 Feb 2022 15:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646062024;
	bh=kFhWjGGPF0HOMSD41o5huv2osoCwgvTkZ3Q334nGLzY=;
	h=From:To:Cc:Subject:Date:From;
	b=gn3F5ZL+dou8lTgfyLNm181boVHfFi+CTyIt/fDJtEMsk00674yLi6uEWrBRqz2EC
	 rWdAi7n5FTg5oOA/k3VIZ/FlW7A9FsC0Hf99O+46B82BI5g4xxsoSl6nSB3UL+Q7ia
	 TkoyE+Ne4nSdi+OzagxH6CAJ3cSXWx9Ug3cX5aZJhEjH1ygv6VyHlWzW/msM5wEkAt
	 sn8nU/Qo2ndeTO79tMwOXgX0+xOfNWSK0B+Arpx15XZEebqLlXuVVekSt4AmbqipmY
	 4kSMGfpqhTyXW/rrhhsI4eJ02lyEfBPwO+k1gty5GZx8XHK3aCBpwaRhrAIkJLu5Qv
	 386CwB06NKMfQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Lewis Hanly <lewis.hanly@microchip.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	kernel test robot <lkp@intel.com>,
	Jassi Brar <jaswinder.singh@linaro.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] SoC: polarfire: fix build warning
Date: Mon, 28 Feb 2022 16:26:52 +0100
Message-Id: <20220228152658.3367506-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The newly added driver causes a build warning because of a missing
prototype:

drivers/soc/microchip/mpfs-sys-controller.c:76:6: warning: no previous prototype for function 'mpfs_sys_controller_put' [-Wmissing-prototypes]

Link: https://lore.kernel.org/llvm/202202260947.F5T1YNao-lkp@intel.com/
Reported-by: kernel test robot <lkp@intel.com>
Fixes: d0054a470c33 ("soc: add microchip polarfire soc system controller")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I've applied this to the arm/drivers branch as a fixup

 include/soc/microchip/mpfs.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/soc/microchip/mpfs.h b/include/soc/microchip/mpfs.h
index 6466515262bd..969b5239521e 100644
--- a/include/soc/microchip/mpfs.h
+++ b/include/soc/microchip/mpfs.h
@@ -38,6 +38,8 @@ int mpfs_blocking_transaction(struct mpfs_sys_controller *mpfs_client, struct mp
 
 struct mpfs_sys_controller *mpfs_sys_controller_get(struct device *dev);
 
+void mpfs_sys_controller_put(void *data);
+
 #endif /* if IS_ENABLED(CONFIG_POLARFIRE_SOC_SYS_CTRL) */
 
 #endif /* __SOC_MPFS_H__ */
-- 
2.29.2

