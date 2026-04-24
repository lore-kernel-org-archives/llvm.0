Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42691A6824
	for <llvm@lists.linux.dev>; Fri, 24 Apr 2026 16:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777048420; cv=none; b=UJ6ibN8p5nNJzPAVgBG/N9TBdTwI4C3A/GRvZxCeT7HY9Rf1ZGqPyDofo3Fhuh0vYDk2FFKxsI26L7s0acOLtL67YHQ0MSeacROZVCFIry37SGie1Q8TYYn0sqPvmeD6sfcfJ2bePWAeD8F9181p0y5ZAHuyhwkI9GpnW5KOzng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777048420; c=relaxed/simple;
	bh=VaI59OQbfJe14mnaHaZd564abaiGaU2GLepMKCqwZGE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=us/cBUqOQkHyrVkl+OhLiWN07FnqqEGMjCd2+HLKH5L1/BU7tpKzXuTUpnh92RV8XF5ciJdKbyaPc9M/NM2+cWXYzTbeIwmc8qrEKKTW2buD3v/is3GalhutSWK0OPXj47dldiRBAt3BTUULwsCXRUy2gOGwMQ75zfK8zc7mS2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=YNSv0W/8; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="YNSv0W/8"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b9c603ec2dfso1062831866b.1
        for <llvm@lists.linux.dev>; Fri, 24 Apr 2026 09:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1777048417; x=1777653217; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jSJccTSZMzbqRqKWLiEyB+VGJ+jaimRIAFr3W13kLp8=;
        b=YNSv0W/8pszOkQa3pISKGJT2Hmhw/W3OKSosQ+2IEmYs8nEtsdm3RTx5s+W7Ebimt/
         SeYsebygEV+biWYTykswNnC+R2gkXGlrm6cfFvhX5kQfm94qoqW9warV5ZzBpXbzAhm+
         sqLlKkrl/N0CIs0qgO2Q+DeI+OISNeJO3d0Mc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777048417; x=1777653217;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jSJccTSZMzbqRqKWLiEyB+VGJ+jaimRIAFr3W13kLp8=;
        b=fogaxOrPMaqrxS/xVGXJ6MyQCwtUrdr/KLzxDwKGJcWasqOtuFrfm4z69EsXYiDm0a
         Zpz7Cp/MH6nS5+qSfVPHFcPJAYkyrn4HxHZFoBiUxq01jotTW5Oi/pDPNctIZfCuRAOn
         X20CX9wEWxrmtoOuwm/ThJKnyhHOIC6vXcC8bMvMJyMbk5kWNfj2JCm2pUqU8bDVhNw6
         WhVf9HGS42MAskT/L6rbLEoRZV7H81h3DFsLvugkU7Kh6e1eDbflaf53FyPSrE5b7gCf
         e4F8HZAH1nd/t7Ws9ZkcvjoQmpPa+VjG5jNH8CDDlDn8rFaE8JH9ZZvq6CcY5kd6FNXA
         12Rw==
X-Forwarded-Encrypted: i=1; AFNElJ/LW8526PJdCca46ImG9IsEGUnBlJmM/Zt0LnjXK1ghCN2M6+tXCbvVkRBF244+rU5SJfo4@lists.linux.dev
X-Gm-Message-State: AOJu0YxfTYJ6Wv3dCQn6BPbV6Hy7WMNRqWQDhX5FcCdpmYKLVYrA48N2
	S1/NlHnyfR3Pm1EhZacd/t/2u512D1EgxgYB7MYhcticE2ox7G3VvvQc+mEeXACdHD+aeLNKZtV
	XocPzK13XcA==
X-Gm-Gg: AeBDieuDcraCsMC7sNLDzLebIWdoxsCVRbSo8azbwscXmy7pSYtBFE5Vf41aKRIrtcA
	dmKeI6k1PYeXEGX9iJtVvcjWrhiE3ek3aHbOlxKZ/Hc/Ch4ZXZPeWpS5LTwSuNIMDvR11X4OsKi
	V4V01D/9FfsdBoIpKVBMfcZKe11Vc4+zy1oZfXcDQZpMh4WnNETjFrDtqSBkVInCTBRrkzlOH7V
	RgOhow/l717Rta76+9+gmuB/l4CzgOga0MaoSp0tdo/mihOglmFKb667hJC1fEABjy6b1yLmI0w
	PzPJTn0PpWGqB3v4hzkoySHX2c5+o+Pf2HcjS40Cz/N++O4NM2D98sS+yvTlV30484XBqD/bs56
	4EJNnrxGPet1V0TMpIJHS5vA5NDtA11/03tIQ7hoq9Az898AKNOHaGO7QzDxB8/wWDp9iXzQ18x
	KwZNUUQK8AjgW6ZHQXi5ZMva2zoNfI3rV3K+SN+OW5PkQfhJpGqALJdTL7GCG9genFaBWfX4Z5v
	gZIY1bfMhY=
X-Received: by 2002:a17:907:930c:b0:ba9:5e67:e755 with SMTP id a640c23a62f3a-ba95e67ea5fmr926166266b.43.1777048417119;
        Fri, 24 Apr 2026 09:33:37 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bd19sm780152466b.37.2026.04.24.09.33.35
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 09:33:36 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b9d9971d059so1179477066b.2
        for <llvm@lists.linux.dev>; Fri, 24 Apr 2026 09:33:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9PSVNJbDGpxdG9EKziuI/3QV4upBX/oqCFO47u4zKBMhXFcHAi3sLUTFAbiRkL2wxbWqsH@lists.linux.dev
X-Received: by 2002:a17:906:fe4d:b0:b9b:5164:905c with SMTP id
 a640c23a62f3a-ba4188857d3mr1663033866b.14.1777048415542; Fri, 24 Apr 2026
 09:33:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260424000413.GA1031124@ax162>
In-Reply-To: <20260424000413.GA1031124@ax162>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 24 Apr 2026 09:33:19 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh9eUk9+BOGwP7ni4OZPZSCfgZQ43n53XWuh3rHhMxwfA@mail.gmail.com>
X-Gm-Features: AQROBzDnGIHm3zgF5E07nZcvcG1trefVwFQYyLYpnouUnQoOBHdn6e4cik2idLA
Message-ID: <CAHk-=wh9eUk9+BOGwP7ni4OZPZSCfgZQ43n53XWuh3rHhMxwfA@mail.gmail.com>
Subject: Re: [GIT PULL] Clang build fix for 7.1
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 Apr 2026 at 17:04, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Please pull this single build fix for an instance of a new clang
> subwarning under -Wunused-but-set-variable, -Wunused-but-set-global,
> that appears in certs/extract-cert.c. If there are any issues, please
> let me know.

Ugh. I've pulled this, but this is very ugly and does not make the
source code better.

So if these patterns keep happening, I think the whole warning should
just be removed.

                 Linus
