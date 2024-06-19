Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F260A158D96
	for <llvm@lists.linux.dev>; Wed, 19 Jun 2024 19:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718826183; cv=none; b=r9f5eLVEDINYV4+mbqToE9j7j3a3j4jh37e09aSfq6mGJhZSIybA1+hBeHbs+5lnB3nph6QWDdJgjhiM7rUSlQB6WzbGmnnuV99Q2EVSh9PbfelUcybipOvUIdGn3KtMcwWR4dUORfHwup1h5nySLI5RzONNgvmPXrZ8eCu2mdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718826183; c=relaxed/simple;
	bh=w6bEo4hzeOHVJnJPuko3xutI/ZQH3eACUV0/Ggy3JqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bz5EjWStwK0gG/EQ8PZWHvSGofrjILAS1UqFL3elI+9AQC4btvKpoiyzDAvhd5trCF6QpiNgNh90iYLHrCpsZJTgeRvnzoY6VHmZIoiPd1aQNvD4V1L6fNkCAHmFM1mvC7X5rzsGu9X1xLQjdhVEaFdD6Fd/z1TfHd234FJ3LLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jo04yo5I; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jo04yo5I"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a6f176c5c10so12412266b.2
        for <llvm@lists.linux.dev>; Wed, 19 Jun 2024 12:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718826180; x=1719430980; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FGRH5fHTr0h6rLCcNKkztnyBTw6+o9c4VOS4ZsV7VSU=;
        b=jo04yo5IUveqbeTo6H9NYdC8zsqXN2TWwAwqcq0ofEsQ+JZB0hDMHt51c4gISicCDa
         UiWmHhG1peczNc3GYECnDx7vFCdjHFEhPaTKtCWnS0QAtPsHXao14h6cw6lXC8WipJ3h
         2A6TnOSuvd/pzUHYCiqeQEnLmh5+GkmYaa+yHv2cqfpfKQA9JOjDd0n3ss0TUm4XP/40
         Aic8Qb+wqV9ucQt3Q+Nm1Vs9TTZpQ4d/8GJOSv82Dzn0EeY3/XP4s9yHLiUBjk6VWxAV
         SJTvfOYBysLMsfgYDxTDDQnabofrZV1cSTF8DU+6Zs4bWoxctzPIYR8XSZxjxjAL1xsW
         fgrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718826180; x=1719430980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FGRH5fHTr0h6rLCcNKkztnyBTw6+o9c4VOS4ZsV7VSU=;
        b=BA8a6WrL+JGC19MPeiysCp5whrXLVHDWRUyuSgobF320BwEpV1OL1Zs8qVMRlNXIaQ
         ErRUzEIHXohQeH5zS59SO2ib31cMhX3j8npyv4lNqH2sEF0WnPF3SDX62RhXQZ1KCD2Q
         0SXRukrwZFnsuoM6bbt1XvqP/ZidY5UJDeWJEJQRMleKll7mZ58RTAfUyfIgkY10ZLK+
         AI1emUVHiCAc/FIC4zK7Lp2aLcVImKSJGb1sUOSkqD0yFU/paR0RIczHat+ss+odT4fm
         ic8R67atZrqi2BU/giFZ1h0avoQFwjvqRdy6T12Ncx1vH94U/aB9Dmn1ZSyQt7R6na3n
         JQ8g==
X-Forwarded-Encrypted: i=1; AJvYcCWJn8D9+JaXz5HiN/qexsDGCspG/2Kepv2nuPD//glYAwujKPawan5/QqnoQzefoqTs5mjPfuN/9qPwW8tt3Dy4MFwP/g==
X-Gm-Message-State: AOJu0YxddmSEQLcSJYn9yov/dmi3u78uYsfE4UID+F7LGgsxtcM3sPn6
	h3WJ7pPi/NNUJgTt841GQzhHK2bba0whGUoCEZt9dDqJwblmjlui
X-Google-Smtp-Source: AGHT+IFfwIwY8aUbglen02/7gMx0S5ySU/sjV166DZHYCMacKsieRX+OujYltXbbqyPFCuD5AJ+O+w==
X-Received: by 2002:a17:906:13d8:b0:a6f:4dfc:5f31 with SMTP id a640c23a62f3a-a6fab7d0af8mr201161166b.73.1718826180108;
        Wed, 19 Jun 2024 12:43:00 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-103.cable.dynamic.surfer.at. [84.115.213.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56da3385sm688365766b.24.2024.06.19.12.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 12:42:59 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 19 Jun 2024 21:42:44 +0200
Subject: [PATCH v2 1/2] USB: serial: garmin_gps: annotate struct
 garmin_packet with __counted_by
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240619-garmin_gps_counted_by-v2-1-f82f10ebbf28@gmail.com>
References: <20240619-garmin_gps_counted_by-v2-0-f82f10ebbf28@gmail.com>
In-Reply-To: <20240619-garmin_gps_counted_by-v2-0-f82f10ebbf28@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718826176; l=856;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=w6bEo4hzeOHVJnJPuko3xutI/ZQH3eACUV0/Ggy3JqQ=;
 b=KCgAjoBMltppuesL5JTI8/GbbOBI3JwTGmrsYCJP321E9yYWzlqSoQ1tDb/dQFHYwd2muWiuB
 uM7gGyNDT0/A5kOYPldbIjrPvUvRLeyUpOu+tQVMjcD28EtE6/8K9hj
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Use the __counted_by compiler attribute for the data[] flexible array
member to improve the results of array bound sanitizers.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
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

-- 
2.40.1

