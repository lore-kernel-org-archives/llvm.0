Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B92243A87
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:50:02 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-68fdd6011f2so2020610b3a.3
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405002; x=1696009802; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r/Zplt7bJOl4CFlcfp3YYRAe0azxom+WSOFTcPCPX8Y=;
        b=d/1NzW079AV3QBwJ72IqP6Bqt1zewibCLpN4Fu2rQSc8FriW72iCE3uhoCeo2G/vlP
         D8Mm6EP0+rD8WeofGPYVv5F+95MyCT0oc+2K84M0yzLLZlBWd2WY0xewnnojzP7QKYl8
         CCMnD1Lhd6NmI7hlRUJqwZ8CoVprY29x48ODs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405002; x=1696009802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r/Zplt7bJOl4CFlcfp3YYRAe0azxom+WSOFTcPCPX8Y=;
        b=FYt92VLhfdtwZ+7ohQC9vdO7Fmm4NCj7qsPTo15b0vgWBKvqZCiEM32SypVb28zpl3
         70tWGiBTvHnz3XjICUBypLa3iOnopAKPPn6BVhfp2aZVsm9smrVwcxsCyzQyw72yzV0O
         1drMo3+XWPzHg0FI8HU9f4vi+vpjkR7tWqowi46g4hyO8UI9L2vobgVkLbt3WyyuN8rw
         +cjajp+tQnkWaCG60mk4GPbHPsKF5+NjwAGgpDGaul2MSAWdG1MZw70lgC0o2lOT+VRr
         XDvgV32qbBUAjWZ/2XN+v+JopugUNNcupnpKtMGDcu2fTAcAUd2CGchldS9M2zaQh6rs
         9Mew==
X-Gm-Message-State: AOJu0YwKszuJW7p4AuclH4b9WtAbGGxGicF9gsc3tYLkXUnOIzsvi2ya
	HvxZO2lXr6fzrMhEnSg5vKDKsw==
X-Google-Smtp-Source: AGHT+IGRer91bTYN2Rt+KzEEMh2s2tn6KVHqAwMKSj3SAFOo2KuajUauyZQXDFrsQbJ3tkXF9FmX/Q==
X-Received: by 2002:a05:6a20:9383:b0:149:44d9:bbb0 with SMTP id x3-20020a056a20938300b0014944d9bbb0mr244163pzh.43.1695405001898;
        Fri, 22 Sep 2023 10:50:01 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id e12-20020a63db0c000000b00553dcfc2179sm3420871pgg.52.2023.09.22.10.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:50:01 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Kees Cook <keescook@chromium.org>,
	Peter Rosin <peda@axentia.se>,
	linux-i2c@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] i2c: mux: demux-pinctrl: Annotate struct i2c_demux_pinctrl_priv with __counted_by
Date: Fri, 22 Sep 2023 10:49:59 -0700
Message-Id: <20230922174959.work.093-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2071; i=keescook@chromium.org;
 h=from:subject:message-id; bh=4Rvl/5wL+K6ZOeH1ROPGt2vMng9UfD2mTlgwhwq1jQY=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdPHYWMdyHq0jxtRP9ZmEsFazTpzFSBpF1GF4
 5CfsbLb84qJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3TxwAKCRCJcvTf3G3A
 Jrn0D/4ugY7BUA37RdDIydA7/mOWNmkmEKNS3VHSQIjnl9AmK7Nu6+gjsJBhg34oojB97r5nuZq
 27lhAKwwHmKEUrGCfAmRhXJLH4CDVxvZqXwd+xqrqNjpeG3yUAeoxso+/rgduvaq1YNA7WBHsc2
 IO352NHTSy+oDzHW5/KH7d3wL7NuSKO0DBZxakE4e4DiloSvDN51A7iOOg5EVSRqc0526QSZm0B
 s9FFKEqzkb9apkcltRxtfBR98w+1GMf6SUMivowvhdNdMGq6vSGxSBxPC65bfF99bKPgwY4F+t+
 1xptfzmEgCPRpCINY9ZNM3KgOkJW7H44axytK5qBWLZfi8xpxSP+WjQHmYunF/kCXmCLMQ16KHF
 GrxMceQX5DFhczV0ozC3jvTx2xZx0Y5n9ERFS1iGE2a1ouJ5enOXpb8gqGSqGl3XW38Q7D2uBf7
 cYNtly9HT5VX5NvqVkSVN6gV5+JdhROiC1Gyr2uRrLR3gnu6jDtM77OKbL1FAKBp+uu6KbvDgAd
 8jv+bUxpkifNcJ9mpuDxyYS8L2TRXL8ak+wxUGXHwRcC3mHWFBDNuy6J1qdfw7ScjxtDyjrtI1v
 3aj5010thsXGUIoUlN3u7UXb3zPa2Nxr2V3kUaEV4McZJd5mod4HSafaLrSR33EH3WR/HikPJ3r
 Vek09K+ /QRhY4pw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct i2c_demux_pinctrl_priv.
Additionally, since the element count member must be set before accessing
the annotated flexible array member, move its initialization earlier.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Peter Rosin <peda@axentia.se>
Cc: linux-i2c@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/i2c/muxes/i2c-demux-pinctrl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-demux-pinctrl.c b/drivers/i2c/muxes/i2c-demux-pinctrl.c
index a3a122fae71e..5e15d8777229 100644
--- a/drivers/i2c/muxes/i2c-demux-pinctrl.c
+++ b/drivers/i2c/muxes/i2c-demux-pinctrl.c
@@ -32,7 +32,7 @@ struct i2c_demux_pinctrl_priv {
 	const char *bus_name;
 	struct i2c_adapter cur_adap;
 	struct i2c_algorithm algo;
-	struct i2c_demux_pinctrl_chan chan[];
+	struct i2c_demux_pinctrl_chan chan[] __counted_by(num_chan);
 };
 
 static int i2c_demux_master_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
@@ -226,6 +226,8 @@ static int i2c_demux_pinctrl_probe(struct platform_device *pdev)
 	if (!priv || !props)
 		return -ENOMEM;
 
+	priv->num_chan = num_chan;
+
 	err = of_property_read_string(np, "i2c-bus-name", &priv->bus_name);
 	if (err)
 		return err;
@@ -248,8 +250,6 @@ static int i2c_demux_pinctrl_probe(struct platform_device *pdev)
 		of_changeset_init(&priv->chan[i].chgset);
 		of_changeset_update_property(&priv->chan[i].chgset, adap_np, &props[i]);
 	}
-
-	priv->num_chan = num_chan;
 	priv->dev = &pdev->dev;
 
 	platform_set_drvdata(pdev, priv);
-- 
2.34.1

