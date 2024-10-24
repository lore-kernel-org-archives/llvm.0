Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581DD1AF0A8
	for <llvm@lists.linux.dev>; Thu, 24 Oct 2024 08:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729757243; cv=none; b=fLwfvYI34aNSELFGbHRwEfIKHhk4f5bW3Rc7IjcLHals6k0amH4/1fVMLLcr73aWy2F+DHSZF00PZrrjAMKA3TzQMJQAqhyAFH4BRIehEjKp7l45CjYW/PGhlKFLPxFmLJ09mANiPM2J+8C7vhcMNsPX9hid/j/LyOSs/t2PT1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729757243; c=relaxed/simple;
	bh=lKJz69FkZU5PsLniCJS6Kxeee5PW8bbqpC3sMQ+Zazw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ktOqVats5NFETP02/puK6tj0zC9exy7e+pECwk2KarjRMBPeKImA5V987AlIRtx6Xn4iYp94alBuNLQCGmriBLHRrFUwQa4o9bJQYY9juostiZU0DMl+dVoJ27swEl/7EhIx+CJBJVVBFCKObxggC2RFC+mlOrMsZtgYajItvhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zSNhQMcL; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zSNhQMcL"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43159c9f617so5995085e9.2
        for <llvm@lists.linux.dev>; Thu, 24 Oct 2024 01:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729757240; x=1730362040; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EZy5UEggNFqbZ16nEcVpQryOaoa0SiPbjloEPBK8vjw=;
        b=zSNhQMcLmk0/RdkQ/2fbfT7ruj5urNNwKoHdDuouNS3jlQXmwvIu2uM/i2E8Bmlz15
         CvjrI++WgjY8Fpve0Wk0+Xfur98BvzxEI1BkdndgwjMfGs7nnEmyR8Odcg4lws5QzrxL
         piwPLrBVi05WGOdNosDAeCmkNv/e/CMiUv4LPO9VWDWFI+6AWEkSLPdlXQbNo5LGv2dW
         Zk1qc1d6pYKwfSu7ghJfHrTmtN+mMQtCXrfObtMDAEa/G5w6y7zT4eRl2pw8azCExTe/
         FczSJ1l+Ql6knfHZdhFeb7UxDPzvzdlMdvpC67R+OASWFgHZqvVrX7Ww+lHSeCs8FE3r
         WfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729757240; x=1730362040;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EZy5UEggNFqbZ16nEcVpQryOaoa0SiPbjloEPBK8vjw=;
        b=eGpIdsh7M7EPUrUisju6tzUeCWieiKVdYUmjL2VuvhkvmAb0T/LWpfUQxgNu9yRvSm
         MmqqxeCYOPdOCG7EBTDTTd1bnV9JvL7qqTl/q6jkXHfMftZZQYgZnP011RwEEu/MBNja
         sLUrVjhBdxwHS+2Ja3owmDrKMEmIGMY6RUGjwwn1Q93qkZ5haSOHv4RcEgxoAG79aLLE
         c0oEvkTGe9Z7DIXNnieFQfGd3Y9J068OwdVIDGVK2aFxEmm5c/N607MjZpGIu84a4hyC
         U4kf5p9KR8tahWSk4aT1rLm1TJ0V0U0GGKpZEZMPkYLBgUJD8+NthwxDWI6Dyf6Xv8xq
         4TNA==
X-Forwarded-Encrypted: i=1; AJvYcCXGaeICQp0i6AAwCAcoNe4vHPGDGq1KZ9WHemtrLYsGb0jCx/OuP5yF5cYdJK/5NWbzs5+k@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9wC+Z1ibiNGiOMkMt2pZiEycaqnqwhIBxdgfaimV0xEnYKnNg
	FitVeBgAybyMp/H9cayyrojmOi75+yHg82RWEtmhhSjEnorPq7iu3Fcf+VfuL4k3fuIblaqoP5L
	V
X-Google-Smtp-Source: AGHT+IHj3dTiTdI/Cfg0wXRcMpCa/DQvbUN9eHqbQfyoSZ5v/QASIQRyjUyPWiqx5em0P01hF5B1ZQ==
X-Received: by 2002:a05:600c:5011:b0:430:54a4:5b03 with SMTP id 5b1f17b1804b1-4318c6e0175mr8691295e9.6.1729757239721;
        Thu, 24 Oct 2024 01:07:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186c0e132sm38394125e9.34.2024.10.24.01.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 01:07:19 -0700 (PDT)
Date: Thu, 24 Oct 2024 11:07:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Koba Ko <kobak@nvidia.com>
Cc: Len Brown <lenb@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH] ACPI: PRM: Clean Up guid type in struct prm_handler_info
Message-ID: <3777d71b-9e19-45f4-be4e-17bf4fa7a834@stanley.mountain>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Clang 19 prints a warning when we pass &th->guid to efi_pa_va_lookup():

drivers/acpi/prmt.c:156:29: error: passing 1-byte aligned argument to
4-byte aligned parameter 1 of 'efi_pa_va_lookup' may result in an
unaligned pointer access [-Werror,-Walign-mismatch]
  156 |                         (void *)efi_pa_va_lookup(&th->guid, handler_info->handler_address);
      |                                                  ^

The problem is that efi_pa_va_lookup() takes a efi_guid_t and &th->guid
is a regular guid_t.  The difference between the two types is the
alignment.  efi_guid_t is a typedef.

	typedef guid_t efi_guid_t __aligned(__alignof__(u32));

It's possible that this a bug in Clang 19.  Even though the alignment of
&th->guid is not explicitly specified, it will still end up being aligned
at 4 or 8 bytes.

Anyway, as Ard points out, it's cleaner to change guid to efi_guid_t type
and that also makes the warning go away.

Fixes: 088984c8d54c ("ACPI: PRM: Find EFI_MEMORY_RUNTIME block for PRM handler and context")
Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
Suggested-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Tested-by: Paul E. McKenney <paulmck@kernel.org>
---
Sorry for the unfair Fixes tags since you obviously aren't to blame.  But it's
more practical if we avoid breaking the build in backports or etc.  Fixes tags
are quite often unfair in this way...

 drivers/acpi/prmt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/prmt.c b/drivers/acpi/prmt.c
index d59307a76ca3..747f83f7114d 100644
--- a/drivers/acpi/prmt.c
+++ b/drivers/acpi/prmt.c
@@ -52,7 +52,7 @@ struct prm_context_buffer {
 static LIST_HEAD(prm_module_list);
 
 struct prm_handler_info {
-	guid_t guid;
+	efi_guid_t guid;
 	efi_status_t (__efiapi *handler_addr)(u64, void *);
 	u64 static_data_buffer_addr;
 	u64 acpi_param_buffer_addr;
-- 
2.45.2

