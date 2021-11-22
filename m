Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFE02C87
	for <llvm@lists.linux.dev>; Mon, 22 Nov 2021 09:26:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E6A6B604DA;
	Mon, 22 Nov 2021 09:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637573176;
	bh=oAnn+EVwkewlNETnxaYIhl5BiF6hjTjrZ8WGo7X1wck=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K2w6+8SqvI+ALOEr4RAcNwHLphEGZZUCIqfS8IytbNfIfVaaA8K4YRtZTOx1ta4bo
	 EHIOp0CU0qN9vRCRgYZfYCk1JIQKMIwqHG6usE4KBzcten2W9+XQKBoGtLv0W/0SSP
	 W8QelQYX2xK3W95zDY31zerMXqkN+Ua1mQjEF7zcGtzLZXn7n3avGdwjE/9Fh1/JzZ
	 1xlmym/0vBmuWqDEw+ThlujVKyBzyHcws3JTWzuQdH/RGdMD73cerwcqsJ/V6sMj6F
	 vTdKwaHIGLhOG2w4B/Mi6XUSyLg2OLAWIFFWu7lWHbD924pP+A7Mtya/kSEYomKo+3
	 XajkXey7LjEQg==
Received: by mail.kernel.org with local (Exim 4.94.2)
	(envelope-from <mchehab@kernel.org>)
	id 1mp5aX-003hiP-4g; Mon, 22 Nov 2021 09:26:13 +0000
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: linuxarm@huawei.com,
	mauro.chehab@huawei.com,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 05/10] media: mc: mark a debug function with __maybe_unused
Date: Mon, 22 Nov 2021 09:26:07 +0000
Message-Id: <8a18223a184901971137954903ad59bd152d0d47.1637573097.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637573097.git.mchehab+huawei@kernel.org>
References: <cover.1637573097.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

The gobj_type() function translates the media object type into
a name, being useful for debugging purposes. It is currently
not used, but let's keep it around, as it can be useful.

So, mark it with __maybe_unused, in order to shut up a
clang warning.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/10] at: https://lore.kernel.org/all/cover.1637573097.git.mchehab+huawei@kernel.org/

 drivers/media/mc/mc-entity.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index f40f41977142..b0ea145ac9c0 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -14,7 +14,7 @@
 #include <media/media-entity.h>
 #include <media/media-device.h>
 
-static inline const char *gobj_type(enum media_gobj_type type)
+static inline __maybe_unused const char *gobj_type(enum media_gobj_type type)
 {
 	switch (type) {
 	case MEDIA_GRAPH_ENTITY:
-- 
2.33.1

