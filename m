Received: from mail-lr2-f5.google.com (mail-lr2-f5.google.com [74.125.230.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24883CCA13
	for <llvm@lists.linux.dev>; Mon, 28 Sep 2026 23:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790639263; cv=pass; b=F1mocdXgJLKWU7MPHpYf2mChhKIDC/k7QhJmJ3TWRo37Cov8qy7OpmkiqNjOJQv8O6j1jyzj2BHkYMeQasDFVYwqZ7NpAdV3g/5NLPttI1Nzir1/tHOkGgrzyKxjC5xgGC6nJHoFD7yHOPhUGzByBZl923RPNq/wL/536iA/rOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790639263; c=relaxed/simple;
	bh=dku0HLaoaE/VSw3rijbA6ovYY+qIg8aBGr2ZLZbypC0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=h/SawhFK5HQPSebeyi8EVutt2wfe7rJvmnFwlOpTErTvNr9LLnoKraDul+4oKcweoRj4Y9AE6J6IIP5bPM3ryyCLqAKhnQP4E6eiFNORCCSSW6WIC1I87RBdua111meHbEYuxYZSuuwK5ToB+y3qSQGlBk2LAZmsm8MTaQ8umic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gK/F6563; arc=pass smtp.client-ip=74.125.230.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gK/F6563"
Received: by mail-lr2-f5.google.com with SMTP id 38308e7fff4ca-3a65ac87c50so17990941fa.1
        for <llvm@lists.linux.dev>; Mon, 28 Sep 2026 16:47:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790639260; cv=none;
        d=google.com; s=arc-20260327;
        b=mByXm16c78Zp5CX+aL4ZPZ957ylCoqyKKxkoVIW8YHd+XyvRBGXuZkMS0pzCU7LQcS
         Hibx95X3MyV5G3VcOrx2IdEavzNWE7S/CQegl2xO1P/PT6xkDmn5XOBFx0RPw3Jhy5wN
         zb1fEodfNsTzVVRt+Eqn2/lLpkpoNXtf2+Mw+HBS3Mz4ie186lQA/O4vjugdrSIR2OqY
         EPJIpQznDygidKhoYQv7wlbidQepSOc7Etw7Qg+ZWkMdXQnJEabJU6lOBr5eLbn7zhN+
         JZTrABXgqk7TgXsljM5wtapjpegFsRn/QfOqItaP0jTLSxCpOW9jcqrlRlvDqoQpw+D2
         I5/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=dku0HLaoaE/VSw3rijbA6ovYY+qIg8aBGr2ZLZbypC0=;
        fh=1ViygtvCS3BCrUGmpB4W+beV3IMY7XjMcUYi5l2MSAM=;
        b=TVu3OHUGzyrS/EWogLP3GVgA0x4sBLlzw8z+KfZldkozJs9ZrgvqGu/sksE3Y/XvHr
         X82kkqYMtvHsgFRbrlp1wrTeKF32/PvtIlCn9CY+E8FFQoutVsGLBGZSauxzSVquvzbw
         R6QATkwhcHhAYSICbNlBI8Ln75uKvKNde4Y53AOsEjrxpXZXAmTe9kKzbnLNNrXSzlfy
         3kD+yIUpXQ3vPGGmMZxZczupsTwLC65TKtWz+bWpBgEiJVeLOjddREnHywsSDpf+WCZn
         VO507UjRQ63S6h7je181z9NlX1BJeG9RtvQsZwU14A8paNikoIwID7gDV7+tfQpDyKqB
         S7vg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790639260; x=1791244060; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dku0HLaoaE/VSw3rijbA6ovYY+qIg8aBGr2ZLZbypC0=;
        b=gK/F6563Ktm6kM7OrUrlZUss9Ko3cDHjl8TPikz0hZjbb9xflBWRdMm6DRaH2QANC8
         ZcHXgO8+eeFsD+8J23ymN2VJXjgA9GYttkZxt8m8nR+MTQC6zOKiBfQS2tno83oSNKrv
         Sa61SCUynXTmltoz71+O9zyXc8WrVA5xNLJugt7RLcmQHdclHajVisUu8cOcAwKM86Kg
         Wvi545MejIXNQ3THcJqistwF3V2tXekSB23MRcn8hGdj43BWfW9LzXhpfi3qblBoW7Za
         n66yb0uGUA7QzAMW2ZNxwtSTFGV82IFmjEi+JMeqmvfdL317Liyffcqwxy5bTm/mHR4F
         zV0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790639260; x=1791244060;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dku0HLaoaE/VSw3rijbA6ovYY+qIg8aBGr2ZLZbypC0=;
        b=AG/quZ8BuDwrld/Usb+JyJ9GRdczlYV8qShrt3ptpTfqC8V5q4VnkBjePsBSzXmT8a
         LkLGFZfmIpr7lVdBlmtnFVJSu9w+97v07YITcfe/3GPcX2Q6/IrLdrRQDETc7vcOpm89
         /Soe2+fRodKKKAxc8+Q8NCYvZeYTMRfM5ytqvmjdZd/w1uxZG+FTib3YXmG2BlUDKNxF
         dF0lKv2T5ArYW15BG31uAGBu5lD+OE36Eb9GTBYwAHxjgFam+Va7gxMjCFnJq565xFxe
         mmY202bdpUZocjRMZI60mu65dXeih5ANqqJpyYutFAy48x4dM8/o+ncIBFmRIPTg/Ay9
         qgLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUdnF3yzgL2R/f9XWnb1X89hE+7vsfL72MeTQRzeIXKcl0Emrsd7vmH/TuJrXMNnZxccr2@lists.linux.dev
X-Gm-Message-State: AFq9FYIRxxhDumWZ9JfJci9uWL5JKitAWD8IRLsx8o3JTS9w4SRODRzG
	Pxl7L/Nw7KzKnr3ZjicxUSmTJbONaGxa1tGTV9O85iZZewA0d2ufgJuqfVs0OLLkf+JiFyXfnm6
	F3NsLjFnIxBLjVhEg6ruY1W2h32L3WlU=
X-Gm-Gg: AYBFou3iydwHgR8aMfd77vmyBXp09cNBzOBjsHDo/fulBNdHX5xb8ofjnZPIMra1027
	hFjMvfvg4vCcNZ0+PgcQ4XzvcuiU+NEEGtp20xyUh1ootIXvmY7ZHWUIFE2kTyjQTS8sTpBXzmA
	qMAB+ZXl5EFCCWorG5hR4VnwdzGzslOSwdm2x190Rpdi9A0LrB1MeEZ/wkz2FcmYnMxx4p+ty8P
	iCpP9y+LG3yjLp1+JOmYqxp54zLXO4xnEVvtVBH56fYOgFNdOHdlbmHU9EOuhXmelFBv7A1AdMM
	upEHugq0smb4XHPi70L7gORTwvt2eHZFhe5N2EhYybj12Zo/hfUEX8IUEESFiN6um2QuslUgEhH
	zpHGx9igHG5X7M6jMZfQqlZRgi5cCLFl1whyFB9V+0OMiMul4OGxZHE89jPdJ/FxPu9msi2M=
X-Received: by 2002:a05:651c:198d:b0:3a3:37fb:27b0 with SMTP id
 38308e7fff4ca-3a64c36f2d0mr23962831fa.0.1790639259996; Mon, 28 Sep 2026
 16:47:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: omer zalman <omerzalman42@gmail.com>
Date: Mon, 28 Sep 2026 19:47:28 -0400
X-Gm-Features: AclHuK9nGhJoPEAHZ-3co23Vqbj9xA16t5iXDWsQ0pUYTlMrxqnt8R3HWm2WSbM
Message-ID: <CAGLNFZdmi91Sh7_51OWWq46ShYFcOE_GgNPoYzcvvSPWCDLY4Q@mail.gmail.com>
Subject: [RFC] scripts: should -d anchor compile-command input paths?
To: Nathan Chancellor <nathan@kernel.org>
Cc: nsc@kernel.org, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In v7.3-rc4, gen_compile_commands.py accepts -d as the build directory,
but reading an absolute modules.order path from another working directory
tries to open a listed .mod file relative to the process directory. The
archive path has the same behavior for .cmd files. A small fixture fails
with FileNotFoundError despite the files existing under -d.

Should these paths be resolved relative to -d? I have a patch and a
fixture for both input types, but have not tried this invocation against
a real kernel build.
