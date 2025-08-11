Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B001207A0C
	for <llvm@lists.linux.dev>; Mon, 11 Aug 2025 07:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754896727; cv=none; b=fr2ZlTG/aHuREVaysQuY7QdRTnTSgl6niu9BWgYXzj1Ukl6D/x9B22cGTFGrNPLFcvCSBnzth3S2zCDBnRL9gAkw7Kprap3UeQ1QjXJsABp1qkS4XMcc+8X0hd6I6ph12+bFQKuj27+RSgxOMsJVKizBJuoxBam1WluRekC5jw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754896727; c=relaxed/simple;
	bh=ggjySQY5Vol6DrnOGZD8iVo/inq6Op1ME+IJmKvjb+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W7K74AoaGZoblwCOdyohpPTAv2pM33XgaSavbO3P652A3xUEGnqJw/z1M597SJW/2Y37shRIWAnf2ochxg5wROEtfhv++RuAOKLdlk4eu/NxxXOemDHcd9YMEKBxZPFzzkJvUrbFqFh3admyseMYlexCvM6/Zsg7v6HdKK7G18A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ubm69Mpc; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ubm69Mpc"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-458bece40fcso20081105e9.3
        for <llvm@lists.linux.dev>; Mon, 11 Aug 2025 00:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754896724; x=1755501524; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RpUUZlyBw5CZbLmUvdnvRJjVMUKN0ib47e2Swl1lxkY=;
        b=Ubm69MpceFRGtHYO/hDiv85UH7YxeOfWRimsaGIQFpFU/GSSfJUEur7GATjn91vLll
         wepdd+HQkIx2p6AQbAGgQz2yJnHRFfZfAmyb5IkDcSxHNoW71zkhBAbXhyp0Frb2IQrj
         uTLl6LfBjpi2onsuArX+HvKAKztxwNoKH1w+Dj0blLbS3qzVuVbEClazdAE1KgKk2oSt
         /EfuZSE+9UfkZ3TAyf3EJx2mgNKSAOcHg/SX3uzIjtGRhCMoj6CA1raICnlPTOPpi497
         mfJwLcTYFiwI4wC6KCy4b4IkjazHTn3q247LeyXCGYJ60k5KK0hTQZ8Cv6dTTHgsWbnX
         MO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754896724; x=1755501524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RpUUZlyBw5CZbLmUvdnvRJjVMUKN0ib47e2Swl1lxkY=;
        b=SXFWm2c1rDqRk4seOHbe19PkASVxraDOWS8kI2AW2GFggItUkU8W3VH0LiaZXKrhK4
         8YDN0E+hywWyuR1/4Z1MqfpYoy8OIgjDVn/DZkvFIaER/K4pg4PyKLsHf9N2T4Og0+pR
         72fMphQXrSd0V6z11fcjUIbnQCyy9+vkfHpRikxH2ghLvpUOkc621+uX8v8uuUcWssH3
         lNWkHM313pRcQ+RJ0FnDwA3ica07kkL0pVzuN53lJBsSBIuNm8ERdmFUj6e0FekQlz1T
         lGYi41ivBLfUoOmroensSU+IZyFwunjiLfjBM34Z5B4UhLaVRtdn94bzPDgW54CSNPPa
         5UjA==
X-Forwarded-Encrypted: i=1; AJvYcCUwMZH/h+YANnPHsU4scG8sVI+hAqOqgEti6g+oZmZMAoxKmc0mscWdgcG74q/WPtMZ5/Fg@lists.linux.dev
X-Gm-Message-State: AOJu0YwGYn93Okr3XkF6sWGid5fMwCLrEJBtw6w6AlE/2AP89t6CF0gx
	MbL/ZO3LFV4HTvgEvhy4Bu/Vl1VAWw5qfQu3bvUrsiDDjzNo6gJOMee+mlE7gTs+/wc=
X-Gm-Gg: ASbGncsiclnc90E65D+y39mRqPiAy2KvQyQzPAQhpGsNJBSlISFaFBEXHfh1y+Z3xSm
	4RmtkGOnhUjRbNfyRaxC10ahQrlTJGwX+o9jh2SsoSFQGViPfV4JjocGI8G6i2OpXbjDjFX2Yms
	PxzktotzM6PV9uNmaaf2OS8jULmo9a8/6tignWGRgnvMW239XUT2woq5joRO4OE8mpeXKJC35V3
	eDwdRz2KggpEv3ZlVglLgvm0lCsZgTOp2mVleynGDxj49WhGBEJMnsyTO3TqvggoHThI4+WYJfS
	98Ua1d9Xg3kiTsH4k77Npzt9wk1bo92vHv2WloDHpdFxpzbgptCVW3eee6aAe0hhBKPYL5vmWj3
	c4nUiLP4Oso9bkgkMRvf4ZUFZlsw=
X-Google-Smtp-Source: AGHT+IHM1bJt/BxDNFMob+UudNS2IHypTA0r8GLa214hR+v10zUWeCkb+vfD2av0PJ9nHp20erEWjg==
X-Received: by 2002:a05:6000:2c03:b0:3b8:d7fe:314d with SMTP id ffacd0b85a97d-3b900b4d813mr8056322f8f.36.1754896724211;
        Mon, 11 Aug 2025 00:18:44 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-458af917d20sm235005985e9.2.2025.08.11.00.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 00:18:43 -0700 (PDT)
Date: Mon, 11 Aug 2025 10:18:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Haoyang LIU <tttturtleruss@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	hust-os-kernel-patches@googlegroups.com,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] scripts/checktransupdate.py: add support for scanning
 directory
Message-ID: <aJmZUJeKJ6hd_pmx@stanley.mountain>
References: <20250810161730.6530-1-tttturtleruss@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250810161730.6530-1-tttturtleruss@gmail.com>

On Mon, Aug 11, 2025 at 12:17:30AM +0800, Haoyang LIU wrote:
>  
>  import os
> @@ -131,7 +144,7 @@ def check_per_file(file_path):
>      opath = get_origin_path(file_path)
>  
>      if not os.path.isfile(opath):
> -        logging.error("Cannot find the origin path for {file_path}")
> +        logging.error(f"Cannot find the origin path for {file_path}")

Send this as a separate patch with a Fixes tag.
Fixes: 63e96ce050e5 ("scripts: fix all issues reported by pylint")

Ideally, pylint should be modified to complain about this or something...
I have a script for kernel patches which checks these kinds of mechanical
changes and someone could make a similar script which checks pylint
changes.  https://github.com/error27/rename_rev

regards,
dan carpenter
