Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BA62EE98B
	for <llvm@lists.linux.dev>; Tue, 17 Jun 2025 20:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750190501; cv=none; b=jmL0loS4nMAboYMwyxMgFUrp/nRealDPHBIXENoCf+wCVcRNxVSZoXJ8qxZqlqes21dV+RSUtW1qmXu7nCvpKqEEUWYhungLE8Rc361K8bwtGLnRctK/sYh0iJ9KGbLitql0Zyy7y/CaYJnVddfXVAtpQNbeEEELW7Hv0duj2zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750190501; c=relaxed/simple;
	bh=LxLRIM3c0qdb2zOAm+rduDpDgZAMBgw5SL6tNGivXSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KQhg6fESBhEis1G8WFDymsdkvraoaxgUVg8ZqBzqAz9phfRE10536rpcBghixXez7FLlCXokrsNFlKly2ppfO4CAAExBzmcne2D5p6N63x3a4Z5BOKEOSFsLtukwdZI/aERy1YLahB4IoqF79gfc/BRervP7/eeiIlkZQ75YxlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fHjbytla; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fHjbytla"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-313bcf6e565so1036808a91.0
        for <llvm@lists.linux.dev>; Tue, 17 Jun 2025 13:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750190499; x=1750795299; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxLRIM3c0qdb2zOAm+rduDpDgZAMBgw5SL6tNGivXSQ=;
        b=fHjbytlaKWUuFYQg8ze/oJz1m7p19tgb3kZTlhBo+MeuPPq3OD0AtTiwVoP+TA88H6
         HhccncA213bmge1zOJJgOF82CqQXAqaaFloj9n8pAFKuEPlHDYa6ebghlvcFVWSrOnT/
         xCL4Eyb89NiUW8PNteSGLJ6jNkijGj+U9k7mi3Fet7z6k3PWRXWI1nnawhcMFhivpM4v
         sSLRHN+z5JcR4oCQVgL1LHxP4szQPrUT453qN6WK7Zamh4TqN31Ceq0pW2E+aQD1Lis1
         2QxYBSxw/sg0mNWeGVC5f8Fq0+Bz281DuaTq/QVQxo6dxQ+W4U70BJfy3leiowuDarGp
         RTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750190499; x=1750795299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LxLRIM3c0qdb2zOAm+rduDpDgZAMBgw5SL6tNGivXSQ=;
        b=p96pVMQtOW0gQtv4VgUyT4YargzgfJ+pCJTRQ9wSlz2tFmFdjHA1Xw5Qy4uEf3AwmT
         cHyhdiCunURgJLFBhxrYvbdT4MnntTkbEVNYEwBaBS5oaZfG15hslHFr+k38z0InCeWf
         yfWiJaRxglQTdZubRL2P+lt2YVV1XP+Hp7PEZsxBX7ELZxsSUfkhiMHOrOXg+C4JtX09
         EYsrvPiN3dMxYZNnu87FIWvrJgE/BtHJcpm14e9lzBn5oohQW6c2aY4PRBp6xPklRVm2
         ykAgJ8EWBWD+z4+b2HH0YYTavY4OpR/5eed343P1Hhwre+vA1VeRRt5wtXIN3R3ALALu
         WUqw==
X-Gm-Message-State: AOJu0YzD8EZVhUMAHx0DraFBt7JTpdqUlbWgziNGu1LsJgQ5TZfbbV1G
	5RkjPN2BuEkZIbsChV1Tzt7b/l7i8/wHLw1wicSutnA2LJm3qwMC0FptC5wFM0UA0sHl+595ujT
	4wGegxO5RLFC4EcKBolvdWOf4T4alNTk=
X-Gm-Gg: ASbGncvv99/URn48b0D5YdLeml4c0z11DF3wB7xCOcEa3RJVHOeh3hf0Ayuy9xgngP7
	/q5eNGX6cESyjdORdiuX2yS+eTwI2Nye2U1zg5RWY5DgejlaB0L7Ebx+YZ3NCsBCzXEkWW9uVnU
	8ikiyvl8nGOYua0phHbxITdqY8GdkVcPFUhVUHp4PJESE=
X-Google-Smtp-Source: AGHT+IFgC2I+mbHQVN+fSr3xWk3eFtw9MnutDVKO3nQ3T78YvMy5t79nTBwDkDa3QpiEK4FD6YchBOI9OvZY6cd+YrQ=
X-Received: by 2002:a17:90b:4d12:b0:310:8d79:dfe4 with SMTP id
 98e67ed59e1d1-31425ae54f4mr2636350a91.4.1750190498555; Tue, 17 Jun 2025
 13:01:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250613213311.GA1445087@ax162>
In-Reply-To: <20250613213311.GA1445087@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 17 Jun 2025 22:01:26 +0200
X-Gm-Features: Ac12FXwbba_z7Hxge2JAspnJDfASZGJUakU9W_NQuGn9BHnBtJV6Vo9PzZ6YHf0
Message-ID: <CANiq72kUt41pCtJSUP+H5bxWpduoEYit4HT2k4jOTFMHuASqXA@mail.gmail.com>
Subject: Re: Prebuilt LLVM 20.1.7 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 11:33=E2=80=AFPM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> I have built and uploaded LLVM 20.1.7 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> If there are any issues found, please let us know via email or
> https://github.com/ClangBuiltLinux/linux/issues/new. This will likely
> be the last 20.x release according to Discourse [1] but it is still
> worth reporting issues in case there is another release.

Thanks as usual! Works for Rust:

Tested-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
