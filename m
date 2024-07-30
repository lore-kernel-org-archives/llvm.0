Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A522A1D5
	for <llvm@lists.linux.dev>; Tue, 30 Jul 2024 01:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722302972; cv=none; b=KOp0bz+3G+wkjxZRChlv7AU/N679hFgiRg1wRxwxzx97qX+efQ90999QMYUFz7iVd4tL3wSjRPC996k7WWPZCCfvYtWX6px9ykgWZakGlAjSe+Nv3DNJwnsXRNLIbC5+c2FNm86jCHp3+HeZkqnJxlDXF9tQxwPTmv6vMeT8pdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722302972; c=relaxed/simple;
	bh=bfBkGRjeTZ8KpCZ5YHsqKiqDI0RJTgT8r2ZT5d3DLEg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=imJZ5C0Dp7q2XLg4kYJMLIaexLCnXoroiBs7vbQZVnbT42Pbf2S920UDTMFtZ7qUvuSOeD1oSY6izidU375zzZ/JnvKvd7ti7wo4IechaGL2fEK12fjsqraYdEvV1QnLdM6eOWfg7AgWUAyivHZoWYk6DUYIU/83PGJlT5Uiflc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YPObN55w; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YPObN55w"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5d5cbe88f70so1957671eaf.0
        for <llvm@lists.linux.dev>; Mon, 29 Jul 2024 18:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722302970; x=1722907770; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ayRf9T1O0mu5YBNweBKrgfpWWoseD3czz8LrR2EBiCY=;
        b=YPObN55wBwpVWMmwZcvUy9qbq+PuUTt0aBUlxW6EmD7YWKIj3MgCiS6x/sEl8E15Iv
         GA6AWhBVjeCzL6ezz0rl96u1cr39pjiNFc5kC3O2LOzFRIexlgieI5LVc8sCKZKH08je
         8cAV73zF4Uf/EwxcQgqa4EPIqB/np4IPQGT5XVVD8exRO0DMay2ni5BSUxX1R3rw5F98
         JxPdxitX85FiXbv2gdorzZ/NbBCv8j4fbFsiLHXLW9vHBdEyYc4i/dUZ7uQiLKNCJzKb
         sYgLDgu8HO6d0NxF7jxrE7svh47qmDFpL6alr6Q89DGJQnDAFDxR8ezSlcDnongviJiU
         YAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722302970; x=1722907770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ayRf9T1O0mu5YBNweBKrgfpWWoseD3czz8LrR2EBiCY=;
        b=K0bofZR7kwcX7p2YFn8X9s3SqEzjGmTHRrsm1Fznmdz0pxmh+0Vb31YXstMFmehEig
         h6s2gsTDaPrgRN+vWTXUClRz/n5isNZPFojEiXo3pkxAsoc/iPL9pc/ki9EH5TXVdOXh
         FoXlqJ4OU/6pNTh199i03Gznv9S1Lu3KPRzcYqVcTWzqPAxjwnxRMFrS1XlNLmE751JP
         rDZVsgfTKbH9CgxwdmsDqkl1nEjkEGBUOHagZpdqPWiS/gea1EDzLdIyuaiIkus0Htyl
         FM7AaFPhQbi9TldkKbw46ueXuwOWsHBV/q4ywXvUoZUWbgz0QOAwZ+1N9mqaIIb8zLm0
         Xwew==
X-Forwarded-Encrypted: i=1; AJvYcCV3QNNCcIf7bhPb33y1h79bVl/B0s/I+K9eQz0v+RuTuRyPMBjQHNLAmgYAQaKpOqHf/YS4gyKRudfPokpLEtTzc0QLCA==
X-Gm-Message-State: AOJu0Yzj+ZWbSYVPyvR+2M/FNqPXeP2rxHeJOvyOy3c+6fWBwWO6W4Hu
	4zpD5HP5o81B7tBbP2zUBeOKX9GEps+EkglP87xkFOsEa3IdN25j10bSfXhSobG9yD52tSytrSy
	dBqxX2qolShwXVGD4qqhC8swOug8=
X-Google-Smtp-Source: AGHT+IGrJDi7bUdmWempWTC5QLfmgv6XjZARfHLSd+52QVC0tT0bBW1ZeORqLg0MbVOL/0fg45OkWlRIK7ehuRIdm9U=
X-Received: by 2002:a05:6820:1b94:b0:5d5:bd48:8ed8 with SMTP id
 006d021491bc7-5d5d0eb33d9mr8447025eaf.5.1722302969740; Mon, 29 Jul 2024
 18:29:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240726145754.2598197-1-dzm91@hust.edu.cn> <a17a7994657696fbba9c9be29c35629ef512f85b@linux.dev>
 <8734nrao67.fsf@trenco.lwn.net>
In-Reply-To: <8734nrao67.fsf@trenco.lwn.net>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Tue, 30 Jul 2024 09:29:03 +0800
Message-ID: <CAD-N9QUn7KFBaSx0orYYBZ0NUS0gYwUG23Taypr0i4JNjmv1AQ@mail.gmail.com>
Subject: Re: [PATCH] docs/zh_CN: add the translation of kbuild/headers_install.rst
To: Jonathan Corbet <corbet@lwn.net>
Cc: si.yanteng@linux.dev, Dongliang Mu <dzm91@hust.edu.cn>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <siyanteng@loongson.cn>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 5:23=E2=80=AFAM Jonathan Corbet <corbet@lwn.net> wr=
ote:
>
> si.yanteng@linux.dev writes:
>
> >> \ No newline at end of file
> > Add a blankline.
> >
> > With this:
> >
> > Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
>
> I went ahead, applied the patch, and fixed this.  Next time, it would be
> nice if I didn't have to do that final step :)

I am going to craft a v2 patch today, but you have already merged it :(

Dongliang Mu

>
> Thanks,
>
> jon
>
