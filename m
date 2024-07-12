Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1744965B
	for <llvm@lists.linux.dev>; Fri, 12 Jul 2024 23:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720828493; cv=none; b=a7++YDSMLzfYXeWCsgNCBdOExH9/CHTX/pPSAUKse4/FKwR4k4//9h/NkrrcyGR2zG6bSQEYzsMls9+1FcaICF0xk9g3DYcX+AK77/mqsQjRh8SIDA9DrKX6xsHUUEDP8fU6Al7uZLcEdUkPxHucrYc07t+fQ2BJ0h6PUneyLEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720828493; c=relaxed/simple;
	bh=YE6K7R8gAe+h184TeCU2xVbL49r3TsltcJZ+ZLh755g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=to7neC1KtrsNCUVrgU19Gx+NuqtE65TPWBo/FxNNJmNI8CpKGBBVgjtKWYbFjr/9vGZCUAi+mESpB2dNw7kY+ZsYbZhEX5eZ4ZxHOzmgRd/QTSm5H8sOPAIZLFWtMnaDApkU3iIJjyU9P79KLzSiSET6DJZ+qHtZtiIydMMoows=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h8NjmDCG; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h8NjmDCG"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7515437ff16so1723024a12.2
        for <llvm@lists.linux.dev>; Fri, 12 Jul 2024 16:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720828491; x=1721433291; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BZifc3Pwdz8+QdK0J0oDpsikoywlYN13Xs5CJ3nc9A8=;
        b=h8NjmDCG8C37XtnuDdUEMxczapG6huE5igkCDPCQEZSZBp0OZk8T7MNPasvxJL6Fil
         Qsje5G0IiZIxuzWZdOmpze34GRFlyt6vD5knPTqq0OF68Vtv+I4T3SpF3seus5s52RlC
         3brOBnsX1gZf6o3bnLlhboCqT7Bvrk7US6uwpJAJOWI72UPKD72vi0CpHefjPeE97ADO
         YVUT/DUBijSsqucrXDbdGB7Ec7iDRX5V5RIeT8GqJ0ppTBKHknO9xJlZff8mq2Zz076m
         cnxF8LQ06H2aIyryEBChaQ5vpllE8Zt/7mbpHhrqOV5EqMR72CHLb2MXaJpt7Tq5UbKR
         Mnyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720828491; x=1721433291;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BZifc3Pwdz8+QdK0J0oDpsikoywlYN13Xs5CJ3nc9A8=;
        b=e5ZRYr//5VhbtJtb1m4hu1kFbYqhuc7ZVd+hvlr8lznBW4qT1ntYESjSImwzaYBfDm
         yQoL2MCoYMnn88qEid3TBDZzAPJ9O82hqf3XCuchNO3JuDLZY8A8Vl6SAofHMewCOyf/
         XP90H1xtc9fab4GLGlW4RRV90RutzYXeYnwigv9QE2YZ+jbV5cPno4d1T4PEeTo6RP3v
         pRZSvpjBt6yXSrj3Xb93yQAzk1yL/0Dxi68BBfDDKU0IzfgYcJKoOg6FLs49Jr8yhls0
         fMY1EoZ/qiR4QlIWpK19IQDlzkkRgeRx8LhSXpu/TF1iJNXEnfHjm4z4Xis16Z/WIE4b
         dA9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUL/RZp/JzIT8X+LdaC6gF82vZ/vCpsbPB1xgMVOEPTrQRogGvND36z+vEd9up62OIWnAl7V2A24Cy2s0LU/daOtVcboQ==
X-Gm-Message-State: AOJu0YyyD5f3yc/5MIIBv94PNLGaBAupiV0nZXT75C8CQNqvEVYGqkCG
	shEnHy/epCHK1WfEL7LjVun5Ag0Vm3WM6vPyDOlM1Q5Hud30ZwoA
X-Google-Smtp-Source: AGHT+IGVAIDpkYPZ4wIDiOXzfW/rMMhvWd1QvMpcZH0QCKaTTIvEEf0n63/+Y48Ii3uPyJSca0Rj4g==
X-Received: by 2002:a05:6a21:1807:b0:1c3:b234:ccfa with SMTP id adf61e73a8af0-1c3b234d008mr8697976637.52.1720828490647;
        Fri, 12 Jul 2024 16:54:50 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7eb9c916sm105319b3a.42.2024.07.12.16.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 16:54:50 -0700 (PDT)
Date: Fri, 12 Jul 2024 16:54:48 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: Brian Norris <briannorris@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH v2] bitmap: Switch from inline to __always_inline
Message-ID: <ZpHCSKuKDjzuSmXx@yury-ThinkPad>
References: <20240711163732.1837271-1-briannorris@chromium.org>
 <ZpFhv5VSYZ6jnsd4@yury-ThinkPad>
 <202407121059.9FC2D0DF@keescook>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202407121059.9FC2D0DF@keescook>

On Fri, Jul 12, 2024 at 11:01:13AM -0700, Kees Cook wrote:
> On Fri, Jul 12, 2024 at 10:02:55AM -0700, Yury Norov wrote:
> > Hi Brian,
> > 
> > Thanks for taking over this!
> > 
> > + Kees Cook for GCC
> > [...]
> > But I'm not sure about that and don't know how to check what happens
> > under the compilers' hood. Can compiler gurus please clarify?
> 
> I don't know much about GCC internals. I just ask GCC devs nicely to
> help us where they can. :)

My concern here is that this __always_inline may hide a compiler's
inability to inline things like that properly. In that case, we
shouldn't convert bitmaps, and should file a bug to compilers.

From your and LLVM people comments, it seems it's OK to convert
kernel code. I just want to make it explicit before moving forward.
 
> > >   Subject: [PATCH 1/3] bitmap: switch from inline to __always_inline
> 
> We always expected them to be inline, and if we need to hit the
> compilers harder with __always_inline, that seems sensible to me.
> 
> Reviewed-by: Kees Cook <kees@kernel.org>

Is that for bitmaps only, or for all files in the patch?
