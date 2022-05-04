Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0896C20ED
	for <llvm@lists.linux.dev>; Wed,  4 May 2022 01:47:41 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id h12so142979plf.12
        for <llvm@lists.linux.dev>; Tue, 03 May 2022 18:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OUtFJC5/TKCmTq7i/wF9dXPYB7F9m5Fe+Glt57epyug=;
        b=LA1DuW2pq5PcEvMCaSGHJyuI7WWCw3brL8SvS9+2zVb7L13DgPnUJao9oTWLzzgmb0
         FDFEPcC6DrQfzS+lsrgByCwuE3V59hlwMRxN4HndNJubDx+3EuT5ltBW8juSZqsKA86J
         6Mk0HEWOn29+r/VVptC8G26Rp5mKAXoQSht84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OUtFJC5/TKCmTq7i/wF9dXPYB7F9m5Fe+Glt57epyug=;
        b=goNB9vm2k1zSQrWEi4pQqQfQCgqa+hGKz2oMKvu4nkS6PHD1YFCgLLlL+Mtt19o/q5
         JJAvUtuG2sXH3JhJi0DUBR/Vc5jQ6TXlAKrFp8YU5B1ADbRmg9DDeKTXw6qHlwHPWcTH
         sqiOXzmNdxDnsWQ27zXOktc5ZHqzPy3ZMPfzyHnDq6WgOfJ+tTYwQumCvoB5nTA8PCZH
         ZxZvHToSEfXN9YeKDzK/U4yQYZhy64mkX0g8hqcdd80iaInDWkwzAS4LS7qnfNvxi+aW
         cX6tzmexxAGp0M+i/tMKliJUnM3f+Yi9iN4t3ix3QTp2vg+YmJIQUXDSI18qXMcD9CJM
         cFfw==
X-Gm-Message-State: AOAM533PAkKsDxutSreUlZnTZy5EFJ25NIoTXsJq41oCdcpBBOCchfEs
	D8L0ymlltaik5vL3ABB+eJ8R1A==
X-Google-Smtp-Source: ABdhPJx7ujhXCzRS91FZ+LbZ03DWxWBQ0dT1Khz71PDh68k6Z8Yrj0NdP/nPQNiqOyMCkQJP+cu5vw==
X-Received: by 2002:a17:902:e811:b0:15e:b27b:92ef with SMTP id u17-20020a170902e81100b0015eb27b92efmr8546338plg.142.1651628861418;
        Tue, 03 May 2022 18:47:41 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a23-20020a62bd17000000b0050dc762817csm6895201pff.86.2022.05.03.18.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 18:47:39 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A . R . Silva" <gustavoars@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	wcn36xx@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
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
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
	devicetree@vger.kernel.org,
	Dexuan Cui <decui@microsoft.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Eli Cohen <elic@nvidia.com>,
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
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-xtensa@linux-xtensa.org,
	llvm@lists.linux.dev,
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
	Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
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
	Wei Liu <wei.liu@kernel.org>,
	xen-devel@lists.xenproject.org,
	Xiu Jianfeng <xiujianfeng@huawei.com>,
	Yang Yingliang <yangyingliang@huawei.com>
Subject: [PATCH 10/32] wcn36xx: Use mem_to_flex_dup() with struct wcn36xx_hal_ind_msg
Date: Tue,  3 May 2022 18:44:19 -0700
Message-Id: <20220504014440.3697851-11-keescook@chromium.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220504014440.3697851-1-keescook@chromium.org>
References: <20220504014440.3697851-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2631; h=from:subject; bh=Msy2+XfnfeHEfU9VZJ5tdjPuaYOOARhkHxIAzZX3hrE=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBicdqCU5cwj3opYKUJRuHiQ6yrF7a8I32dTqix7rZH epN2AJmJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYnHaggAKCRCJcvTf3G3AJlHYD/ wPCLYVdBQwlOASKzq0go8+yQ9WXYDGyw7A8O0OnAVu3fIR1Fz5Lc4pY5x32WjVh8glBxJBPELf/CJL MNaKgMdTHQ7NA2hxtEc7bQM+t4sMdVV5x1MYPoH8LFiI3+Tvt13YvoQ+E1WZ0t2qqUC8zhxbH36dxW Bc0wCumlz/0FK9T//W8qmXHq+YCTZhpOj4lIosW7Ic80QXG9vfEguHz+8nSw2PXbpXiLtiKMXYVPis NcxiHBa5qoFp2VamsSe418quush6XqJxmFvLZl7mtiboKYYYu2/qPzI5A37FAbPIGCru3jMXR/tCbm Q/hHT9bgmoM7Gg13G5tslRAOTf4pY5AWKIKHlUwbJswOg2FEBoabSKGh058NrhtgM0MjsUnbiDiOZ5 aO0FKd7cJsVfNFB7uZ3+4sBW8mA109abyB33FJQ/eJ+s21q6pPofkO9ECLZme3sqINH5kUfMBZEGbc CCwh1fPl5ZjvS1fXH/PGcDGjsAPJyMdcuEmaFNP9/8CuF7AfC9V9oEUOZ4lm0ofCSU0/fD12keSaj3 IHfhVbZKNV1ZZFfOUd6M2qngKUJR4ZbYTuwFlDxka/MvOQ2XJ1z5dhL/T/KTejeZjeDoZmMeDtRSc8 Toe4QQtXjKsYj/+iwJSz5/80d1lP2aqDJFhk1y/i4XSNcgPBCqcyBiQzMbsQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

As part of the work to perform bounds checking on all memcpy() uses,
replace the open-coded a deserialization of bytes out of memory into a
trailing flexible array by using a flex_array.h helper to perform the
allocation, bounds checking, and copying.

Cc: Loic Poulain <loic.poulain@linaro.org>
Cc: Kalle Valo <kvalo@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: wcn36xx@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/wireless/ath/wcn36xx/smd.c | 8 ++------
 drivers/net/wireless/ath/wcn36xx/smd.h | 4 ++--
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/wcn36xx/smd.c b/drivers/net/wireless/ath/wcn36xx/smd.c
index dc3805609284..106af0a2ffc4 100644
--- a/drivers/net/wireless/ath/wcn36xx/smd.c
+++ b/drivers/net/wireless/ath/wcn36xx/smd.c
@@ -3343,7 +3343,7 @@ int wcn36xx_smd_rsp_process(struct rpmsg_device *rpdev,
 	const struct wcn36xx_hal_msg_header *msg_header = buf;
 	struct ieee80211_hw *hw = priv;
 	struct wcn36xx *wcn = hw->priv;
-	struct wcn36xx_hal_ind_msg *msg_ind;
+	struct wcn36xx_hal_ind_msg *msg_ind = NULL;
 	wcn36xx_dbg_dump(WCN36XX_DBG_SMD_DUMP, "SMD <<< ", buf, len);
 
 	switch (msg_header->msg_type) {
@@ -3407,16 +3407,12 @@ int wcn36xx_smd_rsp_process(struct rpmsg_device *rpdev,
 	case WCN36XX_HAL_DELETE_STA_CONTEXT_IND:
 	case WCN36XX_HAL_PRINT_REG_INFO_IND:
 	case WCN36XX_HAL_SCAN_OFFLOAD_IND:
-		msg_ind = kmalloc(struct_size(msg_ind, msg, len), GFP_ATOMIC);
-		if (!msg_ind) {
+		if (mem_to_flex_dup(&msg_ind, buf, len, GFP_ATOMIC)) {
 			wcn36xx_err("Run out of memory while handling SMD_EVENT (%d)\n",
 				    msg_header->msg_type);
 			return -ENOMEM;
 		}
 
-		msg_ind->msg_len = len;
-		memcpy(msg_ind->msg, buf, len);
-
 		spin_lock(&wcn->hal_ind_lock);
 		list_add_tail(&msg_ind->list, &wcn->hal_ind_queue);
 		queue_work(wcn->hal_ind_wq, &wcn->hal_ind_work);
diff --git a/drivers/net/wireless/ath/wcn36xx/smd.h b/drivers/net/wireless/ath/wcn36xx/smd.h
index 3fd598ac2a27..76ecac46f36b 100644
--- a/drivers/net/wireless/ath/wcn36xx/smd.h
+++ b/drivers/net/wireless/ath/wcn36xx/smd.h
@@ -46,8 +46,8 @@ struct wcn36xx_fw_msg_status_rsp {
 
 struct wcn36xx_hal_ind_msg {
 	struct list_head list;
-	size_t msg_len;
-	u8 msg[];
+	DECLARE_FLEX_ARRAY_ELEMENTS_COUNT(size_t, msg_len);
+	DECLARE_FLEX_ARRAY_ELEMENTS(u8, msg);
 };
 
 struct wcn36xx;
-- 
2.32.0

