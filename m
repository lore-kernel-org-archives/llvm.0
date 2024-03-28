Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C08E139599
	for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 20:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711657767; cv=none; b=XbZfYATO5Kczu/MaczxStF5aG6ovErM7NTH+acsIAkRfnO7i6QdsNTgupSrUL3GGK7g6wvFmEPrzATTpOcx+6pNtWsn0YGZRv/RwxJrT4KMmvXVPDfVvxF2VMSLAm4G9Mj/3YOCke4OsF2Tk32u8KTsTm/6W6Rd8sdUsnvjvwM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711657767; c=relaxed/simple;
	bh=GUHoYh41apx2c6dWTybZgJgEWn4tU++cGOSJbHHvfBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TsoQ8oiC3WdL8mKoQZCv2Qo2lCp5ZgFxv1LyD0cQxycXX2RXZPKwWjcIt5cyjjUD2rvXpQY5z7jnfnkUsMrGszmsuAtejRclQSjkTmVlHSbR1g5LVzePFThiYF0QPGevHc7XipxZGgW2h589KHFfT3f6lFvQ0dCvu5hSnCJFiZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CWQrneZW; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CWQrneZW"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1de0f92e649so10736725ad.0
        for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 13:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711657765; x=1712262565; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9GhNQzSHHc86tRAgn705m3Syl4j6IAhYWdkgbrH4eA8=;
        b=CWQrneZWfgOeV1P6Rv8Q5zrJXLcHeAlHvhI5KhQNBbMH9qcAQRHyM3kPgN59MTLN7N
         J8RpNS8rYtB8H0yCPnIjjlraFKp9iRT9zrbZbEz9SuwZCsqJ66dOAzLlJ11AH9BnrDPK
         PNl5fKWSUHMqD+cpR8UnoOGo74xlQPKvZFzy9gxQnv3UJcEgK+Tz+tVEMHB+XRgnFlfi
         kxssKp2vZ3A9Z5NF7vEwkVx2hHIXbkdrm0PzTsiaUCK06X4qC9cnhE7Tu629fKuGjKy1
         6LUMPMRYgEL2LEGPyY6mSmF/QK4NLBNXq/RqpcxbwO/k+ds0ct0C0QfE4zmHbEulWNS3
         9UMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711657765; x=1712262565;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9GhNQzSHHc86tRAgn705m3Syl4j6IAhYWdkgbrH4eA8=;
        b=Q2O9vGoCKCT71/WGwjd1IJq6lxgv7RzLHbACXgkT+xaKuVYkk35AixotKR/UbfG8u3
         qBiliBiqXJxiwYRTExP4sqcKLdkRXgT8CHr6ZZK6z9xqHBoMkLR1ytKgUJ2TjRwbrAYu
         rTYDSu33rTmzB0FIYd4Fqxq2RzZ1RA9RGqZi7VRfnP8OLnAhYFpF4dE6b+DLrVR04y9d
         a6ByGdI40X/Pbyeq5ZxOcdefABY/UD9nEgMKyKZvW9HKWwC/T/dPX//+HNP2YVp6CNM8
         o8Ha0pYWMo/TRlUM2CxDmJiWAJ3OLObf3lBb7HqtP997g+YoQpaE0nshRzURzA43PDNg
         qvkw==
X-Gm-Message-State: AOJu0Yz3BpoB7W+HrA6slO3Z/SO2pAQGB4K55+BbEB5C+vQA4uHo+n5X
	D22o68Z2nkSTEtCrbYQr2Tb87xlv1l7UMtuab7adoR8xgrEHFfDW
X-Google-Smtp-Source: AGHT+IFimJcn5l+m2AOuz40t+4uD8F9bzZLa0naXbrZzUKaihGqgPB0DWFwfG02SitApE30c+n5WGQ==
X-Received: by 2002:a17:902:f68a:b0:1e0:f4ce:f1c0 with SMTP id l10-20020a170902f68a00b001e0f4cef1c0mr708040plg.2.1711657765541;
        Thu, 28 Mar 2024 13:29:25 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:493e:82a3:49f9:d88])
        by smtp.gmail.com with ESMTPSA id l18-20020a170903245200b001e09322cd01sm2058971pls.45.2024.03.28.13.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 13:29:25 -0700 (PDT)
Date: Thu, 28 Mar 2024 13:29:22 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	ye xingchen <ye.xingchen@zte.com.cn>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/9] Input: IMS: fix printf string overflow
Message-ID: <ZgXTIiCvvj-eu6p-@google.com>
References: <20240326223825.4084412-1-arnd@kernel.org>
 <20240326223825.4084412-7-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240326223825.4084412-7-arnd@kernel.org>

On Tue, Mar 26, 2024 at 11:38:05PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang warns about a string overflow in this driver
> 
> drivers/input/misc/ims-pcu.c:1802:2: error: 'snprintf' will always be truncated; specified size is 10, but format string expands to at least 12 [-Werror,-Wformat-truncation]
> drivers/input/misc/ims-pcu.c:1814:2: error: 'snprintf' will always be truncated; specified size is 10, but format string expands to at least 12 [-Werror,-Wformat-truncation]
> 
> Make the buffer a little longer to ensure it always fits.
> 
> Fixes: 628329d52474 ("Input: add IMS Passenger Control Unit driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied, thank you.

-- 
Dmitry
