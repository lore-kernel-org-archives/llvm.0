Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF6938330B
	for <llvm@lists.linux.dev>; Tue, 11 Aug 2026 06:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786428637; cv=pass; b=Q/fswKZO/tjq0jhy/lEIHbYXZZyLKNezlFITQqtftFq+QGd4k6cWUUuEBrlCqOdqqIZf7zGPcLR4n4f/d0UrcqMvBj9iVYCwmRjdxl+Sic3hmxWmGiwSz02M+VHEmQ67Rm8ukopCQbqdOtzfCrTEyVPC3aOCbsgT7POPhNvge5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786428637; c=relaxed/simple;
	bh=Prl8liFSjTaR/57T3KKDPFMcDn+9r/l9su/+ymU2DtM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZEdhu0xmYT49IwS77n/807RoGQWln9VHsJ8hNokJgZALdKy+9+TyfE9atqchjgScxDQ+aTTEZuhL88Nd0am27z/VCnwHQAs32o3vqPSDmDSn5qKUP/HdjltG56JMeNfz3xNrsucedeV9AFR2MbAKRRbHWiQSM+wkaVJGZXU7fYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WKStlCjo; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WKStlCjo"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-385b78b4f9bso213763a91.2
        for <llvm@lists.linux.dev>; Mon, 10 Aug 2026 23:10:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786428636; cv=none;
        d=google.com; s=arc-20260327;
        b=Uy0wHsKrXg23YGACqO4kEJ3mgNRt2n03FbHkxTi3vhEpFevKkZd3HUqwWcDJE41h2l
         gLiqKFqjrICwtQP2PV7rISWe2WC+0uobr5o4LF8Pf6oXo//aCkOtyb+GSPuphCJkej1v
         fmfYc6bjADfPyDwc4IsKPlw74up0d/BcjSVE8br8R2Bko8bG69mBtm8aVSVhZlGgYGMU
         oGcVe+E87QBKeCfyq+AY60LleEz8c6aeKZ3Nreczw2U+kYCMXe3BR3KZPF3B0IEenrQu
         gv+GGETh1GJwbGbWWCjq5piML7nRf3qQDzYlXpyc/WrBmU4LoVRHow6bSflhDlEDgZKQ
         DBkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Prl8liFSjTaR/57T3KKDPFMcDn+9r/l9su/+ymU2DtM=;
        fh=9YFO/NwbfZ+KNA5bcNNEEV/9BEEobIB3THsWP8uqi6M=;
        b=Syce9Zhyjb5O6MsMss3/FbB/eLMc1toSSx1xEuO5uR8ePL/02VnHxz56iwvGbHiYkn
         /EqUdL7d9te8ANwvvqPzIP6bEKplIIoER7Tj+u8fXprj7wBE97RsElXHHA7olXO+WdJZ
         gKCdL0v9rGyeb0XG+vkiXUIMWw7RhTGdS0i3pMCh9NtDuAfDwiY2kjwTZz9HCiOqyiJS
         4lkh8TEheDbqLJr9wL20QOeln0cqhbdQz+JsYPOPjfHFr5xV8d10HLANkfc7rYEGxa0m
         3jxi5pq/hlT9R7oRztv7r050UCb9MVGYCGpQiauFubIw6nN9Es9kWfTvdiXyHYQ5QYHV
         9giw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786428636; x=1787033436; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Prl8liFSjTaR/57T3KKDPFMcDn+9r/l9su/+ymU2DtM=;
        b=WKStlCjooERLkwcenTlXmV4TVMk1L/NB4h0X0SgCjXwltKPbh7wVAfCy5sNQp0AqgK
         LBRlTjdI0grFtWqnriyJoYWVMHPLwMv0UjZrn9rItwngGzM2RepM1zynfAevGqPvTgGs
         /yg8rDCIbAb7CEjg6QYyeHRg254/QSdfiZqSVL0QEcjLkmkrmpuaKs7Tj9I5vx4YKOk3
         J5HfzVOmpfDMlNchMMjh4RhcGvg8T0wju3XDE0e6TnYOfZTohQBdZRlDDSa7HtAJIC/J
         wAfZpO9klPudNFXCXQRuQGtJddosWrKIzmn6dLSqi03FAs/4MACA4L7J/wRVg07veYEs
         JufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786428636; x=1787033436;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Prl8liFSjTaR/57T3KKDPFMcDn+9r/l9su/+ymU2DtM=;
        b=dBPmeVZWQbpT/4FZR7+4cxEyBx8PHCfEXz0e6EyZkSyENgH8fc8bGBOIC5OvDzHymN
         ZH3yfrOQOn//z8dn14aTu7Kbmo9wsxf01j/JhjhKH0CjFFMliBn7yNX0CBcPHqDb2dBC
         +o0O1S3GRXIOUvytHOzBAnjS2xcLh8aeTWd+uRjWcdVTX939+mU0in8mnrl596r3KGPw
         ExtwP35Td9zQm8tub5+WF+w7pVbBqT0bFGG5c3jVtB14BcKUkrhk1PDSkAjcxYQbtVde
         XjwFwr8sQ4JoVqLWsf/1hQX6WYCErUpC39/g8EQGy6/xGTMHgS7WZLyWJG+EuHVkLFKT
         iByQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp53p7vmm83npJH0ejjmrxbYXorALhaYcIMnvU2t+RK866k5dPK4urIWXlAm8TYINYoRZha@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/jnhzgWfgsD818CGdMJeJS3pwh8XCBG2BnUhViRcbQYlm+0Fg
	/KFglL0kmXgDf6Kx7hzv54wn/oL4c80xM20V4sDX7xad9uWpFM1//CCXEBjhlz3svSlKvIMOlwN
	zM7oR1/HfuDu+RP95JQiLxB/mHpfGIUE=
X-Gm-Gg: AR+sD113Ob6MLPuv5AHDFV6FuMC9ohQ7J8p8VHDt+6AkW4LT+w7qCA+D1q5dPGXta6g
	Nluh6KadTNxLG3Ci9Luv1qJmFznvA7nxZ7rZkstkePHdopx/NKHips9nDlGVkt3MiyqEHa8Mupd
	CK0TJxP8gNkkPybg+zwrMc1Nj+hP003St2tckcaX2pAu33R8usOGD9nEWUNjtxAqGCPKj8d3FGx
	XTogmS3kvi8YDIrzmLaegJdCqOf6q5O3b4Ps2ZdvzQDDI252v2e5Brp3vZtHwwqovbA9KAJ75Nl
	pOE6II2VA5IT67FNetm1/3ksqGpxzkU5yQgnLJ7y0tQsDv7/iZmH8rE9nM/Z2B5ZDL8ZK86fQ3K
	UFosk6rKdzyAlfBaECRWq97TSj8yoSAfha+9XHS4xUMflVem83XaOpIZMzguI
X-Received: by 2002:a17:90b:4cc7:b0:36d:b30b:14ed with SMTP id
 98e67ed59e1d1-392ec593f89mr746502a91.2.1786428635806; Mon, 10 Aug 2026
 23:10:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260808032143.2767112-1-mkchauras@gmail.com> <CANiq72nH+7P0PtE5h_kpn2oSK3-CgM-q5f3B=YemJOgQ-AfwPA@mail.gmail.com>
 <anq6-zI1NItuRMLR@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
In-Reply-To: <anq6-zI1NItuRMLR@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Aug 2026 08:10:22 +0200
X-Gm-Features: AUfX_mzliVXpTCoghQSgv41GlVE6gwtmdhR7ZphJ8N6AoZMuGGd6usHp4DmE7TE
Message-ID: <CANiq72mOrQawALW6f4hiNvXX3T6ifg8evtFnfeCjLH_-BGYwig@mail.gmail.com>
Subject: Re: [PATCH] rust: uapi: replace direct asm-generic/ioctl.h include
 with linux/ioctl.h
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com, 
	work@onurozkan.dev, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, wedsonaf@gmail.com, 
	mattgilbride@google.com, boris.brezillon@collabora.com, robh@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 8:04=E2=80=AFAM Mukesh Kumar Chaurasiya
<mkchauras@gmail.com> wrote:
>
> Sure, i'll fix this and send out a new revision.

Ah, that would be helpful, thanks! I was going to tweak it on apply on
my side, but yeah, a new version is even easier.

Cheers,
Miguel
