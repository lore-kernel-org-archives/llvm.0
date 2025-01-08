Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BACF19DFA5
	for <llvm@lists.linux.dev>; Wed,  8 Jan 2025 03:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736305203; cv=none; b=r9tqA01aYPWTZsqky1xMKlqtC81NNp9V+0wbLJbDJxeksQx2YuE5g3ll7MpAXn77yS+YSRb717ePjFtErlXcfGlP0HKRfa6Ih5ycmatWs7kimDU+lIAXU+oq+qfnjt7ZASZzybD11HVa7HScnGIhe7QHJ+UpkutMvgoB1DYXDSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736305203; c=relaxed/simple;
	bh=ltYRfQ14IXRN/9cdcB7PbclWptNjlsSoFOAk3QU4B+c=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=fsFYbv5q5nyhjwjA5/4y8PsPoDpaVg+EPR0BbK28zJYI89LSJILisQwnVNd8Hu/e+uR/GRFvLmbdqNO++kZY1gzIDJuut5KMl+C16FOOcdlumPcYHRqMqLxBh7GNazPq4lRwfLbeQkLgQIchb0YGNC0b14xXoHi6CizDxScOSs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=HobD7sFd; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="HobD7sFd"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6d8e8cb8605so88837246d6.0
        for <llvm@lists.linux.dev>; Tue, 07 Jan 2025 19:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1736305201; x=1736910001; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I0yNzl+As4oGuKhNOdOmE4BiHYZh0IMFBDUxXXCUSc0=;
        b=HobD7sFdDOrZS3PIR4yhwKPVg7LaDyfIo/PrzRgIUK7NnMaMT0YIniRQIBQuFPfm3U
         BmLZWpsWgCWU0ntXFmDVmaAzbDg5WMTFI2Mb005g3F/bpnTV2e11slESx64H79zRPzc6
         Acj5xskJXjWWedHO9SVuWS3pFGJNVfAfgmUz4/3zSTI8KJsjQXolMwIEniUuaGNTrwT5
         mztSgco9uMSiEkU1e80Rs7vrd1BQhDFpsaf3sKM8J6ynMOG9qhO2tCIQxfHj2bfm6dJK
         TDFKW9WUKgy8xP2meqcmqvMJusZ5Xf0JKxex0EDV4WM2Oqn5aKoG3XX7rcGg01e6zUNI
         uPTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736305201; x=1736910001;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I0yNzl+As4oGuKhNOdOmE4BiHYZh0IMFBDUxXXCUSc0=;
        b=qcgElVZXRkyt3+sd4hl7SFnpEeFA5b1SbqodfpkQrsFx96iyHtAZopjl6Zd6CjGnQW
         an7tEO8LCGaOmN88ApokXUT7GDPqfOZiqz7MF/CosD58Eur9wtvkIXL/370XK/8DR0Xv
         LQbKqMZTCd8xjFAu4i7YETUEdkD9sRxYSpINt4lhhAC6djW0Gs6ZAGUOzrD04ImglsZH
         g4JZQDA/vOTQJlkhn7TBP3GmCCQ03C6F/fpzphNlGf+dre4Wr52meU+ipIrOjOKoOuiZ
         rre2RHCji95I/yX55h65MgH6H3jKvnc6fRtOy5YBE2O+25uaAyHqx2Nkf8IAhpQh0ylI
         BDTw==
X-Forwarded-Encrypted: i=1; AJvYcCWy+JQykCLJORBO/km90GqtWfZQ2rjsnfJVV33foo5R7EhO8BSx9Dwij4kzH/0hGK3vbZcO@lists.linux.dev
X-Gm-Message-State: AOJu0YxwCZv1oPYtEXQquB8jPaYGoigts5orJBNidyLIG8HauXXspcaG
	TisLyBm8EJkXOO1DVs6s888HyKywvBPqL/YwQ6YT83kGzdPliEkNsFHpJOArkA==
X-Gm-Gg: ASbGncvIV4RG/RlMNmWFqPYknsPEqwf5GgUk9MnaAqMHLJ4mC6tnxV+bx8qQHsdFv3+
	w4rSTeIHQIDIs+uYgBH/pu97jWiLVw/jVoWjUiF5xW/oMz9KUZ7ppNB8EoGx8YaZdt59/aES0sE
	jAxzEU6GdmcRixoCEe1q98Ab4CmsTRP/l+r7LCOh/hFC0o9tI+EM4ywLsvJMNVFqBoFPrNO4BZJ
	Q8MVPyXt6vguv2Y+jEneeaQf/4qdn0vGPpxS9XmlGL4q85ZMx8=
X-Google-Smtp-Source: AGHT+IH+lwLZatyrqBOAesKhjOzKJVM17yEjBRrEj+xPvxjf5inNNnkNWCoZJzQPT55oBOmsCDchJw==
X-Received: by 2002:a05:6214:124a:b0:6d8:a486:e87c with SMTP id 6a1803df08f44-6df9b1d28c3mr21249606d6.4.1736305201066;
        Tue, 07 Jan 2025 19:00:01 -0800 (PST)
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd1813900bsm186960706d6.67.2025.01.07.19.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 19:00:00 -0800 (PST)
Date: Tue, 07 Jan 2025 22:00:00 -0500
Message-ID: <56fbfb30cc249b4bb98354ffb449dae3@paul-moore.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20250107_1610/pstg-lib:20250107_1603/pstg-pwork:20250107_1610
From: Paul Moore <paul@paul-moore.com>
To: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de>, selinux@vger.kernel.org
Cc: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, =?UTF-8?q?Thi=C3=A9baud=20Weksteen?= <tweek@google.com>, =?UTF-8?q?Bram=20Bonn=C3=A9?= <brambonne@google.com>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, Eric Suen <ericsu@linux.microsoft.com>, Canfeng Guo <guocanfeng@uniontech.com>, Casey Schaufler <casey@schaufler-ca.com>, GUO Zihua <guozihua@huawei.com>
Subject: Re: [PATCH RFC v2 6/22] selinux: rename comparison functions for  clarity
References: <20241216164055.96267-6-cgoettsche@seltendoof.de>
In-Reply-To: <20241216164055.96267-6-cgoettsche@seltendoof.de>

On Dec 16, 2024 =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de> wrote:
> 
> The functions context_cmp(), mls_context_cmp() and ebitmap_cmp() are not
> traditional C style compare functions returning -1, 0, and 1 for less
> than, equal, and greater than; they only return whether their arguments
> are equal.
> 
> Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
> ---
> v2: also convert ebitmap_cmp() as suggested by Daniel
> ---
>  security/selinux/ss/context.c   |  2 +-
>  security/selinux/ss/context.h   | 14 +++++++-------
>  security/selinux/ss/ebitmap.c   |  8 ++++----
>  security/selinux/ss/ebitmap.h   |  2 +-
>  security/selinux/ss/mls_types.h |  2 +-
>  security/selinux/ss/services.c  |  2 +-
>  security/selinux/ss/sidtab.c    |  2 +-
>  7 files changed, 16 insertions(+), 16 deletions(-)

Merged into selinux/dev, thanks.

--
paul-moore.com
