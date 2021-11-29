Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AB872
	for <llvm@lists.linux.dev>; Mon, 29 Nov 2021 09:47:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A78CC5832B;
	Mon, 29 Nov 2021 09:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1638179276;
	bh=bKT/FVKdDsk92Wsk+85dta6QHDOvKgOzfD9WCfX8L6I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FGET6Rlq/s9hVQHlCp0AoUcH4AeYsxMjK2AjuejvrI0cSE+gxS1CAJPX7IFv6hIL4
	 JdNzQxMP8CWCui1BxxU5Umwqlcl7IQqqoMYMiPlvlTdxXy2OpCLU0Suo48aJ3kXUAQ
	 3q/e+vM4s+5BjBHD0wT3Q3qEgcM/wWR4zeLCIzxk7Dv4fMnD1lMQ2YWszvL4fEyycj
	 DCEGoBBX7/Jh+32fECFenjGyfLsqo18nlKU/yLdZIJ/51+tZwrdAEUENkQHBoh1RcW
	 Vuu2OmaOJie6eicbF/Jzkl0OIFO7HSukrXVyrbTo0MpgA4+duRM77rdQjRcZOVP7VD
	 wQznjfqP9D2Aw==
Received: from mchehab by mail.kernel.org with local (Exim 4.94.2)
	(envelope-from <mchehab@kernel.org>)
	id 1mrdGM-000RBO-Ed; Mon, 29 Nov 2021 10:47:54 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: linuxarm@huawei.com,
	mauro.chehab@huawei.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Andrey Utkin <andrey_utkin@fastmail.com>,
	Anton Sviridenko <anton@corp.bluecherry.net>,
	Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
	Ismael Luceno <ismael@iodev.co.uk>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 08/20] media: solo6x10: mark unused functions as such
Date: Mon, 29 Nov 2021 10:47:40 +0100
Message-Id: <b06520417fbf23f482a584628023dd0a42943a22.1638179135.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1638179135.git.mchehab+huawei@kernel.org>
References: <cover.1638179135.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

There are several unused helper macros there, meant to parse some
fields. As those actually help to document the hardware, the
better is to keep them.

However, it generates clang warnings with W=1, causing build to
break with CONFIG_WERROR.

So, add __always_unused to fix such warnings.

Acked-by: Ismael Luceno <ismael@iodev.co.uk>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

See [PATCH v2 00/20] at: https://lore.kernel.org/all/cover.1638179135.git.mchehab+huawei@kernel.org/

 drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c b/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
index 0abcad4e84fa..7766cadb73ea 100644
--- a/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
+++ b/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
@@ -391,12 +391,12 @@ static int solo_send_desc(struct solo_enc_dev *solo_enc, int skip,
 }
 
 /* Extract values from VOP header - VE_STATUSxx */
-static inline int vop_interlaced(const vop_header *vh)
+static inline __always_unused int vop_interlaced(const vop_header *vh)
 {
 	return (__le32_to_cpu((*vh)[0]) >> 30) & 1;
 }
 
-static inline u8 vop_channel(const vop_header *vh)
+static inline __always_unused u8 vop_channel(const vop_header *vh)
 {
 	return (__le32_to_cpu((*vh)[0]) >> 24) & 0x1F;
 }
@@ -411,12 +411,12 @@ static inline u32 vop_mpeg_size(const vop_header *vh)
 	return __le32_to_cpu((*vh)[0]) & 0xFFFFF;
 }
 
-static inline u8 vop_hsize(const vop_header *vh)
+static inline u8 __always_unused vop_hsize(const vop_header *vh)
 {
 	return (__le32_to_cpu((*vh)[1]) >> 8) & 0xFF;
 }
 
-static inline u8 vop_vsize(const vop_header *vh)
+static inline u8 __always_unused vop_vsize(const vop_header *vh)
 {
 	return __le32_to_cpu((*vh)[1]) & 0xFF;
 }
@@ -436,12 +436,12 @@ static inline u32 vop_jpeg_size(const vop_header *vh)
 	return __le32_to_cpu((*vh)[4]) & 0xFFFFF;
 }
 
-static inline u32 vop_sec(const vop_header *vh)
+static inline u32 __always_unused vop_sec(const vop_header *vh)
 {
 	return __le32_to_cpu((*vh)[5]);
 }
 
-static inline u32 vop_usec(const vop_header *vh)
+static inline __always_unused u32 vop_usec(const vop_header *vh)
 {
 	return __le32_to_cpu((*vh)[6]);
 }
-- 
2.33.1

