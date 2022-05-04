Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D60B20EE
	for <llvm@lists.linux.dev>; Wed,  4 May 2022 01:47:47 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id qe3-20020a17090b4f8300b001dc24e4da73so2750616pjb.1
        for <llvm@lists.linux.dev>; Tue, 03 May 2022 18:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t4tLOfp2E2B9sgaGczz1NwPmHgtmRYBWoAQq16bLzJ0=;
        b=I3H3+WN+4U2IJzWLbxbA/bIvmhwpU+qBCw+gT1kFMomBbMNpQHZRW5m4AyP4iYFi7B
         wO7Fc+96Bo7pEAoDQ9bMSzGw32N3zXUa3Gz+3UCf0arCmNNwPy4jlH+xYNM+a196cQiM
         uiF0kR4EmYLRMWy1Z3PDmpbPfAtknr37xwrFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t4tLOfp2E2B9sgaGczz1NwPmHgtmRYBWoAQq16bLzJ0=;
        b=emwd7t3AF5X6pOjvPh82cKUh0f8LSnA/HzF8BlLRN8tKtHbTTqeEHGKJiCX6bgzWYB
         kvMohSp+o5rrnX0odYzNy/2z/ldmQ/ndy78U2xtgIufR5QJ0/vJ10+RB/yXY+rvwi6ka
         S71rixsEM9iVHQAK6PHQc6+2oHqQju6UTlw9oBJWVkfjyQMJHlE238yk3a2eSA/zGaIF
         g9v1LL4aE51Z+ZutaQ2Npu8VA7Dqs/C0WXrmAY4zabT5O5e0zqszrzOhmBNg0LX6m4hc
         vj8W1qwyxscH5TWNhcf1bt5nZCotHMeIJpU+vS75wgAw2T0LCgQhS44sTqhk9K3/6M0k
         a/fw==
X-Gm-Message-State: AOAM5325VCI6ROMBGT2fJDj5TbiXBH1b8s3Uc2de+lSghWeW5WMl1u/D
	2upjtjg1cF5EyC8+MPrUHI16GA==
X-Google-Smtp-Source: ABdhPJwlsT0iQnDL6xwldA7EiHSnV+6TMJGJpyqPrrObMI2QZUEHe3gCMsqWN7yN6aeTIm9o+5AxVg==
X-Received: by 2002:a17:902:ecc8:b0:15e:9e46:cb7e with SMTP id a8-20020a170902ecc800b0015e9e46cb7emr14297448plh.111.1651628866623;
        Tue, 03 May 2022 18:47:46 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id az10-20020a170902a58a00b0015e8d4eb233sm6960220plb.125.2022.05.03.18.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 18:47:45 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A . R . Silva" <gustavoars@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	Russell King <linux@armlinux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <songmuchun@bytedance.com>,
	linux-arm-kernel@lists.infradead.org,
	Alexei Starovoitov <ast@kernel.org>,
	alsa-devel@alsa-project.org,
	Al Viro <viro@zeniv.linux.org.uk>,
	Andrew Gabbasov <andrew_gabbasov@mentor.com>,
	Andy Gross <agross@kernel.org>,
	Andy Lavr <andy.lavr@gmail.com>,
	Arend van Spriel <aspriel@gmail.com>,
	Baowen Zheng <baowen.zheng@corigine.com>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Bradley Grove <linuxdrivers@attotech.com>,
	brcm80211-dev-list.pdl@broadcom.com,
	=?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>,
	Christian Lamparter <chunkeey@googlemail.com>,
	Chris Zankel <chris@zankel.net>,
	Cong Wang <cong.wang@bytedance.com>,
	Daniel Axtens <dja@axtens.net>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>,
	David Gow <davidgow@google.com>,
	David Howells <dhowells@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
	devicetree@vger.kernel.org,
	Dexuan Cui <decui@microsoft.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Eli Cohen <elic@nvidia.com>,
	Eric Dumazet <edumazet@google.com>,
	Eric Paris <eparis@parisplace.org>,
	Eugeniu Rosca <erosca@de.adit-jv.com>,
	Felipe Balbi <balbi@kernel.org>,
	Francis Laniel <laniel_francis@privacyrequired.com>,
	Frank Rowand <frowand.list@gmail.com>,
	Franky Lin <franky.lin@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Hante Meuleman <hante.meuleman@broadcom.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Hulk Robot <hulkci@huawei.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	James Morris <jmorris@namei.org>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Jens Axboe <axboe@kernel.dk>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Keeping <john@metanate.com>,
	Juergen Gross <jgross@suse.com>,
	Kalle Valo <kvalo@kernel.org>,
	Keith Packard <keithp@keithp.com>,
	keyrings@vger.kernel.org,
	kunit-dev@googlegroups.com,
	Kuniyuki Iwashima <kuniyu@amazon.co.jp>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Lee Jones <lee.jones@linaro.org>,
	Leon Romanovsky <leon@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux1394-devel@lists.sourceforge.net,
	linux-afs@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-xtensa@linux-xtensa.org,
	llvm@lists.linux.dev,
	Loic Poulain <loic.poulain@linaro.org>,
	Louis Peens <louis.peens@corigine.com>,
	Luca Coelho <luciano.coelho@intel.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Mark Brown <broonie@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Mimi Zohar <zohar@linux.ibm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	netdev@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Paul Moore <paul@paul-moore.com>,
	Rich Felker <dalias@aerifal.cx>,
	Rob Herring <robh+dt@kernel.org>,
	selinux@vger.kernel.org,
	"Serge E. Hallyn" <serge@hallyn.com>,
	SHA-cyfmac-dev-list@infineon.com,
	Simon Horman <simon.horman@corigine.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Stefan Richter <stefanr@s5r6.in-berlin.de>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Tadeusz Struk <tadeusz.struk@linaro.org>,
	Takashi Iwai <tiwai@suse.com>,
	Tom Rix <trix@redhat.com>,
	Udipto Goswami <quic_ugoswami@quicinc.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	wcn36xx@lists.infradead.org,
	Wei Liu <wei.liu@kernel.org>,
	xen-devel@lists.xenproject.org,
	Xiu Jianfeng <xiujianfeng@huawei.com>,
	Yang Yingliang <yangyingliang@huawei.com>
Subject: [PATCH 22/32] atags_proc: Use mem_to_flex_dup() with struct buffer
Date: Tue,  3 May 2022 18:44:31 -0700
Message-Id: <20220504014440.3697851-23-keescook@chromium.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220504014440.3697851-1-keescook@chromium.org>
References: <20220504014440.3697851-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1766; h=from:subject; bh=LnjqklrPVWNNMfpJjCRO96xv5LhFHHWzp99zKaiUXqg=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBicdqFIMxxbq1Hf+xelWQa6dzkOUxczwNZ6gqGtZgE u/xEciiJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYnHahQAKCRCJcvTf3G3AJpySD/ 9y19Eohym3FvBZ0fkG9198v9dbCdm6Pjk18VavszBLhJaXRQM+HUC12vTL4roysA9+j7Y6cR3Kj+wq mOj198L6Vf/kLphe9xK9VW8LUtIBMSqwCe6Jb9KvCOzeJt1MCby6s4CLjMwjVk9Xf0ZpbPwyghODjv Ol/fkTTE1L9VOXyhYqOagbjRt1ZyTMdInfVLCEui8yUpYiaclByI9CIWaHVkeTDP+2pgEibaH/4OYF wScQ0s9UBHmLFAqRyw73xHGYEHN7DaT9kxcQ0VZMiNRcYxnu5o5CdcqgHDnW0Ws1fLC8PN0uMYp4N2 rNatCh14EdFNyQewdpkHW8VlGj373tjOHjfpHC0RkrDel6FJ4Ac7ipDJypBfD/E0/Apg/I1MwDDPaC nZOn83UTZag+wJyrVfm5yRqNeeoaLNiS9PzD+ARWL40QVrGBA61Ch7hLljKEu7HPfOeufLqsruBVa/ IGTYZbtUKTu+xZFocXg9FmT3/XFiJqva79//82c/nDPbB0Oek/1d/nHiv6e1p5qQeyDcF/lH9dR7Vc v6zhxqG/em6APpkkhmZtA3GMlJqi13XwAKn0eZ/nS06JrCIy8Cq+02xWpUwqJV6SZ63AviU8SrK86H cYVB3yY3zLGR0ABTEsKF2Yo/EaE3tvZgUnPk5p2jx3782+uMiis96Fb2iKQw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

As part of the work to perform bounds checking on all memcpy() uses,
replace the open-coded a deserialization of bytes out of memory into a
trailing flexible array by using a flex_array.h helper to perform the
allocation, bounds checking, and copying.

Cc: Russell King <linux@armlinux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Muchun Song <songmuchun@bytedance.com>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/arm/kernel/atags_proc.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/arm/kernel/atags_proc.c b/arch/arm/kernel/atags_proc.c
index 3ec2afe78423..638bbb616daa 100644
--- a/arch/arm/kernel/atags_proc.c
+++ b/arch/arm/kernel/atags_proc.c
@@ -6,8 +6,8 @@
 #include <asm/page.h>
 
 struct buffer {
-	size_t size;
-	char data[];
+	DECLARE_FLEX_ARRAY_ELEMENTS_COUNT(size_t, size);
+	DECLARE_FLEX_ARRAY_ELEMENTS(char, data);
 };
 
 static ssize_t atags_read(struct file *file, char __user *buf,
@@ -38,7 +38,7 @@ static int __init init_atags_procfs(void)
 	 */
 	struct proc_dir_entry *tags_entry;
 	struct tag *tag = (struct tag *)atags_copy;
-	struct buffer *b;
+	struct buffer *b = NULL;
 	size_t size;
 
 	if (tag->hdr.tag != ATAG_CORE) {
@@ -54,13 +54,9 @@ static int __init init_atags_procfs(void)
 
 	WARN_ON(tag->hdr.tag != ATAG_NONE);
 
-	b = kmalloc(sizeof(*b) + size, GFP_KERNEL);
-	if (!b)
+	if (mem_to_flex_dup(&b, atags_copy, size, GFP_KERNEL))
 		goto nomem;
 
-	b->size = size;
-	memcpy(b->data, atags_copy, size);
-
 	tags_entry = proc_create_data("atags", 0400, NULL, &atags_proc_ops, b);
 	if (!tags_entry)
 		goto nomem;
-- 
2.32.0

