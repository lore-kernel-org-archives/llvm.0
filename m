Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA7019457
	for <llvm@lists.linux.dev>; Thu, 19 Oct 2023 10:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ucc7wPhg"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-313e742a787so363023f8f.1
        for <llvm@lists.linux.dev>; Thu, 19 Oct 2023 03:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697711693; x=1698316493; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gHZ0E2oURQ40dzVmSqirtuqVQjv7KJZAugs/PKtmYUc=;
        b=Ucc7wPhg7vPdbAZ6t1bp2i1K+P0KNibTnweLwvbGRSD2t5z0sY4KQixhwRnBGAzkH7
         Y9aDU+dszehcbM/53Tu/CRyL4mzw9uQY0rQBEbdusl5hsIS0XV3oefQtTbCC2X2Cil/p
         GPauxAMkTQplZ3187UqcTTDKxRFt3wyiuCxxMz04MiO4D73+f6OpQt5cGGs7YmKCqwf0
         ak9PjYYk3dwIe8F1dzID+jR610Z+A5O1dOOSTCwE2KT9L8CcTuj8Hpt1SuRyE5KaARaV
         T7wpiOpKO9S3QQEVwnhVWlrS5gf8KvT0V2vJdxnF4ZOE/gCuoGPbExA6LSsH3/xndcyx
         N6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697711693; x=1698316493;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHZ0E2oURQ40dzVmSqirtuqVQjv7KJZAugs/PKtmYUc=;
        b=D9k8+KI/NU0cdZuSuYwTkl0NX+OYdHDxtkUoCIqAjBkIzGN4zRNd701AhZpE61gVTc
         v/LigD7Mix5HORnMPCxe15Dsv6S/qU4DEffSIP8Q9GNP/Wi+ZLR0fGLHVgg0w3sNcqa5
         zaZDENwlX3WmMJ8Y+DHzc67zE+nAxxBf7VAITpxxMqEAyUn7y3bDoU/nsK1YPplr4HQi
         rFShL9O1pIBw57KZNiVCSkyIdnjEJFQDXduUkYHNdBmrSsNhXFQGtf4XqziElfgiQjZ5
         ojE6AykIUIOE5uCo3ae7qceMiF6/Z033+HAPsB+b1uID8dNGBj7Tx1mEeT+oWE8sY3B/
         UuYQ==
X-Gm-Message-State: AOJu0YyBi5U5x6Ef9dHMaCQrXaTanMAg0RGpWbMEFncLKCLq3speH30Z
	yJGFmYIvoNu5Fb9swPOZKEyMcA==
X-Google-Smtp-Source: AGHT+IFdar0VVDaMOSgRpl4MSClkYLbAVPKlMoGU4cE/swmAe891KuxkdeV5d/6VMA1irMhQ27GKxQ==
X-Received: by 2002:adf:eb87:0:b0:32d:dd68:e83 with SMTP id t7-20020adfeb87000000b0032ddd680e83mr1075240wrn.21.1697711693227;
        Thu, 19 Oct 2023 03:34:53 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q9-20020a05600000c900b0032d8eecf901sm4175868wrx.3.2023.10.19.03.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 03:34:52 -0700 (PDT)
Date: Thu, 19 Oct 2023 13:34:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Su Hui <suhui@nfschina.com>
Cc: woojung.huh@microchip.com, UNGLinuxDriver@microchip.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, nathan@kernel.org, ndesaulniers@google.com,
	trix@redhat.com, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] net: lan78xx: add an error code check in
 lan78xx_write_raw_eeprom
Message-ID: <aa78dff4-d572-4abc-9f86-3c01f887faf1@kadam.mountain>
References: <20231019084022.1528885-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019084022.1528885-1-suhui@nfschina.com>

On Thu, Oct 19, 2023 at 04:40:23PM +0800, Su Hui wrote:
> check the value of 'ret' after call 'lan78xx_read_reg'.
> 
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
> 
> Clang complains that value stored to 'ret' is never read.
> Maybe this place miss an error code check, I'm not sure 
> about this.

There are a bunch more "ret = " assignments which aren't used in this
function.

regards,
dan carpenter

