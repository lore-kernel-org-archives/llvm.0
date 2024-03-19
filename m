Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCDE3FB99
	for <llvm@lists.linux.dev>; Tue, 19 Mar 2024 21:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710883369; cv=none; b=F7cLVsXQy2aePuBndEglnbGQDUy7d7OTlW7gRw5BdwyYpSOxvOEv0AyJzbOOV7ZkXLrgELVh5Ig29NfR+CyI4mDBtCMdGCjKiQLEUZ8JBeYi9aM+XhDQEJ/mEJR+HOEGPQ8e407AK6OyeZpXyKyFFO+k7fg/USN7T9G9X/V6b0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710883369; c=relaxed/simple;
	bh=n2jzBsLQ0Wrm2lIftzl5WyhbTaPYcftIWZRzrou++fg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HS+4EqlS5mik5JFUxH1iccc13cIrDK/VyR6HUuAtcOg2LkVZ6c0PD5AtuIHHaXs7gM+84woIYSHewTR8wFhilmMe7jfHSju5apWH6YMfPfBFhdviSewAV/SgkJwbShDbS46WLQaw2saoJercVFO6ty5JRcjfy/ljmvou6CBIaDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=bjAgYeth; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="bjAgYeth"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-55a179f5fa1so6946099a12.0
        for <llvm@lists.linux.dev>; Tue, 19 Mar 2024 14:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1710883365; x=1711488165; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A3mbW0Axndl0DdAfMvicFiRl5fwsj7RLVMqVJZ+vdSI=;
        b=bjAgYethBX1z3xVNTDvtSYPEyboyvhGz0viGZuKBYcoVaa5R7bz/ibuI/vA3/sWqOP
         pYytTMRp8vNXB4Zng9vAUOinKKPxphp1jxjr3yx9XCDBG4MUHVPtCB/B5tEQN6P5Fssi
         /uVTBBMB+xEbiezxebjn7lbSKCsv1TgiOnHIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710883365; x=1711488165;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A3mbW0Axndl0DdAfMvicFiRl5fwsj7RLVMqVJZ+vdSI=;
        b=DGZbJAQLFq6mgtqRVGcj4KUXBRFPMEr/wq7IEywvsssedXYJwHvGS3h7N6LbfNdWgn
         AAHh1ngRr7329tXJL5YJ5ZaaWHqsIuNsaEnJPLlhwuuRMk7920tdukakg4Wu4lEo/RwH
         egQPCdGnH4dhHzizU8l5/uUi3tUIFYUx/jLooPqeHOO8pvgByWuAiP2wYaH8dokcgAvQ
         KRnUPYH4aT5xX0YuiNrntpHkPiL13GizMzs8AWWAkJQz+c7t6+T861vng/vg5KUJxLIN
         LYJnkHg9wCLMPfe1QKuYJdFBr0kbzSnC1Rr5IqQ0KuGuTxBRqJqVY+fsk1qrF1XL0Xgm
         5REA==
X-Forwarded-Encrypted: i=1; AJvYcCVEgxSNtpt1OX5wmanBiAPQ7+xtW9ta1UZDEPiln/kiuUQDbI0TfedjHo/Sjgk3Nb334XBOjqc0s0nyp7WrpKkZOBIp6A==
X-Gm-Message-State: AOJu0YztGlpVyR8Px4Fkxv54sbs40MxYunllKiiqB6Xpnh2EUYnGw7VH
	60tKYXuHrtijg8oTSAeIyn4pMULC7MrzOXfa5lX74FhbLcY+npwIb3fwNc0VYs5kEZ0sKFjSji9
	W6jh06w==
X-Google-Smtp-Source: AGHT+IGokY8Gk7DyHvcwKM8NEteCAVU3EEjwukNnMdBzHgeLwrntL8TyOyiXHvaUaOl36L1M43rOBg==
X-Received: by 2002:a05:6402:3715:b0:568:b498:ce49 with SMTP id ek21-20020a056402371500b00568b498ce49mr83984edb.3.1710883365357;
        Tue, 19 Mar 2024 14:22:45 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id c17-20020aa7c751000000b00568b43fffb0sm4907145eds.96.2024.03.19.14.22.44
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 14:22:44 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a45f257b81fso793946666b.0
        for <llvm@lists.linux.dev>; Tue, 19 Mar 2024 14:22:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUHcQTvO2UPPczNuqnpHwTpNFe81EliJvvaqbk4srP4TGUudnI+JLBSvM2ZvuSWq2GHkzILB1i41fyKQXsVryiIYkV5yw==
X-Received: by 2002:a17:906:f110:b0:a46:eab0:953b with SMTP id
 gv16-20020a170906f11000b00a46eab0953bmr60957ejb.23.1710883363785; Tue, 19 Mar
 2024 14:22:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240318113053.7f87ce7f@gandalf.local.home> <CAHk-=wjxX16kWd=uxG5wzqt=aXoYDf1BgWOKk+qVmAO0zh7sjA@mail.gmail.com>
 <20240319130653.0cfdaf6e@gandalf.local.home> <20240319131333.504c93fc@gandalf.local.home>
 <20240319210329.GA742040@dev-arch.thelio-3990X>
In-Reply-To: <20240319210329.GA742040@dev-arch.thelio-3990X>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 19 Mar 2024 14:22:27 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjJH_k5+h=3TOvLsGN-FOBNfLh_Ln_bZRLQV-oe9Gc5tw@mail.gmail.com>
Message-ID: <CAHk-=wjJH_k5+h=3TOvLsGN-FOBNfLh_Ln_bZRLQV-oe9Gc5tw@mail.gmail.com>
Subject: Re: [GIT PULL v2] tracing: Updates for v6.9
To: Nathan Chancellor <nathan@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Alison Schofield <alison.schofield@intel.com>, Beau Belgrave <beaub@linux.microsoft.com>, 
	Huang Yiwei <quic_hyiwei@quicinc.com>, John Garry <john.g.garry@oracle.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Thorsten Blum <thorsten.blum@toblux.com>, 
	Vincent Donnefort <vdonnefort@google.com>, linke li <lilinke99@qq.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 19 Mar 2024 at 14:03, Nathan Chancellor <nathan@kernel.org> wrote:
>
> For what it's worth, I applied that change and built ARCH=x86_64
> defconfig with LLVM 18.1.1 from [1] but it does not appear to help the
> instances of -Wstring-compare; in fact, it adds some additional warnings
> that I have not seen before. I have attached the full build log.

Hmm. I'm no longer seeing any problems with commit 24f5bb9f24ad
("tracing: Just use strcmp() for testing __string() and __assign_str()
match").

But that's clang 17.0.6.

The patch that Steven sent out (and that I applied) is a bit different
from his "I'll change it to this" email, though. A couple of casts and
parentheses different.

So maybe current -git works for you?

              Linus
