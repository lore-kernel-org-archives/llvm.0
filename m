Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E9520EC
	for <llvm@lists.linux.dev>; Wed,  4 May 2022 01:57:48 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id j6so2348pfe.13
        for <llvm@lists.linux.dev>; Tue, 03 May 2022 18:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dWvrJlxp0hfwq/rpuMGCsTJMwzo7GNCIoJATWYPCVJE=;
        b=OW0yn3aPFgkfwn8L35EyIBf488Ir3oPRdcuBBy8HPNsH5M0x5CXqSqshhOTKtpKq5L
         QF/xhc9eykoWhvFmZW6nwgo8tyY5Hha7nsaQ+7vI7aAIrUuE+pM/MYF4FAAKrs9ERjRM
         nEcriHnnehj4N7XQ40GlCVy2op0vzdnIn84H4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dWvrJlxp0hfwq/rpuMGCsTJMwzo7GNCIoJATWYPCVJE=;
        b=XizsH39CTh2KTmyZ2UcxXa2RmMzbPRObjEyQOE/QdfsSyscEh3S0G/bipLTTW3QwJz
         4MOt9sFUBfyjrCTD3yIMwp9nzkFzc55xfExqNIDndwxarrsF4l6I/KoaJ/9lsXxADp88
         zRi3+AraYj3oiOCQF9PcCXr72UszZL0Y5ELvsTpIOelVZ5p8SHN3SIsoTYUgAQ5tXpis
         wds4yomSR6p+BmbG8qmLVc5D00kcTd9qvPivXIoNgIPXYUYT/LflPSR/RouJWbrhVB6g
         GvKk4uo7DP9XfAlNq8TeubSGQ+UPAqclzKIaWBfq16q8a5HLE3OXc7A7EJppfDa3Gl6/
         kCXA==
X-Gm-Message-State: AOAM530KBYdgp1OTALWm9z7rJnT67mQ/lVzrMtFgOiNcEVjRl5NLJP04
	FjwAh7WAHJcl7EJ5QrxaG8sYtQ==
X-Google-Smtp-Source: ABdhPJwbC/L7nZs96BtZ9jeB/rQtyCDwXrBrp6VlWrbG6DOzItmYMRFYheK4g32qpwyIMeuySKD+FQ==
X-Received: by 2002:a63:2b05:0:b0:3c2:3ed1:5fa9 with SMTP id r5-20020a632b05000000b003c23ed15fa9mr8717398pgr.220.1651629467921;
        Tue, 03 May 2022 18:57:47 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x21-20020a1709027c1500b0015e8d4eb202sm6984553pll.76.2022.05.03.18.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 18:57:46 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A . R . Silva" <gustavoars@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	linux-hyperv@vger.kernel.org,
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
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
	devicetree@vger.kernel.org,
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
	Lars-Peter Clausen <lars@metafoo.de>,
	Lee Jones <lee.jones@linaro.org>,
	Leon Romanovsky <leon@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux1394-devel@lists.sourceforge.net,
	linux-afs@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-hardening@vger.kernel.org,
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
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Tadeusz Struk <tadeusz.struk@linaro.org>,
	Takashi Iwai <tiwai@suse.com>,
	Tom Rix <trix@redhat.com>,
	Udipto Goswami <quic_ugoswami@quicinc.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	wcn36xx@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	Xiu Jianfeng <xiujianfeng@huawei.com>,
	Yang Yingliang <yangyingliang@huawei.com>
Subject: [PATCH 25/32] Drivers: hv: utils: Use mem_to_flex_dup() with struct cn_msg
Date: Tue,  3 May 2022 18:44:34 -0700
Message-Id: <20220504014440.3697851-26-keescook@chromium.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220504014440.3697851-1-keescook@chromium.org>
References: <20220504014440.3697851-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2219; h=from:subject; bh=dgFYdMqTm4tBMA+d8KWXYde/YMvArhgtiTydpKgqF6s=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBicdqGpwfENVCD78xIrOKs07wFk+8+2VNIIqaIzTy/ MQg5zx6JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYnHahgAKCRCJcvTf3G3AJlkID/ 9xYgI2yUTmOqWGUHwjPg6PRpPwUj6yqPTnvHBjZmeB6GcMkb/J1qYZ0We4QMX2FKo8/RxUIZmkpsBI ghlT5pXLwU+EL9vLRAtiKFcmM6HmLrpDOA+H7c/+3yz3nLeExs5il9FvDhAWsAneG2E6lymkjrtZwB PmGHZ1SbLjt7dlHn9zzeTTcBLGvqVG+t1HbL1yM0qT9sxR33bwrS1/XY/VbQ9ZBwXv5G1ci/UQYTn+ IxWJQyTz1WY3n4gGJIy12AX3Gg0SC3bdx9m5pnqgXmSvY3uw+gAkf+Jq+ITd7t+YW8zrXaiMMGPmhC +dn4j7Pvv4hNJ6R/d9/lrj8cAs53cQUbwW3e/7yRsiZb37BKs643K8RW97bKNemjiBUk2NngqjWaOl FzxBm7iGLEjOq989XZeJNEB+MQLecqtGjX+/LxzzzpvAKeMi9bXDiSJAfPG2yxB7wzIUCmUUxW3kKq 5ITIvocBuuqbJzokzh+M+VX/4LsefOVBxhkljlxxgFvwnLhsXHSrMa9c7vd07TAikSiJ0Vi6xYDuv0 m4TiF4oEz1DuG0oiUI9BpM7VSTL+S8V/5GoKv/V+vcO7lhrDKhfS7G8kPKHplhyqNqe7RD2pCIVyOI ++T7/zqpV+vaRd4iu+z+vgmLDrCZcODKGwvjXW2ZeAEW8baladN7FbwkDLDA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

As part of the work to perform bounds checking on all memcpy() uses,
replace the open-coded a deserialization of bytes out of memory into a
trailing flexible array by using a flex_array.h helper to perform the
allocation, bounds checking, and copying.

Cc: "K. Y. Srinivasan" <kys@microsoft.com>
Cc: Haiyang Zhang <haiyangz@microsoft.com>
Cc: Stephen Hemminger <sthemmin@microsoft.com>
Cc: Wei Liu <wei.liu@kernel.org>
Cc: Dexuan Cui <decui@microsoft.com>
Cc: linux-hyperv@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/hv/hv_utils_transport.c | 7 ++-----
 include/uapi/linux/connector.h  | 4 ++--
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/hv/hv_utils_transport.c b/drivers/hv/hv_utils_transport.c
index 832885198643..43b4f8893cc0 100644
--- a/drivers/hv/hv_utils_transport.c
+++ b/drivers/hv/hv_utils_transport.c
@@ -217,20 +217,17 @@ static void hvt_cn_callback(struct cn_msg *msg, struct netlink_skb_parms *nsp)
 int hvutil_transport_send(struct hvutil_transport *hvt, void *msg, int len,
 			  void (*on_read_cb)(void))
 {
-	struct cn_msg *cn_msg;
+	struct cn_msg *cn_msg = NULL;
 	int ret = 0;
 
 	if (hvt->mode == HVUTIL_TRANSPORT_INIT ||
 	    hvt->mode == HVUTIL_TRANSPORT_DESTROY) {
 		return -EINVAL;
 	} else if (hvt->mode == HVUTIL_TRANSPORT_NETLINK) {
-		cn_msg = kzalloc(sizeof(*cn_msg) + len, GFP_ATOMIC);
-		if (!cn_msg)
+		if (mem_to_flex_dup(&cn_msg, msg, len, GFP_ATOMIC))
 			return -ENOMEM;
 		cn_msg->id.idx = hvt->cn_id.idx;
 		cn_msg->id.val = hvt->cn_id.val;
-		cn_msg->len = len;
-		memcpy(cn_msg->data, msg, len);
 		ret = cn_netlink_send(cn_msg, 0, 0, GFP_ATOMIC);
 		kfree(cn_msg);
 		/*
diff --git a/include/uapi/linux/connector.h b/include/uapi/linux/connector.h
index 3738936149a2..b85bbe753dae 100644
--- a/include/uapi/linux/connector.h
+++ b/include/uapi/linux/connector.h
@@ -73,9 +73,9 @@ struct cn_msg {
 	__u32 seq;
 	__u32 ack;
 
-	__u16 len;		/* Length of the following data */
+	__DECLARE_FLEX_ARRAY_ELEMENTS_COUNT(__u16, len);
 	__u16 flags;
-	__u8 data[0];
+	__DECLARE_FLEX_ARRAY_ELEMENTS(__u8, data);
 };
 
 #endif /* _UAPI__CONNECTOR_H */
-- 
2.32.0

