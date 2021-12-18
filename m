Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37AD168
	for <llvm@lists.linux.dev>; Sat, 18 Dec 2021 15:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639841238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=86SiuzQkzNAn+schu4EkUzziC+m9VbK+PfQYtTZrNxs=;
	b=HHMSTEQkMwVbEoHKpzcKhgqqjCkXuNF0/Tb3ijuKYRAXjT+dHa+sk85Y7RndEPBKWewXeN
	V2Z6use9ls65mFzVZ/qwKrMS/h0y29M2+E84+rA96Pz1Psw+b46uUJ3MZ4/1toF9bs+7h7
	gaAqVsW7sowLcP7o9feANEphqqXxJ8M=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-jaF0ICHrOgaSiTksPNIuLA-1; Sat, 18 Dec 2021 10:27:17 -0500
X-MC-Unique: jaF0ICHrOgaSiTksPNIuLA-1
Received: by mail-oi1-f198.google.com with SMTP id k124-20020acaba82000000b002a7401b177cso3282490oif.8
        for <llvm@lists.linux.dev>; Sat, 18 Dec 2021 07:27:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=86SiuzQkzNAn+schu4EkUzziC+m9VbK+PfQYtTZrNxs=;
        b=VcuEHnmzxAac3BJ/KGP+J4ogspph1aJ/JvwQj2nMvz4oPmV3r+9+oaWp/40QyJTrb5
         NBr+6bDLxEIY8s+dTCgtHBTOr8Vf0o6Ine2K8LeG04KNVw1/Bwg8Fc8pBFt296VJmGWl
         mxqPepO9bTVMdspL77jQ79xkEZ6Qk25Vw3ae0cde8VVRvdBonPGB658QWDx8RO4UDCJZ
         FAHLmY99MRwrGnQ9rQo30CydMMv+FWwtVNJbLdc8HkZB8huLdozbTlN2FoUJbAhtGXqD
         mmt+KN0X8+63DM5/Z646oJNBnCYK6cQfn+BArmFH2vjcPTxQfbFIq2DqTj8NjiaxUBXw
         /lMA==
X-Gm-Message-State: AOAM5334g6KsnIi3MD5dMTUn9r9ksdSYWO66EA/AW46tQ9GcUbCdDbEZ
	l1x2fR+VWZsbTfLGeNDFhGgeffioN0g3Q5wl6s2tTG0wr3rZmySCBv4khTvaWlG1OrKh/E22RtY
	RmdDFC+MItfRlWQ==
X-Received: by 2002:a05:6830:1258:: with SMTP id s24mr5798786otp.226.1639841236962;
        Sat, 18 Dec 2021 07:27:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQXs8/YlLAB/Dah8N/DouTHOvgWlTfYorr/QdF2xSDDW13RsfjVj/NVWwFUZ/bdOydpAXgVQ==
X-Received: by 2002:a05:6830:1258:: with SMTP id s24mr5798767otp.226.1639841236770;
        Sat, 18 Dec 2021 07:27:16 -0800 (PST)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id z12sm2161206oor.45.2021.12.18.07.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Dec 2021 07:27:16 -0800 (PST)
From: trix@redhat.com
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] gpio: sim: fix uninitialized ret variable
Date: Sat, 18 Dec 2021 07:27:12 -0800
Message-Id: <20211218152712.2832502-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Tom Rix <trix@redhat.com>

Building with clang returns this error:

gpio-sim.c:889:7: error: variable 'ret' is uninitialized
  when used here

ret should be the status of the call to
gpio_sim_make_bank_swnode stored in bank->swnode.

Fixes: 83960fcf4818 ("gpio: sim: new testing module")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpio/gpio-sim.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
index ef6145f51c8ae..bef00dcc4dc8f 100644
--- a/drivers/gpio/gpio-sim.c
+++ b/drivers/gpio/gpio-sim.c
@@ -886,7 +886,8 @@ static int gpio_sim_device_activate_unlocked(struct gpio_sim_device *dev)
 
 	list_for_each_entry(bank, &dev->bank_list, siblings) {
 		bank->swnode = gpio_sim_make_bank_swnode(bank, swnode);
-		if (ret) {
+		if (IS_ERR(bank->swnode)) {
+			ret = PTR_ERR(bank->swnode);
 			gpio_sim_remove_swnode_recursive(swnode);
 			return ret;
 		}
-- 
2.26.3

