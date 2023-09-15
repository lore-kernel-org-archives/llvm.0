Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EBF1B274
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 19:59:41 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1c4194f7635so14168595ad.0
        for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 12:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694807981; x=1695412781; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/QTAaYbGChQLUY+Gq2za7n5ZQvKf3nOru5ieThOaDQg=;
        b=PEC/P41lIsIYYPUc3YJ3BfPtiZKVjNy7ON2eCQt9OLfaA3ttd5LfXPxn7lpQV+AqXL
         MJRcTnQqCYpUE4u2RMNNwo1456UELCtYtmhfPawWdBaiazkl3LPOJJC5P9MqAD03pB0L
         Vja+NeExtEb6lmOdjreMxyAbTKDDVZVexw3QY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694807981; x=1695412781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/QTAaYbGChQLUY+Gq2za7n5ZQvKf3nOru5ieThOaDQg=;
        b=BhjLfyZtyHAvz3RpTOXD2by9+yIBvXM6Aw53GlpucBQ/iDXuJDvq4Fv25706E9t2c0
         5/HQHYYnNstKVKHCFphNJB4HCHyF1hCdfQZm3rRBgDP05o/xFvVghK02llbcnTaCbahw
         tf9FzMVe4I39tjNBa1J1/ZwIntQgppmE0PbEzezhP9wsxS4hFPN0U9C0FJGQtd+rriB/
         Atu3+uJaRsqJ3077Q48n/3TtL4marNXgDvMGVHeyiZA+x9z63e9K2vULKJJOYzCBpwR/
         7xxHOf3VXQGlIptTp/HOuTtjJFgT6WThM5HeVTaQT2fODuQPkegyeyyNS9YBYzDrKDNw
         xyKw==
X-Gm-Message-State: AOJu0YwBFqQbi3vtBldH4TZzv/tLMGy7gjcXkfECKTM6rOHeyLEAGYhi
	33TmUpV2ts8MgoQUIrP0LJNWXw==
X-Google-Smtp-Source: AGHT+IGYK7Py8XcBgcsBTxZTMvjHQKfVzB5OmfXsKXYmjNSdHYAcwM38OH4ue55Hb1gXlpvUJ8KkHA==
X-Received: by 2002:a17:902:684d:b0:1bc:224a:45c2 with SMTP id f13-20020a170902684d00b001bc224a45c2mr6041713pln.15.1694807981241;
        Fri, 15 Sep 2023 12:59:41 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902a40400b001c407fac227sm3855508plq.41.2023.09.15.12.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 12:59:40 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>,
	John Keeping <john@keeping.me.uk>,
	Peter Chen <peter.chen@nxp.com>,
	Hulk Robot <hulkci@huawei.com>,
	Allen Pais <allen.lkml@gmail.com>,
	Will McVicker <willmcvicker@google.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Zhang Qilong <zhangqilong3@huawei.com>,
	linux-usb@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Linyu Yuan <quic_linyyuan@quicinc.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] usb: gadget: f_midi: Annotate struct f_midi with __counted_by
Date: Fri, 15 Sep 2023 12:59:39 -0700
Message-Id: <20230915195938.never.611-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2208; i=keescook@chromium.org;
 h=from:subject:message-id; bh=7ll080Ip8+xgpFyr1ptkCSq6rEkEIYaf1ZtwJzLxEFA=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlBLeqiItMEXLkRQ6I0AgJamBwTNeEi20eegnZt
 l84WwSJaiuJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQS3qgAKCRCJcvTf3G3A
 Jt0FD/4xkc6NwN+7lXbDMSm4p836lNJxBBL+/SGvtbx8Eh9D5gW27FBIx1e3Y+W0R7/CiQnJdvC
 Q0numJF5+tgUVzR5ef5AIRZRrSuQC1OovDPs0lOar9jswym6HioJEY29phkpX8u8B/dQJiazIP4
 OgoHGhaj8mVg/fbTbFi0RfyeScciuvBKdwKTrcL+u2O9Tjbaquwjg0L4J2t+Ka0fFW0yDuzyI4M
 WtPAW1i5V9KEz0XTxGtMfAb966wgcc1cOszoqiNMSb4qro2RjomQLIBffiFL2UVCAHhDvlI0aRU
 RrduhXmOJx0e+KPtPV9mgpJPinw8+MTo55974325aOLst/tii0/RrCvsEnedJK2bqy7COveWb00
 VjG2aP6iHIx2TJ1slgBO+TecF1NeAe9eCOz/s/TkFOSaYfmUVVs3ZJ/5tmjoYzHXQfifjId8O8k
 uxMMrDXmPYIBDXNP8sHd4zMHzHvRdAiL3T7Fh8kI7mPFYdfobFOfVqNA0hYZVf8TxBRv/egZR7t
 k+NrSD3agAofKIDkcP9tEe/EqkDU0PgsMMCOEXysbZlXE87+k/nwnpGzH6hQr55vHTCKUL9L8SE
 zBX5jFgLgc7kB2SpvHWvj9WL1+Kg1t7LcDQvmyAeh4rZkXnSkvDtNhlJUP5LZPS/Bcm29gzBplo
 V2HLJoI /9JPsM2g==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct f_midi.
Additionally, since the element count member must be set before accessing
the annotated flexible array member, move its initialization earlier.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: John Keeping <john@keeping.me.uk>
Cc: Peter Chen <peter.chen@nxp.com>
Cc: Hulk Robot <hulkci@huawei.com>
Cc: Allen Pais <allen.lkml@gmail.com>
Cc: Will McVicker <willmcvicker@google.com>
Cc: Davidlohr Bueso <dave@stgolabs.net>
Cc: Zhang Qilong <zhangqilong3@huawei.com>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/usb/gadget/function/f_midi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_midi.c b/drivers/usb/gadget/function/f_midi.c
index 2d02f25f9597..033e347554db 100644
--- a/drivers/usb/gadget/function/f_midi.c
+++ b/drivers/usb/gadget/function/f_midi.c
@@ -99,7 +99,7 @@ struct f_midi {
 	unsigned int in_last_port;
 	unsigned char free_ref;
 
-	struct gmidi_in_port	in_ports_array[/* in_ports */];
+	struct gmidi_in_port	in_ports_array[] __counted_by(in_ports);
 };
 
 static inline struct f_midi *func_to_midi(struct usb_function *f)
@@ -1349,6 +1349,7 @@ static struct usb_function *f_midi_alloc(struct usb_function_instance *fi)
 		status = -ENOMEM;
 		goto setup_fail;
 	}
+	midi->in_ports = opts->in_ports;
 
 	for (i = 0; i < opts->in_ports; i++)
 		midi->in_ports_array[i].cable = i;
@@ -1359,7 +1360,6 @@ static struct usb_function *f_midi_alloc(struct usb_function_instance *fi)
 		status = -ENOMEM;
 		goto midi_free;
 	}
-	midi->in_ports = opts->in_ports;
 	midi->out_ports = opts->out_ports;
 	midi->index = opts->index;
 	midi->buflen = opts->buflen;
-- 
2.34.1

