Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEF45399
	for <llvm@lists.linux.dev>; Thu, 31 Aug 2023 21:23:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27F1DC433C8;
	Thu, 31 Aug 2023 21:23:28 +0000 (UTC)
Date: Thu, 31 Aug 2023 23:23:26 +0200
From: Helge Deller <deller@gmx.de>
To: Nick Desaulniers <ndesaulniers@google.com>, linux-fbdev@vger.kernel.org,
	dri-devel <dri-devel@lists.freedesktop.org>,
	clang-built-linux <llvm@lists.linux.dev>,
	LKML <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: truncation in drivers/video/fbdev/neofb.c
Message-ID: <ZPEEzkQcQOP9yVFF@ls3530>
References: <CAKwvOdn0xoVWjQ6ufM_rojtKb0f1i1hW-J_xYGfKDNFdHwaeHQ@mail.gmail.com>
 <9d2bb495-0c1d-0d1b-96ea-4b1110d45b79@gmx.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d2bb495-0c1d-0d1b-96ea-4b1110d45b79@gmx.de>

* Helge Deller <deller@gmx.de>:
> On 8/29/23 18:45, Nick Desaulniers wrote:
> > A recent change in clang made it better about spotting snprintf that
> > will result in truncation.  Nathan reported the following instances:
> > 
> > drivers/video/fbdev/neofb.c:1959:3: warning: 'snprintf' will always be
> > truncated; specified size is 16, but format string expands to at least
> > 17 [-Wfortify-source]

FYI, I've added the patch below to the fbdev for-next git tree.

Helge

From: Helge Deller <deller@gmx.de>
Subject: [PATCH] fbdev: neofb: Shorten Neomagic product name in info struct

Avoid those compiler warnings:
neofb.c:1959:3: warning: 'snprintf' will always be truncated;
   specified size is 16, but format string expands to at least 17 [-Wfortify-source]

Signed-off-by: Helge Deller <deller@gmx.de>
Reported-by: Nathan Chancellor <nathan@kernel.org>
Reported-by: Nick Desaulniers <ndesaulniers@google.com>
Link: https://lore.kernel.org/all/CAKwvOdn0xoVWjQ6ufM_rojtKb0f1i1hW-J_xYGfKDNFdHwaeHQ@mail.gmail.com/
Link: https://github.com/ClangBuiltLinux/linux/issues/1923

diff --git a/drivers/video/fbdev/neofb.c b/drivers/video/fbdev/neofb.c
index d2f622b4c372..b905fe93b525 100644
--- a/drivers/video/fbdev/neofb.c
+++ b/drivers/video/fbdev/neofb.c
@@ -1948,49 +1948,40 @@ static struct fb_info *neo_alloc_fb_info(struct pci_dev *dev,
 
 	switch (info->fix.accel) {
 	case FB_ACCEL_NEOMAGIC_NM2070:
-		snprintf(info->fix.id, sizeof(info->fix.id),
-				"MagicGraph 128");
+		strscpy(info->fix.id, "MagicGraph128", sizeof(info->fix.id));
 		break;
 	case FB_ACCEL_NEOMAGIC_NM2090:
-		snprintf(info->fix.id, sizeof(info->fix.id),
-				"MagicGraph 128V");
+		strscpy(info->fix.id, "MagicGraph128V", sizeof(info->fix.id));
 		break;
 	case FB_ACCEL_NEOMAGIC_NM2093:
-		snprintf(info->fix.id, sizeof(info->fix.id),
-				"MagicGraph 128ZV");
+		strscpy(info->fix.id, "MagicGraph128ZV", sizeof(info->fix.id));
 		break;
 	case FB_ACCEL_NEOMAGIC_NM2097:
-		snprintf(info->fix.id, sizeof(info->fix.id),
-				"MagicGraph 128ZV+");
+		strscpy(info->fix.id, "Mag.Graph128ZV+", sizeof(info->fix.id));
 		break;
 	case FB_ACCEL_NEOMAGIC_NM2160:
-		snprintf(info->fix.id, sizeof(info->fix.id),
-				"MagicGraph 128XD");
+		strscpy(info->fix.id, "MagicGraph128XD", sizeof(info->fix.id));
 		break;
 	case FB_ACCEL_NEOMAGIC_NM2200:
-		snprintf(info->fix.id, sizeof(info->fix.id),
-				"MagicGraph 256AV");
+		strscpy(info->fix.id, "MagicGraph256AV", sizeof(info->fix.id));
 		info->flags |= FBINFO_HWACCEL_IMAGEBLIT |
 		               FBINFO_HWACCEL_COPYAREA |
                 	       FBINFO_HWACCEL_FILLRECT;
 		break;
 	case FB_ACCEL_NEOMAGIC_NM2230:
-		snprintf(info->fix.id, sizeof(info->fix.id),
-				"MagicGraph 256AV+");
+		strscpy(info->fix.id, "MagicGraph256AV+", sizeof(info->fix.id));
 		info->flags |= FBINFO_HWACCEL_IMAGEBLIT |
 		               FBINFO_HWACCEL_COPYAREA |
                 	       FBINFO_HWACCEL_FILLRECT;
 		break;
 	case FB_ACCEL_NEOMAGIC_NM2360:
-		snprintf(info->fix.id, sizeof(info->fix.id),
-				"MagicGraph 256ZX");
+		strscpy(info->fix.id, "MagicGraph256ZX", sizeof(info->fix.id));
 		info->flags |= FBINFO_HWACCEL_IMAGEBLIT |
 		               FBINFO_HWACCEL_COPYAREA |
                 	       FBINFO_HWACCEL_FILLRECT;
 		break;
 	case FB_ACCEL_NEOMAGIC_NM2380:
-		snprintf(info->fix.id, sizeof(info->fix.id),
-				"MagicGraph 256XL+");
+		strscpy(info->fix.id, "MagicGraph256XL+", sizeof(info->fix.id));
 		info->flags |= FBINFO_HWACCEL_IMAGEBLIT |
 		               FBINFO_HWACCEL_COPYAREA |
                 	       FBINFO_HWACCEL_FILLRECT;
