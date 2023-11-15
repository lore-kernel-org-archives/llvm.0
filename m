Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708E418030
	for <llvm@lists.linux.dev>; Wed, 15 Nov 2023 21:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AbWyie3k"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1cc3bb4c307so1465175ad.0
        for <llvm@lists.linux.dev>; Wed, 15 Nov 2023 13:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700083611; x=1700688411; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YPVyRrN1uRZs7Wz4idyzDBpkXVrVgQKZvwp5LF85yFM=;
        b=AbWyie3ktB7hKtTQVAL5p1w2fLB5PM6laXy4qCIn6IjUPW/S/6pO4F9CLiJqQEQACK
         qPJIYLAZFkvCJNvAWYAcOH7WzMyjL/kYVWnA59GxFgbRO2T0rKPBv9IK6DspFGEaNICS
         OsqgBT71jeopo2+5K0sUOhomeaEl1Sbei31bA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700083611; x=1700688411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPVyRrN1uRZs7Wz4idyzDBpkXVrVgQKZvwp5LF85yFM=;
        b=vYR9N1Jcxr5eenay6f16s/89udUXbf4Gwl8NWfDp+zkmi6iho/d44DvMP5lHo35/Vq
         mhk1PnjH8GDYl8O7v3Rp2cgZlATRFeLzIrYeB3/K9xQPVk8qc6ouE1rYa3vCegx3vp/l
         o8MNuuI87YC8is0QhcOWjDefA7zYYTuVzR+m0oJo5JRT77z2H5ufGLMYvt9BcQMgaGbD
         ZcqWtOKIkENiSeFjYUskv9g61Yewb380Dp42pgfoDtmk95MYW5bEDnuVPd+67BgBOZ0e
         VmV6zZMZ6PSA64mLOGTHf+NbVX87s/M8cTllZvDO7OGSGoo6X+4OVlKO9CZ4fnOuUMuX
         PGew==
X-Gm-Message-State: AOJu0YxCDXUV312WtQ0XqRArNdbA3Q/sUBqGN1sY6mZre3LOiXLlLrh4
	DG5Jz36/CJ4O2E/aUluIUDPMkcZsYnq7E7w9ndY=
X-Google-Smtp-Source: AGHT+IFRKVgCfEa6Z+5pQ2Y0fxgccYlOkaOEmT5jf2DSAM02NTazA4S/MQNc/T6ApIjdrff/U85aKA==
X-Received: by 2002:a17:902:6b03:b0:1cc:40a4:9179 with SMTP id o3-20020a1709026b0300b001cc40a49179mr5793617plk.34.1700083610553;
        Wed, 15 Nov 2023 13:26:50 -0800 (PST)
Received: from localhost ([2620:15c:9d:2:ff48:d9fc:165e:3caa])
        by smtp.gmail.com with UTF8SMTPSA id a13-20020a170902b58d00b001c61acd5bd2sm7808729pls.112.2023.11.15.13.26.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 13:26:50 -0800 (PST)
Date: Wed, 15 Nov 2023 13:26:48 -0800
From: Brian Norris <briannorris@chromium.org>
To: Su Hui <suhui@nfschina.com>
Cc: kvalo@kernel.org, nathan@kernel.org, ndesaulniers@google.com,
	trix@redhat.com, lukas@wunner.de, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mwifiex: remove some useless code
Message-ID: <ZVU3mGzR_759WYAW@google.com>
References: <20231115092328.1048103-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231115092328.1048103-1-suhui@nfschina.com>

On Wed, Nov 15, 2023 at 05:23:29PM +0800, Su Hui wrote:
> Clang static analyzer complains that value stored to 'priv' is never read.
> 'priv' is useless, so remove it to save space.
> 
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>  drivers/net/wireless/marvell/mwifiex/cmdevt.c | 8 --------
>  1 file changed, 8 deletions(-)

Acked-by: Brian Norris <briannorris@chromium.org>
