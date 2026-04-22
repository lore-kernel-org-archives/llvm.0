Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28B03CCFAB
	for <llvm@lists.linux.dev>; Wed, 22 Apr 2026 10:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776853551; cv=pass; b=U2KWsAszfqXUrj94mCKHUEsmuegqB5SIvGniIIa+o0ZXNSXKTaPOOW0P8WfJ22Hizi612g5p/fGIanXyGsox60rr8nNLDkM69kdolMvesw8m6a2KIhvEs4or9VX5HU4H+uRDx+Mu7W+Q4nZ5UmCYf6xQXlLhtOKwz2wMnc1pWxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776853551; c=relaxed/simple;
	bh=W8x86TMFVF1hjn70Sg/iNmaR+1l1nRssvJGwk/0wXHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eB1eDqyRikaWfBEo+LKjk08GDwyM2mWTAbdYwckNXr/0qQxgBKOyjiGRG+iltv/h/3sKV/88fRbYbEQD0OePlduon5X1MGQzwkbKY8gce7CEbmz+BbnsPC975Hj+W1YS4JQQg1IlnY1h+06+svBYYMTV9ozRuU1d1JhlOKVClYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mRYbqSIP; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mRYbqSIP"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12c373ee97fso191871c88.1
        for <llvm@lists.linux.dev>; Wed, 22 Apr 2026 03:25:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776853547; cv=none;
        d=google.com; s=arc-20240605;
        b=MZzpEdna0Q4QscXVyu2UuJGBlR0GNhNh3aQYAOs8fftmjSarFFs9WOcj1JsJH5w0we
         vyRbTpoErHNfEtEsaaKXArD8z3LMZLKjWC7EyH1JBaKg5mhE/zdj2rk8Hlmt6+fXokmx
         zTe5lVI6JLhvvMaSXILNEHpAoHKmY+k/HefSPCRbjgE4nWKPpF9Jx0Tk8Jn6Zd+mi4OH
         I4lIHqVdptyWomrLvPrRNm8bE1yg1FZpBDryeCGijRJq4oN6wUoWtCf6RMwlwrqkc1GI
         KHefY7C6NFm1WvCKqFV3sY0rQXDEPr3SLHQIY+yKKx8ghe2GPTYUc6vlfSMNVlmd+MBF
         LLcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/cDJhv3eM6c/+Hrz7OawdPllLe8mNfsmIcV4Z9Z51eM=;
        fh=3Ppub82YGVk0wd0l8Fv0rkjI4/+Sh0AuA2QRokDa2y4=;
        b=EEmFbA6gE+8CmuKfG6UCdALfv9KY/r/0R8AXLYZahEeSQfNW2dvuJawOOUhzBy1nmW
         kCni/xL2V+HeF/Jmg7zz58wa1nimYFWTeMd1ITJigbN+JrGl8SL5DSvDAknsnGOnp7m5
         S9QB3pRRDGen2NzjcPtu/u+ZO5vNBzc+zVZK5KsXciAiRge+EtrVD4MuQnA+1yz/ZCVo
         rBuzFy8VVvduT1YIYiuO04f75HVFvhMyicJ9Piat62iGOYaZb49ka7iLh08XN9ZPMIAe
         Xq3aETy86lsidm2rOeNgdDGFoJ3gTU1RLLMDDGWS1zNxzVQyHUmAC3WtD5bJUc05FBEm
         rk1Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776853547; x=1777458347; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/cDJhv3eM6c/+Hrz7OawdPllLe8mNfsmIcV4Z9Z51eM=;
        b=mRYbqSIP4RDOOjBQRIdq2TiAQ/rWlS1HfWjQ9kFvbKePKXcT+HZLHDo81FM1U/zM97
         S1RPLGEhktDACqn14YX849iLnnQmELH/7MXs35vbxwfEimWWughoZRuqQD4nLyMylH7W
         ZjM3gHpkbq8PI/yLIV4v/G6HIzmIMBsQOX7GSWojJ8BAYvkp+x6aZG3TiK2gtdZ+N9k4
         TJbe6n0BVXCUQvy9zvMUP7VF3Tz7EewJXHC6YlvLoVqiL7uFcTqijGjFEsV4xCkeVLe6
         ecrL6R0ctFNsuBV12L7LnOo1cliL1XfAan7MlDGAMv4X4FnOGN3BSLePUDy6t0xIWxDI
         wTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776853547; x=1777458347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/cDJhv3eM6c/+Hrz7OawdPllLe8mNfsmIcV4Z9Z51eM=;
        b=sSNnvSgEBFbdHngvNFODTwi8hAqQsbUkVX5Rr1kJZDu8R8jc+2CzQ5F6mrj1MBpRvN
         AffzDH8EZj6DFIEzkjo8ti3lOvyAZqVPBFxGNV6xxAlx+GWDfLq72ZJ9eOvKmzU4TDBG
         hUI8P7lP2OEYZdMIOzR5KEjPQ5hKmT2e17/N2Qm7ykQ+aCTge/mr+Kba9U/nvPbEwrWT
         hRU1aVRQHoVnaTH0ZU4zvHhl20kKowwBOAV1rGEDwygxNFN08xLCbdXOH7myd1bQpyFY
         uvnPuDWqOUzXHm+qskftMzNMU93j1q+iD1hCa4EOoVVrbTlFWPAdsCOzVR2dzlSjbvoY
         3N4g==
X-Forwarded-Encrypted: i=1; AFNElJ8mAhml5thoD48kp99uKVQNo72vWKaMd/JJLdiOVD0QS2RTa4K1KfTFpfIAIr1/9DSqxSlA@lists.linux.dev
X-Gm-Message-State: AOJu0YxDSa/z7dgfI5ncQDzcG3VMID7cDM99orlY+gmIFNyXrhWM7Dzt
	nOXarluPGvVZ3FZfwQ+JRNRNJ4N/gVUzCQ4ziAtiXjKafN+KchY6cFoLGnaeQsNFim5By/3B1ej
	PaK0mPrWeDs9EI0PP9bG9UYR42ZPtTBQ=
X-Gm-Gg: AeBDieu0mXs4gcqi4b2oyOVYI2OO7McImlG5Jb9o6pBR5ARxGOp3Y0G/0dOeCQEZy5z
	nR17ANWOxCP8jfs8qDWJQxCKcYFlYCF+GUqY4Bg1AL3sRmwCB2vf2vjZJ1nuVDnbKpQHJWe/xbL
	gEfZpbnj3P16blBJ/J034yOvp/eQU8A+G2PM+MWsAkjoPvshiiYmPsJj4zDuWr46s2Nc6lPz/X6
	77pMpD72Fgq8FWsJfw7n5xym7qURarMJ8/wF2f/6ST72QA0fW6zEp4iP1I0uPgFtHVae553OPFk
	Efga6VdZWAAF/gFIMjDjGgPZf2rFbmqFNFmYCjhigEf/JX6HGQzssRjirAhhPnEnu17xq2M+Ja+
	TxSTmmEUZjAAERoULI9NTkURelEqV6Gn5PPg624QdMFzd
X-Received: by 2002:a05:7300:1352:b0:2de:6c38:707a with SMTP id
 5a478bee46e88-2e47883d4dfmr5027759eec.3.1776853546696; Wed, 22 Apr 2026
 03:25:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260421190351.1976329-1-elver@google.com> <20260422110114.0f48d109@pumpkin>
In-Reply-To: <20260422110114.0f48d109@pumpkin>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 22 Apr 2026 12:25:32 +0200
X-Gm-Features: AQROBzC5XmyoV3A0NVOgiYmwUErrEDjDd2yqmBdaXblDnO6ZnYcgHowUVxguWzo
Message-ID: <CANiq72=x5Ye+Cq6FNPTaLNyFJ+OMYQE45hLKibTyrgXfkeBn7g@mail.gmail.com>
Subject: Re: [PATCH 1/2] Compiler Attributes: Add __access macro
To: David Laight <david.laight.linux@gmail.com>
Cc: Marco Elver <elver@google.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Miguel Ojeda <ojeda@kernel.org>, Dmitry Vyukov <dvyukov@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 12:01=E2=80=AFPM David Laight
<david.laight.linux@gmail.com> wrote:
>
> Putting the actual syntax in the comment would help, eg as:
>         __access__(read_only|read_write|write_only|none, param_number[, s=
ize])

I guess you mean as a quick reminder for those that already know about
the attribute?

That sounds OK for an attribute like this, though generally speaking I
would avoid duplicating the compiler docs. (Hopefully people will
still read the actual docs... :)

By the way, that could be `__access`, i.e. documenting our side, i.e. the m=
acro.

Cheers,
Miguel
