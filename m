Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC46B3AA1B4
	for <llvm@lists.linux.dev>; Tue, 24 Feb 2026 18:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771958050; cv=none; b=Si0cSGBvXo5XVgrLyYDVI/+dQUgCPXhzhytoZloYJk1rlD94Dl877JeXdriSsJFrKUa7O71PmhVg5b8VQFW6C+szN0AJiH0KYY+Zcm/OhCd9f21nUpcV3iG27AqVb40wSJR+FhJUMs2B05eDlASp7WQbrM57sR1PC7WScfyQtXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771958050; c=relaxed/simple;
	bh=J11iK2XwIj2+zXIcYCQZxiKQs/qMUnRO89klT0AGl1I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XaH/LcRJf/Er/skb42REP8s90LkXG9FfvcJwqk6mk3E+L7KE2efYhwo0NP1iGy7DuxgDhpIomQ9FFOul30Qvzci55QkiKpgtqElxBE983l/oeKK4d9Xr3XSTUhBwdx5njhM6ctU6A2NERMw5HQgoccLoEIor3BLgOZnPzQqJh38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MiCSnraq; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MiCSnraq"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2ba9a159437so5299770eec.0
        for <llvm@lists.linux.dev>; Tue, 24 Feb 2026 10:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771958048; x=1772562848; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QrjBvSrm8JFCEhJvVydTf7Q6kCsOJiDnm0ZLRH2yvhY=;
        b=MiCSnraqxVinNLuNugfL9HvI+cCC7J8jvZLI9hxvcKOeF3ElHAqyrtaUqJU2/WTxDl
         pK621JAMVy1Hjw6+K2yvCazZVT5iCgffZYdIRv7aEEDKP9W48U9lRvAeeZSidDyn0QLy
         6A1r55UGrjA6LFqsq+EG96gFY2/WUkcSf47jSpaNj1NgAGoStCwwfnO6SNfRHU0GTweh
         dUXG5SVVG1es2uuk/7SntWk5MJ1E8nnHwRNOgPRZp3LO5pk4Ev53Q2Z5aCG+PCKTrkng
         gdAzxxBAyERz7WWoB8bbXQcaDGYt073ieUNb4tAwkVcctDxox6U3gV5QpH4dNGUyDw3q
         5mPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771958048; x=1772562848;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QrjBvSrm8JFCEhJvVydTf7Q6kCsOJiDnm0ZLRH2yvhY=;
        b=qMrkz44BDZuauvHxi1FqLjwGFbrqK3csC6rZMMnqATUiPt3YPIkBY250/5hWojPxFI
         pmb4Dhr7JfeWULnOaIJ8B8/JjwZs+mSYF78WAA0Dfd8RpmoQLZJTLapo6lhwT5fzbEM7
         BAID/6oyL4m3oTrjYFz0wwzcGYrqJiZIVtYB0FUQMdc19p/1CyZIzIW/QlG9ZkJ2xY51
         pVgJ0GL6ZqRL0aMsEBRC+X4AqDIi5aiMTE1xCiHL33xGugcbpD466E4ttTetq4/T6DqH
         CxjPZFhZ2N4FNtPaH1UhNSmcyWRnCt0yF/915QcXHdcOsnDbGBHrvhZVlu/hRUKLwhtB
         tZ2Q==
X-Forwarded-Encrypted: i=1; AJvYcCX2/snOFjmyBY9xMTuC5i17DbxtVIGpQfyOdXubMQQZLqrUEZdiMet6YOQ//+eXDGc1hS/K@lists.linux.dev
X-Gm-Message-State: AOJu0YwPHZcyvbFn3uWNQlJQC0gD6pAblBtlYALTrCAPd8ZUK75ZGvM2
	GC+Uad+3eY60gNcSC2XHVZXobh143WfIRFVkeWGOU8YViXf0Tf5ZiaT0azFEcs5LtKG+1UhgIUX
	vXQyG9qauSWNv6QwfYg2TTAQ9rKHziA==
X-Received: from dycng10.prod.google.com ([2002:a05:7300:ce0a:b0:2ba:963b:54da])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:d718:b0:2ba:6ffe:450 with SMTP id 5a478bee46e88-2bd7bd3aa44mr4531030eec.33.1771958047807;
 Tue, 24 Feb 2026 10:34:07 -0800 (PST)
Date: Tue, 24 Feb 2026 18:34:06 +0000
In-Reply-To: <20251230183208.1317279-1-ihor.solodrai@linux.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251230183208.1317279-1-ihor.solodrai@linux.dev>
X-Mailer: b4 0.14.3
Message-ID: <177195804671.1905199.15508123005606240406.b4-ty@google.com>
Subject: Re: [PATCH] module: Fix kernel panic when a symbol st_shndx is out of bounds
From: Sami Tolvanen <samitolvanen@google.com>
To: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Tue, 30 Dec 2025 10:32:08 -0800, Ihor Solodrai wrote:
> The module loader doesn't check for bounds of the ELF section index in
> simplify_symbols():
> 
>        for (i = 1; i < symsec->sh_size / sizeof(Elf_Sym); i++) {
> 		const char *name = info->strtab + sym[i].st_name;
> 
> 		switch (sym[i].st_shndx) {
> 		case SHN_COMMON:
> 
> [...]

Applied to modules-next, thanks!

[1/1] module: Fix kernel panic when a symbol st_shndx is out of bounds
      commit: f9d69d5e7bde2295eb7488a56f094ac8f5383b92

Best regards,

	Sami


