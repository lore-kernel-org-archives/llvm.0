Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206D3153518
	for <llvm@lists.linux.dev>; Thu, 22 Feb 2024 16:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708619110; cv=none; b=s4JedLJ3ja8HghC4JZoXBQKdcprPxf8j5p7snhHwsHLsHiodE5KkDBnBpgBuRqsXkhVAQmwOaGvfhlw2Ar3ILvS+SiTELXsyNbQnD62BxZ3DmbAl9Nx82qVtzmKkT0RdR19ptGOctIiBi4gn+herLPBUElVoDmk8+HA+0G8a5MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708619110; c=relaxed/simple;
	bh=fXcv8giEzlATM1A7JbByzVgUvAtZI63j7NQlt9NdCuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IM3f4LmNVxLZbak7uONL6jJcGpkbzV6ds/vtUcSJisf7G71MWK3/tlXr7yH9bvGu0SRUtB/nIcU6aQ5VWWSjVf4HVPHSR/pEpUzBNY5uJZ6cmzXtHh2GAS0w9OwlHprj4K4fuRLljvVrtoUUIoZXwqSAqVvDUQSGr1wTsk+00GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Za6XtapJ; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Za6XtapJ"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d71cb97937so80459595ad.3
        for <llvm@lists.linux.dev>; Thu, 22 Feb 2024 08:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708619108; x=1709223908; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m1AT2qTKdrf74pfg17LdBdyvdHs6LMG9RRMelRGtLLs=;
        b=Za6XtapJqPeShM3tf/+CD0eKNYv3qIwVUvkESLfhOg/bVTIyovtY+B5TAd6iWRsaUQ
         Mm41Dc1R/FENVFuet4w1/suYWDN20FEPHNZBAKlGqHZO/jMR5rLHW/qjfuo8VyRZoKI4
         xZt6TYNOX+KJcS2+gyrtQLy8o6Twf2A6nSCmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708619108; x=1709223908;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m1AT2qTKdrf74pfg17LdBdyvdHs6LMG9RRMelRGtLLs=;
        b=hzSaZeqTrNTMuUciL2BoaH8hXR2xt3CUbOCAxQQp3IKg7NGHEZl1BeHFs+DvbdbYs5
         yMh9Qu9knjzwZnSTBxSgfXoPXU/K+ZymvOaB56Pe3pz8XZ7Ik2mKeJgp2NuGsyyru/ly
         Z3IsRRxW9g6VfwVsRmpHh3HpeGYl7ETPNXCjJ4ulDZ1h4DT+MzIzxb9FSWe2iniEmwwc
         +OTkH9dfvshByjiAoqZkiKvx2RsPUd+9VQhl//O/ZudlnKda80wAZF1yqZ62flY4znIL
         TNQsbBIeikSLjZ9aUEfzDii6tjvjT7P3PGFXeCXBiocUFz/PZ3npFiElFQoUK0nC2QQV
         urEA==
X-Forwarded-Encrypted: i=1; AJvYcCUQC7xjdI2IadK0RBZmCtudwZorsKYd5R5jr3sYQC3hU/+Qh5pkscTFqgFxIrjnQsIEoUkHtqEc2Q93F3LPNTSQQMcL5w==
X-Gm-Message-State: AOJu0YxCpAStf7QG21KX56uLfC9peJNtmwGgWT4Px3d4OfyQ1GGofrQJ
	t2FYG/pelHPGoTmXbXjSo/nr8Z8lSfPwxlPlt6pO2lQMLd2tExZ+coRBtA/Lxg==
X-Google-Smtp-Source: AGHT+IFMJCLoL7jKkzpS9/TNZ6T7P7Jf8MLbdjmbuuVdSCusuR7itGNkEgPTZM7ffYA5gYmJpOvong==
X-Received: by 2002:a17:902:6847:b0:1db:9fef:b996 with SMTP id f7-20020a170902684700b001db9fefb996mr17759580pln.33.1708619108535;
        Thu, 22 Feb 2024 08:25:08 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id i17-20020a17090332d100b001dc3ef7aa2bsm2440647plr.49.2024.02.22.08.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 08:25:07 -0800 (PST)
Date: Thu, 22 Feb 2024 08:25:07 -0800
From: Kees Cook <keescook@chromium.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Anil Gurumurthy <anil.gurumurthy@qlogic.com>,
	Sudarsana Kalluru <sudarsana.kalluru@qlogic.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Azeem Shaikh <azeemshaikh38@gmail.com>,
	James Bottomley <JBottomley@parallels.com>,
	Krishna Gudipati <kgudipat@brocade.com>, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 1/2] [v2] scsi: bfa: fix function pointer type mismatch
 for hcb_qe->cbfn
Message-ID: <202402220824.398177CC@keescook>
References: <20240222124433.2046570-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240222124433.2046570-1-arnd@kernel.org>

On Thu, Feb 22, 2024 at 01:44:06PM +0100, Arnd Bergmann wrote:
> v2: no changes, just rending after I noticed I forgot to follow up
> after https://lore.kernel.org/all/336f2156-220f-47ff-be97-5a2a9c475372@app.fastmail.com/

Thanks!

I assume Martin or James will pick this up?

-Kees

-- 
Kees Cook
