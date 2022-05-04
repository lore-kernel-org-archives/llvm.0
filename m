Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18F120E0
	for <llvm@lists.linux.dev>; Wed,  4 May 2022 01:57:45 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id qe3-20020a17090b4f8300b001dc24e4da73so2762190pjb.1
        for <llvm@lists.linux.dev>; Tue, 03 May 2022 18:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gAffb2dB7AJw8ctZpf7uy/Kjt0ZfUPuqpFj+O/VUlMc=;
        b=Hd3jrxU8+XlRdXnNJ6BuxLBWU0ZKLG70m7wHx4jqP+VfQJII0AB4HJY2PvK+TXUYom
         id9ML06dSBRB1VVnBWjBz+2v5YDaqSJHQM5Ls3McxesxCE+qRmiHqxTVev9Mnq0iPJTj
         hb0i3oZtBtCUvWZopE6bN0CU7y3IuWgie3Mk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gAffb2dB7AJw8ctZpf7uy/Kjt0ZfUPuqpFj+O/VUlMc=;
        b=mv0k30rDfqvveKUOiVIiUz1eeKpHLBxoKDFIqc5Q9cpDA4DsmBpW3u9mX3arHLKJIl
         uBxGGP3Sijsu7dCfZKDyWRCZqyuFkmYOeICWwYoUmW6hqzGal1xfj5wJmG90WSeX7V6v
         OmqylDpRWCxGL4ZT8B4K7jnwMdWHqHsfSo2qWBshr/hTQ3zeibar0Tq/OHdxnsPTOfRS
         Fc+9JLEjFQ2eu7X0t5FtChFcit+WME9E+HOOrWz06TQYtsqRHug6lWxmWo+lzV4cU0bM
         lrfx3/ymPqATiVofVPkGF33eSGq0y8G96I/mTVPLNOQ/M2FHziMYZqSN+6Sq249XL4JG
         RYkA==
X-Gm-Message-State: AOAM532OnxtsP7WIvE81HxYQjX/89qamGOvU2r0M7CnCoYPK7amwuh5f
	eMQDupEqumQ6cmG8up9iLix4yg==
X-Google-Smtp-Source: ABdhPJz6qaS4+sld6IO764cErbo2AsXw9zqY/8zLJ1brIZKZBC0UJqtHfYq6e8mw4ednkAIXxJWdIQ==
X-Received: by 2002:a17:90b:1c8f:b0:1b8:c6dc:ca61 with SMTP id oo15-20020a17090b1c8f00b001b8c6dcca61mr7862141pjb.13.1651629465413;
        Tue, 03 May 2022 18:57:45 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id v5-20020a655c45000000b003c14af5060asm13495971pgr.34.2022.05.03.18.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 18:57:44 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A . R . Silva" <gustavoars@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	linux-rdma@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	alsa-devel@alsa-project.org,
	Al Viro <viro@zeniv.linux.org.uk>,
	Andrew Gabbasov <andrew_gabbasov@mentor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Gross <agross@kernel.org>,
	Andy Lavr <andy.lavr@gmail.com>,
	Arend van Spriel <aspriel@gmail.com>,
	Baowen Zheng <baowen.zheng@corigine.com>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Bradley Grove <linuxdrivers@attotech.com>,
	brcm80211-dev-list.pdl@broadcom.com,
	Christian Brauner <brauner@kernel.org>,
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
	Liam Girdwood <lgirdwood@gmail.com>,
	linux1394-devel@lists.sourceforge.net,
	linux-afs@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-integrity@vger.kernel.org,
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
	Muchun Song <songmuchun@bytedance.com>,
	Nathan Chancellor <nathan@kernel.org>,
	netdev@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Paul Moore <paul@paul-moore.com>,
	Rich Felker <dalias@aerifal.cx>,
	Rob Herring <robh+dt@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
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
Subject: [PATCH 24/32] IB/hfi1: Use mem_to_flex_dup() for struct tid_rb_node
Date: Tue,  3 May 2022 18:44:33 -0700
Message-Id: <20220504014440.3697851-25-keescook@chromium.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220504014440.3697851-1-keescook@chromium.org>
References: <20220504014440.3697851-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2597; h=from:subject; bh=j5qqa5iL1lvOORaDlLtm9UR9x0OLEu0XOUmPN1O3Ohg=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBicdqGK+oIIr5PEnTJbsZIIE6wDFvul9czcGBuCOb4 OJUbtUyJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYnHahgAKCRCJcvTf3G3AJlPpD/ 0VwfEZeptxhwXvC03S8kaKbVzD8jf4H7HBP2WwjQ4ovXcZoeEPoHk43gm5ko9ZHxsEuhVYfSsNabEv KwzfkX+Be0SZ1mudTtAQCrxBnFPmMKxMszwt9mMNZtm6E/XnP2w7B2+1rA358f0MYJXzvFe7/kn3VU 5iBgnGpNGOZgXOG+jBcjTyiKQiMSXDSUp0cIXvVQpsePyQMfJGh/eu5bFCRNrwstStCte4Ow73c4Va IaWYSGyLDy4kuX78W5f19yAQR3uD4X1ryr/AVwZV0/P/jnJmz5EmCKU1qFe2YNVe7kF2+3nxmDxawo cvJJ0SuVsX0ZNg8KDkjZEG/9wBeWjiXSyoD0G6pP/WshlZoegMuvye4fFyhyKmatyVqt3t8c7FD223 F60swFGSkgfSg6J4GMTvGe3/d8QAl3MTq2ZH18n8DlcYgMk+3J2vMunZUU58h8auD6hXcni1nXgoMb GZApmHHYK5s4Fqge2j1uqJVBjHZOX3fK3YaZhKtoTqm6FUuJw+H1P3nVYfkcXshsd8t27NuIM2hLa9 jZnMgeaYhLQAUUWWjOKVskE6/+GP5gz4+qjVUI/Alev5kHFOWsbWXBC5JGCSrGBZtpMfJqMcYVqTxZ tS3tgiujwVPsRJdYvH3X2NotOyhjEtEFR8egS3/g8M+hET9UITd8x/6NqLnw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

As part of the work to perform bounds checking on all memcpy() uses,
replace the open-coded a deserialization of bytes out of memory into a
trailing flexible array by using a flex_array.h helper to perform the
allocation, bounds checking, and copying.

Cc: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leon@kernel.org>
Cc: linux-rdma@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/infiniband/hw/hfi1/user_exp_rcv.c | 7 ++-----
 drivers/infiniband/hw/hfi1/user_exp_rcv.h | 4 ++--
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/infiniband/hw/hfi1/user_exp_rcv.c b/drivers/infiniband/hw/hfi1/user_exp_rcv.c
index 186d30291260..f14846662ac9 100644
--- a/drivers/infiniband/hw/hfi1/user_exp_rcv.c
+++ b/drivers/infiniband/hw/hfi1/user_exp_rcv.c
@@ -683,7 +683,7 @@ static int set_rcvarray_entry(struct hfi1_filedata *fd,
 {
 	int ret;
 	struct hfi1_ctxtdata *uctxt = fd->uctxt;
-	struct tid_rb_node *node;
+	struct tid_rb_node *node = NULL;
 	struct hfi1_devdata *dd = uctxt->dd;
 	dma_addr_t phys;
 	struct page **pages = tbuf->pages + pageidx;
@@ -692,8 +692,7 @@ static int set_rcvarray_entry(struct hfi1_filedata *fd,
 	 * Allocate the node first so we can handle a potential
 	 * failure before we've programmed anything.
 	 */
-	node = kzalloc(struct_size(node, pages, npages), GFP_KERNEL);
-	if (!node)
+	if (mem_to_flex_dup(&node, pages, npages, GFP_KERNEL))
 		return -ENOMEM;
 
 	phys = dma_map_single(&dd->pcidev->dev, __va(page_to_phys(pages[0])),
@@ -707,12 +706,10 @@ static int set_rcvarray_entry(struct hfi1_filedata *fd,
 
 	node->fdata = fd;
 	node->phys = page_to_phys(pages[0]);
-	node->npages = npages;
 	node->rcventry = rcventry;
 	node->dma_addr = phys;
 	node->grp = grp;
 	node->freed = false;
-	memcpy(node->pages, pages, flex_array_size(node, pages, npages));
 
 	if (fd->use_mn) {
 		ret = mmu_interval_notifier_insert(
diff --git a/drivers/infiniband/hw/hfi1/user_exp_rcv.h b/drivers/infiniband/hw/hfi1/user_exp_rcv.h
index 8c53e416bf84..4be3446c4d25 100644
--- a/drivers/infiniband/hw/hfi1/user_exp_rcv.h
+++ b/drivers/infiniband/hw/hfi1/user_exp_rcv.h
@@ -32,8 +32,8 @@ struct tid_rb_node {
 	u32 rcventry;
 	dma_addr_t dma_addr;
 	bool freed;
-	unsigned int npages;
-	struct page *pages[];
+	DECLARE_FLEX_ARRAY_ELEMENTS_COUNT(unsigned int, npages);
+	DECLARE_FLEX_ARRAY_ELEMENTS(struct page *, pages);
 };
 
 static inline int num_user_pages(unsigned long addr,
-- 
2.32.0

