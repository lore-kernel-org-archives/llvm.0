Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1D31F541E
	for <llvm@lists.linux.dev>; Thu,  1 May 2025 01:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746064674; cv=none; b=aWU8kQkbDEyVCfDey4YX0PPL0iM9znw+2NjLhwLPn6MU4gBVQALY20OaWcwCOgky6D4YR7jy03gldOiUss5x95oHEHBHam8nM9/SFkgklooz/lY420p745cznuoNpoIuVoq28FQtFz19KftgSxsDh5pS5ymnWaFpCCyAvpFPhW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746064674; c=relaxed/simple;
	bh=vNNOALAKojuc1IVmn4YDr6ggA0d46EQHEfPXL/A816s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T9Qtf3+LxoY+AwrigbyKWN1AD4LJwxSFekrZueWlOQZYgk7KswUe6oyGy36A+1hzLdZEpR4lMBS2fYlPA8Ya2OTRcMHG43LgNApBNoRrx81mFqUOafTTyerw6G/w/BvjBrRObI/04vEdDyG+jZ4uiHbymxbMk1AuhR0P0eCxijA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=GMy0gebi; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="GMy0gebi"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5f435c9f2f9so717000a12.1
        for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 18:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1746064670; x=1746669470; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WydL3B0dnp8hxEJArR4oBSH0m050M1di9pDwlQ1+3BI=;
        b=GMy0gebiYFMgIPxLdYvYTMLZVy5osiz/c8I0GcjJ+aQ2B0vHUGJmPEu8aN1CzwLmGQ
         lIB9qRG5JcCunXpIebSQu7oWUz37B297wNQ9NEZ3jCgHMQtr9pgPSn62iQHqVJz+qDlG
         eAz/DVvhSFmlj6qUCsOWnb474TyP56zGReS3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746064670; x=1746669470;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WydL3B0dnp8hxEJArR4oBSH0m050M1di9pDwlQ1+3BI=;
        b=ooJ+QqMf8gLJ+E3NzLJUDF+CRatTnKHqNgdm0rZ33Pped5cVb1MS6z2VEo6WWnPobS
         2mREzG2lc6FXfXG5pECWX5o5b7fn0JCwSC7lYwNRFdW6MHWv8fYcw6OYjUimtkzJh2hk
         DIDigQuOXzWBC6Efmpz91pidQn7AXd6YGXWXG3ot2lpVI8TfaG2XWJf/b51yfh2yf7fb
         pyGb4NgiSn2RgyJ6ySM9hh205qHL0bAnZbcujWGPeIBGy4qcYIL8T1wDQ1oqQeZx3q+5
         nGpEZc3wn/+Edy2pQ2x0Vr7RKw3jrFz2KIz3trj25uIX6S6wMh0v8wZYuqlXiEbJxXTz
         YFwA==
X-Forwarded-Encrypted: i=1; AJvYcCWo+fH/eeYKOC0QrXFH/rXRAvMglUmAIC7O4XoOwPVrDeF5pp3XJLRPeYKpxT5luC3a94Q+@lists.linux.dev
X-Gm-Message-State: AOJu0YyjapE+u4da4XkG/hp1bRnYRoXgJ9WerItM62fGE4c8jIFiGPRI
	QokIdX+Zr/DsmfNJEOydZvSKpNMPkiYCU/lr6wf91c1CBXCCOhUSWS1R4rhTeZajLP5lI5Qjj1Q
	7sZg=
X-Gm-Gg: ASbGncv/jKtfRRMd2kKdoIOJ+TwJM3MaX5XZkBO0ioi80ouQiqxZ8f1eNRV8L8iuI9/
	sAEm5Fskdv5C3342C9ZS942ROVO8D9d3LvyhUNMDvcHxLk/d0s3P7QkgKranzyM9oOmK9NBUytF
	QHIIyOhKn9zuNp7X2wQySBpOqfB7nZrZRAsDBwzcqfIqXM3oM4+Ks1rrJf9AxaDTiXtzw0q3yEx
	iziubO5uoXFLgWVNZMTqlSPbFHFESz1MBN/rN8bQ+yN9b3eGx174UFePbgpWJqEWFcHJ6QrDORi
	xMOUrETlEnZCKrIEEmu2gYJYagp80SxV7DcuU1R6khVO0YgBhqhCcVnxSsfcwoByun4arE1TM6t
	Y0ediiVp8+csqhNg=
X-Google-Smtp-Source: AGHT+IG33j4s/CoBWq8Ky+Srz5Bl7Xm5ZvRcVVEW+3Jjac6+VXhM45ttLLpqWNo12GMKROKBdyeAuA==
X-Received: by 2002:a17:906:c149:b0:ac3:b613:a651 with SMTP id a640c23a62f3a-acef425c604mr149610266b.17.1746064669762;
        Wed, 30 Apr 2025 18:57:49 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41c40bsm997319266b.20.2025.04.30.18.57.49
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 18:57:49 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ace333d5f7bso84394866b.3
        for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 18:57:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXiUL8fab80dFBD0DFANO+m7dTuvBphsd+bDzZI8b4ttsxyyD2ASgklbmhuau9pd00xcggM@lists.linux.dev
X-Received: by 2002:a17:907:86a4:b0:ac3:5c8e:d3f5 with SMTP id
 a640c23a62f3a-acef4299d67mr153004566b.27.1746064668786; Wed, 30 Apr 2025
 18:57:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250430-unterminated-string-init-clang-v1-1-10eab729bf3d@kernel.org>
In-Reply-To: <20250430-unterminated-string-init-clang-v1-1-10eab729bf3d@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 30 Apr 2025 18:57:32 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiHt40bxkx=1-2iecw32h5i8GXi=zpD0nUVdZxfh2k8mg@mail.gmail.com>
X-Gm-Features: ATxdqUFgZ1ZDKZdSgMYuRCt9GwTeRVMgI6qtOB7_7i5pEIVOBrqHEKYehH_TDJc
Message-ID: <CAHk-=wiHt40bxkx=1-2iecw32h5i8GXi=zpD0nUVdZxfh2k8mg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Properly disable -Wunterminated-string-initialization
 for clang
To: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Apr 2025 at 15:56, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Clang and GCC have different behaviors around disabling warnings
> included in -Wall and -Wextra and the order in which flags are
> specified

Ahh, ok. The clang behavior makes sense, even if it's obviously not
how gcc does it.

Will apply. Thanks,

                 Linus
