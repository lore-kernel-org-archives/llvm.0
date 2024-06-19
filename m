Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0712180631
	for <llvm@lists.linux.dev>; Wed, 19 Jun 2024 09:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718790064; cv=none; b=M3s8u+GSyfXO3heD6W3qXZRV9H5FFTBckBlTpea44aqhDD8OfrdhuOitfYagJG62UM59DtYJeAdzsXHX5vyXuOFs7BClr48SBBlA76ZsXzHiOeq8il+5/ZtE+T5nno2BL765corNvO7AnB26iI+y71CykHVh6H9D1CRkd63dBCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718790064; c=relaxed/simple;
	bh=Qg6GuD9uT0FjYhDJqubImg2K17b3CJlSTTIQ09qnDB8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DkSDR3MAo0Ea+vaho0PpzHOc+K7Y1C3mfBWvdGkjl1cOuUtxJKs5OCI+1v2XOTazNrpZ4He9AfDyT47Yqy+e37F/v/w7+wBnNfXFqG6jbaxDRFcI9lMZRO7k+G6qp94M2JFV7rQsLTGbJ1RUDlP5G05S/xzRYgWy0iiBurSTFqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ed7W2mWk; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ed7W2mWk"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-421820fc26dso49526905e9.2
        for <llvm@lists.linux.dev>; Wed, 19 Jun 2024 02:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718790061; x=1719394861; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r22BRKQXYcHOcbW5qU6bmdOJSTmqJ20MxR35f7aK9/A=;
        b=ed7W2mWkdIjEpMGhIT1IpByuIQqH33xO6Wp8tOfl7OjwYKtuIe9QcSiTX8HAWwVUuB
         yq8LCQGkQiDYu87s3eRkC1uU3xvWPRJ6LwP1y8htMhq1zHTcIWJYWuWwSJ/4X9otNje3
         jFAG7wML8JOFl1syaXxJ82UvMSM1efiYbe47+aRiUczpIU/I9vFQQYz4Km4PvaArO7d/
         UGaDjl1hjpDo1yxlxtab/aFppCR8ai+c580jgB9A/ak4ry8H34gHdeiBteh83vzUAYhi
         XSbd1BbbWwxl4auXmAY2treChybBKdwbY7MGqu5liYVHYWMteE4h748+vyz6dbSPowk6
         56Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718790061; x=1719394861;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r22BRKQXYcHOcbW5qU6bmdOJSTmqJ20MxR35f7aK9/A=;
        b=tMd8jFSVTCddgaYp9yv8n9QU5Qy4fYPoMJiQ7ZKmEG20K8586yuDYTJtO904hKURPv
         Ohh59wyzKK2alUdQmfbiq3E8jcG1iuS7jkO3rp4oi68G33naA1n6+Mw/1XpFabR9eS9H
         +XGTnewVVwflp2EqVRNzWIcLltq7a7BwGpy7vBiqZfbgcUjJ1mFTgihaEiky991+ukjX
         sLya9HO8fF+eynz5l+psSRbjIx+xXqqlVlEoREleRJqYR+qF3ATOFUhr/yUeohXscA36
         sjprvg79rIvpwmLsdwcXSjolBn3TS3OK+ic+Blwa1yA6L8YyfGKPwaYk8xU9FCwSlKvv
         sEjA==
X-Forwarded-Encrypted: i=1; AJvYcCUiXNicLGT5g5IEt/jGvRqwLoN1Z5BCDTfDoRejjILLNYomGOnjzPomCWiCfrIITGmjgBL+NLIycIvONK4Chr0p/34/bg==
X-Gm-Message-State: AOJu0YwbWrGSUltwd5p6CtAtY1AvH++hgtIWp3puVXXs4sgUs2qXIomM
	pEttXkY92cmP2Fwi/qndwF8CPo3ovscR9AEXKVcvKChOwctl8AP6ThAGSgwD
X-Google-Smtp-Source: AGHT+IElF7dg8O3LJe50WO5VqjUMPh2cpDUpsDriBW2iVQl47dtiuAO0Ws2JcFXsP6UpV3klb5M5gg==
X-Received: by 2002:a05:600c:35c3:b0:421:7bed:5274 with SMTP id 5b1f17b1804b1-42475173ce3mr16488635e9.10.1718790061178;
        Wed, 19 Jun 2024 02:41:01 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-103.cable.dynamic.surfer.at. [84.115.213.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42306049f1asm182804075e9.22.2024.06.19.02.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 02:41:00 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 19 Jun 2024 11:40:57 +0200
Subject: [PATCH] USB: serial: garmin_gps: annotate struct garmin_packet
 with __counted_by
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240619-garmin_gps_counted_by-v1-1-d8d816f085d9@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKincmYC/x3MQQ5AMBBA0avIrDUp1QpXEWnQUbNQ0iJEeneN5
 Vv8/0JATxigzV7weFGgzSUUeQbTMjiLjEwylLysuCoaZge/ktN2D3raTneg0ePDRK1kJRvFhRS
 Q2t3jTPf/7foYP5WT9QVnAAAA
To: Johan Hovold <johan@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, llvm@lists.linux.dev, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718790059; l=1151;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=Qg6GuD9uT0FjYhDJqubImg2K17b3CJlSTTIQ09qnDB8=;
 b=AebiJqrhEZoqxVdOt6AGpsJ3S/JQfLwNfhVOY++mgZwM+D/d/7g+jZIVsIR6q94qhuAkGG7eX
 ict+JBHmecYBkDJ9r7+wq3TtL94ZE7beQOexXCgFNweWVRff/v7UqZC
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Use the __counted_by compiler attribute for the data[] flexible array member
to improve the results of array bound sanitizers.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
The size is assigned before the first reference to the flexible array
(see pkt_add()), which allows for a straightforward annotation without
further modifications.
---
 drivers/usb/serial/garmin_gps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/serial/garmin_gps.c b/drivers/usb/serial/garmin_gps.c
index 670e942fdaaa..57df6ad183ff 100644
--- a/drivers/usb/serial/garmin_gps.c
+++ b/drivers/usb/serial/garmin_gps.c
@@ -104,7 +104,7 @@ struct garmin_packet {
 	int               seq;
 	/* the real size of the data array, always > 0 */
 	int               size;
-	__u8              data[];
+	__u8              data[] __counted_by(size);
 };
 
 /* structure used to keep the current state of the driver */

---
base-commit: 0c52056d9f77508cb6d4d68d3fc91c6c08ec71af
change-id: 20240619-garmin_gps_counted_by-376545960353

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

