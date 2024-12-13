Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4991E501C
	for <llvm@lists.linux.dev>; Fri, 13 Dec 2024 23:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734132961; cv=none; b=iAESwjLJv76nuyUKuehcoWQkHssUS1NtqQHEGTX3ZRfnaatyJqAUOs54cV0pyDu8JpgfRErKr08HEt/e5A+kET51cc+Wwv1lk9Q8e+xcDKHqaq2/CM6hv5bthMbwJrd509Ddr39IBmVESblbUMDCiYI7XGYP83NF/LkRinw++u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734132961; c=relaxed/simple;
	bh=At4yxUXPC5gCISpGbj4Jh8y2nbyqYWKzXfcEq34ABtI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V3DPjSxbrwLejSh1fG0oqfnWQ/6qisvpqAcwsWbj5LAdxDkgXVis22FZBhi+ALvAUQ1En7Q8tkeqv6UFIDf4FoP5iB6YAp3mRaHXMO00oH95ec4ovff/iRIJ3FJuoHBJZHiV9DEdbfyAg6NQENEYYXAob9CmwhrxzYfzN2uQ4Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AitfKkkS; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AitfKkkS"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-728e1799d95so2767771b3a.2
        for <llvm@lists.linux.dev>; Fri, 13 Dec 2024 15:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734132958; x=1734737758; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6aNEDHH4018fnzzsqut871HqEVIOaY/MIH7LrGllh5I=;
        b=AitfKkkSbJ43t8gd0igm3LR9kJp35XkhfZD3AiBqfld+ohmk0VKAkC48LCvsyrtQL4
         LJ4aklfdMH212nZ298wbDYeqUX5Fi5gOCHbrXlRg2z3bB7AQoGo7h9YA6b4LzwAaC147
         iD7VlnKgcOdgRCGKPj5Vshc2bVLACWRW3v2Lk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734132958; x=1734737758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6aNEDHH4018fnzzsqut871HqEVIOaY/MIH7LrGllh5I=;
        b=cJUGWFJMsEed4LeiIzlKfTeSnT6M2MMKXnYAtuJf//2412xR7xWMs+s4RqSrHvUKqn
         Jz9Hz5d0C5FDvC1JgQz3Ci1zHXXBsmmdI3w0tAlELLXlVJ6pZqZMFD/iiubNGpIbUMhp
         lqQgde37pqKxfJ3bW9/Lt86ZHJKBaW2wQmn0apTu9zDon4E69yl2deGQHdKYz0bI7O7K
         lkNVCX+8Q8Y8MwkvH+GumfaXkAzRkKuSQf3KrU2mUgd1tcIL18QbeU2dyqmvjyY1Mym2
         5pbpvZI3uFJ3fg9wJqDeYH0mA1Bunuvm8y5bEFH1l/37AGBjDzP4keYTUmHoomi2hNvF
         xdhg==
X-Forwarded-Encrypted: i=1; AJvYcCUUgWFOvif8pvC0joR+b2Vk44OvN0ITxITDhl8l1QeEepnXQ0BNwqpJRhyqQ2CMhnCbVBYi@lists.linux.dev
X-Gm-Message-State: AOJu0Yxhbo2zRytM9JDCH3F4oTDv0kfffWNoj55G5zcqX1uxhjoO2sto
	XFCBEbZQuxLDlCaKgFibCcpJDX/3Ktpi3oBYF0KhYQKJifJVnL/ss9XP/QTYjg==
X-Gm-Gg: ASbGncuoYathwtzeKow98lnO00PSwTdaUTo5d4exW7ADNPCw5yxE5lXB/wTiYfvbyKC
	JnJ7OAKYf44Tms/LRQ6c9c1aq74wZv7EiMpiOS+Y/0d4kduOfPGDQoD/iIT9tlTOYCsr2aTM2m/
	0gVZZ31jsva1YF6JaAKTmVf52wYyRSbxmNJTC2KTvQO/LVoksYsHEbv34m4Q8uqcnzeWVwsd1Sl
	3Cb4if39/tpSVuj8f/HY5yTQzdip+uJLDEBDziqXC1eqsd5Brdwlkw+SFm2Fkk2z4fUnKJ0p+cz
	0MfIfH6EfFNgY4ZJcf/W7NQV9fl9Puk=
X-Google-Smtp-Source: AGHT+IGuN3bapepIPxR4xf+sjr97DT0siePvsa4ASfkZeWVposaJaxMdiFV3aR4FrmX3VtJTvm6U/w==
X-Received: by 2002:a05:6a00:f8a:b0:724:f10b:e663 with SMTP id d2e1a72fcca58-7290be74313mr6956527b3a.0.1734132958609;
        Fri, 13 Dec 2024 15:35:58 -0800 (PST)
Received: from localhost (227.180.227.35.bc.googleusercontent.com. [35.227.180.227])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-72918bad896sm336267b3a.143.2024.12.13.15.35.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 15:35:58 -0800 (PST)
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To: heikki.krogerus@linux.intel.com,
	tzungbi@kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: akuchynski@google.com,
	sboyd@kernel.org,
	pmalani@chromium.org,
	badhri@google.com,
	rdbabiera@google.com,
	dmitry.baryshkov@linaro.org,
	jthies@google.com,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Bill Wendling <morbo@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v5 4/8] usb: typec: Print err when displayport fails to enter
Date: Fri, 13 Dec 2024 15:35:45 -0800
Message-ID: <20241213153543.v5.4.I6cff9d767b0f8ab6458d8940941e42c920902d49@changeid>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20241213233552.451927-1-abhishekpandit@chromium.org>
References: <20241213233552.451927-1-abhishekpandit@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Print the error reason for typec_altmode_enter so users can understand
why displayport failed to enter.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---

Changes in v5:
- Put dev_err on single line.
- Slip clang-format a washington to look the other way.

 drivers/usb/typec/altmodes/displayport.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 3245e03d59e6..ac84a6d64c2f 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -252,7 +252,7 @@ static void dp_altmode_work(struct work_struct *work)
 	case DP_STATE_ENTER:
 		ret = typec_altmode_enter(dp->alt, NULL);
 		if (ret && ret != -EBUSY)
-			dev_err(&dp->alt->dev, "failed to enter mode\n");
+			dev_err(&dp->alt->dev, "failed to enter mode: %d\n", ret);
 		break;
 	case DP_STATE_ENTER_PRIME:
 		ret = typec_cable_altmode_enter(dp->alt, TYPEC_PLUG_SOP_P, NULL);
-- 
2.47.1.613.gc27f4b7a9f-goog

