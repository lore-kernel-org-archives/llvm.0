Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724536108
	for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 20:53:30 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id k126-20020a253d84000000b0068bb342010dso621235yba.1
        for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 13:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=tq1rGOekL7pxfkbRlGyK3KX3p9F0Zh08RbUI+01hRUg=;
        b=GaJO4twNi//joTXJTPWxgSzYipFe8SFbxE0TwPATGPceoH0L9qw6PxWyI4VePZPq22
         e0Kx5DlnOZ7JYvnNrtLs7c/gccDFrFqH/bMNpKQLRVXJ9g6os3iC/o9t1mXE1kRQLLUz
         oRj8T3mCI5ec4vl+nnlV15HA1hZ9gk5icQj/vRm0N/S3b2WPboC0BUV+XN5EMheZxU0q
         gVfO/xXSOSmXN0EJjQ0iN+pv4vkQmGIze5WY78Zfc8JyC12/NLeWaLxmJEzzSD+jkBA/
         g23gNH82+6WH4A50GMfM2p+TTtZti14jjyClR0qHMvv+fqKmKhdUkYhPayGwHf/sblLW
         J64w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=tq1rGOekL7pxfkbRlGyK3KX3p9F0Zh08RbUI+01hRUg=;
        b=aWVBD4CtoMZlBQDf+XB2Hqh4eMGmIbw983Rjn7E1GKpzD5GsTTPZO1Cjimnbr/7hL3
         o5i3BegcXPKg+qg/LXLSzO5g+mCrqrzbDPSxOEPo8x3F3BV7esZJBJ0TqiZowtPEngIh
         NAxUqYjgcK2NrqlqPwpCYcHPAwRZBNnfRVQsQV3HFR7yF5usZ57kIcTfZdGyW234dYTw
         6BNjCZljsFaAvci2RAOKS+sT4L/goXYyvdkq2YByfz0X/yHse9niqEyc05ny0qLqt4uD
         j1bQUtPBGR6esI/1oCTbC3aKkd2Zlx84753y7F4GynkAw+Kf1vYfgbNxa/6afYLqrkYh
         GwXw==
X-Gm-Message-State: ACgBeo0u0q0WaD3eECBj/YQYuizEWXA+HswxbggtU9R0HFt13lnd7QC7
	urgqfM5vQihxthIvxS3FSelf5LPtAHdOTphBlzQ=
X-Google-Smtp-Source: AA6agR4dBFylOu7ENF0OBdRcDD8jqjP5h6mT6knhTjUUE0aN3cOZzhxPvL1PJy8o3v6+fD7gA3xIeJWHSV8Fb9bzdbU=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:0:100e:712:422b:cadb:302a:7901])
 (user=ndesaulniers job=sendgmr) by 2002:a25:e045:0:b0:695:8c84:830e with SMTP
 id x66-20020a25e045000000b006958c84830emr13699876ybg.391.1661892810159; Tue,
 30 Aug 2022 13:53:30 -0700 (PDT)
Date: Tue, 30 Aug 2022 13:53:09 -0700
In-Reply-To: <20220830205309.312864-1-ndesaulniers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220830205309.312864-1-ndesaulniers@google.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1661892789; l=2526;
 i=ndesaulniers@google.com; s=20211004; h=from:subject; bh=NiERkNadHhm2EwGjNfh56GkMuWFz22MOk8ubAMworHM=;
 b=4b7CW2eRyGqCrk6jxunZg73/YfTFIUeBxElVhLch0T+D+wwOAD/cx2kmbruA1JucDblnRonezs2R
 HQgCnOf3AdtnhlBZTKh6bVxdD5ErMKT/fpOPkr/AzBgtE5AHXXTq
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220830205309.312864-4-ndesaulniers@google.com>
Subject: [PATCH 3/3] HID: avoid runtime call to strlen
From: Nick Desaulniers <ndesaulniers@google.com>
To: Kees Cook <keescook@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	linux-input@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

While looking into a CONFIG_FORTIFY=y related bug, I noticed that
hid_allocate calls strlen() on a local C string variable. This variable
can only have literal string values. There is no benefit to having
FORTIFY have this be a checked strlen call, because these are literal
values.  By calling strlen() explicitly in the branches of a switch, the
compiler can evaluate strlen("literal value") at compile time, rather
than at runtime.

Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 drivers/hid/hid-input.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 48c1c02c69f4..9ad3cc88c26b 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -1922,12 +1922,15 @@ static struct hid_input *hidinput_allocate(struct hid_device *hid,
 		switch (application) {
 		case HID_GD_KEYBOARD:
 			suffix = "Keyboard";
+			suffix_len = strlen(suffix);
 			break;
 		case HID_GD_KEYPAD:
 			suffix = "Keypad";
+			suffix_len = strlen(suffix);
 			break;
 		case HID_GD_MOUSE:
 			suffix = "Mouse";
+			suffix_len = strlen(suffix);
 			break;
 		case HID_DG_PEN:
 			/*
@@ -1938,36 +1941,44 @@ static struct hid_input *hidinput_allocate(struct hid_device *hid,
 			 * will have to change it and the test suite will not be happy.
 			 */
 			suffix = "Stylus";
+			suffix_len = strlen(suffix);
 			break;
 		case HID_DG_STYLUS:
 			suffix = "Pen";
+			suffix_len = strlen(suffix);
 			break;
 		case HID_DG_TOUCHSCREEN:
 			suffix = "Touchscreen";
+			suffix_len = strlen(suffix);
 			break;
 		case HID_DG_TOUCHPAD:
 			suffix = "Touchpad";
+			suffix_len = strlen(suffix);
 			break;
 		case HID_GD_SYSTEM_CONTROL:
 			suffix = "System Control";
+			suffix_len = strlen(suffix);
 			break;
 		case HID_CP_CONSUMER_CONTROL:
 			suffix = "Consumer Control";
+			suffix_len = strlen(suffix);
 			break;
 		case HID_GD_WIRELESS_RADIO_CTLS:
 			suffix = "Wireless Radio Control";
+			suffix_len = strlen(suffix);
 			break;
 		case HID_GD_SYSTEM_MULTIAXIS:
 			suffix = "System Multi Axis";
+			suffix_len = strlen(suffix);
 			break;
 		default:
+			suffix_len = 0;
 			break;
 		}
 	}
 
 	if (suffix) {
 		name_len = strlen(hid->name);
-		suffix_len = strlen(suffix);
 		if ((name_len < suffix_len) ||
 		    strcmp(hid->name + name_len - suffix_len, suffix)) {
 			hidinput->name = kasprintf(GFP_KERNEL, "%s %s",
-- 
2.37.2.672.g94769d06f0-goog

