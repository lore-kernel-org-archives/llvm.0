Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E51C3FB1C
	for <llvm@lists.linux.dev>; Tue,  3 Oct 2023 23:18:43 +0000 (UTC)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-57e3c2adbf0so864959eaf.2
        for <llvm@lists.linux.dev>; Tue, 03 Oct 2023 16:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696375122; x=1696979922; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WdsHXAOoB55+JJQE0KPED0/ojG5uLpG2jYoS9vwlMXA=;
        b=KoH7SAwRmR/UXHPStWoLhkdQ78CFID59cTUBVEwXHg/biYk5hSBcnlIqdNhCf+lPcD
         DIKtKwC2+sQvJQz8rfZaQjVWdEjuCWqN+jrujuMKsOYE44o6fkZE6Lc+Ug2xhoQAXTr7
         3x3yQHhdow7uneJkpY3UsmEsDME2OxT/sai3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696375122; x=1696979922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WdsHXAOoB55+JJQE0KPED0/ojG5uLpG2jYoS9vwlMXA=;
        b=YDZec5NlAOEteUTBSNvmRAmJH0Ing8ztEuQHyWVX7bb7+bi2JZQkqVo0Bw+GJSRhMS
         BO2lwKEa7gIK/8Ud5pnqblxb/s2blSaad7rMgjo1hRUtYN2Xa25k7ZYjaBvTQoFJkDIl
         eZvk+z1jvhNGyJo4I64wPQLRTNWG0GFKlAicxwdeWf7o7d1kH/AKH9hOsFbPPunVGWIb
         w8jQAn2qthzia5K/OGMDjf1jJaXCb5GlZ2x2nzQy+iAxnMg6/9Yh/R06wxON70JMm0tB
         ScUqB2XDIwNYp+HXP6ZaYiubu6X7q/a5KBrZAJ68xCqpLxX3LOdtHkqXEvrc8hf2dmVP
         EuVQ==
X-Gm-Message-State: AOJu0YyIvvZwyO2ISS0er3GtuF9ITwLMwCY4bGPu9ultDeSmwf8H0RVj
	I8NEOoAe+QwpkOP05PozvJ1X9g==
X-Google-Smtp-Source: AGHT+IGwY7x1Jd3Xo8SdOthYWU+oTJqfkFc49D9CbuUgNubDqiQrc4IQtxbXynCMrh3eZWfVkLJL3A==
X-Received: by 2002:a05:6358:292a:b0:14d:6f1e:cfd7 with SMTP id y42-20020a056358292a00b0014d6f1ecfd7mr1094715rwb.12.1696375122373;
        Tue, 03 Oct 2023 16:18:42 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id rm10-20020a17090b3eca00b0026d214a2b33sm131393pjb.7.2023.10.03.16.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 16:18:41 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Tony Nguyen <anthony.l.nguyen@intel.com>
Cc: Kees Cook <keescook@chromium.org>,
	Shiraz Saleem <shiraz.saleem@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesse Brandeburg <jesse.brandeburg@intel.com>,
	Gurucharan G <gurucharanx.g@intel.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] i40e: Annotate struct i40e_qvlist_info with __counted_by
Date: Tue,  3 Oct 2023 16:18:38 -0700
Message-Id: <20231003231838.work.510-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1338; i=keescook@chromium.org;
 h=from:subject:message-id; bh=XJmzLNCWCq9YJs2cHWDwGPsTN/+2AuiJN1wF3YGzDV0=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlHKFOp5cWExP0FGb1XOfa88nHjK8wg6ypG15KM
 sMyDpMQtHCJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZRyhTgAKCRCJcvTf3G3A
 Jk2cD/0X92kJJBn7TO38jm2i1YhnSulInssq7vfXn13tXcHB299D7h/dNsj2MS45px/FmCwSHbL
 O8Gt4OGxRF6xt8udrKExaljjXh9erDJMgs/pvTdQZakYtRpZqizAN34S0sXXjEYaGHR74sAziqf
 LeMGpPzsQoC8RjpdiJGpClQSAjkk2ms/ZkQW8ClLsCmgRcpslZmZifY3UhW7KBKsYZMLCVRp07k
 7/dWHhYhNT0i5GSnU1eCTTjvPk8tCY7suSKbBw40JmMsZ6W34OdUhAKUUBPvCHt+RoY7olPaPvT
 cXtC8x8tjREOv/pP7lMLDdXxsD9y2qIdimDNoaVRispFjidmNbqgybVPS2ksQtpMxQ3bQR1uy4p
 ZqZ792mGi2W+YH6Hxkf2/Sh9XmFSwMwPmYfcI3z8SyqN3tJJGoZKTebTK+R9tKkgzkrJtT1FrPB
 Yz7ggeiZ1v3Vod+Y1aYyEpHvHJBpRkGKHOT1pbKihy1e14srFxJ+2u/sSx43Tha58iNTERjaIwh
 Hn44PyNLQDfiSS3P155/ty3NdovaUsvTC6pPGBqAk0OU8AUSoaha+EcIJnU4yxLsWNxt171z082
 CgdMMNgYFnZ6eBo7ETY54sYXh1/rzDPF1CqFF8sc6Fb5uN4jYQPSUdNZQGc3d3mW6vuwRMtTFcZ
 DdbEI8a HM7vhe5A==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct i40e_qvlist_info.

Cc: Tony Nguyen <anthony.l.nguyen@intel.com>
Cc: Shiraz Saleem <shiraz.saleem@intel.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Jesse Brandeburg <jesse.brandeburg@intel.com>
Cc: Gurucharan G <gurucharanx.g@intel.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Link: https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci [1]
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/net/intel/i40e_client.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/net/intel/i40e_client.h b/include/linux/net/intel/i40e_client.h
index ed42bd5f639f..0aa4411528fc 100644
--- a/include/linux/net/intel/i40e_client.h
+++ b/include/linux/net/intel/i40e_client.h
@@ -45,7 +45,7 @@ struct i40e_qv_info {
 
 struct i40e_qvlist_info {
 	u32 num_vectors;
-	struct i40e_qv_info qv_info[];
+	struct i40e_qv_info qv_info[] __counted_by(num_vectors);
 };
 
 
-- 
2.34.1

