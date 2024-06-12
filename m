Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE91E181D07
	for <llvm@lists.linux.dev>; Wed, 12 Jun 2024 17:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718211634; cv=none; b=e4SiPge65t6WNiQ5p2f976HHkLE2gN5GRe7c2Aah1ejPIV9nUEdTmxxcjiG4SW1DYA9gak53jUeApqCvHeSnzCOSEHuYgVFmaL1QK7uFvF7X0eptNfJt50MJ5wV3XFq7nAF11/KMQprAPTRTTfBrwbRdicJC+8HYV34UeHunSWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718211634; c=relaxed/simple;
	bh=0RiU+QCieclrnIr84BvXghMGrcrPqnrFcb4cZOw1/n4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Wgwqa4P7UorJQCKisBQfmF+fGkNf2YPViGkqgyKLmUyZdBzm3aL62eJ4tAZVcyDFWH31UMvtGtrU9aR9A4nViQO2JOikN9aTSMZau4+1sQNpNDZ10jrSoG8HarYfDJYvRGFGvpXWg5FaK/dfznmDFgYt+Ot6D8MMnAylCYVng/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=U0/vgjCL; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="U0/vgjCL"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3d226c5a0bcso147773b6e.1
        for <llvm@lists.linux.dev>; Wed, 12 Jun 2024 10:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1718211632; x=1718816432; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HX1VkR6HGzBOeMhfoel7DGB+ycEt/TVIYXsNONOxVDM=;
        b=U0/vgjCL94tDmn3AZJH5NBUdIg6oCaxV697wyR1xSJYyy+LbGph5pvrOna0VEkauq4
         QG4kkYI6a//0rnEJic2sxNWhwJPhNhI4vW0hy8GGZAwOgsk8yj+MJszdl89yDBBtV7oa
         yvA+49igjNyUKYFcSZEuBZRJCiLEkJNnewHkhAWYqPFB3+vkImPe5SiQKlmNshai9b3+
         sXcMAbQ93f5+zBIo9/EA7czv/7tcIs/KPrPlBv9BwZsN0um4mU7vho1qOvq0QW2Kz5UX
         G8FcD5WpZAojnDFwoDEr43WdUWAtpO1m/RgESmECwxDvamsn8717Q3YenHPB9rVfAWdG
         Ky+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718211632; x=1718816432;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HX1VkR6HGzBOeMhfoel7DGB+ycEt/TVIYXsNONOxVDM=;
        b=mMYPWHgHoqvpNmMiD9CW441EECzaeV0xLYh0Qr1KYGHLq5IgLaGHjid7k9En+EFE/b
         xW4/eGjQWXWv5LHTT/8RDQqZSf0xky7aca85ZEaslsbPKwBwx6rFgXzOmUAkqUL2WGzy
         cwtvLv1QjO64CLqxk2C3fM81iF76JgG0enEawV9HHlLejWA9mKwWlkA27w3vX03B8DFF
         gtJDL0BqGRm9G7m6FJGrR0mTbYMD9NnCU2/xEoLRHPTz2dvshxdbQRBkgLTN96uXRrKq
         ay8wnuFpsycyX9TyJ+y5CPWCl0vBSZyB5WaEZ0xqBHh37udi+5z+vSYLB7Q2Y05xVVr3
         GBDA==
X-Forwarded-Encrypted: i=1; AJvYcCWTbeAXyQNu1HU2ELYOyTNSL4W3nanr15v31eN/55wEheurclmIoe+c4tQAGa6uGxDOKIfm@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4A/EIG+6r2mBZ/Tms9VlfLflF4+k71qSpfpON2jTcUX16CJ8S
	dfsiMhKV/Oj8SKiwF5YpMYZJ6oOY0MQcXwEkm1MsqNOTOKXu2e+XypvfLlDZgho=
X-Google-Smtp-Source: AGHT+IFNFp9TcnPZQaeA8NtDjUBmrJZ05f290B/K9cvyX+mSyJGaTh5/YirVQhuU1UkR25e/+wUMnA==
X-Received: by 2002:a05:6808:1520:b0:3d2:1b8a:be6f with SMTP id 5614622812f47-3d23e1841d5mr2784962b6e.4.1718211628771;
        Wed, 12 Jun 2024 10:00:28 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d242affa88sm115841b6e.1.2024.06.12.10.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 10:00:28 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: jonathan.derrick@linux.dev, nathan@kernel.org, ndesaulniers@google.com, 
 morbo@google.com, justinstitt@google.com, Su Hui <suhui@nfschina.com>
Cc: jarkko@kernel.org, gjoyce@linux.vnet.ibm.com, 
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
In-Reply-To: <20240611073659.429582-1-suhui@nfschina.com>
References: <20240611073659.429582-1-suhui@nfschina.com>
Subject: Re: [PATCH] block: sed-opal: avoid possible wrong address
 reference in read_sed_opal_key()
Message-Id: <171821162747.49689.15711924368254843874.b4-ty@kernel.dk>
Date: Wed, 12 Jun 2024 11:00:27 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.5-dev-2aabd


On Tue, 11 Jun 2024 15:37:00 +0800, Su Hui wrote:
> Clang static checker (scan-build) warning:
> block/sed-opal.c:line 317, column 3
> Value stored to 'ret' is never read.
> 
> Fix this problem by returning the error code when keyring_search() failed.
> Otherwise, 'key' will have a wrong value when 'kerf' stores the error code.
> 
> [...]

Applied, thanks!

[1/1] block: sed-opal: avoid possible wrong address reference in read_sed_opal_key()
      commit: 9b1ebce6a1fded90d4a1c6c57dc6262dac4c4c14

Best regards,
-- 
Jens Axboe



