Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E3B36A
	for <llvm@lists.linux.dev>; Thu, 11 Jan 2024 00:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="csyfYH5w"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d54b763d15so22676285ad.0
        for <llvm@lists.linux.dev>; Wed, 10 Jan 2024 16:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704934008; x=1705538808; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IF4Xvcxm6j5XwtG4JWml/8dwXU75b8X3960fnN+1LE8=;
        b=csyfYH5wHpj1IgQWw4j07OgIz6d3uXJnlw1oZWpOkOmGcuspKtO3LMSf41qN7NndVX
         KiDpiOZKmGSXB1RKXUyx+53xCh9+o9V/67gigxAvGokF9coDfe2x8lxCtc/wgrJRiSKc
         9S4BSFFGO/VldrxXc3quHr9OkIPbTFDrYBkZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704934008; x=1705538808;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IF4Xvcxm6j5XwtG4JWml/8dwXU75b8X3960fnN+1LE8=;
        b=KzgO3LXZPqskolKHekKgrzTjY6+mFat2Y8RtOKXbyaWKxd7HraNpjym5aA0K0ZNksM
         maJAsivq7IpDDkDrsUmM3BuS+iXXyAnyan5Q2CXyskoKAXMeWu5ekaoUvNU5Ia/ewwut
         sWHjzt/QeLnpSj3mRSOUnaZPXPBjbXUSyFy7p/3frUlcerHsj99TJ4DTCMflCsG0FA6d
         29cI9CraoH+H3RPsDFCGyVZNEaD/LNxKAy3mU99KpmtO4lWkDiKcNkGRzeZLVesXnkrR
         5nMF1IxxeJzGwf1YmOgMGZVkmhoj9niKQvmtLh6+TFbuqiDgDKncfpLq74j3qWtqs4q8
         /NCA==
X-Gm-Message-State: AOJu0YzQuv36tD2/IEIHh8PxF5M3i8B6vw1gDWAogCfswMxIt8NjOv00
	nq9FA4unj5KLA/Zgvo0gSpa57v3yp4+P
X-Google-Smtp-Source: AGHT+IHfIMaIThh7fEON8bNUNbntBfmRsGbqmlE35pfg4eCeS6WcC93NRpnXZIHiEcrfLsuVVhG/cw==
X-Received: by 2002:a17:902:b489:b0:1d4:6a34:b442 with SMTP id y9-20020a170902b48900b001d46a34b442mr331087plr.108.1704934007750;
        Wed, 10 Jan 2024 16:46:47 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902f7c600b001d495ec2cdfsm4257358plw.33.2024.01.10.16.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 16:46:47 -0800 (PST)
Date: Wed, 10 Jan 2024 16:46:46 -0800
From: Kees Cook <keescook@chromium.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	"Gustavo A . R . Silva" <gustavo@embeddedor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCHv2 1/2] Compiler Attributes: counted_by: bump min gcc
 version
Message-ID: <202401101646.B1C4FDA@keescook>
References: <e1c27b64ae7abe2ebe647be11b71cf1bca84f677.1704855495.git.senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1c27b64ae7abe2ebe647be11b71cf1bca84f677.1704855495.git.senozhatsky@chromium.org>

On Wed, Jan 10, 2024 at 11:58:17AM +0900, Sergey Senozhatsky wrote:
> GCC is expected to implement this feature in version 15,
> so bump the version.
> 
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>

Yup, this is good. Miguel, I can take these patches if you want?

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
